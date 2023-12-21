// ignore_for_file: use_build_context_synchronously

import "dart:convert";
import "dart:developer";
import "dart:io";
import "dart:typed_data";
import "dart:ui" as ui;

import "package:flutter/material.dart";
import "package:flutter_image_compress/flutter_image_compress.dart";
import "package:flutter_mobx/flutter_mobx.dart";
import "package:get/get.dart";
import "package:image_picker/image_picker.dart";
import "package:kartal/kartal.dart";
import "package:picker/core/constants/extensions/widget_extensions.dart";

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
import "../../../../../../model/main_page_model.dart";
import "../../../../../../model/param_model.dart";
import "../../../../stok_liste/model/stok_listesi_model.dart";
import "../../../model/stok_detay_model.dart";
import "../../../model/stok_muhasebe_kodu_model.dart";
import "../../../model/stok_olcu_birimleri_model.dart";
import "../view_model/base_stok_edit_genel_view_model.dart";

class BaseStokEditGenelView extends StatefulWidget {
  final BaseEditEnum? model;
  const BaseStokEditGenelView({super.key, this.model});

  @override
  State<BaseStokEditGenelView> createState() => _BaseStokEditGenelViewState();
}

class _BaseStokEditGenelViewState extends BaseState<BaseStokEditGenelView> {
  // StokListesiModel? get widgetModel => StokListesiModel.instance
  Map veriTabani = CacheManager.getVeriTabani();
  List<IsletmeModel> subeList = [];
  BaseStokEditGenelViewModel viewModel = BaseStokEditGenelViewModel();
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
  Future? stokDetayModel;
  StokDetayModel? model;
  String? siradakiKod;
  List<StokOlcuBirimleriModel>? olcuBirimleriList;
  bool get enable => widget.model != BaseEditEnum.goruntule;

  File? image;
  @override
  void initState() {
    final isletmeModel = IsletmeModel(subeKodu: -1, subeAdi: "Şubelerde Ortak");
    stokKoduController = TextEditingController(text: viewModel.stokListesiModel?.stokKodu);
    stokAdiController = TextEditingController(text: viewModel.stokListesiModel?.stokAdi);
    depoController = TextEditingController(text: model?.stokList?.firstOrNull?.depoKodu.toStringIfNotNull ?? viewModel.stokListesiModel?.depoKodu.toStringIfNotNull);
    muhasebeDetayKoduController = TextEditingController(text: model?.stokList?.firstOrNull?.muhdetayAdi ?? viewModel.stokListesiModel?.muhdetayAdi);
    olcuBirimi1Controller = TextEditingController(text: model?.stokList?.firstOrNull?.olcuBirimi ?? viewModel.stokListesiModel?.olcuBirimi);
    olcuBirimi2Controller = TextEditingController(text: model?.stokList?.firstOrNull?.olcuBirimi2 ?? viewModel.stokListesiModel?.olcuBirimi2);
    olcuBirimi2PayController = TextEditingController(text: model?.stokList?.firstOrNull?.olcuBirimi2Pay.toStringIfNotNull ?? viewModel.stokListesiModel?.olcuBirimi2Pay.toStringIfNotNull);
    olcuBirimi2PaydaController = TextEditingController(text: model?.stokList?.firstOrNull?.olcuBirimi2Payda.toStringIfNotNull ?? viewModel.stokListesiModel?.olcuBirimi2Payda.toStringIfNotNull);
    olcuBirimi3Controller = TextEditingController(text: model?.stokList?.firstOrNull?.olcuBirimi3 ?? viewModel.stokListesiModel?.olcuBirimi3);
    olcuBirimi3PayController = TextEditingController(text: model?.stokList?.firstOrNull?.olcuBirimi3Pay.toStringIfNotNull ?? viewModel.stokListesiModel?.olcuBirimi3Pay.toStringIfNotNull);
    olcuBirimi3PaydaController = TextEditingController(text: model?.stokList?.firstOrNull?.olcuBirimi3Payda.toStringIfNotNull ?? viewModel.stokListesiModel?.olcuBirimi3Payda.toStringIfNotNull);
    barkod1Controller = TextEditingController(text: model?.stokList?.firstOrNull?.barkod1 ?? viewModel.stokListesiModel?.barkod1);
    barkod2Controller = TextEditingController(text: model?.stokList?.firstOrNull?.barkod2 ?? viewModel.stokListesiModel?.barkod2);
    barkod3Controller = TextEditingController(text: model?.stokList?.firstOrNull?.barkod3 ?? viewModel.stokListesiModel?.barkod3);
    subeController = TextEditingController(
      text: subeList.ext.isNotNullOrEmpty
          ? subeList.where((element) => element.subeKodu == model?.stokList?.firstOrNull?.subeKodu || element.subeKodu == viewModel.stokListesiModel?.subeKodu).firstOrNull?.subeAdi
          : "${isletmeModel.subeAdi} ${isletmeModel.subeKodu}",
    ); //text: model?.stokAdi
    ureticiKoduController = TextEditingController(text: model?.stokList?.firstOrNull?.ureticiKodu ?? viewModel.stokListesiModel?.ureticiKodu); //text: model?.stokAdi
    grupKoduController = TextEditingController(text: model?.stokList?.firstOrNull?.grupKodu ?? viewModel.stokListesiModel?.grupKodu);
    kod1Controller = TextEditingController(text: model?.stokList?.firstOrNull?.kod1 ?? viewModel.stokListesiModel?.kod1);
    kod2Controller = TextEditingController(text: model?.stokList?.firstOrNull?.kod2 ?? viewModel.stokListesiModel?.kod2);
    kod3Controller = TextEditingController(text: model?.stokList?.firstOrNull?.kod3 ?? viewModel.stokListesiModel?.kod3);
    kod4Controller = TextEditingController(text: model?.stokList?.firstOrNull?.kod4 ?? viewModel.stokListesiModel?.kod4);
    kod5Controller = TextEditingController(text: model?.stokList?.firstOrNull?.kod5 ?? viewModel.stokListesiModel?.kod5);
    if (subeController.text == "") {
      subeController.text = "Şubelerde Ortak";
      viewModel.stokListesiModel?.subeKodu = -1;
    }
    if (widget.model == BaseEditEnum.ekle || widget.model == BaseEditEnum.kopyala) {
      stokDetayModel = getSiradakiKod();
    }
    subeChecker();
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
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: IconButton(
                      onPressed: () async {
                        final sourceType = await bottomSheetDialogManager.showBottomSheetDialog(
                          context,
                          title: "Kaynak tipi",
                          children: [
                            BottomSheetModel(title: "Galeri", iconWidget: Icons.photo_library_outlined, value: ImageSource.gallery),
                            BottomSheetModel(title: "Kamera", iconWidget: Icons.camera_alt_outlined, value: ImageSource.camera),
                          ],
                        );
                        //image picker
                        if (sourceType != null) {
                          final ImagePicker picker = ImagePicker();
                          final XFile? result = await picker.pickImage(source: sourceType, imageQuality: 30, maxHeight: 1024, maxWidth: 768);
                          if (result != null) {
                            setState(() => image = File(result.path));
                            if (image != null) {
                              Uint8List? compressedImage;
                              try {
                                compressedImage = await FlutterImageCompress.compressWithFile(
                                  image!.path,
                                  format: CompressFormat.png,
                                  keepExif: true,
                                  numberOfRetries: 10,
                                  quality: 30,
                                  autoCorrectionAngle: true,
                                );
                              } catch (e) {
                                compressedImage = await FlutterImageCompress.compressWithFile(image!.path, format: CompressFormat.heic, numberOfRetries: 10, keepExif: true, autoCorrectionAngle: true);
                              }
                              final base64 = base64Encode(compressedImage!.toList());
                              viewModel.stokListesiModel?.resimBase64 = base64;
                            }
                          }
                        }
                      },
                      icon: const Icon(Icons.add),
                    ),
                    //TODO resim göstermeyi ekleyince aç
                  ).yetkiVarMi(false),
                  Expanded(
                    flex: 4,
                    child: CustomTextField(
                      enabled: enable && (widget.model == BaseEditEnum.ekle || widget.model == BaseEditEnum.kopyala),
                      labelText: "Kodu",
                      isMust: true,
                      controller: stokKoduController,
                      suffix: Wrap(
                        children: [
                          IconButton(onPressed: () {}, icon: const Icon(Icons.more_horiz_outlined)),
                          IconButton(
                            onPressed: () async {
                              stokKoduController.text = await getSiradakiKod(kod: siradakiKod, isOnBuild: true) ?? "";
                              viewModel.stokListesiModel?.stokKodu = stokKoduController.text;
                            },
                            icon: const Icon(Icons.add),
                          ),
                        ].map((e) => SizedBox(width: 35, child: e)).toList(),
                      ),
                    ),
                  ),
                ].whereType<Expanded>().toList(),
              ),
              CustomTextField(enabled: enable, labelText: "Adı", controller: stokAdiController, onChanged: (p0) => viewModel.stokListesiModel?.stokAdi = p0),
              CustomTextField(
                labelText: "Depo",
                enabled: enable,
                readOnly: true,
                valueWidget: Observer(
                  builder: (_) => Text(viewModel.stokListesiModel?.depoKodu.toStringIfNotNull ?? ""),
                ),
                onTap: () async {
                  final MainPageModel? mainPageModel = CacheManager.getAnaVeri;
                  final List<DepoList>? list = mainPageModel?.paramModel?.depoList;
                  final DepoList? result = await bottomSheetDialogManager.showBottomSheetDialog(
                    context,
                    title: "Depo",
                    children: list?.map((e) => BottomSheetModel(title: e.depoTanimi ?? "", description: e.depoKodu.toStringIfNotNull, onTap: () => Get.back(result: e))).toList(),
                  );
                  if (result != null) {
                    depoController.text = result.depoTanimi ?? "";
                    viewModel.stokListesiModel?.depoKodu = result.depoKodu;
                  }
                },
                suffixMore: true,
                controller: depoController,
              ),
              CustomTextField(
                enabled: enable,
                suffix: IconButton(
                  onPressed: () async {
                    final List<StokMuhasebeKoduModel> list = await getMuhasebeKodlari();
                    final StokMuhasebeKoduModel? result = await bottomSheetDialogManager.showBottomSheetDialog(
                      context,
                      title: "Muhasebe Kodu",
                      children: list
                          .map(
                            (e) => BottomSheetModel(
                              title: "${e.adi ?? ""}\n${e.muhKodu.toStringIfNotNull}",
                              description: "${e.alisHesabi} \n${e.satisHesabi}",
                              onTap: () => Get.back(result: e),
                            ),
                          )
                          .toList(),
                    );
                    if (result != null) {
                      muhasebeDetayKoduController.text = "${result.adi ?? ""} ${result.muhKodu.toStringIfNotNull}";
                      viewModel.stokListesiModel?.muhdetayAdi = result.adi;
                    }
                  },
                  icon: const Icon(Icons.more_horiz_outlined),
                ),
                labelText: "Muhasebe Detay Kodu",
                controller: muhasebeDetayKoduController,
              ),
              CustomTextField(
                labelText: "Ölçü Birimi 1",
                enabled: enable,
                readOnly: true,
                suffixMore: true,
                onTap: () {
                  baseOlcuBirimleriController(controller: 1);
                },
                controller: olcuBirimi1Controller,
              ),
              CustomTextField(
                labelText: "Ölçü Birimi 2",
                enabled: enable,
                readOnly: true,
                suffixMore: true,
                onTap: () {
                  baseOlcuBirimleriController(controller: 2);
                },
                controller: olcuBirimi2Controller,
              ),
              Row(
                children: [
                  Expanded(child: CustomTextField(enabled: enable, keyboardType: TextInputType.number, labelText: "Ölçü Br.2 Pay", controller: olcuBirimi2PayController)),
                  Expanded(child: CustomTextField(enabled: enable, keyboardType: TextInputType.number, labelText: "Ölçü Br.2 Payda", controller: olcuBirimi2PaydaController)),
                ],
              ),
              CustomTextField(
                labelText: "Ölçü Birimi 3",
                enabled: enable,
                readOnly: true,
                suffixMore: true,
                onTap: () {
                  baseOlcuBirimleriController(controller: 3);
                },
                controller: olcuBirimi3Controller,
              ),
              Row(
                children: [
                  Expanded(child: CustomTextField(enabled: enable, keyboardType: TextInputType.number, labelText: "Ölçü Br.3 Pay", controller: olcuBirimi3PayController)),
                  Expanded(child: CustomTextField(enabled: enable, keyboardType: TextInputType.number, labelText: "Ölçü Br.3 Payda", controller: olcuBirimi3PaydaController)),
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
                      suffix: Wrap(
                        children: [
                          IconButton(
                            onPressed: () {
                              baseBarkodUretController(controller: 1);
                            },
                            icon: const Icon(Icons.add),
                          ),
                          IconButton(onPressed: () async => barkod1Controller.text = await Get.toNamed("qr"), icon: const Icon(Icons.qr_code_2_outlined)),
                        ],
                      ),
                    ),
                    CustomTextField(
                      enabled: enable,
                      labelText: "Barkod 2",
                      controller: barkod2Controller,
                      maxLength: 35,
                      suffix: Wrap(
                        children: [
                          IconButton(
                            onPressed: () {
                              baseBarkodUretController(controller: 2);
                            },
                            icon: const Icon(Icons.add),
                          ),
                          IconButton(onPressed: () async => barkod2Controller.text = await Get.toNamed("qr"), icon: const Icon(Icons.qr_code_2_outlined)),
                        ],
                      ),
                    ),
                    CustomTextField(
                      enabled: enable,
                      labelText: "Barkod 3",
                      controller: barkod3Controller,
                      maxLength: 35,
                      suffix: Wrap(
                        children: [
                          IconButton(
                            onPressed: () {
                              baseBarkodUretController(controller: 3);
                            },
                            icon: const Icon(Icons.add),
                          ),
                          IconButton(onPressed: () async => barkod3Controller.text = await Get.toNamed("qr"), icon: const Icon(Icons.qr_code_2_outlined)),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              CustomWidgetWithLabel(
                text: "Diğer",
                child: CustomTextField(
                  // valueText: viewModel.stokListesiModel?.subeKodu.toStringIfNotNull,
                  readOnly: true,
                  enabled: (enable && subeList.firstWhereOrNull((element) => element.subeKodu == veriTabani["Şube"])?.merkezmi == "E") || widget.model == BaseEditEnum.ekle,
                  labelText: "Şube",
                  isMust: true,
                  controller: subeController,
                  onTap: () async {
                    final result = await bottomSheetDialogManager.showBottomSheetDialog(
                      context,
                      title: "Şube",
                      children: subeList.map((e) => BottomSheetModel(title: "${e.subeAdi} ${e.subeKodu}", onTap: () => Get.back(result: e))).toList(),
                    );
                    if (result != null) {
                      subeController.text = "${result.subeAdi} ${result.subeKodu}";
                      viewModel.stokListesiModel?.subeKodu = result.subeKodu;
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
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: CustomTextField(
                            enabled: enable,
                            controller: grupKoduController,
                            readOnly: true,
                            suffixMore: true,
                            onTap: () async {
                              if (!(viewModel.grupKodlariMap?.containsKey(0) ?? false)) {
                                dialogManager.showLoadingDialog("Grup Kodları Yükleniyor...");
                                viewModel.changeGrupKoduListesi(0, await networkManager.getGrupKod(name: "STOK", grupNo: 0));
                                dialogManager.hideAlertDialog;
                              }
                              final BaseGrupKoduModel? result = await bottomSheetDialogManager.showBottomSheetDialog(
                                context,
                                title: "Grup Kodu",
                                children: viewModel.grupKodlariMap?[0]?.map((e) => BottomSheetModel(title: "${e.grupAdi} ${e.grupKodu}", onTap: () => Get.back(result: e))).toList() ?? [],
                              );
                              grupKoduController.text = result?.grupAdi ?? "";
                              viewModel.stokListesiModel?.grupKodu = result?.grupKodu;
                            },
                            labelText: "Grup Kodu",
                          ),
                        ),
                        Expanded(
                          child: CustomTextField(
                            enabled: enable,
                            controller: kod1Controller,
                            readOnly: true,
                            onTap: () async {
                              if (!(viewModel.grupKodlariMap?.containsKey(1) ?? false)) {
                                dialogManager.showLoadingDialog("Kod 1 Yükleniyor...");
                                viewModel.changeGrupKoduListesi(1, await networkManager.getGrupKod(name: "STOK", grupNo: 1));
                                dialogManager.hideAlertDialog;
                              }
                              final BaseGrupKoduModel? result = await bottomSheetDialogManager.showBottomSheetDialog(
                                context,
                                title: "Kod 1",
                                children: viewModel.grupKodlariMap?[1]?.map((e) => BottomSheetModel(title: "${e.grupAdi} ${e.grupKodu}", onTap: () => Get.back(result: e))).toList() ?? [],
                              );
                              kod1Controller.text = result?.grupKodu ?? "";
                              viewModel.stokListesiModel?.kod1 = result?.grupAdi;
                            },
                            suffixMore: true,
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
                            readOnly: true,
                            onTap: () async {
                              if (!(viewModel.grupKodlariMap?.containsKey(2) ?? false)) {
                                dialogManager.showLoadingDialog("Kod 2 Yükleniyor...");
                                viewModel.changeGrupKoduListesi(2, await networkManager.getGrupKod(name: "STOK", grupNo: 2));
                                dialogManager.hideAlertDialog;
                              }
                              final BaseGrupKoduModel? result = await bottomSheetDialogManager.showBottomSheetDialog(
                                context,
                                title: "Kod 2",
                                children: viewModel.grupKodlariMap?[2]?.map((e) => BottomSheetModel(title: "${e.grupAdi} ${e.grupKodu}", onTap: () => Get.back(result: e))).toList() ?? [],
                              );
                              kod2Controller.text = result?.grupKodu ?? "";
                              viewModel.stokListesiModel?.kod2 = result?.grupAdi;
                            },
                            suffixMore: true,
                            labelText: "Kod2",
                          ),
                        ),
                        Expanded(
                          child: CustomTextField(
                            enabled: enable,
                            controller: kod3Controller,
                            readOnly: true,
                            onTap: () async {
                              if (!(viewModel.grupKodlariMap?.containsKey(3) ?? false)) {
                                dialogManager.showLoadingDialog("Kod 3 Yükleniyor...");
                                viewModel.changeGrupKoduListesi(3, await networkManager.getGrupKod(name: "STOK", grupNo: 3));
                                dialogManager.hideAlertDialog;
                              }
                              final BaseGrupKoduModel? result = await bottomSheetDialogManager.showBottomSheetDialog(
                                context,
                                title: "Kod 3",
                                children: viewModel.grupKodlariMap?[3]?.map((e) => BottomSheetModel(title: "${e.grupAdi} ${e.grupKodu}", onTap: () => Get.back(result: e))).toList() ?? [],
                              );
                              kod3Controller.text = result?.grupKodu ?? "";
                              viewModel.stokListesiModel?.kod3 = result?.grupAdi;
                            },
                            suffixMore: true,
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
                            readOnly: true,
                            onTap: () async {
                              if (!(viewModel.grupKodlariMap?.containsKey(4) ?? false)) {
                                dialogManager.showLoadingDialog("Kod 4 Yükleniyor...");
                                viewModel.changeGrupKoduListesi(4, await networkManager.getGrupKod(name: "STOK", grupNo: 4));
                                dialogManager.hideAlertDialog;
                              }
                              final BaseGrupKoduModel? result = await bottomSheetDialogManager.showBottomSheetDialog(
                                context,
                                title: "Kod 4",
                                children: viewModel.grupKodlariMap?[4]?.map((e) => BottomSheetModel(title: "${e.grupAdi} ${e.grupKodu}", onTap: () => Get.back(result: e))).toList() ?? [],
                              );
                              kod4Controller.text = result?.grupKodu ?? "";
                              viewModel.stokListesiModel?.kod4 = result?.grupAdi;
                            },
                            suffixMore: true,
                            controller: kod4Controller,
                            labelText: "Kod4",
                          ),
                        ),
                        Expanded(
                          child: CustomTextField(
                            enabled: enable,
                            controller: kod5Controller,
                            readOnly: true,
                            onTap: () async {
                              if (!(viewModel.grupKodlariMap?.containsKey(5) ?? false)) {
                                dialogManager.showLoadingDialog("Kod 5 Yükleniyor...");
                                viewModel.changeGrupKoduListesi(5, await networkManager.getGrupKod(name: "STOK", grupNo: 5));
                                dialogManager.hideAlertDialog;
                              }
                              final BaseGrupKoduModel? result = await bottomSheetDialogManager.showBottomSheetDialog(
                                context,
                                title: "Kod 5",
                                children: viewModel.grupKodlariMap?[5]?.map((e) => BottomSheetModel(title: "${e.grupAdi} ${e.grupKodu}", onTap: () => Get.back(result: e))).toList() ?? [],
                              );
                              kod5Controller.text = result?.grupKodu ?? "";
                              viewModel.stokListesiModel?.kod5 = result?.grupAdi;
                            },
                            suffixMore: true,
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

  Future<void> baseOlcuBirimleriController({int? controller}) async {
    dialogManager.showLoadingDialog("Ölçü Birimleri Yükleniyor...");
    List<StokOlcuBirimleriModel>? filteredList = [];
    olcuBirimleriList ??= await getOlcuBirimleri();
    dialogManager.hideAlertDialog;
    filteredList = olcuBirimleriList?.where((element) => element.birimNo == controller).toList();
    final result = await bottomSheetDialogManager.showBottomSheetDialog(
      context,
      title: "Ölçü Birimi $controller",
      children: filteredList?.map((e) => BottomSheetModel(title: e.olcuBirimi ?? "", description: e.birimNo.toStringIfNotNull, onTap: () => Get.back(result: e.olcuBirimi))).toList(),
    );
    if (result != null) {
      if (controller == 1) {
        olcuBirimi1Controller.text = result;
        viewModel.stokListesiModel?.olcuBirimi = result;
      } else if (controller == 2) {
        olcuBirimi2Controller.text = result;
        viewModel.stokListesiModel?.olcuBirimi2 = result;
      } else if (controller == 3) {
        olcuBirimi3Controller.text = result;
        viewModel.stokListesiModel?.olcuBirimi3 = result;
      }
    }
  }

  Future<void> baseBarkodUretController({int? controller}) async {
    dialogManager.showLoadingDialog("Barkod Üretiliyor...");
    final result = await getBarkod(controller);
    dialogManager.hideAlertDialog;
    if (controller == 1) {
      barkod1Controller.text = result;
      viewModel.stokListesiModel?.barkod1 = result;
    } else if (controller == 2) {
      barkod2Controller.text = result;
      viewModel.stokListesiModel?.barkod2 = result;
    } else if (controller == 3) {
      barkod3Controller.text = result;
      viewModel.stokListesiModel?.barkod3 = result;
    }
  }

  Future<StokDetayModel> getData() async {
    final GenericResponseModel result = await networkManager.dioGet<StokDetayModel>(
      path: ApiUrls.getStokDetay,
      bodyModel: StokDetayModel(),
      addCKey: true,
      addSirketBilgileri: true,
      queryParameters: {
        "stokKodu": StokListesiModel.instance.stokKodu ?? "",
      },
    );
    // image = await networkManager.getImage(StokListesiModel.instance.resimUrlKucuk ?? "");
    log((result.data.first as StokDetayModel).toJson().toString());
    model = result.data.first as StokDetayModel;
    StokDetayModel.setInstance(model!);
    return result.data.first as StokDetayModel;
  }

  Future<String?> getSiradakiKod({String? kod = "", bool? isOnBuild = false}) async {
    // if (isOnBuild == true) {
    //   dialogManager.showLoadingDialog("Sıradaki Kod Getiriliyor...");
    // }
    final result = await networkManager.dioGet<BaseEditSiradakiKodModel>(
      path: ApiUrls.getSiradakiKod,
      bodyModel: BaseEditSiradakiKodModel(),
      addCKey: true,
      addSirketBilgileri: true,
      queryParameters: {
        "SonKoduGetir": "H",
        "Kod": kod ?? "",
        "Modul": "STOK",
      },
    );
    if (result.success == true) {
      siradakiKod = result.paramData!["SIRADAKI_NO"];
      if (isOnBuild == true) {
        // dialogManager.hideAlertDialog;
        viewModel.stokListesiModel?.stokKodu = siradakiKod;
      } else {
        viewModel.stokListesiModel?.stokKodu ??= siradakiKod;
        // model?.stokKodu = siradakiKod;
      }
      return result.paramData!["SIRADAKI_NO"];
    }
    return stokKoduController.text;
  }

  Future<List<StokMuhasebeKoduModel>> getMuhasebeKodlari() async {
    final GenericResponseModel result = await networkManager.dioGet<StokMuhasebeKoduModel>(path: ApiUrls.getStokMuhasebeKodlari, bodyModel: StokMuhasebeKoduModel());
    return result.data.map((e) => e as StokMuhasebeKoduModel).toList().cast<StokMuhasebeKoduModel>();
  }

  Future<List<StokOlcuBirimleriModel>> getOlcuBirimleri() async {
    final GenericResponseModel result = await networkManager.dioGet<StokOlcuBirimleriModel>(
      path: ApiUrls.getOlcuBirimleri,
      bodyModel: StokOlcuBirimleriModel(),
      addCKey: true,
      addSirketBilgileri: true,
    );
    return result.data.map((e) => e as StokOlcuBirimleriModel).toList().cast<StokOlcuBirimleriModel>();
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
      addCKey: true,
      addSirketBilgileri: true,
      data: {"BarkodSira": controller.toStringIfNotNull, "StokKodu": model?.stokKodu ?? stokKoduController.text, "Seri": seriValue},
    );
    return result.paramData!["URETILEN_BARKOD"];
  }

  Future<String> bitmapToBase64(ui.Image? bitmap) async {
    if (bitmap == null) {
      return "";
    }
    try {
      final ByteData? byteData = await bitmap.toByteData(format: ui.ImageByteFormat.png);
      final Uint8List pngBytes = byteData?.buffer.asUint8List() ?? Uint8List(0);
      return base64Encode(pngBytes);
    } catch (e) {
      return "";
    }
  }
}
