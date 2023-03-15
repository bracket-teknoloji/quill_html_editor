import 'package:flutter/material.dart';

class SnackBarManager {
  static const snackBarError =
      SnackBar(content: Text("Kullanıcı adı veya şifre hatalı"));
  static const snackBarErrorMissingValue = SnackBar(
    content: Text("Lütfen tüm alanları doldurunuz"),
  );
  static SnackBar snackBarOnClick(String name) => SnackBar(
    content: Text("$name Tıklandı"),
  );
}
