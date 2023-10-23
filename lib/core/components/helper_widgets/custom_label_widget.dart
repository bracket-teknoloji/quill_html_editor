import "package:flutter/material.dart";
import "package:get/get.dart";

import "../../constants/extensions/widget_extensions.dart";
import "../../constants/ui_helper/ui_helper.dart";

class CustomWidgetWithLabel extends StatelessWidget {
  final String? text;
  final Widget child;
  final bool? isVertical;
  final bool? isTitleSmall;
  final bool? isMust;
  final double? width;
  final double? onlyLabelpaddingLeft;
  const CustomWidgetWithLabel({super.key, this.text, required this.child, this.isVertical, this.isTitleSmall, this.isMust, this.width, this.onlyLabelpaddingLeft});

  @override
  Widget build(BuildContext context) => SizedBox(
      width: width,
      child: Wrap(
        direction: (isVertical ?? false) ? Axis.vertical : Axis.horizontal,
        runSpacing: UIHelper.lowSize,
        crossAxisAlignment: WrapCrossAlignment.start,
        runAlignment: WrapAlignment.start,
        alignment: WrapAlignment.start,
        children: [
          Text(text ?? "",
                  style: (isTitleSmall ?? false)
                      ? Theme.of(context).textTheme.bodySmall?.copyWith(
                            fontSize: UIHelper.midSize,
                            color: (isMust ?? false) ? UIHelper.primaryColor : null,
                          )
                      : null)
              .paddingOnly(left: onlyLabelpaddingLeft ?? 0)
              .yetkiVarMi(text != null),
          child,
        ],
      ),
    );
}
