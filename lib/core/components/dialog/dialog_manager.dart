import 'package:flutter/material.dart';

class DialogManager {
  static Future<dynamic> exitDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text("Çıkış"),
            content: const Text("Çıkmak istediğinize emin misiniz?"),
            actions: [
              ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text("Hayır")),
              ElevatedButton(
                  onPressed: () {
                    Navigator.popAndPushNamed(context, "/");
                  },
                  child: const Text("Evet")),
            ],
          );
        });
  }
}
