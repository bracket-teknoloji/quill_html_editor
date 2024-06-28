import "package:flutter/material.dart";

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
  rework;
}

extension BadgeColorExtensions on BadgeColorEnum? {
  Color get getColor => switch (this) {
        BadgeColorEnum.eFatura || BadgeColorEnum.merkezeGonderildi => ColorPalette.mountbattenPink,
        BadgeColorEnum.dovizli => ColorPalette.skyBlue,
        BadgeColorEnum.kapali => ColorPalette.slateGray,
        BadgeColorEnum.fatura || BadgeColorEnum.irsaliye || BadgeColorEnum.basarili => ColorPalette.mantis,
        BadgeColorEnum.tamamlanmamis || BadgeColorEnum.kilitli || BadgeColorEnum.hata => ColorPalette.persianRed,
        BadgeColorEnum.seri || BadgeColorEnum.konum || BadgeColorEnum.cari || BadgeColorEnum.tipAciklama || BadgeColorEnum.taslak || BadgeColorEnum.uyari => ColorPalette.gamboge,
        BadgeColorEnum.esYap || BadgeColorEnum.muhtelif => ColorPalette.asparagus,
        BadgeColorEnum.karmaKoli => ColorPalette.mulberry,
        BadgeColorEnum.rework => ColorPalette.outerSpace,
        _ => Colors.orange,
      };
}
