import "package:flutter/material.dart";
import "package:flutter_mobx/flutter_mobx.dart";
import "package:get/get.dart";

import "../../../../../../../core/base/state/base_state.dart";
import "../../../../../../../core/base/view/pdf_viewer/view/pdf_viewer_view.dart";
import "../../../../../../../core/components/dialog/bottom_sheet/model/bottom_sheet_model.dart";
import "../../../../../../../core/components/list_view/rapor_filtre_date_time_bottom_sheet/view/rapor_filtre_date_time_bottom_sheet_view.dart";
import "../../../../../../../core/components/textfield/custom_text_field.dart";
import "../../../../../../../core/constants/ui_helper/ui_helper.dart";
import "../../../cari_listesi/model/cari_listesi_model.dart";
import "../view_model/cari_borc_alacak_dokumu_raporu_view_model.dart";

final class CariBorcAlacakDokumuRaporuView extends StatefulWidget {
  final CariListesiModel? model;

  const CariBorcAlacakDokumuRaporuView({super.key, this.model});

  @override
  State<CariBorcAlacakDokumuRaporuView> createState() => _CariBorcAlacakDokumuRaporuViewState();
}

final class _CariBorcAlacakDokumuRaporuViewState extends BaseState<CariBorcAlacakDokumuRaporuView> {
  final CariBorcAlacakDokumuRaporuViewModel viewModel = CariBorcAlacakDokumuRaporuViewModel();
  late final TextEditingController _baslangicTarihiController;
  late final TextEditingController _bitisTarihiController;
  late final TextEditingController _plasiyerController;
  late final TextEditingController _siralaController;
  @override
  void initState() {
    _siralaController = TextEditingController(text: viewModel.siralaMap.keys.elementAt(2));
    _plasiyerController = TextEditingController();
    _baslangicTarihiController = TextEditingController();
    _bitisTarihiController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _baslangicTarihiController.dispose();
    _plasiyerController.dispose();
    _bitisTarihiController.dispose();
    _siralaController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Observer(
        builder: (_) => PDFViewerView(filterBottomSheet: filterBottomSheet, title: "Borç / Alacak Dökümü", pdfData: viewModel.pdfModel),
      );

  Future<bool> filterBottomSheet() async {
    viewModel.resetFuture();
    await bottomSheetDialogManager.showBottomSheetDialog(
      context,
      title: loc.generalStrings.filter,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          RaporFiltreDateTimeBottomSheetView(
            filterOnChanged: (index) {
              viewModel
                ..setBastar(_baslangicTarihiController.text)
                ..setBittar(_bitisTarihiController.text);
            },
            baslangicTarihiController: _baslangicTarihiController,
            bitisTarihiController: _bitisTarihiController,
          ),
          Row(
            children: [
              if (yetkiController.plasiyerUygulamasiAcikMi)
                Expanded(
                  child: CustomTextField(
                    controller: _plasiyerController,
                    labelText: "Plasiyer",
                    readOnly: true,
                    suffixMore: true,
                    valueWidget: Observer(builder: (_) => Text(viewModel.pdfModel.dicParams?.plasiyerKodu ?? "")),
                    onTap: () async {
                      final result = await bottomSheetDialogManager.showPlasiyerBottomSheetDialog(context, viewModel.pdfModel.dicParams?.plasiyerKodu);
                      if (result != null) {
                        _plasiyerController.text = result.plasiyerAciklama ?? result.plasiyerKodu ?? "";
                        viewModel.setPlasiyer(result.plasiyerKodu);
                      }
                    },
                  ),
                ),
              Expanded(
                child: CustomTextField(
                  controller: _siralaController,
                  labelText: loc.generalStrings.sort,
                  readOnly: true,
                  suffixMore: true,
                  valueWidget: Observer(builder: (_) => Text(viewModel.pdfModel.dicParams?.sirala ?? "x")),
                  onTap: () async {
                    final result = await bottomSheetDialogManager.showRadioBottomSheetDialog(
                      context,
                      groupValue: viewModel.pdfModel.dicParams?.sirala,
                      title: loc.generalStrings.sort,
                      children: List.generate(
                        viewModel.siralaMap.length,
                        (index) => BottomSheetModel(
                          title: viewModel.siralaMap.keys.toList()[index],
                          value: viewModel.siralaMap.entries.toList()[index],
                          groupValue: viewModel.siralaMap.values.toList()[index],
                        ),
                      ),
                    );
                    if (result != null) {
                      _siralaController.text = result.key;
                      viewModel.setSirala(result.value);
                    }
                  },
                ),
              ),
            ],
          ),
          ElevatedButton(
            onPressed: () {
              viewModel.setFuture();
              Get.back();
            },
            child: Text(loc.generalStrings.apply),
          ).paddingAll(UIHelper.lowSize),
        ],
      ),
    );
    return Future.value(viewModel.futureController.value);
  }
}
