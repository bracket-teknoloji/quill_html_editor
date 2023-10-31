import "package:flutter/material.dart";
import "package:get/get.dart";

import "../../../init/app_info/app_info.dart";
import "../../../init/cache/cache_manager.dart";
import "drawer_model.dart";

class DrawerMenuItems {
  final List<DrawerModel> items = [
    DrawerModel(
      title: "${CacheManager.getVeriTabani()["Şirket"]} (${CacheManager.getVeriTabani()["Şube"]})",
      iconWidget: Icons.storage_outlined,
    ),
    DrawerModel(
      title: CacheManager.getIsletmeSube["İşletme"],
      iconWidget: Icons.home_outlined,
    ),
    DrawerModel(
      title: "${CacheManager.getVeriTabani()["Şube"]} - ${CacheManager.getIsletmeSube["Şube"]}",
      iconWidget: Icons.location_on_outlined,
    ),
    DrawerModel(
      title: "v${AppInfoModel.instance.version}",
      iconWidget: Icons.route_outlined,
    ),
    DrawerModel(
      title: "Sürüm Yenilikleri",
      iconWidget: Icons.new_releases_outlined,
      onTap: () {
        //close Drawer
        Get.back();
        return Get.toNamed("/mainPage/surumYenilikleri");
      },
    ),
  ];
}
