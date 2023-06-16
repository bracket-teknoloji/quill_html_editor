import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get/get.dart';
import 'package:picker/core/components/charts/custom_pie_chart.dart';
import 'package:picker/core/components/dialog/bottom_sheet/model/bottom_sheet_model.dart';
import 'package:picker/core/components/slide_controller/view/slide_controller_view.dart';
import 'package:picker/core/components/textfield/custom_text_field.dart';
import 'package:picker/core/components/widget/custom_label_widget.dart';
import 'package:picker/core/components/wrap/appbar_title.dart';
import 'package:picker/core/constants/extensions/number_extensions.dart';
import 'package:picker/core/constants/ui_helper/text_style_helper.dart';
import 'package:picker/core/constants/ui_helper/ui_helper.dart';
import 'package:picker/core/init/cache/cache_manager.dart';
import 'package:picker/view/main_page/alt_sayfalar/temsilci_profil/model/temsilci_profil_model.dart';
import 'package:picker/view/main_page/alt_sayfalar/temsilci_profil/view_model/temsilci_profil_view_model.dart';
import 'package:picker/view/main_page/model/param_model.dart';

import '../../../../../core/base/state/base_state.dart';
import '../../../../../core/components/charts/custom_line_chart.dart';
import '../../../../../core/init/network/login/api_urls.dart';

class TemsilciProfilView extends StatefulWidget {
  const TemsilciProfilView({super.key});

  @override
  State<TemsilciProfilView> createState() => _TemsilciProfilViewState();
}

class _TemsilciProfilViewState extends BaseState<TemsilciProfilView> {
  TemsilciProfilViewModel viewModel = TemsilciProfilViewModel();
  late TextEditingController plasiyerController;
  late TextEditingController cariController;
  late TextEditingController cariVKNController;

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
                    Row(
                      children: [
                        Expanded(
                            child: CustomWidgetWithLabel(
                                text: "KDV Dahil", children: [Observer(builder: (_) => Switch.adaptive(value: viewModel.kdvDahil, onChanged: (value) => viewModel.setKDVDahil(value)))])),
                        Expanded(
                            child: CustomWidgetWithLabel(
                                text: "İrsaliyeler Dahil",
                                children: [Observer(builder: (_) => Switch.adaptive(value: viewModel.irsaliyelerDahil, onChanged: (value) => viewModel.setIrsaliyelerDahil(value)))])),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                            child: CustomTextField(
                                labelText: "Plasiyer",
                                controller: plasiyerController,
                                readOnly: true,
                                onTap: () async {
                                  List<PlasiyerList> plasiyerList = CacheManager.getAnaVeri()?.paramModel?.plasiyerList ?? [];
                                  var result = await bottomSheetDialogManager.showBottomSheetDialog(context,
                                      title: "Plasiyer Seçiniz",
                                      children: plasiyerList.map((e) => BottomSheetModel(title: e.plasiyerAciklama ?? "", value: e.plasiyerKodu, onTap: () => Get.back(result: e))).toList());
                                  if (result != null) {
                                    plasiyerController.text = result.plasiyerAciklama ?? "";
                                  }
                                })),
                        Expanded(
                            child: CustomTextField(
                          labelText: "Cari",
                          controller: cariController,
                          readOnly: true,
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
                    ElevatedButton(
                        onPressed: () {
                          getData();
                          Get.back();
                        },
                        child: const Text("Uygula"))
                  ]));
            },
            icon: const Icon(Icons.filter_alt_outlined))
      ],
    );
  }

  Observer body(BuildContext context) {
    return Observer(builder: (_) {
      return viewModel.temsilciProfilList == null
          ? const Center(child: CircularProgressIndicator())
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
                    Card(child: Observer(builder: (_) {
                      return Column(
                        children: [
                          Text("Satışlar (Fatura)", style: TextStyleHelper.title),
                          Observer(builder: (_) => ListTile(title: const Text("Bugün"), trailing: Text("${viewModel.getBugunSatis.commaSeparatedWithFixedDigits} TL"))),
                          Observer(builder: (_) => ListTile(title: const Text("Bu Ay"), trailing: Text("${viewModel.getBuAySatis.commaSeparatedWithFixedDigits} TL"))),
                          Observer(builder: (_) => ListTile(title: const Text("Geçen Ay"), trailing: Text("${viewModel.getGecenAySatis.commaSeparatedWithFixedDigits} TL"))),
                          Observer(builder: (_) => ListTile(title: const Text("Bu Yıl"), trailing: Text("${viewModel.getBuYilSatis.commaSeparatedWithFixedDigits} TL"))),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Satış Performansı", style: TextStyleHelper.title),
                              OutlinedButton.icon(
                                  onPressed: () async {
                                    var result = await bottomSheetDialogManager.showBottomSheetDialog(context,
                                        title: "Dönem", children: viewModel.aylar.map((e) => BottomSheetModel(title: e, onTap: () => Get.back(result: e))).toList());
                                    if (result != null) {
                                      viewModel.setDonem(result);
                                      viewModel.setDonemKodu(viewModel.aylar.indexOf(result) + 1);
                                    }
                                  },
                                  icon: const Icon(Icons.more_horiz_outlined),
                                  label: Observer(builder: (_) => Text(viewModel.donem ?? "")))
                            ],
                          ),
                          Observer(builder: (_) {
                            return CustomPieChart(pieChartTitle: viewModel.getPlasiyerTitle, pieChartValue: viewModel.getPlasiyerToplam);
                          }),
                          Observer(builder: (_) {
                            return CustomLineChart(lineChartValue: viewModel.getAylikSatislar);
                          }),
                        ],
                      ).paddingAll(UIHelper.lowSize);
                    })),
                    Card(
                        child: Column(
                      children: [
                        Text("Alışlar (Fatura)", style: TextStyleHelper.title),
                        Observer(builder: (_) => ListTile(title: const Text("Bugün"), trailing: Text("${viewModel.getBugunAlis.commaSeparatedWithFixedDigits} TL"))),
                        Observer(builder: (_) => ListTile(title: const Text("Bu Ay"), trailing: Text("${viewModel.getBuAyAlis.commaSeparatedWithFixedDigits} TL"))),
                        Observer(builder: (_) => ListTile(title: const Text("Geçen Ay"), trailing: Text("${viewModel.getGecenAyAlis.commaSeparatedWithFixedDigits} TL"))),
                        Observer(builder: (_) => ListTile(title: const Text("Bu Yıl"), trailing: Text("${viewModel.getBuYilAlis.commaSeparatedWithFixedDigits} TL"))),
                        Observer(builder: (_) {
                          return CustomLineChart(lineChartValue: viewModel.getAylikAlislar);
                        }),
                      ],
                    ).paddingAll(UIHelper.lowSize)),
                    Card(
                        child: Column(
                      children: [
                        Text("Müşteri Siparişleri", style: TextStyleHelper.title),
                        Observer(builder: (_) => ListTile(title: const Text("Bugün"), trailing: Text("${viewModel.getBugunAlis.commaSeparatedWithFixedDigits} TL"))),
                        Observer(builder: (_) => ListTile(title: const Text("Bu Ay"), trailing: Text("${viewModel.getBuAyAlis.commaSeparatedWithFixedDigits} TL"))),
                        Observer(builder: (_) => ListTile(title: const Text("Geçen Ay"), trailing: Text("${viewModel.getGecenAyAlis.commaSeparatedWithFixedDigits} TL"))),
                        Observer(builder: (_) => ListTile(title: const Text("Bu Yıl"), trailing: Text("${viewModel.getBuYilAlis.commaSeparatedWithFixedDigits} TL"))),
                        Observer(builder: (_) {
                          return CustomLineChart(lineChartValue: viewModel.getAylikSiparisler);
                        }),
                      ],
                    ).paddingAll(UIHelper.lowSize)),
                    Card(
                        child: Column(
                      children: [
                        Text("Tahsilatlar", style: TextStyleHelper.title),
                        Observer(builder: (_) => ListTile(title: const Text("Bugün"), trailing: Text("${viewModel.getBugunTahsilatlar.commaSeparatedWithFixedDigits} TL"))),
                        Observer(builder: (_) => ListTile(title: const Text("Bu Ay"), trailing: Text("${viewModel.getBuAyTahsilatlar.commaSeparatedWithFixedDigits} TL"))),
                        Observer(builder: (_) => ListTile(title: const Text("Geçen Ay"), trailing: Text("${viewModel.getGecenAyTahsilatlar.commaSeparatedWithFixedDigits} TL"))),
                        Observer(builder: (_) => ListTile(title: const Text("Bu Yıl"), trailing: Text("${viewModel.getBuYilTahsilatlar.commaSeparatedWithFixedDigits} TL"))),
                        Observer(builder: (_) {
                          return CustomLineChart(lineChartValue: viewModel.getAylikTahsilatlar);
                        }),
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
