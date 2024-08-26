import "package:flutter/material.dart";
import "package:flutter_mobx/flutter_mobx.dart";
import "package:flutter_staggered_animations/flutter_staggered_animations.dart";
import "package:get/get.dart";
import "package:kartal/kartal.dart";

import "../../../../../view/main_page/alt_sayfalar/cari/cari_listesi/model/cari_listesi_model.dart";
import "../../../../../view/main_page/model/grid_item_model.dart";
import "../../../../../view/main_page/model/menu_item/menu_item_constants.dart";
import "../../../../base/state/base_state.dart";
import "../../../../constants/enum/edit_tipi_enum.dart";
import "../../../../constants/enum/islem_tipi_enum.dart";
import "../../../../constants/extensions/list_extensions.dart";
import "../../../../constants/ui_helper/ui_helper.dart";
import "../../animated_islemler_grid_tile.dart";
import "../model/islemler_menu_item/model/islemler_menu_item_constants.dart";
import "../view_model/custom_animated_grid_view_model.dart";

final class CustomAnimatedGridView<T> extends StatefulWidget {
  final CariListesiModel? cariListesiModel;
  final IslemTipiEnum islemTipi;
  final EditTipiEnum? siparisTipi;
  final T? model;
  final String? title;
  final ValueChanged<bool>? onSelected;
  const CustomAnimatedGridView({super.key, this.cariListesiModel, required this.islemTipi, this.model, required this.title, this.siparisTipi, this.onSelected});
  @override
  State<CustomAnimatedGridView> createState() => _CustomAnimatedGridViewState();
}

final class _CustomAnimatedGridViewState extends BaseState<CustomAnimatedGridView> {
  final CustomAnimatedGridViewModel viewModel = CustomAnimatedGridViewModel();
  // bool get islemMi => widget.islemTipi == IslemTipiEnum.cari || widget.islemTipi == IslemTipiEnum.stok || widget.islemTipi == IslemTipiEnum.siparis;
  bool get cariMi => widget.islemTipi == IslemTipiEnum.cari;
  bool get stokMu => widget.islemTipi == IslemTipiEnum.stok;
  bool get siparisMi => widget.islemTipi == IslemTipiEnum.siparis;
  bool get kasaMi => widget.islemTipi == IslemTipiEnum.kasa;
  bool get raporMu =>
      widget.islemTipi == IslemTipiEnum.cariRapor || widget.islemTipi == IslemTipiEnum.stokRapor || widget.islemTipi == IslemTipiEnum.cariSerbest || widget.islemTipi == IslemTipiEnum.stokSerbest;
  // late List<GridItemModel> result;
  @override
  void initState() {
    viewModel.setGridItemModel(MenuItemConstants(context).getList());
    // viewModel.setGridItemModel(result.getList().firstOrNull?.altMenuler?.where((element) => element.title == "Raporlar").firstOrNull?.altMenuler?.where((element) => element.yetkiKontrol == true).toList());
    if (raporMu) {
      if (widget.islemTipi == IslemTipiEnum.cariRapor) {
        viewModel.setGridItemModel(getRaporList(IslemTipiEnum.cari)?.firstOrNull?.altMenuler?.where((element) => element.yetkiKontrol).toList() ?? []);
      } else if (widget.islemTipi == IslemTipiEnum.stokRapor) {
        viewModel.setGridItemModel(getRaporList(IslemTipiEnum.stok)?.firstOrNull?.altMenuler?.where((element) => element.yetkiKontrol).toList() ?? []);
      } else if (widget.islemTipi == IslemTipiEnum.siparis) {
        viewModel.setGridItemModel(getRaporList(IslemTipiEnum.siparis)?.firstOrNull?.altMenuler?.where((element) => element.siparisTipi == widget.siparisTipi).toList() ?? []);
      }
    } else {
      final IslemlerMenuItemConstants islemlerResult =
          IslemlerMenuItemConstants(islemTipi: widget.islemTipi, raporlar: getRaporList(widget.islemTipi), siparisTipi: widget.siparisTipi, model: widget.cariListesiModel ?? widget.model);
      viewModel.setGridItemModel(islemlerResult.islemlerList.nullCheckWithGeneric);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Observer(
                builder: (_) => Visibility(
                  visible: viewModel.returnGridItemModel.isNotEmpty,
                  child: IconButton(
                    onPressed: () {
                      viewModel.setGridItemModel(viewModel.returnGridItemModel.last.toList());
                      viewModel.deleteLastReturnGridItemModel();
                    },
                    icon: Icon(Icons.arrow_back_outlined, color: theme.colorScheme.primary),
                  ),
                ),
              ),
              Expanded(
                child: SizedBox(
                  child: Text(widget.title ?? loc.generalStrings.actions, style: theme.appBarTheme.titleTextStyle?.copyWith(overflow: TextOverflow.ellipsis)).paddingOnly(left: UIHelper.midSize),
                ),
              ),
            ],
          ),
          const Divider(
            indent: 0,
            endIndent: 0,
          ).paddingSymmetric(vertical: UIHelper.lowSize),
          Observer(
            builder: (_) {
              if (viewModel.gridItemModelList.ext.isNullOrEmpty) {
                return const Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("İşlem bulunamadı."),
                  ],
                );
              }
              return Container(
                padding: UIHelper.lowPadding,
                constraints: BoxConstraints(
                  minHeight: context.sized.dynamicHeight(0.2),
                  maxHeight: context.sized.dynamicHeight(0.6),
                ),
                child: Observer(
                  builder: (_) => GridView.builder(
                    padding: UIHelper.zeroPadding,
                    shrinkWrap: true,
                    primary: false,
                    // physics: const NeverScrollableScrollPhysics(),
                    addRepaintBoundaries: false,
                    addAutomaticKeepAlives: false,

                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: MediaQuery.sizeOf(context).width ~/ 85 > 6 ? 6 : MediaQuery.sizeOf(context).width ~/ 85,
                      childAspectRatio: context.isLandscape ? 1.2 : 1,
                    ),
                    itemCount: viewModel.gridItemModelList.length,
                    itemBuilder: (context, index) {
                      final item = viewModel.gridItemModelList[index];
                      return AnimationConfiguration.staggeredList(
                        key: Key(item.title),
                        position: index,
                        duration: const Duration(milliseconds: 900),
                        delay: const Duration(milliseconds: 50),
                        child: SlideAnimation(
                          delay: const Duration(milliseconds: 30),
                          child: FadeInAnimation(
                            child: AnimatedIslemlerGridTile(
                              item: item..icon = item.icon ?? "monitoring",
                              onTap: item.isEnabled == false && item.menuTipi == "IS"
                                  ? null
                                  : () async {
                                      if (item.altMenuVarMi) {
                                        viewModel.addReturnGridItemModel(viewModel.gridItemModelList);
                                        // await Future.delayed(const Duration(milliseconds: 1));
                                        viewModel.setGridItemModel(item.altMenuler?.where((element) => element.yetkiKontrol).toList() ?? []);
                                      } else {
                                        if (item.route != null && item.menuTipi != "SR") {
                                          Get.back();
                                          Get.toNamed(item.route ?? "", arguments: widget.cariListesiModel ?? widget.model);
                                        } else {
                                          Get.back();
                                          final result = await item.onTap?.call();
                                          if (result is bool) {
                                            widget.onSelected?.call(result);
                                          }
                                        }
                                      }
                                    },
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              );
            },
          ),
        ],
      ).paddingAll(UIHelper.lowSize);

  List<GridItemModel>? getRaporList(IslemTipiEnum menu) {
    //if result is not contains any menu.value return null
    if (!viewModel.gridItemModelList.any((element) => element.title == menu.value)) {
      return null;
    }
    return (viewModel.gridItemModelList.where((element) => element.title == menu.value).firstOrNull?.altMenuler?.where((element) => element.title == "Raporlar").toList() ?? []) +
        (getSerbestRaporList(menu) ?? []);
  }

  List<GridItemModel>? getSerbestRaporList(IslemTipiEnum menu) {
    if (menu case (IslemTipiEnum.cariRapor || IslemTipiEnum.cariSerbest)) return MenuItemConstants.getCariSerbestRapor;
    if (menu case (IslemTipiEnum.stok || IslemTipiEnum.stokRapor || IslemTipiEnum.stokSerbest)) return MenuItemConstants.getStokSerbestRapor;
    return null;
  }
}
