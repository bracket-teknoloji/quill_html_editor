import "package:flutter/material.dart";
import "package:picker/core/constants/ui_helper/ui_helper.dart";

import "../color_palette.dart";

enum BadgeColorEnum {
  dovizli,
  kapali,
  cari,
  fatura,
  tamamlanmamis,
  merkezeGonderildi,
  seri,
  esYap,
  konum,
  kilitli,
  irsaliye,
  tipAciklama,
  karmaKoli,
  eFatura,
  basarili,
  taslak,
  uyari,
  hata,
  muhtelif,
  rework,
  primaryColor;

  Color get getColor => switch (this) {
    BadgeColorEnum.eFatura || BadgeColorEnum.merkezeGonderildi => ColorPalette.mountbattenPink,
    BadgeColorEnum.dovizli => ColorPalette.skyBlue,
    BadgeColorEnum.kapali => ColorPalette.slateGray,
    BadgeColorEnum.fatura || BadgeColorEnum.irsaliye || BadgeColorEnum.basarili => ColorPalette.mantis,
    BadgeColorEnum.tamamlanmamis || BadgeColorEnum.kilitli || BadgeColorEnum.hata => ColorPalette.persianRed,
    BadgeColorEnum.seri ||
    BadgeColorEnum.konum ||
    BadgeColorEnum.cari ||
    BadgeColorEnum.tipAciklama ||
    BadgeColorEnum.taslak ||
    BadgeColorEnum.uyari => ColorPalette.gamboge,
    BadgeColorEnum.esYap || BadgeColorEnum.muhtelif => ColorPalette.asparagus,
    BadgeColorEnum.karmaKoli => ColorPalette.mulberry,
    BadgeColorEnum.rework => ColorPalette.outerSpace,
    BadgeColorEnum.primaryColor => UIHelper.primaryColor,
  };
}
