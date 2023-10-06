import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:picker/core/init/theme/app_theme_dark.dart";

enum BadgeColorEnum { dovizli, kapali, fatura, tamamlanmamis, merkezeGonderildi, seri, esYap, konum, kilitli, irsaliye, tipAciklama, karmaKoli }

extension BadgeColorExtensions on BadgeColorEnum {
  Color get getColor {
    switch (this) {
      case BadgeColorEnum.dovizli:
        return Colors.blue;
      case BadgeColorEnum.kapali:
      case BadgeColorEnum.tipAciklama:
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
