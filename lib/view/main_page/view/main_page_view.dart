import "package:flutter/material.dart";
import "package:flutter_staggered_animations/flutter_staggered_animations.dart";
import "package:get/get.dart";
import "package:kartal/kartal.dart";

import "../../../core/base/state/base_state.dart";
import "../../../core/components/drawer/left_drawer.dart";
import "../../../core/components/drawer/right_drawer/right_drawer.dart";
import "../../../core/components/grid_tile/grid_tile.dart";
import "../../../core/components/wrap/appbar_title.dart";
import "../../../core/constants/ui_helper/icon_helper.dart";
import "../../../core/constants/ui_helper/ui_helper.dart";
import "../../../core/init/cache/cache_manager.dart";
import "../model/grid_item_model.dart";
import "../model/main_page_model.dart";
import "../model/menu_item/menu_item_constants.dart";

class MainPageView extends StatefulWidget {
  const MainPageView({super.key});

  @override
  State<MainPageView> createState() => _MainPageViewState();
}

class _MainPageViewState extends BaseState<MainPageView> {
  List<GridItemModel> items = MenuItemConstants().getList();
  List<List<GridItemModel>> lastItems = [];
  bool? yetkiVarMi;
  MainPageModel? model = CacheManager.getAnaVeri();
  List<String> title2 = ["Picker"];

  @override
  Widget build(BuildContext context) {
    GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
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
          appBar: appBar(scaffoldKey, context),
          key: scaffoldKey,
          drawerEnableOpenDragGesture: lastItems.isEmpty,
          drawer: const SafeArea(child: LeftDrawer()),
          endDrawer: const SafeArea(child: EndDrawer()),
          body: SafeArea(
            child: Column(
              children: [
                Expanded(
                  flex: 9,
                  child: Padding(
                    padding: UIHelper.lowPadding,
                    child: AnimationLimiter(
                      child: GridView.builder(
                        physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: MediaQuery.of(context).size.width ~/ 90 > 10 ? 10 : MediaQuery.of(context).size.width ~/ 90,
                          childAspectRatio: 0.9,
                        ),
                        itemCount: items.length,
                        itemBuilder: (context, index) {
                          //* indexteki itemi burada alıyoruz
                          var item = items[index];
                          return AnimationConfiguration.staggeredList(
                              position: index,
                              duration: const Duration(milliseconds: 900),
                              delay: const Duration(milliseconds: 50),
                              child: ScaleAnimation(
                                  curve: Curves.fastLinearToSlowEaseIn,
                                  duration: const Duration(milliseconds: 900),
                                  child: FadeInAnimation(
                                      child: CustomGridTile(
                                          iconWidget: item.iconData,
                                          menuTipi: item.menuTipi,
                                          route: item.route,
                                          arguments: item.arguments,
                                          altMenuler: item.altMenuler,
                                          color: item.color,
                                          icon: item.icon,
                                          name: item.name.toString(),
                                          title: item.title.toString(),
                                          onTap: () {
                                            if (item.altMenuVarMi) {
                                              item.altMenuler?.length == 1
                                                  ? item.altMenuler?.first.onTap?.call()
                                                  : setState(() {
                                                      lastItems.add(items);
                                                      title2.add(item.title.toString());
                                                      items = item.altMenuler!.where((element) {
                                                        element.color ??= item.color;
                                                        if (element.icon.ext.isNullOrEmpty) {
                                                          element.icon = item.icon;
                                                        }
                                                        return element.yetkiKontrol;
                                                      }).toList();
                                                    });
                                            } else {
                                              items[index].onTap?.call();
                                            }
                                          }))));
                        },
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: ButtonBar(
                      alignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(
                          onPressed: () {
                            scaffoldKey.currentState!.openEndDrawer();
                          },
                          child: Row(
                            children: [
                              (CacheManager.getAnaVeri()!.userModel!.admin == "E" ? Icon(Icons.local_police_outlined, color: UIHelper.primaryColor, size: 20) : IconHelper.smallIcon("User-Account"))
                                  .marginOnly(right: 5),
                              Text(CacheManager.getAnaVeri()!.userModel!.kuladi.toString(), style: theme.textTheme.bodyMedium),
                            ],
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Get.toNamed("/entryCompany");
                          },
                          child: Row(
                            children: [
                              Icon(Icons.storage_outlined, color: UIHelper.primaryColor, size: 20).marginOnly(right: 5),
                              Text("${CacheManager.getVeriTabani()["Şirket"]} (${CacheManager.getVeriTabani()["Şube"]})", style: theme.textTheme.bodyMedium),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          )),
    );

    // return BaseView(
    //   builder: (context, value) => (Key key, BuildContext context) {}(scaffoldKey, context),
    //   title: title2.last,
    //   leading: anaSayfaMi
    //       ? IconButton(
    //           icon: const Icon(Icons.arrow_back),
    //           onPressed: () {
    //             setState(() {
    //               items = lastItems.last;
    //               title2.removeLast();
    //               lastItems.removeLast();
    //             });
    //           },
    //         )
    //       : IconButton(
    //           icon: IconHelper.appBarIcon("Yildiz"),
    //           onPressed: () async {
    //             if (scaffoldKey.currentState!.isDrawerOpen) {
    //               Navigator.pop(context);
    //             } else {
    //               scaffoldKey.currentState!.openDrawer();
    //             }
    //           },
    //         ),
    //   actions: [
    //     IconButton(
    //       icon: IconHelper.appBarIcon("User-Account"),
    //       onPressed: () {
    //         if (scaffoldKey.currentState!.isEndDrawerOpen) {
    //           Navigator.pop(context);
    //         } else {
    //           scaffoldKey.currentState!.openEndDrawer();
    //         }
    //       },
    //     ),
    //   ],
    // );
  }

  AppBar appBar(GlobalKey<ScaffoldState> scaffoldKey, BuildContext context) {
    return AppBar(
      title: AppBarTitle(title: title2.last),
      centerTitle: true,
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
            onPressed: () {
              scaffoldKey.currentState!.openEndDrawer();
            },
            icon: const Icon(Icons.person_outline_outlined)),
      ],
    );
  }

  bool get anaSayfaMi => items.any((element) {
        return element.menuTipi != "A";
      });
  // Icon yetkiKontrolIcon(String name) {
  //   if (CacheManager.getFavoriler().values.any((element) => element.title == name)) {
  //     return const Icon(Icons.star, size: 20);
  //   } else {
  //     CacheManager.removeFavoriler(name.toString());
  //     return const Icon(Icons.star_border, size: 20);
  //   }
  // }
}
