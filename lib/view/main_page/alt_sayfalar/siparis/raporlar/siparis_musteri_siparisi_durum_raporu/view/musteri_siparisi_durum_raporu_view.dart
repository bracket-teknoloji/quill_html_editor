import "package:flutter/material.dart";

import "../../../../../../../core/base/state/base_state.dart";
import "../../../../../../../core/base/view/pdf_viewer/view/pdf_viewer_view.dart";
import "../../../base_siparis_edit/model/base_siparis_edit_model.dart";
import "../view_model/musteri_siparisi_durum_raporu_view_model.dart";

class MusteriSiparisiDurumRaporuView extends StatefulWidget {
  final BaseSiparisEditModel? model;
  const MusteriSiparisiDurumRaporuView({super.key, this.model});

  @override
  State<MusteriSiparisiDurumRaporuView> createState() => _YaslandirmaRaporuViewState();
}

class _YaslandirmaRaporuViewState extends BaseState<MusteriSiparisiDurumRaporuView> {
  MusteriSiparisiDurumRaporuViewModel viewModel = MusteriSiparisiDurumRaporuViewModel();

  @override
  Widget build(BuildContext context) {
    return PDFViewerView(filterBottomSheet: filterBottomSheet, title: "Müşteri Sipariş Durum Raporu", pdfData: viewModel.pdfModel);
  }

  Future<bool> filterBottomSheet() async {
    viewModel.resetFuture();
    await bottomSheetDialogManager.showBottomSheetDialog(context, title: "Filtrele", body: const Text(""));
    return Future.value(viewModel.futureController.value);
  }

  Future<String?> getGrupKodu(int grupNo, TextEditingController? controller) async {
    var result = await bottomSheetDialogManager.showBottomSheetDialog(context, title: "Grup Kodu", children: []);
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

  void filterOnChanged(index) {}
}
