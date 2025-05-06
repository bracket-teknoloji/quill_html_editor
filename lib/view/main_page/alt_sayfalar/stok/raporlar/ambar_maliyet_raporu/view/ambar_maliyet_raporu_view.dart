import "package:flutter/material.dart";
import "package:flutter_mobx/flutter_mobx.dart";
import "package:get/get.dart";

import "../../../../../../../core/base/model/base_grup_kodu_model.dart";
import "../../../../../../../core/base/state/base_state.dart";
import "../../../../../../../core/base/view/pdf_viewer/view/pdf_viewer_view.dart";
import "../../../../../../../core/components/dialog/bottom_sheet/model/bottom_sheet_model.dart";
import "../../../../../../../core/components/helper_widgets/custom_label_widget.dart";
import "../../../../../../../core/components/textfield/custom_text_field.dart";
import "../../../../../../../core/constants/enum/grup_kodu_enums.dart";
import "../../../../../../../core/constants/extensions/list_extensions.dart";
import "../../../../../../../core/constants/ui_helper/ui_helper.dart";
import "../../../stok_liste/model/stok_listesi_model.dart";
import "../view_model/ambar_maliyet_raporu_view_model.dart";

final class AmbarMaliyetRaporuView extends StatefulWidget {
  const AmbarMaliyetRaporuView({super.key, this.model});
  final StokListesiModel? model;

  @override
  State<AmbarMaliyetRaporuView> createState() => _AmbarMaliyetRaporuViewState();
}

final class _AmbarMaliyetRaporuViewState extends BaseState<AmbarMaliyetRaporuView> {
  AmbarMaliyetRaporuViewModel viewModel = AmbarMaliyetRaporuViewModel();
  List<BaseGrupKoduModel> grupKodList = [];
  late final TextEditingController stokController;
  late final TextEditingController maliyetTipiController;
  late final TextEditingController grupKoduController;
  late final TextEditingController kod1Controller;
  late final TextEditingController kod2Controller;
  late final TextEditingController kod3Controller;
  late final TextEditingController kod4Controller;
  late final TextEditingController kod5Controller;
  @override
  void initState() {
    stokController = TextEditingController();
    maliyetTipiController = TextEditingController();
    grupKoduController = TextEditingController();
    kod1Controller = TextEditingController();
    kod2Controller = TextEditingController();
    kod3Controller = TextEditingController();
    kod4Controller = TextEditingController();
    kod5Controller = TextEditingController();
    if (widget.model != null) {
      stokController.text = widget.model?.stokKodu ?? "";
      viewModel.pdfModel.dicParams?.stokKodu = widget.model?.stokKodu ?? "";
    }
    super.initState();
  }

  @override
  void dispose() {
    stokController.dispose();
    maliyetTipiController.dispose();
    grupKoduController.dispose();
    kod1Controller.dispose();
    kod2Controller.dispose();
    kod3Controller.dispose();
    kod4Controller.dispose();
    kod5Controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) =>
      PDFViewerView(filterBottomSheet: filterBottomSheet, title: "Ambar Maliyet Raporu", pdfData: viewModel.pdfModel);

  Future<bool> filterBottomSheet() async {
    viewModel.resetFuture();
    await bottomSheetDialogManager.showBottomSheetDialog(
      context,
      title: loc.generalStrings.filter,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          CustomWidgetWithLabel(
            text: "Sıfır Tutar Hariç",
            isVertical: true,
            child: Observer(
              builder:
                  (_) => Switch.adaptive(
                    value: viewModel.sifirHaricValue,
                    onChanged: (value) => viewModel.setSifirHaric(value),
                  ),
            ),
          ),
          Row(
            children: [
              Expanded(
                child: CustomTextField(
                  labelText: "Stok",
                  controller: stokController,
                  readOnly: true,
                  suffixMore: true,
                  onClear: () => viewModel.pdfModel.dicParams?.stokKodu = "",
                  onTap: () async {
                    final result = await Get.toNamed("/mainPage/stokListesi", arguments: true);
                    if (result != null) {
                      stokController.text = result.stokKodu ?? "";
                      viewModel.pdfModel.dicParams?.stokKodu = result.stokKodu ?? "";
                    }
                  },
                ),
              ),
              Expanded(
                child: CustomTextField(
                  labelText: "Maliyet Tipi",
                  controller: maliyetTipiController,
                  isMust: true,
                  readOnly: true,
                  onTap: () async {
                    final result = await bottomSheetDialogManager.showRadioBottomSheetDialog(
                      context,
                      title: "Maliyet Tipi",
                      groupValue: viewModel.pdfModel.dicParams?.maliyetTipi,
                      children: viewModel.maliyetTipiList,
                    );
                    if (result != null) {
                      maliyetTipiController.text = result ?? "";
                      viewModel.pdfModel.dicParams?.maliyetTipi = result ?? "";
                    }
                  },
                  suffixMore: true,
                ),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: CustomTextField(
                  labelText: "Grup Kodu",
                  controller: grupKoduController,
                  readOnly: true,
                  suffixMore: true,
                  onClear: () => viewModel.pdfModel.dicParams?.grupKodu = "",
                  onTap: () async => await getGrupKodu(0, grupKoduController),
                ),
              ),
              Expanded(
                child: CustomTextField(
                  labelText: "Kod 1",
                  controller: kod1Controller,
                  readOnly: true,
                  suffixMore: true,
                  onClear: () => viewModel.pdfModel.dicParams?.kod1 = "",
                  onTap: () async => await getGrupKodu(1, kod1Controller),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: CustomTextField(
                  labelText: "Kod 2",
                  controller: kod2Controller,
                  readOnly: true,
                  suffixMore: true,
                  onClear: () => viewModel.pdfModel.dicParams?.kod2 = "",
                  onTap: () async => await getGrupKodu(2, kod2Controller),
                ),
              ),
              Expanded(
                child: CustomTextField(
                  labelText: "Kod 3",
                  controller: kod3Controller,
                  readOnly: true,
                  suffixMore: true,
                  onClear: () => viewModel.pdfModel.dicParams?.kod3 = "",
                  onTap: () async => await getGrupKodu(3, kod3Controller),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: CustomTextField(
                  labelText: "Kod 4",
                  controller: kod4Controller,
                  readOnly: true,
                  suffixMore: true,
                  onClear: () => viewModel.pdfModel.dicParams?.kod4 = "",
                  onTap: () async => await getGrupKodu(4, kod4Controller),
                ),
              ),
              Expanded(
                child: CustomTextField(
                  labelText: "Kod 5",
                  controller: kod5Controller,
                  readOnly: true,
                  suffixMore: true,
                  onClear: () => viewModel.pdfModel.dicParams?.kod5 = "",
                  onTap: () async => await getGrupKodu(5, kod5Controller),
                ),
              ),
            ],
          ),
          Observer(
            builder:
                (_) => ElevatedButton(
                  onPressed: () {
                    if (viewModel.pdfModel.dicParams?.maliyetTipi != null) {
                      viewModel.setFuture();
                      Get.back();
                    } else {
                      dialogManager.showAlertDialog("Maliyet Tipi Seçiniz");
                    }
                  },
                  child: Text(loc.generalStrings.apply),
                ).paddingAll(UIHelper.lowSize),
          ),
        ],
      ),
    );
    return Future.value(viewModel.futureController.value);
  }

  Future<String?> getGrupKodu(int grupNo, TextEditingController? controller) async {
    if (grupKodList.isEmptyOrNull) {
      grupKodList = await networkManager.getGrupKod(name: GrupKoduEnum.stok, grupNo: -1);
    }
    final List<BottomSheetModel> bottomSheetList =
        grupKodList
            .where((e) => e.grupNo == grupNo)
            .toList()
            .map((e) => BottomSheetModel(title: e.grupKodu ?? "", onTap: () => Get.back(result: e)))
            .toList();
    // ignore: use_build_context_synchronously
    final result = await bottomSheetDialogManager.showBottomSheetDialog(
      context,
      title: "Grup Kodu",
      children: bottomSheetList,
    );
    if (result != null) {
      controller?.text = result.grupKodu ?? "";
      switch (grupNo) {
        case 0:
          viewModel.pdfModel.dicParams?.grupKodu = result.grupKodu ?? "";
        case 1:
          viewModel.pdfModel.dicParams?.kod1 = result.grupKodu ?? "";
        case 2:
          viewModel.pdfModel.dicParams?.kod2 = result.grupKodu ?? "";
        case 3:
          viewModel.pdfModel.dicParams?.kod3 = result.grupKodu ?? "";
        case 4:
          viewModel.pdfModel.dicParams?.kod4 = result.grupKodu ?? "";
        case 5:
          viewModel.pdfModel.dicParams?.kod5 = result.grupKodu ?? "";
      }
    }
    return null;
  }
}
