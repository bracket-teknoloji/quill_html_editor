import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

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
  List<GridItems> items = MenuItemConstants().getList();
  List<List<GridItems>> lastItems = [];
  bool? yetkiVarMi;
  MainPageModel? model = CacheManager.getAnaVeri();
  List<String> title2 = ["Picker"];

  @override
  Widget build(BuildContext context) {
    GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

    return BaseView(
      builder: (context, value) => (Key key, BuildContext context) {
        return WillPopScope(
          onWillPop: () async {
            if (lastItems.isNotEmpty) {
              setState(() {
                items = lastItems.last;

                title2.removeLast();
                lastItems.removeLast();
              });
              return false;
            } else {
              if (scaffoldKey.currentState!.isDrawerOpen || scaffoldKey.currentState!.isEndDrawerOpen) {
                scaffoldKey.currentState!.closeDrawer();
                scaffoldKey.currentState!.closeEndDrawer();
                dialogManager.showExitDialog();
              } else {
                dialogManager.showExitDialog();
              }
              return false;
            }
          },
          child: Scaffold(
              key: key,
              drawer: const LeftDrawer(),
              endDrawer: const EndDrawer(),
              body: AnimationLimiter(
                child: GridView.builder(
                  physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: MediaQuery.of(context).size.width ~/ 80,
                    childAspectRatio: 0.9,
                  ),
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    return AnimationConfiguration.staggeredList(
                        position: index,
                        duration: const Duration(milliseconds: 900),
                        delay: const Duration(milliseconds: 50),
                        child: ScaleAnimation(
                            curve: Curves.fastLinearToSlowEaseIn,
                            duration: const Duration(milliseconds: 900),
                            child: FadeInAnimation(
                                child: CustomGridTile(
                                    menuTipi: items[index].menuTipi,
                                    altMenuler: items[index].altMenuler,
                                    color: items[index].color,
                                    icon: items[index].icon,
                                    name: items[index].name.toString(),
                                    title: items[index].title.toString(),
                                    onTap: () {
                                      if (items[index].altMenuVarMi) {
                                        setState(() {
                                          lastItems.add(items);
                                          title2.add(items[index].title.toString());
                                          items = items[index].altMenuler!.where((element) {
                                            element.color = items[index].color;
                                            return element.yetkiKontrol;
                                          }).toList();
                                        });
                                      } else {
                                        items[index].onTap?.call();
                                      }
                                    }))));
                  },
                ),
              )),
        );
      }(scaffoldKey, context),
      title: title2.last,
      leading: anaSayfaMi
          ? IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                setState(() {
                  items = lastItems.last;
                  title2.removeLast();
                  lastItems.removeLast();
                });
              },
            )
          : IconButton(
              icon: const Icon(Icons.star_border_outlined),
              onPressed: () async {
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

  bool get anaSayfaMi => items.any((element) {
        return element.menuTipi != "A";
      });
}
