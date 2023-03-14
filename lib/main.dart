import 'package:flutter/material.dart';
import 'package:picker/core/init/theme/app_theme_dark.dart';
import 'package:picker/view/auth/view/login_view.dart';
import 'package:picker/view/main_page/view/main_page_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Picker',
      initialRoute: "/",
      routes: {
        '/': (context) => const LoginView(),
        '/mainPage': (context) => const MainPageView(),
      },
      debugShowCheckedModeBanner: false,
      theme: AppThemeDark.instance!.theme,
    );
  }
}
