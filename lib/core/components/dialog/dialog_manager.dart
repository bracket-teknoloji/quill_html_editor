import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';

class DialogManager {
  late final BuildContext context;

  DialogManager() {
    context = Get.context!;
  }

  ///
  /// [Dialog Controllers] dialogların kontrolü için kullanılır.
  ///
  void showSnackBar(String message) => ScaffoldMessenger.of(context)
      .showSnackBar(snackBarError(message))
      .closed
      .then((value) => ScaffoldMessenger.of(context).clearSnackBars());

  void showAlertDialog(String message) => showDialog(
        barrierDismissible: false,
        useRootNavigator: false,
        context: context,
        builder: (context) => warningAlertDialog(message),
      );

  void showLoadingDialog() => showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) => loadingDialog(),
      );

  void showExitDialog({String? action}) => showDialog(
        context: context,
        useRootNavigator: false,
        builder: (context) {
          return AlertDialog(
            title: Text(action ?? "Çıkış"),
            content: Text("${action ?? "çıkmak"} istediğinize emin misiniz?"),
            actions: [
              ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text("Hayır")),
              ElevatedButton(
                  onPressed: () {
                    Get.offAllNamed("/");
                  },
                  child: const Text("Evet")),
            ],
          );
        },
      );

  void get hideSnackBar => ScaffoldMessenger.of(context).clearSnackBars();

  void get hideAlertDialog => Get.back();

  AlertDialog warningAlertDialog(String message) {
    return AlertDialog(
      title: const Text("Uyarı"),
      content: Text(message),
      actions: [
        ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text("Tamam")),
      ],
    );
  }

  AlertDialog loadingDialog() {
    return const AlertDialog(
      title: Text("Yükleniyor..."),
      content: SizedBox(
          height: 10,
          width: 50,
          child: LinearProgressIndicator(
            color: Colors.red,
          )),
    );
  }

  AlertDialog listTileDialog({required String title}) {
    Box box = Hive.box("accounts");
    Box preferences = Hive.box("preferences");
    return AlertDialog(
      contentPadding: const EdgeInsets.all(0),
      actionsOverflowButtonSpacing: 0,
      title: Text(title),
      content: Column(mainAxisSize: MainAxisSize.min, children: [
        ListTile(
            title: const Text("DEMO"),
            onTap: () {
              Get.back(result: {"user": "demo", "password": "demo"});
            }),
        ...List.generate(
          box.length,
          (index) {
            log(box.getAt(index).toString());
            return ListTile(
                title: Text(box.getAt(index).firma.toString()),
                onTap: () {
                  Get.back(result: {
                    "company": box.getAt(index).firma.toString(),
                    "user": box.getAt(index).firma.toString(),
                    "password": box.getAt(index).firmaKisaAdi.toString()
                  }, closeOverlays: true);
                });
          },
        ),
      ]),
      actions: [
        Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              flex: 1,
              child: ElevatedButton(
                  onPressed: () {
                    Get.offNamed(
                      "/addCompany",
                    );
                  },
                  child: const Text("Firmaları Düzenle")),
            ),
            const SizedBox(width: 10),
            Expanded(
              flex: 1,
              child: ElevatedButton(
                  onPressed: () {
                    dynamic result = {};
                    Get.back(result: result);
                  },
                  child: const Text(
                    "İptal",
                    textAlign: TextAlign.justify,
                  )),
            ),
          ],
        ),
      ],
    );
  }

  SnackBar snackBarError(String message) => SnackBar(
        content: Text(message),
      );
}
