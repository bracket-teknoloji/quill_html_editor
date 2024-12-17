import "package:flutter/material.dart";
import "package:get/get.dart";

import "../../../view/main_page/model/grid_item_model.dart";
import "../../base/state/base_state.dart";
import "../../constants/ui_helper/icon_helper.dart";
import "../../constants/ui_helper/ui_helper.dart";

class AnimatedIslemlerGridTile extends StatefulWidget {

  const AnimatedIslemlerGridTile({
    super.key,
    this.item,
    this.onTap,
  });
  final GridItemModel? item;
  final Function()? onTap;

  @override
  AnimatedIslemlerGridTileState createState() => AnimatedIslemlerGridTileState();
}

class AnimatedIslemlerGridTileState extends BaseState<AnimatedIslemlerGridTile> {
  @override
  Widget build(BuildContext context) => DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: UIHelper.midBorderRadius,
          border: Border.all(color: theme.colorScheme.onSurface.withOpacity(0.1)),
        ),
        child: InkWell(
          borderRadius: UIHelper.midBorderRadius,
          splashFactory: InkRipple.splashFactory,
          splashColor: theme.primaryColor,
          enableFeedback: widget.onTap != null,
          onTap: widget.onTap,
          child: GridTile(
            footer: (widget.item?.altMenuVarMi ?? false) ? const Icon(Icons.expand_more, size: 15) : null,
            child: Column(
              children: [
                if (widget.item?.iconData == null)
                  IconHelper.middleMenuIcon(widget.item?.icon ?? "", color: widget.item?.color ?? UIHelper.primaryColor).marginOnly(bottom: UIHelper.lowSize)
                else
                  IconTheme(
                    data: IconThemeData(weight: 0.1, size: 20, color: widget.item?.color ?? UIHelper.primaryColor),
                    child: Icon(
                      widget.item?.iconData,
                      size: 20,
                    ),
                  ).marginOnly(bottom: UIHelper.lowSize),
                Text(
                  widget.item?.title ?? "",
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: theme.textTheme.bodySmall?.copyWith(color: theme.colorScheme.onSurface, fontSize: 10),
                ),
                // Flexible(child: (widget.item?.altMenuVarMi ?? false) ? const Icon(Icons.expand_more, size: 15) : const SizedBox())
              ],
            ).marginOnly(top: UIHelper.highSize, left: UIHelper.lowSize, right: UIHelper.lowSize),
          ),
        ),
      ).paddingAll(UIHelper.lowSize);
}
