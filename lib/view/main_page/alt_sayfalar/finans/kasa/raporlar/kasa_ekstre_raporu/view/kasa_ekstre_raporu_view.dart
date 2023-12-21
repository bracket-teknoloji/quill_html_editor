import "package:flutter/material.dart";
import "package:get/get.dart";

import "../../../../../../../../core/base/state/base_state.dart";
import "../../../../../../../../core/base/view/pdf_viewer/view/pdf_viewer_view.dart";
import "../../../../../../../../core/components/dialog/bottom_sheet/model/bottom_sheet_model.dart";
import "../../../../../../../../core/components/list_view/rapor_filtre_date_time_bottom_sheet/view/rapor_filtre_date_time_bottom_sheet_view.dart";
import "../../../../../../../../core/components/textfield/custom_text_field.dart";
import "../../../../../../../../core/constants/ui_helper/ui_helper.dart";
import "../../../../../../model/param_model.dart";
import "../view_model/kasa_ekstre_raporu_view_model.dart";

class KasaEkstreRaporuView extends StatefulWidget {
  const KasaEkstreRaporuView({super.key});

  @override
  State<KasaEkstreRaporuView> createState() => _KasaEkstreRaporuViewState();
}

class _KasaEkstreRaporuViewState extends BaseState<KasaEkstreRaporuView> {
  KasaEkstreRaporuViewModel viewModel = KasaEkstreRaporuViewModel();
  late final TextEditingController baslangicController;
  late final TextEditingController bitisController;
  late final TextEditingController kasaKoduController;

  @override
  void initState() {
    baslangicController = TextEditingController();
    bitisController = TextEditingController();
    kasaKoduController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    baslangicController.dispose();
    bitisController.dispose();
    kasaKoduController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => PDFViewerView(filterBottomSheet: filterBottomSheet, title: "Kasa Ekstre Raporu", pdfData: viewModel.pdfModel);

  Future<bool> filterBottomSheet() async {
    viewModel.resetFuture();
    await bottomSheetDialogManager.showBottomSheetDialog(
      context,
      title: loc(context).generalStrings.filter,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          RaporFiltreDateTimeBottomSheetView(
            filterOnChanged: (int? index) {
              viewModel.setBastar(baslangicController.text);
              viewModel.setBittar(bitisController.text);
            },
            baslangicTarihiController: baslangicController,
            bitisTarihiController: bitisController,
          ),
          CustomTextField(
            controller: kasaKoduController,
            readOnly: true,
            isMust: true,
            suffixMore: true,
            labelText: "Kasa Kodu",
            onTap: () async {
              final List<KasaList>? kasaList = parametreModel.kasaList;
              final result = await bottomSheetDialogManager.showBottomSheetDialog(
                context,
                title: "Kasa Seçiniz",
                children: List.generate(kasaList?.length ?? 0, (index) => BottomSheetModel(title: kasaList?[index].kasaTanimi ?? "", value: kasaList?[index])),
              );
              if (result is KasaList) {
                viewModel.setKasaKodu(result.kasaKodu);
                kasaKoduController.text = result.kasaTanimi ?? "";
              }
            },
          ),
          ElevatedButton(
            onPressed: () {
              if (viewModel.pdfModel.dicParams?.kasaKodu == null) {
                dialogManager.showAlertDialog("Lütfen tüm alanları doldurunuz");
              } else {
                viewModel.setFuture();
                Get.back();
              }
            },
            child: const Text("Uygula"),
          ).paddingAll(UIHelper.lowSize),
        ],
      ),
    );
    return Future.value(viewModel.futureController.value);
  }
}
