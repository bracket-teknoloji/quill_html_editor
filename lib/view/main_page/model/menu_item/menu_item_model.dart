import "package:flutter/material.dart";

import "../../../../core/components/grid_tile/grid_tile.dart";

class MenuItemModel {
  String? title;
  String? icon;
  Color? color;
  String? route;
  CustomGridTile? gridTile;

  get getTitle => title;

  set setTitle(title) => this.title = title;

  get getIcon => icon;

  set setIcon(icon) => this.icon = icon;

  get getColor => color;

  set setColor(color) => this.color = color;

  get getRoute => route;

  set setRoute(route) => this.route = route;

  MenuItemModel({this.title, this.icon, this.route});
}
