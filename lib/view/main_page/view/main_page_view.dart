import "dart:io";

import "package:firebase_messaging/firebase_messaging.dart";
import "package:flutter/foundation.dart";
import "package:flutter/material.dart";
import "package:flutter_mobx/flutter_mobx.dart";
import "package:flutter_staggered_animations/flutter_staggered_animations.dart";
import "package:get/get.dart";
import "package:kartal/kartal.dart";
import "package:picker/core/components/dialog/bottom_sheet/model/bottom_sheet_model.dart";
import "package:picker/core/components/wrap/appbar_title.dart";
import "package:picker/view/main_page/view_model/main_page_view_model.dart";

import "../../../core/base/state/base_state.dart";
import "../../../core/components/drawer/left_drawer.dart";
import "../../../core/components/drawer/right_drawer/right_drawer.dart";
import "../../../core/components/grid_tile/grid_tile.dart";
import "../../../core/constants/ui_helper/icon_helper.dart";
import "../../../core/constants/ui_helper/ui_helper.dart";
import "../../../core/init/cache/cache_manager.dart";
import "../model/main_page_model.dart";
import "../model/menu_item/menu_item_constants.dart";

final class MainPageView extends StatefulWidget {
  final bool fromSplash;
  const MainPageView({super.key, this.fromSplash = false});

  @override
  State<MainPageView> createState() => _MainPageViewState();
}

final class _MainPageViewState extends BaseState<MainPageView> {
  final MainPageViewModel viewModel = MainPageViewModel();
  // late List<GridItemModel> items;
  // List<List<GridItemModel>> lastItems = [];
  MainPageModel? model = CacheManager.getAnaVeri;
  // List<String> title2 = ["Picker"];

  @override
  void initState() {
    viewModel.setItems(MenuItemConstants(context).getList());
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      FirebaseMessaging.onMessage.listen((RemoteMessage message) {
        if (message.data["route"] != null && widget.fromSplash) Get.toNamed(message.data["route"] ?? "/");
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, value) async {
        if (viewModel.lastItems.isNotEmpty) {
          viewModel.setItems(viewModel.lastItems.last);
          // viewModel.removeLastTitle();
          viewModel.removeLastItem();
        } else {
          if (scaffoldKey.currentState!.isDrawerOpen || scaffoldKey.currentState!.isEndDrawerOpen) {
            scaffoldKey.currentState!.closeDrawer();
            scaffoldKey.currentState!.closeEndDrawer();
            return dialogManager.showExitDialog();
          } else {
            // dialogManager.showExitDialog();
          }
        }
      },
      child: Scaffold(
        appBar: appBar(scaffoldKey, context),
        key: scaffoldKey,
        drawerEnableOpenDragGesture: viewModel.lastItems.isEmpty,
        drawer: SafeArea(child: LeftDrawer(scaffoldKey: scaffoldKey)),
        endDrawer: (kIsWeb && context.isLandscape) ? null : SafeArea(child: EndDrawer(scaffoldKey: scaffoldKey)),
        body: Row(
          children: [
            Expanded(child: body(context)),
            if (kIsWeb && context.isLandscape) SafeArea(child: EndDrawer(scaffoldKey: scaffoldKey)),
          ],
        ),
        bottomNavigationBar: bottomBar(scaffoldKey),
      ),
    );
  }

  AppBar appBar(GlobalKey<ScaffoldState> scaffoldKey, BuildContext context) => AppBar(
        title: Observer(
          builder: (_) => AppBarTitle(title: viewModel.titleList.last),
        ),
        centerTitle: true,
        leading: Observer(
          builder: (_) => anaSayfaMi
              ? IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: () {
                    viewModel.setItems(viewModel.lastItems.last);
                    viewModel.removeLastItem();
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
        ),
        actions: [
          if (kDebugMode)
            IconButton(
              onPressed: () async {
                //print all intial routes
                final List<String> routes = [];
                for (final route in Get.routeTree.routes) {
                  if (route.arguments == null) {
                    routes.add(route.name);
                  }
                }
                final result = await bottomSheetDialogManager.showRadioBottomSheetDialog<String>(
                  context,
                  title: "Routes",
                  groupValue: "/",
                  children: List.generate(routes.length, (index) => BottomSheetModel(title: routes[index], value: routes[index])),
                );
                if (result != null) {
                  Get.toNamed(result, arguments: 1);
                }
              },
              icon: const Icon(Icons.bug_report_outlined),
            ),
          if (!(kIsWeb && context.isLandscape))
            IconButton(
              onPressed: () {
                scaffoldKey.currentState!.openEndDrawer();
              },
              icon: const Icon(Icons.person_outline_outlined),
            ),
        ],
      );

  SafeArea body(BuildContext context) => SafeArea(
        child: Stack(
          children: [
            Observer(
              builder: (_) => bodyWidget(),
            ),
            if (!kIsWeb && Platform.isIOS && viewModel.lastItems.isNotEmpty)
              SizedBox(
                width: UIHelper.highSize * 3,
                child: GestureDetector(
                  onHorizontalDragStart: (details) {
                    if (Directionality.of(context) == TextDirection.ltr) {
                      return;
                    }
                    if (details.localPosition.dx < 50) {
                      viewModel.setItems(viewModel.lastItems.last);
                      viewModel.removeLastItem();
                    }
                  },
                  onHorizontalDragEnd: (details) {
                    if (Directionality.of(context) == TextDirection.rtl) {
                      return;
                    }
                    if (details.primaryVelocity! > 0) {
                      viewModel.setItems(viewModel.lastItems.last);
                      viewModel.removeLastItem();
                    }
                  },
                ),
              ),
          ],
        ),
      );

  GridView bodyWidget() => GridView.builder(
        padding: UIHelper.lowPadding,
        physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: kIsWeb
              ? MediaQuery.sizeOf(context).width ~/ 120 > 8
                  ? 8
                  : MediaQuery.sizeOf(context).width ~/ 120
              : MediaQuery.sizeOf(context).width ~/ 90 > 10
                  ? 10
                  : MediaQuery.sizeOf(context).width ~/ 90,
          childAspectRatio: 0.9,
        ),
        itemCount: viewModel.items.length,
        itemBuilder: (context, index) {
          //* indexteki itemi burada alıyoruz
          final item = viewModel.items[index];
          return AnimationConfiguration.staggeredList(
            key: Key(item.title),
            position: index,
            duration: const Duration(milliseconds: 500),
            delay: const Duration(milliseconds: 50),
            child: FadeInAnimation(
              child: CustomGridTile(
                // color: item.color,
                model: item,
                // title: item.title.toString(),
                onTap: () {
                  if (item.altMenuVarMi) {
                    if (item.altMenuler?.length == 1 && (item.altMenuler?.first.yetkiKontrol == true)) {
                      item.altMenuler?.firstOrNull?.onTap?.call();
                      return;
                    }
                    viewModel.addLastItem(viewModel.items);
                    viewModel.titleList.add(item.title);
                    viewModel.setItems(
                      item.altMenuler!.where((element) {
                        element.color ??= item.color;
                        if (element.icon.ext.isNullOrEmpty) {
                          element.icon = item.icon;
                        }
                        return element.yetkiKontrol;
                      }).toList(),
                    );
                  } else {
                    item.onTap?.call();
                  }
                },
              ),
            ),
          );
        },
      );

  SafeArea bottomBar(GlobalKey<ScaffoldState> scaffoldKey) => SafeArea(
        child: Row(
          // alignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton(
              onPressed: () {
                scaffoldKey.currentState!.openEndDrawer();
              },
              child: Row(
                children: [
                  (CacheManager.getAnaVeri!.userModel!.admin == "E" ? const Icon(Icons.local_police_outlined, color: UIHelper.primaryColor, size: 20) : IconHelper.smallIcon("User-Account"))
                      .marginOnly(right: 5),
                  Text(CacheManager.getAnaVeri!.userModel!.kuladi.toString(), style: theme.textTheme.bodyMedium),
                ],
              ),
            ),
            const Spacer(),
            TextButton(
              onPressed: () {
                Get.toNamed("/entryCompany", arguments: false);
              },
              child: Row(
                children: [
                  const Icon(Icons.storage_outlined, color: UIHelper.primaryColor, size: 20).marginOnly(right: 5),
                  Text("${CacheManager.getVeriTabani["Şirket"]} (${CacheManager.getVeriTabani["Şube"]})", style: theme.textTheme.bodyMedium),
                ],
              ),
            ),
          ],
        ).paddingAll(UIHelper.midSize),
      );

  bool get anaSayfaMi => viewModel.items.any((element) => element.menuTipi != "A");
  // Icon yetkiKontrolIcon(String name) {
  //   if (CacheManager.getFavoriler().values.any((element) => element.title == name)) {
  //     return const Icon(Icons.star, size: 20);
  //   } else {
  //     CacheManager.removeFavoriler(name.toString());
  //     return const Icon(Icons.star_border, size: 20);
  //   }
  // }
}
