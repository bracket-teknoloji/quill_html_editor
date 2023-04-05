import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:kartal/kartal.dart';

import '../../../core/base/view/base_view.dart';
import '../../../core/components/drawer/left_drawer.dart';
import '../../../core/components/drawer/right_drawer.dart';
import '../../../core/components/grid_tile/grid_tile.dart';
import '../../../core/constants/grid_constants.dart';

class MainPageView extends StatelessWidget {
  const MainPageView({super.key});

  @override
  Widget build(BuildContext context) {
    GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
    return BaseView(
      builder: (context, value) => buildScaffold(scaffoldKey),
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
}

Widget buildScaffold(Key key) {
  return Scaffold(
      key: key,
      drawer: const LeftDrawer(),
      endDrawer: const EndDrawer(),
      body: AnimationLimiter(
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
          ),
          itemCount: GridThemeManager.gridTileColors.length,
          itemBuilder: (context, index) {
            return AnimationConfiguration.staggeredList(
                position: index,
                delay: const Duration(milliseconds: 50),
                duration: const Duration(milliseconds: 300),
                child: FadeInAnimation(
                  child: CustomGridTile(
                    name: GridThemeManager.gridNames[index],
                    color: GridThemeManager.gridTileColors[index],
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Flexible(flex: 3, child: Icon(GridThemeManager.gridIcons[index])),
                        Expanded(
                          flex: 4,
                          child: Container(
                            padding: context.paddingLow,
                            child: Text(
                              GridThemeManager.gridNames[index],
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ));
          },
        ),
      ));
}
