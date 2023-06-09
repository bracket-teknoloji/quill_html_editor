import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get/get.dart';
import 'package:picker/core/components/slide_controller/view/slide_controller_view.dart';
import 'package:picker/core/constants/extensions/list_extensions.dart';

import '../../../../../../../core/base/model/base_grup_kodu_model.dart';
import '../../../../../../../core/base/state/base_state.dart';
import '../../../../../../../core/base/view/pdf_viewer/view/pdf_viewer_view.dart';
import '../../../../../../../core/components/dialog/bottom_sheet/model/bottom_sheet_model.dart';
import '../../../../../../../core/components/textfield/custom_text_field.dart';
import '../../../../../../../core/constants/ui_helper/ui_helper.dart';
import '../../../../../../../core/init/cache/cache_manager.dart';
import '../../../../../model/param_model.dart';
import '../view_model/doviz_bakiye_raporu_view_model.dart';

class DovizBakiyeRaporuView extends StatefulWidget {
  const DovizBakiyeRaporuView({super.key});

  @override
  State<DovizBakiyeRaporuView> createState() => _DovizBakiyeRaporuViewState();
}

class _DovizBakiyeRaporuViewState extends BaseState<DovizBakiyeRaporuView> {
  DovizBakiyeRaporuViewModel viewModel = DovizBakiyeRaporuViewModel();
  List<BaseGrupKoduModel> grupKodList = [];
  late TextEditingController cariController;
  late TextEditingController plasiyerController;
  late TextEditingController siralaController;
  late TextEditingController grupKoduController;
  late TextEditingController kod1Controller;
  late TextEditingController kod2Controller;
  late TextEditingController kod3Controller;
  late TextEditingController kod4Controller;
  late TextEditingController kod5Controller;

  @override
  void initState() {
    cariController = TextEditingController();
    plasiyerController = TextEditingController();
    siralaController = TextEditingController(text: viewModel.siralaBottomSheetList.first.title);
    grupKoduController = TextEditingController();
    kod1Controller = TextEditingController();
    kod2Controller = TextEditingController();
    kod3Controller = TextEditingController();
    kod4Controller = TextEditingController();
    kod5Controller = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    cariController.dispose();
    plasiyerController.dispose();
    siralaController.dispose();
    grupKoduController.dispose();
    kod1Controller.dispose();
    kod2Controller.dispose();
    kod3Controller.dispose();
    kod4Controller.dispose();
    kod5Controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PDFViewerView(filterBottomSheet: filterBottomSheet, title: "Döviz Bakiye Raporu", pdfData: viewModel.pdfModel);
  }

  Future<bool> filterBottomSheet() async {
    {
      viewModel.resetFuture();
      await bottomSheetDialogManager.showBottomSheetDialog(context,
          title: "Filtrele",
          body: Padding(
            padding: EdgeInsets.all(UIHelper.lowSize),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Observer(builder: (_) {
                  return SlideControllerView(
                      childrenTitleList: viewModel.bakiyeDurumuTitleList,
                      filterOnChanged: (index) => viewModel.changeBakiyeDurumu(index),
                      childrenValueList: viewModel.bakiyeDurumuValueList,
                      groupValue: viewModel.bakiyeDurumuGroupValue);
                }),
                CustomTextField(
                  labelText: "Cari",
                  controller: cariController,
                  readOnly: true,
                  suffix: const Icon(Icons.more_horiz_outlined),
                  onTap: () async {
                    var result = await Get.toNamed("/mainPage/cariListesi", arguments: true);
                    if (result != null) {
                      viewModel.pdfModel.dicParams?.cariKodu = result;
                      cariController.text = result;
                    }
                  },
                ),
                Row(
                  children: [
                    Expanded(
                        child: CustomTextField(
                      labelText: "Plasiyer",
                      controller: plasiyerController,
                      readOnly: true,
                      onTap: () async {
                        List<PlasiyerList>? plasiyerList = CacheManager.getAnaVeri()?.paramModel?.plasiyerList;
                        if (plasiyerList != null) {
                          PlasiyerList? result = await bottomSheetDialogManager.showBottomSheetDialog(context,
                              title: "Plasiyer",
                              children: plasiyerList.map((e) => BottomSheetModel(title: e.plasiyerAciklama ?? "", value: e.plasiyerKodu ?? "", onTap: () => Get.back(result: e))).toList());
                          if (result != null) {
                            plasiyerController.text = result.plasiyerAciklama ?? "";
                            viewModel.pdfModel.dicParams?.plasiyerKodu = result.plasiyerKodu ?? "";
                          }
                        }
                      },
                      suffix: const Icon(Icons.more_horiz_outlined),
                    )),
                    Expanded(
                        child: CustomTextField(
                            labelText: "Sırala",
                            controller: siralaController,
                            readOnly: true,
                            suffix: const Icon(Icons.more_horiz_outlined),
                            onTap: () async {
                              String? result = await bottomSheetDialogManager.showBottomSheetDialog(context, title: "Sırala", children: viewModel.siralaBottomSheetList);
                              if (result != null) {
                                siralaController.text = result;
                                viewModel.pdfModel.dicParams?.sirala = result;
                              }
                            })),
                  ],
                ),
                Row(children: [
                  Expanded(
                      child: CustomTextField(
                          labelText: "Grup Kodu",
                          controller: grupKoduController,
                          readOnly: true,
                          suffix: const Icon(Icons.more_horiz_outlined),
                          onTap: () async => await getGrupKodu(0, grupKoduController))),
                  Expanded(
                      child: CustomTextField(
                          labelText: "Kod 1", controller: kod1Controller, readOnly: true, suffix: const Icon(Icons.more_horiz_outlined), onTap: () async => await getGrupKodu(1, kod1Controller)))
                ]),
                Row(children: [
                  Expanded(
                      child: CustomTextField(
                          labelText: "Kod 2", controller: kod2Controller, readOnly: true, suffix: const Icon(Icons.more_horiz_outlined), onTap: () async => await getGrupKodu(2, kod2Controller))),
                  Expanded(
                      child: CustomTextField(
                          labelText: "Kod 3", controller: kod3Controller, readOnly: true, suffix: const Icon(Icons.more_horiz_outlined), onTap: () async => await getGrupKodu(3, kod3Controller)))
                ]),
                Row(children: [
                  Expanded(
                      child: CustomTextField(
                          labelText: "Kod 4", controller: kod4Controller, readOnly: true, suffix: const Icon(Icons.more_horiz_outlined), onTap: () async => await getGrupKodu(4, kod4Controller))),
                  Expanded(
                      child: CustomTextField(
                          labelText: "Kod 5", controller: kod5Controller, readOnly: true, suffix: const Icon(Icons.more_horiz_outlined), onTap: () async => await getGrupKodu(5, kod5Controller)))
                ]),
                Observer(builder: (_) {
                  return ElevatedButton(
                      onPressed: () {
                        viewModel.setFuture();
                        Get.back();
                      },
                      child: const Text("Uygula"));
                })
              ],
            ),
          ));
      return Future.value(viewModel.futureController.value);
    }
  }
  
  Future<String?> getGrupKodu(int grupNo, TextEditingController? controller) async {
    if (grupKodList.isEmptyOrNull) {
      grupKodList = await networkManager.getGrupKod(name: "CARI", grupNo: -1);
    }
    List<BottomSheetModel>? bottomSheetList = grupKodList
        .where((e) => e.grupNo == grupNo)
        .toList()
        .cast<BaseGrupKoduModel>()
        .map((e) => BottomSheetModel(title: e.grupKodu ?? "", onTap: () => Get.back(result: e)))
        .toList()
        .cast<BottomSheetModel>();
    // ignore: use_build_context_synchronously
    var result = await bottomSheetDialogManager.showBottomSheetDialog(context, title: "Grup Kodu", children: bottomSheetList);
    if (result != null) {
      controller?.text = result.grupKodu ?? "";
      switch (grupNo) {
        case 0:
          viewModel.pdfModel.dicParams?.grupKodu = result.grupKodu ?? "";
          break;
        case 1:
          viewModel.pdfModel.dicParams?.kod1 = result.grupKodu ?? "";
          break;
        case 2:
          viewModel.pdfModel.dicParams?.kod2 = result.grupKodu ?? "";
          break;
        case 3:
          viewModel.pdfModel.dicParams?.kod3 = result.grupKodu ?? "";
          break;
        case 4:
          viewModel.pdfModel.dicParams?.kod4 = result.grupKodu ?? "";
          break;
        case 5:
          viewModel.pdfModel.dicParams?.kod5 = result.grupKodu ?? "";
          break;
      }
    }
    return null;
  }
}
