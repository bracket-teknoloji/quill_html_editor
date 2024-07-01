import "package:flutter/material.dart";
import "package:flutter_mobx/flutter_mobx.dart";
import "package:get/get.dart";
import "package:kartal/kartal.dart";
import "package:picker/core/base/model/base_edit_model.dart";
import "package:picker/core/base/model/base_proje_model.dart";
import "package:picker/core/base/model/base_stok_mixin.dart";
import "package:picker/core/base/state/base_state.dart";
import "package:picker/core/base/view/stok_rehberi/model/stok_rehberi_request_model.dart";
import "package:picker/core/components/layout/custom_layout_builder.dart";
import "package:picker/core/components/textfield/custom_text_field.dart";
import "package:picker/core/components/wrap/appbar_title.dart";
import "package:picker/core/constants/enum/base_edit_enum.dart";
import "package:picker/core/constants/extensions/date_time_extensions.dart";
import "package:picker/core/constants/extensions/number_extensions.dart";
import "package:picker/core/constants/extensions/widget_extensions.dart";
import "package:picker/core/constants/ondalik_utils.dart";
import "package:picker/core/constants/ui_helper/ui_helper.dart";
import "package:picker/view/main_page/alt_sayfalar/stok/stok_liste/model/stok_bottom_sheet_model.dart";
import "package:picker/view/main_page/alt_sayfalar/uretim/is_emirleri/is_emri_rehberi/model/is_emirleri_model.dart";
import "package:picker/view/main_page/alt_sayfalar/uretim/uretim_sonu_kaydi/uretim_sonu_kaydi_edit/view_model/uretim_sonu_kaydi_edit_view_model.dart";
import "package:picker/view/main_page/alt_sayfalar/uretim/uretim_sonu_kaydi/uretim_sonu_kaydi_listesi/model/uretim_sonu_kaydi_listesi_model.dart";

final class UretimSonuKaydiEditView extends StatefulWidget {
  final BaseEditModel<UretimSonuKaydiListesiModel> model;
  const UretimSonuKaydiEditView({super.key, required this.model});

  @override
  State<UretimSonuKaydiEditView> createState() => _UretimSonuKaydiEditViewState();
}

final class _UretimSonuKaydiEditViewState extends BaseState<UretimSonuKaydiEditView> {
  final UretimSonuKaydiEditViewModel viewModel = UretimSonuKaydiEditViewModel();
  late final TextEditingController belgeNoController;
  late final TextEditingController tarihController;
  late final TextEditingController isEmriController;
  late final TextEditingController depoOnceligiController;
  late final TextEditingController cikisDepoController;
  late final TextEditingController girisDepoController;
  late final TextEditingController projeController;
  late final TextEditingController mamulKoduController;
  late final TextEditingController olcuBirimiController;
  late final TextEditingController miktarController;
  late final TextEditingController hurdaFireMiktariController;
  late final TextEditingController maliyetFiyatiController;
  late final TextEditingController maliyetTutariController;
  late final TextEditingController aciklamaController;
  late final TextEditingController ekAlan1Controller;
  late final TextEditingController ekAlan2Controller;

  bool get ekleMi => widget.model.baseEditEnum.ekleMi;

  bool get isEnabled => !widget.model.baseEditEnum.goruntuleMi;

  UretimSonuKaydiListesiModel? get model => widget.model.model;

  @override
  void initState() {
    viewModel.setSelectedItem(model);
    belgeNoController = TextEditingController(text: model?.belgeNo ?? "");
    tarihController = TextEditingController(text: model?.tarih.toDateString ?? "");
    isEmriController = TextEditingController();
    depoOnceligiController = TextEditingController();
    cikisDepoController = TextEditingController();
    girisDepoController = TextEditingController();
    projeController = TextEditingController();
    mamulKoduController = TextEditingController();
    olcuBirimiController = TextEditingController();
    miktarController = TextEditingController(text: model?.miktar.commaSeparatedWithDecimalDigits(OndalikEnum.miktar) ?? "");
    hurdaFireMiktariController = TextEditingController();
    maliyetFiyatiController = TextEditingController();
    maliyetTutariController = TextEditingController();
    aciklamaController = TextEditingController();
    ekAlan1Controller = TextEditingController();
    ekAlan2Controller = TextEditingController();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await viewModel.getKalemler();
      await viewModel.getEkAlanlar();
      if (viewModel.model != null) {
        // depoOnceligiController.text = viewModel.model!..toString();
        cikisDepoController.text = viewModel.model!.cikisDepoAdi ?? "";
        mamulKoduController.text = viewModel.model!.stokKodu ?? "";
        // hurdaFireMiktariController.text = viewModel.model!.fire.commaSeparatedWithDecimalDigits(OndalikEnum.fiyat);
        maliyetFiyatiController.text = viewModel.model!.maliyetFiyati.commaSeparatedWithDecimalDigits(OndalikEnum.fiyat);
        maliyetTutariController.text = viewModel.model!.maliyetTutari.commaSeparatedWithDecimalDigits(OndalikEnum.fiyat);
        ekAlan1Controller.text = viewModel.model!.ekalan1 ?? "";
        ekAlan2Controller.text = viewModel.model!.ekalan2 ?? "";
        aciklamaController.text = viewModel.model!.aciklama ?? "";
        girisDepoController.text = viewModel.model!.girisDepoAdi ?? "";
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    belgeNoController.dispose();
    tarihController.dispose();
    isEmriController.dispose();
    depoOnceligiController.dispose();
    cikisDepoController.dispose();
    girisDepoController.dispose();
    projeController.dispose();
    mamulKoduController.dispose();
    olcuBirimiController.dispose();
    miktarController.dispose();
    hurdaFireMiktariController.dispose();
    maliyetFiyatiController.dispose();
    maliyetTutariController.dispose();
    aciklamaController.dispose();
    ekAlan1Controller.dispose();
    ekAlan2Controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: AppBarTitle(
            title: "Üretim Sonu Kaydı",
            subtitle: widget.model.baseEditEnum?.getName,
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              CustomTextField(
                labelText: "Belge No",
                enabled: isEnabled,
                controller: belgeNoController,
                isMust: true,
                onChanged: viewModel.setBelgeNo,
                suffix: IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: () async {
                    final result = await viewModel.getSiradakiKod(belgeNoController.text);
                    if (result is String) {
                      belgeNoController.text = result;
                      viewModel.setBelgeNo(result);
                    }
                  },
                ),
              ),
              CustomTextField.dateTime(
                labelText: "Tarih",
                controller: tarihController,
                enabled: isEnabled,
                isMust: true,
                readOnly: true,
                onDateChange: (date) {
                  if (date is! DateTime) return;
                  tarihController.text = date.toDateString;
                  viewModel.setTarih(date);
                },
              ),
              CustomTextField(
                labelText: "İş Emri",
                enabled: isEnabled,
                controller: isEmriController,
                suffixMore: true,
                readOnly: true,
                onTap: () async {
                  final result = await Get.toNamed("/mainPage/isEmriRehberiOzel");
                  if (result is IsEmirleriModel) {
                    // viewModel.changeIsEmri(result);
                    isEmriController.text = result.isemriNo ?? "";
                  }
                },
              ),
              CustomLayoutBuilder(
                splitCount: 2,
                children: [
                  CustomTextField(
                    labelText: "Depo Önceliği",
                    enabled: isEnabled,
                    controller: depoOnceligiController,
                    onChanged: (value) {},
                  ),
                  CustomTextField(
                    labelText: "Çıkış Depo",
                    enabled: isEnabled,
                    controller: cikisDepoController,
                    isMust: true,
                    suffixMore: true,
                    readOnly: true,
                    valueWidget: Observer(builder: (_) => Text(viewModel.model?.cikisdepoKodu.toStringIfNotNull ?? "")),
                    onChanged: (value) {},
                  ),
                ],
              ),
              CustomLayoutBuilder(
                splitCount: 2,
                children: [
                  CustomTextField(
                    labelText: "Giriş Depo",
                    enabled: isEnabled,
                    controller: girisDepoController,
                    isMust: true,
                    suffixMore: true,
                    readOnly: true,
                    valueWidget: Observer(builder: (_) => Text(viewModel.model?.girisdepoKodu.toStringIfNotNull ?? "")),
                    onChanged: (value) {},
                  ),
                  CustomTextField(
                    labelText: "Proje",
                    enabled: isEnabled,
                    controller: projeController,
                    isMust: true,
                    suffixMore: true,
                    readOnly: true,
                    //TODO Projeyi ekle
                    // valueWidget: Observer(builder: (_) => Text(viewModel.model?.girisdepoKodu.toStringIfNotNull ?? "")),
                    onTap: () async {
                      final item = await bottomSheetDialogManager.showProjeBottomSheetDialog(context, viewModel.model);
                      if (item is BaseProjeModel) {
                        viewModel.setProje(item);
                        projeController.text = item.projeAciklama ?? "";
                      }
                    },
                  ),
                ],
              ),
              CustomTextField(
                labelText: "Mamul Kodu",
                enabled: isEnabled,
                controller: mamulKoduController,
                isMust: true,
                suffixMore: true,
                readOnly: true,
                valueWidget: Observer(builder: (_) => Text(viewModel.model?.stokAdi ?? "")),
                suffix: IconButton(
                  onPressed: () async {
                    if (viewModel.model?.stokKodu == null) {
                      return dialogManager.showAlertDialog("Önce stok seçiniz.");
                    }
                    dialogManager.showStokGridViewDialog(await networkManager.getStokModel(StokRehberiRequestModel(stokKodu: viewModel.model?.stokKodu)));
                  },
                  icon: const Icon(Icons.open_in_new_outlined, color: UIHelper.primaryColor),
                ),
                onTap: () async {
                  final result = await Get.toNamed("mainPage/stokListesiOzel", arguments: StokBottomSheetModel(receteliStoklar: true, menuKodu: "STOK_SREH", okutuldu: true));
                  if (result is BaseStokMixin) {
                    mamulKoduController.text = result.stokKodu ?? "";
                    viewModel.setMamulKodu(result);
                  }
                },
              ),
              CustomLayoutBuilder(
                splitCount: 2,
                children: [
                  CustomTextField(
                    labelText: "Ölçü Birimi",
                    enabled: isEnabled,
                    controller: olcuBirimiController,
                    suffixMore: true,
                    readOnly: true,
                    onChanged: (value) {},
                  ),
                  CustomTextField(
                    labelText: "Miktar",
                    enabled: isEnabled,
                    controller: miktarController,
                    isMust: true,
                    isFormattedString: true,
                    onChanged: (value) {},
                  ),
                ],
              ),
              CustomTextField(
                labelText: "Hurda/Fire Miktarı",
                enabled: isEnabled,
                controller: hurdaFireMiktariController,
                isFormattedString: true,
                keyboardType: const TextInputType.numberWithOptions(decimal: true),
                onChanged: (value) {},
              ),
              CustomLayoutBuilder(
                splitCount: 2,
                children: [
                  CustomTextField(
                    labelText: "Maliyet Fiyatı",
                    enabled: isEnabled,
                    controller: maliyetFiyatiController,
                    isFormattedString: true,
                    keyboardType: const TextInputType.numberWithOptions(decimal: true),
                    onChanged: (value) {},
                  ),
                  CustomTextField(
                    labelText: "Maliyet Tutarı",
                    enabled: isEnabled,
                    controller: maliyetTutariController,
                    isFormattedString: true,
                    keyboardType: const TextInputType.numberWithOptions(decimal: true),
                    onChanged: (value) {},
                  ),
                ],
              ),
              CustomTextField(
                labelText: "Açıklama",
                enabled: isEnabled,
                controller: aciklamaController,
                onChanged: (value) {},
              ),
              CustomTextField(
                labelText: "Ek Alan 1",
                enabled: isEnabled,
                controller: ekAlan1Controller,
                onChanged: (value) {},
              ),
              CustomTextField(
                labelText: "Ek Alan 2",
                enabled: isEnabled,
                controller: ekAlan2Controller,
                onChanged: (value) {},
              ),
              Observer(
                builder: (_) => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Ek Alanlar").paddingOnly(left: UIHelper.lowSize),
                    ...List.generate(
                      viewModel.ekAlanlarList?.length ?? 0,
                      (index) {
                        final item = viewModel.ekAlanlarList?[index];
                        return CustomTextField(
                          labelText: "${item?.alanAciklama}",
                          enabled: isEnabled,
                          suffixMore: item?.secimListesi?.isNotEmpty,
                          isMust: item?.zorunlu == "E",
                          maxLength: item?.uzunluk,
                        );
                      },
                    ),
                  ],
                ).yetkiVarMi(viewModel.ekAlanlarList.ext.isNotNullOrEmpty),
              ),
            ],
          ).paddingAll(UIHelper.lowSize),
        ),
      );
}
