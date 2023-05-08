import 'package:flutter/material.dart';

class BottomSheetModel {
  final String title;
  final String? description;
  final String? icon;
  final Function()? onTap;
  final IconData? iconWidget;

  BottomSheetModel({required this.title, this.description, this.icon, this.onTap, this.iconWidget});
}
