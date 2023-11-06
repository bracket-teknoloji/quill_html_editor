import "package:flutter/material.dart";
import "package:flutter_mobx/flutter_mobx.dart";
import "package:get/get.dart";

import "../../../../../../../../../core/base/state/base_state.dart";
import "../../../../../../../../../core/base/view/pdf_viewer/view/pdf_viewer_view.dart";
import "../../../../../../../../../core/components/textfield/custom_text_field.dart";
import "../../../../../../../../../core/constants/ui_helper/ui_helper.dart";
import "../../../../../../../core/components/dialog/bottom_sheet/model/bottom_sheet_model.dart";
import "../view_model/finansal_durum_raporu_view_model.dart";

class FinansalDurumRaporuView extends StatefulWidget {
  const FinansalDurumRaporuView({super.key});

  @override
  State<FinansalDurumRaporuView> createState() => _FinansalDurumRaporuViewState();
}

class _FinansalDurumRaporuViewState extends BaseState<FinansalDurumRaporuView> {
  FinansalDurumRaporuViewModel viewModel = FinansalDurumRaporuViewModel();
  late final TextEditingController gorunecekAlanlarController;
  @override
  void initState() {
    gorunecekAlanlarController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    gorunecekAlanlarController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => PDFViewerView(filterBottomSheet: filterBottomSheet, title: "Finansal Durum Raporu", pdfData: viewModel.pdfModel);

  Future<bool> filterBottomSheet() async {
    viewModel.resetFuture();
    await bottomSheetDialogManager.showBottomSheetDialog(
      context,
      title: "Filtrele",
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          CustomTextField(
            labelText: "Görünecek Alanlar",
            controller: gorunecekAlanlarController,
            readOnly: true,
            suffixMore: true,
            onTap: () async {
              final result = await bottomSheetDialogManager.showCheckBoxBottomSheetDialog(
                context,
                title: "Görünecek Alanlar",
                children: List.generate(
                  viewModel.gorunecekAlanlarMap.length,
                  (index) => BottomSheetModel(title: viewModel.gorunecekAlanlarMap.keys.toList()[index], value: viewModel.gorunecekAlanlarMap.entries.toList()[index]),
                ),
              );

              if (result is List) {
                final List<MapEntry<String, String>> items = result.cast<MapEntry<String, String>>();
                viewModel.changeGorunecekAlanlar(items.map((e) => e.value).join(";"));
                gorunecekAlanlarController.text = items.map((e) => e.key).join(", ");
              }
            },
          ),
          Observer(
            builder: (_) => ElevatedButton(
              onPressed: () {
                viewModel.setFuture();
                Get.back();
              },
              child: const Text("Uygula"),
            ).paddingAll(UIHelper.lowSize),
          ),
        ],
      ),
    );
    return Future.value(viewModel.futureController.value);
  }
}
