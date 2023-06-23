import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:kartal/kartal.dart';

import '../../../../../view/main_page/alt_sayfalar/cari/cari_listesi/model/cari_listesi_model.dart';
import '../../../../../view/main_page/model/grid_item_model.dart';
import '../../../../../view/main_page/model/menu_item/menu_item_constants.dart';
import '../../../../base/state/base_state.dart';
import '../../../../constants/ui_helper/ui_helper.dart';
import '../../animated_islemler_grid_tile.dart';
import '../view_model/custom_animated_grid_view_model.dart';

class CustomAnimatedGridView extends StatefulWidget {
  final List<GridItemModel>? gridItemModelList;
  final CariListesiModel? cariListesiModel;
  final bool? serbestMi;
  const CustomAnimatedGridView({super.key, this.gridItemModelList, this.cariListesiModel, this.serbestMi});

  @override
  State<CustomAnimatedGridView> createState() => _CustomAnimatedGridViewState();
}

class _CustomAnimatedGridViewState extends BaseState<CustomAnimatedGridView> {
  CustomAnimatedGridViewModel viewModel = CustomAnimatedGridViewModel();
  @override
  void initState() {
    viewModel.setGridItemModel(widget.gridItemModelList);
    MenuItemConstants result = MenuItemConstants();
    viewModel.setGridItemModel(result.getList().first.altMenuler?.where((element) => element.title == "Raporlar").first.altMenuler?.where((element) => element.yetkiKontrol == true).toList());
    if (widget.serbestMi == true) {
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
            SizedBox(width: height * 0.3, child: Text(widget.cariListesiModel?.cariAdi ?? "", style: theme.appBarTheme.titleTextStyle?.copyWith(overflow: TextOverflow.ellipsis)))
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
                  crossAxisCount: MediaQuery.of(context).size.width ~/ 85 > 5 ? 5 : MediaQuery.of(context).size.width ~/ 85,
                  childAspectRatio: 0.9,
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
                                  altMenuler: item?.altMenuler,
                                  menuTipi: item?.menuTipi,
                                  color: item?.color,
                                  name: item?.name.toString(),
                                  title: item?.title.toString(),
                                  onTap: () {
                                    if (item?.menuTipi == "S") {
                                      viewModel.addReturnGridItemModel(viewModel.gridItemModelList);
                                      viewModel.setGridItemModel(item?.altMenuler);
                                    } else {
                                      Get.back();
                                      if (widget.serbestMi == true) {
                                        item?.onTap?.call();
                                      } else {
                                        Get.toNamed(item?.route ?? "", arguments: widget.cariListesiModel);
                                      }
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
