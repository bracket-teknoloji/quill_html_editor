import "package:flutter/material.dart";
import "package:mobx/mobx.dart";
import "package:picker/core/base/view_model/listable_mixin.dart";
import "package:picker/core/base/view_model/mobx_network_mixin.dart";
import "package:picker/core/base/view_model/pageable_mixin.dart";
import "package:picker/core/base/view_model/scroll_controllable_mixin.dart";
import "package:picker/core/base/view_model/searchable_mixin.dart";
import "package:picker/core/constants/enum/edit_tipi_enum.dart";
import "package:picker/core/constants/enum/grup_kodu_enums.dart";
import "package:picker/core/init/network/login/api_urls.dart";
import "package:picker/view/main_page/model/param_model.dart";

import "../../../../../view/main_page/alt_sayfalar/siparis/base_siparis_edit/model/base_siparis_edit_model.dart";
import "../../../../../view/main_page/alt_sayfalar/stok/stok_liste/model/stok_bottom_sheet_model.dart";
import "../../../../../view/main_page/alt_sayfalar/stok/stok_liste/model/stok_listesi_model.dart";
import "../../../../constants/extensions/date_time_extensions.dart";
import "../../../model/base_grup_kodu_model.dart";

part "stok_rehberi_view_model.g.dart";

class StokRehberiViewModel = _StokRehberiViewModelBase with _$StokRehberiViewModel;

abstract class _StokRehberiViewModelBase with Store, MobxNetworkMixin, ListableMixin<StokListesiModel>, SearchableMixin, ScrollControllableMixin, PageableMixin {
  @override
  void changeSearchBarStatus() {}

  @override
  @observable
  bool isSearchBarOpen = false;

  @override
  @observable
  bool isScrollDown = true;

  @override
  @observable
  String? searchText;

  @observable
  bool kategoriMi = false;

  @observable
  int grupNo = -1;

  @observable
  ObservableList<BaseGrupKoduModel>? grupKodlari = <BaseGrupKoduModel>[].asObservable();

  @observable
  ObservableList<BaseGrupKoduModel>? kategoriGrupKodlari;

  @action
  void setGrupKodlari(List<BaseGrupKoduModel> value) => grupKodlari = value.asObservable();

  @action
  void changeIsScrolledDown(bool value) => isScrollDown = value;

  @action
  void changeArrKod1(List<BaseGrupKoduModel>? value) => stokBottomSheetModel = stokBottomSheetModel.copyWith(arrKod1: value ?? []);

  @action
  void changeArrKod2(List<BaseGrupKoduModel>? value) => stokBottomSheetModel = stokBottomSheetModel.copyWith(arrKod2: value ?? []);

  @action
  void changeArrKod3(List<BaseGrupKoduModel>? value) => stokBottomSheetModel = stokBottomSheetModel.copyWith(arrKod3: value ?? []);

  @action
  void changeArrKod4(List<BaseGrupKoduModel>? value) => stokBottomSheetModel = stokBottomSheetModel.copyWith(arrKod4: value ?? []);

  @action
  void changeArrKod5(List<BaseGrupKoduModel>? value) => stokBottomSheetModel = stokBottomSheetModel.copyWith(arrKod5: value ?? []);

  @action
  void setSearchList(List<StokDetayliAramaAlanlar>? value) => stokBottomSheetModel = stokBottomSheetModel.copyWith(searchList: value);

  @override
  @observable
  ObservableList<StokListesiModel>? observableList;

  @override
  @action
  void setObservableList(List<StokListesiModel>? list) => observableList = list?.asObservable();

  @override
  @action
  void addObservableList(List<StokListesiModel>? list) => setObservableList(observableList?..addAll(list!));

  BaseSiparisEditModel get baseSiparisEditModel => BaseSiparisEditModel.instance;

  StokBottomSheetModel stokBottomSheetModel = StokBottomSheetModel(
    siralama: "AZ",
    belgeNo: BaseSiparisEditModel.instance.belgeNo,
    belgeTarihi: BaseSiparisEditModel.instance.tarih.toDateString,
    belgeTipi: BaseSiparisEditModel.instance.getEditTipiEnum?.rawValue,
    ekranTipi: "R",
    resimGoster: "E",
    faturaTipi: 2,
    okutuldu: true,
    cariKodu: BaseSiparisEditModel.instance.cariKodu,
    menuKodu: "STOK_SREH",
  );

  StokBottomSheetModel get getRequestModel => stokBottomSheetModel.copyWith(sayfa: page, searchText: searchText);

  @action
  void setSiralama(String value) => stokBottomSheetModel = stokBottomSheetModel.copyWith(siralama: value);
  @override
  @action
  void setSearchText(String? value) => searchText = value;
  @action
  void setGrupKodu(List<BaseGrupKoduModel>? value) => stokBottomSheetModel = stokBottomSheetModel.copyWith(arrGrupKodu: value);

  @action
  void setSelectedStokModel(String? value) {
    stokBottomSheetModel = stokBottomSheetModel.copyWith(stokKodu: value, kisitYok: value != null);
  }

  @override
  @action
  Future<void> resetList() async {
    resetPage();
    await getData();
  }

  final Map<String, String> siralamaMap = {
    "Stok Adı (A-Z)": "AZ",
    "Stok Adı (Z-A)": "ZA",
    "Stok Kodu (A-Z)": "KOD_AZ",
    "Stok Kodu (Z-A)": "KOD_ZA",
    "Bakiye (Artan)": "BAKIYE_AZ",
    "Bakiye (Azalan)": "BAKIYE_ZA",
  };

    @override
    Future<void> changeScrollStatus(ScrollPosition position) async {
      super.changeScrollStatus(position);
      if (position.pixels == position.maxScrollExtent && dahaVarMi) {
        await getData();
        isScrollDown = false;
      }
    }

  @action
  void setKategoriGrupKodlari(List<BaseGrupKoduModel>? value) => kategoriGrupKodlari = value?.asObservable();

  @action
  void setKategoriMi(bool value) => kategoriMi = value;

  @action
  void setGrupNo(int value) => grupNo = value;

  @override
  @action
  Future<void> getData() async {
    final result = await networkManager.dioPost<StokListesiModel>(path: ApiUrls.getStoklar, data: getRequestModel.toJsonWithList(), bodyModel: StokListesiModel());
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
  Future<void> getGrupKodlari() async => setGrupKodlari(await networkManager.getGrupKod(name: GrupKoduEnum.stok, grupNo: grupNo, kullanimda: true, kategoriModuMu: kategoriMi));

  @action
  Future<void> getKategoriGrupKodlari() async {
    final result = await networkManager.getGrupKod(name: GrupKoduEnum.stok, grupNo: grupNo, kullanimda: true, kategoriModuMu: true);
    if (result.isNotEmpty) {
      setKategoriGrupKodlari(result);
    }
  }
}
