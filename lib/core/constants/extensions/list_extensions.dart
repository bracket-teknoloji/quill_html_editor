//extension on a list for padding all items
import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:picker/core/constants/enum/edit_tipi_enum.dart";
import "package:picker/core/constants/ui_helper/ui_helper.dart";
import "package:picker/core/init/cache/cache_manager.dart";
import "package:picker/view/add_company/model/account_model.dart";
import "package:picker/view/main_page/model/param_model.dart";
import "package:picker/view/main_page/model/user_model/profil_yetki_model.dart";

extension ListExtension<T> on List<T> {
  List<Padding> get withPadding => map(
        (e) => Padding(
          padding: EdgeInsets.all(UIHelper.lowSize),
          child: e as Widget,
        ),
      ).toList();

  List<Widget> get withSizedBox => map(
        (e) => SizedBox(
          width: (Get.width - UIHelper.midSize) * 0.45,
          child: e as Widget,
        ),
      ).toList();

  List<T> get nullCheck => where((element) => element != null).toList().cast<T>();
}

// an extension on a list or ObservableList to check is empty or null
extension ListExtension3<T> on List<T>? {
  bool get isEmptyOrNull => this == null || this!.isEmpty;

  void addIfConditionTrue(bool condition, T item) {
    if (condition) {
      this!.add(item);
    }
  }
}

extension ListExtension4<T> on List? {
  List<T> cast(T model) => this!.map((e) => e as T).toList().cast<T>();
}

extension ListGenericNullCheck<T> on List<T?> {
  List<T> get nullCheckWithGeneric => whereType<T>().toList();

  
}

extension DizaynListExtensions on List<NetFectDizaynList> {
  List<NetFectDizaynList> filteredDizaynList(EditTipiEnum? editTipiEnum) {
    final ProfilYetkiModel profilYetkiModel = CacheManager.getAnaVeri?.userModel?.profilYetki ?? ProfilYetkiModel();
    if (AccountModel.instance.admin == "E") {
      return this;
    }
    switch (editTipiEnum) {
      case EditTipiEnum.satisTeklifi:
        return where((element) => profilYetkiModel.yazdirmaDizaynSatisIrs?.any((element2) => element.aktifMi) ?? true).toList();
      case EditTipiEnum.satisIrsaliye:
        return where((element) => profilYetkiModel.yazdirmaDizaynSatisIrs?.any((element2) => element.aktifMi) ?? true).toList();
      case EditTipiEnum.satisFatura:
        return where((element) => profilYetkiModel.yazdirmaDizaynSatisFat?.any((element2) => element.aktifMi) ?? true).toList();
      case EditTipiEnum.alisIrsaliye:
        return where((element) => profilYetkiModel.yazdirmaDizaynAlisIrs?.any((element2) => element.aktifMi) ?? true).toList();
      case EditTipiEnum.alisFatura:
        return where((element) => profilYetkiModel.yazdirmaDizaynAlisFat?.any((element2) => element.aktifMi) ?? true).toList();
      case EditTipiEnum.satisTalebi:
        return where((element) => profilYetkiModel.yazdirmaDizaynSatisTalebi?.any((element2) => element.aktifMi) ?? true).toList();
      // case EditTipiEnum.alis:
      //   return where((element) => profilYetkiModel.yazdirmaDizaynAli?.any((element2) => element.aktifMi) ??true ).toList();
      default:
        return this;
    }
  }
}
