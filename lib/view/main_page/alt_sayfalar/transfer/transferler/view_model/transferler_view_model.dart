import "package:flutter/material.dart";
import "package:mobx/mobx.dart";
import "package:picker/core/base/view_model/listable_mixin.dart";
import "package:picker/core/base/view_model/mobx_network_mixin.dart";
import "package:picker/core/base/view_model/pageable_mixin.dart";
import "package:picker/core/base/view_model/scroll_controllable_mixin.dart";
import "package:picker/core/base/view_model/searchable_mixin.dart";
import "package:picker/core/constants/enum/edit_tipi_enum.dart";
import "package:picker/core/init/cache/cache_manager.dart";
import "package:picker/core/init/network/login/api_urls.dart";
import "package:picker/view/main_page/alt_sayfalar/siparis/base_siparis_edit/model/base_siparis_edit_model.dart";
import "package:picker/view/main_page/alt_sayfalar/siparis/siparisler/model/siparisler_request_model.dart";

part "transferler_view_model.g.dart";

class TransferlerViewModel = _TransferlerViewModelBase with _$TransferlerViewModel;

abstract class _TransferlerViewModelBase with Store, MobxNetworkMixin, ListableMixin<BaseSiparisEditModel>, SearchableMixin, ScrollControllableMixin, PageableMixin {
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
  @override
  @observable
  bool isScrollDown = true;

  @override
  @observable
  bool isSearchBarOpen = false;

  @observable
  ObservableMap<String, bool> ekstraAlanlarMap = {
    "EK": CacheManager.getProfilParametre.siparisEkAlan,
    "MİK": CacheManager.getProfilParametre.siparisMiktar,
    "VADE": CacheManager.getProfilParametre.siparisVade,
  }.asObservable();

  @override
  @observable
  ObservableList<BaseSiparisEditModel>? observableList;

  @override
  @observable
  String? searchText;

  @observable
  SiparislerRequestModel faturaRequestModel = SiparislerRequestModel(siralama: "TARIH_ZA", ekranTipi: "L", iadeMi: false, faturalasmaGoster: true);

  @override
  @action
  void setObservableList(List<BaseSiparisEditModel>? list, [bool isFirst = false]) {
    if (isFirst) {
      observableList ??= CacheManager.getFaturaEditLists(editTipiEnum)?.asObservable();
      observableList = ((observableList?..addAll(list ?? [])) ?? list)?.asObservable();
    } else {
      observableList = list?.asObservable();
    }
  }

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

  @override
  Future<void> resetList() async {
    super.resetList();
    setDahaVarMi(true);
    resetPage();
    await getData();
  }

  @override
  @action
  Future<void> changeSearchBarStatus() async {
    isSearchBarOpen = !isSearchBarOpen;
    if (!isSearchBarOpen) {
      setSearchText(null);
      await resetList();
    }
  }

  @override
  Future<void> changeScrollStatus(ScrollPosition position) async {
    super.changeScrollStatus(position);
    if (position.pixels == position.maxScrollExtent && dahaVarMi) {
      await getData();
      isScrollDown = false;
    }
  }

  @action
  void setIsScrollDown(bool value) => isScrollDown = value;

  @action
  void increaseSayfa() => faturaRequestModel = faturaRequestModel.copyWith(sayfa: faturaRequestModel.sayfa! + 1);

  @action
  void setSiralama(String value) => faturaRequestModel = faturaRequestModel.copyWith(siralama: value);

  @action
  @override
  @action
  void setSearchText(String? value) => searchText = value;

  @override
  @action
  void addObservableList(List<BaseSiparisEditModel>? value) => setObservableList(observableList?..addAll(value ?? []));

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

  @override
  @action
  Future<void> getData() async {
    final result = await networkManager.dioGet<BaseSiparisEditModel>(
      path: ApiUrls.getFaturalar,
      bodyModel: BaseSiparisEditModel(),
      queryParameters: faturaRequestModel.copyWith(searchText: searchText, sayfa: page).toJson(),
    );
    if (result.isSuccess) {
      if (page > 1) {
        addObservableList(result.dataList);
      } else {
        setObservableList(result.dataList, true);
      }
      if (result.dataList.length >= parametreModel.sabitSayfalamaOgeSayisi) {
        setDahaVarMi(true);
        increasePage();
      } else {
        setDahaVarMi(false);
      }
    } else {
      if (!result.isSuccess) {
        setObservableList([]);
      }
    }
  }
}
