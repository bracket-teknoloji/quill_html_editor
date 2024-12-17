import "package:flutter/material.dart";

import "../../../../core/components/grid_tile/grid_tile.dart";

class MenuItemModel {

  MenuItemModel({this.title, this.icon, this.route});
  String? title;
  String? icon;
  Color? color;
  String? route;
  CustomGridTile? gridTile;

  String? get getTitle => title;

  set setTitle(String? title) => this.title = title;

  String? get getIcon => icon;

  set setIcon(String? titleicon) => icon = icon;

  Color? get getColor => color;

  set setColor(Color? color) => this.color = color;

  String? get getRoute => route;

  set setRoute(String? route) => this.route = route;
}
