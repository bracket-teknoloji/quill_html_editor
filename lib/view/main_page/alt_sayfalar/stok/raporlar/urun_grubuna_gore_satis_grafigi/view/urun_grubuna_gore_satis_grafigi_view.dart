import "package:flutter/material.dart";
import "package:flutter_mobx/flutter_mobx.dart";
import "package:get/get.dart";

import "../../../../../../../core/base/model/base_proje_model.dart";
import "../../../../../../../core/base/state/base_state.dart";
import "../../../../../../../core/components/charts/custom_pie_chart.dart";
import "../../../../../../../core/components/dialog/bottom_sheet/model/bottom_sheet_model.dart";
import "../../../../../../../core/components/helper_widgets/custom_label_widget.dart";
import "../../../../../../../core/components/list_view/rapor_filtre_date_time_bottom_sheet/view/rapor_filtre_date_time_bottom_sheet_view.dart";
import "../../../../../../../core/components/textfield/custom_text_field.dart";
import "../../../../../../../core/constants/extensions/list_extensions.dart";
import "../../../../../../../core/constants/extensions/widget_extensions.dart";
import "../../../../../../../core/constants/ui_helper/ui_helper.dart";
import "../../../../../../../core/init/cache/cache_manager.dart";
import "../../../../../../../core/init/network/login/api_urls.dart";
import "../../../../../model/param_model.dart";
import "../../../../cari/cari_listesi/model/cari_listesi_model.dart";
import "../model/urun_grubuna_gore_satis_grafigi_model.dart";
import "../view_model/urun_grubuna_gore_satis_grafigi_view_model.dart";

class UrunGrubunaGoreSatisGrafigiView extends StatefulWidget {
  final CariListesiModel? model;
  const UrunGrubunaGoreSatisGrafigiView({super.key, this.model});

  @override
  State<UrunGrubunaGoreSatisGrafigiView> createState() =>
      _UrunGrubunaGoreSatisGrafigiViewState();
}

class _UrunGrubunaGoreSatisGrafigiViewState
    extends BaseState<UrunGrubunaGoreSatisGrafigiView> {
  UrunGrubunaGoreSatisGrafigiViewModel viewModel =
      UrunGrubunaGoreSatisGrafigiViewModel();
  late final TextEditingController baslangicTarihiController;
  late final TextEditingController bitisTarihiController;
  late final TextEditingController grupNoController;
  late final TextEditingController cariController;
  late final TextEditingController plasiyerController;
  late final TextEditingController projeController;

  @override
  void initState() {
    baslangicTarihiController = TextEditingController();
    bitisTarihiController = TextEditingController();
    grupNoController = TextEditingController();
    cariController = TextEditingController();
    plasiyerController = TextEditingController();
    projeController = TextEditingController();
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
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration.zero, getData);
    return Scaffold(
      appBar: AppBar(title: const Text("Ürün Grubuna Göre Satış Grafiği")),
      body: SingleChildScrollView(
        child: Column(
          children: [
            RaporFiltreDateTimeBottomSheetView(
                filterOnChanged: (value) {
                  viewModel.donemTipiIndex = value ?? 0;
                  viewModel.model.donemTipi =
                      viewModel.donemTipiList[viewModel.donemTipiIndex];
                  viewModel.model.baslamaTarihi =
                      baslangicTarihiController.text;
                  viewModel.model.bitisTarihi = bitisTarihiController.text;
                  getData();
                },
                baslangicTarihiController: baslangicTarihiController,
                bitisTarihiController: bitisTarihiController),
            Row(
              children: [
                Expanded(
                    child: CustomTextField(
                  labelText: "Grup No",
                  controller: grupNoController,
                  readOnly: true,
                  suffixMore: true,
                  onTap: () async {
                    final result = await bottomSheetDialogManager
                        .showBottomSheetDialog(context,
                            title: "Grup No",
                            children: viewModel.grupNoBottomSheetList);
                    if (result != null) {
                      grupNoController.text = result;
                      viewModel.model.grupNo =
                          int.tryParse(result.split("").last);
                      getData();
                    }
                  },
                )),
                Expanded(
                    child: CustomTextField(
                        labelText: "Cari",
                        controller: cariController,
                        readOnly: true,
                        suffixMore: true,
                        onTap: () async {
                          final result = await Get.toNamed(
                              "/mainPage/cariListesi",
                              arguments: true);
                          if (result != null) {
                            cariController.text =
                                (result as CariListesiModel).cariKodu ?? "";
                            viewModel.model.cariKodu = result.cariKodu ?? "";
                            getData();
                          }
                        })),
              ],
            ),
            Row(
              children: [
                Expanded(
                    child: CustomTextField(
                  labelText: "Plasiyer",
                  controller: plasiyerController,
                  readOnly: true,
                  suffixMore: true,
                  onTap: () async {
                    final List<PlasiyerList>? plasiyerList =
                        CacheManager.getAnaVeri()?.paramModel?.plasiyerList;
                    if (plasiyerList != null) {
                      final PlasiyerList? result = await bottomSheetDialogManager
                          .showBottomSheetDialog(context,
                              title: "Plasiyer",
                              children: plasiyerList
                                  .map((e) => BottomSheetModel(
                                      title: e.plasiyerAciklama ?? "",
                                      value: e.plasiyerKodu ?? "",
                                      onTap: () => Get.back(result: e)))
                                  .toList());
                      if (result != null) {
                        plasiyerController.text = result.plasiyerAciklama ?? "";
                        viewModel.model.arrPlasiyerKodu = [
                          result.plasiyerKodu ?? ""
                        ];
                        getData();
                      }
                    }
                  },
                )).yetkiVarMi(yetkiController.plasiyerUygulamasiAcikMi),
                Expanded(
                    child: CustomTextField(
                        labelText: "Proje",
                        controller: projeController,
                        readOnly: true,
                        suffixMore: true,
                        onTap: () async {
                          if (viewModel.projeList.isEmptyOrNull) {
                            final result =
                                await networkManager.dioGet<BaseProjeModel>(
                                    path: ApiUrls.getProjeler,
                                    bodyModel: BaseProjeModel(),
                                    addCKey: true,
                                    addSirketBilgileri: true);
                            if (result.success == true) {
                              viewModel.setProjeList(result.data
                                  .map((e) => e as BaseProjeModel)
                                  .toList()
                                  .cast<BaseProjeModel>());
                            }
                          }
                          if (viewModel.projeList != null) {
                            // ignore: use_build_context_synchronously
                            final result = await bottomSheetDialogManager
                                .showBottomSheetDialog(context,
                                    title: "Proje",
                                    children: viewModel.projeList
                                        ?.map((e) => BottomSheetModel(
                                            title: e.projeAciklama ?? "",
                                            value: e.projeKodu ?? "",
                                            onTap: () => Get.back(result: e)))
                                        .toList());
                            if (result != null) {
                              projeController.text = result.projeAciklama ?? "";
                              viewModel.model.projeKodu =
                                  result.projeKodu ?? "";
                              getData();
                            }
                          }
                        })).yetkiVarMi(yetkiController.projeUygulamasiAcikMi),
              ],
            ),
            CustomWidgetWithLabel(
                child: Observer(
                    builder: (_) => SwitchListTile(
                        contentPadding: UIHelper.midPadding,
                        value: viewModel.irsDahilValue,
                        onChanged: (value) {
                          viewModel.setIrsDahilValue(value);
                          getData();
                        },
                        title: const Text("İrsaliye Dahil")))),
            Observer(
                builder: (_) => CustomPieChart(
                    pieChartValue: viewModel.modelList
                            ?.map((element) => element.netTutar ?? 0)
                            .toList()
                            .cast<double>() ??
                        [],
                    pieChartTitle: viewModel.modelList
                            ?.map((element) =>
                                "${element.grupAdi ?? element.grupKodu} %${element.oran}")
                            .toList()
                            .cast<String>() ??
                        [])),
          ],
        ).paddingAll(UIHelper.lowSize),
      ),
    );
  }

  void getData() async {
    final result = await networkManager.dioPost<UrunGrubunaGoreSatisGrafigiModel>(
        path: ApiUrls.getUrunGrubunaGoreSatisGrafigi,
        bodyModel: UrunGrubunaGoreSatisGrafigiModel(),
        data: viewModel.model.toJson());
    if (result.success == true) {
      viewModel.setModelList(result.data
          .map((e) => e as UrunGrubunaGoreSatisGrafigiModel)
          .toList()
          .cast<UrunGrubunaGoreSatisGrafigiModel>());
    }
  }
}
