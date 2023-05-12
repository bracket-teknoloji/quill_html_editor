import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kartal/kartal.dart';
import 'package:picker/core/base/helpers/helper.dart';
import 'package:picker/core/base/model/generic_response_model.dart';
import 'package:picker/core/components/dialog/bottom_sheet/model/bottom_sheet_model.dart';
import 'package:picker/core/components/textfield/custom_label_widget.dart';
import 'package:picker/core/components/textfield/custom_text_field.dart';
import 'package:picker/core/constants/enum/cari_edit_enum.dart';
import 'package:picker/core/constants/extensions/widget_extensions.dart';
import 'package:picker/view/main_page/alt_sayfalar/cari/cari_listesi/model/cari_listesi_grup_kodu_model.dart';
import 'package:picker/view/main_page/alt_sayfalar/cari/cari_network_manager.dart';

import '../../../../../../../view/main_page/alt_sayfalar/cari/cari_listesi/model/cari_kosullar_model.dart';
import '../../../../../../../view/main_page/alt_sayfalar/cari/cari_listesi/model/cari_listesi_model.dart';
import '../../../../../state/base_state.dart';
import '../../base_cari_edit_genel/model/base_cari_edit_model.dart';

class CariEditDigerView extends StatefulWidget {
  final BaseCariEditModel? model;
  const CariEditDigerView({super.key, this.model});

  @override
  State<CariEditDigerView> createState() => _CariEditDigerViewState();
}

class _CariEditDigerViewState extends BaseState<CariEditDigerView> {
  final formKey = GlobalKey<FormState>();
  List<CariGrupKoduModel>? list = [];
  CariListesiModel model = CariListesiModel.instance;
  TextEditingController grupKoduController = TextEditingController(text: CariListesiModel.instance.grupKodu);
  TextEditingController kod1Controller = TextEditingController(text: CariListesiModel.instance.kod1Tanimi);
  TextEditingController kod2Controller = TextEditingController(text: CariListesiModel.instance.kod2Tanimi);
  TextEditingController kod3Controller = TextEditingController(text: CariListesiModel.instance.kod3Tanimi);
  TextEditingController kod4Controller = TextEditingController(text: CariListesiModel.instance.kod4Tanimi);
  TextEditingController kod5Controller = TextEditingController(text: CariListesiModel.instance.kod5Tanimi);
  TextEditingController bilgiController = TextEditingController(text: CariListesiModel.instance.bilgi);
  TextEditingController subeController = TextEditingController(text: CariListesiModel.instance.subeKodu.toStringIfNull);
  TextEditingController konumController = TextEditingController(text: "${CariListesiModel.instance.enlem.toStringIfNull}${CariListesiModel.instance.boylam.toStringIfNull}");
  TextEditingController kilitController = TextEditingController(text: CariListesiModel.instance.kilit);
  TextEditingController bagliCariController = TextEditingController(text: CariListesiModel.instance.bagliCariAdi);
  TextEditingController kosulKoduController = TextEditingController(text: CariListesiModel.instance.kosulKodu);
  TextEditingController aciklama1Controller = TextEditingController(text: CariListesiModel.instance.aciklama1);
  TextEditingController aciklama2Controller = TextEditingController(text: CariListesiModel.instance.aciklama2);
  TextEditingController aciklama3Controller = TextEditingController(text: CariListesiModel.instance.aciklama3);
  TextEditingController a1Controller = TextEditingController(text: CariListesiModel.instance.kull1s);
  TextEditingController a2Controller = TextEditingController(text: CariListesiModel.instance.kull2s);
  TextEditingController a3Controller = TextEditingController(text: CariListesiModel.instance.kull3s);
  TextEditingController a4Controller = TextEditingController(text: CariListesiModel.instance.kull4s);
  TextEditingController a5Controller = TextEditingController(text: CariListesiModel.instance.kull5s);
  TextEditingController a6Controller = TextEditingController(text: CariListesiModel.instance.kull6s);
  TextEditingController a7Controller = TextEditingController(text: CariListesiModel.instance.kull7s);
  TextEditingController a8Controller = TextEditingController(text: CariListesiModel.instance.kull8s);
  TextEditingController n1Controller = TextEditingController(text: CariListesiModel.instance.kull1n.toStringIfNull);
  TextEditingController n2Controller = TextEditingController(text: CariListesiModel.instance.kull2n.toStringIfNull);
  TextEditingController n3Controller = TextEditingController(text: CariListesiModel.instance.kull3n.toStringIfNull);
  TextEditingController n4Controller = TextEditingController(text: CariListesiModel.instance.kull4n.toStringIfNull);
  TextEditingController n5Controller = TextEditingController(text: CariListesiModel.instance.kull5n.toStringIfNull);
  TextEditingController n6Controller = TextEditingController(text: CariListesiModel.instance.kull6n.toStringIfNull);
  TextEditingController n7Controller = TextEditingController(text: CariListesiModel.instance.kull7n.toStringIfNull);
  TextEditingController n8Controller = TextEditingController(text: CariListesiModel.instance.kull8n.toStringIfNull);
  @override
  void initState() {
    super.initState();
    dataChecker();
  }

  @override
  void dispose() {
    super.dispose();
    grupKoduController.dispose();
    kod1Controller.dispose();
    kod2Controller.dispose();
    kod3Controller.dispose();
    kod4Controller.dispose();
    kod5Controller.dispose();
    bilgiController.dispose();
    subeController.dispose();
    konumController.dispose();
    kilitController.dispose();
    bagliCariController.dispose();
    kosulKoduController.dispose();
    aciklama1Controller.dispose();
    aciklama2Controller.dispose();
    aciklama3Controller.dispose();
    a1Controller.dispose();
    a2Controller.dispose();
    a3Controller.dispose();
    a4Controller.dispose();
    a5Controller.dispose();
    a6Controller.dispose();
    a7Controller.dispose();
    a8Controller.dispose();
    n1Controller.dispose();
    n2Controller.dispose();
    n3Controller.dispose();
    n4Controller.dispose();
    n5Controller.dispose();
    n6Controller.dispose();
    n7Controller.dispose();
    n8Controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool enabled = widget.model?.cariEditEnum != CariEditEnum.goruntule;
    return SingleChildScrollView(
      child: Form(
          key: formKey,
          child: Column(
            children: [
              Row(
                children: [
                  CustomTextField(
                    enabled: enabled,
                    readOnly: true,
                    suffix: iconSwitcher(grupKoduController),
                    labelText: "Grup Kodu",
                    controller: grupKoduController,
                    onTap: () async {
                      // ignore: use_build_context_synchronously
                      var liste = list?.where((element) => element.grupNo == 0).toList();
                      var result = await bottomSheetDialogManager.showBottomSheetDialog(context,
                          title: "GrupKodu",
                          children:
                              List.generate(liste!.length, (index) => BottomSheetModel(title: liste[index].grupAdi ?? "", value: liste[index].modul, onTap: () => Get.back(result: liste[index]))));
                      if (result != null) {
                        grupKoduController.text = result.grupAdi;

                        model.grupKodu = result.grupKodu;
                        setState(() {});
                      }
                    },
                  ),
                  CustomTextField(
                    enabled: enabled,
                    readOnly: true,
                    suffix: iconSwitcher(kod1Controller),
                    labelText: "Kod 1",
                    controller: kod1Controller,
                    onTap: () async {
                      var liste = list?.where((element) => element.grupNo == 1).toList();
                      var result = await bottomSheetDialogManager.showBottomSheetDialog(context,
                          title: "Kod 1",
                          children:
                              List.generate(liste!.length, (index) => BottomSheetModel(title: liste[index].grupAdi ?? "", value: liste[index].modul, onTap: () => Get.back(result: liste[index]))));
                      if (result != null) {
                        kod1Controller.text = result.grupAdi;
                        model.grupKodu = result.grupKodu;
                        setState(() {});
                      }
                    },
                  ),
                ],
              ).withExpanded,
              Row(
                children: [
                  CustomTextField(
                      enabled: enabled,
                      readOnly: true,
                      suffix: iconSwitcher(kod2Controller),
                      labelText: "Kod 2",
                      controller: kod2Controller,
                      onTap: () async {
                        var liste = list?.where((element) => element.grupNo == 2).toList();
                        var result = await bottomSheetDialogManager.showBottomSheetDialog(context,
                            title: "Kod 2",
                            children:
                                List.generate(liste!.length, (index) => BottomSheetModel(title: liste[index].grupAdi ?? "", value: liste[index].modul, onTap: () => Get.back(result: liste[index]))));
                        if (result != null) {
                          kod2Controller.text = result.grupAdi;
                          model.grupKodu = result.grupKodu;
                          setState(() {});
                        }
                      }),
                  CustomTextField(
                      enabled: enabled,
                      readOnly: true,
                      suffix: iconSwitcher(kod3Controller),
                      labelText: "Kod 3",
                      controller: kod3Controller,
                      onTap: () async {
                        var liste = list?.where((element) => element.grupNo == 3).toList();
                        var result = await bottomSheetDialogManager.showBottomSheetDialog(context,
                            title: "Kod 3",
                            children:
                                List.generate(liste!.length, (index) => BottomSheetModel(title: liste[index].grupAdi ?? "", value: liste[index].modul, onTap: () => Get.back(result: liste[index]))));
                        if (result != null) {
                          kod3Controller.text = result.grupAdi;
                          model.grupKodu = result.grupKodu;
                          setState(() {});
                        }
                      }),
                ],
              ).withExpanded,
              Row(
                children: [
                  CustomTextField(
                      enabled: enabled,
                      labelText: "Kod 4",
                      readOnly: true,
                      suffix: iconSwitcher(kod4Controller),
                      controller: kod4Controller,
                      onTap: () async {
                        var liste = list?.where((element) => element.grupNo == 4).toList();
                        var result = await bottomSheetDialogManager.showBottomSheetDialog(context,
                            title: "Kod 4",
                            children:
                                List.generate(liste!.length, (index) => BottomSheetModel(title: liste[index].grupAdi ?? "", value: liste[index].modul, onTap: () => Get.back(result: liste[index]))));
                        if (result != null) {
                          kod4Controller.text = result.grupAdi;
                          model.grupKodu = result.grupKodu;
                          setState(() {});
                        }
                      }),
                  CustomTextField(
                      enabled: enabled,
                      labelText: "Kod 5",
                      readOnly: true,
                      suffix: iconSwitcher(kod5Controller),
                      controller: kod5Controller,
                      onTap: () async {
                        var liste = list?.where((element) => element.grupNo == 5).toList();
                        var result = await bottomSheetDialogManager.showBottomSheetDialog(context,
                            title: "Kod 5",
                            children:
                                List.generate(liste!.length, (index) => BottomSheetModel(title: liste[index].grupAdi ?? "", value: liste[index].modul, onTap: () => Get.back(result: liste[index]))));
                        if (result != null) {
                          kod5Controller.text = result.grupAdi;
                          model.grupKodu = result.grupKodu;
                          setState(() {});
                        }
                      }),
                ],
              ).withExpanded,
              CustomTextField(enabled: enabled, labelText: "Bilgi", controller: bilgiController),
              CustomTextField(enabled: enabled, readOnly: true, suffix: iconSwitcher(subeController), isMust: true, labelText: "Şube", controller: subeController),
              CustomTextField(enabled: enabled, readOnly: true, suffix: iconSwitcher(konumController), labelText: "Konum", controller: konumController),
              CustomTextField(
                enabled: enabled,
                readOnly: true,
                suffix: iconSwitcher(kilitController),
                isMust: true,
                labelText: "Kilit",
                controller: kilitController,
                onTap: () async {
                  var result = await bottomSheetDialogManager.showBottomSheetDialog(context,
                      title: "Kilit",
                      children: List.generate(
                          2,
                          (index) => BottomSheetModel(
                              title: index == 0 ? "Kilitli" : "Kilitsiz", description: index == 0 ? "Kilitli" : "Kilitsiz", onTap: () => Get.back(result: index == 0 ? "K" : "A"))));
                },
              ),
              CustomTextField(enabled: enabled, readOnly: true, suffix: iconSwitcher(bagliCariController), labelText: "Bağlı Cari", controller: bagliCariController),
              CustomTextField(
                enabled: enabled,
                readOnly: true,
                suffix: iconSwitcher(kosulKoduController),
                labelText: "Koşul Kodu",
                controller: kosulKoduController,
                onTap: () async {
                  GenericResponseModel data = await CariNetworkManager.getkosullar();
                  // ignore: use_build_context_synchronously
                  CariKosullarModel result = await bottomSheetDialogManager.showBottomSheetDialog(context,
                      title: "Koşul Kodu",
                      children: List.generate(
                          data.data.length,
                          (index) => BottomSheetModel(
                              title: "${data.data[index].kosulKodu ?? ""} - ${data.data[index].kosulSabitAdi ?? ""}",
                              description: data.data[index].genelKosulAdi,
                              value: data.data[index].kosulKodu,
                              onTap: () => Get.back(result: data.data[index]))));
                  kosulKoduController.text = result.genelKosulAdi ?? "";
                  model.kosulKodu = result.kosulKodu;
                  setState(() {});
                },
              ),
              CustomTextField(enabled: enabled, labelText: "Açıklama 1", controller: aciklama1Controller),
              CustomTextField(enabled: enabled, labelText: "Açıklama 2", controller: aciklama2Controller),
              CustomTextField(enabled: enabled, labelText: "Açıklama 3", controller: aciklama3Controller),
              CustomWidgetWithLabel(
                text: "Kullanıcı Tanımlı Sahalar",
                children: [
                  Row(
                    children: [
                      CustomTextField(enabled: enabled, labelText: "A 1", controller: a1Controller),
                      CustomTextField(enabled: enabled, labelText: "A 2", controller: a2Controller),
                    ],
                  ).withExpanded,
                  Row(
                    children: [
                      CustomTextField(enabled: enabled, labelText: "A 3", controller: a3Controller),
                      CustomTextField(enabled: enabled, labelText: "A 4", controller: a4Controller),
                    ],
                  ).withExpanded,
                  Row(
                    children: [
                      CustomTextField(enabled: enabled, labelText: "A 5", controller: a5Controller),
                      CustomTextField(enabled: enabled, labelText: "A 6", controller: a6Controller),
                    ],
                  ).withExpanded,
                  Row(
                    children: [
                      CustomTextField(enabled: enabled, labelText: "A 7", controller: a7Controller),
                      CustomTextField(enabled: enabled, labelText: "A 8", controller: a8Controller),
                    ],
                  ).withExpanded,
                  Row(
                    children: [
                      CustomTextField(enabled: enabled, labelText: "N 1", controller: n1Controller),
                      CustomTextField(enabled: enabled, labelText: "N 2", controller: n2Controller),
                    ],
                  ).withExpanded,
                  Row(
                    children: [
                      CustomTextField(enabled: enabled, labelText: "N 3", controller: n3Controller),
                      CustomTextField(enabled: enabled, labelText: "N 4", controller: n4Controller),
                    ],
                  ).withExpanded,
                  Row(
                    children: [
                      CustomTextField(enabled: enabled, labelText: "N 5", controller: n5Controller),
                      CustomTextField(enabled: enabled, labelText: "N 6", controller: n6Controller),
                    ],
                  ).withExpanded,
                  Row(
                    children: [
                      CustomTextField(enabled: enabled, labelText: "N 7", controller: n7Controller),
                      CustomTextField(enabled: enabled, labelText: "N 8", controller: n8Controller),
                    ],
                  ).withExpanded,
                ],
              )
            ],
          )),
    );
  }

  void dataChecker() async {
    if (list.isNullOrEmpty) {
      GenericResponseModel data = await CariNetworkManager.getKod();
      list = data.data.map((e) => e as CariGrupKoduModel).toList().cast<CariGrupKoduModel>();
      debugPrint(data.toString());
    }
  }

  Widget iconSwitcher(TextEditingController? value) {
    if (value?.text == "") {
      return const Icon(Icons.more_horiz_outlined);
    } else {
      return IconButton(
          onPressed: () {
            setState(() {
              value?.clear();
            });
          },
          icon: const Icon(Icons.close));
    }
  }
}
