import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:kartal/kartal.dart";

import "../../../view/main_page/model/grid_item_model.dart";
import "../../base/state/base_state.dart";
import "../../constants/color_palette.dart";
import "../../constants/ui_helper/icon_helper.dart";
import "../../constants/ui_helper/ui_helper.dart";
import "../../init/cache/cache_manager.dart";
import "../../init/cache/favorites_model.dart";

class CustomGridTile extends StatefulWidget {
  final Function()? onTap;
  // final String? menuTipi;
  final GridItemModel? model;

  const CustomGridTile({super.key, this.onTap, this.model});

  @override
  CustomGridTileState createState() => CustomGridTileState();
}

class CustomGridTileState extends BaseState<CustomGridTile> {
  @override
  Widget build(BuildContext context) {
    Icon yetkiKontrol() {
      if (CacheManager.getFavoriler.values.any((element) => element.title == widget.model?.title)) {
        return const Icon(Icons.star, size: 20, color: Colors.white);
      } else {
        return const Icon(Icons.star_border, size: 20, color: Colors.white);
      }
    }

    Icon icon = yetkiKontrol();

    return InkWell(
      borderRadius: UIHelper.lowBorderRadius,
      splashFactory: InkRipple.splashFactory,
      splashColor: theme.primaryColor,
      onTap: widget.onTap,
      onLongPress: () {
        if (widget.model?.menuTipi == "I" || widget.model?.menuTipi == "SR") {
          if (icon.icon == Icons.star) {
            icon = const Icon(Icons.star_border, size: 20, color: Colors.white);
            CacheManager.removeFavoriler(widget.model?.title ?? "");
            dialogManager.hideSnackBar;
            dialogManager.showInfoSnackBar("Favorilerden çıkarıldı");
          } else {
            icon = const Icon(Icons.star, size: 20, color: Colors.white);
            CacheManager.setFavoriler(
              FavoritesModel(
                name: widget.model?.name,
                title: widget.model?.title,
                icon: widget.model?.icon,
                onTap: widget.model?.route,
                color: widget.model?.color?.value,
                arguments: widget.model?.arguments,
                menuTipi: widget.model?.menuTipi,
              ),
            );
            dialogManager.hideSnackBar;
            dialogManager.showColorfulSnackBar("Favorilere eklendi", widget.model?.color ?? ColorPalette.blueGray);
          }
          setState(() {});
        }
      },
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: UIHelper.lowBorderRadius),
        color: widget.model?.color,
        semanticContainer: true,
        child: GridTile(
          header: header(yetkiKontrol, icon),
          footer: footer(),
          child: widget.model?.menuTipi == "I"
              ? Center(
                  child: Container(
                    margin: UIHelper.lowPaddingHorizontal,
                    child: Text(
                      widget.model?.title ?? "",
                      textAlign: TextAlign.center,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      softWrap: true,
                      style: theme.textTheme.bodyMedium?.copyWith(color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                )
              : Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 500),
                      child: widget.model?.iconData == null
                          ? IconHelper.bigMenuIcon(
                              widget.model?.icon ?? "",
                            )
                          : IconTheme(
                              data: const IconThemeData(weight: 0.1, size: 30, color: Colors.white),
                              child: Icon(
                                widget.model?.iconData,
                                size: UIHelper.midSize * 3,
                                grade: 0.1,
                              ),
                            ),
                    ).marginOnly(bottom: UIHelper.lowSize),
                    Text(
                      widget.model?.menuTipi != "I" ? (widget.model?.title ?? "") : "",
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      // softWrap: true,
                      style: theme.textTheme.bodyMedium?.copyWith(color: Colors.white, fontWeight: FontWeight.bold),
                    ).paddingSymmetric(horizontal: UIHelper.lowSize),
                  ],
                ),
        ),
      ),
    );
  }

  Widget? header(Icon Function() yetkiKontrol, Icon icon) => (widget.model?.menuTipi == "I" || widget.model?.menuTipi == "SR")
      ? Align(
          alignment: Alignment.centerRight,
          child: InkWell(
            child: yetkiKontrol(),
            onTap: () {
              if (icon.icon == Icons.star) {
                icon = const Icon(Icons.star_border, size: 20, color: Colors.white);
                CacheManager.removeFavoriler(widget.model?.title ?? "");
                dialogManager.hideSnackBar;
                dialogManager.showInfoSnackBar("Favorilerden çıkarıldı");
              } else {
                icon = const Icon(Icons.star, size: 20, color: Colors.white);
                CacheManager.setFavoriler(
                  FavoritesModel(
                    name: widget.model?.name,
                    title: widget.model?.title,
                    icon: widget.model?.icon,
                    onTap: widget.model?.route,
                    color: widget.model?.color?.value,
                    arguments: widget.model?.arguments,
                    menuTipi: widget.model?.menuTipi,
                  ),
                );
                dialogManager.hideSnackBar;
                dialogManager.showInfoSnackBar("Favorilere eklendi");
              }
              setState(() {});
            },
          ),
        ).paddingOnly(right: UIHelper.lowSize / 2, top: UIHelper.lowSize / 2)
      : null;

  Widget footer() => (widget.model?.menuTipi == "S" && (widget.model?.altMenuler.ext.isNotNullOrEmpty ?? false)) ? const Icon(Icons.expand_more, size: 15, color: Colors.white) : const SizedBox();

  //
}
