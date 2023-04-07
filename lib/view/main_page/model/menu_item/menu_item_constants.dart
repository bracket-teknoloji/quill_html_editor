import '../../../../core/components/dialog/dialog_manager.dart';
import '../../../../core/constants/grid_constants.dart';
import '../../../../core/init/cache/cache_manager.dart';
import '../../view/grid_items.dart';

class MenuItemConstants {
  final CacheManager _cacheManager = CacheManager.instance;

  GridItems gridItems =
      GridItems.anamenu(name: "Cari", title: "Cari", icon: "f", color: GridThemeManager.tallow, altMenuler: [
    GridItems.item(name: "Cari", title: "Cari", icon: "f", onTap: () {}),
    GridItems.altmenu(name: "", title: "Cari Listesi", icon: "f", altMenuler: [
      GridItems.item(
          name: "Cari",
          title: "Cari",
          icon: "f",
          onTap: () {
            DialogManager().showAlertDialog("Son item");
          }),
      GridItems.item(
          name: "Cari",
          title: "Cari",
          icon: "f",
          onTap: () {
            DialogManager().showAlertDialog("Son item");
          }),
      GridItems.item(
          name: "Cari",
          title: "Cari",
          icon: "f",
          onTap: () {
            DialogManager().showAlertDialog("Son item");
          })
    ])
  ]);
}
