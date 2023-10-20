import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:kartal/kartal.dart";

import "../../../view/main_page/model/grid_item_model.dart";
import "../../base/state/base_state.dart";
import "../../constants/ui_helper/icon_helper.dart";
import "../../constants/ui_helper/ui_helper.dart";
import "../../init/cache/cache_manager.dart";
import "../../init/cache/favorites_model.dart";

class CustomGridTile extends StatefulWidget {
  final String? name;
  final String? title;
  final String? icon;
  final Color? color;
  final String? route;
  final dynamic arguments;
  final List<GridItemModel>? altMenuler;
  final Function()? onTap;
  final String? menuTipi;
  final IconData? iconWidget;

  const CustomGridTile({super.key, this.name, this.title, this.icon, this.color, this.onTap, this.altMenuler, this.menuTipi, this.iconWidget, this.route, this.arguments});

  @override
  CustomGridTileState createState() => CustomGridTileState();
}

class CustomGridTileState extends BaseState<CustomGridTile> {
  @override
  Widget build(BuildContext context) {
    Icon yetkiKontrol() {
      if (CacheManager.getFavoriler().values.any((FavoritesModel element) => element.title == widget.title)) {
        return const Icon(Icons.star, size: 20);
      } else {
        return const Icon(Icons.star_border, size: 20);
      }
    }

    Icon icon = yetkiKontrol();

    return InkWell(
      borderRadius: UIHelper.lowBorderRadius,
      splashFactory: InkRipple.splashFactory,
      splashColor: theme.primaryColor,
      onTap: widget.onTap,
      onLongPress: () async {
        if (widget.menuTipi == "I" || widget.menuTipi == "SR") {
          if (icon.icon == Icons.star) {
            icon = const Icon(Icons.star_border, size: 20);
            await CacheManager.removeFavoriler(widget.title.toString());
            dialogManager.hideSnackBar;
            dialogManager.showInfoSnackBar("Favorilerden çıkarıldı");
          } else {
            icon = const Icon(Icons.star, size: 20);
            await CacheManager.setFavoriler(
                FavoritesModel(name: widget.name, title: widget.title, icon: widget.icon, onTap: widget.route, color: widget.color?.value, arguments: widget.arguments, menuTipi: widget.menuTipi));
            dialogManager.hideSnackBar;
            dialogManager.showInfoSnackBar("Favorilere eklendi");
          }
          setState(() {});
        }
      },
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: UIHelper.lowBorderRadius),
        color: widget.color,
        semanticContainer: true,
        child: GridTile(
            header: (widget.menuTipi == "I" || widget.menuTipi == "SR")
                ? Align(
                    alignment: Alignment.centerRight,
                    child: InkWell(
                      child: yetkiKontrol(),
                      onTap: () async {
                        if (icon.icon == Icons.star) {
                          icon = const Icon(Icons.star_border, size: 20);
                          await CacheManager.removeFavoriler(widget.title.toString());
                          dialogManager.hideSnackBar;
                          dialogManager.showInfoSnackBar("Favorilerden çıkarıldı");
                        } else {
                          icon = const Icon(Icons.star, size: 20);
                          await CacheManager.setFavoriler(FavoritesModel(
                              name: widget.name, title: widget.title, icon: widget.icon, onTap: widget.route, color: widget.color?.value, arguments: widget.arguments, menuTipi: widget.menuTipi));
                          dialogManager.hideSnackBar;
                          dialogManager.showInfoSnackBar("Favorilere eklendi");
                        }
                        setState(() {});
                      },
                    ))
                : null,
            footer: (widget.menuTipi == "S" && widget.altMenuler.ext.isNotNullOrEmpty) ? const Icon(Icons.expand_more, size: 15) : const SizedBox(),
            child: widget.menuTipi == "I"
                ? Center(
                    child: Text(
                    widget.title ?? "",
                    textAlign: TextAlign.center,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    softWrap: true,
                    style: theme.textTheme.bodySmall?.copyWith(color: Colors.white),
                  ))
                : Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      AnimatedContainer(
                              duration: const Duration(milliseconds: 500),
                              child: widget.iconWidget == null
                                  ? IconHelper.bigMenuIcon(
                                      widget.icon ?? "",
                                    )
                                  : IconTheme(
                                      data: const IconThemeData(weight: 0.1, size: 30, color: Colors.white),
                                      child: Icon(
                                        widget.iconWidget,
                                        size: 30,
                                        grade: 0.1,
                                      ),
                                    ))
                          .marginOnly(bottom: 5),
                      Text(
                        widget.menuTipi != "I" ? widget.title.toString() : "",
                        textAlign: TextAlign.center,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        // softWrap: true,
                        style: theme.textTheme.bodySmall?.copyWith(color: Colors.white),
                      ),
                    ],
                  )),
      ),
    );
  }

  //
}
