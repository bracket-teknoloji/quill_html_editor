import "package:flutter/material.dart";
import "package:flutter_mobx/flutter_mobx.dart";
import "package:get/get.dart";
import "package:uuid/uuid.dart";

import "../../../../../../../../core/base/model/base_proje_model.dart";
import "../../../../../../../../core/base/model/seri_model.dart";
import "../../../../../../../../core/base/model/tahsilat_request_model.dart";
import "../../../../../../../../core/base/state/base_state.dart";
import "../../../../../../../../core/components/textfield/custom_text_field.dart";
import "../../../../../../../../core/components/wrap/appbar_title.dart";
import "../../../../../../../../core/constants/enum/cek_senet_listesi_enum.dart";
import "../../../../../../../../core/constants/extensions/date_time_extensions.dart";
import "../../../../../../../../core/constants/ui_helper/ui_helper.dart";
import "../../../../../../model/param_model.dart";
import "../../../../../cari/cari_listesi/model/cari_listesi_model.dart";
import "../../../../../cari/cari_listesi/model/cari_request_model.dart";
import "../../../../banka/banka_listesi/model/banka_listesi_model.dart";
import "../../../../banka/banka_listesi/model/banka_listesi_request_model.dart";
import "../../../cek_senet_listesi/model/cek_senet_listesi_model.dart";
import "../../../cek_senet_tahsilati/model/save_cek_senet_model.dart";
import "../view_model/odeme_dekontu_olustur_view_model.dart";

final class OdemeDekontuOlusturView extends StatefulWidget {
  const OdemeDekontuOlusturView({required this.model, super.key});
  final CekSenetListesiModel model;

  @override
  State<OdemeDekontuOlusturView> createState() => _OdemeDekontuOlusturViewState();
}

final class _OdemeDekontuOlusturViewState extends BaseState<OdemeDekontuOlusturView> {
  late final OdemeDekontuOlusturViewModel viewModel;
  CekSenetListesiModel get model => widget.model;
  late final TextEditingController _kayitTarihiController;
  late final TextEditingController _seriController;
  late final TextEditingController _teminatHesabiController;
  late final TextEditingController _odemeHesabiController;
  late final TextEditingController _projeController;
  late final TextEditingController _plasiyerController;
  late final TextEditingController _aciklamaController;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    viewModel = OdemeDekontuOlusturViewModel(model: TahsilatRequestModel.fromCekSenetListesiModel(model));
    viewModel.model.yeniKayit = true;
    viewModel.model.aciklama = "${model.belgeNo} ${model.cekSenetListesiEnum.dekontAciklama}";
    viewModel.model.tag = "DekontModel";
    viewModel.model.tarih = DateTime.now().dateTimeWithoutTime;
    viewModel.model.dekontIslemTuru = model.cekSenetListesiEnum.dekontIslemTuru;
    _kayitTarihiController = TextEditingController(text: viewModel.model.tarih.toDateString);
    _seriController = TextEditingController();
    _teminatHesabiController = TextEditingController(text: model.verilenAdi);
    _odemeHesabiController = TextEditingController();
    _projeController = TextEditingController(text: model.projeKodu);
    _plasiyerController = TextEditingController(text: model.plasiyerKodu);
    _aciklamaController = TextEditingController(text: viewModel.model.aciklama);
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      _plasiyerController.text =
          (await networkManager.getCariModel(
            CariRequestModel.fromCariListesiModel(CariListesiModel(cariKodu: model.cariKodu)),
          ))?.plasiyerAciklama ??
          "";
    });
    super.initState();
  }

  @override
  void dispose() {
    _kayitTarihiController.dispose();
    _seriController.dispose();
    _teminatHesabiController.dispose();
    _odemeHesabiController.dispose();
    _projeController.dispose();
    _plasiyerController.dispose();
    _aciklamaController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => BaseScaffold(
    appBar: AppBar(
      title: AppBarTitle(title: widget.model.cekSenetListesiEnum.dekontTitle, subtitle: model.belgeNo ?? ""),
      actions: [
        IconButton(
          onPressed: () async {
            if (_formKey.currentState?.validate() ?? false) {
              dialogManager.showAreYouSureDialog(
                onYes: () async {
                  viewModel.model.guid = const Uuid().v4();
                  final result = await viewModel.postData();
                  if (result.isSuccess) {
                    dialogManager.showSuccessSnackBar(result.message ?? "İşlem Başarılı");
                    Get.back(result: true);
                  }
                },
              );
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
          if (!widget.model.cekSenetListesiEnum.borcMu)
            CustomTextField(
              labelText: "Tahsil/Teminat Hesabı",
              controller: _teminatHesabiController,
              readOnly: true,
              valueWidget: Observer(builder: (_) => Text(model.verilenKodu ?? "")),
            ),
          CustomTextField(
            labelText: !widget.model.cekSenetListesiEnum.borcMu ? "Virman Hesap" : "Ödeme Hesabı",
            controller: _odemeHesabiController,
            readOnly: true,
            isMust: true,
            suffixMore: true,
            valueWidget: Observer(builder: (_) => Text(viewModel.model.hesapKodu ?? "")),
            onTap: setOdemeHesabi,
          ),
          if (yetkiController.projeUygulamasiAcikMi)
            CustomTextField(
              labelText: "Proje",
              controller: _projeController,
              readOnly: true,
              isMust: true,
              suffixMore: true,
              valueWidget: Observer(builder: (_) => Text(viewModel.model.projeKodu ?? "")),
              onTap: setProjeKodu,
            ),
          if (yetkiController.plasiyerUygulamasiAcikMi)
            CustomTextField(
              labelText: "Plasiyer",
              controller: _plasiyerController,
              readOnly: true,
              isMust: true,
              suffixMore: true,
              valueWidget: Observer(builder: (_) => Text(viewModel.model.plasiyerKodu ?? "")),
              onTap: setPlasiyerkodu,
            ),
          CustomTextField(labelText: "Açıklama", controller: _aciklamaController, onChanged: viewModel.setAciklama),
        ],
      ).paddingAll(UIHelper.lowSize),
    ),
  );

  Future<void> setTarih() async {
    final result = await dialogManager.showDateTimePicker(initialDate: viewModel.model.tarih);
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
    // final result = await bottomSheetDialogManager.showBankaHesaplariBottomSheetDialog(
    //   context,
    //   BankaListesiRequestModel(
    //     arrHesapTipi: "[0]",
    //     belgeTipi: viewModel.model.dekontIslemTuru,
    //     menuKodu: "YONE_BHRE",
    //   ),
    //   viewModel.model.hesapKodu,
    // );
    final result = await Get.toNamed(
      "/mainPage/bankaListesiOzel",
      arguments: BankaListesiRequestModel(
        arrHesapTipi: "[0]",
        belgeTipi: viewModel.model.dekontIslemTuru,
        menuKodu: "YONE_BHRE",
        bankaKodu: model.verilenBankaKodu,
      ),
    );
    if (result is BankaListesiModel) {
      viewModel.setOdemeHesabi(result.hesapKodu);
      _odemeHesabiController.text = result.hesapAdi ?? result.hesapKodu ?? "";
    }
  }

  Future<void> setProjeKodu() async {
    final result = await bottomSheetDialogManager.showProjeBottomSheetDialog(context, viewModel.model.projeKodu);
    if (result is BaseProjeModel) {
      viewModel.setProjeKodu(result.projeKodu);
      _projeController.text = result.projeAciklama ?? result.projeKodu ?? "";
    }
  }

  Future<void> setPlasiyerkodu() async {
    final result = await bottomSheetDialogManager.showPlasiyerBottomSheetDialog(context, viewModel.model.plasiyerKodu);
    if (result is PlasiyerList) {
      viewModel.setPlasiyerKodu(result.plasiyerKodu);
      _plasiyerController.text = result.plasiyerAlani ?? "";
    }
  }
}
