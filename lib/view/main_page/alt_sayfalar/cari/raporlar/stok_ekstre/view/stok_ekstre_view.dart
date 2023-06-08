import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get/get.dart';
import 'package:picker/core/base/view/pdf_viewer/view/pdf_viewer_view.dart';
import 'package:picker/view/main_page/alt_sayfalar/cari/raporlar/stok_ekstre/view_model/stok_ekstre_view_model.dart';

import '../../../../../../../core/base/state/base_state.dart';
import '../../../../../../../core/components/list_view/rapor_filtre_date_time_bottom_sheet/view/rapor_filtre_date_time_bottom_sheet_view.dart';
import '../../../../../../../core/components/textfield/custom_text_field.dart';
import '../../../../../../../core/constants/ui_helper/ui_helper.dart';

class StokEkstreView extends StatefulWidget {
  const StokEkstreView({super.key});

  @override
  State<StokEkstreView> createState() => _StokEkstreViewState();
}

class _StokEkstreViewState extends BaseState<StokEkstreView> {
  StokEkstreViewModel viewModel = StokEkstreViewModel();
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
    return PDFViewerView(filterBottomSheet: filterBottomSheet, title: "Stok Ekstre", pdfData: viewModel.pdfModel);
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
              RaporFiltreDateTimeBottomSheetView(
                filterOnChanged: filterOnChanged,
                baslangicTarihiController: baslangicTarihiController,
                bitisTarihiController: bitisTarihiController,
              ),
              CustomTextField(
                labelText: "Cari",
                controller: cariController,
                isMust: true,
                readOnly: true,
                suffix: const Icon(Icons.more_horiz_outlined),
                onTap: () async {
                  var result = await Get.toNamed("/mainPage/cariListesi", arguments: true);
                  if (result != null) {
                    cariController!.text = result.cariAdi ?? "";
                    viewModel.changeCariKodu(result.cariKodu ?? "");
                  }
                },
              ),
              Observer(builder: (_) {
                return ElevatedButton(
                    onPressed: () {
                      if (viewModel.pdfModel.dicParams?.cariKodu == null) {
                        dialogManager.showAlertDialog("Lütfen tüm alanları doldurunuz");
                      } else {
                        viewModel.pdfModel.dicParams?.bastar = baslangicTarihiController.text != "" ? baslangicTarihiController.text : null;
                        viewModel.pdfModel.dicParams?.bittar = bitisTarihiController.text != "" ? bitisTarihiController.text : null;
                        viewModel.setFuture();
                        Get.back();
                      }
                    },
                    child: const Text("Uygula"));
              })
            ],
          ),
        ));
    return Future.value(viewModel.futureController.value);
  }

  void filterOnChanged(index) {
    viewModel.pdfModel.dicParams?.bastar = baslangicTarihiController.text;
    viewModel.pdfModel.dicParams?.bittar = bitisTarihiController.text;
  }
}
