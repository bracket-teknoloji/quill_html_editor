import 'dart:developer';

import 'package:flutter/cupertino.dart';
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
  void showAreYouSureDialog(void Function() onYes) => showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) => areYouSureDialog(onYes),
      );
  void showCupertinoDialog(String message) => showDialog(
      context: context,
      builder: (context) {
        return CupertinoAlertDialog(
          title: const Text("Uyarı"),
          content: SelectableText(message),
          actions: [
            CupertinoDialogAction(
                isDestructiveAction: true,
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text("Hayır")),
            CupertinoDialogAction(isDefaultAction: true, onPressed: () {}, child: const Text("Evet")),
          ],
        );
      });

  void showListDialog({required List list}) => showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Şirket Seçiniz"),
          content: SizedBox(
            height: 200,
            child: ListView.builder(
              itemCount: list.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(list[index].toString()),
                  onTap: () {
                    Get.back(result: list[index]);
                  },
                );
              },
            ),
          ),
        );
      });

  void showExitDialog() => showDialog(
        context: context,
        useRootNavigator: false,
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
    return AlertDialog(
      title: Text("Yükleniyor...", style: context.theme.textTheme.titleMedium?.copyWith(color: Colors.black)),
      content: const SizedBox(
          height: 5,
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
              Get.back(result: {"company": "DEMO", "user": "demo", "password": "demo"});
            }),
        ...List.generate(
          box.length,
          (index) {
            var title = box.getAt(index).firma.toString();
            log(box.getAt(index).toString());
            return ListTile(
                title: Text(title),
                onTap: () {
                  Get.back(result: {
                    "company": title,
                    "user": preferences.get(title)?[1] ?? "",
                    "password": preferences.get(title)?[2] ?? "",
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

  AlertDialog areYouSureDialog(void Function() onYes) {
    return AlertDialog(
        title: const Text("Uyarı"),
        content: const Text("Bu işlemi gerçekleştirmek istediğinize emin misiniz?"),
        actions: [
          ElevatedButton(
              onPressed: () {
                Get.back();
              },
              child: const Text("Hayır")),
          ElevatedButton(
              onPressed: () {
                onYes();
                Get.back();
              },
              child: const Text("Evet")),
        ]);
  }
}
