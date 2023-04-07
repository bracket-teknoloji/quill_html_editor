import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:kartal/kartal.dart';

import '../../../core/base/state/base_state.dart';
import '../../../core/base/view/base_view.dart';
import '../../../core/components/drawer/left_drawer.dart';
import '../../../core/components/drawer/right_drawer.dart';
import '../../../core/components/grid_tile/grid_tile.dart';
import '../../../core/init/cache/cache_manager.dart';
import '../model/main_page_model.dart';
import '../model/menu_item/menu_item_constants.dart';
import 'grid_items.dart';

class MainPageView extends StatefulWidget {
  const MainPageView({super.key});

  @override
  State<MainPageView> createState() => _MainPageViewState();
}

class _MainPageViewState extends BaseState<MainPageView> {
  late List<GridItems> items = [];
  List<List<GridItems>> lastItems = [];
  bool? yetkiVarMi;
  MenuItemConstants menuItemConstants = MenuItemConstants();
  MainPageModel? model = CacheManager.getAnaVeri();

  @override
  void didUpdateWidget(covariant MainPageView oldWidget) {
    super.didUpdateWidget(oldWidget);
    model = CacheManager.getAnaVeri();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
    return BaseView(
      builder: (context, value) => (Key key, BuildContext context) {
        return Scaffold(
            key: key,
            drawer: const LeftDrawer(),
            endDrawer: const EndDrawer(),
            floatingActionButton: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Visibility(visible: items.isEmpty, child: _fab(yetkiVarMi)),
                Visibility(
                  visible: lastItems.isNotEmpty,
                  child: FloatingActionButton(
                      heroTag: 2,
                      child: const Icon(Icons.remove),
                      onPressed: () {
                        setState(() {
                          items = lastItems.isNullOrEmpty ? [] : lastItems.last;
                          if (lastItems.isNotEmpty) {
                            lastItems.removeLast();
                          }
                        });
                      }),
                ),
              ],
            ),
            body: AnimationLimiter(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: context.isPortrait ? 3 : 8,
                ),
                itemCount: items.length,
                itemBuilder: (context, index) {
                  return AnimationConfiguration.staggeredList(
                      position: index,
                      delay: const Duration(milliseconds: 50),
                      duration: const Duration(milliseconds: 300),
                      child: FadeInAnimation(
                          child: SlideAnimation(
                              verticalOffset: 50.0,
                              child: CustomGridTile(
                                altMenuler: items[index].altMenuler,
                                color: items[index].color,
                                icon: items[index].icon,
                                name: items[index].name,
                                title: items[index].title,
                                onTap: () {
                                  if (items[index].altMenuVarMi()) {
                                    lastItems.add(items);
                                    items = items[index].altMenuler!;
                                    items[index].onTap!();
                                    setState(() {});
                                  } else {
                                    dialogManager.showAlertDialog("Yetkiniz yok");
                                  }
                                },
                              ))));
                },
              ),
            ));
      }(scaffoldKey, context),
      title: "Picker",
      leading: IconButton(
        icon: const Icon(Icons.star_border_outlined),
        onPressed: () {
          if (scaffoldKey.currentState!.isDrawerOpen) {
            Navigator.pop(context);
          } else {
            scaffoldKey.currentState!.openDrawer();
          }
        },
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.person_outline),
          onPressed: () {
            if (scaffoldKey.currentState!.isEndDrawerOpen) {
              Navigator.pop(context);
            } else {
              scaffoldKey.currentState!.openEndDrawer();
            }
          },
        ),
      ],
    );
  }

  FloatingActionButton _fab(bool? yetkiVarMi) {
    return FloatingActionButton(
      heroTag: 1,
      onPressed: () async {
        GridItems gridItems = MenuItemConstants().gridItems;
        items.add(gridItems);
        debugPrint(items.length.toString());
        setState(() {});
      },
      child: const Icon(Icons.add),
    );
  }
}
