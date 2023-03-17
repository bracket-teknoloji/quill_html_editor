import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

class DialogManager {
  static Future<void> exitDialog(BuildContext context) {
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
                    Navigator.pushReplacementNamed(context, "/");
                  },
                  child: const Text("Evet")),
            ],
          );
        });
  }

  static void loadingDialog(BuildContext context) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return const AlertDialog(
            title: Text("Loading..."),
            content: SizedBox(
                height: 10,
                width: 50,
                child: LinearProgressIndicator(
                  color: Colors.red,
                )),
          );
        });
  }

  static Future<String> listTileDialog(
      {required BuildContext context, required String title}) async {
    String? data;
    List tileNames = List.generate(4, (index) => "netfect");
    await showDialog<String>(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          var children2 = [
            ...List.generate(
              4,
              (index) => RadioListTile(
                groupValue: 1,
                value: "$index",
                title: Text("netfect $index",
                    style: TextStyle(color: context.colorScheme.error)),
                onChanged: (dynamic value) {
                  data = tileNames[index];
                  Navigator.of(context).pop();
                },
              ),
            ),
          ];
          return AlertDialog(
            title: Text(title),
            content:
                Column(mainAxisSize: MainAxisSize.min, children: children2),
            actions: [
              ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text("İptal")),
            ],
          );
        });
    return data ?? "Veri gelmedi";
  }
}
