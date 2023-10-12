import "package:flutter/material.dart";
import "package:flutter_mobx/flutter_mobx.dart";
import "package:get/get.dart";
import "package:picker/core/constants/extensions/widget_extensions.dart";

import "../../../../../core/base/state/base_state.dart";
import "../../../../../core/components/charts/custom_line_chart.dart";
import "../../../../../core/components/charts/custom_pie_chart.dart";
import "../../../../../core/components/dialog/bottom_sheet/model/bottom_sheet_model.dart";
import "../../../../../core/components/helper_widgets/custom_label_widget.dart";
import "../../../../../core/components/slide_controller/view/slide_controller_view.dart";
import "../../../../../core/components/textfield/custom_text_field.dart";
import "../../../../../core/components/wrap/appbar_title.dart";
import "../../../../../core/constants/extensions/number_extensions.dart";
import "../../../../../core/constants/ondalik_utils.dart";
import "../../../../../core/constants/ui_helper/text_style_helper.dart";
import "../../../../../core/constants/ui_helper/ui_helper.dart";
import "../../../../../core/init/cache/cache_manager.dart";
import "../../../../../core/init/network/login/api_urls.dart";
import "../../../model/param_model.dart";
import "../model/temsilci_profil_model.dart";
import "../view_model/temsilci_profil_view_model.dart";

class TemsilciProfilView extends StatefulWidget {
  const TemsilciProfilView({super.key});

  @override
  State<TemsilciProfilView> createState() => _TemsilciProfilViewState();
}

class _TemsilciProfilViewState extends BaseState<TemsilciProfilView> {
  TemsilciProfilViewModel viewModel = TemsilciProfilViewModel();
  late final TextEditingController plasiyerController;
  late final TextEditingController cariController;
  late final TextEditingController cariVKNController;

  @override
  void initState() {
    plasiyerController = TextEditingController();
    cariController = TextEditingController();
    cariVKNController = TextEditingController();
    getData();
    super.initState();
  }

  @override
  void dispose() {
    plasiyerController.dispose();
    cariController.dispose();
    cariVKNController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context),
      body: body(context),
    );
  }

  AppBar appBar(BuildContext context) {
    return AppBar(
      title: const AppBarTitle(
        title: "Profilim",
        subtitle: "Tüm Temsilciler",
      ),
      actions: [
        IconButton(
            onPressed: () async {
              await bottomSheetDialogManager.showBottomSheetDialog(context,
                  title: "Filtrele",
                  body: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
                    Observer(
                        builder: (_) => SlideControllerWidget(
                            title: "İade Durumu",
                            childrenTitleList: const ["Hariç", "Dahil", "Sadece İadeler"],
                            filterOnChanged: (value) => viewModel.setIadeDurumuValueList(value ?? 0),
                            childrenValueList: viewModel.iadeDurumuValueList,
                            groupValue: viewModel.iadeDurumuValueList.firstWhere((element) => element))),
                    Observer(
                        builder: (_) => SlideControllerWidget(
                            title: "Dönem",
                            childrenTitleList: ["Şirket Yılı (${DateTime.now().year})", "Bu Yıl (${DateTime.now().year})", "Geçen Yıl (${DateTime.now().year - 1})"],
                            filterOnChanged: (value) => viewModel.setDonemValueList(value ?? 0),
                            childrenValueList: viewModel.donemValueList,
                            groupValue: viewModel.donemValueList.firstWhere((element) => element))),
                    CustomTextField(
                        labelText: "Cari VKN",
                        controller: cariVKNController,
                        suffix: IconButton(
                            onPressed: () async {
                              var result = await Get.toNamed("/mainPage/cariListesi", arguments: true);
                              if (result != null) {
                                viewModel.temsilciProfilRequestModel.cariKodu = result.vergiNumarasi;
                                cariVKNController.text = result.vergiNumarasi ?? "";
                              }
                            },
                            icon: const Icon(Icons.more_horiz_outlined)),
                        onChanged: (p0) => viewModel.temsilciProfilRequestModel.cariVKN = p0),
                    Row(
                      children: [
                        Expanded(
                            child: CustomTextField(
                                labelText: "Plasiyer",
                                controller: plasiyerController,
                                readOnly: true,
                                suffixMore: true,
                                onTap: () async {
                                  List<PlasiyerList> plasiyerList = CacheManager.getAnaVeri()?.paramModel?.plasiyerList ?? [];
                                  var result = await bottomSheetDialogManager.showBottomSheetDialog(context,
                                      title: "Plasiyer Seçiniz",
                                      children: plasiyerList.map((e) => BottomSheetModel(title: e.plasiyerAciklama ?? "", value: e.plasiyerKodu, onTap: () => Get.back(result: e))).toList());
                                  if (result != null) {
                                    plasiyerController.text = result.plasiyerAciklama ?? "";
                                  }
                                })).yetkiVarMi(yetkiController.plasiyerUygulamasiAcikMi),
                        Expanded(
                            child: CustomTextField(
                          labelText: "Cari",
                          controller: cariController,
                          readOnly: true,
                          suffixMore: true,
                          onTap: () async {
                            var result = await Get.toNamed("/mainPage/cariListesi", arguments: true);
                            if (result != null) {
                              viewModel.temsilciProfilRequestModel.cariKodu = result.cariKodu;
                              cariController.text = result.cariKodu ?? "";
                            }
                          },
                        )),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                            child: CustomWidgetWithLabel(
                                isVertical: true,
                                text: "KDV Dahil",
                                child: Observer(builder: (_) => Switch.adaptive(value: viewModel.kdvDahil, onChanged: (value) => viewModel.setKDVDahil(value)))).paddingAll(UIHelper.lowSize)),
                        Expanded(
                            child: CustomWidgetWithLabel(
                                    isVertical: true,
                                    text: "İrsaliyeler Dahil",
                                    child: Observer(builder: (_) => Switch.adaptive(value: viewModel.irsaliyelerDahil, onChanged: (value) => viewModel.setIrsaliyelerDahil(value))))
                                .paddingAll(UIHelper.lowSize)),
                      ],
                    ),
                    ElevatedButton(
                            onPressed: () {
                              getData();
                              Get.back();
                            },
                            child: const Text("Uygula"))
                        .paddingAll(UIHelper.lowSize)
                  ]).paddingAll(UIHelper.lowSize));
            },
            icon: const Icon(Icons.filter_alt_outlined))
      ],
    );
  }

  Observer body(BuildContext context) {
    return Observer(builder: (_) {
      return viewModel.temsilciProfilList == null
          ? const Center(child: CircularProgressIndicator.adaptive())
          : viewModel.temsilciProfilList!.isEmpty
              ? const Center(child: Text("Kayıt Bulunamadı"))
              : SingleChildScrollView(
                  child: Column(
                  children: [
                    Card(
                        child: Column(
                      children: [
                        Row(
                          children: [
                            const Icon(Icons.info_outline),
                            Observer(builder: (_) => Text(" ${viewModel.aciklama ?? ""}")),
                          ],
                        )
                      ],
                    ).paddingAll(UIHelper.lowSize)),
                    Card(
                        child: Column(
                      children: [
                        Text("Satışlar (Fatura)", style: TextStyleHelper.title),
                        // Observer(builder: (_) => Row(children: [const Text("Bugün"), Text("${viewModel.getBugunSatis.commaSeparatedWithDecimalDigits(OndalikEnum.tutar)} $mainCurrency")])),
                        // Observer(builder: (_) => Row(children: [const Text("Bu Ay"), Text("${viewModel.getBuAySatis.commaSeparatedWithDecimalDigits(OndalikEnum.tutar)} $mainCurrency")])),
                        // Observer(builder: (_) => Row(children: [const Text("Geçen Ay"), Text("${viewModel.getGecenAySatis.commaSeparatedWithDecimalDigits(OndalikEnum.tutar)} $mainCurrency")])),
                        // Observer(builder: (_) => Row(children: [const Text("Bu Yıl"), Text("${viewModel.getBuYilSatis.commaSeparatedWithDecimalDigits(OndalikEnum.tutar)} $mainCurrency")])),
                        Observer(builder: (_) => ListTile(title: const Text("Bugün"), trailing: Text("${viewModel.getBugunSatis.commaSeparatedWithDecimalDigits(OndalikEnum.tutar)} $mainCurrency"))),
                        Observer(builder: (_) => ListTile(title: const Text("Bu Ay"), trailing: Text("${viewModel.getBuAySatis.commaSeparatedWithDecimalDigits(OndalikEnum.tutar)} $mainCurrency"))),
                        Observer(
                            builder: (_) => ListTile(title: const Text("Geçen Ay"), trailing: Text("${viewModel.getGecenAySatis.commaSeparatedWithDecimalDigits(OndalikEnum.tutar)} $mainCurrency"))),
                        Observer(builder: (_) => ListTile(title: const Text("Bu Yıl"), trailing: Text("${viewModel.getBuYilSatis.commaSeparatedWithDecimalDigits(OndalikEnum.tutar)} $mainCurrency"))),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Satış Performansı", style: TextStyleHelper.title),
                            OutlinedButton.icon(
                                onPressed: () async {
                                  var result = await bottomSheetDialogManager.showBottomSheetDialog(context,
                                      title: "Dönem", children: viewModel.aylar.map((e) => BottomSheetModel(title: e, onTap: () => Get.back(result: e))).toList());
                                  if (result != null) {
                                    viewModel.setDonemKodu(viewModel.aylar.indexOf(result) + 1);
                                  }
                                },
                                icon: const Icon(Icons.more_horiz_outlined),
                                label: Observer(builder: (_) => Text(viewModel.donem)))
                          ],
                        ),
                        Observer(builder: (_) => SizedBox(height: height * 0.3, child: CustomPieChart(pieChartTitle: viewModel.getPlasiyerTitle, pieChartValue: viewModel.getPlasiyerToplam))),
                        Observer(builder: (_) => CustomLineChart(lineChartValue: viewModel.getAylikSatislar)),
                      ],
                    ).paddingAll(UIHelper.lowSize)),
                    Card(
                        child: Column(
                      children: [
                        Text("Alışlar (Fatura)", style: TextStyleHelper.title),
                        Observer(builder: (_) => ListTile(title: const Text("Bugün"), trailing: Text("${viewModel.getBugunAlis.commaSeparatedWithDecimalDigits(OndalikEnum.tutar)} $mainCurrency"))),
                        Observer(builder: (_) => ListTile(title: const Text("Bu Ay"), trailing: Text("${viewModel.getBuAyAlis.commaSeparatedWithDecimalDigits(OndalikEnum.tutar)} $mainCurrency"))),
                        Observer(
                            builder: (_) => ListTile(title: const Text("Geçen Ay"), trailing: Text("${viewModel.getGecenAyAlis.commaSeparatedWithDecimalDigits(OndalikEnum.tutar)} $mainCurrency"))),
                        Observer(builder: (_) => ListTile(title: const Text("Bu Yıl"), trailing: Text("${viewModel.getBuYilAlis.commaSeparatedWithDecimalDigits(OndalikEnum.tutar)} $mainCurrency"))),
                        Observer(builder: (_) {
                          return CustomLineChart(lineChartValue: viewModel.getAylikAlislar);
                        }),
                      ],
                    ).paddingAll(UIHelper.lowSize)),
                    Card(
                        child: Column(
                      children: [
                        Text("Müşteri Siparişleri", style: TextStyleHelper.title),
                        Observer(builder: (_) => ListTile(title: const Text("Bugün"), trailing: Text("${viewModel.getBugunAlis.commaSeparatedWithDecimalDigits(OndalikEnum.tutar)} $mainCurrency"))),
                        Observer(builder: (_) => ListTile(title: const Text("Bu Ay"), trailing: Text("${viewModel.getBuAyAlis.commaSeparatedWithDecimalDigits(OndalikEnum.tutar)} $mainCurrency"))),
                        Observer(
                            builder: (_) => ListTile(title: const Text("Geçen Ay"), trailing: Text("${viewModel.getGecenAyAlis.commaSeparatedWithDecimalDigits(OndalikEnum.tutar)} $mainCurrency"))),
                        Observer(builder: (_) => ListTile(title: const Text("Bu Yıl"), trailing: Text("${viewModel.getBuYilAlis.commaSeparatedWithDecimalDigits(OndalikEnum.tutar)} $mainCurrency"))),
                        Observer(builder: (_) => CustomLineChart(lineChartValue: viewModel.getAylikSiparisler)),
                      ],
                    ).paddingAll(UIHelper.lowSize)),
                    Card(
                        child: Column(
                      children: [
                        Text("Tahsilatlar", style: TextStyleHelper.title),
                        Observer(
                            builder: (_) => ListTile(title: const Text("Bugün"), trailing: Text("${viewModel.getBugunTahsilatlar.commaSeparatedWithDecimalDigits(OndalikEnum.tutar)} $mainCurrency"))),
                        Observer(
                            builder: (_) => ListTile(title: const Text("Bu Ay"), trailing: Text("${viewModel.getBuAyTahsilatlar.commaSeparatedWithDecimalDigits(OndalikEnum.tutar)} $mainCurrency"))),
                        Observer(
                            builder: (_) =>
                                ListTile(title: const Text("Geçen Ay"), trailing: Text("${viewModel.getGecenAyTahsilatlar.commaSeparatedWithDecimalDigits(OndalikEnum.tutar)} $mainCurrency"))),
                        Observer(
                            builder: (_) => ListTile(title: const Text("Bu Yıl"), trailing: Text("${viewModel.getBuYilTahsilatlar.commaSeparatedWithDecimalDigits(OndalikEnum.tutar)} $mainCurrency"))),
                        Observer(builder: (_) => CustomLineChart(lineChartValue: viewModel.getAylikTahsilatlar)),
                      ],
                    ).paddingAll(UIHelper.lowSize))
                  ],
                ).paddingAll(UIHelper.lowSize));
    });
  }

  Future<void> getData() async {
    var result =
        await networkManager.dioGet<TemsilciProfilModel>(path: ApiUrls.getPlasiyerOzetRaporu, bodyModel: TemsilciProfilModel(), queryParameters: viewModel.temsilciProfilRequestModel.toJson());
    if (result.data != null) {
      viewModel.setAciklama(result.paramData?["ACIKLAMA"]);
      viewModel.setTemsilciProfilList(result.data.map((e) => e as TemsilciProfilModel).toList().cast<TemsilciProfilModel>());
    }
  }
}
