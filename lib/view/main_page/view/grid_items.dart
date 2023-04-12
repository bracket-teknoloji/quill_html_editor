import 'package:flutter/material.dart';

import '../../../core/components/dialog/dialog_manager.dart';
import '../../../core/constants/grid_constants.dart';
import '../../../core/init/cache/cache_manager.dart';
import '../model/user_model/user_model.dart';

class GridItems {
  UserModel? cacheManager = CacheManager.getAnaVeri()?.userModel;
  List<String>? menuList = CacheManager.getAnaVeri()?.menuList;

  String name;
  String title;
  String? icon;
  Color? color;
  List<GridItems>? altMenuler;
  Function()? onTap;
  late final String menuTipi;

  GridItems.anamenu({required this.name, required this.title, required this.icon, required this.color, required this.altMenuler}) {
    menuTipi = "A";
  }

  GridItems.altmenu({required this.name, required this.title, required this.icon, required this.altMenuler}) {
    menuTipi = "S";
  }
  GridItems.item({required this.name, required this.title, required this.icon, this.onTap}) {
    menuTipi = "I";
    onTap = () {
      DialogManager().showSnackBar(title);
    };
  }

  Color get getColor {
    if (colors.containsKey(name.substring(0, 4).toLowerCase())) {
      return color = colors[name.substring(0, 4).toLowerCase()];
    } else {
      return Colors.black;
    }
  }

  bool get yetkiKontrol {
    if (menuTipi == "A") {
      return menuList!.contains(name);
    } else {
      var result = cacheManager?.profilYetki?.toJson()[name] ?? false;
      return result;
    }
  }

  bool get altMenuVarMi {
    if (menuTipi == "A" || menuTipi == "S") {
      return altMenuler!.isNotEmpty; //&& altMenuler!.any((element) => element.altMenuler?.isNotEmpty ?? false);
    } else {
      return false;
    }
  }

  Map colors = {
    "cari": GridThemeManager.tallow,
  };
}
