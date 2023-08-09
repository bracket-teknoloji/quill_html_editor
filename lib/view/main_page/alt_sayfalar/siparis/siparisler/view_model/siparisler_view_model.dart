import 'dart:convert';

import 'package:mobx/mobx.dart';
import 'package:picker/view/main_page/alt_sayfalar/siparis/siparisler/model/siparisler_request_model.dart';

import '../../base_siparis_edit/model/base_siparis_edit_model.dart';

part 'siparisler_view_model.g.dart';

class SiparislerViewModel = _SiparislerViewModelBase with _$SiparislerViewModel;

abstract class _SiparislerViewModelBase with Store {
  _SiparislerViewModelBase({required this.pickerBelgeTuru});
  //*for view
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
  List<String> teslimatDurumu = const ["Tümü", "Beklemede", "Tamamlandı"];

  @observable
  List<String?> teslimatDurumuValueList = const [null, "K", "B"];

  @observable
  String? teslimatDurumuGroupValue;

  @action
  void setTeslimatDurumuGroupValue(int? value) {
    teslimatDurumuGroupValue = teslimatDurumuValueList[value!];
  }

  @observable
  Map<String, String> paramData = {};

  @observable
  bool isScrolledDown = true;

  @action
  void changeIsScrolledDown(bool value) => isScrolledDown = value;
  @observable
  bool searchBar = false;
  @action
  void setParamData(Map<String, String> value) => paramData = value;

  @observable
  bool dahaVarMi = true;
  @observable
  bool grupKodlariGoster = false;
  @observable
  List<BaseSiparisEditModel?>? musteriSiparisleriList;

  @action
  void changeGrupKodlariGoster() => grupKodlariGoster = !grupKodlariGoster;
  @action
  void setDahaVarMi(bool value) => dahaVarMi = value;

  @action
  void increaseSayfa() => sayfa++;

  @action
  void resetSayfa() => sayfa = 1;

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

  @action
  void setSiparislerList(List<BaseSiparisEditModel?>? value) => musteriSiparisleriList = value;
  @action
  void addSiparislerList(List<BaseSiparisEditModel?>? value) => musteriSiparisleriList = musteriSiparisleriList! + value!;

  //*for model
  SiparislerRequestModel get musteriSiparisleriRequestModel => SiparislerRequestModel(
        pickerBelgeTuru: pickerBelgeTuru,
        kapaliBelgelerListelenmesin: kapaliBelgelerListelenmesin ? "E" : "H",
        sayfa: sayfa,
        siralama: siralama,
        searchText: searchText,
        projeKodu: projeKodu,
        arrPlasiyerKodu: getPlasiyer,
        arrGrupKodu: getGrupKodlari,
        arrKod1: getKod1,
        arrKod2: getKod2,
        arrKod3: getKod3,
        arrKod4: getKod4,
        arrKod5: getKod5,
        cariKodu: cariKodu ?? "",
        ekranTipi: "L",
        cariTipi: cariTipi,
        baslamaTarihi: baslamaTarihi,
        bitisTarihi: bitisTarihi,
        iadeMi: false,
        siparisKarsilanmaDurumu: teslimatDurumuGroupValue,
        faturalasmaGoster: true,
        miktarGetir: "H",
      );

  final String? pickerBelgeTuru;

  @observable
  bool kapaliBelgelerListelenmesin = false;

  @observable
  int sayfa = 1;

  @observable
  String siralama = "TARIH_ZA";

  @observable
  String? searchText;

  @observable
  String? projeKodu;

  @observable
  List<String>? arrPlasiyerKodu;

  @observable
  List<String>? arrGrupKodu;

  @observable
  List<String>? arrKod1;

  @observable
  List<String>? arrKod2;

  @observable
  List<String>? arrKod3;

  @observable
  List<String>? arrKod4;

  @observable
  List<String>? arrKod5;

  @observable
  String? cariKodu;

  @observable
  String? cariTipi;

  @observable
  String? baslamaTarihi;

  @observable
  String? bitisTarihi;

  @action
  void setSiralama(String value) => siralama = value;

  @action
  void setKapaliBelgelerListelenmesin(bool value) => kapaliBelgelerListelenmesin = value;
  @action
  void setSearchText(String? value) => searchText = value;
  @action
  void setProjeKodu(String? value) => projeKodu = value;
  @action
  void setArrPlasiyerKodu(List<String>? value) => arrPlasiyerKodu = value;
  @action
  void setArrGrupKodu(List<String>? value) => arrGrupKodu = value;
  @action
  void setArrKod1(List<String>? value) => arrKod1 = value;
  @action
  void setArrKod2(List<String>? value) => arrKod2 = value;
  @action
  void setArrKod3(List<String>? value) => arrKod3 = value;
  @action
  void setArrKod4(List<String>? value) => arrKod4 = value;
  @action
  void setArrKod5(List<String>? value) => arrKod5 = value;
  @action
  void setCariKodu(String? value) => cariKodu = value;
  @action
  void setCariTipi(String? value) => cariTipi = value;
  @action
  void setBaslamaTarihi(String? value) => baslamaTarihi = value;
  @action
  void setBitisTarihi(String? value) => bitisTarihi = value;

  @action
  void resetFilter() {
    setArrGrupKodu(null);
    setArrKod1(null);
    setArrKod2(null);
    setArrKod3(null);
    setArrKod4(null);
    setArrKod5(null);
    setBaslamaTarihi(null);
    setBitisTarihi(null);
    setSiparislerList(null);
    setDahaVarMi(true);
    setProjeKodu(null);
    setCariKodu(null);
    setArrPlasiyerKodu(null);
    setSiralama("TARIH_ZA");
    setKapaliBelgelerListelenmesin(false);
    setSearchText(null);
    setCariTipi(null);
    resetSayfa();
  }

  //* getters
  @computed
  String get getQueryParams => jsonEncode(musteriSiparisleriRequestModel.toJson());

  @computed
  String? get getPlasiyer => arrPlasiyerKodu != null ? jsonEncode(arrPlasiyerKodu) : null;

  @computed
  String? get getGrupKodlari => arrGrupKodu != null ? jsonEncode(arrGrupKodu) : null;

  @computed
  String? get getKod1 => arrKod1 != null ? jsonEncode(arrKod1) : null;

  @computed
  String? get getKod2 => arrKod2 != null ? jsonEncode(arrKod2) : null;

  @computed
  String? get getKod3 => arrKod3 != null ? jsonEncode(arrKod3) : null;

  @computed
  String? get getKod4 => arrKod4 != null ? jsonEncode(arrKod4) : null;

  @computed
  String? get getKod5 => arrKod5 != null ? jsonEncode(arrKod5) : null;
}
