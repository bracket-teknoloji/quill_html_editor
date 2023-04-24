import 'package:hive_flutter/hive_flutter.dart';

part 'favorites_model.g.dart';

@HiveType(typeId: 23)
class FavoritesModel {
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

  FavoritesModel({this.name, this.title, this.icon, this.onTap, this.color});
}
