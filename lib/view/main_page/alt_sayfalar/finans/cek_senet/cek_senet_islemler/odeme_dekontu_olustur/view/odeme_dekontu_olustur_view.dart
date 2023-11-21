import "package:flutter/material.dart";
import "package:flutter_mobx/flutter_mobx.dart";
import "package:get/get.dart";
import "package:picker/core/base/model/base_proje_model.dart";
import "package:picker/core/base/model/seri_model.dart";
import "package:picker/core/base/model/tahsilat_request_model.dart";
import "package:picker/core/base/state/base_state.dart";
import "package:picker/core/components/textfield/custom_text_field.dart";
import "package:picker/core/components/wrap/appbar_title.dart";
import "package:picker/core/constants/enum/cek_senet_listesi_enum.dart";
import "package:picker/core/constants/extensions/date_time_extensions.dart";
import "package:picker/core/constants/extensions/widget_extensions.dart";
import "package:picker/core/constants/ui_helper/ui_helper.dart";
import "package:picker/view/main_page/alt_sayfalar/finans/banka/banka_listesi/model/banka_listesi_model.dart";
import "package:picker/view/main_page/alt_sayfalar/finans/banka/banka_listesi/model/banka_listesi_request_model.dart";
import "package:picker/view/main_page/alt_sayfalar/finans/cek_senet/cek_senet_islemler/odeme_dekontu_olustur/view_model/odeme_dekontu_olustur_view_model.dart";
import "package:picker/view/main_page/alt_sayfalar/finans/cek_senet/cek_senet_listesi/model/cek_senet_listesi_model.dart";
import "package:picker/view/main_page/alt_sayfalar/finans/cek_senet/cek_senet_tahsilati/model/save_cek_senet_model.dart";
import "package:picker/view/main_page/model/param_model.dart";
import "package:uuid/uuid.dart";

class OdemeDekontuOlusturView extends StatefulWidget {
  final CekSenetListesiModel model;
  const OdemeDekontuOlusturView({super.key, required this.model});

  @override
  State<OdemeDekontuOlusturView> createState() => _OdemeDekontuOlusturViewState();
}

class _OdemeDekontuOlusturViewState extends BaseState<OdemeDekontuOlusturView> {
  late final OdemeDekontuOlusturViewModel viewModel;
  CekSenetListesiModel get model => widget.model;
  late final TextEditingController _kayitTarihiController;
  late final TextEditingController _seriController;
  late final TextEditingController _odemeHesabiController;
  late final TextEditingController _projeController;
  late final TextEditingController _plasiyerController;
  late final TextEditingController _aciklamaController;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    viewModel = OdemeDekontuOlusturViewModel(model: TahsilatRequestModel.fromCekSenetListesiModel(model));
    viewModel.model.yeniKayit = true;
    viewModel.model.aciklama = viewModel.aciklama;
    viewModel.model.tag = "DekontModel";
    viewModel.model.dekontIslemTuru = model.cekSenetListesiEnum.cekMi ? "BCO" : "BSO";
    _kayitTarihiController = TextEditingController(text: model.tarih.toDateString);
    _seriController = TextEditingController();
    _odemeHesabiController = TextEditingController();
    _projeController = TextEditingController(text: model.projeKodu);
    _plasiyerController = TextEditingController(text: model.plasiyerKodu);
    _aciklamaController = TextEditingController(text: viewModel.aciklama);
    super.initState();
  }

  @override
  void dispose() {
    _kayitTarihiController.dispose();
    _seriController.dispose();
    _odemeHesabiController.dispose();
    _projeController.dispose();
    _plasiyerController.dispose();
    _aciklamaController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: AppBarTitle(
            title: "Senet Ödeme Dekontu",
            subtitle: model.belgeNo ?? "",
          ),
          actions: [
            IconButton(
              onPressed: () async {
                if (_formKey.currentState?.validate() ?? false) {
                  dialogManager.showAreYouSureDialog(() async {
                    viewModel.model.guid = const Uuid().v4();
                    final result = await viewModel.postData();
                    if (result.success ?? false) {
                      dialogManager.showSuccessSnackBar(result.message ?? "İşlem Başarılı");
                      Get.back(result: true);
                    }
                  });
                }
              },
              icon: const Icon(Icons.save_outlined),
            ),
          ],
        ),
        body: Form(
          key: _formKey,
          child: Column(
            children: [
              CustomTextField(
                labelText: "Kayıt Tarihi",
                controller: _kayitTarihiController,
                isDateTime: true,
                readOnly: true,
                isMust: true,
                onTap: setTarih,
              ),
              CustomTextField(
                labelText: "Seri",
                controller: _seriController,
                readOnly: true,
                isMust: true,
                suffixMore: true,
                valueWidget: Observer(builder: (_) => Text(viewModel.model.dekontSeri ?? "")),
                onTap: setSeri,
              ),
              CustomTextField(
                labelText: "Ödeme Hesabı",
                controller: _odemeHesabiController,
                readOnly: true,
                isMust: true,
                suffixMore: true,
                valueWidget: Observer(builder: (_) => Text(viewModel.model.hesapKodu ?? "")),
                onTap: setOdemeHesabi,
              ),
              CustomTextField(
                labelText: "Proje",
                controller: _projeController,
                readOnly: true,
                isMust: true,
                suffixMore: true,
                valueWidget: Observer(builder: (_) => Text(viewModel.model.projeKodu ?? "")),
                onTap: setProjeKodu,
              ).yetkiVarMi(yetkiController.projeUygulamasiAcikMi),
              CustomTextField(
                labelText: "Plasiyer",
                controller: _plasiyerController,
                readOnly: true,
                isMust: true,
                suffixMore: true,
                valueWidget: Observer(builder: (_) => Text(viewModel.model.plasiyerKodu ?? "")),
                onTap: setPlasiyerkodu,
              ).yetkiVarMi(yetkiController.plasiyerUygulamasiAcikMi),
              CustomTextField(
                labelText: "Açıklama",
                controller: _aciklamaController,
                onChanged: viewModel.setAciklama,
              ),
            ],
          ).paddingAll(UIHelper.lowSize),
        ),
      );

  Future<void> setTarih() async {
    final result = await dialogManager.showDateTimePicker();
    if (result is DateTime) {
      viewModel.setTarih(result);
      _kayitTarihiController.text = result.toDateString;
    }
  }

  Future<void> setSeri() async {
    final result = await bottomSheetDialogManager.showSeriKodBottomSheetDialog(context, viewModel.model.dekontSeri);
    if (result is SeriModel) {
      viewModel.setSerino(result.seriNo);
      _seriController.text = result.aciklama ?? "";
    }
  }

  Future<void> setOdemeHesabi() async {
    final result = await bottomSheetDialogManager.showBankaHesaplariBottomSheetDialog(
      context,
      BankaListesiRequestModel(
        arrHesapTipi: "[0]",
        belgeTipi: viewModel.model.dekontIslemTuru,
        menuKodu: "YONE_BHRE",
      ),
      viewModel.model.hesapKodu,
    );
    if (result is BankaListesiModel) {
      viewModel.setOdemeHesabi(result.hesapKodu);
      _odemeHesabiController.text = result.bankaAdi ?? "";
    }
  }

  Future<void> setProjeKodu() async {
    final result = await bottomSheetDialogManager.showProjeBottomSheetDialog(context, viewModel.model.projeKodu);
    if (result is BaseProjeModel) {
      viewModel.setProjeKodu(result.projeKodu);
      _projeController.text = result.projeAciklama ?? "";
    }
  }

  Future<void> setPlasiyerkodu() async {
    final result = await bottomSheetDialogManager.showPlasiyerBottomSheetDialog(context, viewModel.model.plasiyerKodu);
    if (result is PlasiyerList) {
      viewModel.setPlasiyerKodu(result.plasiyerKodu);
      _projeController.text = result.plasiyerAciklama ?? "";
    }
  }
}
