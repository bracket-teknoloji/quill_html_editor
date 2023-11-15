import "package:flutter/material.dart";

import "../color_palette.dart";

enum BadgeColorEnum { dovizli, kapali, cari, fatura, tamamlanmamis, merkezeGonderildi, seri, esYap, konum, kilitli, irsaliye, tipAciklama, karmaKoli, eFatura, basarili, taslak, uyari, hata }

extension BadgeColorExtensions on BadgeColorEnum? {
  Color get getColor {
    switch (this) {
      case BadgeColorEnum.eFatura:
      case BadgeColorEnum.merkezeGonderildi:
        return ColorPalette.mountbattenPink;
      case BadgeColorEnum.dovizli:
        return ColorPalette.skyBlue;
      case BadgeColorEnum.kapali:
        return ColorPalette.slateGray;
      case BadgeColorEnum.fatura:
      case BadgeColorEnum.irsaliye:
      case BadgeColorEnum.basarili:
        return ColorPalette.mantis;
      case BadgeColorEnum.tamamlanmamis:
      case BadgeColorEnum.kilitli:
      case BadgeColorEnum.hata:
        return ColorPalette.persianRed;
      case BadgeColorEnum.seri:
      case BadgeColorEnum.konum:
      case BadgeColorEnum.cari:
      case BadgeColorEnum.tipAciklama:
      case BadgeColorEnum.taslak:
      case BadgeColorEnum.uyari:
        return ColorPalette.gamboge;
      case BadgeColorEnum.esYap:
        return ColorPalette.asparagus;
      case BadgeColorEnum.karmaKoli:
        return ColorPalette.mulberry;
      default:
        return Colors.orange;
    }
  }
}
