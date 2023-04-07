import 'package:flutter/material.dart';

class GridItems {
  String? name;
  String? title;
  String? icon;
  Color? color;
  List<GridItems>? altMenuler;
  Function()? onTap;
  String? _menuTipi;

  GridItems.anamenu(
      {required this.name, required this.title, required this.icon, required this.color, required this.altMenuler}) {
    _menuTipi = "A";
    altMenuler?.forEach((element) {
      element.color = color;
    });
    altMenuVarMi();
  }
  GridItems.altmenu({required this.name, required this.title, required this.icon, required this.altMenuler}) {
    _menuTipi = "S";
  }
  GridItems.item({required this.name, required this.title, required this.icon, required this.onTap}) {
    _menuTipi = "I";
  }
  bool altMenuVarMi() {
    if (_menuTipi == "A" || _menuTipi == "S") {
      return altMenuler!.isNotEmpty && altMenuler!.any((element) => element.altMenuler?.isNotEmpty ?? false);
    } else {
      return false;
    }
  }
}
