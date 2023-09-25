import "package:flutter/material.dart";

enum BadgeColorEnum { dovizli, kapali, fatura, tamamlanmamis, merkezeGonderildi, seri, esYap, konum, kilitli , irsaliye}

extension BadgeColorExtensions on BadgeColorEnum {
  MaterialColor get getColor {
    switch (this) {
      case BadgeColorEnum.dovizli:
        return Colors.blue;
      case BadgeColorEnum.kapali:
        return Colors.grey;
      case BadgeColorEnum.fatura:
      case BadgeColorEnum.irsaliye:
        return Colors.green;
      case BadgeColorEnum.tamamlanmamis:
      case BadgeColorEnum.kilitli:
        return Colors.red;
      case BadgeColorEnum.merkezeGonderildi:
        return Colors.purple;
      case BadgeColorEnum.seri:
      case BadgeColorEnum.konum:
        return Colors.orange;
      case BadgeColorEnum.esYap:
        return Colors.lightGreen;
      default:
        return Colors.orange;
    }
  }
}
