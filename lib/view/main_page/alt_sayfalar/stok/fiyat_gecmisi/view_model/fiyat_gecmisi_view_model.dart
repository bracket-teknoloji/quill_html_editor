import "package:kartal/kartal.dart";
import "package:mobx/mobx.dart";

import "../../../../../../core/components/dialog/bottom_sheet/model/bottom_sheet_model.dart";
import "../model/fiyat_gecmisi_model.dart";
import "../model/fiyat_gecmisi_response_model.dart";

part "fiyat_gecmisi_view_model.g.dart";

class FiyatGecmisiViewModel = _FiyatGecmisiViewModelBase with _$FiyatGecmisiViewModel;

abstract class _FiyatGecmisiViewModelBase with Store {
  @observable
  FiyatGecmisiModel model = FiyatGecmisiModel();

  @observable
  ObservableList<FiyatGecmisiResponseModel?>? modelList;

  @observable
  ObservableList<FiyatGecmisiResponseModel?>? filteredModelList;

  @action
  void filterModelList(String value) {
    if (value.ext.isNullOrEmpty) {
      filteredModelList = modelList;
    } else {
      filteredModelList = modelList
          ?.where((element) => (element?.stokAdi?.toLowerCase().contains(value.toLowerCase()) ?? false) || (element?.stokKodu?.toLowerCase().contains(value.toLowerCase()) ?? false))
          .toList()
          .asObservable();
    }
  }

  @action
  void setModelList(List<FiyatGecmisiResponseModel?>? modelList) {
    this.modelList = modelList?.asObservable();
    filterModelList("");
  }

  @observable
  bool searchBar = false;

  @action
  void setSearchBar() {
    searchBar = !searchBar;
    filterModelList("");
  }

  final List<BottomSheetModel> siralaTitleList = [
    BottomSheetModel(title: "Kayıt Tarihi (A-Z)", value: "TARIH_AZ"),
    BottomSheetModel(title: "Kayıt Tarihi (Z-A)", value: "TARIH_ZA"),
    BottomSheetModel(title: "Yazdırma Tarihi (A-Z)", value: "YAZDIRMA_TARIHI_AZ"),
    BottomSheetModel(title: "Yazdırma Tarihi (Z-A)", value: "YAZDIRMA_TARIHI_ZA"),
    BottomSheetModel(title: "Stok Kodu (A-Z)", value: "STOK_KODU_AZ"),
    BottomSheetModel(title: "Stok Kodu (Z-A)", value: "STOK_KODU_ZA"),
    BottomSheetModel(title: "Stok Adı (A-Z)", value: "STOK_ADI_AZ"),
    BottomSheetModel(title: "Stok Adı (Z-A)", value: "STOK_ADI_ZA"),
  ];
  @observable
  String alisSatisGroupValue = "";

  @action
  void setAlisSatisGroupValue(int value) {
    alisSatisGroupValue = alisSatisDurumuMap.values.toList()[value];
    model.alisSatis = alisSatisDurumuMap.values.toList()[value];
  }

  final Map<String, dynamic> alisSatisDurumuMap = {
    "Tümü": "",
    "Alış": "1",
    "Satış": "2",
  };

  @observable
  String yazdirmaGroupValue = "";

  @action
  void setYazdirmaGroupValue(int value) {
    yazdirmaGroupValue = yazdirmaDurumuMap.values.toList()[value];
    model.yazdirildi = yazdirmaDurumuMap.values.toList()[value];
  }

  final Map<String, dynamic> yazdirmaDurumuMap = {
    "Tümü": "",
    "Yazdırılmış": "1",
    "Yazdırılmadı": "2",
  };
  @observable
  String fiyatTipiGroupValue = "";

  @action
  void setfiyatTipiGroupValue(int value) {
    fiyatTipiGroupValue = fiyatTipiMap.values.toList()[value];
    model.fiyatTipi = fiyatTipiMap.values.toList()[value];
  }

  final Map<String, dynamic> fiyatTipiMap = {
    "Satış Fiyatı": "S",
    "Satış Fiyatı 1": "S1",
    "Satış Fiyatı 2": "S2",
    "Satış Fiyatı 3": "S3",
    "Satış Fiyatı 4": "S4",
    "Alış Fiyatı": "A",
    "Alış Fiyatı 1": "A1",
    "Alış Fiyatı 2": "A2",
    "Alış Fiyatı 3": "A3",
    "Alış Fiyatı 4": "A4",
  };
}
