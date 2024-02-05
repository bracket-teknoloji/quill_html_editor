import "package:kartal/kartal.dart";
import "package:mobx/mobx.dart";
import "package:picker/core/base/view_model/mobx_network_mixin.dart";
import "package:picker/core/constants/enum/edit_tipi_enum.dart";
import "package:picker/core/init/cache/cache_manager.dart";
import "package:picker/core/init/network/login/api_urls.dart";
import "package:picker/view/main_page/alt_sayfalar/siparis/base_siparis_edit/model/base_siparis_edit_model.dart";
import "package:picker/view/main_page/alt_sayfalar/siparis/siparisler/model/siparisler_request_model.dart";

part "transferler_view_model.g.dart";

class TransferlerViewModel = _TransferlerViewModelBase with _$TransferlerViewModel;

abstract class _TransferlerViewModelBase with Store, MobxNetworkMixin {
  _TransferlerViewModelBase({required String pickerBelgeTuru, required this.editTipiEnum}) {
    faturaRequestModel = faturaRequestModel.copyWith(
      pickerBelgeTuru: pickerBelgeTuru,
      faturalasmaGoster: pickerBelgeTuru == "SF" ? true : null,
      miktarGetir: pickerBelgeTuru == "AF" ? "E" : null,
      belgeNo: pickerBelgeTuru == "AF" ? null : "",
    );
  }

  final Map<String, String> siralaMap = {
    "Belge No (A-Z)": "BELGE_NO_AZ",
    "Belge No (Z-A)": "BELGE_NO_ZA",
    "Tarih (A-Z)": "TARIH_AZ",
    "Tarih (Z-A)": "TARIH_ZA",
    "Cari Adı (A-Z)": "CARI_ADI_AZ",
    "Cari Adı (Z-A)": "CARI_ADI_ZA",
    "Vade Günü (A-Z)": "VADE_GUNU_AZ",
    "Vade Günü (Z-A)": "VADE_GUNU_ZA",
  };

  final Map<String, String?> transferTipiMap = {
    "Tümü": null,
    "Lokal": "E",
    "Şube": "H",
  };

  @observable
  late EditTipiEnum editTipiEnum;
  @observable
  bool isScrolledDown = true;

  @observable
  bool searchBar = false;

  @observable
  bool dahaVarMi = true;

  @observable
  ObservableMap<String, bool> ekstraAlanlarMap = {
    "EK": CacheManager.getProfilParametre.siparisEkAlan,
    "MİK": CacheManager.getProfilParametre.siparisMiktar,
    "VADE": CacheManager.getProfilParametre.siparisVade,
  }.asObservable();

  @observable
  ObservableList<BaseSiparisEditModel>? transferList;

  @observable
  SiparislerRequestModel faturaRequestModel = SiparislerRequestModel(sayfa: 1, siralama: "TARIH_ZA", ekranTipi: "L", iadeMi: false, faturalasmaGoster: true);

  @action
  void setTransferList(List<BaseSiparisEditModel>? list) => transferList = list?.asObservable();

  @action
  void changeEkstraAlanlarMap(String key, bool value) {
    ekstraAlanlarMap.remove(key);
    switch (key) {
      case "EK":
        CacheManager.setProfilParametre(CacheManager.getProfilParametre.copyWith(siparisEkAlan: value));
        ekstraAlanlarMap["EK"] = value;
      case "MİK":
        CacheManager.setProfilParametre(CacheManager.getProfilParametre.copyWith(siparisMiktar: value));
        ekstraAlanlarMap["MİK"] = value;
      case "VADE":
        CacheManager.setProfilParametre(CacheManager.getProfilParametre.copyWith(siparisVade: value));
        ekstraAlanlarMap["VADE"] = value;
    }
    ekstraAlanlarMap[key] = value;
  }

  @action
  void resetEkstraAlanlarMap() {
    CacheManager.setProfilParametre(CacheManager.getProfilParametre.copyWith(siparisEkAlan: false, siparisMiktar: false, siparisVade: false));
    ekstraAlanlarMap = {"EK": false, "MİK": false, "VADE": false}.asObservable();
  }

  @action
  Future<void> resetPage() async {
    setFaturaList(null);
    setDahaVarMi(true);
    resetSayfa();
    await getData();
  }

  @action
  Future<void> changeSearchBar() async {
    searchBar = !searchBar;
    if (!searchBar) {
      setSearchText(null);
      await resetPage();
    }
  }

  @action
  void setIsScrollDown(bool value) => isScrolledDown = value;

  @action
  void setDahaVarMi(bool value) => dahaVarMi = value;

  @action
  void increaseSayfa() => faturaRequestModel = faturaRequestModel.copyWith(sayfa: faturaRequestModel.sayfa! + 1);

  @action
  void setSiralama(String value) => faturaRequestModel = faturaRequestModel.copyWith(siralama: value);

  @action
  void resetSayfa() => faturaRequestModel = faturaRequestModel.copyWith(sayfa: 1);

  @action
  void setSearchText(String? value) => faturaRequestModel = faturaRequestModel.copyWith(searchText: value);

  @action
  void setFaturaList(List<BaseSiparisEditModel>? value) => transferList = value?.asObservable();

  @action
  void addFaturaList(List<BaseSiparisEditModel>? value) => transferList = transferList?..addAll(value ?? []);

  @action
  void setLokalDAT(String? value) => faturaRequestModel = faturaRequestModel.copyWith(lokalDAT: value);

  @action
  void setBaslangicTarihi(String? date) => faturaRequestModel = faturaRequestModel.copyWith(baslamaTarihi: date);

  @action
  void setBitisTarihi(String? date) => faturaRequestModel = faturaRequestModel.copyWith(bitisTarihi: date);

  @action
  void setOzelKod2(String? value) => faturaRequestModel = faturaRequestModel.copyWith(ozelKod2: value);

  @action
  void resetFilter() => faturaRequestModel = faturaRequestModel.copyWith(baslamaTarihi: null, bitisTarihi: null, ozelKod2: null, lokalDAT: null);

  @action
  Future<void> getData() async {
    final result = await networkManager.dioGet<BaseSiparisEditModel>(path: ApiUrls.getFaturalar, bodyModel: BaseSiparisEditModel(), queryParameters: faturaRequestModel.toJson());
    if (result.data is List) {
      final List<BaseSiparisEditModel> list = result.data.cast<BaseSiparisEditModel>();
      if ((faturaRequestModel.sayfa ?? 0) < 2) {
        setTransferList(CacheManager.getFaturaEditLists(editTipiEnum));
        // paramData = result.paramData?.map((key, value) => MapEntry(key, double.tryParse((value as String).replaceAll(",", ".")) ?? value)).asObservable();
        if (transferList.ext.isNullOrEmpty) {
          setTransferList(list);
        } else {
          addFaturaList(list);
        }
      } else {
        addFaturaList(list);
      }
      if (list.length < parametreModel.sabitSayfalamaOgeSayisi) {
        setDahaVarMi(false);
      } else {
        setDahaVarMi(true);
        increaseSayfa();
      }
    }
  }
}
