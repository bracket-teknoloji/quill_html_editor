import "package:flutter/material.dart";
import "package:flutter_mobx/flutter_mobx.dart";
import "package:get/get.dart";
import "package:picker/core/base/model/base_edit_model.dart";
import "package:picker/core/base/model/base_proje_model.dart";
import "package:picker/core/base/state/base_state.dart";
import "package:picker/core/base/view/stok_rehberi/model/stok_rehberi_request_model.dart";
import "package:picker/core/components/helper_widgets/custom_label_widget.dart";
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
import "package:picker/view/main_page/alt_sayfalar/stok/stok_liste/model/stok_listesi_model.dart";
import "package:picker/view/main_page/alt_sayfalar/uretim/is_emirleri/is_emri_edit/view_model/is_emri_edit_view_model.dart";
import "package:picker/view/main_page/alt_sayfalar/uretim/is_emirleri/is_emri_rehberi/model/is_emirleri_model.dart";
import "package:picker/view/main_page/model/param_model.dart";

final class IsEmriEditView extends StatefulWidget {
  final BaseEditModel<IsEmirleriModel> model;
  const IsEmriEditView({super.key, required this.model});

  @override
  State<IsEmriEditView> createState() => _IsEmriEditViewState();
}

final class _IsEmriEditViewState extends BaseState<IsEmriEditView> {
  final IsEmriEditViewModel viewModel = IsEmriEditViewModel();
  late final TextEditingController tarihController;
  late final TextEditingController teslimTarihiController;
  late final TextEditingController belgeNoController;
  late final TextEditingController stokKoduController;
  late final TextEditingController miktarController;
  late final TextEditingController projeController;
  late final TextEditingController girisDepoController;
  late final TextEditingController cikisDepoController;
  late final TextEditingController referansIsEmriController;
  late final TextEditingController siparisController;
  late final TextEditingController aciklamaController;
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();

  IsEmirleriModel? get model => widget.model.model;

  bool get isEnabled => !widget.model.baseEditEnum.goruntuleMi;

  bool get duzenleMi => widget.model.baseEditEnum == BaseEditEnum.duzenle;

  bool get ekleMi => widget.model.baseEditEnum == BaseEditEnum.ekle;

  @override
  void initState() {
    viewModel.setModel(model ?? IsEmirleriModel());
    if (ekleMi) {
      viewModel.setIslemKodu(1);
      viewModel.setTarih(DateTime.now());
      viewModel.setTeslimTarihi(DateTime.now());
    }
    if (duzenleMi) {
      viewModel.setIslemKodu(2);
    }
    tarihController = TextEditingController(text: viewModel.model?.tarih.toDateString);
    teslimTarihiController = TextEditingController(text: viewModel.model?.teslimTarihi.toDateString);
    belgeNoController = TextEditingController(text: viewModel.model?.isemriNo);
    stokKoduController = TextEditingController(text: viewModel.model?.stokKodu);
    miktarController = TextEditingController(text: viewModel.model?.miktar.commaSeparatedWithDecimalDigits(OndalikEnum.miktar));
    projeController = TextEditingController(text: viewModel.model?.projeKodu);
    girisDepoController = TextEditingController(text: viewModel.model?.girisDepoAdi);
    cikisDepoController = TextEditingController(text: viewModel.model?.cikisDepoAdi);
    referansIsEmriController = TextEditingController(text: viewModel.model?.refIsemrino);
    siparisController = TextEditingController(text: viewModel.model?.siparisNo);
    aciklamaController = TextEditingController(text: viewModel.model?.aciklama);
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      if (ekleMi) setBelgeNo();
    });
    super.initState();
  }

  @override
  void dispose() {
    tarihController.dispose();
    teslimTarihiController.dispose();
    belgeNoController.dispose();
    stokKoduController.dispose();
    miktarController.dispose();
    projeController.dispose();
    girisDepoController.dispose();
    cikisDepoController.dispose();
    referansIsEmriController.dispose();
    siparisController.dispose();
    aciklamaController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: AppBarTitle(
            title: "İş Emri Detay",
            subtitle: widget.model.baseEditEnum.getName,
          ),
          actions: [
            IconButton(
              onPressed: () {
                if (!formkey.currentState!.validate()) return;
                dialogManager.showAreYouSureDialog(() async {
                  final result = await viewModel.sendData();
                  if (result.isSuccess) {
                    Get.back(result: true);
                    dialogManager.showSuccessSnackBar(result.message ?? "${viewModel.model?.isemriNo} başarıyla kaydedildi.");
                  }
                });
              },
              icon: const Icon(Icons.save_outlined),
            ).yetkiVarMi(isEnabled),
          ],
        ),
        body: SingleChildScrollView(
          child: Form(
            key: formkey,
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: CustomTextField(
                        labelText: "Tarih",
                        controller: tarihController,
                        enabled: isEnabled,
                        isDateTime: true,
                        readOnly: true,
                        isMust: true,
                        onTap: () async {
                          final date = await dialogManager.showDateTimePicker(initialDate: viewModel.model?.tarih);
                          if (date is DateTime) {
                            viewModel.setTarih(date);
                            tarihController.text = date.toDateString;
                          }
                        },
                      ),
                    ),
                    Expanded(
                      child: CustomTextField(
                        labelText: "Teslim Tarihi",
                        controller: teslimTarihiController,
                        enabled: isEnabled,
                        readOnly: true,
                        isDateTime: true,
                        isMust: true,
                        onTap: () async {
                          final date = await dialogManager.showDateTimePicker(initialDate: viewModel.model?.teslimTarihi);
                          if (date is DateTime) {
                            viewModel.setTeslimTarihi(date);
                            teslimTarihiController.text = date.toDateString;
                          }
                        },
                      ),
                    ),
                  ],
                ),
                CustomTextField(
                  labelText: "Belge No",
                  controller: belgeNoController,
                  enabled: ekleMi,
                  isMust: true,
                  onChanged: viewModel.setBelgeNo,
                  suffix: IconButton(
                    icon: const Icon(Icons.qr_code_scanner_outlined),
                    onPressed: setBelgeNo,
                  ),
                  onTap: viewModel.getBelgeNo,
                ),
                CustomTextField(
                  labelText: "Stok Kodu",
                  controller: stokKoduController,
                  enabled: ekleMi,
                  isMust: true,
                  suffixMore: true,
                  readOnly: true,
                  valueWidget: Observer(builder: (_) => Text(viewModel.model?.stokAdi ?? "")),
                  onTap: () async {
                    final result = await Get.toNamed("mainPage/stokListesiOzel", arguments: StokBottomSheetModel(receteliStoklar: true, menuKodu: "STOK_SREH", okutuldu: true));
                    if (result is StokListesiModel) {
                      stokKoduController.text = result.stokKodu ?? "";
                      viewModel.setStok(result);
                    }
                  },
                  suffix: IconButton(
                    icon: const Icon(Icons.qr_code_scanner_outlined),
                    onPressed: () async {
                      final qr = await Get.toNamed("qr");
                      if (qr is String) {
                        stokKoduController.text = qr;
                        viewModel.setStok(await networkManager.getStokModel(StokRehberiRequestModel(stokKodu: qr)));
                      }
                    },
                  ),
                ).yetkiVarMi(yetkiController.stokListesi),
                Row(
                  children: [
                    Expanded(
                      child: CustomTextField(
                        labelText: "Miktar",
                        controller: miktarController,
                        enabled: isEnabled,
                        isMust: true,
                      ),
                    ),
                    Expanded(
                      child: CustomTextField(
                        labelText: "Proje",
                        controller: projeController,
                        enabled: isEnabled,
                        isMust: true,
                        suffixMore: true,
                        readOnly: true,
                        valueWidget: Observer(builder: (_) => Text(viewModel.model?.projeKodu ?? "")),
                        onTap: () async {
                          final result = await bottomSheetDialogManager.showProjeBottomSheetDialog(context, viewModel.model?.projeKodu);
                          if (result is BaseProjeModel) {
                            projeController.text = result.projeAciklama ?? "";
                            viewModel.setProje(result);
                          }
                        },
                      ),
                    ).yetkiVarMi(yetkiController.projeUygulamasiAcikMi),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: CustomTextField(
                        labelText: "Giriş Depo",
                        controller: girisDepoController,
                        enabled: isEnabled,
                        isMust: true,
                        suffixMore: true,
                        readOnly: true,
                        valueWidget: Observer(builder: (_) => Text(viewModel.model?.girisDepo.toStringIfNotNull ?? "")),
                        onTap: () async {
                          final result = await bottomSheetDialogManager.showDepoBottomSheetDialog(context, viewModel.model?.girisDepo);
                          if (result is DepoList) {
                            girisDepoController.text = result.depoTanimi ?? "";
                            viewModel.setGirisDepo(result);
                          }
                        },
                      ),
                    ),
                    Expanded(
                      child: CustomTextField(
                        labelText: "Çıkış Depo",
                        controller: cikisDepoController,
                        enabled: isEnabled,
                        isMust: true,
                        suffixMore: true,
                        readOnly: true,
                        valueWidget: Observer(builder: (_) => Text(viewModel.model?.cikisDepo.toStringIfNotNull ?? "")),
                        onTap: () async {
                          final result = await bottomSheetDialogManager.showDepoBottomSheetDialog(context, viewModel.model?.cikisDepo);
                          if (result is DepoList) {
                            cikisDepoController.text = result.depoTanimi ?? "";
                            viewModel.setCikisDepo(result);
                          }
                        },
                      ),
                    ),
                  ],
                ),
                CustomLayoutBuilder.divideInHalf(
                  children: [
                    CustomTextField(
                      labelText: "Referans İş Emri",
                      controller: referansIsEmriController,
                      enabled: isEnabled,
                      suffixMore: true,
                      readOnly: true,
                      onClear: () => viewModel.setReferansIsEmri(null),
                      onTap: () async {
                        final result = await Get.toNamed("mainPage/isEmriRehberiOzel");
                        if (result is IsEmirleriModel) {
                          referansIsEmriController.text = result.isemriNo.toString();
                          viewModel.setReferansIsEmri(result);
                        }
                      },
                    ),
                    CustomTextField(
                      labelText: "Sipariş",
                      controller: siparisController,
                      enabled: isEnabled,
                      suffixMore: true,
                    ).isKDebug(),
                  ].whereType<Widget>().toList(),
                ),
                CustomLayoutBuilder.divideInHalf(
                  children: [
                    Observer(
                      builder: (_) => CustomWidgetWithLabel(
                        text: "Kapalı",
                        isVertical: true,
                        child: Switch.adaptive(value: viewModel.model?.kapali == "E", onChanged: !isEnabled ? null : viewModel.setKapaliMi),
                      ),
                    ),
                    Observer(
                      builder: (_) => CustomWidgetWithLabel(
                        text: "Rework İş Emri",
                        isVertical: true,
                        child: Switch.adaptive(value: viewModel.model?.rework == "E", onChanged: !isEnabled ? null : viewModel.setReworkMu),
                      ),
                    ),
                  ],
                ),
                CustomTextField(
                  labelText: "Açıklama",
                  controller: aciklamaController,
                  enabled: isEnabled,
                  onChanged: viewModel.setAciklama,
                ),
              ],
            ).paddingAll(UIHelper.lowSize),
          ),
        ),
      );

  Future<void> setBelgeNo() async {
    await viewModel.getBelgeNo();
    belgeNoController.text = viewModel.model?.isemriNo ?? "";
  }
}
