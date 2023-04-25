import 'package:flutter/material.dart';

class BottomSheetModel {
  final String title;
  final String? description;
  final String? icon;
  final Function() onTap;
  final IconData? iconWidget;

  BottomSheetModel({required this.title, this.description, required this.icon, required this.onTap, this.iconWidget});
}
