import "package:flutter/material.dart";
import "package:flutter_mobx/flutter_mobx.dart";
import "package:get/get.dart";

import "../../../../../../../core/base/state/base_state.dart";
import "../../../../../../../core/base/view/pdf_viewer/view/pdf_viewer_view.dart";
import "../../../../../../../core/components/slide_controller/view/slide_controller_view.dart";
import "../../../../../../../core/components/textfield/custom_text_field.dart";
import "../../../../../../../core/constants/extensions/date_time_extensions.dart";
import "../../../../../../../core/constants/ui_helper/ui_helper.dart";
import "../../../cari_listesi/model/cari_listesi_model.dart";
import "../view_model/hareket_detayli_yapilandirma_raporu_view_model.dart";

class HareketDetayliYaslandirmaRaporuView extends StatefulWidget {
  final CariListesiModel? model;

  const HareketDetayliYaslandirmaRaporuView({super.key, this.model});

  @override
  State<HareketDetayliYaslandirmaRaporuView> createState() => _HareketDetayliYaslandirmaRaporuViewState();
}

class _HareketDetayliYaslandirmaRaporuViewState extends BaseState<HareketDetayliYaslandirmaRaporuView> {
  HareketDetayliYaslandirmaRaporuViewModel viewModel = HareketDetayliYaslandirmaRaporuViewModel();
  late final TextEditingController cariController;
  late final TextEditingController referansTarihController;

  @override
  void initState() {
    cariController = TextEditingController();
    referansTarihController = TextEditingController();
    if (widget.model != null) {
      cariController.text = widget.model!.cariAdi ?? "";
      viewModel.pdfModel.dicParams?.cariKodu = widget.model!.cariKodu ?? "";
    }
    super.initState();
  }

  @override
  void dispose() {
    cariController.dispose();
    referansTarihController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => PDFViewerView(filterBottomSheet: filterBottomSheet, title: "Hareket Detaylı Yaşlandırma Raporu", pdfData: viewModel.pdfModel);

  Future<bool> filterBottomSheet() async {
    viewModel.resetFuture();
    await bottomSheetDialogManager.showBottomSheetDialog(
      context,
      title: loc(context).generalStrings.filter,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Observer(
            builder: (_) => SlideControllerWidget(
              childrenTitleList: viewModel.bakiyeDurumuTitleList,
              filterOnChanged: (index) => viewModel.changeBakiyeDurumu(index),
              childrenValueList: viewModel.bakiyeDurumuListValue,
              groupValue: viewModel.bakiyeDurumuGroupValue,
            ),
          ),
          CustomTextField(
            labelText: "Cari",
            isMust: true,
            controller: cariController,
            readOnly: true,
            suffixMore: true,
            onTap: () async {
              final result = await Get.toNamed("/mainPage/cariListesi", arguments: true);
              if (result != null) {
                cariController.text = result.cariAdi ?? "";
                viewModel.pdfModel.dicParams?.cariKodu = result.cariKodu ?? "";
              }
            },
          ),
          CustomTextField(
            labelText: "Referans Tarih",
            isMust: true,
            controller: referansTarihController,
            readOnly: true,
            isDateTime: true,
            // suffix: const Icon(Icons.calendar_today_outlined),
            onTap: () async {
              final result = await dialogManager.showDateTimePicker();
              if (result != null) {
                viewModel.pdfModel.dicParams?.refTarih = result.toDateStringIfNull;
                referansTarihController.text = result.toDateString;
              }
            },
          ),
          ElevatedButton(
            onPressed: () {
              if (viewModel.pdfModel.dicParams?.refTarih == null || viewModel.pdfModel.dicParams?.cariKodu == null) {
                dialogManager.showAlertDialog("Lütfen tüm alanları doldurunuz");
              } else {
                viewModel.setFuture();
                Get.back();
              }
            },
            child: Text(loc(context).generalStrings.apply),
          ).paddingAll(UIHelper.lowSize),
        ],
      ),
    );
    return Future.value(viewModel.futureController.value);
  }
}
