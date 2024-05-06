import "package:flutter/material.dart";
import "package:flutter_mobx/flutter_mobx.dart";
import "package:get/get.dart";
import "package:picker/core/init/cache/cache_manager.dart";
import "package:picker/view/add_company/model/account_model.dart";

import "../../../../../core/base/model/base_network_mixin.dart";
import "../../../../../core/base/model/generic_response_model.dart";
import "../../../../../core/base/state/base_state.dart";
import "../../../../../core/components/charts/custom_line_chart.dart";
import "../../../../../core/components/charts/custom_pie_chart.dart";
import "../../../../../core/components/dialog/bottom_sheet/model/bottom_sheet_model.dart";
import "../../../../../core/components/helper_widgets/custom_label_widget.dart";
import "../../../../../core/components/slide_controller/view/slide_controller_view.dart";
import "../../../../../core/components/textfield/custom_text_field.dart";
import "../../../../../core/components/wrap/appbar_title.dart";
import "../../../../../core/constants/extensions/number_extensions.dart";
import "../../../../../core/constants/extensions/widget_extensions.dart";
import "../../../../../core/constants/ondalik_utils.dart";
import "../../../../../core/constants/ui_helper/text_style_helper.dart";
import "../../../../../core/constants/ui_helper/ui_helper.dart";
import "../../../../../core/init/network/login/api_urls.dart";
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
    if (yetkiController.temsilciProfilKdvDahilMi) {
      viewModel.setKDVDahil(true);
    }
    WidgetsBinding.instance.addPostFrameCallback((Duration timeStamp) async {
      await getData();
    });
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
  Widget build(BuildContext context) => Scaffold(
        appBar: appBar(context),
        body: body(context),
      );

  AppBar appBar(BuildContext context) => AppBar(
        title: const AppBarTitle(
          title: "Profilim",
          subtitle: "Tüm Temsilciler",
        ),
        actions: <Widget>[
          IconButton(
            onPressed: () async {
              await bottomSheetDialogManager.showBottomSheetDialog(
                context,
                title: loc.generalStrings.filter,
                body: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Observer(
                      builder: (_) => SlideControllerWidget(
                        title: "İade Durumu",
                        childrenTitleList: const <String>["Hariç", "Dahil", "Sadece İadeler"],
                        filterOnChanged: (int? value) => viewModel.setIadeDurumuValueList(value ?? 0),
                        childrenValueList: viewModel.iadeDurumuValueList,
                        groupValue: viewModel.iadeDurumuValueList.firstWhereOrNull((bool element) => element),
                      ),
                    ),
                    Observer(
                      builder: (_) => SlideControllerWidget(
                        title: "Dönem",
                        childrenTitleList: <String>["Şirket Yılı (${CacheManager.getAnaVeri?.sirketModel?.yil ?? ""})", "Bu Yıl (${DateTime.now().year})", "Geçen Yıl (${DateTime.now().year - 1})"],
                        filterOnChanged: (int? value) => viewModel.setDonemValueList(value ?? 0),
                        childrenValueList: viewModel.donemValueList,
                        groupValue: viewModel.donemValueList.firstWhereOrNull((bool element) => element),
                      ),
                    ),
                    CustomTextField(
                      labelText: "Cari VKN",
                      controller: cariVKNController,
                      suffix: IconButton(
                        onPressed: () async {
                          final result = await Get.toNamed("/mainPage/cariListesi", arguments: true);
                          if (result != null) {
                            viewModel.temsilciProfilRequestModel.cariKodu = result.vergiNumarasi;
                            cariVKNController.text = result.vergiNumarasi ?? "";
                          }
                        },
                        icon: const Icon(Icons.more_horiz_outlined),
                      ),
                      onChanged: (String p0) => viewModel.temsilciProfilRequestModel.cariVKN = p0,
                    ),
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: CustomTextField(
                            labelText: "Plasiyer",
                            controller: plasiyerController,
                            readOnly: true,
                            suffixMore: true,
                            valueWidget: Observer(builder: (_) => Text(viewModel.plasiyer?.toString() ?? "")),
                            onClear: () => viewModel.setPlasiyer(null),
                            onTap: () async {
                              final result = await bottomSheetDialogManager.showPlasiyerBottomSheetDialog(context, viewModel.plasiyer);
                              if (result != null) {
                                plasiyerController.text = result.plasiyerAciklama ?? "";
                                viewModel.setPlasiyer(result.plasiyerKodu);
                              }
                            },
                          ),
                        ).yetkiVarMi(yetkiController.plasiyerUygulamasiAcikMi),
                        Expanded(
                          child: CustomTextField(
                            labelText: "Cari",
                            controller: cariController,
                            readOnly: true,
                            suffixMore: true,
                            onTap: () async {
                              final result = await Get.toNamed("/mainPage/cariListesi", arguments: true);
                              if (result != null) {
                                viewModel.temsilciProfilRequestModel.cariKodu = result.cariKodu;
                                cariController.text = result.cariKodu ?? "";
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: CustomWidgetWithLabel(
                            isVertical: true,
                            text: "KDV Dahil",
                            child: Observer(builder: (_) => Switch.adaptive(value: viewModel.kdvDahil, onChanged: (bool value) => viewModel.setKDVDahil(value))),
                          ).paddingAll(UIHelper.lowSize),
                        ).yetkiVarMi(!yetkiController.temsilciProfilKdvDahilMi && AccountModel.instance.admin == "E"),
                        Expanded(
                          child: CustomWidgetWithLabel(
                            isVertical: true,
                            text: "İrsaliyeler Dahil",
                            child: Observer(builder: (_) => Switch.adaptive(value: viewModel.irsaliyelerDahil, onChanged: (bool value) => viewModel.setIrsaliyelerDahil(value))),
                          ).paddingAll(UIHelper.lowSize),
                        ),
                      ],
                    ),
                    ElevatedButton(
                      onPressed: () {
                        getData();
                        Get.back();
                      },
                      child: Text(loc.generalStrings.apply),
                    ).paddingAll(UIHelper.lowSize),
                  ],
                ),
              );
            },
            icon: const Icon(Icons.filter_alt_outlined),
          ),
        ],
      );

  Observer body(BuildContext context) => Observer(
        builder: (_) => viewModel.temsilciProfilList == null
            ? const Center(child: CircularProgressIndicator.adaptive())
            : viewModel.temsilciProfilList!.isEmpty
                ? const Center(child: Text("Kayıt Bulunamadı"))
                : SingleChildScrollView(
                    child: Column(
                      children: <Widget>[
                        Card(
                          child: Column(
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  const Icon(Icons.info_outline),
                                  Observer(builder: (_) => Text(" ${viewModel.aciklama ?? ""}")),
                                ],
                              ),
                            ],
                          ).paddingAll(UIHelper.lowSize),
                        ),
                        Card(
                          child: Column(
                            children: <Widget>[
                              const Text("Satışlar (Fatura)", style: TextStyleHelper.title),
                              // Observer(builder: (_) => Row(children: [const Text("Bugün"), Text("${viewModel.getBugunSatis.commaSeparatedWithDecimalDigits(OndalikEnum.tutar)} $mainCurrency")])),
                              // Observer(builder: (_) => Row(children: [const Text("Bu Ay"), Text("${viewModel.getBuAySatis.commaSeparatedWithDecimalDigits(OndalikEnum.tutar)} $mainCurrency")])),
                              // Observer(builder: (_) => Row(children: [const Text("Geçen Ay"), Text("${viewModel.getGecenAySatis.commaSeparatedWithDecimalDigits(OndalikEnum.tutar)} $mainCurrency")])),
                              // Observer(builder: (_) => Row(children: [const Text("Bu Yıl"), Text("${viewModel.getBuYilSatis.commaSeparatedWithDecimalDigits(OndalikEnum.tutar)} $mainCurrency")])),
                              Observer(
                                builder: (_) => ListTile(title: const Text("Bugün"), trailing: Text("${viewModel.getBugunSatis.commaSeparatedWithDecimalDigits(OndalikEnum.tutar)} $mainCurrency")),
                              ),
                              Observer(
                                builder: (_) => ListTile(title: const Text("Bu Ay"), trailing: Text("${viewModel.getBuAySatis.commaSeparatedWithDecimalDigits(OndalikEnum.tutar)} $mainCurrency")),
                              ),
                              Observer(
                                builder: (_) =>
                                    ListTile(title: const Text("Geçen Ay"), trailing: Text("${viewModel.getGecenAySatis.commaSeparatedWithDecimalDigits(OndalikEnum.tutar)} $mainCurrency")),
                              ),
                              Observer(
                                builder: (_) => ListTile(title: const Text("Bu Yıl"), trailing: Text("${viewModel.getBuYilSatis.commaSeparatedWithDecimalDigits(OndalikEnum.tutar)} $mainCurrency")),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  const Text("Satış Performansı", style: TextStyleHelper.title),
                                  OutlinedButton.icon(
                                    onPressed: () async {
                                      final result = await bottomSheetDialogManager.showBottomSheetDialog(
                                        context,
                                        title: "Dönem",
                                        children: viewModel.aylar.map((String e) => BottomSheetModel(title: e, value: e)).toList(),
                                      );
                                      if (result != null) {
                                        viewModel.setDonemKodu(viewModel.aylar.indexOf(result) + 1);
                                      }
                                    },
                                    icon: const Icon(Icons.more_horiz_outlined),
                                    label: Observer(builder: (_) => Text(viewModel.donem)),
                                  ),
                                ],
                              ),
                              Observer(
                                builder: (_) {
                                  if (viewModel.getPlasiyerToplam.isEmpty) {
                                    return Center(child: const Text("Veri bulunamadı.").paddingAll(UIHelper.highSize));
                                  }
                                  return SizedBox(height: height * 0.3, child: CustomPieChart(pieChartTitle: viewModel.getPlasiyerTitle, pieChartValue: viewModel.getPlasiyerToplam));
                                },
                              ),
                              Observer(
                                builder: (_) {
                                  if (viewModel.getAylikSatislar.isEmpty) {
                                    return Center(child: const Text("Veri bulunamadı.").paddingAll(UIHelper.highSize));
                                  }
                                  return CustomLineChart(lineChartValue: viewModel.getAylikSatislar).yetkiVarMi(!yetkiController.temsilciProfilAylaraGoreSatisiGizle);
                                },
                              ),
                            ],
                          ).paddingAll(UIHelper.lowSize),
                        ),
                        Card(
                          child: Column(
                            children: <Widget>[
                              const Text("Alışlar (Fatura)", style: TextStyleHelper.title),
                              Observer(
                                builder: (_) => ListTile(title: const Text("Bugün"), trailing: Text("${viewModel.getBugunAlis.commaSeparatedWithDecimalDigits(OndalikEnum.tutar)} $mainCurrency")),
                              ),
                              Observer(
                                builder: (_) => ListTile(title: const Text("Bu Ay"), trailing: Text("${viewModel.getBuAyAlis.commaSeparatedWithDecimalDigits(OndalikEnum.tutar)} $mainCurrency")),
                              ),
                              Observer(
                                builder: (_) => ListTile(title: const Text("Geçen Ay"), trailing: Text("${viewModel.getGecenAyAlis.commaSeparatedWithDecimalDigits(OndalikEnum.tutar)} $mainCurrency")),
                              ),
                              Observer(
                                builder: (_) => ListTile(title: const Text("Bu Yıl"), trailing: Text("${viewModel.getBuYilAlis.commaSeparatedWithDecimalDigits(OndalikEnum.tutar)} $mainCurrency")),
                              ),
                              Observer(
                                builder: (_) {
                                  if (viewModel.getAylikAlislar.isEmpty) {
                                    return Center(child: const Text("Veri bulunamadı.").paddingAll(UIHelper.highSize));
                                  }
                                  return CustomLineChart(lineChartValue: viewModel.getAylikAlislar).yetkiVarMi(!yetkiController.temsilciProfilAylaraGoreTahsilatiGizle);
                                },
                              ),
                            ],
                          ).paddingAll(UIHelper.lowSize),
                        ),
                        Card(
                          child: Column(
                            children: <Widget>[
                              const Text("Müşteri Siparişleri", style: TextStyleHelper.title),
                              Observer(
                                builder: (_) => ListTile(title: const Text("Bugün"), trailing: Text("${viewModel.getBugunAlis.commaSeparatedWithDecimalDigits(OndalikEnum.tutar)} $mainCurrency")),
                              ),
                              Observer(
                                builder: (_) => ListTile(title: const Text("Bu Ay"), trailing: Text("${viewModel.getBuAyAlis.commaSeparatedWithDecimalDigits(OndalikEnum.tutar)} $mainCurrency")),
                              ),
                              Observer(
                                builder: (_) => ListTile(title: const Text("Geçen Ay"), trailing: Text("${viewModel.getGecenAyAlis.commaSeparatedWithDecimalDigits(OndalikEnum.tutar)} $mainCurrency")),
                              ),
                              Observer(
                                builder: (_) => ListTile(title: const Text("Bu Yıl"), trailing: Text("${viewModel.getBuYilAlis.commaSeparatedWithDecimalDigits(OndalikEnum.tutar)} $mainCurrency")),
                              ),
                              Observer(
                                builder: (_) {
                                  if (viewModel.getAylikSiparisler.isEmpty) {
                                    return Center(child: const Text("Veri bulunamadı.").paddingAll(UIHelper.highSize));
                                  }
                                  return CustomLineChart(lineChartValue: viewModel.getAylikSiparisler);
                                },
                              ),
                            ],
                          ).paddingAll(UIHelper.lowSize),
                        ),
                        Card(
                          child: Column(
                            children: <Widget>[
                              const Text("Tahsilatlar", style: TextStyleHelper.title),
                              Observer(
                                builder: (_) =>
                                    ListTile(title: const Text("Bugün"), trailing: Text("${viewModel.getBugunTahsilatlar.commaSeparatedWithDecimalDigits(OndalikEnum.tutar)} $mainCurrency")),
                              ),
                              Observer(
                                builder: (_) =>
                                    ListTile(title: const Text("Bu Ay"), trailing: Text("${viewModel.getBuAyTahsilatlar.commaSeparatedWithDecimalDigits(OndalikEnum.tutar)} $mainCurrency")),
                              ),
                              Observer(
                                builder: (_) =>
                                    ListTile(title: const Text("Geçen Ay"), trailing: Text("${viewModel.getGecenAyTahsilatlar.commaSeparatedWithDecimalDigits(OndalikEnum.tutar)} $mainCurrency")),
                              ),
                              Observer(
                                builder: (_) =>
                                    ListTile(title: const Text("Bu Yıl"), trailing: Text("${viewModel.getBuYilTahsilatlar.commaSeparatedWithDecimalDigits(OndalikEnum.tutar)} $mainCurrency")),
                              ),
                              Observer(
                                builder: (_) {
                                  if (viewModel.getAylikTahsilatlar.isEmpty) {
                                    return Center(child: const Text("Veri bulunamadı.").paddingAll(UIHelper.highSize));
                                  }
                                  return CustomLineChart(lineChartValue: viewModel.getAylikTahsilatlar).yetkiVarMi(!yetkiController.temsilciProfilSatisPerformansiniGizle);
                                },
                              ),
                            ],
                          ).paddingAll(UIHelper.lowSize),
                        ),
                      ],
                    ).paddingAll(UIHelper.lowSize),
                  ),
      );

  Future<void> getData() async {
    final GenericResponseModel<NetworkManagerMixin> result =
        await networkManager.dioGet<TemsilciProfilModel>(path: ApiUrls.getPlasiyerOzetRaporu, bodyModel: TemsilciProfilModel(), queryParameters: viewModel.temsilciProfilRequestModel.toJson());
    if (result.data != null) {
      viewModel.setAciklama(result.paramData?["ACIKLAMA"]);
      viewModel.setTemsilciProfilList(result.data.map((e) => e as TemsilciProfilModel).toList().cast<TemsilciProfilModel>());
    }
  }
}
