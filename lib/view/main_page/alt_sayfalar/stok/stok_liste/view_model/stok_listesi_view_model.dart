import "package:kartal/kartal.dart";
import "package:mobx/mobx.dart";

import "../../../../../../core/base/model/base_grup_kodu_model.dart";
import "../../../../../../core/init/cache/cache_manager.dart";
import "../model/stok_bottom_sheet_model.dart";
import "../model/stok_listesi_model.dart";

part "stok_listesi_view_model.g.dart";

class StokListesiViewModel = _StokListesiViewModelBase with _$StokListesiViewModel;

abstract class _StokListesiViewModelBase with Store {
  final List<String> selectedList = ["Tümü", "Artı", "Eksi", "Sıfır", "Bakiyeli"];

  @observable
  String? bakiyeGroupValue = "Tümü";

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
  StokBottomSheetModel bottomSheetModel = StokBottomSheetModel(bakiyeDurumu: "T");
  @observable
  StokBottomSheetModel bottomSheetModelTemp = StokBottomSheetModel(bakiyeDurumu: "T");

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

  @computed
  List<BaseGrupKoduModel>? get grupKodu => bottomSheetModel.arrGrupKodu;

  @action
  void changeArrGrupKodu(List<BaseGrupKoduModel> value) => bottomSheetModel = bottomSheetModel.copyWith(arrGrupKodu: value);

  @action
  void changeArrGrupKoduTemp(List<BaseGrupKoduModel> value) => bottomSheetModelTemp = bottomSheetModelTemp.copyWith(arrGrupKodu: value);

  @computed
  List<BaseGrupKoduModel>? get kod1 => bottomSheetModel.arrKod1;

  @action
  void changeArrKod1(List<BaseGrupKoduModel> value) => bottomSheetModel = bottomSheetModel.copyWith(arrKod1: value);

  @action
  void changeArrKod1Temp(List<BaseGrupKoduModel> value) => bottomSheetModelTemp = bottomSheetModelTemp.copyWith(arrKod1: value);

  @computed
  List<BaseGrupKoduModel>? get kod2 => bottomSheetModel.arrKod2;

  @action
  void changeArrKod2(List<BaseGrupKoduModel> value) => bottomSheetModel = bottomSheetModel.copyWith(arrKod2: value);

  @action
  void changeArrKod2Temp(List<BaseGrupKoduModel> value) => bottomSheetModelTemp = bottomSheetModelTemp.copyWith(arrKod2: value);

  @computed
  List<BaseGrupKoduModel>? get kod3 => bottomSheetModel.arrKod3;

  @action
  void changeArrKod3(List<BaseGrupKoduModel> value) => bottomSheetModel = bottomSheetModel.copyWith(arrKod3: value);

  @action
  void changeArrKod3Temp(List<BaseGrupKoduModel> value) => bottomSheetModelTemp = bottomSheetModelTemp.copyWith(arrKod3: value);

  @computed
  List<BaseGrupKoduModel>? get kod4 => bottomSheetModel.arrKod4;

  @action
  void changeArrKod4(List<BaseGrupKoduModel> value) => bottomSheetModel = bottomSheetModel.copyWith(arrKod4: value);

  @action
  void changeArrKod4Temp(List<BaseGrupKoduModel> value) => bottomSheetModelTemp = bottomSheetModelTemp.copyWith(arrKod4: value);

  @computed
  List<BaseGrupKoduModel>? get kod5 => bottomSheetModel.arrKod5;

  @action
  void changeArrKod5(List<BaseGrupKoduModel> value) => bottomSheetModel = bottomSheetModel.copyWith(arrKod5: value);

  @action
  void changeArrKod5Temp(List<BaseGrupKoduModel> value) => bottomSheetModelTemp = bottomSheetModelTemp.copyWith(arrKod5: value);

  @observable
  String resimleriGoster = CacheManager.getProfilParametre.stokResimleriGoster ? "E" : "H";

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

  @observable
  ObservableList<BaseGrupKoduModel> grupKodlari = <BaseGrupKoduModel>[].asObservable();

  @action
  void setGrupKodlari(List<BaseGrupKoduModel> value) => grupKodlari = value.asObservable();

  @observable
  ObservableList<StokListesiModel>? stokListesi;

  @action
  void setStokListesi(List<StokListesiModel>? value) => stokListesi = value?.asObservable();

  @action
  void addStokListesi(List<StokListesiModel> value) {
    stokListesi?.addAll(value);
  }

  @observable
  bool isScrolledDown = true;

  @action
  void changeIsScrolledDown(bool value) => isScrolledDown = value;

  @observable
  int sayfa = 1;

  @action
  void increaseSayfa() => sayfa++;

  @action
  void resetSayfa() => sayfa = 1;

  @observable
  bool dahaVarMi = true;

  @action
  void setDahaVarMi(bool value) => dahaVarMi = value;

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
      (bottomSheetModel.bakiyeDurumu != null &&
      bottomSheetModel.bakiyeDurumu != "T");
}
