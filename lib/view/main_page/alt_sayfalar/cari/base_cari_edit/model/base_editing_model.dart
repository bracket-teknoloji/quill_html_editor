import "package:flutter/material.dart";

final class BaseEditingModel {
  BaseEditingModel({this.tabs, this.tabViews});
  List<Tab>? tabs;
  List<Widget>? tabViews;
}
