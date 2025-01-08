import "package:hive_flutter/hive_flutter.dart";

import "../../../view/main_page/model/user_model/user_model.dart";
import "cache_manager.dart";

part "favorites_model.g.dart";

@HiveType(typeId: 24)
final class FavoritesModel {
  FavoritesModel({
    this.name,
    this.title,
    this.icon,
    this.onTap,
    this.color,
    this.arguments,
    this.menuTipi,
  });
  @HiveField(0)
  String? name;
  @HiveField(1)
  String? title;
  @HiveField(2)
  String? icon;
  @HiveField(3)
  String? onTap;
  @HiveField(4)
  int? color;
  @HiveField(5)
  dynamic arguments;
  @HiveField(6)
  String? menuTipi;

  UserModel? get cacheManager => CacheManager.getAnaVeri?.userModel;
  bool get yetkiKontrol {
    if (menuTipi == "SR") {
      return true;
    } else if (cacheManager?.adminMi == true) {
      return true;
    } else if (menuTipi == "I") {
      final result = cacheManager?.profilYetki?.toJson()[name] ?? false;
      return result;
    } else {
      return true;
    }
  }

  @override
  String toString() => "FavoritesModel{name: $name, title: $title, icon: $icon, onTap: $onTap, color: $color, arguments: $arguments}";
}
