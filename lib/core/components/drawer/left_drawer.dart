import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:kartal/kartal.dart";

import "../../base/state/base_state.dart";
import "../../constants/ui_helper/icon_helper.dart";
import "../../constants/ui_helper/ui_helper.dart";
import "../../init/cache/cache_manager.dart";
import "../../init/cache/favorites_model.dart";

class LeftDrawer extends StatefulWidget {
  const LeftDrawer({super.key});

  @override
  State<LeftDrawer> createState() => _LeftDrawerState();
}

class _LeftDrawerState extends BaseState<LeftDrawer> {
  bool isEditing = false;
  List<FavoritesModel> list = CacheManager.getFavoriler().values.toList();
  List get liste => list.where((element) => element.yetkiKontrol).toList();
  @override
  Widget build(BuildContext context) => Drawer(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(UIHelper.highSize),
            bottomRight: Radius.circular(UIHelper.highSize),
          ),
        ),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ListTile(
                titleAlignment: ListTileTitleAlignment.bottom,
                title: Text("Favoriler", style: theme.textTheme.titleMedium),
                trailing: IconButton(
                  onPressed: () {
                    setState(() {
                      isEditing = !isEditing;
                    });
                  },
                  icon: Icon(isEditing ? Icons.edit_off_outlined : Icons.edit_outlined),
                ),
                contentPadding: EdgeInsets.only(left: 12, top: UIHelper.midSize, bottom: UIHelper.midSize),
              ),
              const Divider(),
              if (list.ext.isNullOrEmpty)
                Expanded(
                  flex: 2,
                  child: Column(
                    children: [
                      IconHelper.bigIcon("Yildiz", color: theme.colorScheme.onSurface.withOpacity(0.5)).marginSymmetric(vertical: 20),
                      Text("Favori menü yok.", style: theme.textTheme.bodyMedium),
                      Padding(
                        padding: UIHelper.midPadding,
                        child: Text("Eklemek için menü öğelerinde favori simgesine dokunun.", textAlign: TextAlign.center, style: theme.textTheme.bodyMedium),
                      ),
                    ],
                  ),
                )
              else
                Expanded(
                  child: ReorderableListView.builder(
                    onReorder: (oldIndex, newIndex) {
                      setState(() {
                        if (newIndex > oldIndex) {
                          newIndex -= 1;
                        }
                        final item = list.elementAt(oldIndex);
                        final item2 = list.elementAt(newIndex);
                        list.removeAt(oldIndex);
                        list.insert(newIndex, item);
                        CacheManager.setFavorilerSira(oldIndex, item2);
                        CacheManager.setFavorilerSira(newIndex, item);
                      });
                    },
                    key: const Key("Favoriler"),
                    itemBuilder: (context, index) {
                      final value = list[index];
                      return ListTile(
                        key: ValueKey(index),
                        enabled: liste.contains(value),
                        title: Text(
                          value.title.toString(),
                        ),
                        leading: IconHelper.smallMenuIcon(value.icon.toString(), color: Color(value.color!)),
                        trailing: isEditing
                            ? IconButton(
                                onPressed: () {
                                  setState(() {
                                    list.removeAt(index);
                                    CacheManager.setFavorilerList(list.map((e) => e).toList());
                                  });
                                },
                                icon: const Icon(Icons.delete_outline),
                              )
                            : const Icon(Icons.drag_handle),
                        onTap: value.arguments != null ? () => Get.toNamed(value.onTap.toString(), arguments: value.arguments) : () => Get.toNamed(value.onTap.toString()),
                      );
                    },
                    itemCount: list.length,
                  ),
                ),
            ],
          ),
        ),
      );
}
