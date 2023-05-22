import 'dart:developer';
import 'dart:io';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:kartal/kartal.dart';
import 'package:picker/core/init/cache/cache_manager.dart';

import '../../../view/add_company/model/account_model.dart';
import '../../constants/ui_helper/icon_helper.dart';
import '../../constants/ui_helper/ui_helper.dart';
import '../../init/network/login/api_urls.dart';
import '../../init/network/network_manager.dart';
import 'logout_model.dart';

class DialogManager {
  late final BuildContext context;

  DialogManager() {
    context = Get.context!;
  }

  ///
  /// [Dialog Controllers] dialogların kontrolü için kullanılır.
  ///
  void showSnackBar(String message) {
    hideSnackBar;
    ScaffoldMessenger.of(context).showSnackBar(snackBarError(message));
  }

  void showAlertDialog(String message) => _baseDialog(
        title: "Uyarı",
        desc: message,
        dialogType: DialogType.error,
        btnOkText: "Tamam",
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.only(bottom: 10),
              child: Text("Uyarı"),
            ),
            Padding(
              padding: UIHelper.midPaddingHorizontal,
              child: Text(message, textAlign: TextAlign.center),
            ),
          ],
        ),
        // onOk is rootNavigator true without Get
        onOk: () {},
      ).show();

  void internetConnectionDialog() => _baseDialog(
        customHeader: const CircularProgressIndicator.adaptive(),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.only(bottom: 10),
              child: Text("Uyarı"),
            ),
            Padding(
              padding: UIHelper.midPaddingHorizontal,
              child: const Text("İnternet bağlantınızı kontrol edin.", textAlign: TextAlign.center),
            ),
          ],
        ),
      ).show();

  void showLoadingDialog(String loadText) => _baseDialog(
        body: Center(
          child: Column(
            children: [const CircularProgressIndicator(), context.emptySizedHeightBoxLow, Text(loadText, style: context.theme.textTheme.labelSmall)],
          ),
        ),
      ).show();
  void showAreYouSureDialog(void Function() onYes) => _areYouSureDialog(onYes).show();

  void showExitDialog() => _baseDialog(
        title: "Uyarı",
        desc: "Çıkmak istediğinize emin misiniz?",
        dialogType: DialogType.question,
        onOk: () async {
          final response = await NetworkManager().dioPost<LogoutModel>(path: ApiUrls.logoutUser, bodyModel: LogoutModel(), data: AccountModel.instance.toJson());
          if (response.success ?? false) {
            showLoadingDialog("Çıkış yapılıyor...");
            log("Çıkış yapılıyor...");
            CacheManager.setLogout(false);
            Get.offAndToNamed("/");
          }
        },
        btnOkText: "Evet",
        onCancel: () {},
        btnCancelText: "Hayır",
      ).show();

  void get hideSnackBar => ScaffoldMessenger.of(context).clearSnackBars();

  void get hideAlertDialog => Get.back(canPop: true, closeOverlays: true);

  AlertDialog loadingDialog() {
    return AlertDialog(
      title: Text("Yükleniyor...", style: context.theme.textTheme.titleMedium),
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
      elevation: 0,
      icon: const Icon(
        Icons.account_circle_outlined,
      ),
      iconColor: Colors.black,
      title: Text(title),
      content: Column(mainAxisSize: MainAxisSize.min, children: [
        ListTile(
            title: const Text("DEMO"),
            leading: IconHelper.smallIcon("User-Account"),
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
                leading: IconHelper.smallIcon("User-Account"),
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
        Divider(
          color: UIHelper.primaryColor.withOpacity(0.3),
          thickness: 1,
        ),
        Padding(
          padding: UIHelper.lowPaddingVertical,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: TextButton(
                    onPressed: () {
                      Get.toNamed(
                        "/addCompany",
                      );
                    },
                    child: const Text("Firmaları Düzenle")),
              ),
              Expanded(
                child: TextButton(
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
        )
      ],
    );
  }

  SnackBar snackBarError(String message) => SnackBar(
        content: Text(message),
      );

  AwesomeDialog _areYouSureDialog(void Function() onYes) {
    return _baseDialog(
      title: "Uyarı",
      desc: "Bu işlemi yapmak istediğinizden emin misiniz?",
      dialogType: DialogType.question,
      onOk: onYes,
      btnOkText: "Evet",
      onCancel: () {},
      btnCancelText: "Hayır",
    );
  }

  Future selectCompanyDialog() {
    Box box = Hive.box("accounts");
    Box preferences = Hive.box("preferences");
    return _baseDialog(
        btnOkText: "Firmaları Düzenle",
        btnCancelText: "Vazgeç",
        onOk: () {
          Get.toNamed(
            "/addCompany",
          );
        },
        onCancel: () {},
        body: Column(mainAxisSize: MainAxisSize.min, children: [
          Text("Şirket Seçiniz", style: Theme.of(context).textTheme.titleLarge),
          ListTile(
              title: const Text("DEMO"),
              leading: IconHelper.smallIcon("User-Account"),
              onTap: () {
                Get.back(result: {"company": "demo", "user": "demo", "password": "demo"});
              }),
          ...List.generate(
            box.length,
            (index) {
              var title = box.getAt(index).firma.toString();
              log(box.getAt(index).toString());
              return ListTile(
                  title: Text(title),
                  leading: IconHelper.smallIcon("User-Account"),
                  onTap: () {
                    Get.back(result: {
                      "company": title,
                      "user": preferences.get(title)?[1] ?? "",
                      "password": preferences.get(title)?[2] ?? "",
                    }, closeOverlays: true);
                  });
            },
          ),
        ])).show();
  }

  ///* Eğer Body eklersen Title ve Desc Kullanılmaz
  AwesomeDialog _baseDialog(
      {String? title,
      String? desc,
      DialogType? dialogType,
      IconData? btnOkIcon,
      IconData? btnCancelIcon,
      String? btnOkText,
      String? btnCancelText,
      void Function()? onOk,
      void Function()? onCancel,
      Color? btnOkColor,
      Color? btnCancelColor,
      Widget? customHeader,
      Widget? body}) {
    return AwesomeDialog(
        context: context,
        width: Platform.isLinux || Platform.isWindows || Platform.isMacOS ? MediaQuery.of(context).size.width * 0.4 : null,
        customHeader: customHeader,
        alignment: Alignment.center,
        reverseBtnOrder: false,
        barrierColor: Colors.black.withOpacity(0.9),
        dialogBorderRadius: UIHelper.lowBorderRadius,
        useRootNavigator: false,
        headerAnimationLoop: false,
        padding: UIHelper.midPaddingVertical,
        buttonsBorderRadius: UIHelper.lowBorderRadius,
        animType: AnimType.bottomSlide,
        btnOkIcon: btnOkIcon,
        btnCancelIcon: btnCancelIcon,
        dialogBackgroundColor: Theme.of(context).colorScheme.onInverseSurface,
        descTextStyle: Theme.of(context).textTheme.bodySmall,
        titleTextStyle: Theme.of(context).textTheme.bodyLarge,
        buttonsTextStyle: Theme.of(context).textTheme.bodySmall,
        title: title,
        desc: desc,
        btnOkOnPress: onOk,
        btnCancelOnPress: onCancel,
        btnOkText: btnOkText,
        dialogType: dialogType ?? DialogType.noHeader,
        btnCancelText: btnCancelText,
        btnOkColor: btnOkColor ?? UIHelper.primaryColor,
        btnCancelColor: btnCancelColor ?? Colors.grey,
        dismissOnBackKeyPress: false,
        dismissOnTouchOutside: false,
        body: body);
  }
}
