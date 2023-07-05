import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:kartal/kartal.dart';
import 'package:picker/core/components/grid_tile/custom_animated_grid/model/islemler_menu_item_constants.dart';

import '../../../../../view/main_page/alt_sayfalar/cari/cari_listesi/model/cari_listesi_model.dart';
import '../../../../../view/main_page/model/grid_item_model.dart';
import '../../../../../view/main_page/model/menu_item/menu_item_constants.dart';
import '../../../../base/state/base_state.dart';
import '../../../../constants/enum/islem_tipi_enum.dart';
import '../../../../constants/ui_helper/ui_helper.dart';
import '../../animated_islemler_grid_tile.dart';
import '../view_model/custom_animated_grid_view_model.dart';

class CustomAnimatedGridView<T> extends StatefulWidget {
  final List<GridItemModel>? gridItemModelList;
  final CariListesiModel? cariListesiModel;
  final IslemTipi islemTipi;
  final T? model;
  const CustomAnimatedGridView({super.key, this.gridItemModelList, this.cariListesiModel, required this.islemTipi, this.model});

  @override
  State<CustomAnimatedGridView> createState() => _CustomAnimatedGridViewState();
}

class _CustomAnimatedGridViewState extends BaseState<CustomAnimatedGridView> {
  CustomAnimatedGridViewModel viewModel = CustomAnimatedGridViewModel();
  bool get islemMi => widget.islemTipi == IslemTipi.cari || widget.islemTipi == IslemTipi.stok;
  bool get raporMu => widget.islemTipi == IslemTipi.cariRapor || widget.islemTipi == IslemTipi.stokRapor;
  bool get serbestMi => widget.islemTipi == IslemTipi.cariSerbest || widget.islemTipi == IslemTipi.stokSerbest;
  @override
  void initState() {
    viewModel.setGridItemModel(widget.gridItemModelList);
    MenuItemConstants result = MenuItemConstants();
    // viewModel.setGridItemModel(result.getList().first.altMenuler?.where((element) => element.title == "Raporlar").first.altMenuler?.where((element) => element.yetkiKontrol == true).toList());
    if (islemMi) {
      IslemlerMenuItemConstants islemlerResult = IslemlerMenuItemConstants(
          islemtipi: widget.islemTipi,
          raporlar: [result.getList().first.altMenuler?.where((element) => element.title == "Raporlar").first, result.getList().where((element) => element.title == "Serbest Raporlar").first],
          model: widget.cariListesiModel ?? widget.model);
      viewModel.setGridItemModel(islemlerResult.islemler.cast<GridItemModel>());
    } else if (raporMu) {
      viewModel.setGridItemModel(result.getList().first.altMenuler?.where((element) => element.title == "Raporlar").first.altMenuler);
    } else if (serbestMi) {
      viewModel.setGridItemModel(result.getList().where((element) => element.title == "Serbest Raporlar").first.altMenuler);
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
                  icon: const Icon(Icons.arrow_back_outlined),
                ),
              );
            }),
            SizedBox(width: height * 0.3, child: Text(widget.cariListesiModel?.cariAdi ?? widget.model.stokKodu, style: theme.appBarTheme.titleTextStyle?.copyWith(overflow: TextOverflow.ellipsis)))
          ],
        ),
        const Divider(
          indent: 0,
          endIndent: 0,
        ).paddingSymmetric(vertical: UIHelper.lowSize),
        AnimatedContainer(
          duration: const Duration(milliseconds: 500),
          constraints: BoxConstraints(
            minHeight: context.dynamicHeight(0.2),
          ),
          child: AnimationLimiter(
            child: Observer(builder: (_) {
              return GridView.builder(
                padding: UIHelper.zeroPadding,
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
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
                                      if (item?.route != null){
                                       Get.toNamed(item?.route ?? "", arguments: widget.cariListesiModel ?? widget.model);
                                      }else {
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
}
