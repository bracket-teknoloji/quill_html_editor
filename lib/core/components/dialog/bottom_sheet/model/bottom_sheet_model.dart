import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomSheetModel {
  final String title;
  final String? description;
  final String? icon;
  final String? value;
  Function()? onTap;
  final IconData? iconWidget;

  BottomSheetModel({required this.title, this.description, this.icon, this.value, this.onTap, this.iconWidget}) {
    onTap ??= () => Get.back(result: value ?? title);
  }
}
