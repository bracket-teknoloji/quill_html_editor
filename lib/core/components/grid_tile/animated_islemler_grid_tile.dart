import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../view/main_page/view/grid_items.dart';
import '../../base/state/base_state.dart';
import '../../constants/ui_helper/icon_helper.dart';
import '../../constants/ui_helper/ui_helper.dart';

class AnimatedIslemlerGridTile extends StatefulWidget {
  final String? name;
  final String? title;
  final String? icon;
  final Color? color;
  final List<GridItems>? altMenuler;
  final Function()? onTap;
  final String? menuTipi;
  final IconData? iconWidget;

  const AnimatedIslemlerGridTile({super.key, this.name, this.title, this.icon, this.color, this.onTap, this.altMenuler, this.menuTipi, this.iconWidget});

  @override
  AnimatedIslemlerGridTileState createState() => AnimatedIslemlerGridTileState();
}

class AnimatedIslemlerGridTileState extends BaseState<AnimatedIslemlerGridTile> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: UIHelper.lowBorderRadius,
      splashFactory: InkRipple.splashFactory,
      splashColor: theme.primaryColor,
      onTap: widget.onTap,
      child: GridTile(
          footer: (widget.menuTipi == "S" && widget.altMenuler!.length > 1) ? const Icon(Icons.expand_more, size: 15) : const SizedBox(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              AnimatedContainer(
                      duration: const Duration(milliseconds: 500),
                      child: widget.iconWidget == null
                          ? IconHelper.bigMenuIcon(widget.icon ?? "", color: UIHelper.primaryColor)
                          : const IconTheme(
                              data: IconThemeData(weight: 0.1, size: 30, color: Colors.white),
                              child: Icon(
                                Icons.abc,
                                size: 30,
                                grade: 0.1,
                              ),
                            ))
                  .marginOnly(bottom: 5),
              Text(
                widget.title.toString() ,
                textAlign: TextAlign.center,
                overflow: TextOverflow.visible,
                style: theme.textTheme.bodySmall?.copyWith(color: Colors.white, fontSize: 10),
              ),
            ],
          )),
    );
  }
}
