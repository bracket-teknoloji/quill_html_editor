import 'dart:math';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get/get.dart';
import 'package:kartal/kartal.dart';
import 'package:picker/core/components/dialog/bottom_sheet/model/bottom_sheet_model.dart';
import 'package:picker/core/components/wrap/appbar_title.dart';
import 'package:picker/core/constants/extensions/number_extensions.dart';
import 'package:picker/core/constants/ui_helper/duration_helper.dart';
import 'package:picker/core/constants/ui_helper/text_style_helper.dart';
import 'package:picker/core/constants/ui_helper/ui_helper.dart';
import 'package:picker/view/main_page/alt_sayfalar/temsilci_profil/model/temsilci_profil_model.dart';
import 'package:picker/view/main_page/alt_sayfalar/temsilci_profil/view_model/temsilci_profil_view_model.dart';

import '../../../../../core/base/state/base_state.dart';
import '../../../../../core/init/network/login/api_urls.dart';

class TemsilciProfilView extends StatefulWidget {
  const TemsilciProfilView({super.key});

  @override
  State<TemsilciProfilView> createState() => _TemsilciProfilViewState();
}

class _TemsilciProfilViewState extends BaseState<TemsilciProfilView> {
  TemsilciProfilViewModel viewModel = TemsilciProfilViewModel();

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const AppBarTitle(
          title: "Profilim",
          subtitle: "Tüm Temsilciler",
        ),
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.filter_alt_outlined))],
      ),
      body: Observer(builder: (_) {
        return viewModel.temsilciProfilList.isNullOrEmpty
            ? const Center(child: CircularProgressIndicator())
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
                        Observer(builder: (_) => ListTile(title: const Text("Bugün"), trailing: Text("${viewModel.getTodaySales.commaSeparatedWithFixedDigits} TL"))),
                        Observer(builder: (_) => ListTile(title: const Text("Bu Ay"), trailing: Text("${viewModel.getBuAyToplam.commaSeparatedWithFixedDigits} TL"))),
                        Observer(builder: (_) => ListTile(title: const Text("Geçen Ay"), trailing: Text("${viewModel.getGecenAyToplam.commaSeparatedWithFixedDigits} TL"))),
                        Observer(builder: (_) => ListTile(title: const Text("Bu Yıl"), trailing: Text("${viewModel.getBuYilToplam.commaSeparatedWithFixedDigits} TL"))),
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
                        SizedBox(
                          height: 200,
                          width: Get.width,
                          child: Observer(builder: (_) {
                            return PieChart(
                              PieChartData(
                                
                                startDegreeOffset: 0,
                                sections: List.generate(
                                    viewModel.temsilciProfilList!.where((element) => element.ayKodu == viewModel.donemKodu).map((element) => element.plasiyerAciklama).toSet().length,
                                    (index) => PieChartSectionData(
                                          showTitle: false,
                                          badgeWidget: Text(
                                            viewModel.temsilciProfilList!
                                                    .where((element) => element.ayKodu == viewModel.donemKodu)
                                                    .map((element) => element.plasiyerAciklama)
                                                    .toSet()
                                                    .elementAt(index) ??
                                                "",
                                            style: const TextStyle(color: Colors.white, fontSize: 8),
                                          ),
                                          radius: 30,
                                          borderSide: const BorderSide(color: Colors.white, width: 1),
                                          titlePositionPercentageOffset: 0.9,
                                          color: Colors.primaries[Random().nextInt(Colors.primaries.length)],
                                          title: viewModel.temsilciProfilList!.map((element) => element.plasiyerAciklama).toSet().elementAt(index),
                                          titleStyle: const TextStyle(color: Colors.white, fontSize: 8),
                                          value: viewModel.temsilciProfilList!
                                                  .where((element) => element.plasiyerAciklama == viewModel.temsilciProfilList!.map((element) => element.plasiyerAciklama).toSet().elementAt(index))
                                                  .map((e) => e.tutar)
                                                  .reduce((value, element) => value! + element!)
                                                  ?.toDouble() ??
                                              0,
                                        )),
                              ),
                              swapAnimationCurve: Curves.bounceIn,
                              swapAnimationDuration: DurationHelper.durationLow,
                            );
                          }),
                        ),
                      ],
                    ).paddingAll(UIHelper.lowSize);
                  }))
                ],
              ).paddingAll(UIHelper.lowSize));
      }),
    );
  }

  Future<void> getData() async {
    var result = await networkManager.dioGet<TemsilciProfilModel>(path: ApiUrls.getPlasiyerOzetRaporu, bodyModel: TemsilciProfilModel());
    if (result.data != null) {
      viewModel.setAciklama(result.paramData?["ACIKLAMA"]);
      viewModel.setTemsilciProfilList(result.data.map((e) => e as TemsilciProfilModel).toList().cast<TemsilciProfilModel>());
    }
  }
}
