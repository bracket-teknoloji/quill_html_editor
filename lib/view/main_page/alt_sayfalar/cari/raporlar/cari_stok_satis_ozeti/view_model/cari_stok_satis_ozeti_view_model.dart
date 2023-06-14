import 'package:get/get.dart';
import 'package:mobx/mobx.dart';

import '../../../../../../../core/components/dialog/bottom_sheet/model/bottom_sheet_model.dart';
import '../../../cari_listesi/model/cari_listesi_model.dart';
import '../model/cari_stok_satis_ozeti_model.dart';

part 'cari_stok_satis_ozeti_view_model.g.dart';

class CariStokSatisOzetiViewModel = _CariStokSatisOzetiViewModelBase with _$CariStokSatisOzetiViewModel;

abstract class _CariStokSatisOzetiViewModelBase with Store {
  final List<BottomSheetModel> bottomSheetModelList = <BottomSheetModel>[
    BottomSheetModel(title: "Tarih (Artan)", onTap: () => Get.back(result: "TARIH_AZ")),
    BottomSheetModel(title: "Tarih (Azalan)", onTap: () => Get.back(result: "TARIH_ZA")),
    BottomSheetModel(title: "Stok Kodu (A-Z)", onTap: () => Get.back(result: "STOK_KODU_AZ")),
    BottomSheetModel(title: "Stok Kodu (Z-A)", onTap: () => Get.back(result: "STOK_KODU_ZA")),
    BottomSheetModel(title: "Stok Adı (A-Z)", onTap: () => Get.back(result: "STOK_ADI_AZ")),
    BottomSheetModel(title: "Stok Adı (Z-A)", onTap: () => Get.back(result: "STOK_ADI_ZA")),
  ];

  final List<String> donemTipiList = ["TUMU", "BUGUN", "DUN", "BU_HAFTA", "BU_AY", "GECEN_AY", "SON_3_AY", "BU_YIL", "GECEN_YIL", "OZEL"];

  @action
  void deleteAllArr() {
    irsDahil = false;
    arrStokGrupKodu.clear();
    arrStokKod1.clear();
    arrStokKod2.clear();
    arrStokKod3.clear();
    arrStokKod4.clear();
    arrStokKod5.clear();
  }
  @observable
  int donemTipiIndex = 0;

  @observable
  bool irsDahil = false;

  @action
  void setIrsDahil(bool value) => irsDahil = value;

  @observable
  ObservableList<String> arrStokGrupKodu = <String>[].asObservable();
  @action
  void setArrStokGrupKodu(String value) => arrStokGrupKodu = <String>[value].asObservable();
  @observable
  ObservableList<String> arrStokKod1 = <String>[].asObservable();
  @action
  void setArrStokKod1(String value) => arrStokKod1 =<String>[value].asObservable();
  @observable
  ObservableList<String> arrStokKod2 = <String>[].asObservable();
  @action
  void setArrStokKod2(String value) => arrStokKod2 = <String>[value].asObservable();
  @observable
  ObservableList<String> arrStokKod3 = <String>[].asObservable();
  @action
  void setArrStokKod3(String value) => arrStokKod3 = <String>[value].asObservable();
  @observable
  ObservableList<String> arrStokKod4 = <String>[].asObservable();
  @action
  void setArrStokKod4(String value) => arrStokKod4 =<String>[value].asObservable();
  @observable
  ObservableList<String> arrStokKod5 = <String>[].asObservable();
  @action
  void setArrStokKod5(String value) => arrStokKod5 =<String>[value].asObservable();

  @action
  void setDonemTipiIndex(int value) => donemTipiIndex = value;
  @observable
  String sirala = "TARIH_AZ";

  @action
  void setSirala(String? value) => sirala = value ?? "TARIH_AZ";
  @observable
  bool searchBar = false;

  @observable
  CariListesiModel? model;

  @action
  void setModel(CariListesiModel? value) => model = value;

  @action
  void setSearchBar() => searchBar = !searchBar;

  @observable
  List<CariStokSatisOzetiModel>? modelList;

  @action
  void setModelList(List<CariStokSatisOzetiModel>? value) => modelList = value;
}
