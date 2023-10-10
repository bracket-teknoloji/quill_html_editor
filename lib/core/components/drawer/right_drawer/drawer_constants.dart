import "package:flutter/material.dart";

import "../../../init/app_info/app_info.dart";
import "../../../init/cache/cache_manager.dart";
import "drawer_model.dart";

class DrawerMenuItems {
  final List<DrawerModel> items = [
    DrawerModel(
        title:
            "${CacheManager.getVeriTabani()["Şirket"]} (${CacheManager.getVeriTabani()["Şube"]})",
        iconWidget: Icons.storage_outlined,
        onTap: () {}),
    DrawerModel(
        title: CacheManager.getIsletmeSube["İşletme"],
        iconWidget: Icons.home_outlined,
        onTap: () {}),
    DrawerModel(
        title:
            "${CacheManager.getVeriTabani()["Şube"]} - ${CacheManager.getIsletmeSube["Şube"]}",
        iconWidget: Icons.location_on_outlined,
        onTap: () {}),
    DrawerModel(
        title: "v${AppInfoModel.instance.version}",
        iconWidget: Icons.route_outlined,
        onTap: () {}),
  ];
}
