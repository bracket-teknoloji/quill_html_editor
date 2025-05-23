import "dart:developer";

import "package:kartal/kartal.dart";
import "package:mobx/mobx.dart";
import "package:picker/core/constants/extensions/iterable_extensions.dart";

import "../model/temsilci_profil_model.dart";
import "../model/temsilci_profil_request_model.dart";

part "temsilci_profil_view_model.g.dart";

typedef Donem = ({String name, int value});

final class TemsilciProfilViewModel = _TemsilciProfilViewModelBase with _$TemsilciProfilViewModel;

abstract class _TemsilciProfilViewModelBase with Store {
  @observable
  List<bool> iadeDurumuValueList = [true, false, false];

  @action
  void setIadeDurumuValueList(int index) {
    iadeDurumuValueList = iadeDurumuValueList.map((e) => false).toList();
    iadeDurumuValueList[index] = true;
    temsilciProfilRequestModel.iadeDurumu = index == 0
        ? "H"
        : index == 1
        ? "D"
        : "S";
  }

  @observable
  bool kdvDahil = false;

  @observable
  bool irsaliyelerDahil = false;
  @action
  void setKDVDahil(bool value) {
    kdvDahil = value;
    temsilciProfilRequestModel.kdvDahil = value ? "E" : "H";
  }

  @action
  void setIrsaliyelerDahil(bool value) {
    irsaliyelerDahil = value;
    temsilciProfilRequestModel.satisIrsDahil = value ? "E" : "H";
  }

  @observable
  List<bool> donemValueList = [true, false, false];

  @action
  void setDonemValueList(int index) {
    donemValueList = donemValueList.map((e) => false).toList();
    donemValueList[index] = true;
    temsilciProfilRequestModel.donemTipi = index == 0
        ? "SY"
        : index == 1
        ? "BY"
        : "GY";
  }

  @observable
  TemsilciProfilRequestModel temsilciProfilRequestModel = TemsilciProfilRequestModel()
    ..donemTipi = "SY"
    ..satisIrsDahil = "H"
    ..iadeDurumu = "H"
    ..kdvDahil = "H";
  @observable
  String? aciklama;

  @computed
  String get donem => aylar.firstWhere((element) => element.value == donemKodu).name;

  int? selectedDonem(int value) {
    if (value == 14) return DateTime.now().month;
    if (value == 15) return DateTime.now().month - 1;
    if (value == 0) return null;
    return value;
  }

  @computed
  String get tahsilatDonem => aylar.firstWhere((element) => element.value == tahsilatDonemKodu).name;

  @observable
  int donemKodu = DateTime.now().month;

  @observable
  int tahsilatDonemKodu = DateTime.now().month;

  @action
  void setDonemKodu(int value) => donemKodu = value;

  @action
  void setTahsilatDonemKodu(int value) => tahsilatDonemKodu = value;

  @action
  void setAciklama(String? value) => aciklama = value;

  @observable
  String? plasiyer;

  @action
  void setPlasiyer(String? value) => plasiyer = value;

  @observable
  ObservableList<TemsilciProfilModel>? temsilciProfilList;

  @action
  void setTemsilciProfilList(List<TemsilciProfilModel>? value) => temsilciProfilList = value
      ?.where((element) => plasiyer == null ? true : element.plasiyerKodu == plasiyer)
      .toList()
      .asObservable();

  @computed
  double get getBugunSatis =>
      temsilciProfilList
          ?.where((element) => element.tabloTipi == "SATIS" && element.ayKodu == 13)
          .map((e) => e.tutar)
          .sum ??
      0;

  @computed
  double get getBugunAlis =>
      temsilciProfilList
          ?.where((element) => element.tabloTipi == "ALIS" && element.ayKodu == 13)
          .map((e) => e.tutar)
          .sum ??
      0;

  @computed
  double get getBugunSiparis =>
      temsilciProfilList
          ?.where((element) => element.tabloTipi == "SIPARIS" && element.ayKodu == 13)
          .map((e) => e.tutar)
          .sum ??
      0;

  @computed
  double get getBugunTahsilatlar =>
      temsilciProfilList
          ?.where((element) => element.tabloTipi == "TAHSILAT" && element.ayKodu == 13)
          .map((e) => e.tutar)
          .sum ??
      0;

  @computed
  double get getBuAySatis =>
      temsilciProfilList
          ?.where((element) => element.tabloTipi == "SATIS" && element.ayKodu == DateTime.now().month)
          .map((e) => e.tutar)
          .sum ??
      0;

  @computed
  double get getBuAyAlis =>
      temsilciProfilList
          ?.where((element) => element.tabloTipi == "ALIS" && element.ayKodu == DateTime.now().month)
          .map((e) => e.tutar)
          .sum ??
      0;

  @computed
  double get getBuAySiparis =>
      temsilciProfilList
          ?.where((element) => element.tabloTipi == "SIPARIS" && element.ayKodu == DateTime.now().month)
          .map((e) => e.tutar)
          .sum ??
      0;

  @computed
  double get getBuAyTahsilatlar =>
      temsilciProfilList
          ?.where((element) => element.tabloTipi == "TAHSILAT" && element.ayKodu == DateTime.now().month)
          .map((e) => e.tutar)
          .sum ??
      0;

  @computed
  double get getGecenAySatis {
    log(
      DateTime.now().copyWith(month: DateTime.now().copyWith(month: DateTime.now().month - 1).month).month.toString(),
    );
    return temsilciProfilList
            ?.where(
              (element) =>
                  element.tabloTipi == "SATIS" &&
                  element.ayKodu == DateTime.now().copyWith(month: DateTime.now().month - 1).month,
            )
            .map((e) => e.tutar)
            .sum ??
        0;
  }

  @computed
  double get getGecenAyAlis =>
      temsilciProfilList
          ?.where(
            (element) =>
                element.tabloTipi == "ALIS" &&
                element.ayKodu == DateTime.now().copyWith(month: DateTime.now().month - 1).month,
          )
          .map((e) => e.tutar)
          .sum ??
      0;

  @computed
  double get getGecenAySiparis =>
      temsilciProfilList
          ?.where(
            (element) =>
                element.tabloTipi == "SIPARIS" &&
                element.ayKodu == DateTime.now().copyWith(month: DateTime.now().month - 1).month,
          )
          .map((e) => e.tutar)
          .sum ??
      0;

  @computed
  double get getGecenAyTahsilatlar =>
      temsilciProfilList
          ?.where(
            (element) =>
                element.tabloTipi == "TAHSILAT" &&
                element.ayKodu == DateTime.now().copyWith(month: DateTime.now().month - 1).month,
          )
          .map((e) => e.tutar)
          .sum ??
      0;

  @computed
  double get getNakitTahsilat =>
      temsilciProfilList
          ?.where(
            (element) => selectedDonem(tahsilatDonemKodu) == null
                ? tahsilatDonemKodu != 13
                : element.tabloTipi == "TAHSILAT" &&
                      element.ayKodu == selectedDonem(tahsilatDonemKodu) &&
                      element.kayitTipi == "D",
          )
          .map((e) => e.tutar)
          .sum ??
      0;
  @computed
  double get getKrediKartiTahsilat =>
      temsilciProfilList
          ?.where(
            (element) => selectedDonem(tahsilatDonemKodu) == null
                ? tahsilatDonemKodu != 13
                : element.tabloTipi == "TAHSILAT" &&
                      element.ayKodu == selectedDonem(tahsilatDonemKodu) &&
                      element.kayitTipi == "|",
          )
          .map((e) => e.tutar)
          .sum ??
      0;
  @computed
  double get getCekTahsilat =>
      temsilciProfilList
          ?.where(
            (element) => selectedDonem(tahsilatDonemKodu) == null
                ? tahsilatDonemKodu != 13
                : element.tabloTipi == "TAHSILAT" &&
                      element.ayKodu == selectedDonem(tahsilatDonemKodu) &&
                      element.kayitTipi == "G",
          )
          .map((e) => e.tutar)
          .sum ??
      0;
  @computed
  double get getSenetTahsilat =>
      temsilciProfilList
          ?.where(
            (element) => selectedDonem(tahsilatDonemKodu) == null
                ? tahsilatDonemKodu != 13
                : element.tabloTipi == "TAHSILAT" &&
                      element.ayKodu == selectedDonem(tahsilatDonemKodu) &&
                      element.kayitTipi == "E",
          )
          .map((e) => e.tutar)
          .sum ??
      0;
  @computed
  double get getDekontTahsilat =>
      temsilciProfilList
          ?.where(
            (element) => selectedDonem(tahsilatDonemKodu) == null
                ? tahsilatDonemKodu != 13
                : element.tabloTipi == "TAHSILAT" &&
                      element.ayKodu == selectedDonem(tahsilatDonemKodu) &&
                      element.kayitTipi == "K",
          )
          .map((e) => e.tutar)
          .sum ??
      0;

  @computed
  double get getToplamTahsilat =>
      getNakitTahsilat + getKrediKartiTahsilat + getCekTahsilat + getSenetTahsilat + getDekontTahsilat;
  @computed
  double get getBuYilSatis =>
      temsilciProfilList
          ?.where((element) => element.tabloTipi == "SATIS" && (element.ayKodu ?? 0) <= 12)
          .map((e) => e.tutar)
          .sum ??
      0;

  @computed
  double get getBuYilAlis =>
      temsilciProfilList
          ?.where((element) => element.tabloTipi == "ALIS" && (element.ayKodu ?? 0) <= 12)
          .map((e) => e.tutar)
          .sum ??
      0;

  @computed
  double get getBuYilSiparis =>
      temsilciProfilList
          ?.where((element) => element.tabloTipi == "SIPARIS" && (element.ayKodu ?? 0) <= 12)
          .map((e) => e.tutar)
          .sum ??
      0;

  @computed
  double get getBuYilTahsilatlar =>
      temsilciProfilList
          ?.where((element) => element.tabloTipi == "TAHSILAT" && (element.ayKodu ?? 0) <= 12)
          .map((e) => e.tutar)
          .sum ??
      0;
  @computed
  List<double> get getPlasiyerToplam {
    //her plasiyerin toplam satışı
    final Set<String> uniquePlasiyer = <String>{};
    for (final element in temsilciProfilList ?? []) {
      if (element.plasiyerAciklama != null &&
          element.kayitTipi == "SF" &&
          (selectedDonem(donemKodu) == null ? donemKodu != 13 : element.ayKodu == selectedDonem(donemKodu))) {
        uniquePlasiyer.add(element.plasiyerAciklama!);
      }
    }
    final List<double> list = List.generate(uniquePlasiyer.length, (index) => 0);
    if (list.ext.isNotNullOrEmpty) {
      temsilciProfilList
          ?.where(
            (element) =>
                (selectedDonem(donemKodu) == null ? donemKodu != 13 : element.ayKodu == selectedDonem(donemKodu)) &&
                element.kayitTipi == "SF",
          )
          .forEach((element) {
            list[uniquePlasiyer.toList().indexOf(element.plasiyerAciklama ?? "")] += element.tutar ?? 0;
          });
    }
    log(list.toString());
    return list;
  }

  @computed
  List<String> get getPlasiyerTitle {
    if (temsilciProfilList.ext.isNotNullOrEmpty) {
      final Set<String> uniquePlasiyer = <String>{};
      for (final TemsilciProfilModel element in temsilciProfilList ?? []) {
        if (element.plasiyerAciklama != null &&
            element.kayitTipi == "SF" &&
            (selectedDonem(donemKodu) == null ? donemKodu != 13 : element.ayKodu == selectedDonem(donemKodu))) {
          uniquePlasiyer.add(element.plasiyerAciklama ?? "");
        }
      }
      return uniquePlasiyer.toList();
    }
    return [];
  }

  @computed
  List<double> get getAylikSatislar {
    int biggestMonth =
        temsilciProfilList
            ?.map((element) => element.ayKodu)
            .toList()
            .reduce((value, element) => value! > element! ? value : element) ??
        0;
    final List<double> list = List.generate(biggestMonth, (index) => 0);
    if (list.length == 13) {
      list.removeLast();
      biggestMonth--;
    }
    for (int i = 1; i <= biggestMonth; i++) {
      final value = temsilciProfilList
          ?.where((element) => element.tabloTipi == "SATIS" && element.ayKodu == i && (element.tutar != null))
          .map((e) => e.tutar)
          .toList();
      if (value.ext.isNotNullOrEmpty) {
        list[i > 12 ? DateTime.now().copyWith(month: DateTime.now().month - 1).month : i - 1] +=
            value?.toList().reduce((value, element) => (value ?? 0) + (element ?? 0)) ?? 0;
        // list.add(value?.toList().reduce((value, element) => (value ?? 0) + (element ?? 0))!.toDouble() ?? 0);
      }
    }
    while (list.lastOrNull == 0) {
      list.removeLast();
    }
    return list;
  }

  @computed
  List<double> get getAylikAlislar {
    int biggestMonth =
        temsilciProfilList
            ?.map((element) => element.ayKodu)
            .toList()
            .reduce((value, element) => value! > element! ? value : element) ??
        0;
    final List<double> list = List.generate(biggestMonth, (index) => 0);
    if (list.length == 13) {
      list.removeLast();
      biggestMonth--;
    }
    for (int i = 1; i <= biggestMonth; i++) {
      final value = temsilciProfilList
          ?.where((element) => element.tabloTipi == "ALIS" && element.ayKodu == i && (element.tutar != null))
          .map((e) => e.tutar)
          .toList();
      if (value.ext.isNotNullOrEmpty) {
        list[i > 12 ? DateTime.now().copyWith(month: DateTime.now().month - 1).month : i - 1] +=
            value?.toList().reduce((value, element) => (value ?? 0) + (element ?? 0)) ?? 0;
      }
    }
    if (list.ext.isNotNullOrEmpty) {
      while (list.lastOrNull == 0) {
        list.removeLast();
      }
    }
    return list;
  }

  @computed
  List<double> get getAylikSiparisler {
    int biggestMonth =
        temsilciProfilList
            ?.map((element) => element.ayKodu)
            .toList()
            .reduce((value, element) => value! > element! ? value : element) ??
        0;
    final List<double> list = List.generate(biggestMonth, (index) => 0);
    if (list.length == 13) {
      list.removeLast();
      biggestMonth--;
    }
    for (int i = 1; i <= biggestMonth; i++) {
      final value = temsilciProfilList
          ?.where((element) => element.tabloTipi == "SIPARIS" && element.ayKodu == i && (element.tutar != null))
          .map((e) => e.tutar)
          .toList();
      if (value.ext.isNotNullOrEmpty) {
        list[i > 12 ? DateTime.now().copyWith(month: DateTime.now().month - 1).month : i - 1] =
            list[i > 12 ? DateTime.now().copyWith(month: DateTime.now().month - 1).month : i - 1] +
            (value?.toList().reduce((value, element) => (value ?? 0) + (element ?? 0)) ?? 0);
      }
    }
    while (list.lastOrNull == 0) {
      list.removeLast();
    }
    return list;
  }

  @computed
  List<double> get getAylikTahsilatlar {
    int biggestMonth =
        temsilciProfilList
            ?.map((element) => element.ayKodu)
            .toList()
            .reduce((value, element) => value! > element! ? value : element) ??
        0;
    final List<double> list = List.generate(biggestMonth, (index) => 0);
    if (list.length == 13) {
      list.removeLast();
      biggestMonth--;
    }
    for (int i = 1; i <= biggestMonth; i++) {
      final value = temsilciProfilList
          ?.where((element) => element.tabloTipi == "TAHSILAT" && element.ayKodu == i && (element.tutar != null))
          .map((e) => e.tutar)
          .toList();
      if (value.ext.isNotNullOrEmpty) {
        list[i > 12 ? DateTime.now().copyWith(month: DateTime.now().month - 1).month : i - 1] =
            list[i > 12 ? DateTime.now().copyWith(month: DateTime.now().month - 1).month : i - 1] +
            (value?.toList().reduce((value, element) => (value ?? 0) + (element ?? 0)) ?? 0);
      }
    }
    while (list.lastOrNull == 0) {
      list.removeLast();
    }
    return list;
  }

  final List<Donem> aylar = [
    (name: "Bugün", value: 13),
    (name: "Bu ay", value: 14),
    (name: "Geçen ay", value: 15),
    (name: "Bu yıl", value: 0),
    (name: "Ocak", value: 1),
    (name: "Şubat", value: 2),
    (name: "Mart", value: 3),
    (name: "Nisan", value: 4),
    (name: "Mayıs", value: 5),
    (name: "Haziran", value: 6),
    (name: "Temmuz", value: 7),
    (name: "Ağustos", value: 8),
    (name: "Eylül", value: 9),
    (name: "Ekim", value: 10),
    (name: "Kasım", value: 11),
    (name: "Aralık", value: 12),
  ];
}
