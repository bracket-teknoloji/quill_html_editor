import 'package:flutter/material.dart';
import 'package:picker/core/init/theme/app_theme_dark.dart';
import 'package:picker/view/auth/login/login_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: AppThemeDark.instance!.theme,
      home: LoginView(),
    );
  }
}
