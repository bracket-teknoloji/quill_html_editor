import "package:flutter/material.dart";

enum BadgeColorEnum { dovizli, kapali, fatura, tamamlanmamis }

extension BadgeColorExtensions on BadgeColorEnum {
  MaterialColor? get getColor {
    switch (this) {
      case BadgeColorEnum.dovizli:
        return Colors.blue;
      case BadgeColorEnum.kapali:
        return Colors.grey;
      case BadgeColorEnum.fatura:
        return Colors.green;
      case BadgeColorEnum.tamamlanmamis:
        return Colors.red;
      default:
        return null;
    }
  }
}
