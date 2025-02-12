import "dart:io";

import "package:flutter/foundation.dart";
import "package:flutter/material.dart";
import "package:flutter_mobx/flutter_mobx.dart";
import "package:flutter_staggered_animations/flutter_staggered_animations.dart";
import "package:get/get.dart";
import "package:kartal/kartal.dart";
import "package:picker/core/base/model/teklif_iste_model.dart";
import "package:picker/core/init/dependency_injection/di_manager.dart";
import "package:picker/core/init/location/location_manager.dart";
import "package:picker/core/init/network/login/api_urls.dart";
import "package:picker/view/add_company/model/account_model.dart";
import "package:text_scroll/text_scroll.dart";

import "../../../core/base/state/base_state.dart";
import "../../../core/components/dialog/bottom_sheet/model/bottom_sheet_model.dart";
import "../../../core/components/drawer/left_drawer.dart";
import "../../../core/components/drawer/right_drawer/right_drawer.dart";
import "../../../core/components/grid_tile/grid_tile.dart";
import "../../../core/components/wrap/appbar_title.dart";
import "../../../core/constants/ui_helper/icon_helper.dart";
import "../../../core/constants/ui_helper/ui_helper.dart";
import "../../../core/init/cache/cache_manager.dart";
import "../model/main_page_model.dart";
import "../model/menu_item/menu_item_constants.dart";
import "../view_model/main_page_view_model.dart";

final class MainPageView extends StatefulWidget {
  const MainPageView({super.key, this.fromSplash = false});
  final bool fromSplash;

  @override
  State<MainPageView> createState() => _MainPageViewState();
}

final class _MainPageViewState extends BaseState<MainPageView> {
  final MainPageViewModel viewModel = MainPageViewModel();

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  MainPageModel? get model => CacheManager.getAnaVeri;

  @override
  void initState() {
    viewModel.setItems(MenuItemConstants.getList());
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await DIManager.init();
      if (parametreModel.genelKonumTakibiYapilsin == "E") {
        await DIManager.read<LocationManager>().startTracking();
      }
      if (!kIsWeb) {
        if (CacheManager.getAccounts(AccountModel.instance.uyeEmail ?? "") case final value?) {
          if (value.sozlesmeUyarisiGoster != true) return;
          if ((value.sozlesmeTeklifGoster ?? false) && AccountModel.instance.adminMi) {
            dialogManager.showInfoMaterialBannerWithAction(value.karsilamaBaslik ?? "", desc: value.karsilamaMesaji, onAction: getTeklif);
          } else {
            dialogManager.showInfoMaterialBanner(value.karsilamaBaslik ?? "", desc: value.karsilamaMesaji);
          }
        }
      }
      
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) => PopScope(
        canPop: false,
        onPopInvokedWithResult: (didPop, value) async {
          if (viewModel.lastItems.isNotEmpty) {
            viewModel
              ..setItems(viewModel.lastItems.last)
              ..removeLastItem(context);
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
        child: Row(
          children: [
            if (kIsWeb && context.isLandscape) Expanded(child: LeftDrawer(scaffoldKey: scaffoldKey)),
            Expanded(
              flex: (context.isLandscape) ? 3 : 1,
              child: Observer(
                builder: (_) => Scaffold(
                  appBar: appBar(scaffoldKey, context),
                  key: scaffoldKey,
                  drawerEnableOpenDragGesture: viewModel.lastItems.isEmpty,
                  drawer: (kIsWeb && context.isLandscape) ? null : SafeArea(child: LeftDrawer(scaffoldKey: scaffoldKey)),
                  endDrawer: (kIsWeb && context.isLandscape) ? null : SafeArea(child: EndDrawer(scaffoldKey: scaffoldKey)),
                  body: body(context),
                  // bottomNavigationBar: bottomBar(scaffoldKey),
                ),
              ),
            ),
            if (kIsWeb && context.isLandscape) Expanded(child: EndDrawer(scaffoldKey: scaffoldKey)),
          ],
        ),
      );

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
                    viewModel
                      ..setItems(viewModel.lastItems.last)
                      ..removeLastItem(context);
                  },
                )
              : (kIsWeb && context.isLandscape)
                  ? const SizedBox.shrink()
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
        child: Column(
          children: [
            if (kIsWeb)
              if (CacheManager.getAccounts(AccountModel.instance.uyeEmail ?? "") case final value?)
                Card(
                  color: UIHelper.primaryColor.withValues(alpha: 0.7),
                  child: ListTile(
                    title: Text(value.karsilamaBaslik ?? value.karsilamaMesaji ?? ""),
                    subtitle: TextScroll(value.karsilamaMesaji ?? ""),
                    leading: const Icon(Icons.warning_outlined),
                    trailing: IconButton(
                      icon: const Icon(Icons.chevron_right),
                      onPressed: () async {
                        if (value.sozlesmeUyarisiGoster != true) return;
                        if ((value.sozlesmeTeklifGoster ?? false) && AccountModel.instance.adminMi) {
                          await getTeklif();
                        } else {
                          dialogManager.showInfoDialog(value.karsilamaMesaji ?? "");
                        }
                      },
                    ),
                  ),
                ).paddingAll(UIHelper.lowSize),
            Expanded(
              child: Stack(
                children: [
                  bodyWidget(),
                  if (!kIsWeb && Platform.isIOS && viewModel.lastItems.isNotEmpty)
                    SizedBox(
                      width: UIHelper.highSize * 3,
                      child: GestureDetector(
                        onHorizontalDragStart: (details) {
                          if (Directionality.of(context) == TextDirection.ltr) {
                            return;
                          }
                          if (details.localPosition.dx < 50) {
                            viewModel
                              ..setItems(viewModel.lastItems.last)
                              ..removeLastItem(context);
                          }
                        },
                        onHorizontalDragEnd: (details) {
                          if (Directionality.of(context) == TextDirection.rtl) {
                            return;
                          }
                          if (details.primaryVelocity! > 0) {
                            viewModel
                              ..setItems(viewModel.lastItems.last)
                              ..removeLastItem(context);
                          }
                        },
                      ),
                    ),
                ],
              ),
            ),
            Align(alignment: Alignment.bottomCenter, child: bottomBar(scaffoldKey)),
          ],
        ),
      );

  Column bodyWidget() => Column(
        children: [
          Expanded(
            child: LayoutBuilder(
              builder: (context, constraints) {
                final crossAxisCount = kIsWeb
                    ? constraints.maxWidth ~/ 100 > 7
                        ? 7
                        : constraints.maxWidth ~/ 100
                    : constraints.maxWidth ~/ 90 > 10
                        ? 10
                        : constraints.maxWidth ~/ 90;
                return Observer(
                  builder: (_) => GridView.builder(
                    padding: UIHelper.lowPadding,
                    physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: crossAxisCount > 0 ? crossAxisCount : 1,
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
                  ),
                );
              },
            ),
          ),
        ],
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
                  (CacheManager.getAnaVeri!.userModel!.admin ? const Icon(Icons.local_police_outlined, color: UIHelper.primaryColor, size: 20) : IconHelper.smallIcon("User-Account"))
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

  Future<void> getTeklif() async {
    dialogManager.showAreYouSureDialog(
      () async {
        final result = await networkManager.dioPost(path: ApiUrls.teklifIste, bodyModel: const TeklifIsteModel(), data: AccountModel.instance, showLoading: true);
        if (result.isSuccess) {
          dialogManager.showSuccesDialog(result.dataList.first.mesaj ?? "Teklif isteği başarıyla gönderildi.");
        }
      },
      title: "${CacheManager.getAccounts(AccountModel.instance.uyeEmail ?? "")?.karsilamaMesaji}\n\nTeklif almak ister misiniz?",
      yesButtonText: "Teklif İste",
    );
  }
}
