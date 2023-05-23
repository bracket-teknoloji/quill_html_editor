import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:picker/core/base/helpers/helper.dart';
import 'package:picker/core/base/model/generic_response_model.dart';
import 'package:picker/core/components/dialog/bottom_sheet/model/bottom_sheet_model.dart';
import 'package:picker/core/components/textfield/custom_label_widget.dart';
import 'package:picker/core/components/textfield/custom_text_field.dart';
import 'package:picker/view/main_page/alt_sayfalar/stok/stok_liste/model/stok_listesi_model.dart';

import '../../../../../../constants/enum/base_edit_enum.dart';
import '../../../../../model/base_edit_model.dart';
import '../../../../../state/base_state.dart';
import '../../../model/stok_detay_model.dart';

class BaseStokEditGenelView extends StatefulWidget {
  final BaseEditModel<StokListesiModel>? model;
  const BaseStokEditGenelView({super.key, this.model});

  @override
  State<BaseStokEditGenelView> createState() => _BaseStokEditGenelViewState();
}

class _BaseStokEditGenelViewState extends BaseState<BaseStokEditGenelView> {
  StokListesiModel? get widgetModel => widget.model?.model;
  TextEditingController? stokKoduController;
  TextEditingController? stokAdiController;
  TextEditingController? depoController;
  TextEditingController? muhasebeDetayKoduController;
  TextEditingController? olcuBirimi1Controller;
  TextEditingController? olcuBirimi2Controller;
  TextEditingController? olcuBirimi2PayController;
  TextEditingController? olcuBirimi2PaydaController;
  TextEditingController? olcuBirimi3Controller;
  TextEditingController? olcuBirimi3PayController;
  TextEditingController? olcuBirimi3PaydaController;
  TextEditingController? barkod1Controller;
  TextEditingController? barkod2Controller;
  TextEditingController? barkod3Controller;
  TextEditingController? subeController;
  TextEditingController? ureticiKoduController;
  TextEditingController? grupKoduController;
  TextEditingController? kod1Controller;
  TextEditingController? kod2Controller;
  TextEditingController? kod3Controller;
  TextEditingController? kod4Controller;
  TextEditingController? kod5Controller;
  Future<StokDetayModel?>? stokDetayModel;
  StokDetayModel? model;

  File? image;
  @override
  void initState() {
    super.initState();
    stokDetayModel = getData();
  }

  @override
  void dispose() {
    super.dispose();
    stokKoduController?.dispose();
    stokAdiController?.dispose();
    depoController?.dispose();
    muhasebeDetayKoduController?.dispose();
    olcuBirimi1Controller?.dispose();
    olcuBirimi2Controller?.dispose();
    olcuBirimi2PayController?.dispose();
    olcuBirimi2PaydaController?.dispose();
    olcuBirimi3Controller?.dispose();
    olcuBirimi3PayController?.dispose();
    olcuBirimi3PaydaController?.dispose();
    barkod1Controller?.dispose();
    barkod2Controller?.dispose();
    barkod3Controller?.dispose();
    subeController?.dispose();
    ureticiKoduController?.dispose();
    grupKoduController?.dispose();
    kod1Controller?.dispose();
    kod2Controller?.dispose();
    kod3Controller?.dispose();
    kod4Controller?.dispose();
    kod5Controller?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool enable = widget.model?.baseEditEnum != BaseEditEnum.goruntule;
    return FutureBuilder(
        future: stokDetayModel,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else {
            stokKoduController = TextEditingController(text: widgetModel?.stokKodu);
            stokAdiController = TextEditingController(text: widgetModel?.stokAdi);
            depoController = TextEditingController(text: model?.stokList?.first.depoKodu.toStringIfNull);
            muhasebeDetayKoduController = TextEditingController(text: model?.stokList?.first.muhdetayAdi);
            olcuBirimi1Controller = TextEditingController(text: model?.stokList?.first.olcuBirimi);
            olcuBirimi2Controller = TextEditingController(text: model?.stokList?.first.olcuBirimi2);
            olcuBirimi2PayController = TextEditingController(text: model?.stokList?.first.olcuBirimi2Pay.toStringIfNull);
            olcuBirimi2PaydaController = TextEditingController(text: model?.stokList?.first.olcuBirimi2Payda.toStringIfNull);
            olcuBirimi3Controller = TextEditingController(text: model?.stokList?.first.olcuBirimi3);
            olcuBirimi3PayController = TextEditingController(text: model?.stokList?.first.olcuBirimi3Pay.toStringIfNull);
            olcuBirimi3PaydaController = TextEditingController(text: model?.stokList?.first.olcuBirimi3Payda.toStringIfNull);
            barkod1Controller = TextEditingController(text: model?.stokList?.first.barkod1);
            barkod2Controller = TextEditingController(text: model?.stokList?.first.barkod2);
            barkod3Controller = TextEditingController(text: model?.stokList?.first.barkod3);
            subeController = TextEditingController(); //text: model?.stokAdi
            ureticiKoduController = TextEditingController(); //text: model?.stokAdi
            grupKoduController = TextEditingController(text: model?.stokList?.first.grupKodu);
            kod1Controller = TextEditingController(text: model?.stokList?.first.kod1Tanimi);
            kod2Controller = TextEditingController(text: model?.stokList?.first.kod2Tanimi);
            kod3Controller = TextEditingController(text: model?.stokList?.first.kod3Tanimi);
            kod4Controller = TextEditingController(text: model?.stokList?.first.kod4Tanimi);
            kod5Controller = TextEditingController(text: model?.stokList?.first.kod5Tanimi);
            return SingleChildScrollView(
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: IconButton(
                            onPressed: () async {
                              var sourceType = await bottomSheetDialogManager.showBottomSheetDialog(context, title: "Kaynak tipi", children: [
                                BottomSheetModel(title: "Galeri", iconWidget: Icons.photo_library_outlined, onTap: () => Get.back(result: ImageSource.gallery)),
                                BottomSheetModel(title: "Kamera", iconWidget: Icons.camera_alt_outlined, onTap: () => Get.back(result: ImageSource.camera)),
                              ]);
                              //image picker
                              if (sourceType != null) {
                                ImagePicker picker = ImagePicker();
                                final XFile? result = await picker.pickImage(source: sourceType, imageQuality: 30);
                                if (result != null) {
                                  //!!!!!!! setState(() => image = File(result.path));
                                }
                              }
                            },
                            icon: const Icon(Icons.add)),
                      ),
                      Expanded(
                        flex: 4,
                        child: CustomTextField(
                            enabled: enable,
                            labelText: "Kodu",
                            controller: stokKoduController,
                            suffix: Wrap(
                                children: [IconButton(onPressed: () {}, icon: const Icon(Icons.add)), IconButton(onPressed: () {}, icon: const Icon(Icons.add))]
                                    .map((e) => SizedBox(width: 35, child: e))
                                    .toList())),
                      ),
                    ],
                  ),
                  CustomTextField(enabled: enable, labelText: "Adı", controller: stokAdiController),
                  CustomTextField(enabled: enable, suffix: IconButton(onPressed: () {}, icon: const Icon(Icons.more_horiz_outlined)), labelText: "Depo", controller: depoController),
                  CustomTextField(
                      enabled: enable, suffix: IconButton(onPressed: () {}, icon: const Icon(Icons.more_horiz_outlined)), labelText: "Muhasebe Detay Kodu", controller: muhasebeDetayKoduController),
                  CustomTextField(enabled: enable, suffix: IconButton(onPressed: () {}, icon: const Icon(Icons.more_horiz_outlined)), labelText: "Ölçü Birimi 1", controller: olcuBirimi1Controller),
                  CustomTextField(enabled: enable, suffix: IconButton(onPressed: () {}, icon: const Icon(Icons.more_horiz_outlined)), labelText: "Ölçü Birimi 2", controller: olcuBirimi2Controller),
                  Row(children: [
                    Expanded(child: CustomTextField(enabled: enable, labelText: "Ölçü Br.2 Pay", controller: olcuBirimi2PayController)),
                    Expanded(child: CustomTextField(enabled: enable, labelText: "Ölçü Br.2 Payda", controller: olcuBirimi2PaydaController))
                  ]),
                  CustomTextField(enabled: enable, suffix: IconButton(onPressed: () {}, icon: const Icon(Icons.more_horiz_outlined)), labelText: "Ölçü Birimi 3", controller: olcuBirimi3Controller),
                  Row(children: [
                    Expanded(child: CustomTextField(enabled: enable, labelText: "Ölçü Br.3 Pay", controller: olcuBirimi3PayController)),
                    Expanded(child: CustomTextField(enabled: enable, labelText: "Ölçü Br.3 Payda", controller: olcuBirimi3PaydaController))
                  ]),
                  CustomWidgetWithLabel(text: "Barkod", children: [
                    CustomTextField(
                      enabled: enable,
                      labelText: "Barkod 1",
                      controller: barkod1Controller,
                      suffix: Wrap(
                        children: [IconButton(onPressed: () {}, icon: const Icon(Icons.sms_failed_outlined)), IconButton(onPressed: () {}, icon: const Icon(Icons.qr_code_2_outlined))],
                      ),
                    ),
                    CustomTextField(
                      enabled: enable,
                      labelText: "Barkod 2",
                      controller: barkod2Controller,
                      suffix: Wrap(
                        children: [IconButton(onPressed: () {}, icon: const Icon(Icons.sms_failed_outlined)), IconButton(onPressed: () {}, icon: const Icon(Icons.qr_code_2_outlined))],
                      ),
                    ),
                    CustomTextField(
                      enabled: enable,
                      labelText: "Barkod 3",
                      controller: barkod3Controller,
                      suffix: Wrap(
                        children: [IconButton(onPressed: () {}, icon: const Icon(Icons.sms_failed_outlined)), IconButton(onPressed: () {}, icon: const Icon(Icons.qr_code_2_outlined))],
                      ),
                    ),
                  ]),
                  CustomWidgetWithLabel(text: "Diğer", children: [
                    CustomTextField(enabled: enable, labelText: "Şube", isMust: true, suffix: IconButton(onPressed: () {}, icon: const Icon(Icons.more_horiz_outlined))),
                  ]),
                  CustomWidgetWithLabel(text: "Rapor Kodları", children: [
                    CustomTextField(
                      enabled: enable,
                      labelText: "Üretici Kodu",
                    ),
                    Row(
                      children: [
                        Expanded(child: CustomTextField(enabled: enable, suffix: IconButton(onPressed: () {}, icon: const Icon(Icons.more_horiz_outlined)), labelText: "Grup Kodu")),
                        Expanded(child: CustomTextField(enabled: enable, suffix: IconButton(onPressed: () {}, icon: const Icon(Icons.more_horiz_outlined)), labelText: "Kod1")),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(child: CustomTextField(enabled: enable, suffix: IconButton(onPressed: () {}, icon: const Icon(Icons.more_horiz_outlined)), labelText: "Kod2")),
                        Expanded(child: CustomTextField(enabled: enable, suffix: IconButton(onPressed: () {}, icon: const Icon(Icons.more_horiz_outlined)), labelText: "Kod3")),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(child: CustomTextField(enabled: enable, suffix: IconButton(onPressed: () {}, icon: const Icon(Icons.more_horiz_outlined)), labelText: "Kod4")),
                        Expanded(child: CustomTextField(enabled: enable, suffix: IconButton(onPressed: () {}, icon: const Icon(Icons.more_horiz_outlined)), labelText: "Kod5")),
                      ],
                    ),
                  ])
                ],
              ).paddingAll(UIHelper.lowSize),
            );
          }
        });
  }

  Future<StokDetayModel> getData() async {
    GenericResponseModel result = await networkManager.dioGet<StokDetayModel>(
      path: ApiUrls.getStokDetay,
      bodyModel: StokDetayModel(),
      addCKey: true,
      addSirketBilgileri: true,
      queryParameters: {
        "stokKodu": widget.model?.model?.stokKodu ?? "",
      },
    );
    image = await networkManager.getImage(widget.model?.model?.resimUrlKucuk ?? "");
    log((result.data.first as StokDetayModel).toJson().toString());
    model = result.data.first as StokDetayModel;
    return result.data.first as StokDetayModel;
  }
}
