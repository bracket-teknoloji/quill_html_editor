import "package:flutter/material.dart";

class DrawerModel {
  String title;
  String? icon;
  Function()? onTap;
  IconData? iconWidget;
  DrawerModel({required this.title, this.icon, this.onTap, this.iconWidget});
  @override
  String toString() => title;
}
