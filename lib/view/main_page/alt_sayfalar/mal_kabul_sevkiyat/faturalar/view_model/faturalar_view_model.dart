import "dart:convert";

import "package:collection/collection.dart";
import "package:flutter/material.dart";
import "package:kartal/kartal.dart";
import "package:mobx/mobx.dart";
import "package:picker/core/base/view_model/pageable_mixin.dart";
import "package:picker/core/base/view_model/scroll_controllable_mixin.dart";

import "../../../../../../core/base/model/base_grup_kodu_model.dart";
import "../../../../../../core/base/view_model/listable_mixin.dart";
import "../../../../../../core/base/view_model/mobx_network_mixin.dart";
import "../../../../../../core/constants/enum/edit_tipi_enum.dart";
import "../../../../../../core/init/cache/cache_manager.dart";
import "../../../../../../core/init/network/login/api_urls.dart";
import "../../../siparis/base_siparis_edit/model/base_siparis_edit_model.dart";
import "../../../siparis/siparisler/model/siparisler_request_model.dart";

part "faturalar_view_model.g.dart";

final class FaturalarViewModel = _FaturalarViewModelBase with _$FaturalarViewModel;

abstract class _FaturalarViewModelBase with Store, MobxNetworkMixin, ListableMixin<BaseSiparisEditModel>, ScrollControllableMixin, PageableMixin {
  _FaturalarViewModelBase({required String pickerBelgeTuru, required this.editTipiEnum}) {
    faturaRequestModel = faturaRequestModel.copyWith(
      pickerBelgeTuru: pickerBelgeTuru,
      faturalasmaGoster: pickerBelgeTuru == "SF" ? true : null,
      miktarGetir: pickerBelgeTuru == "AF" ? "E" : null,
      belgeNo: pickerBelgeTuru == "AF" ? null : "",
      kapaliBelgelerListelenmesin: CacheManager.getProfilParametre.kapaliBelgelerListelenmesinMi,
      faturalanmisIrsaliyelerGelsin: CacheManager.getProfilParametre.irsFaturalasanIrsaliyelerGelsin,
    );
  }

  //*for view
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

  final Map<String, dynamic> tipiMap = {
    "Alıcı": "A",
    "Satıcı": "S",
    "Toptancı": "T",
    "Kefil": "K",
    "Müstahsil": "M",
    "Diğer": "D",
    "Komisyoncu": "I",
  };

  final Map<String, int> belgeTipiMap = <String, int>{
    "Kapalı": 1,
    "Açık": 2,
    "İade": 4,
    "Zayi İade": 5,
    "İhracat": 6,
  };

  final List<String> tipiList = ["T", "H", "N", "D"];

  @observable
  bool kodlariGoster = false;

  @observable
  late EditTipiEnum editTipiEnum;

  @observable
  ObservableMap<String, bool> ekstraAlanlarMap = {
    "EK": CacheManager.getProfilParametre.siparisEkAlan,
    "MİK": CacheManager.getProfilParametre.siparisMiktar,
    "VADE": CacheManager.getProfilParametre.siparisVade,
  }.asObservable();

  @observable
  SiparislerRequestModel faturaRequestModel = SiparislerRequestModel(sayfa: 1, siralama: "TARIH_ZA", ekranTipi: "L", iadeMi: false, faturalasmaGoster: true);

  @observable
  ObservableMap<String, dynamic>? paramData;

  @override
  @observable
  bool isScrollDown = true;

  @observable
  bool searchBar = false;

  @observable
  bool grupKodlariGoster = false;

  @override
  @observable
  ObservableList<BaseSiparisEditModel>? observableList;

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

  @observable
  List<String?> teslimatDurumuValueList = const [null, "K", "B"];

  @observable
  List<BaseGrupKoduModel>? grupKodList;

  @computed
  ObservableList<BaseGrupKoduModel>? get getGrupKod0 => grupKodList?.where((element) => element.grupNo == 0).toList().asObservable();

  @computed
  ObservableList<BaseGrupKoduModel>? get getGrupKod1 => grupKodList?.where((element) => element.grupNo == 1).toList().asObservable();

  @computed
  ObservableList<BaseGrupKoduModel>? get getGrupKod2 => grupKodList?.where((element) => element.grupNo == 2).toList().asObservable();

  @computed
  ObservableList<BaseGrupKoduModel>? get getGrupKod3 => grupKodList?.where((element) => element.grupNo == 3).toList().asObservable();

  @computed
  ObservableList<BaseGrupKoduModel>? get getGrupKod4 => grupKodList?.where((element) => element.grupNo == 4).toList().asObservable();

  @computed
  ObservableList<BaseGrupKoduModel>? get getGrupKod5 => grupKodList?.where((element) => element.grupNo == 5).toList().asObservable();

  @action
  void changeArrKod0(List<String?> value) => faturaRequestModel = faturaRequestModel.copyWith(arrGrupKodu: jsonEncode(value));

  @action
  void changeArrKod1(List<String?> value) => faturaRequestModel = faturaRequestModel.copyWith(arrKod1: jsonEncode(value));

  @action
  void changeArrKod2(List<String?> value) => faturaRequestModel = faturaRequestModel.copyWith(arrKod2: jsonEncode(value));

  @action
  void changeArrKod3(List<String?> value) => faturaRequestModel = faturaRequestModel.copyWith(arrKod3: jsonEncode(value));

  @action
  void changeArrKod4(List<String?> value) => faturaRequestModel = faturaRequestModel.copyWith(arrKod4: jsonEncode(value));

  @action
  void changeArrKod5(List<String?> value) => faturaRequestModel = faturaRequestModel.copyWith(arrKod5: jsonEncode(value));

  @action
  void setKodlariGoster() {
    kodlariGoster = !kodlariGoster;
    if (grupKodList.ext.isNullOrEmpty) {
      getKod();
    }
  }

  @action
  void setBelgeTipi(List<int>? value) => faturaRequestModel = faturaRequestModel.copyWith(arrBelgeTipi: jsonEncode(value));

  @action
  void changeGrupKodList(List<BaseGrupKoduModel> value) => grupKodList = value.asObservable();

  @action
  @override
  Future<void> changeScrollStatus(ScrollPosition position) async {
    super.changeScrollStatus(position);
    if (position.pixels == position.maxScrollExtent && dahaVarMi) {
      await getData();
      isScrollDown = false;
    }
  }

  @action
  void setParamData(Map<String, dynamic> value) => paramData = value.map((key, value) => MapEntry(key, double.tryParse((value as String).replaceAll(",", ".")) ?? value)).asObservable();

  @action
  void changeGrupKodlariGoster() => grupKodlariGoster = !grupKodlariGoster;

  @action
  void increaseSayfa() => faturaRequestModel = faturaRequestModel.copyWith(sayfa: faturaRequestModel.sayfa! + 1);

  @action
  void resetSayfa() => faturaRequestModel = faturaRequestModel.copyWith(sayfa: 1);

  @action
  void setSearchText(String? value) => faturaRequestModel = faturaRequestModel.copyWith(searchText: value);

  @action
  void setFaturalasmaGoster(bool value) {
    CacheManager.setProfilParametre(CacheManager.getProfilParametre.copyWith(irsFaturalasanIrsaliyelerGelsin: value));
    faturaRequestModel = faturaRequestModel.copyWith(faturalanmisIrsaliyelerGelsin: value);
  }

  @action
  void setKapaliBelgelerListelenmesin(bool value) {
    CacheManager.setProfilParametre(CacheManager.getProfilParametre.copyWith(kapaliBelgelerListelenmesinMi: value));
    faturaRequestModel = faturaRequestModel.copyWith(kapaliBelgelerListelenmesin: value);
  }

  @override
  @action
  void setObservableList(List<BaseSiparisEditModel>? value) => observableList = value?.asObservable();

  @override
  @action
  void addObservableList(List<BaseSiparisEditModel>? value) => setObservableList(observableList?..addAll(value!));

  @action
  void setSiralama(String value) => faturaRequestModel = faturaRequestModel.copyWith(siralama: value);

  @action
  void setBaslamaTarihi(String? value) => faturaRequestModel = faturaRequestModel.copyWith(baslamaTarihi: value);

  @action
  void setBitisTarihi(String? value) => faturaRequestModel = faturaRequestModel.copyWith(bitisTarihi: value);

  @action
  void setPlasiyerArr(List<String?> value) => faturaRequestModel = faturaRequestModel.copyWith(arrPlasiyerKodu: jsonEncode(value));

  @action
  void setProjeKodu(String? value) => faturaRequestModel = faturaRequestModel.copyWith(projeKodu: value);

  @action
  void setOzelKod1(String? value) => faturaRequestModel = faturaRequestModel.copyWith(ozelKod1: value);

  @action
  void setOzelKod2(String? value) => faturaRequestModel = faturaRequestModel.copyWith(ozelKod2: value);

  @action
  void setCari(String? value) => faturaRequestModel = faturaRequestModel.copyWith(cariKodu: value);

  @action
  void setTeslimCari(String? value) => faturaRequestModel = faturaRequestModel.copyWith(teslimCariKodu: value);

  @action
  void setCariTipi(String? value) => faturaRequestModel = faturaRequestModel.copyWith(cariTipi: value);

  @action
  Future<void> changeSearchBar() async {
    searchBar = !searchBar;
    if (!searchBar) {
      setSearchText(null);
      await resetList();
    }
  }

  @action
  void resetFilter() => faturaRequestModel = faturaRequestModel.copyWith(
        searchText: null,
        ozelKod1: null,
        ozelKod2: null,
        arrGrupKodu: null,
        cariKodu: "",
        cariTipi: null,
        arrPlasiyerKodu: null,
        projeKodu: null,
        arrKod1: null,
        arrKod2: null,
        arrKod3: null,
        arrKod4: null,
        arrKod5: null,
        baslamaTarihi: null,
        bitisTarihi: null,
      );
  @override
  @action
  Future<void> resetList() async {
    resetPage();
    await getData();
  }

  @action
  Future<void> getKod() async {
    final responseKod = await networkManager.dioGet<BaseGrupKoduModel>(
      path: ApiUrls.getGrupKodlari,
      bodyModel: BaseGrupKoduModel(),
      headers: {"Modul": "CARI", "GrupNo": "-1", "Kullanimda": "E"},
      queryParameters: {"Modul": "CARI", "GrupNo": "-1"},
    );
    if (responseKod.isSuccess) {
      changeGrupKodList(responseKod.dataList);
    }
  }

  @override
  @action
  Future<void> getData() async {
    final result = await networkManager.dioGet<BaseSiparisEditModel>(path: ApiUrls.getFaturalar, bodyModel: BaseSiparisEditModel(), queryParameters: faturaRequestModel.toJson());
    if (result.isSuccess) {
      if (page > 1) {
        addObservableList(result.dataList);
      } else {
        setObservableList(
          ((CacheManager.getFaturaEditLists(editTipiEnum)?.toList().cast<BaseSiparisEditModel>() ?? <BaseSiparisEditModel>[])..mapIndexed((index, element) => element..index = index).toList()) +
              result.dataList,
        );
        setParamData(result.paramData ?? {});
      }
      if (result.dataList.length >= parametreModel.sabitSayfalamaOgeSayisi) {
        setDahaVarMi(true);
        increasePage();
      } else {
        setDahaVarMi(false);
      }
    }
  }
}
