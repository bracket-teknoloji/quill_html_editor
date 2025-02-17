import "package:mobx/mobx.dart";

import "../../../../../view/main_page/alt_sayfalar/stok/base_stok_edit/model/stok_muhasebe_kodu_model.dart";
import "../../../../base/model/base_grup_kodu_model.dart";
import "../model/bottom_sheet_model.dart";

part "bottom_sheet_state_manager.g.dart";

final class BottomSheetStateManager = _BottomSheetStateManagerBase with _$BottomSheetStateManager;

abstract class _BottomSheetStateManagerBase with Store {
  @observable
  ObservableList<BaseGrupKoduModel>? grupKoduList = <BaseGrupKoduModel>[].asObservable();
  @observable
  ObservableList<BaseGrupKoduModel>? filteredGrupKoduList = <BaseGrupKoduModel>[].asObservable();
  @observable
  ObservableList<StokMuhasebeKoduModel>? muhasebeKoduList = <StokMuhasebeKoduModel>[].asObservable();
  @action
  void changeGrupKoduList(List<BaseGrupKoduModel> value) {
    grupKoduList = value.asObservable();
  }

  @action
  void filteredGrupKoduListFilter(int value) {
    filteredGrupKoduList = grupKoduList?.where((element) => element.grupNo == value).toList().asObservable();
  }

  @action
  void changeMuhasebeKoduList(List<StokMuhasebeKoduModel> value) {
    muhasebeKoduList = value.asObservable();
  }

  @observable
  ObservableList<BottomSheetModel>? unFilteredList;

  @observable
  String? searchValue;

  @action
  void setUnFilteredList(List<BottomSheetModel>? value) {
    unFilteredList = value?.asObservable();
  }

  @computed
  List<BottomSheetModel>? get getFilteredList =>
      unFilteredList
          ?.where(
            (element) =>
                element.title.toLowerCase().contains(searchValue?.toLowerCase() ?? "") ||
                (element.description?.toLowerCase().contains(searchValue?.toLowerCase() ?? "") ?? false),
          )
          .toList();

  @action
  void changeSearchValue(String value) {
    searchValue = value;
  }

  @observable
  String? radioGroupValue = "";

  @action
  void changeRadioGroupValue(String value) {
    radioGroupValue = value;
  }

  @observable
  String? cariTipi = "";

  @action
  void changeCariTipi(String value) {
    cariTipi = value;
  }

  @observable
  String? sehir = "";

  @action
  void changeSehir(String value) {
    sehir = value;
  }

  @observable
  String? plasiyer = "";

  @action
  void changePlasiyer(String value) {
    plasiyer = value;
  }

  @observable
  String? ilce = "";

  @action
  void changeIlce(String value) {
    ilce = value;
  }

  @observable
  String? kod0 = "";
  @action
  void changeKod0(String value) {
    kodControllerText?[0] = value;
    kod0 = value;
  }

  @observable
  String? kod1 = "";
  @action
  void changeKod1(String value) {
    kodControllerText?[1] = value;
    kod1 = value;
  }

  @observable
  String? kod2 = "";
  @action
  void changeKod2(String value) {
    kodControllerText?[2] = value;
    kod2 = value;
  }

  @observable
  String? kod3 = "";
  @action
  void changeKod3(String value) {
    kodControllerText?[3] = value;
    kod3 = value;
  }

  @observable
  String? kod4 = "";
  @action
  void changeKod4(String value) {
    kodControllerText?[4] = value;
    kod4 = value;
  }

  @observable
  String? kod5 = "";
  @action
  void changeKod5(String value) {
    kodControllerText?[5] = value;
    kod5 = value;
  }

  @observable
  List? aramaList = [];

  @action
  void changeAramaList(List value) {
    aramaList = value;
  }

  @observable
  Map<String, List<bool>?>? isSelectedListMap = {};

  @action
  void changeIsSelectedListMap(String key, List<bool>? value) {
    isSelectedListMap?[key] = value?.asObservable();
  }

  @action
  void changeIndexIsSelectedListMap(String key, int index, bool value) {
    isSelectedListMap?[key]?[index] = value;
  }

  @action
  void deleteIsSelectedListMap() => isSelectedListMap = {};

  @observable
  ObservableList<String>? kodControllerText = <String>[].asObservable();

  @computed
  ObservableList<String>? get getKodControllerText => kodControllerText;

  @action
  void changeKodControllerTextList(List<String> value) {
    kodControllerText = value.asObservable();
  }

  @action
  void changeKodControllerText(String value, int index) {
    kodControllerText?[index] = value;
  }

  @action
  void deleteKodControllerText() {
    kodControllerText = <String>[].asObservable();
  }
}
