import "package:flutter/material.dart";
import "package:get/get.dart";

import "../../init/theme/app_theme_dark.dart";

enum BadgeColorEnum { dovizli, kapali, cari, fatura, tamamlanmamis, merkezeGonderildi, seri, esYap, konum, kilitli, irsaliye, tipAciklama, karmaKoli, eFatura, basarili, taslak, uyari, hata }

extension BadgeColorExtensions on BadgeColorEnum? {
  Color get getColor {
    switch (this) {
      case BadgeColorEnum.eFatura:
        return const Color.fromARGB(255, 170, 56, 236);
      case BadgeColorEnum.dovizli:
        return Colors.blue;
      case BadgeColorEnum.kapali:
        return Colors.grey;
      case BadgeColorEnum.fatura:
      case BadgeColorEnum.irsaliye:
      case BadgeColorEnum.basarili:
        return Colors.green;
      case BadgeColorEnum.tamamlanmamis:
      case BadgeColorEnum.kilitli:
      case BadgeColorEnum.hata:
        return Colors.red;
      case BadgeColorEnum.merkezeGonderildi:
        return Colors.purple;
      case BadgeColorEnum.seri:
      case BadgeColorEnum.konum:
      case BadgeColorEnum.cari:
      case BadgeColorEnum.tipAciklama:
      case BadgeColorEnum.taslak:
      case BadgeColorEnum.uyari:
        return Colors.orange;
      case BadgeColorEnum.esYap:
        return Colors.lightGreen;
      case BadgeColorEnum.karmaKoli:
        //fuschia
        return const Color.fromARGB(255, 220, 30, 233);
      default:
        return Colors.orange;
    }
  }

  Color get getFontColor {
    bool isDarkMode = Get.isDarkMode;
    if (isDarkMode) {
      return AppThemeDark.instance?.theme.colorScheme.background ?? Colors.white;
    } else {
      return Colors.white;
    }
  }
}
