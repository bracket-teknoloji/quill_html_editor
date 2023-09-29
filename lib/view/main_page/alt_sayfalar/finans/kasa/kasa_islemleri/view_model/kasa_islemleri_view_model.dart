import "dart:convert";

import "package:mobx/mobx.dart";
import "package:picker/core/base/view_model/mobx_network_mixin.dart";
import "package:picker/core/init/network/login/api_urls.dart";
import "package:picker/view/main_page/alt_sayfalar/cari/cari_listesi/model/cari_listesi_model.dart";
import "package:picker/view/main_page/alt_sayfalar/finans/kasa/kasa_islemleri/model/kasa_islemleri_model.dart";
import "package:picker/view/main_page/alt_sayfalar/finans/kasa/kasa_islemleri/model/kasa_islemleri_request_model.dart";
import "package:picker/view/main_page/model/param_model.dart";

part "kasa_islemleri_view_model.g.dart";

class KasaIslemleriViewModel = _KasaIslemleriViewModelBase with _$KasaIslemleriViewModel;

abstract class _KasaIslemleriViewModelBase with Store, MobxNetworkMixin {
  Map<String, dynamic> get filtreMap => {
        "BaslamaTarihi": "baslamaTarihi",
        "BitisTarihi": "bitisTarihi",
        "MenuKodu": "YONE_KISL",
        "Sayfa": 1,
        "PlasiyerKodu": "plasiyerKodu",
        "HesapTipi": "hesapTipiGroupValue",
      };
  Map<String, dynamic> hesapTipiMap = {
    "Tümü": null,
    "Gelir": "G",
    "Gider": "C",
  };

  //* Observables
  @observable
  KasaIslemleriRequestModel kasaIslemleriRequestModel = KasaIslemleriRequestModel(sayfa: 1, menuKodu: "YONE_KISL");
  @observable
  String? hesapTipiGroupValue;
  @observable
  ObservableMap<String, dynamic>? paramData;
  @observable
  bool isScrollDown = true;

  @observable
  bool dahaVarMi = true;
  @observable
  bool searchBar = false;

  @observable
  ObservableList<KasaIslemleriModel>? kasaIslemleriListesi;

  @observable
  String? searchText;

  //* Computed
  ObservableList<KasaIslemleriModel>? get getKasaIslemleriListesi => searchText != null
      ? kasaIslemleriListesi
          ?.where(
              (element) => (element.belgeNo?.contains(searchText ?? "") ?? false) || (element.cariAdi?.contains(searchText ?? "") ?? false) || (element.cariKodu?.contains(searchText ?? "") ?? false))
          .toList()
          .asObservable()
      : kasaIslemleriListesi;

  //* Actions
  @action
  void setDahaVarMi(bool value) => dahaVarMi = value;

  @action
  void setIsScrollDown(bool value) => isScrollDown = value;

  @action
  void changeSearchBar() {
    searchBar = !searchBar;
    searchText = null;
  }

  @action
  void setSearchText(String? value) => searchText = value;
  @action
  void incrementSayfa() => kasaIslemleriRequestModel = kasaIslemleriRequestModel.copyWith(sayfa: (kasaIslemleriRequestModel.sayfa ?? 0) + 1);

  @action
  void resetSayfa() => kasaIslemleriRequestModel = kasaIslemleriRequestModel.copyWith(sayfa: 1);

  @action
  void setBaslamaTarihi(String? value) => kasaIslemleriRequestModel = kasaIslemleriRequestModel.copyWith(baslamaTarihi: value);

  @action
  void setBitisTarihi(String? value) => kasaIslemleriRequestModel = kasaIslemleriRequestModel.copyWith(bitisTarihi: value);

  @action
  void setKasaIslemleriListesi(List<KasaIslemleriModel>? value) => kasaIslemleriListesi = value?.asObservable();

  @action
  void addKasaIslemleriListesi(List<KasaIslemleriModel>? value) => kasaIslemleriListesi?.addAll(value ?? []);

  @action
  void setHesapTipi(String? value) {
    hesapTipiGroupValue = value;
    kasaIslemleriRequestModel = kasaIslemleriRequestModel.copyWith(hesapTipi: value);
  }

  @action
  void setKasaKodu(KasaList? value) => kasaIslemleriRequestModel = kasaIslemleriRequestModel.copyWith(kasaKodu: value?.kasaKodu);

  @action
  void setCariKodu(CariListesiModel? value) => kasaIslemleriRequestModel = kasaIslemleriRequestModel.copyWith(hesapKodu: value?.cariKodu);

  @action
  void setPlasiyerKodu(PlasiyerList? value) => kasaIslemleriRequestModel = kasaIslemleriRequestModel.copyWith(plasiyerKodu: value?.plasiyerKodu);


  @action
  void clearFilters() {
    kasaIslemleriRequestModel = kasaIslemleriRequestModel.copyWith(hesapKodu: null, plasiyerKodu: null, hesapTipi: null);
  }

  @action
  Future<void> resetPage() async {
    resetSayfa();
    kasaIslemleriListesi = null;
    await getData();
  }

  @action
  Future<void> getData() async {
    var result = await networkManager
        .dioGet<KasaIslemleriModel>(path: ApiUrls.getKasaHareketleri, bodyModel: KasaIslemleriModel(), queryParameters: {"FilterModel": jsonEncode(kasaIslemleriRequestModel.toJson())});
    if (result.data is List) {
      List<KasaIslemleriModel> list = result.data.cast<KasaIslemleriModel>();
      if ((kasaIslemleriRequestModel.sayfa ?? 0) < 2) {
        paramData = result.paramData?.map((key, value) => MapEntry(key, double.tryParse((value as String).replaceAll(",", ".")) ?? value)).asObservable();
        setKasaIslemleriListesi(list);
      } else {
        addKasaIslemleriListesi(list);
      }
      if (list.length < parametreModel.sabitSayfalamaOgeSayisi) {
        setDahaVarMi(false);
      } else {
        setDahaVarMi(true);
        incrementSayfa();
      }
    }
  }
}
