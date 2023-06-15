import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants/ui_helper/ui_helper.dart';

class CustomWidgetWithLabel extends StatelessWidget {
  final String? text;
  final List<Widget> children;
  final bool? isVertical;
  final bool? isTitleSmall;
  final bool? isMust;
  const CustomWidgetWithLabel({super.key, this.text, required this.children, this.isVertical, this.isTitleSmall, this.isMust});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      direction: isVertical ?? false ? Axis.vertical : Axis.horizontal,
      runSpacing: UIHelper.lowSize,
      children: [
        Text(text ?? "",
            style: (isTitleSmall ?? false)
                ? Theme.of(context).textTheme.bodySmall?.copyWith(
                      fontSize: UIHelper.midSize,
                      color: (isMust ?? false) ? UIHelper.primaryColor : null,
                    )
                : null),
        ...children
      ],
    ).paddingSymmetric(horizontal: UIHelper.lowSize);
  }
}
