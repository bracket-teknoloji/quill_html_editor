import "dart:developer";

import "package:flutter/material.dart";
import "package:get/get_navigation/src/root/get_material_app.dart";
import "package:get/get_navigation/src/routes/get_route.dart";
import "package:get/get_navigation/src/routes/transitions_type.dart";
import "package:hive_flutter/hive_flutter.dart";
import "package:picker/core/init/app_info/app_info.dart";
import "package:picker/core/init/theme/app_theme_dark.dart";
import "package:picker/view/add_company/view/add_company_view.dart";
import "package:picker/view/auth/view/login_view.dart";
import "package:picker/view/main_page/view/main_page_view.dart";

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox("login");
  await Hive.openBox("DeviceInfo");
  await Hive.openBox("preferences");
  await Hive.openBox("companies");
  await Hive.openBox("token");
  WidgetsFlutterBinding.ensureInitialized();
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
      ],
      debugShowCheckedModeBanner: false,
      theme: AppThemeDark.instance!.theme,
    );
  }
}
