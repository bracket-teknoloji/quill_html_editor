//extension on a list for padding all items
import "package:flutter/material.dart";
import "package:picker/core/constants/enum/edit_tipi_enum.dart";
import "package:picker/core/constants/ui_helper/ui_helper.dart";
import "package:picker/core/init/cache/cache_manager.dart";
import "package:picker/view/add_company/model/account_model.dart";
import "package:picker/view/main_page/model/param_model.dart";
import "package:picker/view/main_page/model/user_model/profil_yetki_model.dart";

extension ListExtension<T> on List<T> {
  List<Padding> get withPadding =>
      map((e) => Padding(padding: const EdgeInsets.all(UIHelper.lowSize), child: e as Widget)).toList();

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
    if (AccountModel.instance.adminMi) return this;
    return switch (editTipiEnum) {
      EditTipiEnum.satisTeklifi =>
        where(
          (element) =>
              profilYetkiModel.yazdirmaDizaynSatisTeklifi?.any((element2) => element.id == element2) ??
              AccountModel.instance.adminMi,
        ).toList(),
      EditTipiEnum.satisIrsaliye =>
        where(
          (element) =>
              profilYetkiModel.yazdirmaDizaynSatisIrs?.any((element2) => element.id == element2) ??
              AccountModel.instance.adminMi,
        ).toList(),
      EditTipiEnum.satisFatura =>
        where(
          (element) =>
              profilYetkiModel.yazdirmaDizaynSatisFat?.any((element2) => element.id == element2) ??
              AccountModel.instance.adminMi,
        ).toList(),
      EditTipiEnum.alisIrsaliye =>
        where(
          (element) =>
              profilYetkiModel.yazdirmaDizaynAlisIrs?.any((element2) => element.id == element2) ??
              AccountModel.instance.adminMi,
        ).toList(),
      EditTipiEnum.alisFatura =>
        where(
          (element) =>
              profilYetkiModel.yazdirmaDizaynAlisFat?.any((element2) => element.id == element2) ??
              AccountModel.instance.adminMi,
        ).toList(),
      EditTipiEnum.satisTalebi =>
        where(
          (element) =>
              profilYetkiModel.yazdirmaDizaynSatisTalebi?.any((element2) => element.id == element2) ??
              AccountModel.instance.adminMi,
        ).toList(),
      EditTipiEnum.musteri =>
        where(
          (element) =>
              profilYetkiModel.yazdirmaDizaynMusSip?.any((element2) => element.id == element2) ??
              AccountModel.instance.adminMi,
        ).toList(),
      EditTipiEnum.satici =>
        where(
          (element) =>
              profilYetkiModel.yazdirmaDizaynSaticiSip?.any((element2) => element.id == element2) ??
              AccountModel.instance.adminMi,
        ).toList(),
      _ => [],
    };
  }
}
