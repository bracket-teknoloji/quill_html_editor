// an extension on a widget to add safe area
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:picker/core/constants/ui_helper/ui_helper.dart';

extension WidgetExtension on Widget {
  Widget get withSafeArea {
    return SafeArea(
      child: this,
    );
  }
}

//an extension on a widget to wrap a sizedBox and height will be 0.5 of the screen height
extension WidgetExtension2 on Widget {
  Widget get withSizedBox {
    return SizedBox(
      width: (Get.width - UIHelper.midSize) * 0.45,
      child: this,
    );
  }
}
// an extension on a widget to wrap a sizedbox and width will be 0.5 of the parent widget
