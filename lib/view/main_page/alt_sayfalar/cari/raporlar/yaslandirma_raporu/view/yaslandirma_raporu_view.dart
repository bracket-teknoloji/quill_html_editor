import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get/get.dart';
import 'package:picker/core/base/view/pdf_viewer/view/pdf_viewer_view.dart';

import '../../../../../../../core/base/state/base_state.dart';
import '../../../../../../../core/components/list_view/rapor_filtre_date_time_bottom_sheet/view/rapor_filtre_date_time_bottom_sheet_view.dart';
import '../../../../../../../core/components/textfield/custom_text_field.dart';
import '../../../../../../../core/constants/ui_helper/ui_helper.dart';
import '../view_model/yaslandirma_raporu_view_model.dart';

class YaslandirmaRaporuView extends StatefulWidget {
  const YaslandirmaRaporuView({super.key});

  @override
  State<YaslandirmaRaporuView> createState() => _YaslandirmaRaporuViewState();
}

class _YaslandirmaRaporuViewState extends BaseState<YaslandirmaRaporuView> {
  YaslandirmaRaporuViewModel viewModel = YaslandirmaRaporuViewModel();
  TextEditingController? cariController;
  late TextEditingController baslangicTarihiController;
  late TextEditingController bitisTarihiController;

  @override
  void initState() {
    cariController = TextEditingController();
    baslangicTarihiController = TextEditingController();
    bitisTarihiController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    cariController?.dispose();
    baslangicTarihiController.dispose();
    bitisTarihiController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return PDFViewerView(filterBottomSheet: filterBottomSheet, title: "Yaşlandırma Raporu", pdfData: viewModel.pdfModel);
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
              
            ],
          ),
        ));
    return Future.value(viewModel.futureController.value);
  
  }void filterOnChanged(index) {
    viewModel.pdfModel.dicParams?.bastar = baslangicTarihiController.text;
    viewModel.pdfModel.dicParams?.bittar = bitisTarihiController.text;
  }
}