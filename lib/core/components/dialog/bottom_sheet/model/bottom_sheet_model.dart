import "package:flutter/material.dart";

class BottomSheetModel {
  final String title;
  final String? description;
  final String? icon;
  final dynamic value;
  final dynamic groupValue;
  Function()? onTap;
  final IconData? iconWidget;

  BottomSheetModel({
    required this.title,
    this.description,
    this.icon,
    this.value,
    this.onTap,
    this.iconWidget,
    this.groupValue,
  });
}
