import "package:flutter/material.dart";
import "package:get/get_navigation/src/root/get_material_app.dart";
import "package:get/get_navigation/src/routes/get_route.dart";
import "package:hive_flutter/hive_flutter.dart";
import "core/init/theme/app_theme_dark.dart";
import "view/add_company/view/add_company_view.dart";
import "view/add_company/view/qr_view.dart";
import "view/auth/model/login_model.dart";
import "view/auth/view/login_view.dart";
import "view/main_page/view/main_page_view.dart";


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox<TokenModel>("login");
  await Hive.openBox("DeviceInfo");
  await Hive.openBox("preferences");
  await Hive.openBox("companies");
  await Hive.openBox("token");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      checkerboardOffscreenLayers: false,
      title: "Picker",
      home: const LoginView(),
      getPages: [
        GetPage(
          name: "/mainPage",
          page: () => const MainPageView(),
        ),
        GetPage(
          name: "/addCompany",
          page: () => const AddCompanyView(),
        ),
        GetPage(name: "/qr", page: () => const QRScannerView()),
      ],
      debugShowCheckedModeBanner: false,
      theme: AppThemeDark.instance!.theme,
    );
  }
}
