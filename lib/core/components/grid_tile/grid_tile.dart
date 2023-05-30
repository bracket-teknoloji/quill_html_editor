import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../view/main_page/view/grid_items.dart';
import '../../base/state/base_state.dart';
import '../../constants/ui_helper/icon_helper.dart';
import '../../constants/ui_helper/ui_helper.dart';
import '../../init/cache/cache_manager.dart';
import '../../init/cache/favorites_model.dart';

class CustomGridTile extends StatefulWidget {
  final String? name;
  final String? title;
  final String? icon;
  final Color? color;
  final List<GridItems>? altMenuler;
  final Function()? onTap;
  final String? menuTipi;
  final IconData? iconWidget;

  const CustomGridTile({super.key, this.name, this.title, this.icon, this.color, this.onTap, this.altMenuler, this.menuTipi, this.iconWidget});

  @override
  CustomGridTileState createState() => CustomGridTileState();
}

class CustomGridTileState extends BaseState<CustomGridTile> {
  @override
  Widget build(BuildContext context) {
    Icon yetkiKontrol() {
      if (CacheManager.getFavoriler().containsKey(widget.name.toString())) {
        return const Icon(Icons.star, size: 20);
      } else {
        CacheManager.removeFavoriler(widget.name.toString());
        return const Icon(Icons.star_border, size: 20);
      }
    }

    Icon icon = yetkiKontrol();

    return InkWell(
      borderRadius: UIHelper.lowBorderRadius,
      splashFactory: InkRipple.splashFactory,
      onLongPress: () {
        Clipboard.setData(ClipboardData(text: widget.title!));
        dialogManager.showSnackBar("Kopyalandı");
      },
      splashColor: theme.primaryColor,
      onTap: widget.onTap,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: UIHelper.lowBorderRadius),
        color: widget.color,
        semanticContainer: true,
        child: GridTile(
            header: (widget.menuTipi == "I")
                ? Align(
                    alignment: Alignment.centerRight,
                    child: InkWell(
                      child: yetkiKontrolIcon(widget.name.toString()),
                      onTap: () {
                        if (icon.icon == Icons.star) {
                          icon = const Icon(Icons.star_border, size: 20);
                          CacheManager.removeFavoriler(widget.name.toString());
                          dialogManager.hideSnackBar;
                          dialogManager.showSnackBar("Favorilerden çıkarıldı");
                        } else {
                          icon = const Icon(Icons.star, size: 20);
                          CacheManager.setFavoriler(FavoritesModel(name: widget.name, title: widget.title, icon: widget.icon, onTap: widget.title, color: widget.color?.value));
                          dialogManager.hideSnackBar;
                          dialogManager.showSnackBar("Favorilere eklendi");
                        }
                        setState(() {});
                      },
                    ))
                : null,
            footer: (widget.menuTipi == "S" && widget.altMenuler!.length > 1) ? const Icon(Icons.expand_more, size: 15) : const SizedBox(),
            child: widget.menuTipi == "I"
                ? Center(
                    child: Text(
                    widget.title ?? "",
                    textAlign: TextAlign.center,
                    style: theme.textTheme.bodySmall?.copyWith(color: Colors.white),
                  ))
                : Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
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
                        style: theme.textTheme.bodySmall?.copyWith(color: Colors.white),
                      ),
                    ],
                  )),
      ),
    );
  }

  Icon yetkiKontrolIcon(String name) {
    if (CacheManager.getFavoriler().containsKey(name.toString())) {
      return const Icon(Icons.star, size: 20);
    } else {
      CacheManager.removeFavoriler(name.toString());
      return const Icon(Icons.star_border, size: 20);
    }
  }
}
