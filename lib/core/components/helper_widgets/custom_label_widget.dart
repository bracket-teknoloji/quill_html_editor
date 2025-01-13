import "package:flutter/material.dart";
import "package:get/get.dart";

import "../../constants/ui_helper/ui_helper.dart";

final class CustomWidgetWithLabel extends StatelessWidget {
  const CustomWidgetWithLabel({required this.child, super.key, this.text, this.isVertical, this.isTitleSmall, this.isMust, this.width, this.addPadding = true});
  final String? text;
  final Widget child;
  final bool? isVertical;
  final bool? isTitleSmall;
  final bool? isMust;
  final double? width;
  final bool addPadding;

  @override
  Widget build(BuildContext context) => SizedBox(
        width: width,
        child: Wrap(
          direction: (isVertical ?? false) ? Axis.vertical : Axis.horizontal,
          runSpacing: UIHelper.lowSize,
          children: [
            if (text != null)
              Text(
                text ?? "",
                style: (isTitleSmall ?? false)
                    ? Theme.of(context).textTheme.bodySmall?.copyWith(
                          fontSize: UIHelper.midSize,
                          color: (isMust ?? false) ? UIHelper.primaryColor : null,
                        )
                    : null,
              ).paddingOnly(left: addPadding ? UIHelper.lowSize : 0),
            child,
          ],
        ),
      );
}
