import 'package:flutter/material.dart';

class GridThemeManager {
  static const Color tallow = Color.fromRGBO(164, 156, 107, 1);
  static const Color persianRed = Color.fromRGBO(202, 52, 51, 1);
  static const Color skyBlue = Color.fromRGBO(135, 206, 234, 1);
  static const Color himalaya = Color.fromRGBO(121, 92, 50, 1);
  static const Color dodgerBlue = Color.fromRGBO(30, 144, 255, 1);
  static const Color bouquet = Color.fromRGBO(159, 115, 151, 1);
  static const Color pictonBlue = Color.fromRGBO(101, 152, 207, 1);
  static const Color greenHaze = Color.fromRGBO(102, 187, 1067, 1);
  static const Color mountainMeadow = Color.fromRGBO(1, 121, 111, 1);
  static const Color mediumVioletRed = Color.fromRGBO(198, 75, 140, 1);
  static const Color gray = Color.fromRGBO(112, 128, 144, 1);
  static const Color mineShaft = Color.fromRGBO(72, 73, 75, 1);
  static const Color tacao = Color.fromRGBO(254, 99, 71, 1);

  static const List<Color> gridTileColors = [
    tallow,
    persianRed,
    skyBlue,
    himalaya,
    dodgerBlue,
    bouquet,
    pictonBlue,
    greenHaze,
    mountainMeadow,
    mediumVioletRed,
    gray,
    mineShaft,
    tacao,
  ];
  static const List<String> gridNames = [
    "Cari",
    "Finans",
    "Hücre Takibi",
    "Mal Kabul",
    "Sayım",
    "Sevkiyat",
    "Sipariş",
    "Stok",
    "Tahsilat & Ödeme",
    "Talep & Teklif",
    "Transfer",
    "Üretim",
    "Ayarlar"
  ];

  static const List<IconData> gridIcons = [
    Icons.add,
    Icons.sd_card,
    Icons.disc_full_sharp,
    Icons.saved_search_outlined,
    Icons.search,
    Icons.send,
    Icons.shopping_cart,
    Icons.store,
    Icons.money,
    Icons.request_quote,
    Icons.transfer_within_a_station,
    Icons.production_quantity_limits,
    Icons.settings,
  ];
}
