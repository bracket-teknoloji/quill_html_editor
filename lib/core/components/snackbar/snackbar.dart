
import 'package:flutter/material.dart';

class SnackBarManager {
  static SnackBar snackBarError = const SnackBar(
    content: Text("Kullanıcı adı veya şifre hatalı"),
    backgroundColor: Colors.red,
  );

  static SnackBar snackBarErrorMissingValue = const SnackBar(
    content: Text("Lütfen boş alan bırakmayınız"),
    backgroundColor: Colors.red,
  );

  static SnackBar snackBarOnClick(String name) {
    return SnackBar(
      content: Text("$name tıklandı"),
      backgroundColor: Colors.green,
    );
  }
}