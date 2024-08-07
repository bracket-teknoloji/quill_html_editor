import "package:flutter/material.dart";
import "package:kartal/kartal.dart";
import "package:mobx/mobx.dart";
import "package:picker/core/base/view_model/listable_mixin.dart";
import "package:picker/core/base/view_model/mobx_network_mixin.dart";
import "package:picker/core/base/view_model/pageable_mixin.dart";
import "package:picker/core/base/view_model/scroll_controllable_mixin.dart";
import "package:picker/core/base/view_model/searchable_mixin.dart";
import "package:picker/core/constants/enum/grup_kodu_enums.dart";
import "package:picker/core/init/network/login/api_urls.dart";
import "package:picker/view/main_page/model/param_model.dart";

import "../../../../../../core/base/model/base_grup_kodu_model.dart";
import "../../../../../../core/init/cache/cache_manager.dart";
import "../model/stok_bottom_sheet_model.dart";
import "../model/stok_listesi_model.dart";

part "stok_listesi_view_model.g.dart";

class StokListesiViewModel = _StokListesiViewModelBase with _$StokListesiViewModel;

abstract class _StokListesiViewModelBase with Store, MobxNetworkMixin, ListableMixin<StokListesiModel>, SearchableMixin, ScrollControllableMixin, PageableMixin {
  final List<String> selectedList = ["Tümü", "Artı", "Eksi", "Sıfır", "Bakiyeli"];

  @observable
  String? bakiyeGroupValue = "Tümü";

  @observable
  bool kategoriMi = false;

  @observable
  int grupNo = -1;

  Map<String, dynamic>? gorunecekAlanlar = CacheManager.getProfilParametre.stokGorunecekEkstraAlanlar;

  @observable
  String resimleriGoster = CacheManager.getProfilParametre.stokResimleriGoster ? "E" : "H";

  @override
  @observable
  bool isSearchBarOpen = false;

  bool isGetData = false;

  void setIsGetData(bool value) => isGetData = value;

  @override
  @action
  void changeSearchBarStatus() {
    isSearchBarOpen = !isSearchBarOpen;
  }

  @action
  void setSearchList(List<StokDetayliAramaAlanlar>? value) => bottomSheetModel = bottomSheetModel.copyWith(searchList: value);

  @override
  @action
  Future<void> changeScrollStatus(ScrollPosition position) async {
    super.changeScrollStatus(position);
    if (position.pixels == position.maxScrollExtent && dahaVarMi) {
      await getData();
      isScrollDown = false;
    }
  }

  @override
  @observable
  String? searchText = "";

  @observable
  StokBottomSheetModel bottomSheetModel = StokBottomSheetModel(bakiyeDurumu: "T");

  @observable
  StokBottomSheetModel bottomSheetModelTemp = StokBottomSheetModel(bakiyeDurumu: "T");

  @observable
  ObservableList<BaseGrupKoduModel> grupKodlari = <BaseGrupKoduModel>[].asObservable();

  @observable
  ObservableList<BaseGrupKoduModel>? kategoriGrupKodlari;

  @observable
  @override
  ObservableList<StokListesiModel>? observableList;

  @override
  @observable
  bool isScrollDown = true;

  @override
  @action
  void setSearchText(String? value) => searchText = value;

  @action
  void resetSelectedArr() {
    bottomSheetModel = bottomSheetModel.copyWith(
      arrGrupKodu: null,
      arrKod1: null,
      arrKod2: null,
      arrKod3: null,
      arrKod4: null,
      arrKod5: null,
    );
    bottomSheetModelTemp = bottomSheetModelTemp.copyWith(
      arrGrupKodu: null,
      arrKod1: null,
      arrKod2: null,
      arrKod3: null,
      arrKod4: null,
      arrKod5: null,
    );
  }

  void setGorunecekAlanlar(Map<String, dynamic>? value) {
    gorunecekAlanlar = value;
    CacheManager.setProfilParametre(CacheManager.getProfilParametre.copyWith(stokGorunecekEkstraAlanlar: value ?? {}));
  }

  @computed
  List<BaseGrupKoduModel>? get grupKodu => bottomSheetModel.arrGrupKodu;

  @action
  void changeArrGrupKodu(List<BaseGrupKoduModel>? value) => bottomSheetModel = bottomSheetModel.copyWith(arrGrupKodu: value);

  @action
  void changeArrGrupKoduTemp(List<BaseGrupKoduModel>? value) => bottomSheetModelTemp = bottomSheetModelTemp.copyWith(arrGrupKodu: value);

  @computed
  List<BaseGrupKoduModel>? get kod1 => bottomSheetModel.arrKod1;

  @action
  void changeArrKod1(List<BaseGrupKoduModel>? value) => bottomSheetModel = bottomSheetModel.copyWith(arrKod1: value ?? []);

  @action
  void changeArrKod1Temp(List<BaseGrupKoduModel>? value) => bottomSheetModelTemp = bottomSheetModelTemp.copyWith(arrKod1: value);

  @computed
  List<BaseGrupKoduModel>? get kod2 => bottomSheetModel.arrKod2;

  @action
  void changeArrKod2(List<BaseGrupKoduModel>? value) => bottomSheetModel = bottomSheetModel.copyWith(arrKod2: value ?? []);

  @action
  void changeArrKod2Temp(List<BaseGrupKoduModel>? value) => bottomSheetModelTemp = bottomSheetModelTemp.copyWith(arrKod2: value);

  @computed
  List<BaseGrupKoduModel>? get kod3 => bottomSheetModel.arrKod3;

  @action
  void changeArrKod3(List<BaseGrupKoduModel>? value) => bottomSheetModel = bottomSheetModel.copyWith(arrKod3: value ?? []);

  @action
  void changeArrKod3Temp(List<BaseGrupKoduModel>? value) => bottomSheetModelTemp = bottomSheetModelTemp.copyWith(arrKod3: value);

  @computed
  List<BaseGrupKoduModel>? get kod4 => bottomSheetModel.arrKod4;

  @action
  void changeArrKod4(List<BaseGrupKoduModel>? value) => bottomSheetModel = bottomSheetModel.copyWith(arrKod4: value ?? []);

  @action
  void changeArrKod4Temp(List<BaseGrupKoduModel>? value) => bottomSheetModelTemp = bottomSheetModelTemp.copyWith(arrKod4: value);

  @computed
  List<BaseGrupKoduModel>? get kod5 => bottomSheetModel.arrKod5;

  @action
  void changeArrKod5(List<BaseGrupKoduModel>? value) => bottomSheetModel = bottomSheetModel.copyWith(arrKod5: value ?? []);

  @action
  void changeArrKod5Temp(List<BaseGrupKoduModel>? value) => bottomSheetModelTemp = bottomSheetModelTemp.copyWith(arrKod5: value);

  @action
  void setResimleriGoster() {
    if (resimleriGoster == "H") {
      resimleriGoster = "E";
      CacheManager.setProfilParametre(
        CacheManager.getProfilParametre.copyWith(stokResimleriGoster: true),
      );
    } else {
      resimleriGoster = "H";
      CacheManager.setProfilParametre(
        CacheManager.getProfilParametre.copyWith(stokResimleriGoster: false),
      );
    }
  }

  @action
  void setGrupKodlari(List<BaseGrupKoduModel> value) => grupKodlari = value.asObservable();

  @action
  void setKategoriGrupKodlari(List<BaseGrupKoduModel>? value) => kategoriGrupKodlari = value?.asObservable();

  @override
  @action
  void setObservableList(List<StokListesiModel>? value) => observableList = value?.asObservable();

  @override
  @action
  void addObservableList(List<StokListesiModel>? value) => setObservableList(observableList?..addAll(value!));

  @action
  void changeIsScrolledDown(bool value) => isScrollDown = value;

  @observable
  String siralama = "AZ";

  @action
  void setSiralama(String value) => siralama = value;

  @action
  void setSelectedWithIndex(int index) => bakiyeGroupValue = selectedList[index];

  @action
  void changeBakiyeDurumu(String? value) => bottomSheetModel = bottomSheetModel.copyWith(bakiyeDurumu: value);

  @action
  void changeBakiyeDurumuTemp(int? value) => bottomSheetModelTemp = bottomSheetModelTemp.copyWith(bakiyeDurumu: selectedList[value ?? 0].substring(0, 1));

  @action
  void setKategoriMi(bool value) => kategoriMi = value;

  @action
  void setGrupNo(int value) => grupNo = value;

  @computed
  String? get bakiye => bakiyeGroupValue?.substring(0, 1);

  @computed
  bool get hasAnyFilters =>
      bottomSheetModel.arrGrupKodu.ext.isNotNullOrEmpty ||
      bottomSheetModel.arrKod1.ext.isNotNullOrEmpty ||
      bottomSheetModel.arrKod2.ext.isNotNullOrEmpty ||
      bottomSheetModel.arrKod3.ext.isNotNullOrEmpty ||
      bottomSheetModel.arrKod4.ext.isNotNullOrEmpty ||
      bottomSheetModel.arrKod5.ext.isNotNullOrEmpty ||
      (bottomSheetModel.bakiyeDurumu != null && bottomSheetModel.bakiyeDurumu != "T");
  @override
  @action
  Future<void> resetList() async {
    resetPage();
    await getData();
  }

  @action
  Future<void> getGrupKodlari() async => setGrupKodlari(await networkManager.getGrupKod(name: GrupKoduEnum.stok, grupNo: grupNo, kullanimda: true, kategoriModuMu: kategoriMi));

  @action
  Future<void> getKategoriGrupKodlari() async {
    final result = await networkManager.getGrupKod(name: GrupKoduEnum.stok, grupNo: grupNo, kullanimda: true, kategoriModuMu: true);
    if (result.isNotEmpty) {
      setKategoriGrupKodlari(result);
    }
  }

  List<BaseGrupKoduModel>? grupKodlariWithGrupKodu(String? value) {
    if (value == null) {
      return null;
    }
    return grupKodlari.where((element) => element.grupKodu == value).toList();
  }

  @override
  @action
  Future<void> getData() async {
    final result = await networkManager.dioPost<StokListesiModel>(
      path: ApiUrls.getStoklar,
      bodyModel: StokListesiModel(),
      data: bottomSheetModel.copyWith(resimGoster: resimleriGoster, menuKodu: isGetData ? "STOK_SREH" : "STOK_STOK", searchText: searchText, sayfa: page).toJsonWithList(),
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
    } else if (page == 1) {
      setObservableList([]);
    }
  }
}
