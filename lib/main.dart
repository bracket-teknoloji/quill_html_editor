import "package:flutter/material.dart";
import "package:hive_flutter/hive_flutter.dart";

import "core/init/theme/app_theme_dark.dart";
import "view/auth/model/login_model.dart";
import "view/auth/view/login_view.dart";
import "view/main_page/view/main_page_view.dart";

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox("login");
  Hive.registerAdapter(LoginAuthAdapter());
  await Hive.openBox<LoginAuth>("burak");

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Picker",
      initialRoute: "/",
      routes: {
        "/": (context) => const LoginView(),
        "/mainPage": (context) => const MainPageView(),
      },
      debugShowCheckedModeBanner: false,
      theme: AppThemeDark.instance!.theme,
    );
  }
}
