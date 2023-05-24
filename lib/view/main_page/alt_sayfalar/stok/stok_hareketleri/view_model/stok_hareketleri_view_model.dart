import 'package:mobx/mobx.dart';

import '../model/stok_hareketleri_model.dart';

part 'stok_hareketleri_view_model.g.dart';

class StokHareketleriViewModel = _StokHareketleriViewModelBase with _$StokHareketleriViewModel;

abstract class _StokHareketleriViewModelBase with Store {
  @observable
  List<String>? arrHareketTuru = [];

  @action
  void setArrHareketTuru(List<String> value) => arrHareketTuru = value;

  @action
  void clearArrHareketTuru() => arrHareketTuru = [];
  @observable
  bool dovizliFiyat = false;

  @action
  void changeDovizliFiyat() {
    dovizliFiyat = !dovizliFiyat;
  }

  @observable
  String? siralama = "TARIH_ZA";

  @action
  void setSiralama(String value) => siralama = value;
  @observable
  Future? future;

  @action
  void setFuture(Future? value) => future = value;

  @observable
  bool searchBar = false;

  @action
  void changeSearchBar() {
    searchBar = !searchBar;
  }

  @observable
  List<StokHareketleriModel>? stokHareketleri = [];

  @action
  void setStokHareketleri(List<StokHareketleriModel> value) {
    stokHareketleri = value;
  }

  @action
  void addStokHareketleri(StokHareketleriModel value) => stokHareketleri?.add(value);

  @observable
  List<StokHareketleriModel>? filteredStokHareketleri = [];

  @action
  void filterStokHareketleri(String value) => filteredStokHareketleri = stokHareketleri?.where((element) => element.fisno!.toLowerCase().contains(value.toLowerCase())).toList();
}
