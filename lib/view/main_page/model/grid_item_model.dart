import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kartal/kartal.dart';

import '../../../core/components/dialog/dialog_manager.dart';
import '../../../core/init/cache/cache_manager.dart';
import 'user_model/user_model.dart';

class GridItemModel {
  UserModel? cacheManager = CacheManager.getAnaVeri()?.userModel;
  List<String>? menuList = CacheManager.getAnaVeri()?.menuList;

  String? name;
  String title;
  String? icon;
  IconData? iconWidget;
  Color? color;
  List<GridItemModel>? altMenuler;
  String? route;
  Function()? onTap;
  dynamic arguments;
  late final String menuTipi;

  GridItemModel.anamenu({required this.name, required this.title, required this.icon, required this.color, required this.altMenuler, this.iconWidget}) {
    menuTipi = "A";
  }

  GridItemModel.altmenu({required this.name, required this.title, this.icon, required this.altMenuler, this.iconWidget}) {
    menuTipi = "S";
  }
  GridItemModel.item({required this.name, required this.title, this.icon, this.color, this.route, this.arguments}) {
    menuTipi = "I";
    if (route == null) {
      onTap ??= () => DialogManager().showSnackBar("Yapım Aşamasında");
    } else {
      onTap = () => Get.toNamed(route!, arguments: arguments);
    }
  }
  GridItemModel.serbestRaporlar({required this.title, this.arguments}) {
    menuTipi = "SR";
    route = "/mainPage/serbestRaporlar";
    onTap = () => Get.toNamed("/mainPage/serbestRaporlar", arguments: arguments);
  }

  bool get yetkiKontrol {
    if (menuTipi == "A") {
      if (menuList!.contains(name) && altMenuVarMi) {
        int sayac = 0;
        for (var element in altMenuler!) {
          if (element.yetkiKontrol) {
            sayac++;
          }
        }
        return sayac != 0 ? menuList!.contains(name) : false;
      } else {
        return false;
      }
    } else if (cacheManager!.adminMi != null && cacheManager!.adminMi!) {
      return true;
    } else if (menuTipi == "S") {
      int sayac = altMenuler!.length;
      var result = sayac != 0 ? cacheManager?.profilYetki?.toJson()[name] : false;
      return result;
    } else if (menuTipi == "SR") {
      return true;
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
