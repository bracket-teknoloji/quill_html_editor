import "package:flutter/foundation.dart";
import "package:flutter/material.dart";
import "package:flutter_mobx/flutter_mobx.dart";
import "package:get/get.dart";
import "package:picker/core/components/layout/custom_layout_builder.dart";
import "package:picker/core/init/cache/cache_manager.dart";
import "package:picker/view/add_company/model/account_model.dart";

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
import "../../../../../core/init/network/login/api_urls.dart";
import "../model/temsilci_profil_model.dart";
import "../view_model/temsilci_profil_view_model.dart";

final class TemsilciProfilView extends StatefulWidget {
  const TemsilciProfilView({super.key});

  @override
  State<TemsilciProfilView> createState() => _TemsilciProfilViewState();
}

final class _TemsilciProfilViewState extends BaseState<TemsilciProfilView> {
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
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
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
  Widget build(BuildContext context) => Scaffold(appBar: appBar(context), body: body(context));

  AppBar appBar(BuildContext context) => AppBar(
    title: const AppBarTitle(title: "Profilim", subtitle: "Tüm Temsilciler"),
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
                  builder:
                      (_) => SlideControllerWidget(
                        title: "İade Durumu",
                        childrenTitleList: const <String>["Hariç", "Dahil", "Sadece İadeler"],
                        filterOnChanged: (value) => viewModel.setIadeDurumuValueList(value ?? 0),
                        childrenValueList: viewModel.iadeDurumuValueList,
                        groupValue: viewModel.iadeDurumuValueList.firstWhereOrNull((element) => element),
                      ),
                ),
                Observer(
                  builder:
                      (_) => SlideControllerWidget(
                        title: "Dönem",
                        childrenTitleList: <String>[
                          "Şirket Yılı (${CacheManager.getAnaVeri?.sirketModel?.yil ?? ""})",
                          "Bu Yıl (${DateTime.now().year})",
                          "Geçen Yıl (${DateTime.now().year - 1})",
                        ],
                        filterOnChanged: (value) => viewModel.setDonemValueList(value ?? 0),
                        childrenValueList: viewModel.donemValueList,
                        groupValue: viewModel.donemValueList.firstWhereOrNull((element) => element),
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
                  onChanged: (p0) => viewModel.temsilciProfilRequestModel.cariVKN = p0,
                ),
                Row(
                  children: <Widget>[
                    if (yetkiController.plasiyerUygulamasiAcikMi)
                      Expanded(
                        child: CustomTextField(
                          labelText: "Plasiyer",
                          controller: plasiyerController,
                          readOnly: true,
                          suffixMore: true,
                          valueWidget: Observer(builder: (_) => Text(viewModel.plasiyer?.toString() ?? "")),
                          onClear: () => viewModel.setPlasiyer(null),
                          onTap: () async {
                            final result = await bottomSheetDialogManager.showPlasiyerBottomSheetDialog(
                              context,
                              viewModel.plasiyer,
                            );
                            if (result != null) {
                              plasiyerController.text = result.plasiyerAciklama ?? "";
                              viewModel.setPlasiyer(result.plasiyerKodu);
                            }
                          },
                        ),
                      ),
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
                    if (!yetkiController.temsilciProfilKdvDahilMi && AccountModel.instance.adminMi)
                      Expanded(
                        child: CustomWidgetWithLabel(
                          isVertical: true,
                          text: "KDV Dahil",
                          child: Observer(
                            builder:
                                (_) => Switch.adaptive(
                                  value: viewModel.kdvDahil,
                                  onChanged: (value) => viewModel.setKDVDahil(value),
                                ),
                          ),
                        ).paddingAll(UIHelper.lowSize),
                      ),
                    Expanded(
                      child: CustomWidgetWithLabel(
                        isVertical: true,
                        text: "İrsaliyeler Dahil",
                        child: Observer(
                          builder:
                              (_) => Switch.adaptive(
                                value: viewModel.irsaliyelerDahil,
                                onChanged: (value) => viewModel.setIrsaliyelerDahil(value),
                              ),
                        ),
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
    builder:
        (_) =>
            viewModel.temsilciProfilList == null
                ? const Center(child: CircularProgressIndicator.adaptive())
                : viewModel.temsilciProfilList!.isEmpty
                ? const Center(child: Text("Kayıt Bulunamadı"))
                : Column(
                  children: [
                    Card(
                      child: Column(
                        children: <Widget>[
                          ListTile(
                            leading: const Icon(Icons.info_outline),
                            title: Observer(builder: (_) => Text(" ${viewModel.aciklama ?? ""}")),
                          ),
                        ],
                      ),
                    ).paddingAll(UIHelper.lowSize),
                    if (kIsWeb && context.isLandscape)
                      Container(
                        constraints: BoxConstraints(maxHeight: height * 0.8),
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          itemExtent: context.isPortrait ? width / 1.3 : height / 1.3,
                          // shrinkExtent: width / 4,
                          // elevation: 0.9,
                          padding: const EdgeInsets.only(
                            top: UIHelper.lowSize,
                            bottom: UIHelper.lowSize,
                            right: UIHelper.lowSize,
                          ),
                          // itemSnapping: true,
                          // shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(bottomLeft: radius, bottomRight: radius)),
                          children: [satislarChart(), alislarChart(), siparislerChart(), tahsilatlarChart()],
                        ),
                      )
                    else
                      Expanded(
                        child: ListView(
                          children: <Widget>[satislarChart(), alislarChart(), siparislerChart(), tahsilatlarChart()],
                        ).paddingAll(UIHelper.lowSize),
                      ),
                  ],
                ),
  );

  Card tahsilatlarChart() => Card(
    child: Column(
      children: <Widget>[
        Row(
          children: [
            const Expanded(child: Text("Tahsilatlar", style: TextStyleHelper.title)),
            OutlinedButton.icon(
              onPressed: () async {
                final result = await bottomSheetDialogManager.showRadioBottomSheetDialog(
                  context,
                  groupValue: viewModel.tahsilatDonemKodu,
                  title: "Dönem",
                  children:
                      viewModel.aylar
                          .map((e) => BottomSheetModel(title: e, value: e, groupValue: viewModel.aylar.indexOf(e) + 1))
                          .toList(),
                );
                if (result != null) {
                  viewModel.setTahsilatDonemKodu(viewModel.aylar.indexOf(result) + 1);
                }
              },
              icon: const Icon(Icons.more_horiz_outlined),
              label: Observer(builder: (_) => Text(viewModel.tahsilatDonem)),
            ),
          ],
        ).paddingAll(UIHelper.lowSize),
        Observer(
          builder:
              (_) => ListTile(
                title: const Text("Nakit"),
                trailing: Text(
                  "${viewModel.getNakitTahsilat.commaSeparatedWithDecimalDigits(OndalikEnum.tutar)} $mainCurrency",
                ),
              ),
        ),
        Observer(
          builder:
              (_) => ListTile(
                title: const Text("Kredi Kartı"),
                trailing: Text(
                  "${viewModel.getKrediKartiTahsilat.commaSeparatedWithDecimalDigits(OndalikEnum.tutar)} $mainCurrency",
                ),
              ),
        ),
        Observer(
          builder:
              (_) => ListTile(
                title: const Text("Çek"),
                trailing: Text(
                  "${viewModel.getCekTahsilat.commaSeparatedWithDecimalDigits(OndalikEnum.tutar)} $mainCurrency",
                ),
              ),
        ),
        Observer(
          builder:
              (_) => ListTile(
                title: const Text("Senet"),
                trailing: Text(
                  "${viewModel.getSenetTahsilat.commaSeparatedWithDecimalDigits(OndalikEnum.tutar)} $mainCurrency",
                ),
              ),
        ),
        Observer(
          builder:
              (_) => ListTile(
                title: const Text("Dekont"),
                trailing: Text(
                  "${viewModel.getDekontTahsilat.commaSeparatedWithDecimalDigits(OndalikEnum.tutar)} $mainCurrency",
                ),
              ),
        ),
        Observer(
          builder:
              (_) => ListTile(
                title: const Text("Toplam"),
                trailing: Text(
                  "${viewModel.getToplamTahsilat.commaSeparatedWithDecimalDigits(OndalikEnum.tutar)} $mainCurrency",
                ),
              ),
        ),
        if (!yetkiController.temsilciProfilSatisPerformansiniGizle)
          Observer(
            builder: (_) {
              if (viewModel.getAylikTahsilatlar.isEmpty) {
                return Center(child: const Text("Veri bulunamadı.").paddingAll(UIHelper.highSize));
              }
              return CustomLineChart(lineChartValue: viewModel.getAylikTahsilatlar);
            },
          ),
      ],
    ).paddingAll(UIHelper.lowSize),
  );

  Card siparislerChart() => Card(
    child: Column(
      children: <Widget>[
        const Text("Müşteri Siparişleri", style: TextStyleHelper.title),
        Observer(
          builder:
              (_) => ListTile(
                title: const Text("Bugün"),
                trailing: Text(
                  "${viewModel.getBugunSiparis.commaSeparatedWithDecimalDigits(OndalikEnum.tutar)} $mainCurrency",
                ),
              ),
        ),
        Observer(
          builder:
              (_) => ListTile(
                title: const Text("Bu Ay"),
                trailing: Text(
                  "${viewModel.getBuAySiparis.commaSeparatedWithDecimalDigits(OndalikEnum.tutar)} $mainCurrency",
                ),
              ),
        ),
        Observer(
          builder:
              (_) => ListTile(
                title: const Text("Geçen Ay"),
                trailing: Text(
                  "${viewModel.getGecenAySiparis.commaSeparatedWithDecimalDigits(OndalikEnum.tutar)} $mainCurrency",
                ),
              ),
        ),
        Observer(
          builder:
              (_) => ListTile(
                title: const Text("Bu Yıl"),
                trailing: Text(
                  "${viewModel.getBuYilSiparis.commaSeparatedWithDecimalDigits(OndalikEnum.tutar)} $mainCurrency",
                ),
              ),
        ),
        if (!yetkiController.temsilciProfilAylaraGoreSatisiGizle)
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
  );

  Card alislarChart() => Card(
    child: Column(
      children: <Widget>[
        Observer(
          builder:
              (_) => Text(
                "Alışlar (Fatura${viewModel.irsaliyelerDahil ? " + İrsaliye" : ""})",
                style: TextStyleHelper.title,
              ),
        ),
        Observer(
          builder:
              (_) => ListTile(
                title: const Text("Bugün"),
                trailing: Text(
                  "${viewModel.getBugunAlis.commaSeparatedWithDecimalDigits(OndalikEnum.tutar)} $mainCurrency",
                ),
              ),
        ),
        Observer(
          builder:
              (_) => ListTile(
                title: const Text("Bu Ay"),
                trailing: Text(
                  "${viewModel.getBuAyAlis.commaSeparatedWithDecimalDigits(OndalikEnum.tutar)} $mainCurrency",
                ),
              ),
        ),
        Observer(
          builder:
              (_) => ListTile(
                title: const Text("Geçen Ay"),
                trailing: Text(
                  "${viewModel.getGecenAyAlis.commaSeparatedWithDecimalDigits(OndalikEnum.tutar)} $mainCurrency",
                ),
              ),
        ),
        Observer(
          builder:
              (_) => ListTile(
                title: const Text("Bu Yıl"),
                trailing: Text(
                  "${viewModel.getBuYilAlis.commaSeparatedWithDecimalDigits(OndalikEnum.tutar)} $mainCurrency",
                ),
              ),
        ),
        Observer(
          builder: (_) {
            if (viewModel.getAylikAlislar.isEmpty) {
              return Center(child: const Text("Veri bulunamadı.").paddingAll(UIHelper.highSize));
            }
            return CustomLineChart(lineChartValue: viewModel.getAylikAlislar);
          },
        ),
      ],
    ).paddingAll(UIHelper.lowSize),
  );

  Card satislarChart() => Card(
    child: Column(
      children: <Widget>[
        Observer(
          builder:
              (_) => Text(
                "Satışlar (Fatura${viewModel.irsaliyelerDahil ? " + İrsaliye" : ""})",
                style: TextStyleHelper.title,
              ),
        ),
        // Observer(builder: (_) => Row(children: [const Text("Bugün"), Text("${viewModel.getBugunSatis.commaSeparatedWithDecimalDigits(OndalikEnum.tutar)} $mainCurrency")])),
        // Observer(builder: (_) => Row(children: [const Text("Bu Ay"), Text("${viewModel.getBuAySatis.commaSeparatedWithDecimalDigits(OndalikEnum.tutar)} $mainCurrency")])),
        // Observer(builder: (_) => Row(children: [const Text("Geçen Ay"), Text("${viewModel.getGecenAySatis.commaSeparatedWithDecimalDigits(OndalikEnum.tutar)} $mainCurrency")])),
        // Observer(builder: (_) => Row(children: [const Text("Bu Yıl"), Text("${viewModel.getBuYilSatis.commaSeparatedWithDecimalDigits(OndalikEnum.tutar)} $mainCurrency")])),
        Observer(
          builder:
              (_) => ListTile(
                title: const Text("Bugün"),
                trailing: Text(
                  "${viewModel.getBugunSatis.commaSeparatedWithDecimalDigits(OndalikEnum.tutar)} $mainCurrency",
                ),
              ),
        ),
        Observer(
          builder:
              (_) => ListTile(
                title: const Text("Bu Ay"),
                trailing: Text(
                  "${viewModel.getBuAySatis.commaSeparatedWithDecimalDigits(OndalikEnum.tutar)} $mainCurrency",
                ),
              ),
        ),
        Observer(
          builder:
              (_) => ListTile(
                title: const Text("Geçen Ay"),
                trailing: Text(
                  "${viewModel.getGecenAySatis.commaSeparatedWithDecimalDigits(OndalikEnum.tutar)} $mainCurrency",
                ),
              ),
        ),
        Observer(
          builder:
              (_) => ListTile(
                title: const Text("Bu Yıl"),
                trailing: Text(
                  "${viewModel.getBuYilSatis.commaSeparatedWithDecimalDigits(OndalikEnum.tutar)} $mainCurrency",
                ),
              ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            const Text("Satış Performansı", style: TextStyleHelper.title),
            OutlinedButton.icon(
              onPressed: () async {
                final result = await bottomSheetDialogManager.showRadioBottomSheetDialog(
                  context,
                  groupValue: viewModel.donemKodu,
                  title: "Dönem",
                  children:
                      viewModel.aylar
                          .map((e) => BottomSheetModel(title: e, value: e, groupValue: viewModel.aylar.indexOf(e) + 1))
                          .toList(),
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
        if (!yetkiController.temsilciProfilSatisPerformansiniGizle)
          CustomLayoutBuilder(
            // direction: kIsWeb ? Axis.horizontal : Axis.vertical,
            splitCount: (kIsWeb && context.isLandscape) ? 2 : 1,
            // alignment: WrapAlignment.spaceEvenly,
            children: [
              Observer(
                builder: (_) {
                  if (viewModel.getPlasiyerToplam.isEmpty) {
                    return Center(child: const Text("Veri bulunamadı.").paddingAll(UIHelper.highSize));
                  }
                  return CustomPieChart(
                    pieChartTitle: viewModel.getPlasiyerTitle,
                    pieChartValue: viewModel.getPlasiyerToplam,
                  );
                },
              ),
              Observer(
                builder: (_) {
                  if (viewModel.getAylikSatislar.isEmpty) {
                    return Center(child: const Text("Veri bulunamadı.").paddingAll(UIHelper.highSize));
                  }
                  if (!yetkiController.temsilciProfilAylaraGoreSatisiGizle) {
                    return CustomLineChart(lineChartValue: viewModel.getAylikSatislar);
                  }
                  return const SizedBox.shrink();
                },
              ).paddingOnly(top: UIHelper.lowSize),
            ],
          ),
      ],
    ).paddingAll(UIHelper.lowSize),
  );

  Future<void> getData() async {
    final result = await networkManager.dioGet<TemsilciProfilModel>(
      path: ApiUrls.getPlasiyerOzetRaporu,
      bodyModel: TemsilciProfilModel(),
      queryParameters: viewModel.temsilciProfilRequestModel.toJson(),
    );
    if (result.isSuccess) {
      viewModel
        ..setAciklama(result.paramData?["ACIKLAMA"])
        ..setTemsilciProfilList(result.dataList);
    }
  }
}
