import "package:mobx/mobx.dart";

part "cari_listesi_view_model.g.dart";

class CariListesiViewModel = _CariListesiViewModelBase with _$CariListesiViewModel;

abstract class _CariListesiViewModelBase with Store {
  @observable
  bool dahaVarMi = true;
  @observable
  bool isScrolledDown = false;
  @observable
  int sayfa = 1;
  @observable
  bool searchBar = false;
  @observable
  String arama = "";
  @observable
  List? cariListesi;

  //* SAYFA
  @action
  void increaseSayfa() {
    sayfa++;
  }

  @action
  void resetSayfa() {
    sayfa = 1;
  }

  //* SEARCH BAR
  @action
  void changeSearchBar() {
    searchBar = !searchBar;
  }

  //* ARAMA
  @action
  void changeArama(String value) {
    arama = value;
  }

  //* CARİ LİSTESİ
  @action
  void changeCariListesi(List? value) {
    if (value == null) {
      cariListesi = null;
    } else {
      cariListesi = value.asObservable();
    }
  }

  @action
  void addCariListesi(List value) {
    cariListesi?.addAll(value);
  }

  //* SCROLL
  @action
  void changeIsScrolledDown(bool value) {
    isScrolledDown = value;
  }

  //* DAHA VAR MI
  @action
  void changeDahaVarMi(bool value) {
    dahaVarMi = value;
  }
}
