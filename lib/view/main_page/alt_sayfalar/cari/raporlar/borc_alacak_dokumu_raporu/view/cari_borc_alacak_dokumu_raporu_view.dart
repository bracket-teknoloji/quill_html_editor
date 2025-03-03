import "package:flutter/material.dart";
import "package:flutter_mobx/flutter_mobx.dart";
import "package:get/get.dart";
import "package:picker/core/components/layout/custom_layout_builder.dart";

import "../../../../../../../core/base/state/base_state.dart";
import "../../../../../../../core/base/view/pdf_viewer/view/pdf_viewer_view.dart";
import "../../../../../../../core/components/dialog/bottom_sheet/model/bottom_sheet_model.dart";
import "../../../../../../../core/components/list_view/rapor_filtre_date_time_bottom_sheet/view/rapor_filtre_date_time_bottom_sheet_view.dart";
import "../../../../../../../core/components/textfield/custom_text_field.dart";
import "../../../../../../../core/constants/ui_helper/ui_helper.dart";
import "../../../cari_listesi/model/cari_listesi_model.dart";
import "../view_model/cari_borc_alacak_dokumu_raporu_view_model.dart";

final class CariBorcAlacakDokumuRaporuView extends StatefulWidget {
  const CariBorcAlacakDokumuRaporuView({super.key, this.model}) : dovizliMi = false;
  const CariBorcAlacakDokumuRaporuView.dovizli({super.key, this.model}) : dovizliMi = true;
  final CariListesiModel? model;

  final bool dovizliMi;

  @override
  State<CariBorcAlacakDokumuRaporuView> createState() => _CariBorcAlacakDokumuRaporuViewState();
}

final class _CariBorcAlacakDokumuRaporuViewState extends BaseState<CariBorcAlacakDokumuRaporuView> {
  final CariBorcAlacakDokumuRaporuViewModel viewModel = CariBorcAlacakDokumuRaporuViewModel();
  late final TextEditingController _baslangicTarihiController;
  late final TextEditingController _bitisTarihiController;
  late final TextEditingController _plasiyerController;
  late final TextEditingController _siralaController;
  late final TextEditingController _dovizTipiController;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    viewModel.isDovizli(widget.dovizliMi);
    _siralaController = TextEditingController(text: viewModel.siralaMap.keys.elementAt(2));
    _plasiyerController = TextEditingController();
    _baslangicTarihiController = TextEditingController();
    _bitisTarihiController = TextEditingController();
    _dovizTipiController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _baslangicTarihiController.dispose();
    _plasiyerController.dispose();
    _bitisTarihiController.dispose();
    _siralaController.dispose();
    _dovizTipiController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Observer(
    builder:
        (_) => PDFViewerView(
          filterBottomSheet: filterBottomSheet,
          title: "${widget.dovizliMi ? "Dövizli " : ""}Borç/Alacak Dökümü",
          pdfData: viewModel.pdfModel,
        ),
  );

  Future<bool> filterBottomSheet() async {
    viewModel.resetFuture();
    await bottomSheetDialogManager.showBottomSheetDialog(
      context,
      title: loc.generalStrings.filter,
      body: Form(
        key: _formKey,
        child: Column(
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
            CustomLayoutBuilder.divideInHalf(
              children: [
                if (yetkiController.plasiyerUygulamasiAcikMi)
                  CustomTextField(
                    controller: _plasiyerController,
                    labelText: "Plasiyer",
                    readOnly: true,
                    suffixMore: true,
                    onClear: () => viewModel.setPlasiyer(null),
                    valueWidget: Observer(builder: (_) => Text(viewModel.pdfModel.dicParams?.plasiyerKodu ?? "")),
                    onTap: () async {
                      final result = await bottomSheetDialogManager.showPlasiyerBottomSheetDialog(
                        context,
                        viewModel.pdfModel.dicParams?.plasiyerKodu,
                      );
                      if (result != null) {
                        _plasiyerController.text = result.plasiyerAciklama ?? result.plasiyerKodu ?? "";
                        viewModel.setPlasiyer(result.plasiyerKodu);
                      }
                    },
                  ),
                CustomTextField(
                  controller: _siralaController,
                  labelText: loc.generalStrings.sort,
                  readOnly: true,
                  suffixMore: true,
                  onClear: () => viewModel.setSirala(null),
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
                if (widget.dovizliMi) ...[
                  CustomTextField(
                    controller: _dovizTipiController,
                    isMust: true,
                    labelText: "Döviz Tipi",
                    readOnly: true,
                    suffixMore: true,
                    valueWidget: Observer(builder: (_) => Text(viewModel.pdfModel.dicParams?.dovizTipi ?? "")),
                    onTap: () async {
                      final result = await bottomSheetDialogManager.showCheckBoxBottomSheetDialog(
                        context,
                        title: "Döviz Tipi",
                        groupValues: viewModel.pdfModel.dicParams?.dovizTipleri,
                        children:
                            parametreModel.dovizList
                                ?.map((e) => BottomSheetModel(title: e.isim ?? "", value: e, groupValue: e.dovizKodu))
                                .toList(),
                      );
                      if (result != null) {
                        _dovizTipiController.text = result.map((e) => e.isim).nonNulls.join(", ");
                        viewModel.setDovizTipleri(result.map((e) => e.dovizKodu).nonNulls.toList());
                      }
                    },
                  ),
                  Card(
                    child: Observer(
                      builder:
                          (_) => SwitchListTile.adaptive(
                            title: const Text("Sıfır Bakiye Hariç"),
                            value: viewModel.pdfModel.dicParams?.sifirHaric == "E",
                            onChanged: viewModel.setSifirHaric,
                          ),
                    ),
                  ),
                ],
              ],
            ),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState?.validate() ?? false) {
                  viewModel.setFuture();
                  Get.back();
                }
              },
              child: Text(loc.generalStrings.apply),
            ).paddingAll(UIHelper.lowSize),
          ],
        ),
      ),
    );
    return Future.value(viewModel.futureController.value);
  }
}
