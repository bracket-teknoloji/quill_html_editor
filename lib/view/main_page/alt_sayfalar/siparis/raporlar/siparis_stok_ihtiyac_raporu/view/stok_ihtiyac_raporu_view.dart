import "package:flutter/material.dart";
import "package:flutter_mobx/flutter_mobx.dart";
import "package:get/get.dart";

import "../../../../../../../core/base/state/base_state.dart";
import "../../../../../../../core/base/view/pdf_viewer/view/pdf_viewer_view.dart";
import "../../../../../../../core/components/dialog/bottom_sheet/model/bottom_sheet_model.dart";
import "../../../../../../../core/components/helper_widgets/custom_label_widget.dart";
import "../../../../../../../core/components/textfield/custom_text_field.dart";
import "../../../../../../../core/constants/enum/grup_kodu_enums.dart";
import "../../../../../../../core/constants/extensions/widget_extensions.dart";
import "../../../../../model/param_model.dart";
import "../../../../stok/stok_liste/model/stok_listesi_model.dart";
import "../../../base_siparis_edit/model/base_siparis_edit_model.dart";
import "../view_model/stok_ihtiyac_raporu_view_model.dart";

class StokIhtiyacRaporuView extends StatefulWidget {
  const StokIhtiyacRaporuView({super.key, this.model});
  final BaseSiparisEditModel? model;

  @override
  State<StokIhtiyacRaporuView> createState() => _StokIhtiyacRaporuViewViewState();
}

class _StokIhtiyacRaporuViewViewState extends BaseState<StokIhtiyacRaporuView> {
  StokIhtiyacRaporuViewModel viewModel = StokIhtiyacRaporuViewModel();
  late final TextEditingController stokController;
  late final TextEditingController plasiyerController;
  late final TextEditingController siralaController;
  late final TextEditingController grupKoduController;
  late final TextEditingController kod1Controller;
  late final TextEditingController kod2Controller;
  late final TextEditingController kod3Controller;
  late final TextEditingController kod4Controller;
  late final TextEditingController kod5Controller;

  @override
  void initState() {
    if (widget.model?.belgeNo case final belgeNo?) viewModel.setBelgeNo(belgeNo);
    stokController = TextEditingController();
    plasiyerController = TextEditingController();
    siralaController = TextEditingController(text: "İhtiyaç (Azalan)");
    grupKoduController = TextEditingController();
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
    plasiyerController.dispose();
    siralaController.dispose();
    grupKoduController.dispose();
    kod1Controller.dispose();
    kod2Controller.dispose();
    kod3Controller.dispose();
    kod4Controller.dispose();
    kod5Controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => PDFViewerView(filterBottomSheet: filterBottomSheet, title: "Stok İhtiyaç Raporu", pdfData: viewModel.pdfModel);

  Future<bool> filterBottomSheet() async {
    viewModel.resetFuture();
    await bottomSheetDialogManager.showBottomSheetDialog(
      context,
      title: loc.generalStrings.filter,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Expanded(
                child: CustomTextField(
                  labelText: "Stok",
                  readOnly: true,
                  suffixMore: true,
                  controller: stokController,
                  valueWidget: Observer(builder: (_) => Text(viewModel.pdfModel.dicParams?.stokKodu ?? "")),
                  onClear: () {
                    viewModel.setStokKodu(null);
                    stokController.clear();
                  },
                  onTap: () async {
                    final result = await Get.toNamed("/mainPage/stokListesi", arguments: true);
                    if (result is StokListesiModel) {
                      stokController.text = result.stokAdi ?? "";
                      viewModel.setStokKodu(result.stokKodu);
                    }
                  },
                ),
              ),
              Expanded(
                child: CustomTextField(
                  labelText: "Plasiyer",
                  readOnly: true,
                  suffixMore: true,
                  controller: plasiyerController,
                  valueWidget: Observer(builder: (_) => Text(viewModel.pdfModel.dicParams?.plasiyerKodu ?? "")),
                  onTap: () async {
                    final PlasiyerList? result = await bottomSheetDialogManager.showPlasiyerBottomSheetDialog(context, viewModel.pdfModel.dicParams?.plasiyerKodu);
                    if (result != null) {
                      plasiyerController.text = result.plasiyerAciklama ?? "";
                      viewModel.pdfModel.dicParams?.plasiyerKodu = result.plasiyerKodu ?? "";
                    }
                  },
                ),
              ).yetkiVarMi(yetkiController.plasiyerUygulamasiAcikMi),
            ],
          ),
          CustomTextField(
            labelText: loc.generalStrings.sort,
            readOnly: true,
            suffixMore: true,
            controller: siralaController,
            onClear: () {
              siralaController.clear();
              viewModel.setSirala(null);
            },
            onTap: () async {
              final result = await bottomSheetDialogManager.showBottomSheetDialog(
                context,
                title: loc.generalStrings.sort,
                children: List.generate(viewModel.siralaMap.length, (index) => BottomSheetModel(title: viewModel.siralaMap.keys.toList()[index], value: viewModel.siralaMap.entries.toList()[index])),
              );
              if (result != null) {
                siralaController.text = result.key;
                viewModel.pdfModel.dicParams?.sirala = result.value;
              }
            },
          ),
          Row(
            children: [
              Expanded(
                child: CustomTextField(labelText: "Grup Kodu", readOnly: true, suffixMore: true, controller: grupKoduController, onTap: () async => getGrupKodu(context, 0, grupKoduController)),
              ),
              Expanded(child: CustomTextField(labelText: "Kod 1", readOnly: true, suffixMore: true, controller: kod1Controller, onTap: () async => getGrupKodu(context, 1, kod1Controller))),
            ],
          ),
          Row(
            children: [
              Expanded(child: CustomTextField(labelText: "Kod 2", readOnly: true, suffixMore: true, controller: kod2Controller, onTap: () async => getGrupKodu(context, 2, kod2Controller))),
              Expanded(child: CustomTextField(labelText: "Kod 3", readOnly: true, suffixMore: true, controller: kod3Controller, onTap: () async => getGrupKodu(context, 3, kod3Controller))),
            ],
          ),
          Row(
            children: [
              Expanded(child: CustomTextField(labelText: "Kod 4", readOnly: true, suffixMore: true, controller: kod4Controller, onTap: () async => getGrupKodu(context, 4, kod4Controller))),
              Expanded(child: CustomTextField(labelText: "Kod 5", readOnly: true, suffixMore: true, controller: kod5Controller, onTap: () async => getGrupKodu(context, 5, kod5Controller))),
            ],
          ),
          CustomWidgetWithLabel(
            isVertical: true,
            text: "Sadece İhtiyaçlar",
            child: Observer(builder: (_) => Switch.adaptive(value: viewModel.sadeceIhtiyaclarMi, onChanged: (value) => viewModel.setSadeceIhtiyaclarMi(value))),
          ),
          ElevatedButton(
            onPressed: () {
              viewModel.setFuture();
              Get.back();
            },
            child: Text(loc.generalStrings.apply),
          ),
        ],
      ),
    );
    return Future.value(viewModel.futureController.value);
  }

  Future<String?> getGrupKodu(BuildContext context, int grupNo, TextEditingController? controller) async {
    final result = await bottomSheetDialogManager.showGrupKoduBottomSheetDialog(context, getKodWithIndex(grupNo), grupKodu: grupNo, modul: GrupKoduEnum.stok, kullanimda: true);
    if (result != null) {
      switch (grupNo) {
        case 0:
          viewModel.pdfModel.dicParams?.grupKodu = result.grupKodu ?? "";
          controller?.text = result.grupAdi ?? "";
        case 1:
          viewModel.pdfModel.dicParams?.kod1 = result.grupKodu ?? "";
          controller?.text = result.grupAdi ?? "";
        case 2:
          viewModel.pdfModel.dicParams?.kod2 = result.grupKodu ?? "";
          controller?.text = result.grupAdi ?? "";
        case 3:
          viewModel.pdfModel.dicParams?.kod3 = result.grupKodu ?? "";
          controller?.text = result.grupAdi ?? "";
        case 4:
          viewModel.pdfModel.dicParams?.kod4 = result.grupKodu ?? "";
          controller?.text = result.grupAdi ?? "";
        case 5:
          viewModel.pdfModel.dicParams?.kod5 = result.grupKodu ?? "";
          controller?.text = result.grupAdi ?? "";
      }
    }
    return null;
  }

  String? getKodWithIndex(int? index) => switch (index) {
        0 => viewModel.pdfModel.dicParams?.grupKodu,
        1 => viewModel.pdfModel.dicParams?.kod1,
        2 => viewModel.pdfModel.dicParams?.kod2,
        3 => viewModel.pdfModel.dicParams?.kod3,
        4 => viewModel.pdfModel.dicParams?.kod4,
        5 => viewModel.pdfModel.dicParams?.kod5,
        _ => null,
      };
}
