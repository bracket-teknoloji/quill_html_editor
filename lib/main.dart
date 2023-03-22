import "package:flutter/material.dart";
import "package:get/get_navigation/src/root/get_material_app.dart";
import "package:get/get_navigation/src/routes/get_route.dart";
import "package:get/get_navigation/src/routes/transitions_type.dart";
import "package:hive_flutter/hive_flutter.dart";
import "package:picker/core/init/device_info/device_info.dart";
import "core/init/theme/app_theme_dark.dart";
import "view/auth/view/login_view.dart";
import "view/main_page/view/main_page_view.dart";

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox("login");
  await Hive.openBox("DeviceInfo");
  await Hive.openBox("preferences");
  await Hive.openBox("companies");
  WidgetsFlutterBinding.ensureInitialized();
  await DeviceInfoModel().deviceData.then((value) {
    value.forEach((key, value) {
      debugPrint("{key: $key,value: $value}");
      Hive.box("DeviceInfo").put(key, value);
    });
  });
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Picker",
      getPages: [
        GetPage(
            name: "/",
            page: () => const LoginView(),
            transition: Transition.native,
            transitionDuration: const Duration(milliseconds: 500)),
        GetPage(
            name: "/mainPage",
            page: () => const MainPageView(),
            transition: Transition.native,
            transitionDuration: const Duration(milliseconds: 500)),
      ],
      debugShowCheckedModeBanner: false,
      theme: AppThemeDark.instance!.theme,
    );
  }
}
