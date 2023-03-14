
import 'package:flutter/material.dart';

class SnackBarManager {
  static void errorSnackBar(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("Hata Oluştu"),
      ),
    );
  }
}