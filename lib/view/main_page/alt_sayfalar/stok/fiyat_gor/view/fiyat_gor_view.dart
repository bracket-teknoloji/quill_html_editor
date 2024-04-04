import "package:flutter/material.dart";
import "package:flutter_mobx/flutter_mobx.dart";
import "package:get/get.dart";
import "package:picker/core/base/view/stok_rehberi/model/stok_rehberi_request_model.dart";

import "../../../../../../core/base/state/base_state.dart";
import "../../../../../../core/components/textfield/custom_text_field.dart";
import "../../../../../../core/constants/extensions/number_extensions.dart";
import "../../../../../../core/constants/ondalik_utils.dart";
import "../../../../../../core/constants/ui_helper/ui_helper.dart";
import "../../../../../../core/init/network/login/api_urls.dart";
import "../../stok_liste/model/stok_listesi_model.dart";
import "../model/fiyat_gor_model.dart";
import "../view_model/fiyat_gor_view_model.dart";

class FiyatGorView extends StatefulWidget {
  final StokListesiModel? model;
  const FiyatGorView({super.key, this.model});

  @override
  State<FiyatGorView> createState() => _FiyatGorViewState();
}

class _FiyatGorViewState extends BaseState<FiyatGorView> {
  FiyatGorViewModel viewModel = FiyatGorViewModel();
  late final TextEditingController barkodKontroller;
  late final TextEditingController stokController;
  late final FocusNode focusNode;
  @override
  void initState() {
    focusNode = FocusNode();
    barkodKontroller = TextEditingController();
    stokController = TextEditingController();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      if (widget.model != null) {
        viewModel.setStokListesiModel(widget.model);
        barkodKontroller.text = widget.model?.stokKodu.toString() ?? "";
        stokController.text = widget.model?.stokAdi.toString() ?? "";
        await getData();
      }
      focusNode.requestFocus();
    });
    super.initState();
  }

  @override
  void dispose() {
    focusNode.dispose();
    barkodKontroller.dispose();
    stokController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text("Fiyat Gör"),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: UIHelper.lowPadding,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                CustomTextField(
                  labelText: "Stok/Barkod giriniz",
                  controller: barkodKontroller,
                  focusNode: focusNode,
                  suffix: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.qr_code_scanner),
                        onPressed: () async {
                          final result = await Get.toNamed("/qr");
                          if (result != null) {
                            barkodKontroller.text = result ?? "";
                            final stokKodu = await networkManager.getStokModel(
                              StokRehberiRequestModel(
                                menuKodu: "STOK_FGOR",
                                stokKodu: barkodKontroller.text,
                              ),
                            );
                            viewModel.setStokListesiModel(stokKodu);
                            stokController.text = stokKodu?.stokAdi ?? "";
                            await getData();
                          }
                        },
                      ),
                      IconButton(
                        icon: const Icon(Icons.more_horiz_outlined),
                        onPressed: () async {
                          final result = await Get.toNamed("/mainPage/stokListesi", arguments: true);
                          if (result is StokListesiModel) {
                            viewModel.setStokListesiModel(result);
                            barkodKontroller.text = result.stokKodu ?? " ";
                            stokController.text = result.stokAdi ?? " ";
                            getData();
                          }
                        },
                      ),
                    ],
                  ),
                  onSubmitted: (p0) async {
                    final result = await networkManager.getStokModel(StokRehberiRequestModel(stokKodu: p0));
                    if (result != null) {
                      viewModel.setStokListesiModel(result);
                    }
                    getData();
                  },
                ),
                Observer(
                  builder: (_) => Visibility(
                    visible: viewModel.stokListesiModel != null,
                    child: CustomTextField(
                      labelText: "Stok",
                      readOnly: true,
                      valueWidget: Observer(builder: (_) => Text(viewModel.stokListesiModel?.stokKodu ?? "")),
                      controller: stokController,
                      suffix: IconButton(
                        icon: Icon(Icons.open_in_new_outlined, color: theme.colorScheme.inversePrimary),
                        onPressed: () async {
                          dialogManager.showStokGridViewDialog(viewModel.stokListesiModel);
                        },
                      ),
                    ),
                  ),
                ),
                Observer(
                  builder: (_) => viewModel.modelList != null
                      ? (viewModel.modelList?.isEmpty ?? true)
                          ? const Center(child: Text("Stok bulunamadı"))
                          : Column(
                              // direction: context.isPhone ? Axis.vertical : Axis.horizontal,
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Card(
                                  child: Observer(
                                    builder: (_) => Column(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.stretch,
                                      children: [
                                        Text.rich(
                                          TextSpan(
                                            children: [
                                              const TextSpan(text: "Satış  KDV"),
                                              TextSpan(text: "  %${viewModel.modelList?.first?.kdvOrani ?? 0}", style: TextStyle(color: theme.textTheme.titleLarge?.color?.withOpacity(0.7))),
                                            ],
                                          ),
                                        ).paddingOnly(top: UIHelper.lowSize, left: UIHelper.midSize),
                                        GridView.builder(
                                          physics: const NeverScrollableScrollPhysics(),
                                          shrinkWrap: true,
                                          padding: UIHelper.lowPadding,
                                          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                            crossAxisCount: 3,
                                            crossAxisSpacing: UIHelper.midSize,
                                            mainAxisSpacing: UIHelper.midSize,
                                            childAspectRatio: 1.7,
                                          ),
                                          itemCount: 5,
                                          itemBuilder: (context, index) => InkWell(
                                            onTap: () async {
                                              if ((viewModel.getBilgi(index) ?? 0) > 0) {
                                                await Get.toNamed("mainPage/stokYazdir", arguments: viewModel.stokListesiModel);
                                              } else {
                                                dialogManager.showErrorSnackBar("Fiyat sıfır olduğu için yazdırılamaz");
                                              }
                                            },
                                            child: Card(
                                              color: theme.colorScheme.onSecondary,
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Text(viewModel.titleList[index]).paddingAll(UIHelper.lowSize),
                                                  const Divider(endIndent: UIHelper.lowSize, indent: UIHelper.lowSize),
                                                  Text("${viewModel.getBilgi(index,isSatis: true).commaSeparatedWithDecimalDigits(OndalikEnum.fiyat)} $mainCurrency").paddingAll(UIHelper.lowSize),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Card(
                                  child: Observer(
                                    builder: (_) => Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.stretch,
                                      children: [
                                        Text.rich(
                                          TextSpan(
                                            children: [
                                              const TextSpan(text: "Alış  KDV"),
                                              TextSpan(text: "  %${viewModel.modelList?.last?.kdvOrani ?? 0}", style: TextStyle(color: theme.textTheme.titleLarge?.color?.withOpacity(0.7))),
                                            ],
                                          ),
                                        ).paddingOnly(top: UIHelper.lowSize, left: UIHelper.midSize),
                                        GridView.builder(
                                          physics: const NeverScrollableScrollPhysics(),
                                          shrinkWrap: true,
                                          padding: UIHelper.lowPadding,
                                          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                            crossAxisCount: 3,
                                            crossAxisSpacing: UIHelper.midSize,
                                            mainAxisSpacing: UIHelper.midSize,
                                            childAspectRatio: 1.7,
                                          ),
                                          itemCount: 5,
                                          itemBuilder: (context, index) => InkWell(
                                            onTap: () async {
                                              if ((viewModel.getBilgi(index, isSatis: true) ?? 0) > 0) {
                                                await Get.toNamed("mainPage/stokYazdir", arguments: viewModel.stokListesiModel);
                                              } else {
                                                dialogManager.showErrorSnackBar("Fiyat sıfır olduğu için yazdırılamaz");
                                              }
                                            },
                                            child: Card(
                                              color: theme.colorScheme.onSecondary,
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Text(viewModel.titleList[index]).paddingAll(UIHelper.lowSize),
                                                  const Divider(endIndent: UIHelper.lowSize, indent: UIHelper.lowSize),
                                                  Text("${viewModel.getBilgi(index).commaSeparatedWithDecimalDigits(OndalikEnum.fiyat)} $mainCurrency").paddingAll(UIHelper.lowSize),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ].map((e) => Container(decoration: BoxDecoration(borderRadius: UIHelper.lowBorderRadius), child: e)).toList(),
                            )
                      : const SizedBox(),
                ),
              ],
            ),
          ),
        ),
      );

  Future<void> getData() async {
    // viewModel.setStokListesiModel(null);
    viewModel.setModelList(null);
    final result = await networkManager.dioPost<FiyatGorModel>(path: ApiUrls.getFiyatGorFiyatlari, bodyModel: FiyatGorModel(), data: {"StokKodu": viewModel.stokListesiModel?.stokKodu});
    viewModel.setModelList(result.data.map((e) => e as FiyatGorModel).toList().cast<FiyatGorModel>());
    // if (result.success == true) {
    // }
  }
}
