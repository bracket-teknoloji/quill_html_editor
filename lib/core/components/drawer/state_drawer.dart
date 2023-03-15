import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddItemToDrawer extends GetxController {
  final _drawerItems = <DrawerItem>[
    DrawerItem(
        title: "Home", icon: Icons.home, onTap: () => Get.offAllNamed("/")),
    DrawerItem(
        title: "Login",
        icon: Icons.login,
        onTap: () => Get.offAllNamed("/login")),
    DrawerItem(
        title: "Main Page",
        icon: Icons.home,
        onTap: () => Get.offAllNamed("/mainPage")),
  ].obs;
  List<DrawerItem> get drawerItems => _drawerItems;
  void addDrawerItem(DrawerItem item) {
    _drawerItems.add(item);
  }
}

class DrawerItem {
  final String title;
  final IconData? icon;
  final Function()? onTap;
  const DrawerItem({required this.title, this.icon, this.onTap});
}
