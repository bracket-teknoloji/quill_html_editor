import "dart:convert";
import "dart:developer";

import "package:flutter/material.dart";
import "package:mobx/mobx.dart";

import "../../../../../../core/base/model/base_grup_kodu_model.dart";
import "../../../../../../core/base/view_model/listable_mixin.dart";
import "../../../../../../core/base/view_model/mobx_network_mixin.dart";
import "../../../../../../core/base/view_model/pageable_mixin.dart";
import "../../../../../../core/base/view_model/scroll_controllable_mixin.dart";
import "../../../../../../core/init/network/login/api_urls.dart";
import "../model/cari_listesi_model.dart";
import "../model/cari_request_model.dart";
import "../model/cari_sehirler_model.dart";

part "cari_listesi_view_model.g.dart";

class CariListesiViewModel = _CariListesiViewModelBase with _$CariListesiViewModel;

abstract class _CariListesiViewModelBase with Store, MobxNetworkMixin, ListableMixin<CariListesiModel>, ScrollControllableMixin, PageableMixin {
  final Map<String, String> bakiyeMap = {"Tümü": "", "Tahsil Edilecek": "T", "Ödenecek": "Ö", "Sıfır Bakiye": "S", "Bakiyeli": "B"};

  final Map<String, String> siralaMap = {
    "Cari Adı (A-Z)": "AZ",
    "Cari Adı (Z-A)": "ZA",
    "Bakiye (0-9)": "BAKIYE_AZ",
    "Bakiye (9-0)": "BAKIYE_ZA",
    "Döviz Bakiye (0-9)": "DOVIZ_BAKIYE_AZ",
    "Döviz Bakiye (9-0)": "DOVIZ_BAKIYE_ZA",
    "Cari Kodu (A-Z)": "CARI_KODU_AZ",
    "Cari Kodu (Z-A)": "CARI_KODU_ZA",
    "Kayıt Tarihi (Artan)": "KAYITTAR_ASC",
    "Kayıt Tarihi (Azalan)": "KAYITTAR_DESC",
    "Konum (En Yakın)": "KONUM_AZ",
    "Konum (En Uzak)": "KONUM_ZA",
  };

  @observable
  ObservableMap<String, dynamic>? paramData;

  @observable
  String? errorText;

  @override
  @observable
  bool isScrollDown = true;

  @observable
  bool searchBar = false;

  @observable
  String arama = "";

  @override
  @observable
  ObservableList<CariListesiModel>? observableList;

  @observable
  bool kodlariGoster = false;

  @observable
  List<BaseGrupKoduModel>? grupKodlari;

  @observable
  List<CariSehirlerModel>? sehirler;

  @observable
  CariRequestModel cariRequestModel = CariRequestModel(eFaturaGoster: true, siralama: "AZ", sayfa: 1, menuKodu: "CARI_CARI", filterText: "");

  @observable
  CariRequestModel cariRequestModelTemp = CariRequestModel(eFaturaGoster: true, siralama: "AZ", sayfa: 1, menuKodu: "CARI_CARI", filterText: "");

  //* Computed

  @computed
  bool get getRota => cariRequestModel.rotaDisi == "E";

  @computed
  Map<String, dynamic> get getCariRequestModel => cariRequestModel.toJson().map((key, value) => MapEntry(key, value is List ? jsonEncode(value) : value));

  @computed
  ObservableList<BaseGrupKoduModel>? get getGrupKod0 => grupKodlari?.where((element) => element.grupNo == 0).toList().asObservable();

  @computed
  ObservableList<BaseGrupKoduModel>? get getGrupKod1 => grupKodlari?.where((element) => element.grupNo == 1).toList().asObservable();

  @computed
  ObservableList<BaseGrupKoduModel>? get getGrupKod2 => grupKodlari?.where((element) => element.grupNo == 2).toList().asObservable();

  @computed
  ObservableList<BaseGrupKoduModel>? get getGrupKod3 => grupKodlari?.where((element) => element.grupNo == 3).toList().asObservable();

  @computed
  ObservableList<BaseGrupKoduModel>? get getGrupKod4 => grupKodlari?.where((element) => element.grupNo == 4).toList().asObservable();

  @computed
  ObservableList<BaseGrupKoduModel>? get getGrupKod5 => grupKodlari?.where((element) => element.grupNo == 5).toList().asObservable();

  @computed
  bool get hasAnyFilters =>
      cariRequestModel.arrGrupKodu != null ||
      cariRequestModel.arrKod1 != null ||
      cariRequestModel.arrKod2 != null ||
      cariRequestModel.arrKod3 != null ||
      cariRequestModel.arrKod4 != null ||
      cariRequestModel.arrKod5 != null ||
      cariRequestModel.arrSehir != null ||
      cariRequestModel.arrPlasiyerKodu != null ||
      cariRequestModel.ilce != null ||
      cariRequestModel.cariTipi != null ||
      (cariRequestModel.filterBakiye != "" && cariRequestModel.filterBakiye != null);

  //* SAYFA

  @action
  void changeKodlariGoster() {
    kodlariGoster = !kodlariGoster;
    if (grupKodlari == null) {
      getKod();
    }
  }

  @action
  void setRota(bool value) => cariRequestModel = cariRequestModel.copyWith(rotaDisi: value ? "E" : null);

  @action
  void increaseSayfa() => cariRequestModel = cariRequestModel.copyWith(sayfa: (cariRequestModel.sayfa ?? 0) + 1);

  @action
  void resetSayfa() => cariRequestModel = cariRequestModel.copyWith(sayfa: 1);

  //* SEARCH BAR
  @action
  void changeSearchBar() => searchBar = !searchBar;

  //* ARAMA
  @action
  void changeArama(String value) => arama = value;

  //* CARİ LİSTESİ
  @override
  @action
  void setObservableList(List<CariListesiModel>? value) => observableList = value?.asObservable();

  @action
  void setParamData(Map<String, dynamic>? value) => paramData = value?.asObservable();

  @override
  @action
  void addObservableList(List<CariListesiModel>? value) => setObservableList(observableList?..addAll(value!));

  //* SCROLL

  @action
  @override
  Future<void> changeScrollStatus(ScrollPosition position) async {
    super.changeScrollStatus(position);
    if (position.pixels == position.maxScrollExtent && dahaVarMi) {
      await getData();
      isScrollDown = false;
    }
  }

  //* DAHA VAR MI
  @action
  void changeDahaVarMi(bool value) => dahaVarMi = value;

  @action
  void changeSiralama(String? value) => cariRequestModel = cariRequestModel.copyWith(siralama: value);

  @action
  void changeFilterText(String? value) => cariRequestModel = cariRequestModel.copyWith(filterText: value ?? "");

  @action
  void changeFilterBakiye(String? value) => cariRequestModel = cariRequestModel.copyWith(filterBakiye: value ?? "");

  @action
  void changeArrPlasiyerKodu(List<String>? value) => cariRequestModel = cariRequestModel.copyWith(arrPlasiyerKodu: value);

  @action
  void changeArrGrupKodu(List<String>? value) => cariRequestModel = cariRequestModel.copyWith(arrGrupKodu: value);

  @action
  void changeArrSehir(List<String>? value) => cariRequestModel = cariRequestModel.copyWith(arrSehir: value);

  @action
  void changeArrKod0(List<String>? value) => cariRequestModel = cariRequestModel.copyWith(arrGrupKodu: value);

  @action
  void changeArrKod1(List<String>? value) => cariRequestModel = cariRequestModel.copyWith(arrKod1: value);

  @action
  void changeArrKod2(List<String>? value) => cariRequestModel = cariRequestModel.copyWith(arrKod2: value);

  @action
  void changeArrKod3(List<String>? value) => cariRequestModel = cariRequestModel.copyWith(arrKod3: value);

  @action
  void changeArrKod4(List<String>? value) => cariRequestModel = cariRequestModel.copyWith(arrKod4: value);

  @action
  void changeArrKod5(List<String>? value) => cariRequestModel = cariRequestModel.copyWith(arrKod5: value);

  @action
  void changeIlce(String? value) => cariRequestModel = cariRequestModel.copyWith(ilce: value);

  @action
  void changeCariTipi(String? value) => cariRequestModel = cariRequestModel.copyWith(cariTipi: value);

  @action
  void changeSiralamaTemp(String? value) => cariRequestModelTemp = cariRequestModelTemp.copyWith(siralama: value);

  @action
  void changeFilterTextTemp(String? value) => cariRequestModelTemp = cariRequestModelTemp.copyWith(filterText: value ?? "");

  @action
  void changeFilterBakiyeTemp(String? value) => cariRequestModelTemp = cariRequestModelTemp.copyWith(filterBakiye: value ?? "");

  @action
  void changeArrPlasiyerKoduTemp(List<String>? value) => cariRequestModelTemp = cariRequestModelTemp.copyWith(arrPlasiyerKodu: value);

  @action
  void changeArrGrupKoduTemp(List<String>? value) => cariRequestModelTemp = cariRequestModelTemp.copyWith(arrGrupKodu: value);

  @action
  void changeArrSehirTemp(List<String>? value) => cariRequestModelTemp = cariRequestModelTemp.copyWith(arrSehir: value);

  @action
  void changeArrKod0Temp(List<String>? value) => cariRequestModelTemp = cariRequestModelTemp.copyWith(arrGrupKodu: value);

  @action
  void changeArrKod1Temp(List<String>? value) => cariRequestModelTemp = cariRequestModelTemp.copyWith(arrKod1: value);

  @action
  void changeArrKod2Temp(List<String>? value) => cariRequestModelTemp = cariRequestModelTemp.copyWith(arrKod2: value);

  @action
  void changeArrKod3Temp(List<String>? value) => cariRequestModelTemp = cariRequestModelTemp.copyWith(arrKod3: value);

  @action
  void changeArrKod4Temp(List<String>? value) => cariRequestModelTemp = cariRequestModelTemp.copyWith(arrKod4: value);

  @action
  void changeArrKod5Temp(List<String>? value) => cariRequestModelTemp = cariRequestModelTemp.copyWith(arrKod5: value);

  @action
  void changeIlceTemp(String? value) => cariRequestModelTemp = cariRequestModelTemp.copyWith(ilce: value);

  @action
  void changeCariTipiTemp(String? value) => cariRequestModelTemp = cariRequestModelTemp.copyWith(cariTipi: value);

  @action
  void resetFilter() {
    cariRequestModel = cariRequestModel.copyWith(
      filterText: "",
      arrGrupKodu: null,
      arrKod1: null,
      arrKod2: null,
      arrKod3: null,
      arrKod4: null,
      arrKod5: null,
      arrSehir: null,
      arrPlasiyerKodu: null,
      ilce: null,
      filterBakiye: "",
    );
    cariRequestModelTemp = cariRequestModelTemp.copyWith(
      filterText: "",
      arrGrupKodu: null,
      arrKod1: null,
      arrKod2: null,
      arrKod3: null,
      arrKod4: null,
      arrKod5: null,
      arrSehir: null,
      arrPlasiyerKodu: null,
      ilce: null,
      filterBakiye: "",
    );
  }

  @override
  @action
  Future<void> resetList() async {
    resetPage();
    setParamData(null);
    await getData();
  }

  @action
  Future<void> getKod() async {
    final responseKod = await networkManager.dioGet<BaseGrupKoduModel>(
      path: ApiUrls.getGrupKodlari,
      bodyModel: BaseGrupKoduModel(),
      showLoading: true,
      headers: {"Modul": "CARI", "GrupNo": "-1", "Kullanimda": "E"},
      queryParameters: {"Modul": "CARI", "GrupNo": "-1"},
    );
    if (responseKod.isSuccess) {
      grupKodlari = responseKod.dataList;
    }
  }

  @action
  Future<void> getFilterData() async {
    final result = await networkManager.dioGet<CariSehirlerModel>(
      path: ApiUrls.getCariKayitliSehirler,
      bodyModel: CariSehirlerModel(),
      addTokenKey: true,
      addSirketBilgileri: true,
      headers: {"Modul": "CARI", "GrupNo": "-1", "Kullanimda": "E"},
    );
    if (result.isSuccess) {
      sehirler = result.dataList;
    }
  }

  @override
  @action
  Future<void> getData() async {
    log(getCariRequestModel.toString());
    final Map<String, dynamic> body = getCariRequestModel;
    if (cariRequestModel.kod == null || cariRequestModel.kod!.isEmpty) {
      body["Kod"] = "";
    }
    final result = await networkManager.dioGet<CariListesiModel>(path: ApiUrls.getCariler, queryParameters: body..["Sayfa"] = page, bodyModel: CariListesiModel());

    if (result.isSuccess) {
      if (page > 1) {
        addObservableList(result.dataList);
      } else {
        setObservableList(result.dataList);
        setParamData(result.paramData?.map((key, value) => MapEntry(key, double.tryParse((value as String).replaceAll(",", ".")) ?? value)));
      }
      if (result.dataList.length >= parametreModel.sabitSayfalamaOgeSayisi) {
        setDahaVarMi(true);
        increasePage();
      } else {
        setDahaVarMi(false);
      }
    } else {
      if (!result.isSuccess) {
        errorText = result.message;
        setObservableList([]);
      } else {
        errorText = null;
      }
    }
  }
}
