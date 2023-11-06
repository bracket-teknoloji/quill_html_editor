import "package:flutter/material.dart";

import "../../../../../../../core/base/state/base_state.dart";
import "../../../../../../../core/base/view/pdf_viewer/view/pdf_viewer_view.dart";
import "../../../../../../../core/components/textfield/custom_text_field.dart";
import "../../../../../../../core/constants/ui_helper/ui_helper.dart";
import "../../../base_siparis_edit/model/base_siparis_edit_model.dart";
import "../../siparis_stok_ihtiyac_raporu/view_model/stok_ihtiyac_raporu_view_model.dart";

class StokIhtiyacRaporu extends StatefulWidget {
  final BaseSiparisEditModel? model;
  const StokIhtiyacRaporu({super.key, this.model});

  @override
  State<StokIhtiyacRaporu> createState() => _StokIhtiyacRaporuViewState();
}

class _StokIhtiyacRaporuViewState extends BaseState<StokIhtiyacRaporu> {
  late final StokIhtiyacRaporuViewModel viewModel;
  late final TextEditingController belgeNoController;
  late final TextEditingController cariController;
  late final TextEditingController vergiNoController;
  late final TextEditingController plasiyerController;
  late final TextEditingController maliyetTipiController;
  late final TextEditingController haricStokGrupKodlariController;
  late final TextEditingController baslangicTarihiController;
  late final TextEditingController bitisTarihiController;

  //create a form key
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    viewModel = StokIhtiyacRaporuViewModel();
    belgeNoController = TextEditingController();
    cariController = TextEditingController();
    vergiNoController = TextEditingController();
    plasiyerController = TextEditingController();
    maliyetTipiController = TextEditingController();
    haricStokGrupKodlariController = TextEditingController();
    baslangicTarihiController = TextEditingController();
    bitisTarihiController = TextEditingController();
    if (widget.model != null) {
      cariController.text = widget.model?.cariAdi ?? "";
      viewModel.setCariKodu(widget.model?.cariKodu ?? "");
      belgeNoController.text = widget.model?.belgeNo ?? "";
      viewModel.setBelgeNo(widget.model?.belgeNo ?? "");
    }
    super.initState();
  }

  @override
  void dispose() {
    belgeNoController.dispose();
    cariController.dispose();
    vergiNoController.dispose();
    plasiyerController.dispose();
    maliyetTipiController.dispose();
    haricStokGrupKodlariController.dispose();
    baslangicTarihiController.dispose();
    bitisTarihiController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => PDFViewerView(
        filterBottomSheet: filterBottomSheet,
        title: "Stok İhtiyaç Raporu",
        pdfData: viewModel.pdfModel,
      );

  Future<bool> filterBottomSheet() async {
    viewModel.resetFuture();
    await bottomSheetDialogManager.showBottomSheetDialog(
      context,
      title: "Filtrele",
      body: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Row(
              children: [
                Expanded(child: CustomTextField()),
                Expanded(child: CustomTextField()),
              ],
            ),
            const Row(
              children: [
                Expanded(child: CustomTextField()),
                Expanded(child: CustomTextField()),
              ],
            ),
            const Row(
              children: [
                Expanded(child: CustomTextField()),
                Expanded(child: CustomTextField()),
              ],
            ),
            const Row(
              children: [
                Expanded(child: CustomTextField()),
                Expanded(child: CustomTextField()),
              ],
            ),
            Row(
              children: [
                const Expanded(child: CustomTextField()),
                Expanded(
                  child: Switch.adaptive(
                    value: false,
                    onChanged: (value) {},
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
    return Future.value(viewModel.futureController.value);
  }
}
