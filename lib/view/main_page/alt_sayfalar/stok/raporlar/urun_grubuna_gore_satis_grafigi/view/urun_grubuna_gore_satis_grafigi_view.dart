import "package:collection/collection.dart";
import "package:flutter/material.dart";
import "package:flutter_mobx/flutter_mobx.dart";
import "package:get/get.dart";
import "package:picker/core/components/wrap/appbar_title.dart";

import "../../../../../../../core/base/state/base_state.dart";
import "../../../../../../../core/components/bottom_bar/bottom_bar.dart";
import "../../../../../../../core/components/button/elevated_buttons/footer_button.dart";
import "../../../../../../../core/components/charts/custom_pie_chart.dart";
import "../../../../../../../core/components/dialog/bottom_sheet/model/bottom_sheet_model.dart";
import "../../../../../../../core/components/helper_widgets/custom_label_widget.dart";
import "../../../../../../../core/components/layout/custom_layout_builder.dart";
import "../../../../../../../core/components/list_view/rapor_filtre_date_time_bottom_sheet/view/rapor_filtre_date_time_bottom_sheet_view.dart";
import "../../../../../../../core/components/textfield/custom_text_field.dart";
import "../../../../../../../core/constants/ui_helper/ui_helper.dart";
import "../../../../../../../core/init/cache/cache_manager.dart";
import "../../../../../model/param_model.dart";
import "../../../../cari/cari_listesi/model/cari_listesi_model.dart";
import "../view_model/urun_grubuna_gore_satis_grafigi_view_model.dart";

final class UrunGrubunaGoreSatisGrafigiView extends StatefulWidget {
  const UrunGrubunaGoreSatisGrafigiView({super.key, this.model});
  final CariListesiModel? model;

  @override
  State<UrunGrubunaGoreSatisGrafigiView> createState() => _UrunGrubunaGoreSatisGrafigiViewState();
}

final class _UrunGrubunaGoreSatisGrafigiViewState extends BaseState<UrunGrubunaGoreSatisGrafigiView> {
  final UrunGrubunaGoreSatisGrafigiViewModel viewModel = UrunGrubunaGoreSatisGrafigiViewModel();
  late final TextEditingController baslangicTarihiController;
  late final TextEditingController bitisTarihiController;
  late final TextEditingController grupNoController;
  late final TextEditingController cariController;
  late final TextEditingController plasiyerController;
  late final TextEditingController projeController;
  late final TextEditingController raporTipiController;

  @override
  void initState() {
    baslangicTarihiController = TextEditingController();
    bitisTarihiController = TextEditingController();
    grupNoController = TextEditingController();
    cariController = TextEditingController();
    plasiyerController = TextEditingController();
    projeController = TextEditingController();
    raporTipiController = TextEditingController();
    raporTipiController.text =
        viewModel.raporTipi.entries
            .firstWhereOrNull(
              (element) => element.value == CacheManager.getProfilParametre.urunGrubunaGoreSatisRaporTipi,
            )
            ?.key ??
        "";
    cariController.text = widget.model?.cariKodu ?? "";
    viewModel.model.cariKodu = widget.model?.cariKodu ?? "";
    super.initState();
  }

  @override
  void dispose() {
    baslangicTarihiController.dispose();
    bitisTarihiController.dispose();
    grupNoController.dispose();
    cariController.dispose();
    plasiyerController.dispose();
    projeController.dispose();
    raporTipiController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration.zero, viewModel.getData);
    return BaseScaffold(
      appBar: appBar(),
      body: body(context),
      bottomNavigationBar: BottomBarWidget(
        isScrolledDown: true,
        children: [
          FooterButton(
            children: [
              const Text("Toplam Miktar"),
              Observer(builder: (_) => Text(viewModel.toplamMiktar)),
            ],
          ),
          FooterButton(
            children: [
              const Text("Toplam Net Tutar"),
              Observer(builder: (_) => Text(viewModel.toplamNetTutar)),
            ],
          ),
        ],
      ),
    );
  }

  AppBar appBar() => AppBar(title: const AppBarTitle(title: "Ürün Grubuna Göre Satış Grafiği"));

  SingleChildScrollView body(BuildContext context) => SingleChildScrollView(
    child: Column(
      children: [
        RaporFiltreDateTimeBottomSheetView(
          filterOnChanged: (value) {
            viewModel.donemTipiIndex = value ?? 0;
            viewModel.model.donemTipi = viewModel.donemTipiList[viewModel.donemTipiIndex];
            viewModel.model.baslamaTarihi = baslangicTarihiController.text;
            viewModel.model.bitisTarihi = bitisTarihiController.text;
            viewModel.getData();
          },
          baslangicTarihiController: baslangicTarihiController,
          bitisTarihiController: bitisTarihiController,
        ),
        CustomLayoutBuilder.divideInHalf(
          children: [
            CustomTextField(
              labelText: "Grup No",
              controller: grupNoController,
              readOnly: true,
              suffixMore: true,
              onClear: () {
                viewModel.model.grupNo = null;
                viewModel.getData();
              },
              onTap: () async {
                final result = await bottomSheetDialogManager.showBottomSheetDialog(
                  context,
                  title: "Grup No",
                  children: viewModel.grupNoBottomSheetList,
                );
                if (result != null) {
                  grupNoController.text = result;
                  viewModel.model.grupNo = int.tryParse(result.split("").last);
                  viewModel.getData();
                }
              },
            ),
            CustomTextField(
              labelText: "Cari",
              controller: cariController,
              readOnly: true,
              suffixMore: true,
              onClear: () {
                viewModel.model.cariKodu = null;
                viewModel.getData();
              },
              onTap: () async {
                final result = await Get.toNamed("/mainPage/cariListesi", arguments: true);
                if (result != null) {
                  cariController.text = (result as CariListesiModel).cariKodu ?? "";
                  viewModel.model.cariKodu = result.cariKodu ?? "";
                  viewModel.getData();
                }
              },
            ),
            if (yetkiController.plasiyerUygulamasiAcikMi)
              CustomTextField(
                labelText: "Plasiyer",
                controller: plasiyerController,
                readOnly: true,
                suffixMore: true,
                onClear: () {
                  viewModel.model.arrPlasiyerKodu = null;
                  viewModel.getData();
                },
                onTap: () async {
                  final List<PlasiyerList>? plasiyerList = CacheManager.getAnaVeri?.paramModel?.plasiyerList;
                  if (plasiyerList != null) {
                    final PlasiyerList? result = await bottomSheetDialogManager.showBottomSheetDialog(
                      context,
                      title: "Plasiyer",
                      children: plasiyerList
                          .map((e) => BottomSheetModel(title: e.plasiyerAciklama ?? "", value: e))
                          .toList(),
                    );
                    if (result != null) {
                      plasiyerController.text = result.plasiyerAciklama ?? "";
                      viewModel.model.arrPlasiyerKodu = [result.plasiyerKodu ?? ""];
                      viewModel.getData();
                    }
                  }
                },
              ),
            if (yetkiController.projeUygulamasiAcikMi)
              CustomTextField(
                labelText: "Proje",
                controller: projeController,
                readOnly: true,
                suffixMore: true,
                valueWidget: Observer(builder: (_) => Text(viewModel.model.projeKodu ?? "")),
                onClear: () => viewModel.setProje(null),
                onTap: () async {
                  final result = await bottomSheetDialogManager.showProjeBottomSheetDialog(
                    context,
                    viewModel.model.projeKodu,
                  );
                  if (result != null) {
                    projeController.text = result.projeAciklama ?? result.projeKodu ?? "";
                    viewModel.model.projeKodu = result.projeKodu ?? "";
                    viewModel
                      ..setProje(result)
                      ..getData();
                  }
                },
              ),
            CustomTextField(
              labelText: "Rapor Tipi",
              controller: raporTipiController,
              isMust: true,
              readOnly: true,
              valueWidget: Observer(builder: (_) => Text(viewModel.model.tipi ?? "")),
              suffixMore: true,
              onTap: () async {
                final result = await bottomSheetDialogManager.showRadioBottomSheetDialog<MapEntry<String, String>>(
                  context,
                  title: "Rapor Tipi",
                  groupValue: viewModel.model.tipi,
                  children: viewModel.raporTipi.entries
                      .map((e) => BottomSheetModel(title: e.key, value: e, description: e.value, groupValue: e.value))
                      .toList(),
                );
                if (result != null) {
                  raporTipiController.text = result.key;
                  viewModel
                    ..setRaporTipi(result.value)
                    ..getData();
                }
              },
            ),
          ],
        ),
        IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: Card(
                  child: Center(
                    child: CustomWidgetWithLabel(
                      child: Observer(
                        builder: (_) => SwitchListTile.adaptive(
                          contentPadding: UIHelper.midPadding,
                          value: viewModel.irsDahilValue,
                          onChanged: (value) {
                            viewModel
                              ..setIrsDahilValue(value)
                              ..getData();
                          },
                          title: const Text("İrsaliye Dahil"),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Card(
                  child: Center(
                    child: CustomWidgetWithLabel(
                      child: Observer(
                        builder: (_) => SwitchListTile.adaptive(
                          contentPadding: UIHelper.midPadding,
                          value: viewModel.gruplansinValue,
                          onChanged: (value) {
                            viewModel
                              ..setGruplansinValue(value)
                              ..getData();
                          },
                          title: const Text("Küçük Değerler Gruplansın"),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Observer(
          builder: (_) => CustomPieChart(
            pieChartValue: viewModel.modelList?.map((element) => element.netTutar ?? 0).toList() ?? [],
            pieChartTitle:
                viewModel.modelList
                    ?.map((element) => "${element.grupAdi ?? element.grupKodu}")
                    .toList()
                    .cast<String>() ??
                [],
          ),
        ).paddingOnly(bottom: UIHelper.highSize * 10),
      ],
    ).paddingAll(UIHelper.lowSize),
  );
}
