import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:kartal/kartal.dart";
import "package:picker/core/components/wave/login_wave_widget.dart";
import "package:picker/view/add_company/model/account_model.dart";

import "../../base/state/base_state.dart";
import "../../constants/ui_helper/icon_helper.dart";
import "../../constants/ui_helper/ui_helper.dart";
import "../../init/cache/cache_manager.dart";
import "../../init/cache/favorites_model.dart";

class LeftDrawer extends StatefulWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;
  const LeftDrawer({super.key, required this.scaffoldKey});

  @override
  State<LeftDrawer> createState() => _LeftDrawerState();
}

class _LeftDrawerState extends BaseState<LeftDrawer> {
  bool isEditing = false;
  List<FavoritesModel> list =
      CacheManager.getFavoriler.values.toList().where((element) => (CacheManager.getAnaVeri?.userModel?.profilYetki?.toJson()[element.name ?? ""] == true) || AccountModel.instance.adminMi).toList();
  List get liste => list.where((element) => element.yetkiKontrol).toList();
  @override
  Widget build(BuildContext context) => Drawer(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(UIHelper.highSize),
            bottomRight: Radius.circular(UIHelper.highSize),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Flexible(
              child: Stack(
                children: [
                  LoginWaveWidget(foreoregroundColor: theme.colorScheme.surfaceContainerLow),
                  ListTile(
                    style: ListTileStyle.drawer,
                    title: const Text(
                      "Favoriler",
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    trailing: IconButton(
                      onPressed: () {
                        setState(() {
                          isEditing = !isEditing;
                        });
                      },
                      icon: Icon(isEditing ? Icons.edit_off_outlined : Icons.edit_outlined),
                    ),
                    contentPadding: const EdgeInsets.only(left: UIHelper.midSize, top: UIHelper.midSize, bottom: UIHelper.midSize),
                  ),
                ],
              ),
            ),

            // Card(
            //   child: ListTile(
            //     style: ListTileStyle.drawer,
            //     title: Text("Favoriler", style: theme.textTheme.titleLarge),
            //     trailing: IconButton(
            //       onPressed: () {
            //         setState(() {
            //           isEditing = !isEditing;
            //         });
            //       },
            //       icon: Icon(isEditing ? Icons.edit_off_outlined : Icons.edit_outlined),
            //     ),
            //     contentPadding: const EdgeInsets.only(left: UIHelper.midSize, top: UIHelper.midSize, bottom: UIHelper.midSize),
            //   ),
            // ),
            if (list.ext.isNullOrEmpty)
              Expanded(
                flex: 6,
                child: Column(
                  children: [
                    Icon(
                      Icons.star_border_outlined,
                      size: UIHelper.highSize * 5,
                      color: theme.colorScheme.onSurface.withOpacity(0.5),
                    ).marginSymmetric(vertical: 20),
                    // IconHelper.bigIcon("Yildiz", color: theme.colorScheme.onSurface.withOpacity(0.5)).marginSymmetric(vertical: 20),
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
                flex: 7,
                child: Theme(
                  data: Theme.of(context).copyWith(
                    canvasColor: Colors.transparent,
                    shadowColor: Colors.transparent,
                  ),
                  child: ReorderableListView.builder(
                    primary: false,
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
                      return Card(
                        key: ValueKey(index),
                        child: ListTile(
                          contentPadding: UIHelper.midPaddingHorizontal,
                          enabled: liste.contains(value),
                          title: Text(
                            value.title.toString(),
                          ),
                          leading: IconHelper.middleMenuIcon(value.icon.toString(), color: Color(value.color!)),
                          trailing: isEditing
                              ? IconButton(
                                  style: ButtonStyle(padding: WidgetStateProperty.all(EdgeInsets.zero)),
                                  onPressed: () {
                                    setState(() {
                                      list.removeAt(index);
                                      CacheManager.setFavorilerList(list);
                                    });
                                  },
                                  icon: const Icon(Icons.delete_outline),
                                )
                              : const Icon(Icons.drag_handle).paddingOnly(right: UIHelper.lowSize),
                          onTap: () {
                            if (mounted) {
                              widget.scaffoldKey.currentState!.closeDrawer();
                            }
                            // Navigator.of(context).pop();
                            if (value.arguments != null) {
                              Get.toNamed(value.onTap.toString(), arguments: value.arguments);
                              // Navigator.pushNamed(context, value.onTap.toString(), arguments: value.arguments);
                            } else {
                              Get.toNamed(value.onTap.toString());
                              // Navigator.pushNamed(context, value.onTap.toString());
                            }
                          },
                        ),
                      );
                    },
                    itemCount: list.length,
                  ).paddingAll(UIHelper.lowSize),
                ),
              ),
          ],
        ),
      );
}
