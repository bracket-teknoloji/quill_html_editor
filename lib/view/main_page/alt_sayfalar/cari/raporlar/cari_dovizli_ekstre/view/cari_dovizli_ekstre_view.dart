import "package:flutter/material.dart";
import "package:flutter_mobx/flutter_mobx.dart";
import "package:get/get.dart";

import "../../../../../../../core/base/state/base_state.dart";
import "../../../../../../../core/base/view/pdf_viewer/view/pdf_viewer_view.dart";
import "../../../../../../../core/components/dialog/bottom_sheet/model/bottom_sheet_model.dart";
import "../../../../../../../core/components/helper_widgets/custom_label_widget.dart";
import "../../../../../../../core/components/list_view/rapor_filtre_date_time_bottom_sheet/view/rapor_filtre_date_time_bottom_sheet_view.dart";
import "../../../../../../../core/components/textfield/custom_text_field.dart";
import "../../../../../../../core/constants/ui_helper/ui_helper.dart";
import "../../../../../../../core/init/cache/cache_manager.dart";
import "../../../../../model/param_model.dart";
import "../../../cari_listesi/model/cari_listesi_model.dart";
import "../view_model/cari_dovizli_ekstre_view_model.dart";

class CariDovizliEkstreView extends StatefulWidget {
  final CariListesiModel? model;

  const CariDovizliEkstreView({super.key, this.model});

  @override
  State<CariDovizliEkstreView> createState() => _CariDovizliEkstreViewState();
}

class _CariDovizliEkstreViewState extends BaseState<CariDovizliEkstreView> {
  CariDovizliEkstreViewModel viewModel = CariDovizliEkstreViewModel();
  late final TextEditingController cariController;
  late final TextEditingController dovizController;
  late final TextEditingController baslangicTarihiController;
  late final TextEditingController bitisTarihiController;

  @override
  void initState() {
    cariController = TextEditingController();
    dovizController = TextEditingController();
    baslangicTarihiController = TextEditingController();
    bitisTarihiController = TextEditingController();
    if (widget.model != null) {
      cariController.text = widget.model?.cariAdi ?? "";
      viewModel.changeCariKodu(widget.model?.cariKodu ?? "");
    }
    super.initState();
  }

  @override
  void dispose() {
    cariController.dispose();
    dovizController.dispose();
    baslangicTarihiController.dispose();
    bitisTarihiController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => PDFViewerView(filterBottomSheet: filterBottomSheet, title: "Cari Dövizli Ekstre", pdfData: viewModel.pdfModel);

  Future<bool> filterBottomSheet() async {
    viewModel.resetFuture();
    await bottomSheetDialogManager.showBottomSheetDialog(
      context,
      title: "Filtrele",
      body: Column(
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
            suffixMore: true,
            onTap: () async {
              final result = await Get.toNamed("/mainPage/cariListesi", arguments: true);
              if (result != null) {
                cariController.text = result.cariAdi ?? "";
                viewModel.changeCariKodu(result.cariKodu ?? "");
              }
            },
          ),
          Row(
            children: [
              Expanded(
                child: CustomTextField(
                  labelText: "Döviz Tipi",
                  valueWidget: Observer(builder: (_) => Text(viewModel.dovizValue ?? "")),
                  controller: dovizController,
                  readOnly: true,
                  suffixMore: true,
                  onTap: () async {
                    List<DovizList>? dovizList = CacheManager.getAnaVeri?.paramModel?.dovizList;
                    dovizList = dovizList?.where((element) => element.dovizTipi != 0).toList();
                    final DovizList? result = await bottomSheetDialogManager.showBottomSheetDialog(
                      context,
                      title: "Döviz Tipi",
                      children: dovizList!.map((e) => BottomSheetModel(title: e.isim ?? "", onTap: () => Get.back(result: e))).toList(),
                    );
                    if (result != null) {
                      dovizController.text = result.isim ?? "";
                      viewModel.changeDovizTipi(result.isim != mainCurrency ? (result.dovizTipi ?? (result.dovizKodu ?? 0)) : 0);
                      viewModel.changeDovizValue((result.dovizKodu ?? -1).toString());
                    }
                  },
                ),
              ),
            ],
          ),
          CustomWidgetWithLabel(
            text: "$mainCurrency Hareketi Dökülsün",
            isVertical: true,
            child: Observer(
              builder: (_) => Switch.adaptive(
                value: viewModel.tlHareketleriDokulsun,
                onChanged: (value) {
                  viewModel.changeTlHareketleriDokulsun();
                  viewModel.pdfModel.dicParams?.tlHarDokulsun = value ? "E" : null;
                },
              ),
            ),
          ).paddingAll(UIHelper.lowSize),
          Observer(
            builder: (_) => ElevatedButton(
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
              child: const Text("Uygula"),
            ).paddingAll(UIHelper.lowSize),
          ),
        ],
      ),
    );
    return Future.value(viewModel.futureController.value);
  }

  void filterOnChanged(int? index) {
    viewModel.pdfModel.dicParams?.bastar = baslangicTarihiController.text;
    viewModel.pdfModel.dicParams?.bittar = bitisTarihiController.text;
  }
}
