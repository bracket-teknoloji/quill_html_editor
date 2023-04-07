import 'package:flutter/material.dart';

class CustomGridTile {
  String? name;
  String? title;
  String? icon;
  Color? color;
  List<CustomGridTile>? altMenuler;
  Function()? onTap;
  String? _menuTipi;
  List menuList = [];

  CustomGridTile.ana(
      {required this.name, required this.title, required this.icon, required this.color, required this.altMenuler}) {
    _menuTipi = "A";
  }

  CustomGridTile.sub({required this.name, required this.title, required this.icon, required this.color}) {
    _menuTipi = "S";
  }

  CustomGridTile.item(
      {required this.name, required this.title, required this.icon, required this.color, required this.onTap}) {
    _menuTipi = "I";
  }

  bool altMenuVarMi() {
    if (_menuTipi == "A") {
      return menuList.contains(name) && altMenuler!.any((element) => element.altMenuVarMi());
    } else if (_menuTipi == "S") {
      return altMenuler!.any((element) => element.altMenuVarMi());
    } else {
      return true;
    }
  }

  List menuItems() {
    var list = <CustomGridTile>[];

    CustomGridTile menu;
    menu = list.firstWhere((element) => element.name == "CARI");
    menu.altMenuler = <CustomGridTile>[];
    menu.altMenuler!.add(CustomGridTile.item(
        name: "cari_CariListesi", title: "Cari Listesi", icon: "x", color: Colors.amber, onTap: () {}));

    //?cari hareketleri;
    menu.altMenuler!.add(CustomGridTile.sub(name: "raporlar", title: "Raporlar", icon: "x", color: Colors.amber));

    menu = menu.altMenuler!.firstWhere((element) => element.name == "raporlar");
    menu.altMenuler = <CustomGridTile>[];
    menu.altMenuler!.add(
        CustomGridTile.item(name: "cari_extre", title: "Cari Ekstresi", icon: "x", color: Colors.amber, onTap: () {}));
    list.add(CustomGridTile.ana(
        name: "CARI", title: "Cari", icon: "x", color: Colors.amber, altMenuler: <CustomGridTile>[]));
    return list;
  }

// .title = item.title;
// .icon = item.icon;
// .visible = item.yetkilimiş();
}
