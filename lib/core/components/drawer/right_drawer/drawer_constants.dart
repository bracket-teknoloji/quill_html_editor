import '../../../init/app_info/app_info.dart';
import '../../../init/cache/cache_manager.dart';
import 'drawer_model.dart';

class DrawerMenuItems {
  final List<DrawerModel> items = [
    DrawerModel(title: "${CacheManager.getVeriTabani()["Şirket"]} (${CacheManager.getVeriTabani()["Şube"]})", icon: "", onTap: () {}),
    DrawerModel(title: CacheManager.getIsletmeSube()["İşletme"], icon: "", onTap: () {}),
    DrawerModel(title: "${CacheManager.getVeriTabani()["Şube"]} - ${CacheManager.getIsletmeSube()["Şube"]}", icon: "", onTap: () {}),
    DrawerModel(title: "v${AppInfoModel.version}", icon: "", onTap: () {}),
  ];
}
