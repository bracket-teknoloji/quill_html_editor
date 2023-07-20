import 'dart:convert';

import 'package:mobx/mobx.dart';
import 'package:picker/view/main_page/alt_sayfalar/siparis/musteri_siparisleri/model/musteri_siparisleri_model.dart';
import 'package:picker/view/main_page/alt_sayfalar/siparis/musteri_siparisleri/model/musteri_siparisleri_request_model.dart';

part 'musteri_siparisleri_view_model.g.dart';

class MusteriSiparisleriViewModel = _MusteriSiparisleriViewModelBase with _$MusteriSiparisleriViewModel;

abstract class _MusteriSiparisleriViewModelBase with Store {
  MusteriSiparisleriRequestModel get musteriSiparisleriRequestModel =>
      MusteriSiparisleriRequestModel(pickerBelgeTuru: "MS", iadeMi: false, faturalasmaGoster: true, miktarGetir: "H", siralama: "TARIH_ZA", sayfa: sayfa);

  @observable
  bool dahaVarMi = true;

  @observable
  int sayfa = 1;

  @action
  void increaseSayfa() => sayfa++;

  @action
  void resetSayfa() => sayfa = 1;

  @action
  void setDahaVarMi(bool value) => dahaVarMi = value;

  @observable
  bool isScrolledDown = false;

  @action
  void changeIsScrolledDown(bool value) => isScrolledDown = value;
  @observable
  bool searchBar = false;

  @action
  void changeSearchBar() => searchBar = !searchBar;

  @observable
  List<MusteriSiparisleriModel?>? musteriSiparisleriList;
  @action
  void setMusteriSiparisleriList(List<MusteriSiparisleriModel?>? value) {
    if (musteriSiparisleriList == null) {
      musteriSiparisleriList = value;
    } else {
      musteriSiparisleriList?.addAll(value ?? []);
    }
  }

  @computed
  String get getQueryParams => jsonEncode(musteriSiparisleriRequestModel.toJson());
}
