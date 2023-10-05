import "dart:convert";

import "package:mobx/mobx.dart";
import "package:picker/core/base/view_model/mobx_network_mixin.dart";
import "package:picker/core/init/network/login/api_urls.dart";
import "package:picker/view/main_page/alt_sayfalar/cari/cari_listesi/model/cari_listesi_model.dart";
import "package:picker/view/main_page/alt_sayfalar/finans/banka/banka_islemleri/model/banka_islemleri_model.dart";
import "package:picker/view/main_page/alt_sayfalar/finans/banka/banka_islemleri/model/banka_islemleri_request_model.dart";
import "package:picker/view/main_page/model/param_model.dart";

part "banka_islemleri_view_model.g.dart";

class BankaIslemleriViewModel = _BankaIslemleriViewModelBase with _$BankaIslemleriViewModel;

abstract class _BankaIslemleriViewModelBase with Store, MobxNetworkMixin {
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
  BankaIslemleriRequestModel bankaIslemleriRequestModel = BankaIslemleriRequestModel(sayfa: 1, menuKodu: "YONE_KISL");
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
  ObservableList<BankaIslemleriModel>? bankaIslemleriListesi;

  @observable
  String? searchText;

  //* Computed
  ObservableList<BankaIslemleriModel>? get getBankaIslemleriListesi => searchText != null
      ? bankaIslemleriListesi
          ?.where(
              (element) => (element.belgeNo?.contains(searchText ?? "") ?? false) || (element.cariAdi?.contains(searchText ?? "") ?? false) || (element.cariKodu?.contains(searchText ?? "") ?? false))
          .toList()
          .asObservable()
      : bankaIslemleriListesi;

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
  void incrementSayfa() => bankaIslemleriRequestModel = bankaIslemleriRequestModel.copyWith(sayfa: (bankaIslemleriRequestModel.sayfa ?? 0) + 1);

  @action
  void resetSayfa() => bankaIslemleriRequestModel = bankaIslemleriRequestModel.copyWith(sayfa: 1);

  @action
  void setBaslamaTarihi(String? value) => bankaIslemleriRequestModel = bankaIslemleriRequestModel.copyWith(baslamaTarihi: value);

  @action
  void setBitisTarihi(String? value) => bankaIslemleriRequestModel = bankaIslemleriRequestModel.copyWith(bitisTarihi: value);

  @action
  void setBankaIslemleriListesi(List<BankaIslemleriModel>? value) => bankaIslemleriListesi = value?.asObservable();

  @action
  void addBankaIslemleriListesi(List<BankaIslemleriModel>? value) => bankaIslemleriListesi?.addAll(value ?? []);

  @action
  void setHesapTipi(String? value) {
    hesapTipiGroupValue = value;
    bankaIslemleriRequestModel = bankaIslemleriRequestModel.copyWith(hesapTipi: value, gc: value);
  }

  @action
  void setKasaKodu(KasaList? value) => bankaIslemleriRequestModel = bankaIslemleriRequestModel.copyWith(kasaKodu: value?.kasaKodu);

  @action
  void setCariKodu(CariListesiModel? value) => bankaIslemleriRequestModel = bankaIslemleriRequestModel.copyWith(hesapKodu: value?.cariKodu);

  @action
  void setPlasiyerKodu(PlasiyerList? value) => bankaIslemleriRequestModel = bankaIslemleriRequestModel.copyWith(plasiyerKodu: value?.plasiyerKodu);

  @action
  void clearFilters() {
    bankaIslemleriRequestModel = bankaIslemleriRequestModel.copyWith(hesapKodu: null, plasiyerKodu: null, hesapTipi: null);
  }

  @action
  Future<void> resetPage() async {
    resetSayfa();
    bankaIslemleriListesi = null;
    await getData();
  }

  @action
  Future<void> getData() async {
    var result = await networkManager
        .dioGet<BankaIslemleriModel>(path: ApiUrls.getKasaHareketleri, bodyModel: BankaIslemleriModel(), queryParameters: {"FilterModel": jsonEncode(bankaIslemleriRequestModel.toJson())});
    if (result.data is List) {
      List<BankaIslemleriModel> list = result.data.cast<BankaIslemleriModel>();
      if ((bankaIslemleriRequestModel.sayfa ?? 0) < 2) {
        paramData = result.paramData?.map((key, value) => MapEntry(key, double.tryParse((value as String).replaceAll(",", ".")) ?? value)).asObservable();
        setBankaIslemleriListesi(list);
      } else {
        addBankaIslemleriListesi(list);
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
