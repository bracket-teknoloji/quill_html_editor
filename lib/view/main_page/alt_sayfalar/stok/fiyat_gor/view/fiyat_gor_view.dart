import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get/get.dart';
import 'package:picker/core/components/helper_widgets/custom_label_widget.dart';
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
                        controller.text = await Get.toNamed("/qr") ?? "";
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
                  ? Wrap(
                      direction: context.isPhone ? Axis.vertical : Axis.horizontal,
                      children: [
                        Card(
                          child: Observer(builder: (_) {
                            return CustomWidgetWithLabel(
                              isVertical: true,
                              text: "Alış  KDV %${viewModel.modelList?.first?.kdvOrani ?? 0}",
                              children: [
                                Wrap(
                                  children: List.generate(
                                      5,
                                      (index) => ElevatedButton(
                                            onPressed: () {},
                                            child: Text("${viewModel.titleList[index]}\n${viewModel.getBilgi(index)}").paddingAll(UIHelper.lowSize),
                                          ).paddingAll(UIHelper.lowSize)),
                                ),
                              ],
                            );
                          }),
                        ),
                        Card(
                          child: Observer(builder: (_) {
                            return CustomWidgetWithLabel(
                              isVertical: true,
                              text: "Satış  KDV %${viewModel.modelList?.last?.kdvOrani ?? 0}",
                              children: [
                                Wrap(
                                  runAlignment: WrapAlignment.center,
                                  verticalDirection: VerticalDirection.down,
                                  alignment: WrapAlignment.center,
                                  children: List.generate(
                                      5,
                                      (index) => ElevatedButton(
                                            onPressed: () {},
                                            child: Text("${viewModel.titleList[index]}\n${viewModel.getBilgi(index)}"),
                                          )),
                                ),
                              ],
                            );
                          }),
                        ),
                      ].map((e) => Container(decoration: BoxDecoration(borderRadius: UIHelper.lowBorderRadius), child: e).paddingAll(UIHelper.lowSize)).toList(),
                    )
                  : const Center(child: CircularProgressIndicator.adaptive());
            })
          ],
        ));
  }

  void getData() async {
    var result = await networkManager.dioPost<FiyatGorModel>(path: ApiUrls.getFiyatGorFiyatlari, bodyModel: FiyatGorModel(), data: {"StokKodu": controller.text});
    viewModel.setModelList(result.data.map((e) => e as FiyatGorModel).toList().cast<FiyatGorModel>());
    // if (result.success == true) {
    // }
  }
}
