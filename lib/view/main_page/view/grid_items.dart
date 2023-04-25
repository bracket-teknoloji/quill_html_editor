import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

import '../../../core/components/dialog/dialog_manager.dart';
import '../../../core/init/cache/cache_manager.dart';
import '../model/user_model/user_model.dart';

class GridItems {
  UserModel? cacheManager = CacheManager.getAnaVeri()?.userModel;
  List<String>? menuList = CacheManager.getAnaVeri()?.menuList;

  String name;
  String title;
  String? icon;
  IconData? iconWidget;
  bool? isFavorite;
  Color? color;
  List<GridItems>? altMenuler;
  Function()? onTap;
  late final String menuTipi;

  GridItems.anamenu({required this.name, required this.title, required this.icon, required this.color, required this.altMenuler, this.iconWidget}) {
    menuTipi = "A";
  }

  GridItems.altmenu({required this.name, required this.title, this.icon, required this.altMenuler, this.iconWidget}) {
    menuTipi = "S";
  }
  GridItems.item({required this.name, required this.title, this.icon, this.onTap}) {
    menuTipi = "I";
    onTap ??= () {
      DialogManager().showSnackBar("Yapım Aşamasında");
    };
  }

  bool get yetkiKontrol {
    if (cacheManager!.adminMi != null && cacheManager!.adminMi!) {
      return true;
    } else if (menuTipi == "A" && altMenuVarMi) {
      int sayac = 0;
      for (var element in altMenuler!) {
        if (element.yetkiKontrol) {
          sayac++;
        }
      }
      return sayac != 0 ? menuList!.contains(name) : false;
    } else if (menuTipi == "S") {
      int sayac = altMenuler!.length;
      var result = sayac != 0 ? cacheManager?.profilYetki?.toJson()[name] : false;
      return result;
    } else {
      var result = cacheManager?.profilYetki?.toJson()[name] ?? false;
      return result;
    }
  }

  bool get altMenuVarMi {
    if (menuTipi == "A" || menuTipi == "S") {
      return altMenuler!.isNotNullOrEmpty; //&& altMenuler!.any((element) => element.altMenuler?.isNotEmpty ?? false);
    } else {
      return false;
    }
  }
}
