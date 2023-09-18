import "package:flutter/material.dart";
import "package:mobx/mobx.dart";

import "../../../../../../core/base/model/base_grup_kodu_model.dart";
import "../../../../../../core/init/cache/cache_manager.dart";
import "../model/stok_bottom_sheet_model.dart";
import "../model/stok_listesi_model.dart";

part "stok_listesi_view_model.g.dart";

class StokListesiViewModel = _StokListesiViewModelBase with _$StokListesiViewModel;

abstract class _StokListesiViewModelBase with Store {
  @observable
  ObservableMap<String, MemoryImage> imageMap = <String, MemoryImage>{}.asObservable();

  @action
  void setImageMap(Map<String, MemoryImage> value) => imageMap = value.asObservable();

  @action
  void addImageMap(Map<String, MemoryImage> value) => imageMap.addAll(value);

  @action
  void removeImageMap(String key) => imageMap.remove(key);
  @observable
  bool searchBar = false;

  @action
  void setSearchBar() {
    searchBar = !searchBar;
  }

  @observable
  String searchValue = "";

  @action
  void setSearchValue(String value) => searchValue = value;
  @observable
  StokBottomSheetModel bottomSheetModel = StokBottomSheetModel();

  @action
  void resetSelectedArr(){
    bottomSheetModel = bottomSheetModel.copyWith(arrGrupKodu: null,arrKod1: null,arrKod2: null,arrKod3: null,arrKod4: null,arrKod5: null);
  }
  @computed
  List<BaseGrupKoduModel>? get grupKodu => bottomSheetModel.arrGrupKodu;

  @action
  void changeArrGrupKodu(List<BaseGrupKoduModel> value) => bottomSheetModel = bottomSheetModel.copyWith(arrGrupKodu: value);

  @computed
  List<BaseGrupKoduModel>? get kod1 => bottomSheetModel.arrKod1;

  @action
  void changeArrKod1(List<BaseGrupKoduModel> value) => bottomSheetModel = bottomSheetModel.copyWith(arrKod1: value);

  @computed
  List<BaseGrupKoduModel>? get kod2 => bottomSheetModel.arrKod2;

  @action
  void changeArrKod2(List<BaseGrupKoduModel> value) => bottomSheetModel = bottomSheetModel.copyWith(arrKod2: value);

  @computed
  List<BaseGrupKoduModel>? get kod3 => bottomSheetModel.arrKod3;

  @action
  void changeArrKod3(List<BaseGrupKoduModel> value) => bottomSheetModel = bottomSheetModel.copyWith(arrKod3: value);

  @computed
  List<BaseGrupKoduModel>? get kod4 => bottomSheetModel.arrKod4;

  @action
  void changeArrKod4(List<BaseGrupKoduModel> value) => bottomSheetModel = bottomSheetModel.copyWith(arrKod4: value);

  @computed
  List<BaseGrupKoduModel>? get kod5 => bottomSheetModel.arrKod5;

  @action
  void changeArrKod5(List<BaseGrupKoduModel> value) => bottomSheetModel = bottomSheetModel.copyWith(arrKod5: value);


  @observable
  String resimleriGoster = CacheManager.getProfilParametre.stokResimleriGoster ? "E" : "H";

  @action
  void setResimleriGoster() {
    if (resimleriGoster == "H") {
      resimleriGoster = "E";
      CacheManager.setProfilParametre(CacheManager.getProfilParametre.copyWith(stokResimleriGoster: true));
    } else {
      resimleriGoster = "H";
      CacheManager.setProfilParametre(CacheManager.getProfilParametre.copyWith(stokResimleriGoster: false));
    }
  }

  @observable
  ObservableList<BaseGrupKoduModel> grupKodlari = <BaseGrupKoduModel>[].asObservable();

  @action
  void setGrupKodlari(List<BaseGrupKoduModel> value) => grupKodlari = value.asObservable();

  @observable
  List<StokListesiModel>? stokListesi;

  @action
  void setStokListesi(List<StokListesiModel>? value) => stokListesi = value;

  @action
  void addStokListesi(List<StokListesiModel> value) {
    stokListesi?.addAll(value);
  }

  @observable
  bool isScrolledDown = true;

  @action
  void changeIsScrolledDown(bool value) => isScrolledDown = value;

  @observable
  int sayfa = 0;

  @action
  void increaseSayfa() => sayfa++;

  @action
  void resetSayfa() => sayfa = 0;

  @observable
  bool dahaVarMi = true;

  @action
  void setDahaVarMi(bool value) => dahaVarMi = value;

  @observable
  String siralama = "AZ";

  @action
  void setSiralama(String value) => siralama = value;

  @observable
  ObservableList<bool> selected = [true, false, false, false, false].asObservable();

  @action
  void setSelectedWithIndex(int index) {
    selected = [false, false, false, false, false].asObservable();
    selected[index] = true;
  }

  @action
  void resetSelected() => selected = [true, false, false, false, false].asObservable();

  @observable
  ObservableList selectedList = ["Tümü", "Artı", "Eksi", "Sıfır", "Bakiyeli"].asObservable();

  @computed
  String? get bakiye {
    for (int i = 0; i < selected.length; i++) {
      if (selected[i]) {
        return (selectedList[i] as String).substring(0, 1);
      }
    }
    return null;
  }
}