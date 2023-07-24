import 'dart:convert';

import 'package:mobx/mobx.dart';
import 'package:picker/view/main_page/alt_sayfalar/siparis/siparisler/model/siparisler_model.dart';
import 'package:picker/view/main_page/alt_sayfalar/siparis/siparisler/model/siparisler_request_model.dart';

part 'siparisler_view_model.g.dart';

class SiparislerViewModel = _SiparislerViewModelBase with _$SiparislerViewModel;

abstract class _SiparislerViewModelBase with Store {
  _SiparislerViewModelBase({required this.pickerBelgeTuru});
  SiparislerRequestModel get musteriSiparisleriRequestModel => SiparislerRequestModel(
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
  Map<String, String> paramData = {};

  @action
  void setParamData(Map<String, String> value) => paramData = value;

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
  bool isScrolledDown = true;

  @action
  void changeIsScrolledDown(bool value) => isScrolledDown = value;
  @observable
  bool searchBar = false;

  @action
  void changeSearchBar() {
    searchBar = !searchBar;
    if (!searchBar) {
      searchText = null;
      setSiparislerList(null);
      setDahaVarMi(true);
      resetSayfa();
    }
  }

  @observable
  List<SiparislerModel?>? musteriSiparisleriList;
  @action
  void setSiparislerList(List<SiparislerModel?>? value) => musteriSiparisleriList = value;
  @action
  void addSiparislerList(List<SiparislerModel?>? value) => musteriSiparisleriList = musteriSiparisleriList! + value!;

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
