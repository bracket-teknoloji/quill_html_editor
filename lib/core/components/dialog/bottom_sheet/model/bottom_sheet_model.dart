import "package:flutter/material.dart";

/// Represents a model for a bottom sheet.
final class BottomSheetModel<T> {
  BottomSheetModel({
    required this.title,
    this.description,
    this.descriptionWidget,
    this.icon,
    this.value,
    this.onTap,
    this.iconWidget,
    this.groupValue,
  });
  final String title;
  final String? description;
  final Widget? descriptionWidget;
  final String? icon;
  final T? value;
  final dynamic groupValue;
  Function()? onTap;
  final IconData? iconWidget;
}
