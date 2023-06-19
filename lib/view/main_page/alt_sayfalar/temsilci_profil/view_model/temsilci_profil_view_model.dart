import 'package:kartal/kartal.dart';
import 'package:mobx/mobx.dart';

import '../model/temsilci_profil_model.dart';
import '../model/temsilci_profil_request_model.dart';

part 'temsilci_profil_view_model.g.dart';

class TemsilciProfilViewModel = _TemsilciProfilViewModelBase with _$TemsilciProfilViewModel;

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
  double get getBugunSatis => temsilciProfilList!.where((element) => element.tabloTipi == "SATIS" && element.ayKodu == 13).toList().isNotNullOrEmpty
      ? temsilciProfilList?.where((element) => element.tabloTipi == "SATIS" && element.ayKodu == 13).map((e) => e.tutar).toList().reduce((value, element) => value! + element!)?.toDouble() ?? 0
      : 0;

  @computed
  double get getBugunAlis => temsilciProfilList!.where((element) => element.tabloTipi == "ALIS" && element.ayKodu == 13).toList().isNotNullOrEmpty
      ? temsilciProfilList?.where((element) => element.tabloTipi == "ALIS" && element.ayKodu == 13).map((e) => e.tutar).toList().reduce((value, element) => value! + element!)?.toDouble() ?? 0
      : 0;

  @computed
  double get getBugunSiparis => temsilciProfilList!.where((element) => element.tabloTipi == "SIPARIS" && element.ayKodu == 13).toList().isNotNullOrEmpty
      ? temsilciProfilList?.where((element) => element.tabloTipi == "SIPARIS" && element.ayKodu == 13).map((e) => e.tutar).toList().reduce((value, element) => value! + element!)?.toDouble() ?? 0
      : 0;

  @computed
  double get getBugunTahsilatlar => temsilciProfilList!.where((element) => element.tabloTipi == "TAHSILAT" && element.ayKodu == 13).toList().isNotNullOrEmpty
      ? temsilciProfilList?.where((element) => element.tabloTipi == "TAHSILAT" && element.ayKodu == 13).map((e) => e.tutar).toList().reduce((value, element) => value! + element!)?.toDouble() ?? 0
      : 0;

  @computed
  double get getBuAySatis => temsilciProfilList!.where((element) => element.tabloTipi == "SATIS" && element.ayKodu == DateTime.now().month).toList().isNotNullOrEmpty
      ? temsilciProfilList?.where((element) => element.tabloTipi == "SATIS" && element.ayKodu == DateTime.now().month).map((e) => e.tutar).toList().reduce((value, element) => value! + element!) ?? 0
      : 0;

  @computed
  double get getBuAyAlis => temsilciProfilList!.where((element) => element.tabloTipi == "ALIS" && element.ayKodu == DateTime.now().month).toList().isNotNullOrEmpty
      ? temsilciProfilList?.where((element) => element.tabloTipi == "ALIS" && element.ayKodu == DateTime.now().month).map((e) => e.tutar).toList().reduce((value, element) => value! + element!) ?? 0
      : 0;

  @computed
  double get getBuAySiparis => temsilciProfilList!.where((element) => element.tabloTipi == "SIPARIS" && element.ayKodu == DateTime.now().month).toList().isNotNullOrEmpty
      ? temsilciProfilList?.where((element) => element.tabloTipi == "SIPARIS" && element.ayKodu == DateTime.now().month).map((e) => e.tutar).toList().reduce((value, element) => value! + element!) ?? 0
      : 0;

  @computed
  double get getBuAyTahsilatlar => temsilciProfilList!.where((element) => element.tabloTipi == "TAHSILAT" && element.ayKodu == DateTime.now().month).toList().isNotNullOrEmpty
      ? temsilciProfilList?.where((element) => element.tabloTipi == "TAHSILAT" && element.ayKodu == DateTime.now().month).map((e) => e.tutar).toList().reduce((value, element) => value! + element!) ??
          0
      : 0;

  @computed
  double get getGecenAySatis => temsilciProfilList!.where((element) => element.tabloTipi == "SATIS" && element.ayKodu == DateTime.now().month - 1).toList().isNotNullOrEmpty
      ? temsilciProfilList
              ?.where((element) => element.tabloTipi == "SATIS" && element.ayKodu == DateTime.now().month - 1)
              .map((e) => e.tutar)
              .toList()
              .reduce((value, element) => value! + element!)
              ?.toDouble() ??
          0
      : 0;

  @computed
  double get getGecenAyAlis => temsilciProfilList!.where((element) => element.tabloTipi == "ALIS" && element.ayKodu == DateTime.now().month - 1).toList().isNotNullOrEmpty
      ? temsilciProfilList
              ?.where((element) => element.tabloTipi == "ALIS" && element.ayKodu == DateTime.now().month - 1)
              .map((e) => e.tutar)
              .toList()
              .reduce((value, element) => value! + element!)
              ?.toDouble() ??
          0
      : 0;

  @computed
  double get getGecenAySiparis => temsilciProfilList!.where((element) => element.tabloTipi == "SIRAPIS" && element.ayKodu == DateTime.now().month - 1).toList().isNotNullOrEmpty
      ? temsilciProfilList
              ?.where((element) => element.tabloTipi == "SIPARIS" && element.ayKodu == DateTime.now().month - 1)
              .map((e) => e.tutar)
              .toList()
              .reduce((value, element) => value! + element!)
              ?.toDouble() ??
          0
      : 0;

  @computed
  double get getGecenAyTahsilatlar => temsilciProfilList!.where((element) => element.tabloTipi == "TAHSILAT" && element.ayKodu == DateTime.now().month - 1).toList().isNotNullOrEmpty
      ? temsilciProfilList
              ?.where((element) => element.tabloTipi == "TAHSILAT" && element.ayKodu == DateTime.now().month - 1)
              .map((e) => e.tutar)
              .toList()
              .reduce((value, element) => value! + element!)
              ?.toDouble() ??
          0
      : 0;
  @computed
  double get getBuYilSatis => temsilciProfilList!.where((element) => element.tabloTipi == "SATIS" && element.ayKodu! < DateTime.now().month).toList().isNotNullOrEmpty
      ? temsilciProfilList
              ?.where((element) => element.tabloTipi == "SATIS" && element.ayKodu! < DateTime.now().month)
              .map((e) => e.tutar)
              .toList()
              .reduce((value, element) => value! + element!)
              ?.toDouble() ??
          0
      : 0;

  @computed
  double get getBuYilAlis => temsilciProfilList!.where((element) => element.tabloTipi == "ALIS" && element.ayKodu! < DateTime.now().month).toList().isNotNullOrEmpty
      ? temsilciProfilList
              ?.where((element) => element.tabloTipi == "ALIS" && element.ayKodu! < DateTime.now().month)
              .map((e) => e.tutar)
              .toList()
              .reduce((value, element) => value! + element!)
              ?.toDouble() ??
          0
      : 0;

  @computed
  double get getBuYilSiparis => temsilciProfilList!.where((element) => element.tabloTipi == "SIPARIS" && element.ayKodu! < DateTime.now().month).toList().isNotNullOrEmpty
      ? temsilciProfilList
              ?.where((element) => element.tabloTipi == "SIPARIS" && element.ayKodu! < DateTime.now().month)
              .map((e) => e.tutar)
              .toList()
              .reduce((value, element) => value! + element!)
              ?.toDouble() ??
          0
      : 0;

  @computed
  double get getBuYilTahsilatlar => temsilciProfilList!.where((element) => element.tabloTipi == "TAHSILAT" && element.ayKodu! < DateTime.now().month).toList().isNotNullOrEmpty
      ? temsilciProfilList
              ?.where((element) => element.tabloTipi == "TAHSILAT" && element.ayKodu! < DateTime.now().month)
              .map((e) => e.tutar)
              .toList()
              .reduce((value, element) => value! + element!)
              ?.toDouble() ??
          0
      : 0;
  @computed
  List<double> get getPlasiyerToplam {
    //her plasiyerin toplam satışı
    Set<String> uniquePlasiyer = <String>{};
    for (TemsilciProfilModel element in temsilciProfilList!) {
      if (element.plasiyerAciklama != null && element.kayitTipi == "SF" && element.ayKodu == donemKodu) {
        uniquePlasiyer.add(element.plasiyerAciklama!);
      }
    }
    List<double> list = List.generate(uniquePlasiyer.length, (index) => 0);
    temsilciProfilList?.where((element) => element.ayKodu == donemKodu && element.kayitTipi == "SF").forEach((element) {
      list[uniquePlasiyer.toList().indexOf(element.plasiyerAciklama ?? "")] += element.tutar ?? 0;
    });
    print(list);
    return list;
  }

  @computed
  List<String> get getPlasiyerTitle {
    if (temsilciProfilList.isNotNullOrEmpty) {
      Set<String> uniquePlasiyer = <String>{};
      for (TemsilciProfilModel element in temsilciProfilList!) {
        if (element.plasiyerAciklama != null && element.kayitTipi == "SF" && element.ayKodu == donemKodu) {
          uniquePlasiyer.add(element.plasiyerAciklama!);
        }
      }
      return uniquePlasiyer.toList();
    }
    return [];
  }

  @computed
  List<double> get getAylikSatislar {
    int biggestMonth = temsilciProfilList?.map((element) => element.ayKodu).toList().reduce((value, element) => value! > element! ? value : element)! ?? 0;
    List<double> list = List.generate(biggestMonth, (index) => 0);
    if (list.length == 13) {
      list.removeLast();
    }
    for (int i = 1; i <= biggestMonth; i++) {
      var value = temsilciProfilList?.where((element) => element.tabloTipi == "SATIS" && element.ayKodu == i && (element.tutar != null)).map((e) => e.tutar).toList();
      if (value.isNotNullOrEmpty) {
        list[i > 12 ? DateTime.now().month-1 : i - 1] += (value?.toList().reduce((value, element) => (value ?? 0) + (element ?? 0))!.toDouble() ?? 0);
        // list.add(value?.toList().reduce((value, element) => (value ?? 0) + (element ?? 0))!.toDouble() ?? 0);
      }
    }
    while(list.last == 0){
      list.removeLast();
    }
    return list;
  }

  @computed
  List<double> get getAylikAlislar {
    int biggestMonth = temsilciProfilList?.map((element) => element.ayKodu).toList().reduce((value, element) => value! > element! ? value : element)! ?? 0;
    List<double> list = List.generate(biggestMonth, (index) => 0);
    if (list.length == 13) {
      list.removeLast();
    }
    for (int i = 1; i <= biggestMonth; i++) {
      var value = temsilciProfilList?.where((element) => element.tabloTipi == "ALIS" && element.ayKodu == i && (element.tutar != null)).map((e) => e.tutar).toList();
      if (value.isNotNullOrEmpty) {
        list[i > 12 ? DateTime.now().month-1 : i - 1] +=  (value?.toList().reduce((value, element) => (value ?? 0) + (element ?? 0))!.toDouble() ?? 0);
        // list.add(value?.toList().reduce((value, element) => (value ?? 0) + (element ?? 0))!.toDouble() ?? 0);
      }
    }
    while(list.last == 0){
      list.removeLast();
    }
    return list;
  }

  @computed
  List<double> get getAylikSiparisler {
    int biggestMonth = temsilciProfilList?.map((element) => element.ayKodu).toList().reduce((value, element) => value! > element! ? value : element)! ?? 0;
    List<double> list = List.generate(biggestMonth, (index) => 0);
    if (list.length == 13) {
      list.removeLast();
    }
    for (int i = 1; i <= biggestMonth; i++) {
      var value = temsilciProfilList?.where((element) => element.tabloTipi == "SIPARIS" && element.ayKodu == i && (element.tutar != null)).map((e) => e.tutar).toList();
      if (value.isNotNullOrEmpty) {
        list[i > 12 ? DateTime.now().month-1 : i - 1] =list[i > 12 ? DateTime.now().month-1 : i - 1]+  (value?.toList().reduce((value, element) => (value ?? 0) + (element ?? 0))!.toDouble() ?? 0);
        // list.add(value?.toList().reduce((value, element) => (value ?? 0) + (element ?? 0))!.toDouble() ?? 0);
      }
    }
    while(list.last == 0){
      list.removeLast();
    }
    return list;
  }

  @computed
  List<double> get getAylikTahsilatlar {
    int biggestMonth = temsilciProfilList?.map((element) => element.ayKodu).toList().reduce((value, element) => value! > element! ? value : element)! ?? 0;
    List<double> list = List.generate(biggestMonth, (index) => 0);
    if (list.length == 13) {
      list.removeLast();
    }
    for (int i = 1; i <= biggestMonth; i++) {
      var value = temsilciProfilList?.where((element) => element.tabloTipi == "TAHSILAT" && element.ayKodu == i && (element.tutar != null)).map((e) => e.tutar).toList();
      if (value.isNotNullOrEmpty) {
        list[i > 12 ? DateTime.now().month-1 : i - 1] =list[i > 12 ? DateTime.now().month-1 : i - 1]+  (value?.toList().reduce((value, element) => (value ?? 0) + (element ?? 0))!.toDouble() ?? 0);
        // list.add(value?.toList().reduce((value, element) => (value ?? 0) + (element ?? 0))!.toDouble() ?? 0);
      }
    }
    while(list.last == 0){
      list.removeLast();
    }
    return list;
  }

  final List<String> aylar = ["Ocak", "Şubat", "Mart", "Nisan", "Mayıs", "Haziran", "Temmuz", "Ağustos", "Eylül", "Ekim", "Kasım", "Aralık"];
}
