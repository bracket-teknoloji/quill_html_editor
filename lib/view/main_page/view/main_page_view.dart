import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:kartal/kartal.dart';

import '../../../core/base/view/base_view.dart';
import '../../../core/components/drawer/drawer.dart';
import '../../../core/components/drawer/state_drawer.dart';
import '../../../core/components/grid_tile/grid_tile.dart';
import '../../../core/constants/grid_constants.dart';
import '../../../core/init/cache/login_bearer_token.dart';

class MainPageView extends StatelessWidget {
  const MainPageView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AddItemToDrawer());
    GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
    return BaseView(
      builder: (context, value) => buildScaffold(scaffoldKey, controller),
      title: "Picker",
      leading: IconButton(
        icon: const Icon(Icons.menu_open_outlined),
        onPressed: () {
          if (scaffoldKey.currentState!.isDrawerOpen) {
            Navigator.pop(context);
          } else {
            scaffoldKey.currentState!.openDrawer();
          }
        },
      ),
    );
  }
}

Widget buildScaffold(Key key, AddItemToDrawer controller) {
  return Scaffold(
      key: key,
      drawer: const FavoriteDrawer(),
      body: AnimationLimiter(
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            childAspectRatio: 0.9,
          ),
          itemCount: GridThemeManager.gridTileColors.length,
          itemBuilder: (context, index) {
            return AnimationConfiguration.staggeredList(
                position: index,
                delay: const Duration(milliseconds: 10),
                duration: const Duration(milliseconds: 300),
                child: SlideAnimation(
                  verticalOffset: 5.0,
                  child: FadeInAnimation(
                    child: CustomGridTile(
                      color: GridThemeManager.gridTileColors[index],
                      // header: IconButton(
                      //     onPressed: () {
                      //       controller.drawerItems.add(
                      //         DrawerItem(
                      //           title: "Item ${controller.drawerItems.length}",
                      //           icon: Icons.star,
                      //           onTap: () {},
                      //         ),
                      //       );
                      //     },
                      //     icon: const Icon(Icons.star)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Flexible(
                              flex: 3,
                              child: Icon(GridThemeManager.gridIcons[index])),
                          Expanded(
                            flex: 3,
                            child: Container(
                              padding: context.paddingLow,
                              width: 150,
                              child: Text(
                                GridThemeManager.gridNames[index],
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ));
          },
        ),
      ));
}

Drawer drawer() {
  return Drawer(
    child: ListView(
      children: const <Widget>[
        DrawerHeader(
          decoration: BoxDecoration(
            color: Colors.blue,
          ),
          child: Text(
            'Drawer Header',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
            ),
          ),
        ),
        ListTile(
          leading: Icon(Icons.message),
          title: Text('Messages'),
        ),
        ListTile(
          leading: Icon(Icons.account_circle),
          title: Text('Profile'),
        ),
        ListTile(
          leading: Icon(Icons.settings),
          title: Text('Settings'),
        ),
      ],
    ),
  );
}
