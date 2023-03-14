import 'package:flutter/material.dart';

class SnackBarManager {
  static const errorSnackBar =
      SnackBar(content: Text("Kullanıcı adı veya şifre hatalı"));
  static const errorSnackBarMissingvalue = SnackBar(
    content: Text("Lütfen tüm alanları doldurunuz"),
  );
}
