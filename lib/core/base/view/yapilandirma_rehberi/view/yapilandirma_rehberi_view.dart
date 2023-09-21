import "package:flutter/material.dart";
import "package:flutter_mobx/flutter_mobx.dart";
import "package:flutter_staggered_animations/flutter_staggered_animations.dart";
import "package:get/get.dart";
import "package:kartal/kartal.dart";
import "package:picker/core/base/view/yapilandirma_rehberi/view_model/yapilandirma_rehberi_view_model.dart";
import "package:picker/core/components/wrap/appbar_title.dart";
import "package:picker/core/constants/ui_helper/ui_helper.dart";

import "../../../../../view/main_page/alt_sayfalar/stok/stok_liste/model/stok_listesi_model.dart";
import "../../../state/base_state.dart";

class YapilandirmaRehberiView extends StatefulWidget {
  final StokListesiModel model;
  const YapilandirmaRehberiView({super.key, required this.model});

  @override
  State<YapilandirmaRehberiView> createState() => _YapilandirmaRehberiViewState();
}

class _YapilandirmaRehberiViewState extends BaseState<YapilandirmaRehberiView> {
  YapilandirmaRehberiViewModel viewModel = YapilandirmaRehberiViewModel();

  @override
  void initState() {
    viewModel.setStokListesiModel(widget.model);
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      viewModel.getData();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: AppBarTitle(title: "Yapılandırma Rehberi", subtitle: "${widget.model.stokAdi} - ${widget.model.stokKodu}"),
        ),
        body: Observer(builder: (_) {
          if (viewModel.yapilandirmaProfilList == null) {
            return const Center(child: CircularProgressIndicator());
          }
          if (viewModel.yapilandirmaList?.isEmpty ?? true) {
            return Center(child: Text("${viewModel.stokListesiModel?.stokKodu ?? ""} ürünü için özellik tanımları bulunamadı!"));
          }
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Observer(builder: (_) => Text(viewModel.title)).paddingAll(UIHelper.highSize),
              const Divider(),
              Expanded(
                child: Observer(builder: (_) {
                  return Visibility(
                    visible: viewModel.filteredList.ext.isNotNullOrEmpty && viewModel.filteredList!.isNotEmpty,
                    child: AnimationLimiter(
                      child: GridView.builder(
                        physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: MediaQuery.of(context).size.width ~/ 90 > 10 ? 10 : MediaQuery.of(context).size.width ~/ 90,
                          childAspectRatio: 0.9,
                        ),
                        itemCount: (viewModel.filteredList?.length ?? 0) + (viewModel.page != 1 ? 1 : 0),
                        itemBuilder: (context, index) {
                          var item = viewModel.filteredList?[(viewModel.page != 1 ? index - 1 : index) < 0 ? 0 : (viewModel.page != 1 ? index - 1 : index)];
                          return AnimationConfiguration.staggeredList(
                              position: index,
                              duration: const Duration(milliseconds: 900),
                              delay: const Duration(milliseconds: 50),
                              child: ScaleAnimation(
                                  curve: Curves.fastLinearToSlowEaseIn,
                                  duration: const Duration(milliseconds: 900),
                                  child: FadeInAnimation(
                                      child: viewModel.page != 1 && index == 0
                                          ? Card(
                                              shape: RoundedRectangleBorder(borderRadius: UIHelper.lowBorderRadius),
                                              child: InkWell(
                                                onTap: () async {
                                                  viewModel.resetFilteredList();
                                                  await Future.delayed(const Duration(milliseconds: 50));
                                                  viewModel.decrementPage();
                                                },
                                                child: GridTile(
                                                  child: Center(
                                                    child: Icon(
                                                      Icons.arrow_back_ios,
                                                      size: UIHelper.highSize,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            )
                                          : Card(
                                              color: viewModel.color,
                                              shape: RoundedRectangleBorder(borderRadius: UIHelper.lowBorderRadius),
                                              child: InkWell(
                                                onTap: () async {
                                                  if (!viewModel.isLastPage) {
                                                    viewModel.setYapilandirmaRehberiModel(item);
                                                    viewModel.resetFilteredList();
                                                    await Future.delayed(const Duration(milliseconds: 50));
                                                    viewModel.incrementPage();
                                                  } else {
                                                    Get.back(result: item);
                                                  }
                                                },
                                                child: GridTile(
                                                  header: Text(item?.degerAciklama ?? ""),
                                                  footer: Text(item?.deger ?? ""),
                                                  child: Visibility(
                                                    visible: !viewModel.isLastPage,
                                                    child: Container(
                                                      alignment: Alignment.centerRight,
                                                      child: Icon(
                                                        Icons.arrow_forward_ios,
                                                        size: UIHelper.highSize,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ))));
                        },
                      ).paddingAll(UIHelper.highSize),
                    ),
                  );
                }),
              ),
            ],
          );
        }));
  }
}
