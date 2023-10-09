import "dart:developer";
import "dart:io";

import "package:awesome_dialog/awesome_dialog.dart";
import "package:flutter/foundation.dart";
import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:hive_flutter/hive_flutter.dart";
import "package:kartal/kartal.dart";
import "package:picker/view/main_page/alt_sayfalar/finans/kasa/kasa_islemleri/model/kasa_islemleri_model.dart";
import "package:picker/view/main_page/alt_sayfalar/finans/kasa/kasa_listesi/model/kasa_listesi_model.dart";

import "../../../view/add_company/model/account_model.dart";
import "../../../view/add_company/model/account_response_model.dart";
import "../../../view/main_page/alt_sayfalar/cari/cari_listesi/model/cari_listesi_model.dart";
import "../../../view/main_page/alt_sayfalar/siparis/base_siparis_edit/model/base_siparis_edit_model.dart";
import "../../../view/main_page/alt_sayfalar/stok/stok_liste/model/stok_listesi_model.dart";
import "../../base/model/login_dialog_model.dart";
import "../../constants/enum/islem_tipi_enum.dart";
import "../../constants/enum/siparis_tipi_enum.dart";
import "../../constants/extensions/date_time_extensions.dart";
import "../../constants/ui_helper/icon_helper.dart";
import "../../constants/ui_helper/ui_helper.dart";
import "../../init/app_info/app_info.dart";
import "../../init/cache/cache_manager.dart";
import "../../init/network/login/api_urls.dart";
import "../../init/network/network_manager.dart";
import "../grid_tile/custom_animated_grid/view/custom_animated_grid_view.dart";
import "logout_model.dart";

class DialogManager {
  late final BuildContext context;

  DialogManager() {
    context = Get.context!;
  }

  ///
  /// [Dialog Controllers] dialogların kontrolü için kullanılır.
  ///
  void showErrorSnackBar(String message) {
    hideSnackBar;
    ScaffoldMessenger.of(context).showSnackBar(_snackBarError(message));
  }

  void showInfoSnackBar(String message) {
    hideSnackBar;
    ScaffoldMessenger.of(context).showSnackBar(_snackBarInfo(message));
  }

  void showSuccessSnackBar(String message) {
    hideSnackBar;
    ScaffoldMessenger.of(context).showSnackBar(_snackBarSuccess(message));
  }

  Future<DateTime?> showDateTimePicker() async {
    return await showDatePicker(
      context: context,
      locale: Get.locale,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
  }

  Future<void> showAlertDialog(String message) async {
    return _baseDialog(
      dialogType: DialogType.error,
      btnOkText: "Tamam",
      body: Column(
        children: [
          Container(
            constraints: BoxConstraints(maxHeight: Get.height * 0.5),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(bottom: 10),
                    child: Text("Uyarı", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                  ),
                  Padding(
                    padding: UIHelper.midPaddingHorizontal,
                    child: SelectableText(message, textAlign: TextAlign.center),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: UIHelper.midPaddingHorizontal,
            child: Text(getAppData, style: TextStyle(color: Colors.grey.withOpacity(0.8), fontSize: 12), textAlign: TextAlign.center),
          ).paddingOnly(top: UIHelper.highSize),
        ],
      ),
      // onOk is rootNavigator true without Get
      onOk: () {},
    ).show();
  }

  String get getAppData => "\nVersion: ${AppInfoModel.instance.version}\nTarih: ${DateTime.now().toDateTimeString()}\nE-mail: ${CacheManager.getHesapBilgileri?.uyeEmail ?? ""}";

  Future showEmptyFieldDialog(Iterable values, {void Function()? onOk}) =>
      _baseDialog(dialogType: DialogType.error, title: "Eksik var", btnOkText: "Tamam", desc: "${values.toList().join(", ")}\nLütfen zorunlu alanları doldurunuz. ", onOk: onOk ?? () {}).show();

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
            Padding(
              padding: UIHelper.midPaddingHorizontal,
              child: Text(getAppData, style: TextStyle(color: Colors.grey.withOpacity(0.8)), textAlign: TextAlign.center),
            ).paddingOnly(top: UIHelper.highSize),
          ],
        ),
      ).show();

  void showLoadingDialog(String loadText) => _baseDialog(
        body: Center(
          child: Column(
            children: [const CircularProgressIndicator.adaptive(), context.sized.emptySizedHeightBoxLow, Text(loadText, style: context.theme.textTheme.labelSmall)],
          ),
        ),
      ).show();
  Future showAreYouSureDialog(void Function() onYes, {String? title}) async => await _areYouSureDialog(onYes, title).show();

  void showInfoDialog(String? description) => _baseDialog(
        desc: description,
        dialogType: DialogType.info,
        btnOkText: "Tamam",
        onOk: () {},
      ).show();

  Future showStokKayitliDialog(StokListesiModel model) async {
    bool result = false;
    await _baseDialog(
      desc: "Stok Kodu:${model.stokKodu}\n\nÜrün Listenizde Mevcut\nYine de eklensin mi?",
      dialogType: DialogType.question,
      btnOkText: "Evet",
      onOk: () => result = true,
      btnCancelText: "Hayır",
      onCancel: () {},
    ).show();
    return result;
  }

  Future<void> showDialog({required Widget body, void Function()? onYes}) async =>
      await _baseDialog(body: body, onOk: onYes, onCancel: () {}, btnCancelText: "Hayır", btnOkText: onYes != null ? "Evet" : null, dialogType: DialogType.question).show();

  void showGridViewDialog(Widget body) => _baseDialog(body: body, onOk: () {}, btnOkText: "İptal", dialogType: DialogType.noHeader).show();

  void showCariGridViewDialog(CariListesiModel? model, [IslemTipiEnum? tip]) => _baseDialog(
          body: CustomAnimatedGridView<CariListesiModel>(cariListesiModel: model, model: model, islemTipi: tip ?? IslemTipiEnum.cari), onOk: () {}, btnOkText: "İptal", dialogType: DialogType.noHeader)
      .show();

  void showKasaGridViewDialog(KasaListesiModel? model, [IslemTipiEnum? tip]) =>
      _baseDialog(body: CustomAnimatedGridView<KasaListesiModel>(model:model ,islemTipi: tip ?? IslemTipiEnum.kasa, title: "Kasa İşlemleri"), onOk: () {}, btnOkText: "İptal", dialogType: DialogType.noHeader)
          .show();

  void showCariRaporlarGridViewDialog() =>
      _baseDialog(body: const CustomAnimatedGridView(title: "Raporlar", islemTipi: IslemTipiEnum.cariRapor), onOk: () {}, btnOkText: "İptal", dialogType: DialogType.noHeader).show();

  void showStokGridViewDialog(StokListesiModel? model, [IslemTipiEnum? tip]) =>
      _baseDialog(body: CustomAnimatedGridView<StokListesiModel>(model: model, islemTipi: tip ?? IslemTipiEnum.stok), onOk: () {}, btnOkText: "İptal", dialogType: DialogType.noHeader).show();

  Future<dynamic> showSiparisGridViewDialog(BuildContext context, {BaseSiparisEditModel? model, IslemTipiEnum? tip, SiparisTipiEnum? siparisTipi, Function(bool)? onSelected}) async =>
      await _baseDialog(
              body: CustomAnimatedGridView<BaseSiparisEditModel>(model: model, islemTipi: tip ?? IslemTipiEnum.siparis, siparisTipi: siparisTipi, title: model?.belgeNo, onSelected: onSelected),
              onOk: () {},
              btnOkText: "İptal",
              dialogType: DialogType.noHeader)
          .show();

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
            Get.offAndToNamed("/login");
          }
        },
        btnOkText: "Evet",
        onCancel: () {},
        btnCancelText: "Hayır",
      ).show();

  void get hideSnackBar => ScaffoldMessenger.of(context).clearSnackBars();

  void get hideAlertDialog => Get.back(closeOverlays: true);

  AlertDialog loadingDialog() {
    return AlertDialog(
      title: Text("Lütfen Bekleyiniz...", style: context.theme.textTheme.titleMedium),
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
            subtitle: const Text("demo"),
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
                subtitle: Text(box.getAt(index).kullanici.toString()),
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

  SnackBar _snackBarError(String message) => SnackBar(content: Text(message), behavior: SnackBarBehavior.floating, backgroundColor: Colors.red);

  SnackBar _snackBarSuccess(String message) => SnackBar(content: Text(message), behavior: SnackBarBehavior.floating, backgroundColor: Colors.green);

  SnackBar _snackBarInfo(String message) => SnackBar(content: Text(message), behavior: SnackBarBehavior.floating, backgroundColor: Colors.blueAccent);

  AwesomeDialog _areYouSureDialog(void Function() onYes, String? desc) {
    return _baseDialog(
      title: "Uyarı",
      desc: desc ?? "Bu işlemi yapmak istediğinizden emin misiniz?",
      dialogType: DialogType.question,
      onOk: onYes,
      btnOkText: "Evet",
      onCancel: () {},
      btnCancelText: "Hayır",
    );
  }

  Future selectCompanyDialog() {
    Box preferences = CacheManager.preferencesBox;
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
              title: const Text("demo"),
              leading: IconHelper.smallIcon("User-Account"),
              onTap: () {
                Get.back(
                    result: LoginDialogModel(
                        account: AccountResponseModel()
                          ..firma = "demo"
                          ..email = "demo@netfect.com",
                        username: "demo",
                        password: "demo"));
              }),
          ...List.generate(
            CacheManager.accountsBox.length,
            (index) {
              var title = (CacheManager.accountsBox.getAt(index)?.firma ?? "").toString();
              log(CacheManager.accountsBox.getAt(index).toString());
              return ListTile(
                  title: Text(title),
                  leading: IconHelper.smallIcon("User-Account"),
                  onTap: () {
                    Get.back(
                        result: LoginDialogModel(account: CacheManager.accountsBox.getAt(index), username: preferences.get(title)?[1] ?? "", password: preferences.get(title)?[2] ?? ""),
                        closeOverlays: true);
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
        keyboardAware: true,
        //* Standardı 15 olduğu için ve null kabul etmediği için 15 verdim.
        bodyHeaderDistance: dialogType != DialogType.noHeader ? 15 : UIHelper.lowSize,
        enableEnterKey: true,
        context: context,
        isDense: true,
        width: kIsWeb
            ? 400
            : Platform.isLinux || Platform.isWindows || Platform.isMacOS
                ? context.isLandscape
                    ? MediaQuery.of(context).size.width * 0.5
                    : MediaQuery.of(context).size.width * 0.8
                : null,
        customHeader: customHeader,
        alignment: Alignment.center,
        onDismissCallback: (type) {},
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
