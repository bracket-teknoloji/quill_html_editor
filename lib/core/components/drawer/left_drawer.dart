import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kartal/kartal.dart';

import '../../base/state/base_state.dart';
import '../../constants/ui_helper/icon_helper.dart';
import '../../constants/ui_helper/ui_helper.dart';
import '../../init/cache/cache_manager.dart';
import '../../init/cache/favorites_model.dart';

class LeftDrawer extends StatefulWidget {
  const LeftDrawer({super.key});

  @override
  State<LeftDrawer> createState() => _LeftDrawerState();
}

class _LeftDrawerState extends BaseState<LeftDrawer> {
  List list = CacheManager.getFavoriler().values.toList();
  List get liste {
    var yetkiKontrol = CacheManager.getAnaVeri()?.userModel?.profilYetki;
    yetkiKontrol?.toJson().forEach((key, value) {
      for (var i = 0; i < list.length; i++) {
        if (key == list[i].name) {
          if (value == false) {
            list = list.where((element) => element.name != key).toList();
          }
        }
      }
    });
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Column(mainAxisAlignment: MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.stretch, children: [
      ListTile(
        titleAlignment: ListTileTitleAlignment.bottom,
        title: Text("Favoriler", style: theme.textTheme.titleMedium),
        trailing: IconButton(
          icon: IconButton(onPressed: () {}, icon: const Icon(Icons.edit_note_outlined)),
          onPressed: () => Get.back(),
        ),
        contentPadding: const EdgeInsets.only(left: 12, top: 10, bottom: 10),
      ),
      const Divider(),
      liste.isNullOrEmpty
          ? Expanded(
              flex: 2,
              child: Column(
                children: [
                  IconHelper.bigIcon("Yildiz", color: Colors.white.withOpacity(0.5)).marginSymmetric(vertical: 20),
                  Text("Favori menü yok.", style: theme.textTheme.bodyMedium),
                  Padding(
                    padding: UIHelper.midPadding,
                    child: Text("Eklemek için menü öğelerinde favori simgesine dokunun.", textAlign: TextAlign.center, style: theme.textTheme.bodyMedium),
                  ),
                ],
              ),
            )
          : Expanded(
              child: ReorderableListView.builder(
                  onReorder: (oldIndex, newIndex) {
                    setState(() {
                      if (newIndex > oldIndex) {
                        newIndex -= 1;
                      }
                      final item = list.removeAt(oldIndex);
                      list.insert(newIndex, item);
                      CacheManager.setFavorilerSira(
                        {for (var e in list) e.name: e},
                      );
                    });
                  },
                  key: const Key("Favoriler"),
                  itemBuilder: (context, index) {
                    var value = liste[index];
                    if (value is FavoritesModel) {
                      //return ListTile with ordered by CacheManager.getFavorilerSira
                      return ListTile(
                        key: ValueKey(index),
                        title: Text(
                          value.title.toString(),
                        ),
                        leading: IconHelper.smallMenuIcon(value.icon.toString(), color: Color(value.color!)),
                        trailing: const Icon(Icons.drag_handle),
                        onTap: () => Get.toNamed(value.onTap.toString()),
                      );
                    } else {
                      return const SizedBox();
                    }
                  },
                  itemCount: liste.length)),
    ]));
  }
}
