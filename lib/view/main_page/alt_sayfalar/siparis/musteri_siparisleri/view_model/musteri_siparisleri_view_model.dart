import 'dart:convert';

import 'package:mobx/mobx.dart';
import 'package:picker/view/main_page/alt_sayfalar/siparis/musteri_siparisleri/model/musteri_siparisleri_model.dart';
import 'package:picker/view/main_page/alt_sayfalar/siparis/musteri_siparisleri/model/musteri_siparisleri_request_model.dart';

part 'musteri_siparisleri_view_model.g.dart';

class MusteriSiparisleriViewModel = _MusteriSiparisleriViewModelBase with _$MusteriSiparisleriViewModel;

abstract class _MusteriSiparisleriViewModelBase with Store {
  _MusteriSiparisleriViewModelBase({required this.pickerBelgeTuru});
  MusteriSiparisleriRequestModel get musteriSiparisleriRequestModel => MusteriSiparisleriRequestModel(
      pickerBelgeTuru: pickerBelgeTuru,
      iadeMi: false,
      faturalasmaGoster: true,
      miktarGetir: "H",
      siralama: siralama,
      sayfa: sayfa,
      searchText: searchText,
      kapaliBelgelerListelenmesin: kapaliBelgelerListelenmesin ? "E" : "H");
  final String? pickerBelgeTuru;
  @observable
  bool dahaVarMi = true;
  @observable
  bool grupKodlariGoster = false;

  @action
  void changeGrupKodlariGoster() => grupKodlariGoster = !grupKodlariGoster;
  @action
  void setDahaVarMi(bool value) => dahaVarMi = value;

  @action
  void increaseSayfa() => sayfa++;

  @action
  void resetSayfa() => sayfa = 1;

  @observable
  bool kapaliBelgelerListelenmesin = false;

  @action
  void setKapaliBelgelerListelenmesin(bool value) => kapaliBelgelerListelenmesin = value;

  @observable
  int sayfa = 1;

  @observable
  String siralama = "TARIH_ZA";

  @action
  void setSiralama(String value) => siralama = value;

  @observable
  String? searchText;

  @action
  void setSearchText(String? value) => searchText = value;
  @observable
  bool isScrolledDown = false;

  @action
  void changeIsScrolledDown(bool value) => isScrolledDown = value;
  @observable
  bool searchBar = false;

  @action
  void changeSearchBar() {
    searchBar = !searchBar;
    if (!searchBar) {
      searchText = null;
      setMusteriSiparisleriList(null);
      setDahaVarMi(true);
      resetSayfa();
    }
  }

  @observable
  List<MusteriSiparisleriModel?>? musteriSiparisleriList;
  @action
  void setMusteriSiparisleriList(List<MusteriSiparisleriModel?>? value) => musteriSiparisleriList = value;
  @action
  void addMusteriSiparisleriList(List<MusteriSiparisleriModel?>? value) => musteriSiparisleriList = musteriSiparisleriList! + value!;

  @computed
  String get getQueryParams => jsonEncode(musteriSiparisleriRequestModel.toJson());

  Map<String, String> siralaMap = {
    "Belge No (A-Z)": "BELGE_NO_AZ",
    "Belge No (Z-A)": "BELGE_NO_ZA",
    "Tarih (A-Z)": "TARIH_AZ",
    "Tarih (Z-A)": "TARIH_ZA",
    "Cari Adı (A-Z)": "CARI_ADI_AZ",
    "Cari Adı (Z-A)": "CARI_ADI_ZA",
    "Vade Günü (A-Z)": "VADE_GUNU_AZ",
    "Vade Günü (Z-A)": "VADE_GUNU_ZA",
  };
}
