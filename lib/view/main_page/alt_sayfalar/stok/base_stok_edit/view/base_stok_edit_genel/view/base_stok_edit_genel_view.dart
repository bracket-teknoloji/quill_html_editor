// ignore_for_file: use_build_context_synchronously

import "dart:convert";

import "package:flutter/foundation.dart";
import "package:flutter/material.dart";
import "package:flutter_image_compress/flutter_image_compress.dart";
import "package:flutter_mobx/flutter_mobx.dart";
import "package:get/get.dart";
import "package:image_picker/image_picker.dart";
import "package:kartal/kartal.dart";
import "package:picker/core/constants/enum/grup_kodu_enums.dart";
import "package:picker/core/constants/ondalik_utils.dart";

import "../../../../../../../../core/base/model/base_edit_siradaki_kod_model.dart";
import "../../../../../../../../core/base/model/base_grup_kodu_model.dart";
import "../../../../../../../../core/base/model/generic_response_model.dart";
import "../../../../../../../../core/base/state/base_state.dart";
import "../../../../../../../../core/components/dialog/bottom_sheet/model/bottom_sheet_model.dart";
import "../../../../../../../../core/components/helper_widgets/custom_label_widget.dart";
import "../../../../../../../../core/components/textfield/custom_text_field.dart";
import "../../../../../../../../core/constants/enum/base_edit_enum.dart";
import "../../../../../../../../core/constants/extensions/number_extensions.dart";
import "../../../../../../../../core/constants/static_variables/static_variables.dart";
import "../../../../../../../../core/constants/ui_helper/ui_helper.dart";
import "../../../../../../../../core/init/cache/cache_manager.dart";
import "../../../../../../../../core/init/network/login/api_urls.dart";
import "../../../../../../../auth/model/isletme_model.dart";
import "../../../../stok_liste/model/stok_listesi_model.dart";
import "../../../model/stok_muhasebe_kodu_model.dart";
import "../../../model/stok_olcu_birimleri_model.dart";
import "../view_model/base_stok_edit_genel_view_model.dart";

final class BaseStokEditGenelView extends StatefulWidget {
  const BaseStokEditGenelView({super.key, this.model});
  final BaseEditEnum? model;

  @override
  State<BaseStokEditGenelView> createState() => _BaseStokEditGenelViewState();
}

final class _BaseStokEditGenelViewState extends BaseState<BaseStokEditGenelView> {
  // StokListesiModel? get widgetModel => StokListesiModel.instance
  Map veriTabani = CacheManager.getVeriTabani;
  List<IsletmeModel> subeList = [];
  final BaseStokEditGenelViewModel viewModel = BaseStokEditGenelViewModel();
  late final TextEditingController stokKoduController;
  late final TextEditingController stokAdiController;
  late final TextEditingController depoController;
  late final TextEditingController muhasebeDetayKoduController;
  late final TextEditingController olcuBirimi1Controller;
  late final TextEditingController olcuBirimi2Controller;
  late final TextEditingController olcuBirimi2PayController;
  late final TextEditingController olcuBirimi2PaydaController;
  late final TextEditingController olcuBirimi3Controller;
  late final TextEditingController olcuBirimi3PayController;
  late final TextEditingController olcuBirimi3PaydaController;
  late final TextEditingController barkod1Controller;
  late final TextEditingController barkod2Controller;
  late final TextEditingController barkod3Controller;
  late final TextEditingController subeController;
  late final TextEditingController ureticiKoduController;
  late final TextEditingController grupKoduController;
  late final TextEditingController kod1Controller;
  late final TextEditingController kod2Controller;
  late final TextEditingController kod3Controller;
  late final TextEditingController kod4Controller;
  late final TextEditingController kod5Controller;
  List<StokOlcuBirimleriModel>? olcuBirimleriList;
  bool get enable => widget.model != BaseEditEnum.goruntule;

  StokListesiModel get stokModel => viewModel.stokListesiModel;

  @override
  void initState() {
    stokKoduController = TextEditingController(text: stokModel.stokKodu);
    stokAdiController = TextEditingController(text: stokModel.stokAdi);
    depoController = TextEditingController(
      text:
          CacheManager.getAnaVeri?.paramModel?.depoList
              ?.firstWhereOrNull((element) => element.depoKodu == (stokModel.depoKodu))
              ?.depoTanimi ??
          "",
    );
    muhasebeDetayKoduController = TextEditingController(text: stokModel.muhdetayAdi);
    olcuBirimi1Controller = TextEditingController(text: stokModel.olcuBirimi);
    olcuBirimi2Controller = TextEditingController(text: stokModel.olcuBirimi2);
    olcuBirimi2PayController = TextEditingController(
      text: stokModel.olcuBirimi2Pay.commaSeparatedWithDecimalDigits(OndalikEnum.maxOndalik),
    );
    olcuBirimi2PaydaController = TextEditingController(
      text: stokModel.olcuBirimi2Payda.commaSeparatedWithDecimalDigits(OndalikEnum.maxOndalik),
    );
    olcuBirimi3Controller = TextEditingController(text: stokModel.olcuBirimi3);
    olcuBirimi3PayController = TextEditingController(
      text: stokModel.olcuBirimi3Pay.commaSeparatedWithDecimalDigits(OndalikEnum.maxOndalik),
    );
    olcuBirimi3PaydaController = TextEditingController(
      text: stokModel.olcuBirimi3Payda.commaSeparatedWithDecimalDigits(OndalikEnum.maxOndalik),
    );
    barkod1Controller = TextEditingController(text: stokModel.barkod1);
    barkod2Controller = TextEditingController(text: stokModel.barkod2);
    barkod3Controller = TextEditingController(text: stokModel.barkod3);
    subeController = TextEditingController(
      text:
          subeList.ext.isNotNullOrEmpty
              ? subeList.where((element) => element.subeKodu == stokModel.subeKodu).firstOrNull?.subeAdi
              : null,
    ); //text: model?.stokAdi
    ureticiKoduController = TextEditingController(text: stokModel.ureticiKodu); //text: model?.stokAdi
    grupKoduController = TextEditingController(text: stokModel.grupKodu);
    kod1Controller = TextEditingController(text: stokModel.kod1);
    kod2Controller = TextEditingController(text: stokModel.kod2);
    kod3Controller = TextEditingController(text: stokModel.kod3);
    kod4Controller = TextEditingController(text: stokModel.kod4);
    kod5Controller = TextEditingController(text: stokModel.kod5);
    if (subeController.text == "") {
      subeController.text = "Şubelerde Ortak";
      stokModel.subeKodu = -1;
    }
    subeChecker();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      if (widget.model == BaseEditEnum.ekle || widget.model == BaseEditEnum.kopyala) {
        if (stokModel.stokKodu == null) {
          stokKoduController.text = await getSiradakiKod(kod: stokKoduController.text, isOnBuild: true) ?? "";
          stokModel.stokKodu = stokKoduController.text;
        }
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    stokKoduController.dispose();
    stokAdiController.dispose();
    depoController.dispose();
    muhasebeDetayKoduController.dispose();
    olcuBirimi1Controller.dispose();
    olcuBirimi2Controller.dispose();
    olcuBirimi2PayController.dispose();
    olcuBirimi2PaydaController.dispose();
    olcuBirimi3Controller.dispose();
    olcuBirimi3PayController.dispose();
    olcuBirimi3PaydaController.dispose();
    barkod1Controller.dispose();
    barkod2Controller.dispose();
    barkod3Controller.dispose();
    subeController.dispose();
    ureticiKoduController.dispose();
    grupKoduController.dispose();
    kod1Controller.dispose();
    kod2Controller.dispose();
    kod3Controller.dispose();
    kod4Controller.dispose();
    kod5Controller.dispose();
  }

  @override
  Widget build(BuildContext context) => Form(
    key: StaticVariables.instance.stokKartiGenelFormKey,
    child: SingleChildScrollView(
      child: Column(
        children: [
          IntrinsicHeight(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                if (stokModel.resimBase64 != null || widget.model.ekleMi)
                  Expanded(
                    child: Observer(
                      builder:
                          (_) => InkWell(
                            child:
                                stokModel.resimBase64 != null
                                    ? SizedBox(
                                      height: kTextTabBarHeight,
                                      child: Image.memory(
                                        base64Decode(stokModel.resimBase64 ?? ""),
                                        fit: BoxFit.fitHeight,
                                      ).paddingAll(UIHelper.lowSize),
                                    )
                                    : const Center(child: Icon(Icons.add)),
                            onTap: () async {
                              final sourceType = await bottomSheetDialogManager.showBottomSheetDialog(
                                context,
                                title: "Kaynak tipi",
                                children: [
                                  BottomSheetModel(
                                    title: "Galeri",
                                    iconWidget: Icons.photo_library_outlined,
                                    value: ImageSource.gallery,
                                  ),
                                  BottomSheetModel(
                                    title: "Kamera",
                                    iconWidget: Icons.camera_alt_outlined,
                                    value: ImageSource.camera,
                                  ),
                                  if (stokModel.resimBase64 != null)
                                    BottomSheetModel(
                                      title: "Fotoğrafı Kaldır",
                                      iconWidget: Icons.delete_forever_outlined,
                                      value: "",
                                    ),
                                ],
                              );
                              if (sourceType is ImageSource) {
                                viewModel.setImage(await imageCompresser(sourceType));
                              } else if (sourceType == "") {
                                dialogManager.showAreYouSureDialog(
                                  onYes: () {
                                    viewModel.setImage(null);
                                  },
                                );
                              }
                            },
                          ),
                    ),
                  ),
                Expanded(
                  flex: 4,
                  child: CustomTextField(
                    enabled: enable && (widget.model == BaseEditEnum.ekle || widget.model == BaseEditEnum.kopyala),
                    labelText: "Kodu",
                    isMust: true,
                    controller: stokKoduController,
                    onChanged: (value) {
                      stokModel.stokKodu = value;
                    },
                    suffix: Wrap(
                      children:
                          [
                            IconButton(
                              onPressed:
                                  () async => await bottomSheetDialogManager.showBottomSheetDialog(
                                    context,
                                    title: loc.generalStrings.options,
                                    children: [
                                      BottomSheetModel(
                                        title: "Kodu Rehberden Seç",
                                        iconWidget: Icons.list_alt_outlined,
                                        onTap: () async {
                                          Get.back();
                                          final result = await Get.toNamed("/mainPage/stokListesiOzel");
                                          if (result != null) {
                                            stokKoduController.text = result.stokKodu;
                                            stokModel.stokKodu = stokKoduController.text;
                                          }
                                        },
                                      ),
                                      BottomSheetModel(
                                        title: "${stokKoduController.text} ile Başlayan Son Kodu Getir",
                                        iconWidget: Icons.add,
                                        onTap: () async {
                                          Get.back();
                                          stokKoduController.text =
                                              await getSiradakiKod(
                                                kod: stokKoduController.text,
                                                isOnBuild: true,
                                                sonKoduGetir: true,
                                              ) ??
                                              "";
                                          stokModel.stokKodu = stokKoduController.text;
                                        },
                                      ),
                                    ],
                                  ),
                              icon: const Icon(Icons.more_horiz_outlined),
                            ),
                            IconButton(
                              onPressed: () async {
                                stokKoduController.text =
                                    await getSiradakiKod(kod: stokKoduController.text, isOnBuild: true) ?? "";
                                stokModel.stokKodu = stokKoduController.text;
                              },
                              icon: const Icon(Icons.add),
                            ),
                          ].map((e) => SizedBox(width: 35, child: e)).toList(),
                    ),
                  ),
                ),
              ],
            ),
          ),
          CustomTextField(
            enabled: enable,
            labelText: "Adı",
            controller: stokAdiController,
            onChanged: (p0) => stokModel.stokAdi = p0,
          ),
          CustomTextField(
            labelText: "Depo",
            enabled: enable,
            readOnly: true,
            valueWidget: Observer(builder: (_) => Text(stokModel.depoKodu.toStringIfNotNull ?? "")),
            onClear: () => viewModel.setDepoKodu(null),
            onTap: () async {
              final result = await bottomSheetDialogManager.showDepoBottomSheetDialog(context, 4);
              if (result != null) {
                depoController.text = result.depoTanimi ?? "";
                viewModel.setDepoKodu(result.depoKodu);
              }
            },
            suffixMore: true,
            controller: depoController,
          ),
          CustomTextField(
            enabled: enable,
            readOnly: true,
            labelText: "Muhasebe Detay Kodu",
            controller: muhasebeDetayKoduController,
            valueWidget: Observer(builder: (_) => Text(stokModel.muhdetayKodu.toStringIfNotNull ?? "")),
            suffixMore: true,
            onTap: () async {
              final StokMuhasebeKoduModel? result = await bottomSheetDialogManager.showMuhasebeKoduBottomSheetDialog(
                context,
                groupValue: stokModel.muhdetayKodu.toStringIfNotNull,
                stokMu: true,
              );
              if (result != null) {
                muhasebeDetayKoduController.text = result.adi ?? result.muhKodu.toStringIfNotNull ?? "";
                viewModel.setMuhasebeKodu(result);
              }
            },
          ),
          CustomTextField(
            labelText: "Ölçü Birimi 1",
            enabled: enable,
            // suffixMore: true,
            onChanged: (p0) => stokModel.olcuBirimi = p0,

            // onTap: () => baseOlcuBirimleriController(controller: 1),
            onClear: () => stokModel.olcuBirimi = null,
            controller: olcuBirimi1Controller,
            suffix: IconButton(
              onPressed: () => baseOlcuBirimleriController(controller: 1),
              icon: const Icon(Icons.more_horiz_outlined),
            ),
          ),
          CustomTextField(
            labelText: "Ölçü Birimi 2",
            enabled: enable,
            // suffixMore: true,
            onClear: () => stokModel.olcuBirimi2 = null,
            onChanged: (p0) => viewModel.stokListesiModel.olcuBirimi2 = p0,
            suffix: IconButton(
              onPressed: () => baseOlcuBirimleriController(controller: 2),
              icon: const Icon(Icons.more_horiz_outlined),
            ),

            controller: olcuBirimi2Controller,
          ),
          Row(
            children: [
              Expanded(
                child: CustomTextField(
                  enabled: enable,
                  keyboardType: const TextInputType.numberWithOptions(decimal: true),
                  labelText: "Ölçü Br.2 Pay",
                  isFormattedString: true,
                  controller: olcuBirimi2PayController,
                  onChanged: (p0) => stokModel.olcuBirimi2Pay = p0.toDoubleWithFormattedString,
                ),
              ),
              Expanded(
                child: CustomTextField(
                  enabled: enable,
                  keyboardType: const TextInputType.numberWithOptions(decimal: true),
                  labelText: "Ölçü Br.2 Payda",
                  isFormattedString: true,
                  controller: olcuBirimi2PaydaController,
                  onChanged: (p0) => stokModel.olcuBirimi2Payda = p0.toDoubleWithFormattedString,
                ),
              ),
            ],
          ),
          CustomTextField(
            labelText: "Ölçü Birimi 3",
            enabled: enable,
            // suffixMore: true,
            onClear: () => stokModel.olcuBirimi3 = null,
            onChanged: (p0) => viewModel.stokListesiModel.olcuBirimi3 = p0,
            // onTap: () {
            //   baseOlcuBirimleriController(controller: 3);
            // },
            suffix: IconButton(
              onPressed: () => baseOlcuBirimleriController(controller: 3),
              icon: const Icon(Icons.more_horiz_outlined),
            ),

            controller: olcuBirimi3Controller,
          ),
          Row(
            children: [
              Expanded(
                child: CustomTextField(
                  enabled: enable,
                  keyboardType: const TextInputType.numberWithOptions(decimal: true),
                  labelText: "Ölçü Br.3 Pay",
                  isFormattedString: true,
                  controller: olcuBirimi3PayController,
                  onChanged: (p0) => stokModel.olcuBirimi3Pay = p0.toDoubleWithFormattedString,
                ),
              ),
              Expanded(
                child: CustomTextField(
                  enabled: enable,
                  keyboardType: const TextInputType.numberWithOptions(decimal: true),
                  labelText: "Ölçü Br.3 Payda",
                  isFormattedString: true,
                  controller: olcuBirimi3PaydaController,
                  onChanged: (p0) => stokModel.olcuBirimi3Payda = p0.toDoubleWithFormattedString,
                ),
              ),
            ],
          ),
          CustomWidgetWithLabel(
            text: "Barkod",
            child: Wrap(
              children: [
                CustomTextField(
                  enabled: enable,
                  labelText: "Barkod 1",
                  maxLength: 35,
                  controller: barkod1Controller,
                  onChanged: (value) => stokModel.barkod1 = value,
                  suffix: Wrap(
                    children: [
                      IconButton(
                        onPressed: () {
                          baseBarkodUretController(controller: 1);
                        },
                        icon: const Icon(Icons.add),
                      ),
                      IconButton(
                        onPressed: () async {
                          final result = await Get.toNamed("qr");
                          if (result case ("" || null)) return;
                          barkod1Controller.text = result;
                          stokModel.barkod1 = result;
                        },
                        icon: const Icon(Icons.qr_code_scanner),
                      ),
                    ],
                  ),
                ),
                CustomTextField(
                  enabled: enable,
                  labelText: "Barkod 2",
                  controller: barkod2Controller,
                  maxLength: 35,
                  onChanged: (value) => stokModel.barkod2 = value,
                  suffix: Wrap(
                    children: [
                      IconButton(
                        onPressed: () {
                          baseBarkodUretController(controller: 2);
                        },
                        icon: const Icon(Icons.add),
                      ),
                      IconButton(
                        onPressed: () async {
                          final result = await Get.toNamed("qr");
                          if (result case ("" || null)) return;
                          barkod2Controller.text = result;
                          stokModel.barkod2 = result;
                        },
                        icon: const Icon(Icons.qr_code_scanner),
                      ),
                    ],
                  ),
                ),
                CustomTextField(
                  enabled: enable,
                  labelText: "Barkod 3",
                  controller: barkod3Controller,
                  maxLength: 35,
                  onChanged: (value) => stokModel.barkod3 = value,
                  suffix: Wrap(
                    children: [
                      IconButton(
                        onPressed: () {
                          baseBarkodUretController(controller: 3);
                        },
                        icon: const Icon(Icons.add),
                      ),
                      IconButton(
                        onPressed: () async {
                          final result = await Get.toNamed("qr");
                          if (result case ("" || null)) return;
                          barkod3Controller.text = result;
                          stokModel.barkod3 = result;
                        },
                        icon: const Icon(Icons.qr_code_scanner),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          CustomWidgetWithLabel(
            text: loc.generalStrings.other,
            child: CustomTextField(
              // valueText: stokModel?.subeKodu.toStringIfNotNull,
              readOnly: true,
              enabled:
                  (enable &&
                      subeList.firstWhereOrNull((element) => element.subeKodu == veriTabani["Şube"])?.merkezmi ==
                          "E") ||
                  widget.model == BaseEditEnum.ekle,
              labelText: "Şube",
              isMust: true,
              controller: subeController,
              valueWidget: Observer(builder: (_) => Text(stokModel.subeKodu.toStringIfNotNull ?? "")),
              onTap: () async {
                final result = await bottomSheetDialogManager.showRadioBottomSheetDialog(
                  context,
                  groupValue: stokModel.subeKodu,
                  title: "Şube",
                  children:
                      subeList
                          .map(
                            (e) => BottomSheetModel(
                              title: "${e.subeAdi}",
                              description: e.subeKodu.toStringIfNotNull,
                              value: e,
                              groupValue: e.subeKodu,
                            ),
                          )
                          .toList(),
                );
                if (result != null) {
                  subeController.text = "${result.subeAdi} ${result.subeKodu}";
                  viewModel.setSube(result);
                }
              },
              suffixMore: true,
            ),
          ),
          CustomWidgetWithLabel(
            text: "Rapor Kodları",
            child: Wrap(
              children: [
                CustomTextField(
                  enabled: enable,
                  labelText: "Üretici Kodu",
                  controller: ureticiKoduController,
                  onChanged: (p0) => stokModel.ureticiKodu = p0,
                ),
                Row(
                  children: [
                    Expanded(
                      child: CustomTextField(
                        enabled: enable,
                        controller: grupKoduController,
                        onChanged: (value) => viewModel.setGrupKodu(0, BaseGrupKoduModel(grupKodu: value)),
                        valueWidget: Observer(builder: (_) => Text(stokModel.grupTanimi ?? "")),
                        suffix: IconButton(
                          onPressed: () async {
                            if (!(viewModel.grupKodlariMap?.containsKey(0) ?? false)) {
                              dialogManager.showLoadingDialog("Grup Kodları Yükleniyor...");
                              viewModel.changeGrupKoduListesi(
                                0,
                                await networkManager.getGrupKod(name: GrupKoduEnum.stok, grupNo: 0),
                              );
                              dialogManager.hideAlertDialog;
                            }
                            final BaseGrupKoduModel? result = await bottomSheetDialogManager.showRadioBottomSheetDialog(
                              context,
                              title: "Grup Kodu",
                              groupValue: stokModel.grupKodu,
                              children:
                                  viewModel.grupKodlariMap?[0]
                                      ?.map(
                                        (e) => BottomSheetModel(
                                          title: "${e.grupAdi}",
                                          description: e.grupKodu,
                                          groupValue: e.grupKodu,
                                          value: e,
                                        ),
                                      )
                                      .toList() ??
                                  [],
                            );
                            if (result == null) return;
                            grupKoduController.text = result.grupKodu ?? "";
                            viewModel.setGrupKodu(0, result);
                          },
                          icon: const Icon(Icons.more_horiz_outlined),
                        ),
                        labelText: "Grup Kodu",
                      ),
                    ),
                    Expanded(
                      child: CustomTextField(
                        enabled: enable,
                        controller: kod1Controller,
                        onChanged: (value) => viewModel.setGrupKodu(1, BaseGrupKoduModel(grupKodu: value)),
                        valueWidget: Observer(builder: (_) => Text(stokModel.kod1Tanimi ?? "")),
                        suffix: IconButton(
                          onPressed: () async {
                            if (!(viewModel.grupKodlariMap?.containsKey(1) ?? false)) {
                              dialogManager.showLoadingDialog("Kod 1 Yükleniyor...");
                              viewModel.changeGrupKoduListesi(
                                1,
                                await networkManager.getGrupKod(name: GrupKoduEnum.stok, grupNo: 1),
                              );
                              dialogManager.hideAlertDialog;
                            }
                            final BaseGrupKoduModel? result = await bottomSheetDialogManager.showRadioBottomSheetDialog(
                              context,
                              title: "Kod 1",
                              groupValue: stokModel.kod1,
                              children:
                                  viewModel.grupKodlariMap?[1]
                                      ?.map(
                                        (e) => BottomSheetModel(
                                          title: "${e.grupAdi}",
                                          description: e.grupKodu,
                                          groupValue: e.grupKodu,
                                          value: e,
                                        ),
                                      )
                                      .toList() ??
                                  [],
                            );
                            if (result == null) return;
                            kod1Controller.text = result.grupKodu ?? "";
                            viewModel.setGrupKodu(1, result);
                          },
                          icon: const Icon(Icons.more_horiz_outlined),
                        ),
                        labelText: "Kod1",
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: CustomTextField(
                        enabled: enable,
                        controller: kod2Controller,
                        onChanged: (value) => viewModel.setGrupKodu(2, BaseGrupKoduModel(grupKodu: value)),
                        valueWidget: Observer(builder: (_) => Text(stokModel.kod2Tanimi ?? "")),
                        suffix: IconButton(
                          onPressed: () async {
                            if (!(viewModel.grupKodlariMap?.containsKey(2) ?? false)) {
                              dialogManager.showLoadingDialog("Kod 2 Yükleniyor...");
                              viewModel.changeGrupKoduListesi(
                                2,
                                await networkManager.getGrupKod(name: GrupKoduEnum.stok, grupNo: 2),
                              );
                              dialogManager.hideAlertDialog;
                            }
                            final BaseGrupKoduModel? result = await bottomSheetDialogManager.showRadioBottomSheetDialog(
                              context,
                              title: "Kod 2",
                              groupValue: stokModel.kod2,
                              children:
                                  viewModel.grupKodlariMap?[2]
                                      ?.map(
                                        (e) => BottomSheetModel(
                                          title: "${e.grupAdi}",
                                          description: e.grupKodu,
                                          groupValue: e.grupKodu,
                                          value: e,
                                        ),
                                      )
                                      .toList() ??
                                  [],
                            );

                            if (result == null) return;
                            kod2Controller.text = result.grupKodu ?? "";
                            viewModel.setGrupKodu(2, result);
                          },
                          icon: const Icon(Icons.more_horiz_outlined),
                        ),
                        labelText: "Kod2",
                      ),
                    ),
                    Expanded(
                      child: CustomTextField(
                        enabled: enable,
                        controller: kod3Controller,
                        onChanged: (value) => viewModel.setGrupKodu(3, BaseGrupKoduModel(grupKodu: value)),
                        valueWidget: Observer(builder: (_) => Text(stokModel.kod3Tanimi ?? "")),
                        suffix: IconButton(
                          onPressed: () async {
                            if (!(viewModel.grupKodlariMap?.containsKey(3) ?? false)) {
                              dialogManager.showLoadingDialog("Kod 3 Yükleniyor...");
                              viewModel.changeGrupKoduListesi(
                                3,
                                await networkManager.getGrupKod(name: GrupKoduEnum.stok, grupNo: 3),
                              );
                              dialogManager.hideAlertDialog;
                            }
                            final BaseGrupKoduModel? result = await bottomSheetDialogManager.showRadioBottomSheetDialog(
                              context,
                              title: "Kod 3",
                              groupValue: stokModel.kod3,
                              children:
                                  viewModel.grupKodlariMap?[3]
                                      ?.map(
                                        (e) => BottomSheetModel(
                                          title: "${e.grupAdi}",
                                          description: e.grupKodu,
                                          groupValue: e.grupKodu,
                                          value: e,
                                        ),
                                      )
                                      .toList(),
                            );
                            if (result == null) return;
                            kod3Controller.text = result.grupKodu ?? "";
                            viewModel.setGrupKodu(3, result);
                          },
                          icon: const Icon(Icons.more_horiz_outlined),
                        ),
                        labelText: "Kod3",
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: CustomTextField(
                        enabled: enable,
                        onChanged: (value) => viewModel.setGrupKodu(4, BaseGrupKoduModel(grupKodu: value)),
                        valueWidget: Observer(builder: (_) => Text(stokModel.kod4Tanimi ?? "")),
                        suffix: IconButton(
                          onPressed: () async {
                            if (!(viewModel.grupKodlariMap?.containsKey(4) ?? false)) {
                              dialogManager.showLoadingDialog("Kod 4 Yükleniyor...");
                              viewModel.changeGrupKoduListesi(
                                4,
                                await networkManager.getGrupKod(name: GrupKoduEnum.stok, grupNo: 4),
                              );
                              dialogManager.hideAlertDialog;
                            }
                            final BaseGrupKoduModel? result = await bottomSheetDialogManager.showRadioBottomSheetDialog(
                              context,
                              title: "Kod 4",
                              groupValue: stokModel.kod4,
                              children:
                                  viewModel.grupKodlariMap?[4]
                                      ?.map(
                                        (e) => BottomSheetModel(
                                          title: "${e.grupAdi}",
                                          description: e.grupKodu,
                                          groupValue: e.grupKodu,
                                          value: e,
                                        ),
                                      )
                                      .toList(),
                            );
                            if (result == null) return;
                            kod4Controller.text = result.grupKodu ?? "";
                            viewModel.setGrupKodu(4, result);
                          },
                          icon: const Icon(Icons.more_horiz_outlined),
                        ),
                        controller: kod4Controller,
                        labelText: "Kod4",
                      ),
                    ),
                    Expanded(
                      child: CustomTextField(
                        enabled: enable,
                        controller: kod5Controller,
                        onChanged: (value) => viewModel.setGrupKodu(5, BaseGrupKoduModel(grupKodu: value)),
                        valueWidget: Observer(builder: (_) => Text(stokModel.kod5Tanimi ?? "")),
                        suffix: IconButton(
                          onPressed: () async {
                            if (!(viewModel.grupKodlariMap?.containsKey(5) ?? false)) {
                              dialogManager.showLoadingDialog("Kod 5 Yükleniyor...");
                              viewModel.changeGrupKoduListesi(
                                5,
                                await networkManager.getGrupKod(name: GrupKoduEnum.stok, grupNo: 5),
                              );
                              dialogManager.hideAlertDialog;
                            }
                            final BaseGrupKoduModel? result = await bottomSheetDialogManager.showRadioBottomSheetDialog(
                              context,
                              title: "Kod 5",
                              groupValue: stokModel.kod5,
                              children:
                                  viewModel.grupKodlariMap?[5]
                                      ?.map(
                                        (e) => BottomSheetModel(
                                          title: "${e.grupAdi}",
                                          description: e.grupKodu,
                                          groupValue: e.grupKodu,
                                          value: e,
                                        ),
                                      )
                                      .toList(),
                            );
                            if (result == null) return;
                            kod5Controller.text = result.grupKodu ?? "";
                            viewModel.setGrupKodu(5, result);
                          },
                          icon: const Icon(Icons.more_horiz_outlined),
                        ),
                        labelText: "Kod5",
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ).paddingAll(UIHelper.lowSize),
    ),
  );

  Future<String?> imageCompresser(ImageSource sourceType) async {
    final ImagePicker picker = ImagePicker();
    final XFile? result = await picker.pickImage(source: sourceType, imageQuality: 30, maxHeight: 1024, maxWidth: 768);
    if (result != null) {
      Uint8List? compressedImage;
      try {
        compressedImage = await FlutterImageCompress.compressWithFile(
          result.path,
          format: CompressFormat.png,
          keepExif: true,
          numberOfRetries: 10,
          quality: 30,
        );
      } catch (e) {
        compressedImage = await FlutterImageCompress.compressWithFile(
          result.path,
          format: CompressFormat.heic,
          numberOfRetries: 10,
          keepExif: true,
        );
      }
      final base64 = base64Encode(compressedImage!.toList());
      viewModel.setImage(base64);
      return base64;
      // stokModel?.resimBase64 = base64;
    }
    return null;
  }

  Future<void> baseOlcuBirimleriController({int? controller}) async {
    dialogManager.showLoadingDialog("Ölçü Birimleri Yükleniyor...");
    List<StokOlcuBirimleriModel>? filteredList = [];
    olcuBirimleriList ??= await getOlcuBirimleri();
    dialogManager.hideAlertDialog;
    filteredList = olcuBirimleriList?.where((element) => element.birimNo == controller).toList();
    final result = await bottomSheetDialogManager.showRadioBottomSheetDialog(
      groupValue: stokModel.olcuBirimiSelector(controller),
      context,
      title: "Ölçü Birimi $controller",
      children:
          filteredList
              ?.map(
                (e) => BottomSheetModel(
                  title: e.olcuBirimi ?? "",
                  groupValue: e.olcuBirimi,
                  onTap: () => Get.back(result: e.olcuBirimi),
                ),
              )
              .toList(),
    );
    if (result != null) {
      if (controller == 1) {
        olcuBirimi1Controller.text = result;
        stokModel.olcuBirimi = result;
      } else if (controller == 2) {
        olcuBirimi2Controller.text = result;
        stokModel.olcuBirimi2 = result;
      } else if (controller == 3) {
        olcuBirimi3Controller.text = result;
        stokModel.olcuBirimi3 = result;
      }
    }
  }

  Future<void> baseBarkodUretController({int? controller}) async {
    dialogManager.showLoadingDialog("Barkod Üretiliyor...");
    final result = await getBarkod(controller);
    dialogManager.hideAlertDialog;
    if (controller == 1) {
      barkod1Controller.text = result;
      stokModel.barkod1 = result;
    } else if (controller == 2) {
      barkod2Controller.text = result;
      stokModel.barkod2 = result;
    } else if (controller == 3) {
      barkod3Controller.text = result;
      stokModel.barkod3 = result;
    }
  }

  Future<String?> getSiradakiKod({String? kod = "", bool? isOnBuild = false, bool sonKoduGetir = false}) async {
    // if (isOnBuild == true) {
    //   dialogManager.showLoadingDialog("Sıradaki Kod Getiriliyor...");
    // }
    final result = await networkManager.dioGet<BaseEditSiradakiKodModel>(
      path: ApiUrls.getSiradakiKod,
      bodyModel: BaseEditSiradakiKodModel(),
      showLoading: true,
      queryParameters: {
        "SonKoduGetir": sonKoduGetir ? "E" : "H",
        "Kod": kod != null || kod != "" ? kod : null,
        "Modul": GrupKoduEnum.stok.module,
      },
    );
    if (result.isSuccess) {
      stokKoduController.text = result.paramData!["SIRADAKI_NO"];
      if (isOnBuild == true) {
        // dialogManager.hideAlertDialog;
        stokModel.stokKodu = stokKoduController.text;
      } else {
        stokModel.stokKodu ??= stokKoduController.text;
        // model?.stokKodu = siradakiKod;
      }
      return result.paramData!["SIRADAKI_NO"];
    }
    return stokKoduController.text;
  }

  Future<List<StokMuhasebeKoduModel>> getMuhasebeKodlari() async {
    final result = await networkManager.dioGet<StokMuhasebeKoduModel>(
      path: ApiUrls.getStokMuhasebeKodlari,
      bodyModel: StokMuhasebeKoduModel(),
    );
    return result.dataList;
  }

  Future<List<StokOlcuBirimleriModel>> getOlcuBirimleri() async {
    final result = await networkManager.dioGet<StokOlcuBirimleriModel>(
      path: ApiUrls.getOlcuBirimleri,
      bodyModel: StokOlcuBirimleriModel(),
    );
    return result.dataList;
  }

  void subeChecker() {
    final List result = CacheManager.getSubeListesi();
    if (!result.any((element) => element.subeKodu == -1)) {
      result.insert(0, IsletmeModel(subeKodu: -1, subeAdi: "Şubelerde Ortak"));
    }
    subeList = result.map((e) => e as IsletmeModel).toList().cast<IsletmeModel>();
  }

  Future<String> getBarkod(int? controller) async {
    String seriValue = "";
    if (controller == 1) {
      seriValue = barkod1Controller.text;
    } else if (controller == 2) {
      seriValue = barkod2Controller.text;
    } else if (controller == 3) {
      seriValue = barkod3Controller.text;
    }
    final GenericResponseModel result = await networkManager.dioPost<StokOlcuBirimleriModel>(
      path: ApiUrls.barkodUret,
      bodyModel: StokOlcuBirimleriModel(),
      data: {
        "BarkodSira": controller.toStringIfNotNull,
        "StokKodu": viewModel.stokDetayModel.stokKodu ?? stokKoduController.text,
        "Seri": seriValue,
      },
    );
    return result.paramData!["URETILEN_BARKOD"];
  }
}
