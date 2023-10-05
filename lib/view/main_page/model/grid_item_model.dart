import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:kartal/kartal.dart";

import "../../../core/components/dialog/dialog_manager.dart";
import "../../../core/constants/enum/siparis_tipi_enum.dart";
import "../../../core/init/cache/cache_manager.dart";
import "user_model/user_model.dart";

class GridItemModel {
  UserModel? cacheManager = CacheManager.getAnaVeri()?.userModel;
  List<String>? menuList = CacheManager.getAnaVeri()?.menuList;

  String? name;
  String title;
  String? icon;
  IconData? iconData;
  List<bool?>? yetkiListesi;
  Color? color;
  List<GridItemModel>? altMenuler;
  String? route;
  Function()? onTap;
  dynamic arguments;
  SiparisTipiEnum? siparisTipi;
  late final String menuTipi;

  GridItemModel.anamenu({required this.name, required this.title, required this.icon, required this.color, required this.altMenuler, this.iconData, this.yetkiListesi}) {
    menuTipi = "A";
  }

  GridItemModel.altmenu({required this.name, required this.title, this.icon, required this.altMenuler, this.iconData}) {
    //😳 Sub menu yani alt menü o yüzden "S"
    menuTipi = "S";
  }
  GridItemModel.item({required this.name, required this.title, this.icon, this.color, this.route, this.arguments, this.siparisTipi}) {
    menuTipi = "I";
    if (route == null) {
      onTap ??= () async => DialogManager().showInfoSnackBar("Yapım Aşamasında");
    } else {
      onTap = () async => await Get.toNamed(route!, arguments: arguments);
    }
  }
  GridItemModel.islemler({required this.title, this.icon, this.color, this.onTap, this.iconData}) {
    menuTipi = "IS";
    onTap ??= () async => DialogManager().showErrorSnackBar("Yapım Aşamasında");
  }
  GridItemModel.serbestRaporlar({required this.title, this.arguments, this.color, this.name}) {
    menuTipi = "SR";
    route = "/mainPage/serbestRaporlar";
    onTap = () async => await Get.toNamed("/mainPage/serbestRaporlar", arguments: arguments);
  }

  bool get yetkiKontrol {
    if (menuTipi == "A") {
      int sayac = 0;
      if ((menuList?.contains(name) ?? false) && altMenuVarMi && (yetkiListesi != null ? !(yetkiListesi?.any((element) => element == false) ?? false) : true)) {
        for (var element in altMenuler!) {
          if (element.yetkiKontrol) {
            sayac++;
          }
        }
        return sayac != 0 ? menuList!.contains(name) : false;
      } else {
        return false;
      }
    } else if (cacheManager?.adminMi != null && (cacheManager?.adminMi ?? false)) {
      return true;
    } else if (menuTipi == "S") {
      int sayac = altMenuler?.length ?? 0;
      altMenuler?.forEach((element) {
        if (!element.yetkiKontrol) {
          sayac--;
        }
      });
      var result = sayac != 0 ? cacheManager?.profilYetki?.toJson()[name] : false;
      if (name == null) {
        return sayac != 0;
      }
      return result ?? false;
    } else if (menuTipi == "SR") {
      return true;
    } else {
      var result = cacheManager?.profilYetki?.toJson()[name] ?? false;
      return result;
    }
  }

  bool get altMenuVarMi {
    if (menuTipi == "A" || menuTipi == "S") {
      return altMenuler.ext.isNotNullOrEmpty; //&& altMenuler!.any((element) => element.altMenuler?.isNotEmpty ?? false);
    } else {
      return false;
    }
  }
}
