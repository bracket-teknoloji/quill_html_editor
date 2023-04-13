import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';

import '../../../core/base/state/base_state.dart';
import '../../../core/base/view/base_view.dart';
import '../../../core/components/drawer/left_drawer.dart';
import '../../../core/components/drawer/right_drawer/right_drawer.dart';
import '../../../core/components/grid_tile/grid_tile.dart';
import '../../../core/constants/ui_helper/icon_helper.dart';
import '../../../core/constants/ui_helper/text_style_helper.dart';
import '../../../core/constants/ui_helper/ui_helper.dart';
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
              drawerEnableOpenDragGesture: lastItems.isEmpty,
              drawer: const LeftDrawer(),
              endDrawer: const EndDrawer(),
              body: Column(
                children: [
                  Expanded(
                    flex: 9,
                    child: Padding(
                      padding: UIHelper.midPaddingHorizontal,
                      child: AnimationLimiter(
                        child: GridView.builder(
                          physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: MediaQuery.of(context).size.width ~/ 80,
                            childAspectRatio: 0.8,
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
                                            menuTipi: item.menuTipi,
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
                                                          element.color = item.color;
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
                                IconHelper.getIcon(IconHelper.smallIconWhite, Icons.star),
                                Text(CacheManager.getAnaVeri()!.userModel!.kuladi.toString(), style: TextStyleHelper.subtitleWhite),
                              ],
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              Get.toNamed("/entryCompany");
                            },
                            child: Row(
                              children: [
                                IconHelper.getIcon(IconHelper.smallIconWhite, Icons.storage_rounded),
                                Text("${CacheManager.getVeriTabani()["Şirket"]} (${CacheManager.getVeriTabani()["Şube"]})", style: TextStyleHelper.subtitleWhite),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
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
