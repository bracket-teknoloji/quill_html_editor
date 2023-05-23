import "package:flutter/material.dart";
import "package:flutter/services.dart";
import "package:get/get.dart";
import "package:picker/view/main_page/alt_sayfalar/cari/cari_hareketleri/view/cari_hareketleri_view.dart";
import "package:picker/view/main_page/alt_sayfalar/stok/stok_liste/view/stok_listesi_view.dart";

import "core/base/view/base_cari_edit/view/base_cari_edit_view.dart";
import "core/base/view/base_stok_edit/view/base_stok_edit_view.dart";
import "core/init/cache/cache_manager.dart";
import "core/init/theme/app_theme_dark.dart";
import "view/add_company/model/account_model.dart";
import "view/add_company/view/add_account_view.dart";
import "view/add_company/view/company_page.dart";
// import 'view/add_company/view/edit_company_view.dart.dart';
import "view/add_company/view/qr_view.dart";
import "view/auth/view/login_view.dart";
import "view/entry_company_view.dart";
import "view/main_page/alt_sayfalar/cari/cari_listesi/view/cari_listesi_view.dart";
import "view/main_page/view/main_page_view.dart";

void main() async {
  await CacheManager.instance.initHiveBoxes();
  await AccountModel.instance.init();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.landscapeRight, DeviceOrientation.landscapeLeft]).then((_) {
    runApp(const MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      defaultTransition: Transition.rightToLeft,
      popGesture: true,
      debugShowCheckedModeBanner: false,
      opaqueRoute: false,
      darkTheme: AppThemeDark.instance!.theme,
      themeMode: ThemeMode.dark,
      title: "Picker",
      home: const LoginView(),
      getPages: [
        GetPage(
          name: "/entryCompany",
          page: () => const EntryCompanyView(),
        ),
        GetPage(
          name: "/mainPage",
          page: () => const MainPageView(),
          children: [
            GetPage(
              name: "/cariEdit",
              page: () => BaseCariEditingView(model: Get.arguments),
            ),
            GetPage(
              name: "/cariListesi",
              page: () => CariListesiView(isGetData: Get.arguments),
            ),
            GetPage(
              name: "/cariHareketleri",
              page: () => CariHareketleriView(cari: Get.arguments),
            ),
            GetPage(
              name: "/stokListesi",
              page: () => const StokListesiView(),
            ),
            GetPage(
              name: "/stokEdit",
              page: () => BaseStokEditingView(model: Get.arguments),
            ),
          ],
        ),
        GetPage(
          name: "/addCompany",
          page: () => const AccountsView(),
        ),
        GetPage(
          name: "/addAccount",
          page: () => const AddAccountView(),
        ),
        GetPage(
          name: "/qr",
          page: () => const QRScannerView(),
        ),
      ],
    );
  }
}
