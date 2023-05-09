import 'package:flutter/material.dart';

import '../../constants/ui_helper/ui_helper.dart';

class CustomTextField extends StatelessWidget {
  final String? text;
  final List<Widget> children;
  final bool? isVertical;
  final bool? isTitleSmall;
  const CustomTextField({super.key, this.text, required this.children, this.isVertical, this.isTitleSmall});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      direction: isVertical ?? false ? Axis.vertical : Axis.horizontal,
      runSpacing: UIHelper.lowSize,
      children: [Text(text ?? "", style: (isTitleSmall ?? false) ? Theme.of(context).textTheme.bodySmall?.copyWith(fontSize: UIHelper.midSize) : null), ...children],
    );
  }
}
