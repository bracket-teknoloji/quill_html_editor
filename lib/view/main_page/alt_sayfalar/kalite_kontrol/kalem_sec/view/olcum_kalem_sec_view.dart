import "package:flutter/material.dart";
import "package:flutter_mobx/flutter_mobx.dart";
import "package:get/get.dart";

import "../../../../../../core/base/state/base_state.dart";
import "../../../../../../core/base/view/stok_rehberi/model/stok_rehberi_request_model.dart";
import "../../../../../../core/components/badge/colorful_badge.dart";
import "../../../../../../core/components/layout/custom_layout_builder.dart";
import "../../../../../../core/components/shimmer/list_view_shimmer.dart";
import "../../../../../../core/components/textfield/custom_app_bar_text_field.dart";
import "../../../../../../core/components/wrap/appbar_title.dart";
import "../../../../../../core/constants/enum/badge_color_enum.dart";
import "../../../../../../core/constants/extensions/number_extensions.dart";
import "../../../../../../core/constants/ondalik_utils.dart";
import "../../../../../../core/constants/ui_helper/ui_helper.dart";
import "../../olcum_belge_edit/model/olcum_belge_edit_model.dart";
import "../view_model/olcum_kalem_sec_view_model.dart";

class OlcumKalemSecView extends StatefulWidget {
  final OlcumBelgeModel model;
  const OlcumKalemSecView({super.key, required this.model});

  @override
  State<OlcumKalemSecView> createState() => _OlcumKalemSecViewState();
}

class _OlcumKalemSecViewState extends BaseState<OlcumKalemSecView> {
  OlcumKalemSecViewModel viewModel = OlcumKalemSecViewModel();
  late final ScrollController _scrollController;

  @override
  void initState() {
    _scrollController = ScrollController();
    viewModel.setRequestModel(widget.model..sayfa = 1);
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await viewModel.getData();
      _scrollController.addListener(() async {
        if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent && viewModel.dahaVarMi) {
          await viewModel.getData();
        }
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => BaseScaffold(
        appBar: AppBar(
          title: Observer(
            builder: (_) {
              if (viewModel.searchBar) {
                return CustomAppBarTextField(
                  onFieldSubmitted: viewModel.setSearchText,
                );
              }
              return AppBarTitle(
                title: "Kalem Seç",
                subtitle: widget.model.belgeNo,
              );
            },
          ),
          actions: [
            IconButton(
              onPressed: viewModel.setSearchBar,
              icon: Observer(
                builder: (_) => Icon(viewModel.searchBar ? Icons.search_off_outlined : Icons.search_outlined),
              ),
            ),
          ],
        ),
        body: RefreshIndicator.adaptive(
          onRefresh: () async => viewModel.resetSayfa(),
          child: Observer(
            builder: (_) {
              if (viewModel.olcumGirisiListesi == null) {
                return const ListViewShimmer();
              }
              if (viewModel.olcumGirisiListesi?.isEmpty ?? false) {
                return const Center(
                  child: Text("Kalem bulunamadı!"),
                );
              }
              return ListView.builder(
                primary: false,
                controller: _scrollController,
                itemCount: viewModel.olcumGirisiListesi?.length != null ? viewModel.olcumGirisiListesi!.length + 1 : 0,
                //musteriSiparisleriList?.length != null ? musteriSiparisleriList!.length + 1 : 0
                padding: UIHelper.lowPadding,
                physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
                itemBuilder: (context, index) {
                  if (index == viewModel.olcumGirisiListesi?.length) {
                    return Observer(
                      builder: (_) => Visibility(visible: viewModel.dahaVarMi, child: const Center(child: CircularProgressIndicator.adaptive())),
                    );
                  }
                  final OlcumBelgeModel item = viewModel.olcumGirisiListesi![index];
                  return Card(
                    child: ListTile(
                      onTap: () async {
                        if (!item.prosesVarMi) {
                          dialogManager.showErrorSnackBar("Bu kalemin prosesi bulunmamaktadır.");
                        } else {
                          Get.toNamed("/mainPage/olcumDetay", arguments: item);
                        }
                      },
                      onLongPress: () async {
                        if (yetkiController.stokKarti) {
                          dialogManager.showStokGridViewDialog(await networkManager.getStokModel(StokRehberiRequestModel(stokKodu: item.stokKodu)));
                        }
                      },
                      title: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(item.stokAdi ?? "", overflow: TextOverflow.ellipsis, maxLines: 1),
                          ColorfulBadge(
                            label: Text("Proses ${item.prosesVarMi ? "Var" : "Yok"}"),
                            badgeColorEnum: item.prosesVarMi ? BadgeColorEnum.basarili : BadgeColorEnum.hata,
                          ),
                        ],
                      ),
                      subtitle: CustomLayoutBuilder(
                        splitCount: 2,
                        children: [
                          Text("Stok Kodu: ${item.stokKodu ?? ""}"),
                          Text("Sıra: ${item.belgeSira ?? ""}"),
                          Text("Miktar: ${item.miktar.commaSeparatedWithDecimalDigits(OndalikEnum.miktar)}"),
                        ],
                      ),
                    ),
                  );
                },
              ).paddingAll(UIHelper.lowSize);
            },
          ),
        ),
      );
}
