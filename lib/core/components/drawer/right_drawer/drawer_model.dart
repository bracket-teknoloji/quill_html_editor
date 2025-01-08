import "package:flutter/material.dart";

final class DrawerModel {
  DrawerModel({required this.title, this.icon, this.onTap, this.iconWidget}) {
    if (onTap != null) trailingIcon = Icons.keyboard_arrow_right;
  }
  String title;
  String? icon;
  Function()? onTap;
  IconData? trailingIcon;
  IconData? iconWidget;
  @override
  String toString() => title;
}
