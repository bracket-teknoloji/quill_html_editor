import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get/get.dart';
import 'package:picker/core/components/textfield/custom_text_field.dart';
import 'package:picker/core/constants/ui_helper/ui_helper.dart';
import 'package:picker/view/main_page/alt_sayfalar/stok/fiyat_gor/model/fiyat_gor_model.dart';
import 'package:picker/view/main_page/alt_sayfalar/stok/fiyat_gor/view_model/fiyat_gor_view_model.dart';

import '../../../../../../core/base/state/base_state.dart';
import '../../../../../../core/init/network/login/api_urls.dart';

class FiyatGorView extends StatefulWidget {
  const FiyatGorView({super.key});

  @override
  State<FiyatGorView> createState() => _FiyatGorViewState();
}

class _FiyatGorViewState extends BaseState<FiyatGorView> {
  FiyatGorViewModel viewModel = FiyatGorViewModel();
  late TextEditingController controller;
  @override
  void initState() {
    controller = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    controller = TextEditingController();
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Fiyat Gör"),
        ),
        body: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CustomTextField(
              labelText: "Stok/Barkod giriniz",
              controller: controller,
              suffix: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                      icon: const Icon(Icons.qr_code_2_outlined),
                      onPressed: () async {
                        var result = await Get.toNamed("/qr");
                        if (result != null) {
                          controller.text = result.toString();
                        }
                        getData();
                      }),
                  IconButton(
                      icon: const Icon(Icons.more_horiz_outlined),
                      onPressed: () async {
                        var result = await Get.toNamed("/mainPage/stokListesi", arguments: true);
                        if (result != null) {
                          controller.text = result.stokKodu.toString();
                          getData();
                        }
                      })
                ],
              ),
              onSubmitted: (p0) {
                getData();
              },
            ),
            Observer(builder: (_) {
              return viewModel.modelList != null
                  ? (viewModel.modelList?.isEmpty ?? true)
                      ? const Center(child: Text("Stok bulunamadı"))
                      : Column(
                          // direction: context.isPhone ? Axis.vertical : Axis.horizontal,
                          children: [
                            Card(
                              child: Observer(builder: (_) {
                                return Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text.rich(TextSpan(children: [
                                      const TextSpan(text: "Alış  KDV"),
                                      TextSpan(text: "  %${viewModel.modelList?.first?.kdvOrani ?? 0}", style: TextStyle(color: theme.textTheme.titleLarge?.color?.withOpacity(0.7))),
                                    ])),
                                    Wrap(
                                      children: List.generate(
                                          5,
                                          (index) => OutlinedButton(
                                                onPressed: () {},
                                                child: Text("${viewModel.titleList[index]}\n${viewModel.getBilgi(index)}").paddingAll(UIHelper.lowSize),
                                              ).paddingAll(UIHelper.lowSize)),
                                    ),
                                  ],
                                ).paddingAll(UIHelper.lowSize);
                              }),
                            ),
                            Card(
                              child: Observer(builder: (_) {
                                return Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text.rich(TextSpan(children: [
                                      const TextSpan(text: "Satış  KDV"),
                                      TextSpan(text: "  %${viewModel.modelList?.last?.kdvOrani ?? 0}", style: TextStyle(color: theme.textTheme.titleLarge?.color?.withOpacity(0.7))),
                                    ])),
                                    Wrap(
                                      children: List.generate(
                                          5,
                                          (index) => OutlinedButton(
                                                onPressed: () {},
                                                child: Text("${viewModel.titleList[index]}\n${viewModel.getBilgi(index, isSatis: true)}").paddingAll(UIHelper.lowSize),
                                              ).paddingAll(UIHelper.lowSize)),
                                    ),
                                  ],
                                ).paddingAll(UIHelper.lowSize);
                              }),
                            ),
                          ].map((e) => Container(decoration: BoxDecoration(borderRadius: UIHelper.lowBorderRadius), child: e).paddingAll(UIHelper.lowSize)).toList(),
                        )
                  : const SizedBox();
            })
          ],
        ));
  }

  void getData() async {
    viewModel.setModelList(null);
    var result = await networkManager.dioPost<FiyatGorModel>(path: ApiUrls.getFiyatGorFiyatlari, bodyModel: FiyatGorModel(), data: {"StokKodu": controller.text});
    viewModel.setModelList(result.data.map((e) => e as FiyatGorModel).toList().cast<FiyatGorModel>());
    // if (result.success == true) {
    // }
  }
}
