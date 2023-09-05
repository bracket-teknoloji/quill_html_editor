import "package:flutter/material.dart";
import "package:flutter_mobx/flutter_mobx.dart";
import "package:flutter_staggered_animations/flutter_staggered_animations.dart";
import "package:get/get.dart";
import "package:kartal/kartal.dart";
import "package:picker/core/components/grid_tile/custom_animated_grid/model/islemler_menu_item/model/islemler_menu_item_constants.dart";

import "../../../../../view/main_page/alt_sayfalar/cari/cari_listesi/model/cari_listesi_model.dart";
import "../../../../../view/main_page/model/grid_item_model.dart";
import "../../../../../view/main_page/model/menu_item/menu_item_constants.dart";
import "../../../../base/state/base_state.dart";
import "../../../../constants/enum/islem_tipi_enum.dart";
import "../../../../constants/ui_helper/ui_helper.dart";
import "../../animated_islemler_grid_tile.dart";
import "../view_model/custom_animated_grid_view_model.dart";

class CustomAnimatedGridView<T> extends StatefulWidget {
  final CariListesiModel? cariListesiModel;
  final IslemTipiEnum islemTipi;
  final T? model;
  final String? title;
  const CustomAnimatedGridView({super.key, this.cariListesiModel, required this.islemTipi, this.model, this.title});
  @override
  State<CustomAnimatedGridView> createState() => _CustomAnimatedGridViewState();
}

class _CustomAnimatedGridViewState extends BaseState<CustomAnimatedGridView> {
  CustomAnimatedGridViewModel viewModel = CustomAnimatedGridViewModel();
  bool get islemMi => widget.islemTipi == IslemTipiEnum.cari || widget.islemTipi == IslemTipiEnum.stok || widget.islemTipi == IslemTipiEnum.siparis;
  bool get cariMi => widget.islemTipi == IslemTipiEnum.cari;
  bool get stokMu => widget.islemTipi == IslemTipiEnum.stok;
  bool get siparisMi => widget.islemTipi == IslemTipiEnum.siparis;
  bool get raporMu => widget.islemTipi == IslemTipiEnum.cariRapor || widget.islemTipi == IslemTipiEnum.stokRapor;
  List<GridItemModel> result = MenuItemConstants().getList();
  @override
  void initState() {
    // viewModel.setGridItemModel(result.getList().first.altMenuler?.where((element) => element.title == "Raporlar").first.altMenuler?.where((element) => element.yetkiKontrol == true).toList());
    if (islemMi) {
      IslemlerMenuItemConstants islemlerResult = IslemlerMenuItemConstants(islemtipi: widget.islemTipi, raporlar: getRaporList(widget.islemTipi), model: widget.cariListesiModel ?? widget.model);
      viewModel.setGridItemModel(islemlerResult.islemlerList.whereType<GridItemModel>().toList());
    } else if (raporMu) {
      if (widget.islemTipi == IslemTipiEnum.cariRapor) {
        viewModel.setGridItemModel(getRaporList(IslemTipiEnum.cari)?.first.altMenuler);
      } else if (widget.islemTipi == IslemTipiEnum.stokRapor) {
        viewModel.setGridItemModel(getRaporList(IslemTipiEnum.stok)?.first.altMenuler);
      }else if (widget.islemTipi == IslemTipiEnum.siparis){
        viewModel.setGridItemModel(getRaporList(IslemTipiEnum.siparis)?.first.altMenuler);
      }
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          children: [
            Observer(builder: (_) {
              return Visibility(
                visible: viewModel.returnGridItemModel.isNotEmpty,
                child: IconButton(
                  onPressed: () {
                    viewModel.setGridItemModel(viewModel.returnGridItemModel.last.toList());
                    viewModel.deleteLastReturnGridItemModel();
                  },
                  icon: Icon(Icons.arrow_back_outlined, color: theme.colorScheme.primary),
                ),
              );
            }),
            Expanded(
                child: SizedBox(
                    child: Text(widget.title ?? widget.cariListesiModel?.cariKodu ?? widget.model.stokKodu, style: theme.appBarTheme.titleTextStyle?.copyWith(overflow: TextOverflow.ellipsis))
                        .paddingOnly(left: UIHelper.midSize)))
          ],
        ),
        const Divider(
          indent: 0,
          endIndent: 0,
        ).paddingSymmetric(vertical: UIHelper.lowSize),
        AnimatedContainer(
          duration: const Duration(milliseconds: 500),
          padding: UIHelper.lowPadding,
          constraints: BoxConstraints(
            minHeight: context.sized.dynamicHeight(0.2),
          ),
          child: AnimationLimiter(
            child: Observer(builder: (_) {
              return GridView.builder(
                padding: UIHelper.zeroPadding,
                shrinkWrap: true,
                // physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: MediaQuery.of(context).size.width ~/ 85 > 6 ? 6 : MediaQuery.of(context).size.width ~/ 85,
                  childAspectRatio: context.isLandscape ? 1.2 : 0.9,
                ),
                itemCount: viewModel.gridItemModelList?.length ?? 0,
                itemBuilder: (context, index) {
                  var item = viewModel.gridItemModelList?[index];
                  return AnimationConfiguration.staggeredList(
                      position: index,
                      duration: const Duration(milliseconds: 900),
                      delay: const Duration(milliseconds: 50),
                      child: ScaleAnimation(
                          curve: Curves.fastLinearToSlowEaseIn,
                          duration: const Duration(milliseconds: 900),
                          child: FadeInAnimation(
                              child: AnimatedIslemlerGridTile(
                                  icon: item?.icon ?? "monitoring",
                                  iconWidget: item?.iconData,
                                  altMenuler: item?.altMenuler,
                                  menuTipi: item?.menuTipi,
                                  altMenuVarMi: item?.altMenuVarMi,
                                  color: item?.color,
                                  name: item?.name.toString(),
                                  title: item?.title.toString(),
                                  onTap: () {
                                    if (item?.menuTipi == "S" || item?.menuTipi == "A") {
                                      viewModel.addReturnGridItemModel(viewModel.gridItemModelList);
                                      viewModel.setGridItemModel(item?.altMenuler);
                                    } else {
                                      Get.back();
                                      if (item?.route != null && item?.menuTipi != "SR") {
                                        Get.toNamed(item?.route ?? "", arguments: widget.cariListesiModel ?? widget.model);
                                      } else {
                                        item?.onTap?.call();
                                      }
                                      // call with arguments
                                    }
                                  }))));
                },
              );
            }),
          ),
        ),
      ],
    ).paddingAll(UIHelper.lowSize);
  }

  List<GridItemModel>? getRaporList(IslemTipiEnum menu) {
    //if result is not contains any menu.value return null
    if (!result.any((element) => element.title == menu.value)) {
      return null;
    }
    return result.where((element) => element.title == menu.value).first.altMenuler?.where((element) => element.title == "Raporlar").toList();
  }
}
