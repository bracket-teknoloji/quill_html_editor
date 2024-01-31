import "package:flutter/material.dart";
import "package:flutter/rendering.dart";
import "package:flutter_mobx/flutter_mobx.dart";
import "package:get/get.dart";
import "package:kartal/kartal.dart";
import "package:picker/core/base/state/base_state.dart";
import "package:picker/core/components/appbar/appbar_prefered_sized_bottom.dart";
import "package:picker/core/components/button/elevated_buttons/bottom_appbar_button.dart";
import "package:picker/core/components/card/transferler_card.dart";
import "package:picker/core/components/dialog/bottom_sheet/model/bottom_sheet_model.dart";
import "package:picker/core/components/floating_action_button/custom_floating_action_button.dart";
import "package:picker/core/components/shimmer/list_view_shimmer.dart";
import "package:picker/core/components/textfield/custom_app_bar_text_field.dart";
import "package:picker/core/components/wrap/appbar_title.dart";
import "package:picker/core/constants/enum/edit_tipi_enum.dart";
import "package:picker/core/constants/extensions/number_extensions.dart";
import "package:picker/core/constants/ui_helper/ui_helper.dart";
import "package:picker/view/main_page/alt_sayfalar/siparis/base_siparis_edit/model/base_siparis_edit_model.dart";
import "package:picker/view/main_page/alt_sayfalar/transfer/transferler/view_model/transferler_view_model.dart";

class TransferlerView extends StatefulWidget {
  final EditTipiEnum editTipiEnum;
  const TransferlerView({super.key, required this.editTipiEnum});

  @override
  State<TransferlerView> createState() => _TransferlerViewState();
}

class _TransferlerViewState extends BaseState<TransferlerView> {
  late final TransferlerViewModel viewModel;

  late final ScrollController _scrollController;

  @override
  void initState() {
    _scrollController = ScrollController();
    viewModel = TransferlerViewModel(pickerBelgeTuru: widget.editTipiEnum.rawValue, editTipiEnum: widget.editTipiEnum);
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await viewModel.getData();
      _scrollController.addListener(() async {
        if (_scrollController.position.userScrollDirection == ScrollDirection.reverse) {
          viewModel.setIsScrollDown(false);
        }
        if (_scrollController.position.userScrollDirection == ScrollDirection.forward) {
          viewModel.setIsScrollDown(true);
        }
        if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent && viewModel.dahaVarMi) {
          await viewModel.getData();
          viewModel.setIsScrollDown(true);
        }
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: appBar(context),
        floatingActionButton: fab(),
        body: body(),
      );

  AppBar appBar(BuildContext context) => AppBar(
        title: Observer(
          builder: (_) {
            if (viewModel.searchBar) {
              return CustomAppBarTextField(
                onFieldSubmitted: (String value) async {
                  viewModel.setSearchText(value);
                  await viewModel.resetPage();
                },
              );
            }
            return AppBarTitle(title: widget.editTipiEnum.getName, subtitle: viewModel.transferList?.length.toStringIfNotNull ?? "");
          },
        ),
        actions: <Widget>[
          IconButton(onPressed: () async => await viewModel.changeSearchBar(), icon: Observer(builder: (_) => Icon(viewModel.searchBar ? Icons.search_off_outlined : Icons.search_outlined))),
        ],
        bottom: AppBarPreferedSizedBottom(
          children: <AppBarButton?>[
            AppBarButton(
              icon: Icons.filter_alt_outlined,
              // onPressed: () async => await filtrele(),
              child: Text(loc(context).generalStrings.filter),
            ),
            AppBarButton(
              icon: Icons.sort_by_alpha_outlined,
              child: Text(loc(context).generalStrings.sort),
              onPressed: () async {
                final result = await bottomSheetDialogManager.showRadioBottomSheetDialog(
                  context,
                  title: "Sıralama",
                  groupValue: viewModel.faturaRequestModel.siralama,
                  children: List.generate(
                    viewModel.siralaMap.length,
                    (int index) => BottomSheetModel(
                      title: viewModel.siralaMap.keys.toList()[index],
                      value: viewModel.siralaMap.values.toList()[index],
                      groupValue: viewModel.siralaMap.values.toList()[index],
                    ),
                  ),
                );
                if (result != null) {
                  viewModel.setSiralama(result);
                  await viewModel.resetPage();
                }
              },
            ),
            AppBarButton(
              onPressed: () async {
                await bottomSheetDialogManager.showBottomSheetDialog(
                  context,
                  title: loc(context).generalStrings.options,
                  children: <BottomSheetModel>[
                    BottomSheetModel(
                      title: "Görünecek Ekstra Alanlar",
                      iconWidget: Icons.add_circle_outline_outlined,
                      onTap: () async {
                        Get.back();
                        await bottomSheetDialogManager.showBottomSheetDialog(
                          context,
                          title: "Görünecek Ekstra Alanlar",
                          body: Column(
                            children: <Widget>[
                              Observer(
                                builder: (_) => SwitchListTile.adaptive(
                                  title: const Text("Ek Açıklamalar"),
                                  value: viewModel.ekstraAlanlarMap["EK"] ?? false,
                                  onChanged: (bool value) => viewModel.changeEkstraAlanlarMap("EK", value),
                                ),
                              ),
                              Observer(
                                builder: (_) => SwitchListTile.adaptive(
                                  title: const Text("Miktar"),
                                  value: viewModel.ekstraAlanlarMap["MİK"] ?? false,
                                  onChanged: (bool value) {
                                    viewModel.changeEkstraAlanlarMap("MİK", value);
                                  },
                                ),
                              ),
                              Observer(
                                builder: (_) => SwitchListTile.adaptive(
                                  title: const Text("Vade"),
                                  value: viewModel.ekstraAlanlarMap["VADE"] ?? false,
                                  onChanged: (bool value) => viewModel.changeEkstraAlanlarMap("VADE", value),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ],
                );
              },
              child: const Icon(Icons.more_horiz_outlined),
            ),
          ],
        ),
      );

  Widget fab() => Observer(
        builder: (_) => CustomFloatingActionButton(
          isScrolledDown: viewModel.isScrolledDown && widget.editTipiEnum.eklensinMi,
        ),
      );

  RefreshIndicator body() => RefreshIndicator.adaptive(
        onRefresh: () async {
          await viewModel.resetPage();
          await viewModel.getData();
        },
        child: Observer(
          builder: (_) {
            if (viewModel.transferList.ext.isNullOrEmpty) {
              if (viewModel.transferList != null) {
                return const Center(
                  child: Text(
                    "Transfer Kaydı Bulunamadı.",
                  ),
                );
              } else {
                return const ListViewShimmer();
              }
            }
            return ListView.builder(
              padding: UIHelper.lowPadding,
              primary: false,
              physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
              controller: _scrollController,
              itemCount: viewModel.transferList != null ? ((viewModel.transferList?.length ?? 0) + (viewModel.dahaVarMi ? 1 : 0)) : 0,
              itemBuilder: (context, index) {
                if (index == viewModel.transferList?.length) {
                  return const Center(child: CircularProgressIndicator.adaptive());
                }
                final BaseSiparisEditModel item = viewModel.transferList![index];
                return TransferlerCard(
                  index: index,
                  model: item,
                  editTipiEnum: widget.editTipiEnum,
                  showEkAciklama: viewModel.ekstraAlanlarMap["EK"],
                  showMiktar: viewModel.ekstraAlanlarMap["MİK"],
                  showVade: viewModel.ekstraAlanlarMap["VADE"],
                  onDeleted: () async => await viewModel.resetPage(),
                  onUpdated: (value) async {
                    if (value) {
                      await viewModel.resetPage();
                    }
                  },
                );
              },
            );
          },
        ),
      );
}
