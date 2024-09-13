import "package:flutter/material.dart";
import "package:mobx/mobx.dart";
import "package:picker/core/base/view_model/listable_mixin.dart";
import "package:picker/core/base/view_model/pageable_mixin.dart";
import "package:picker/core/base/view_model/scroll_controllable_mixin.dart";
import "package:picker/core/base/view_model/searchable_mixin.dart";

import "../../../../../view/main_page/alt_sayfalar/cari/cari_listesi/model/cari_listesi_model.dart";
import "../../../../../view/main_page/alt_sayfalar/cari/cari_listesi/model/cari_sehirler_model.dart";
import "../../../../../view/main_page/alt_sayfalar/cari/cari_network_manager.dart";
import "../../../../init/network/login/api_urls.dart";
import "../../../model/base_grup_kodu_model.dart";
import "../../../view_model/mobx_network_mixin.dart";
import "../model/cari_listesi_request_model.dart";

part "cari_rehberi_view_model.g.dart";

class CariRehberiViewModel = _CariRehberiViewModelBase with _$CariRehberiViewModel;

abstract class _CariRehberiViewModelBase with Store, MobxNetworkMixin, ListableMixin<CariListesiModel>, ScrollControllableMixin, PageableMixin, SearchableMixin {
  final Map<String, String> siralaMap = {
    "Cari Adı (A-Z)": "AZ",
    "Cari Adı (Z-A)": "ZA",
    "Cari Kodu (A-Z)": "CARI_KODU_AZ",
    "Cari Kodu (Z-A)": "CARI_KODU_ZA",
    "Kayıt Tarihi (Önce Yeni)": "KAYITTAR_ASC",
    "Kayıt Tarihi (Önce Eski)": "KAYITTAR_DESC",
    "Konum (En Yakın)": "KONUM_AZ",
    "Konum (En Uzak)": "KONUM_ZA",
  };
  final Map<String, String> tipiMap = {
    "Alıcı": "A",
    "Satıcı": "S",
    "Toptancı": "T",
    "Kefil": "K",
    "Müstahsil": "M",
    "Diğer": "D",
    "Komisyoncu": "I",
  };

  @override
  @observable
  bool isSearchBarOpen = true;

  @override
  @observable
  String? searchText;

  @override
  @observable
  bool isScrollDown = true;

  @override
  @observable
  ObservableList<CariListesiModel>? observableList;

  @observable
  ObservableList<CariSehirlerModel>? sehirler;

  @observable
  ObservableList<BaseGrupKoduModel>? grupKodlari;

  @observable
  CariListesiRequestModel? cariListesiRequestModel = CariListesiRequestModel(
    eFaturaGoster: true,
    sayfa: 1,
    siralama: "AZ",
  );

  @override
  Future<void> changeScrollStatus(ScrollPosition position) async {
    super.changeScrollStatus(position);
    if (position.pixels == position.maxScrollExtent && dahaVarMi) {
      await getData();
      isScrollDown = false;
    }
  }

  @override
  @action
  Future<void> resetList() async {
    resetPage();
    await getData();
  }

  @computed
  List<BaseGrupKoduModel>? get grupKodlari1 => grupKodlari?.where((element) => element.grupNo == 1).toList();

  @computed
  List<BaseGrupKoduModel>? get grupKodlari2 => grupKodlari?.where((element) => element.grupNo == 2).toList();

  @computed
  List<BaseGrupKoduModel>? get grupKodlari3 => grupKodlari?.where((element) => element.grupNo == 3).toList();

  @computed
  List<BaseGrupKoduModel>? get grupKodlari4 => grupKodlari?.where((element) => element.grupNo == 4).toList();

  @computed
  List<BaseGrupKoduModel>? get grupKodlari5 => grupKodlari?.where((element) => element.grupNo == 5).toList();

  @override
  @action
  void changeSearchBarStatus() => isSearchBarOpen = !isSearchBarOpen;

  @action
  void setMenuKodu(String? value) => cariListesiRequestModel = cariListesiRequestModel?.copyWith(menuKodu: value);

  @action
  void setBelgeTuru(String? value) => cariListesiRequestModel = cariListesiRequestModel?.copyWith(belgeTuru: value);

  @action
  void setSiparisKarsilanmaDurumu(String? value) => cariListesiRequestModel = cariListesiRequestModel?.copyWith(siparisKarsilanmaDurumu: value);

  @action
  void changeIsScrollDown(bool value) => isScrollDown = value;

  @override
  @action
  void setObservableList(List<CariListesiModel>? value) => observableList = value?.asObservable();

  @override
  @action
  void addObservableList(List<CariListesiModel>? value) => observableList = observableList?..addAll(value!);

  @action
  void changeBagliCariKodu(String? value) => cariListesiRequestModel = cariListesiRequestModel?.copyWith(bagliCariKodu: value != "" ? value : null);

  @action
  void changeSehir(String? value) => cariListesiRequestModel = cariListesiRequestModel?.copyWith(sehir: value);

  @action
  void changeIlce(String? value) => cariListesiRequestModel = cariListesiRequestModel?.copyWith(ilce: value);

  @action
  void changeTipi(String? value) => cariListesiRequestModel = cariListesiRequestModel?.copyWith(cariTipi: value);

  @action
  void changeKod1(List<String>? value) => cariListesiRequestModel = cariListesiRequestModel?.copyWith(arrKod1: value);

  @action
  void changeKod2(List<String>? value) => cariListesiRequestModel = cariListesiRequestModel?.copyWith(arrKod2: value);

  @action
  void changeKod3(List<String>? value) => cariListesiRequestModel = cariListesiRequestModel?.copyWith(arrKod3: value);

  @action
  void changeKod4(List<String>? value) => cariListesiRequestModel = cariListesiRequestModel?.copyWith(arrKod4: value);

  @action
  void changeKod5(List<String>? value) => cariListesiRequestModel = cariListesiRequestModel?.copyWith(arrKod5: value);

  @action
  void changeSiralama(String? value) {
    cariListesiRequestModel = cariListesiRequestModel?.copyWith(siralama: value);
  }

  @override
  @action
  void setSearchText(String? value) => searchText = value;

  @override
  @action
  Future<void> getData() async {
    final result = await networkManager.dioGet<CariListesiModel>(
      path: ApiUrls.getCariler,
      queryParameters: cariListesiRequestModel?.copyWith(sayfa: page, searchText: searchText).toJsonWithList(),
      bodyModel: CariListesiModel(),
    );
    if (result.isSuccess) {
      if (page > 1) {
        addObservableList(result.dataList);
      } else {
        setObservableList(result.dataList);
      }
      if (result.dataList.length >= parametreModel.sabitSayfalamaOgeSayisi) {
        setDahaVarMi(true);
        increasePage();
      } else {
        setDahaVarMi(false);
      }
    }
  }

  @action
  Future<void> getSehirBilgileri() async {
    final result = await networkManager.dioGet<CariSehirlerModel>(
      path: ApiUrls.getCariKayitliSehirler,
      bodyModel: CariSehirlerModel(),
      showLoading: true,
    );
    if (result.isSuccess) {
      final List<CariSehirlerModel> list = result.dataList;
      sehirler = list.asObservable();
    }
  }

  @action
  Future<void> getGrupKodlari() async {
    final result = await CariNetworkManager.getKod();
    if (result.isSuccess) {
      final List<BaseGrupKoduModel> list = result.dataList;
      grupKodlari = list.asObservable();
    }
  }
}
