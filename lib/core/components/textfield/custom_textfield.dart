import 'package:flutter/material.dart';

import '../../constants/ui_helper/ui_helper.dart';

class CustomTextField extends StatelessWidget {
  final String? text;
  final List<Widget> children;
  const CustomTextField({super.key, this.text, required this.children});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      runSpacing: UIHelper.lowSize,
      children: [Text(text ?? ""), ...children],
    );
  }
}
