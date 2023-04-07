import "package:flutter/material.dart";
import "package:flutter/services.dart";
import "package:get/get_navigation/src/root/get_material_app.dart";
import "package:get/get_navigation/src/routes/get_route.dart";

import "core/init/cache/cache_manager.dart";
import "core/init/theme/app_theme_dark.dart";
import "view/add_company/model/account_model.dart";
import 'view/add_company/view/edit_company_view.dart.dart';
import "view/add_company/view/qr_view.dart";
import "view/auth/view/login_view.dart";
import "view/entry_company_view.dart";
import "view/main_page/view/main_page_view.dart";

Future<void> main() async {
  await CacheManager.instance.initHiveBoxes();
  AccountModel.instance.init();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.landscapeRight,
    DeviceOrientation.landscapeLeft,
  ]).then((_) {
    runApp(const MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
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
        ),
        GetPage(
          name: "/addCompany",
          page: () => const AddCompanyView(),
        ),
        GetPage(
          name: "/qr",
          page: () => const QRScannerView(),
        ),
      ],
      debugShowCheckedModeBanner: false,
      theme: AppThemeDark.instance!.theme,
    );
  }
}
