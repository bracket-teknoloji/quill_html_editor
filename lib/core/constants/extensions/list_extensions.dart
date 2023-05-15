

//extension on a list for padding all items
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:picker/core/constants/ui_helper/ui_helper.dart';

extension ListExtension<T> on List<T> {
  List<Padding> get withPadding {
    return map((e) => Padding(
      padding: EdgeInsets.all(UIHelper.lowSize),
      child: e as Widget,
    )).toList();
  }
}
// an extension on a list of widget to add sized box between items
extension ListExtension2<T> on List<T> {
  List<Widget> get withSizedBox {
    return map((e) => SizedBox(
      width: (Get.width - UIHelper.midSize) * 0.45,
      child: e as Widget,
    )).toList();
  }
}