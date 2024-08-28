import "package:flutter/material.dart";

class DrawerModel {
  String title;
  String? icon;
  Function()? onTap;
  IconData? trailingIcon;
  IconData? iconWidget;
  DrawerModel({required this.title, this.icon, this.onTap, this.iconWidget}) {
    if (onTap != null) trailingIcon = Icons.keyboard_arrow_right;
  }
  @override
  String toString() => title;
}
