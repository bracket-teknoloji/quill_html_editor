import "package:flutter/material.dart";
import "package:flutter_mobx/flutter_mobx.dart";
import "package:get/get.dart";
import "package:uuid/uuid.dart";

import "../../../../../../../../core/base/model/base_proje_model.dart";
import "../../../../../../../../core/base/state/base_state.dart";
import "../../../../../../../../core/components/textfield/custom_text_field.dart";
import "../../../../../../../../core/components/wrap/appbar_title.dart";
import "../../../../../../../../core/constants/enum/cirola_enum.dart";
import "../../../../../../../../core/constants/extensions/date_time_extensions.dart";
import "../../../../../../../../core/constants/ui_helper/ui_helper.dart";
import "../../../../../../model/param_model.dart";
import "../../../../../cari/cari_listesi/model/cari_listesi_model.dart";
import "../../../../banka/banka_listesi/model/banka_listesi_model.dart";
import "../../../../banka/banka_listesi/model/banka_listesi_request_model.dart";
import "../../../cek_senet_listesi/model/cek_senet_listesi_model.dart";
import "../view_model/hesaba_cirola_view_model.dart";

final class HesabaCirolaView extends StatefulWidget {
  const HesabaCirolaView({required this.model, required this.cirolaEnum, super.key});
  final CekSenetListesiModel model;
  final CirolaEnum cirolaEnum;

  @override
  State<HesabaCirolaView> createState() => _HesabaCirolaViewState();
}

final class _HesabaCirolaViewState extends BaseState<HesabaCirolaView> {
  HesabaCirolaViewModel viewModel = HesabaCirolaViewModel();
  CekSenetListesiModel get model => widget.model;
  late final TextEditingController _belgeNoController;
  late final TextEditingController _islemTarihiController;
  late final TextEditingController _cariController;
  late final TextEditingController _projeController;
  late final TextEditingController _plasiyerController;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    viewModel.model.belgeTipi = model.belgeTipi;
    viewModel.model.pickerTahsilatTuru = widget.cirolaEnum.belgeTipi;
    viewModel
      ..setBelgeNo(model.belgeNo)
      ..setIslemTarihi((model.tarih?.difference(DateTime.now()).inDays ?? 0) < 0 ? model.tarih : DateTime.now())
      ..setProjekodu(model.projeKodu)
      ..setPlasiyerKodu(model.plasiyerKodu);
    if (widget.cirolaEnum == CirolaEnum.cari) {
      viewModel.setCariKodu(CariListesiModel(cariAdi: model.cariAdi, cariKodu: model.cariKodu));
      _cariController = TextEditingController(text: model.cariAdi);
    } else {
      viewModel.setTahsilHesabi(model.verilenKodu);
      _cariController = TextEditingController(text: model.verilenAdi);
    }
    _belgeNoController = TextEditingController(text: model.belgeNo);
    _islemTarihiController = TextEditingController(text: (model.tarih?.difference(DateTime.now()).inDays ?? 0) < 0 ? model.tarih.toDateString : DateTime.now().toDateString);
    _projeController = TextEditingController(text: model.projeKodu);
    _plasiyerController = TextEditingController(text: model.plasiyerKodu ?? model.plasiyerKodu);
    super.initState();
  }

  @override
  void dispose() {
    _belgeNoController.dispose();
    _islemTarihiController.dispose();
    _cariController.dispose();
    _projeController.dispose();
    _plasiyerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => BaseScaffold(
        appBar: AppBar(
          title: AppBarTitle(
            title: widget.cirolaEnum.name,
            subtitle: model.belgeNo ?? "",
          ),
          actions: [
            IconButton(
              onPressed: () async {
                if (_formKey.currentState?.validate() ?? false) {
                  dialogManager.showAreYouSureDialog(() async {
                    viewModel.model.guid = const Uuid().v4();
                    final result = await viewModel.saveData();
                    if (result.isSuccess) {
                      Get.back(result: true);
                      dialogManager.showSuccessSnackBar(result.message ?? "İşlem başarılı");
                    }
                  });
                }
              },
              icon: const Icon(Icons.save_outlined),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                CustomTextField(
                  labelText: "Belge No",
                  controller: _belgeNoController,
                  readOnly: true,
                ),
                CustomTextField(
                  labelText: "İşlem Tarihi",
                  controller: _islemTarihiController,
                  isDateTime: true,
                  isMust: true,
                  readOnly: true,
                  onTap: setTarih,
                ),
                if (widget.cirolaEnum == CirolaEnum.cari)
                  CustomTextField(
                    labelText: "Cari",
                    controller: _cariController,
                    isMust: true,
                    readOnly: true,
                    suffixMore: true,
                    suffix: IconButton(onPressed: getCariIslemler, icon: const Icon(Icons.open_in_new_outlined, color: UIHelper.primaryColor)),
                    valueWidget: Observer(builder: (_) => Text(viewModel.model.verilenKodu ?? "")),
                    onTap: setCari,
                  ),
                if (widget.cirolaEnum == CirolaEnum.tahsil)
                  CustomTextField(
                    labelText: "Tahsil Hesabı",
                    controller: _cariController,
                    isMust: true,
                    readOnly: true,
                    suffixMore: true,
                    valueWidget: Observer(builder: (_) => Text(viewModel.model.verilenKodu ?? "")),
                    onTap: getTahsilHesabi,
                  ),
                if (yetkiController.projeUygulamasiAcikMi)
                  CustomTextField(
                    labelText: "Proje",
                    controller: _projeController,
                    isMust: true,
                    readOnly: true,
                    suffixMore: true,
                    valueWidget: Observer(builder: (_) => Text(viewModel.model.projeKodu ?? "")),
                    onTap: setProjekodu,
                  ),
                if (yetkiController.plasiyerUygulamasiAcikMi)
                  CustomTextField(
                    labelText: "Plasiyer",
                    controller: _plasiyerController,
                    isMust: true,
                    readOnly: true,
                    suffixMore: true,
                    valueWidget: Observer(builder: (_) => Text(viewModel.model.plasiyerKodu ?? "")),
                    onTap: setPlasiyerKodu,
                  ),
              ],
            ),
          ),
        ),
      );

  Future<void> setTarih() async {
    final result = await dialogManager.showDateTimePicker(initialDate: viewModel.model.tarih);
    if (result is DateTime) {
      _islemTarihiController.text = result.toDateString;
      viewModel.setIslemTarihi(result);
    }
  }

  Future<void> setCari() async {
    final result = await Get.toNamed("/mainPage/cariListesi", arguments: true);
    if (result is CariListesiModel) {
      _cariController.text = result.cariAdi ?? "";
      viewModel.setCariKodu(result);
    }
  }

  Future<void> getCariIslemler() async {
    if (viewModel.model.cariKodu != null) {
      dialogManager.showCariGridViewDialog(viewModel.cariListesiModel);
    } else {
      dialogManager.showInfoSnackBar("Cari seçiniz");
    }
  }

  Future<void> getTahsilHesabi() async {
    // final result = await bottomSheetDialogManager.showBankaHesaplariBottomSheetDialog(
    //   context,
    //   ,
    //   viewModel.model.verilenKodu,
    // );
    final result = await Get.toNamed(
      "/mainPage/bankaListesiOzel",
      arguments: BankaListesiRequestModel(
        arrHesapTipi: "[5]",
        belgeTipi: viewModel.model.pickerTahsilatTuru,
        menuKodu: "YONE_BHRE",
      ),
    );
    if (result is BankaListesiModel) {
      _cariController.text = result.bankaAdi ?? "";
      viewModel.setTahsilHesabi(result.hesapKodu);
    }
  }

  Future<void> setProjekodu() async {
    final result = await bottomSheetDialogManager.showProjeBottomSheetDialog(context, viewModel.model.projeKodu);
    if (result is BaseProjeModel) {
      _projeController.text = result.projeAciklama ?? "";
      viewModel.setProjekodu(result.projeKodu);
    }
  }

  Future<void> setPlasiyerKodu() async {
    final result = await bottomSheetDialogManager.showPlasiyerBottomSheetDialog(context, viewModel.model.plasiyerKodu);
    if (result is PlasiyerList) {
      _plasiyerController.text = result.plasiyerAciklama ?? "";
      viewModel.setPlasiyerKodu(result.plasiyerKodu);
    }
  }
}
