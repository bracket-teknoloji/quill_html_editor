import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get/get.dart';
import '../../../../../../../core/constants/extensions/list_extensions.dart';
import '../../../stok_liste/model/stok_listesi_model.dart';

import '../../../../../../../core/base/model/base_grup_kodu_model.dart';
import '../../../../../../../core/base/state/base_state.dart';
import '../../../../../../../core/base/view/pdf_viewer/view/pdf_viewer_view.dart';
import '../../../../../../../core/components/dialog/bottom_sheet/model/bottom_sheet_model.dart';
import '../../../../../../../core/components/textfield/custom_text_field.dart';
import '../../../../../../../core/components/helper_widgets/custom_label_widget.dart';
import '../../../../../../../core/constants/ui_helper/ui_helper.dart';
import '../view_model/lokal_depo_bakiye_raporu_view_model.dart';

class LokalDepoBakiyeRaporuView extends StatefulWidget {
  final StokListesiModel? model;
  const LokalDepoBakiyeRaporuView({super.key, this.model});

  @override
  State<LokalDepoBakiyeRaporuView> createState() => _LokalDepoBakiyeRaporuViewState();
}

class _LokalDepoBakiyeRaporuViewState extends BaseState<LokalDepoBakiyeRaporuView> {
  LokalDepoBakiyeRaporuViewModel viewModel = LokalDepoBakiyeRaporuViewModel();
  List<BaseGrupKoduModel> grupKodList = [];
  late TextEditingController stokController;
  late TextEditingController depoController;
  late TextEditingController haricStokGrupKodlariController;
  late TextEditingController haricStokKodlariController;
  late TextEditingController grupKodlariController;
  late TextEditingController kod1Controller;
  late TextEditingController kod2Controller;
  late TextEditingController kod3Controller;
  late TextEditingController kod4Controller;
  late TextEditingController kod5Controller;

  @override
  void initState() {
    stokController = TextEditingController();
    depoController = TextEditingController();
    haricStokGrupKodlariController = TextEditingController();
    haricStokKodlariController = TextEditingController();
    grupKodlariController = TextEditingController();
    kod1Controller = TextEditingController();
    kod2Controller = TextEditingController();
    kod3Controller = TextEditingController();
    kod4Controller = TextEditingController();
    kod5Controller = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    stokController.dispose();
    depoController.dispose();
    haricStokGrupKodlariController.dispose();
    haricStokKodlariController.dispose();
    grupKodlariController.dispose();
    kod1Controller.dispose();
    kod2Controller.dispose();
    kod3Controller.dispose();
    kod4Controller.dispose();
    kod5Controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PDFViewerView(filterBottomSheet: filterBottomSheet, title: "Lokal Depo Bakiye Raporu", pdfData: viewModel.pdfModel);
  }

  Future<bool> filterBottomSheet() async {
    viewModel.resetFuture();
    await bottomSheetDialogManager.showBottomSheetDialog(context,
        title: "Filtrele",
        body: Padding(
          padding: EdgeInsets.all(UIHelper.lowSize),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CustomWidgetWithLabel(
                text: "Sıfır Tutar Hariç",
                isVertical: true,
                children: [
                  Observer(builder: (_) => Switch.adaptive(value: viewModel.sifirHaricValue, onChanged: (value) => viewModel.setSifirHaric(value))),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: CustomTextField(
                      labelText: "Stok",
                      controller: stokController,
                      readOnly: true,
                      suffix: const Icon(Icons.more_horiz_outlined),
                      onTap: () async {
                        var result = await Get.toNamed("/mainPage/stokListesi", arguments: true);
                        if (result != null) {
                          stokController.text = result.stokKodu ?? "";
                          viewModel.pdfModel.dicParams?.stokKodu = result.stokKodu ?? "";
                        }
                      },
                    ),
                  ),
                  Expanded(
                      child: CustomTextField(
                    labelText: "Depo",
                    controller: depoController,
                    readOnly: true,
                    onTap: () async {
                      var result = await bottomSheetDialogManager.showBottomSheetDialog(context, title: "Depo", children: viewModel.bottomSheetList);
                      if (result != null) {
                        depoController.text = result ?? "";
                        viewModel.pdfModel.dicParams?.depoKodlari = result ?? "";
                      }
                    },
                    suffix: const Icon(Icons.more_horiz_outlined),
                  )),
                ],
              ),
              CustomTextField(
                labelText: "Hariç Stok Grup Kodları",
                controller: haricStokGrupKodlariController,
                suffix: IconButton(
                  icon: const Icon(Icons.info_outline),
                  onPressed: infoDialog,
                ),
                onChanged: (p0) => viewModel.pdfModel.dicParams?.haricStokGrupKodlari = p0,
              ),
              CustomTextField(
                labelText: "Hariç Stok Kodları",
                controller: haricStokKodlariController,
                suffix: IconButton(
                  icon: const Icon(Icons.info_outline),
                  onPressed: infoDialog,
                ),
                onChanged: (p0) => viewModel.pdfModel.dicParams?.haricStokKodlari = p0,
              ),
              Row(children: [
                Expanded(
                    child: CustomTextField(
                        labelText: "Grup Kodu",
                        controller: grupKodlariController,
                        readOnly: true,
                        suffix: const Icon(Icons.more_horiz_outlined),
                        onTap: () async => await getGrupKodu(0, grupKodlariController))),
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

  void infoDialog()=> dialogManager.showInfoDialog("Kodları noktalı Virgül (' ; ') ile ayırarak, aralarında boşluk bırakmadan yazınız.\nÖrnek: 01;02;03");

  Future<String?> getGrupKodu(int grupNo, TextEditingController? controller) async {
    if (grupKodList.isEmptyOrNull) {
      grupKodList = await networkManager.getGrupKod(name: "STOK", grupNo: -1);
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
