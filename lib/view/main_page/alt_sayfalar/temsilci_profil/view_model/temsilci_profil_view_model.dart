import "dart:developer";

import "package:kartal/kartal.dart";
import "package:mobx/mobx.dart";

import "../model/temsilci_profil_model.dart";
import "../model/temsilci_profil_request_model.dart";

part "temsilci_profil_view_model.g.dart";

class TemsilciProfilViewModel = _TemsilciProfilViewModelBase with _$TemsilciProfilViewModel;

abstract class _TemsilciProfilViewModelBase with Store {
  @observable
  List<bool> iadeDurumuValueList = <bool>[true, false, false];

  @action
  void setIadeDurumuValueList(int index) {
    iadeDurumuValueList = iadeDurumuValueList.map((bool e) => false).toList();
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
  List<bool> donemValueList = <bool>[true, false, false];

  @action
  void setDonemValueList(int index) {
    donemValueList = donemValueList.map((bool e) => false).toList();
    donemValueList[index] = true;
    temsilciProfilRequestModel.donemTipi = index == 0
        ? "SY"
        : index == 1
            ? "BY"
            : "GY";
  }

  @observable
  TemsilciProfilRequestModel temsilciProfilRequestModel = TemsilciProfilRequestModel()
    ..donemTipi = "BY"
    ..satisIrsDahil = "H"
    ..iadeDurumu = "H"
    ..kdvDahil = "H";
  @observable
  String? aciklama;

  @computed
  String get donem => aylar[donemKodu - 1];

  @observable
  int donemKodu = DateTime.now().month;

  @action
  void setDonemKodu(int value) => donemKodu = value;

  @action
  void setAciklama(String? value) => aciklama = value;

  @observable
  ObservableList<TemsilciProfilModel>? temsilciProfilList;

  @action
  void setTemsilciProfilList(List<TemsilciProfilModel>? value) => temsilciProfilList = value?.asObservable();

  @computed
  double get getBugunSatis => (temsilciProfilList?.where((TemsilciProfilModel element) => element.tabloTipi == "SATIS" && element.ayKodu == 13).toList().ext.isNotNullOrEmpty ?? false)
      ? temsilciProfilList?.where((TemsilciProfilModel element) => element.tabloTipi == "SATIS" && element.ayKodu == 13).map((TemsilciProfilModel e) => e.tutar).toList().reduce((double? value, double? element) => value! + element!)?.toDouble() ?? 0
      : 0;

  @computed
  double get getBugunAlis => (temsilciProfilList?.where((TemsilciProfilModel element) => element.tabloTipi == "ALIS" && element.ayKodu == 13).toList().ext.isNotNullOrEmpty ?? false)
      ? temsilciProfilList?.where((TemsilciProfilModel element) => element.tabloTipi == "ALIS" && element.ayKodu == 13).map((TemsilciProfilModel e) => e.tutar).toList().reduce((double? value, double? element) => value! + element!)?.toDouble() ?? 0
      : 0;

  @computed
  double get getBugunSiparis => (temsilciProfilList?.where((TemsilciProfilModel element) => element.tabloTipi == "SIPARIS" && element.ayKodu == 13).toList().ext.isNotNullOrEmpty ?? false)
      ? temsilciProfilList?.where((TemsilciProfilModel element) => element.tabloTipi == "SIPARIS" && element.ayKodu == 13).map((TemsilciProfilModel e) => e.tutar).toList().reduce((double? value, double? element) => value! + element!)?.toDouble() ?? 0
      : 0;

  @computed
  double get getBugunTahsilatlar => (temsilciProfilList?.where((TemsilciProfilModel element) => element.tabloTipi == "TAHSILAT" && element.ayKodu == 13).toList().ext.isNotNullOrEmpty ?? false)
      ? temsilciProfilList?.where((TemsilciProfilModel element) => element.tabloTipi == "TAHSILAT" && element.ayKodu == 13).map((TemsilciProfilModel e) => e.tutar).toList().reduce((double? value, double? element) => value! + element!)?.toDouble() ?? 0
      : 0;

  @computed
  double get getBuAySatis => (temsilciProfilList?.where((TemsilciProfilModel element) => element.tabloTipi == "SATIS" && element.ayKodu == DateTime.now().month).toList().ext.isNotNullOrEmpty ?? false)
      ? temsilciProfilList?.where((TemsilciProfilModel element) => element.tabloTipi == "SATIS" && element.ayKodu == DateTime.now().month).map((TemsilciProfilModel e) => e.tutar).toList().reduce((double? value, double? element) => value! + element!) ?? 0
      : 0;

  @computed
  double get getBuAyAlis => (temsilciProfilList?.where((TemsilciProfilModel element) => element.tabloTipi == "ALIS" && element.ayKodu == DateTime.now().month).toList().ext.isNotNullOrEmpty ?? false)
      ? temsilciProfilList?.where((TemsilciProfilModel element) => element.tabloTipi == "ALIS" && element.ayKodu == DateTime.now().month).map((TemsilciProfilModel e) => e.tutar).toList().reduce((double? value, double? element) => value! + element!) ?? 0
      : 0;

  @computed
  double get getBuAySiparis => (temsilciProfilList?.where((TemsilciProfilModel element) => element.tabloTipi == "SIPARIS" && element.ayKodu == DateTime.now().month).toList().ext.isNotNullOrEmpty ?? false)
      ? temsilciProfilList?.where((TemsilciProfilModel element) => element.tabloTipi == "SIPARIS" && element.ayKodu == DateTime.now().month).map((TemsilciProfilModel e) => e.tutar).toList().reduce((double? value, double? element) => value! + element!) ?? 0
      : 0;

  @computed
  double get getBuAyTahsilatlar => (temsilciProfilList?.where((TemsilciProfilModel element) => element.tabloTipi == "TAHSILAT" && element.ayKodu == DateTime.now().month).toList().ext.isNotNullOrEmpty ?? false)
      ? temsilciProfilList?.where((TemsilciProfilModel element) => element.tabloTipi == "TAHSILAT" && element.ayKodu == DateTime.now().month).map((TemsilciProfilModel e) => e.tutar).toList().reduce((double? value, double? element) => value! + element!) ??
          0
      : 0;

  @computed
  double get getGecenAySatis => (temsilciProfilList?.where((TemsilciProfilModel element) => element.tabloTipi == "SATIS" && element.ayKodu == DateTime.now().month - 1).toList().ext.isNotNullOrEmpty ?? false)
      ? temsilciProfilList
              ?.where((TemsilciProfilModel element) => element.tabloTipi == "SATIS" && element.ayKodu == DateTime.now().month - 1)
              .map((TemsilciProfilModel e) => e.tutar)
              .toList()
              .reduce((double? value, double? element) => value! + element!)
              ?.toDouble() ??
          0
      : 0;

  @computed
  double get getGecenAyAlis => (temsilciProfilList?.where((TemsilciProfilModel element) => element.tabloTipi == "ALIS" && element.ayKodu == DateTime.now().month - 1).toList().ext.isNotNullOrEmpty ?? false)
      ? temsilciProfilList
              ?.where((TemsilciProfilModel element) => element.tabloTipi == "ALIS" && element.ayKodu == DateTime.now().month - 1)
              .map((TemsilciProfilModel e) => e.tutar)
              .toList()
              .reduce((double? value, double? element) => value! + element!)
              ?.toDouble() ??
          0
      : 0;

  @computed
  double get getGecenAySiparis => (temsilciProfilList?.where((TemsilciProfilModel element) => element.tabloTipi == "SIRAPIS" && element.ayKodu == DateTime.now().month - 1).toList().ext.isNotNullOrEmpty ?? false)
      ? temsilciProfilList
              ?.where((TemsilciProfilModel element) => element.tabloTipi == "SIPARIS" && element.ayKodu == DateTime.now().month - 1)
              .map((TemsilciProfilModel e) => e.tutar)
              .toList()
              .reduce((double? value, double? element) => value! + element!)
              ?.toDouble() ??
          0
      : 0;

  @computed
  double get getGecenAyTahsilatlar => (temsilciProfilList?.where((TemsilciProfilModel element) => element.tabloTipi == "TAHSILAT" && element.ayKodu == DateTime.now().month - 1).toList().ext.isNotNullOrEmpty ?? false)
      ? temsilciProfilList
              ?.where((TemsilciProfilModel element) => element.tabloTipi == "TAHSILAT" && element.ayKodu == DateTime.now().month - 1)
              .map((TemsilciProfilModel e) => e.tutar)
              .toList()
              .reduce((double? value, double? element) => value! + element!)
              ?.toDouble() ??
          0
      : 0;
  @computed
  double get getBuYilSatis => (temsilciProfilList?.where((TemsilciProfilModel element) => element.tabloTipi == "SATIS" && element.ayKodu! < DateTime.now().month).toList().ext.isNotNullOrEmpty ?? false)
      ? temsilciProfilList
              ?.where((TemsilciProfilModel element) => element.tabloTipi == "SATIS" && element.ayKodu! < DateTime.now().month)
              .map((TemsilciProfilModel e) => e.tutar)
              .toList()
              .reduce((double? value, double? element) => value! + element!)
              ?.toDouble() ??
          0
      : 0;

  @computed
  double get getBuYilAlis => (temsilciProfilList?.where((TemsilciProfilModel element) => element.tabloTipi == "ALIS" && element.ayKodu! < DateTime.now().month).toList().ext.isNotNullOrEmpty ?? false)
      ? temsilciProfilList
              ?.where((TemsilciProfilModel element) => element.tabloTipi == "ALIS" && element.ayKodu! < DateTime.now().month)
              .map((TemsilciProfilModel e) => e.tutar)
              .toList()
              .reduce((double? value, double? element) => value! + element!)
              ?.toDouble() ??
          0
      : 0;

  @computed
  double get getBuYilSiparis => (temsilciProfilList?.where((TemsilciProfilModel element) => element.tabloTipi == "SIPARIS" && element.ayKodu! < DateTime.now().month).toList().ext.isNotNullOrEmpty ?? false)
      ? temsilciProfilList
              ?.where((TemsilciProfilModel element) => element.tabloTipi == "SIPARIS" && element.ayKodu! < DateTime.now().month)
              .map((TemsilciProfilModel e) => e.tutar)
              .toList()
              .reduce((double? value, double? element) => value! + element!)
              ?.toDouble() ??
          0
      : 0;

  @computed
  double get getBuYilTahsilatlar => (temsilciProfilList?.where((TemsilciProfilModel element) => element.tabloTipi == "TAHSILAT" && element.ayKodu! < DateTime.now().month).toList().ext.isNotNullOrEmpty ?? false)
      ? temsilciProfilList
              ?.where((TemsilciProfilModel element) => element.tabloTipi == "TAHSILAT" && element.ayKodu! < DateTime.now().month)
              .map((TemsilciProfilModel e) => e.tutar)
              .toList()
              .reduce((double? value, double? element) => value! + element!)
              ?.toDouble() ??
          0
      : 0;
  @computed
  List<double> get getPlasiyerToplam {
    //her plasiyerin toplam satışı
    final Set<String> uniquePlasiyer = <String>{};
    for (TemsilciProfilModel element in temsilciProfilList ?? <TemsilciProfilModel>[]) {
      if (element.plasiyerAciklama != null && element.kayitTipi == "SF" && element.ayKodu == donemKodu) {
        uniquePlasiyer.add(element.plasiyerAciklama!);
      }
    }
    final List<double> list = List.generate(uniquePlasiyer.length, (int index) => 0);
    if (list.ext.isNotNullOrEmpty) {
      temsilciProfilList?.where((TemsilciProfilModel element) => element.ayKodu == donemKodu && element.kayitTipi == "SF").forEach((TemsilciProfilModel element) {
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
      for (TemsilciProfilModel element in temsilciProfilList ?? <TemsilciProfilModel>[]) {
        if (element.plasiyerAciklama != null && element.kayitTipi == "SF" && element.ayKodu == donemKodu) {
          uniquePlasiyer.add(element.plasiyerAciklama ?? "");
        }
      }
      return uniquePlasiyer.toList();
    }
    return <String>[];
  }

  @computed
  List<double> get getAylikSatislar {
    final int biggestMonth = temsilciProfilList?.map((TemsilciProfilModel element) => element.ayKodu).toList().reduce((int? value, int? element) => value! > element! ? value : element) ?? 0;
    final List<double> list = List.generate(biggestMonth, (int index) => 0);
    if (list.length == 13) {
      list.removeLast();
    }
    for (int i = 1; i <= biggestMonth; i++) {
      final List<double?>? value = temsilciProfilList?.where((TemsilciProfilModel element) => element.tabloTipi == "SATIS" && element.ayKodu == i && (element.tutar != null)).map((TemsilciProfilModel e) => e.tutar).toList();
      if (value.ext.isNotNullOrEmpty) {
        list[i > 12 ? DateTime.now().month - 1 : i - 1] += value?.toList().reduce((double? value, double? element) => (value ?? 0) + (element ?? 0))?.toDouble() ?? 0;
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
    final int biggestMonth = temsilciProfilList?.map((TemsilciProfilModel element) => element.ayKodu).toList().reduce((int? value, int? element) => value! > element! ? value : element) ?? 0;
    final List<double> list = List.generate(biggestMonth, (int index) => 0);
    if (list.length == 13) {
      list.removeLast();
    }
    for (int i = 1; i <= biggestMonth; i++) {
      final List<double?>? value = temsilciProfilList?.where((TemsilciProfilModel element) => element.tabloTipi == "ALIS" && element.ayKodu == i && (element.tutar != null)).map((TemsilciProfilModel e) => e.tutar).toList();
      if (value.ext.isNotNullOrEmpty) {
        list[i > 12 ? DateTime.now().month - 1 : i - 1] += value?.toList().reduce((double? value, double? element) => (value ?? 0) + (element ?? 0))?.toDouble() ?? 0;
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
    final int biggestMonth = temsilciProfilList?.map((TemsilciProfilModel element) => element.ayKodu).toList().reduce((int? value, int? element) => value! > element! ? value : element) ?? 0;
    final List<double> list = List.generate(biggestMonth, (int index) => 0);
    if (list.length == 13) {
      list.removeLast();
    }
    for (int i = 1; i <= biggestMonth; i++) {
      final List<double?>? value = temsilciProfilList?.where((TemsilciProfilModel element) => element.tabloTipi == "SIPARIS" && element.ayKodu == i && (element.tutar != null)).map((TemsilciProfilModel e) => e.tutar).toList();
      if (value.ext.isNotNullOrEmpty) {
        list[i > 12 ? DateTime.now().month - 1 : i - 1] =
            list[i > 12 ? DateTime.now().month - 1 : i - 1] + (value?.toList().reduce((double? value, double? element) => (value ?? 0) + (element ?? 0))?.toDouble() ?? 0);
      }
    }
    while (list.lastOrNull == 0) {
      list.removeLast();
    }
    return list;
  }

  @computed
  List<double> get getAylikTahsilatlar {
    final int biggestMonth = temsilciProfilList?.map((TemsilciProfilModel element) => element.ayKodu).toList().reduce((int? value, int? element) => value! > element! ? value : element) ?? 0;
    final List<double> list = List.generate(biggestMonth, (int index) => 0);
    if (list.length == 13) {
      list.removeLast();
    }
    for (int i = 1; i <= biggestMonth; i++) {
      final List<double?>? value = temsilciProfilList?.where((TemsilciProfilModel element) => element.tabloTipi == "TAHSILAT" && element.ayKodu == i && (element.tutar != null)).map((TemsilciProfilModel e) => e.tutar).toList();
      if (value.ext.isNotNullOrEmpty) {
        list[i > 12 ? DateTime.now().month - 1 : i - 1] =
            list[i > 12 ? DateTime.now().month - 1 : i - 1] + (value?.toList().reduce((double? value, double? element) => (value ?? 0) + (element ?? 0))?.toDouble() ?? 0);
      }
    }
    while (list.lastOrNull == 0) {
      list.removeLast();
    }
    return list;
  }

  final List<String> aylar = <String>["Ocak", "Şubat", "Mart", "Nisan", "Mayıs", "Haziran", "Temmuz", "Ağustos", "Eylül", "Ekim", "Kasım", "Aralık"];
}
