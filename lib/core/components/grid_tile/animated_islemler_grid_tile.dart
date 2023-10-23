import "package:flutter/material.dart";
import "package:get/get.dart";

import "../../../view/main_page/model/grid_item_model.dart";
import "../../base/state/base_state.dart";
import "../../constants/ui_helper/icon_helper.dart";
import "../../constants/ui_helper/ui_helper.dart";

class AnimatedIslemlerGridTile extends StatefulWidget {
  final String? name;
  final String? title;
  final String? icon;
  final Color? color;
  final List<GridItemModel>? altMenuler;
  final Function()? onTap;
  final String? menuTipi;
  final IconData? iconWidget;
  final bool? altMenuVarMi;

  const AnimatedIslemlerGridTile(
      {super.key,
      this.name,
      this.title,
      this.icon,
      this.color,
      this.onTap,
      this.altMenuler,
      this.menuTipi,
      this.iconWidget,
      this.altMenuVarMi});

  @override
  AnimatedIslemlerGridTileState createState() =>
      AnimatedIslemlerGridTileState();
}

class AnimatedIslemlerGridTileState
    extends BaseState<AnimatedIslemlerGridTile> {
  @override
  Widget build(BuildContext context) => InkWell(
      borderRadius: UIHelper.lowBorderRadius,
      splashFactory: InkRipple.splashFactory,
      splashColor: theme.primaryColor,
      onTap: widget.onTap,
      child: GridTile(
          footer: (widget.altMenuVarMi ?? false)
              ? const Icon(Icons.expand_more, size: 15)
              : const SizedBox(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              widget.iconWidget == null
                  ? IconHelper.middleMenuIcon(widget.icon ?? "",
                      color: UIHelper.primaryColor)
                  : IconTheme(
                      data: IconThemeData(
                          weight: 0.1,
                          size: 20,
                          color: widget.color ?? UIHelper.primaryColor),
                      child: Icon(
                        widget.iconWidget,
                        size: 20,
                        grade: 0.1,
                      ),
                    ).marginOnly(bottom: 5),
              Text(
                widget.title.toString(),
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: theme.textTheme.bodySmall
                    ?.copyWith(color: Colors.white, fontSize: 10),
              ),
              // Flexible(child: (widget.altMenuVarMi ?? false) ? const Icon(Icons.expand_more, size: 15) : const SizedBox())
            ],
          )),
    );
}
