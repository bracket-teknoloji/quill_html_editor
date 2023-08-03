import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../../../../../../core/base/model/base_grup_kodu_model.dart';
import '../model/stok_bottom_sheet_model.dart';
import '../model/stok_listesi_model.dart';

part 'stok_listesi_view_model.g.dart';

class StokListesiViewModel = _StokListesiViewModelBase with _$StokListesiViewModel;

abstract class _StokListesiViewModelBase with Store {
  @observable
  Map<String, MemoryImage> imageMap = {};

  @action
  void setImageMap(Map<String, MemoryImage> value) => imageMap = value;

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
  StokBottomSheetModel bottomSheetModel = StokBottomSheetModel.instance;

  @action
  void resetBottomSheetModel() => bottomSheetModel.setSingleton(StokBottomSheetModel());

  @action
  void setBottomSheetModel(StokBottomSheetModel value) {
    bottomSheetModel.arrGrupKodu = [];
    bottomSheetModel.arrKod1 = [];
    bottomSheetModel.arrKod2 = [];
    bottomSheetModel.arrKod3 = [];
    bottomSheetModel.arrKod4 = [];
    bottomSheetModel.arrKod5 = [];
  }

  @computed
  String get grupKodu => bottomSheetModel.arrGrupKodu?.map((e) => e.grupAdi).toList().join(", ") ?? "";

  @computed
  String get kod1 => bottomSheetModel.arrKod1?.map((e) => e.grupAdi).toList().join(", ") ?? "";

  @computed
  String get kod2 => bottomSheetModel.arrKod2?.map((e) => e.grupAdi).toList().join(", ") ?? "";

  @computed
  String get kod3 => bottomSheetModel.arrKod3?.map((e) => e.grupAdi).toList().join(", ") ?? "";

  @computed
  String get kod4 => bottomSheetModel.arrKod4?.map((e) => e.grupAdi).toList().join(", ") ?? "";

  @computed
  String get kod5 => bottomSheetModel.arrKod5?.map((e) => e.grupAdi).toList().join(", ") ?? "";

  @observable
  String resimleriGoster = "H";

  @action
  void setResimleriGoster() {
    if (resimleriGoster == "H") {
      resimleriGoster = "E";
    } else {
      resimleriGoster = "H";
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
