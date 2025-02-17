import "package:collection/collection.dart";
import "package:flutter/material.dart";
import "package:flutter_mobx/flutter_mobx.dart";
import "package:flutter_staggered_animations/flutter_staggered_animations.dart";
import "package:get/get.dart";
import "package:kartal/kartal.dart";

import "../../../../../view/main_page/alt_sayfalar/stok/stok_liste/model/stok_listesi_model.dart";
import "../../../../components/wrap/appbar_title.dart";
import "../../../../constants/ui_helper/ui_helper.dart";
import "../../../state/base_state.dart";
import "../view_model/yapilandirma_rehberi_view_model.dart";

final class YapilandirmaRehberiView extends StatefulWidget {
  const YapilandirmaRehberiView({required this.model, super.key});
  final StokListesiModel model;

  @override
  State<YapilandirmaRehberiView> createState() => _YapilandirmaRehberiViewState();
}

final class _YapilandirmaRehberiViewState extends BaseState<YapilandirmaRehberiView> {
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
  Widget build(BuildContext context) => BaseScaffold(
    appBar: AppBar(
      title: AppBarTitle(title: "Yapılandırma Rehberi", subtitle: "${widget.model.stokAdi} - ${widget.model.stokKodu}"),
    ),
    body: Observer(
      builder: (_) {
        if (viewModel.yapilandirmaList == null) {
          return const Center(child: CircularProgressIndicator.adaptive());
        } else if (viewModel.yapilandirmaList!.isEmpty) {
          return Center(
            child: Text("${viewModel.stokListesiModel?.stokKodu ?? ""} ürünü için özellik tanımları bulunamadı!"),
          );
        }
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Observer(builder: (_) => Text(viewModel.title)).paddingAll(UIHelper.highSize),
            const Divider(),
            Expanded(
              child: Observer(
                builder:
                    (_) => Visibility(
                      visible: viewModel.filteredList.ext.isNotNullOrEmpty,
                      child: AnimationLimiter(
                        child: GridView.builder(
                          physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount:
                                MediaQuery.sizeOf(context).width ~/ 90 > 10
                                    ? 10
                                    : MediaQuery.sizeOf(context).width ~/ 90,
                            childAspectRatio: 0.9,
                          ),
                          itemCount: (viewModel.filteredList?.length ?? 0) + (viewModel.page != 1 ? 1 : 0),
                          itemBuilder: (context, index) {
                            final item =
                                viewModel.filteredList?[(viewModel.page != 1 ? index - 1 : index) < 0
                                    ? 0
                                    : (viewModel.page != 1 ? index - 1 : index)];
                            return AnimationConfiguration.staggeredList(
                              position: index,
                              duration: const Duration(milliseconds: 500),
                              delay: const Duration(milliseconds: 50),
                              child: FadeInAnimation(
                                child:
                                    viewModel.page != 1 && index == 0
                                        ? Card(
                                          shape: RoundedRectangleBorder(borderRadius: UIHelper.midBorderRadius),
                                          child: InkWell(
                                            onTap: () async {
                                              viewModel.resetFilteredList();
                                              await Future.delayed(const Duration(milliseconds: 50));
                                              viewModel.decrementPage();
                                            },
                                            child: const GridTile(
                                              child: Center(child: Icon(Icons.arrow_back_ios, size: UIHelper.highSize)),
                                            ),
                                          ),
                                        )
                                        : Card(
                                          color: viewModel.color,
                                          shape: RoundedRectangleBorder(borderRadius: UIHelper.lowBorderRadius),
                                          child: InkWell(
                                            onTap: () async {
                                              final sonuc =
                                                  viewModel.yapilandirmaList
                                                      ?.where((element) => element.yapkod == item?.yapkod)
                                                      .map((element) => element.ozellikSira ?? 0)
                                                      .sum;
                                              viewModel.setMaxPage(sonuc);
                                              if (!viewModel.isLastPage) {
                                                viewModel.setYapilandirmaRehberiModel(item);

                                                await viewModel.incrementPage();
                                              } else {
                                                Get.back(result: item);
                                              }
                                            },
                                            child: GridTile(
                                              header: Text(item?.degerAciklama ?? "").paddingAll(UIHelper.lowSize),
                                              footer: Text(
                                                viewModel.isLastPage ? (item?.yapkod ?? "") : "",
                                                style: const TextStyle(fontSize: UIHelper.midSize),
                                              ).paddingAll(UIHelper.lowSize),
                                              child: Visibility(
                                                visible: !viewModel.isLastPage,
                                                child: Container(
                                                  alignment: Alignment.centerRight,
                                                  child: const Icon(Icons.arrow_forward_ios, size: UIHelper.highSize),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                              ),
                            );
                          },
                        ).paddingAll(UIHelper.highSize),
                      ),
                    ),
              ),
            ),
          ],
        );
      },
    ),
  );
}
