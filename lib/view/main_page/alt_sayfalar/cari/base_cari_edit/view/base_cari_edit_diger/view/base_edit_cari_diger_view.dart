import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get/get.dart';
import 'package:kartal/kartal.dart';

import '../../../../../../../../core/base/model/base_bottom_sheet_response_model.dart';
import '../../../../../../../../core/base/model/base_edit_model.dart';
import '../../../../../../../../core/base/model/base_grup_kodu_model.dart';
import '../../../../../../../../core/base/model/generic_response_model.dart';
import '../../../../../../../../core/base/state/base_state.dart';
import '../../../../../../../../core/components/dialog/bottom_sheet/model/bottom_sheet_model.dart';
import '../../../../../../../../core/components/widget/custom_label_widget.dart';
import '../../../../../../../../core/components/textfield/custom_text_field.dart';
import '../../../../../../../../core/constants/enum/base_edit_enum.dart';
import '../../../../../../../../core/constants/extensions/number_extensions.dart';
import '../../../../../../../../core/constants/extensions/widget_extensions.dart';
import '../../../../../../../../core/constants/static_variables/static_variables.dart';
import '../../../../../../../../core/init/cache/cache_manager.dart';
import '../../../../../../../auth/model/isletme_model.dart';
import '../../../../cari_listesi/model/cari_kosullar_model.dart';
import '../../../../cari_listesi/model/cari_listesi_model.dart';
import '../../../../cari_network_manager.dart';
import '../../base_cari_edit_genel/view/base_edit_cari_genel_view.dart';
import '../../base_cari_edit_genel/view_model/base_cari_genel_edit_view_model.dart';

class CariEditDigerView extends StatefulWidget {
  final BaseEditModel? model;
  const CariEditDigerView({super.key, this.model});

  @override
  State<CariEditDigerView> createState() => _CariEditDigerViewState();
}

class _CariEditDigerViewState extends BaseState<CariEditDigerView> {
  Map veriTabani = CacheManager.getVeriTabani();
  final cariKartiDigerFormKey = GlobalKey<FormState>();
  BaseCariGenelEditViewModel viewModel = BaseEditCariGenelViewState.viewModel;
  List<BaseGrupKoduModel>? list = [];
  List<IsletmeModel> subeList = [];
  List<CariKosullarModel> kosullarList = [];
  CariListesiModel model = CariListesiModel.instance;
  TextEditingController grupKoduController = TextEditingController(text: CariListesiModel.instance.grupKodu);
  TextEditingController kod1Controller = TextEditingController(text: CariListesiModel.instance.kod1Tanimi);
  TextEditingController kod2Controller = TextEditingController(text: CariListesiModel.instance.kod2Tanimi);
  TextEditingController kod3Controller = TextEditingController(text: CariListesiModel.instance.kod3Tanimi);
  TextEditingController kod4Controller = TextEditingController(text: CariListesiModel.instance.kod4);
  TextEditingController kod5Controller = TextEditingController(text: CariListesiModel.instance.kod5);
  TextEditingController bilgiController = TextEditingController(text: CariListesiModel.instance.bilgi);
  TextEditingController subeController = TextEditingController(text: CariListesiModel.instance.subeKodu.toStringIfNull);
  TextEditingController konumController = TextEditingController(text: "${CariListesiModel.instance.enlem.toStringIfNull ?? ""}${CariListesiModel.instance.boylam.toStringIfNull ?? ""}");
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
    StaticVariables.instance.cariKartiDigerFormKey.currentState?.activate();
    super.initState();
    dataChecker();
    subeChecker();
  }

  @override
  void deactivate() {
    StaticVariables.instance.cariKartiDigerFormKey.currentState?.deactivate();
    super.deactivate();
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
    CariListesiModel.instance.subeKodu = CariListesiModel.instance.subeKodu ?? 0;
    subeController.text = subeList.firstWhere((element) => (element).subeKodu == CariListesiModel.instance.subeKodu).subeAdi ?? "";
    log(CariListesiModel.instance.subeKodu.toStringIfNull ?? "");
    bool enabled = widget.model?.baseEditEnum != BaseEditEnum.goruntule;
    return SingleChildScrollView(
      child: Form(
          key: StaticVariables.instance.cariKartiDigerFormKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
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
                          aramaVarMi: true,
                          title: "GrupKodu",
                          children:
                              List.generate(liste!.length, (index) => BottomSheetModel(title: liste[index].grupAdi ?? "", value: liste[index].modul, onTap: () => Get.back(result: liste[index]))));
                      if (result != null) {
                        grupKoduController.text = result.grupAdi;

                        viewModel.changeModel(model..grupKodu = result.grupKodu);
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
                          aramaVarMi: true,
                          title: "Kod 1",
                          children:
                              List.generate(liste!.length, (index) => BottomSheetModel(title: liste[index].grupAdi ?? "", value: liste[index].modul, onTap: () => Get.back(result: liste[index]))));
                      if (result != null) {
                        kod1Controller.text = result.grupAdi;
                        viewModel.changeModel(model..kod1 = result.grupKodu);
                      }
                    },
                  ),
                ],
              ).withExpanded,
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
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
                            aramaVarMi: true,
                            title: "Kod 2",
                            children:
                                List.generate(liste!.length, (index) => BottomSheetModel(title: liste[index].grupAdi ?? "", value: liste[index].modul, onTap: () => Get.back(result: liste[index]))));
                        if (result != null) {
                          kod2Controller.text = result.grupAdi;
                          viewModel.changeModel(model..kod2 = result.grupKodu);
                        }
                      }),
                  CustomTextField(
                      enabled: enabled,
                      readOnly: true,
                      suffix: iconSwitcher(kod3Controller),
                      labelText: "Kod 3",
                      controller: kod3Controller,
                      onTap: () async {
                        List<BaseGrupKoduModel>? liste = list?.where((element) => element.grupNo == 3).toList();
                        var result = await bottomSheetDialogManager.showBottomSheetDialog(context,
                            aramaVarMi: true,
                            title: "Kod 3",
                            children:
                                List.generate(liste!.length, (index) => BottomSheetModel(title: liste[index].grupAdi ?? "", value: liste[index].modul, onTap: () => Get.back(result: liste[index]))));
                        if (result != null) {
                          kod3Controller.text = result.grupAdi;
                          viewModel.changeModel(model..kod3 = result.grupKodu);
                        }
                      }),
                ],
              ).withExpanded,
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
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
                            aramaVarMi: true,
                            title: "Kod 4",
                            children:
                                List.generate(liste!.length, (index) => BottomSheetModel(title: liste[index].grupAdi ?? "", value: liste[index].modul, onTap: () => Get.back(result: liste[index]))));
                        if (result != null) {
                          kod4Controller.text = result.grupAdi;
                          model.kod4 = result.grupKodu;
                          viewModel.changeModel(model);
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
                            aramaVarMi: true,
                            title: "Kod 5",
                            children:
                                List.generate(liste!.length, (index) => BottomSheetModel(title: liste[index].grupAdi ?? "", value: liste[index].modul, onTap: () => Get.back(result: liste[index]))));
                        if (result != null) {
                          kod5Controller.text = result.grupAdi;
                          model.kod5 = result.grupKodu;
                          viewModel.changeModel(model);
                        }
                      }),
                ],
              ).withExpanded,
              CustomTextField(enabled: enabled, labelText: "Bilgi", controller: bilgiController),
              CustomTextField(
                  enabled: (enabled && subeList.firstWhere((element) => element.subeKodu == veriTabani["Şube"]).merkezmi == "E") || widget.model?.baseEditEnum == BaseEditEnum.ekle,
                  readOnly: true,
                  suffix: iconSwitcher(subeController),
                  isMust: true,
                  labelText: "Şube",
                  valueText: (model.subeKodu.toStringIfNull).toString(),
                  controller: subeController,
                  onTap: () async {
                    var children2 = List.generate(
                        subeList.length, (index) => BottomSheetModel(title: subeList[index].subeAdi ?? "", description: subeList[index].subeAdi ?? "", onTap: () => Get.back(result: subeList[index])));
                    IsletmeModel? result = await bottomSheetDialogManager.showRadioBottomSheetDialog(context, title: "Şube", children: children2);
                    if (result != null) {
                      subeController.text = result.subeAdi ?? "";
                      model.subeKodu = result.subeKodu ?? 0;
                      viewModel.changeModel(model);
                      setState(() {});
                    }
                  }),
              CustomTextField(enabled: enabled, readOnly: true, suffix: iconSwitcher(konumController), labelText: "Konum", controller: konumController),
              CustomTextField(
                enabled: enabled,
                readOnly: true,
                suffix: iconSwitcher(kilitController),
                isMust: true,
                labelText: "Kilit",
                valueText: model.kilit ?? "",
                controller: kilitController,
                onTap: () async {
                  BaseBottomSheetResponseModel? result = await bottomSheetDialogManager.showBottomSheetDialog(context, title: "Kilit", children: [
                    BottomSheetModel(title: "Kilitli Değil", onTap: () => Get.back(result: BaseBottomSheetResponseModel(title: "Kilitli Değil", value: "H"))),
                    BottomSheetModel(title: "Kilitli (Fatura)", onTap: () => Get.back(result: BaseBottomSheetResponseModel(title: "Kilitli (Fatura)", value: "F"))),
                    BottomSheetModel(title: "Kilitli (Tüm İşlemler)", onTap: () => Get.back(result: BaseBottomSheetResponseModel(title: "Kilitli (Tüm İşlemler)", value: "T"))),
                  ]);
                  if (result != null) {
                    kilitController.text = result.title ?? "";
                    model.kilit = result.value ?? "";
                    viewModel.changeModel(model);
                  }
                },
              ),
              Observer(builder: (_) {
                return CustomTextField(
                  enabled: enabled,
                  readOnly: true,
                  suffix: iconSwitcher(bagliCariController),
                  labelText: "Bağlı Cari",
                  valueText: model.bagliCari ?? "",
                  controller: bagliCariController,
                  onTap: () async {
                    var result = await Get.toNamed("/mainPage/cariListesi", arguments: true);
                    if (result != null) {
                      bagliCariController.text = result.cariAdi ?? "";
                      model.bagliCari = result.cariKodu ?? 0;
                      viewModel.changeModel(model);
                      setState(() {});
                    }
                  },
                );
              }),
              CustomTextField(
                enabled: enabled,
                readOnly: true,
                suffix: iconSwitcher(kosulKoduController),
                labelText: "Koşul Kodu",
                valueText: model.kosulKodu ?? "",
                controller: kosulKoduController,
                onTap: () async {
                  if (kosullarList.isNullOrEmpty) {
                    GenericResponseModel data = await CariNetworkManager.getkosullar();
                    kosullarList = data.data.map((e) => e as CariKosullarModel).toList().cast<CariKosullarModel>();
                  }
                  // ignore: use_build_context_synchronously
                  CariKosullarModel? result = await bottomSheetDialogManager.showBottomSheetDialog(context,
                      aramaVarMi: true,
                      title: "Koşul Kodu",
                      children: List.generate(
                          kosullarList.length,
                          (index) => BottomSheetModel(
                              title: "${kosullarList[index].kosulKodu ?? " "} - ${kosullarList[index].kosulSabitAdi ?? " "}",
                              description: kosullarList[index].genelKosulAdi,
                              value: kosullarList[index].kosulKodu,
                              onTap: () => Get.back(result: kosullarList[index]))));
                  if (result != null) {
                    kosulKoduController.text = "${result.kosulKodu ?? ""} - ${result.kosulSabitAdi ?? ""}";
                    CariListesiModel.instance.bagliCariAdi = result.kosulSabitAdi ?? "";
                    model.kosulKodu = result.kosulKodu ?? "";
                    viewModel.changeModel(model);
                  }
                },
              ),
              CustomTextField(
                  enabled: enabled,
                  labelText: "Açıklama 1",
                  controller: aciklama1Controller,
                  onChanged: (p0) {
                    model.aciklama1 = p0;
                    viewModel.changeModel(model);
                  }),
              CustomTextField(
                  enabled: enabled,
                  labelText: "Açıklama 2",
                  controller: aciklama2Controller,
                  onChanged: (p0) {
                    model.aciklama2 = p0;
                    viewModel.changeModel(model);
                  }),
              CustomTextField(
                  enabled: enabled,
                  labelText: "Açıklama 3",
                  controller: aciklama3Controller,
                  onChanged: (p0) {
                    model.aciklama3 = p0;
                    viewModel.changeModel(model);
                  }),
              CustomWidgetWithLabel(
                text: "Kullanıcı Tanımlı Sahalar",
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomTextField(
                          enabled: enabled,
                          labelText: "A 1",
                          controller: a1Controller,
                          onChanged: (p0) {
                            model.kull1s = p0;
                            viewModel.changeModel(model);
                          }),
                      CustomTextField(
                          enabled: enabled,
                          labelText: "A 2",
                          controller: a2Controller,
                          onChanged: (p0) {
                            model.kull2s = p0;
                            viewModel.changeModel(model);
                          }),
                    ],
                  ).withExpanded,
                  Row(
                    children: [
                      CustomTextField(
                          enabled: enabled,
                          labelText: "A 3",
                          controller: a3Controller,
                          onChanged: (p0) {
                            model.kull3s = p0;
                            viewModel.changeModel(model);
                          }),
                      CustomTextField(
                          enabled: enabled,
                          labelText: "A 4",
                          controller: a4Controller,
                          onChanged: (p0) {
                            model.kull4s = p0;
                            viewModel.changeModel(model);
                          }),
                    ],
                  ).withExpanded,
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomTextField(
                          enabled: enabled,
                          labelText: "A 5",
                          controller: a5Controller,
                          onChanged: (p0) {
                            model.kull5s = p0;
                            viewModel.changeModel(model);
                          }),
                      CustomTextField(
                          enabled: enabled,
                          labelText: "A 6",
                          controller: a6Controller,
                          onChanged: (p0) {
                            model.kull6s = p0;
                            viewModel.changeModel(model);
                          }),
                    ],
                  ).withExpanded,
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomTextField(
                          enabled: enabled,
                          labelText: "A 7",
                          controller: a7Controller,
                          onChanged: (p0) {
                            model.kull7s = p0;
                            viewModel.changeModel(model);
                          }),
                      CustomTextField(
                          enabled: enabled,
                          labelText: "A 8",
                          controller: a8Controller,
                          onChanged: (p0) {
                            model.kull8s = p0;
                            viewModel.changeModel(model);
                          }),
                    ],
                  ).withExpanded,
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomTextField(
                          enabled: enabled,
                          labelText: "N 1",
                          keyboardType: TextInputType.number,
                          controller: n1Controller,
                          onChanged: (p0) {
                            model.kull1n = double.tryParse(p0);
                            viewModel.changeModel(model);
                          }),
                      CustomTextField(
                          enabled: enabled,
                          labelText: "N 2",
                          keyboardType: TextInputType.number,
                          controller: n2Controller,
                          onChanged: (p0) {
                            model.kull2n = double.tryParse(p0);
                            viewModel.changeModel(model);
                          }),
                    ],
                  ).withExpanded,
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomTextField(
                          enabled: enabled,
                          labelText: "N 3",
                          keyboardType: TextInputType.number,
                          controller: n3Controller,
                          onChanged: (p0) {
                            model.kull3n = double.tryParse(p0);
                            viewModel.changeModel(model);
                          }),
                      CustomTextField(
                          enabled: enabled,
                          labelText: "N 4",
                          keyboardType: TextInputType.number,
                          controller: n4Controller,
                          onChanged: (p0) {
                            model.kull4n = double.tryParse(p0);
                            viewModel.changeModel(model);
                          }),
                    ],
                  ).withExpanded,
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomTextField(
                          enabled: enabled,
                          labelText: "N 5",
                          keyboardType: TextInputType.number,
                          controller: n5Controller,
                          onChanged: (p0) {
                            model.kull5n = double.tryParse(p0);
                            viewModel.changeModel(model);
                          }),
                      CustomTextField(
                          enabled: enabled,
                          labelText: "N 6",
                          keyboardType: TextInputType.number,
                          controller: n6Controller,
                          onChanged: (p0) {
                            model.kull6n = double.tryParse(p0);
                            viewModel.changeModel(model);
                          }),
                    ],
                  ).withExpanded,
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomTextField(
                          enabled: enabled,
                          labelText: "N 7",
                          keyboardType: TextInputType.number,
                          controller: n7Controller,
                          onChanged: (p0) {
                            model.kull7n = double.tryParse(p0);
                            viewModel.changeModel(model);
                          }),
                      CustomTextField(
                          enabled: enabled,
                          labelText: "N 8",
                          keyboardType: TextInputType.number,
                          controller: n8Controller,
                          onChanged: (p0) {
                            model.kull8n = double.tryParse(p0);
                            viewModel.changeModel(model);
                          }),
                    ],
                  ).withExpanded,
                ],
              )
            ],
          )),
    );
  }

  void dataChecker() async {
    if (list.isNullOrEmpty && StaticVariables.grupKodlari.isNullOrEmpty) {
      GenericResponseModel data = await CariNetworkManager.getKod();
      list = data.data.map((e) => e as BaseGrupKoduModel).toList().cast<BaseGrupKoduModel>();
      if (list != null) {
        StaticVariables.grupKodlari = list!;
      }
      debugPrint(data.toString());
    }
    list = StaticVariables.grupKodlari;
  }

  void subeChecker() {
    List result = CacheManager.getSubeListesi();
    if (result.any((element) => element.subeKodu != -1)) {
      result.insert(0, IsletmeModel(subeKodu: -1, subeAdi: "Şubelerde Ortak"));
    }
    subeList = result.map((e) => e as IsletmeModel).toList().cast<IsletmeModel>();
  }

  Widget iconSwitcher(TextEditingController? value) {
    if (value?.text == "") {
      return const Icon(Icons.more_horiz_outlined);
    } else {
      return IconButton(
          onPressed: () {
            setState(() {
              value?.text = "";
            });
          },
          icon: const Icon(Icons.close));
    }
  }
}
