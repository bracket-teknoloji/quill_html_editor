import 'package:flutter/material.dart';
import 'package:get/get.dart';

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

  AlertDialog listTileDialog({required String title, required Map data}) {
    return AlertDialog(
      title: Text(title),
      content: Column(mainAxisSize: MainAxisSize.min, children: [
        ...List.generate(
          data.length - 1,
          (index) => RadioListTile(
            groupValue: 1,
            title: Text(data.keys.toList()[index],
                style: const TextStyle(color: Colors.red)),
            value: data,
            onChanged: (dynamic value) {
              Get.back(result: value);
            },
          ),
        ),
      ]),
      actions: [
        Row(
          children: [
            Expanded(
              flex: 1,
              child: ElevatedButton(
                  onPressed: () {
                    Get.toNamed("/addCompany");
                  },
                  child: const Text("Firmaları Düzenle")),
            ),
            const SizedBox(width: 10),
            Expanded(
              flex: 1,
              child: ElevatedButton(
                  onPressed: () {
                    dynamic result = "";
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
