import "package:get/get.dart";
import "package:kartal/kartal.dart";
import "package:mobx/mobx.dart";
import "package:picker/core/base/model/base_proje_model.dart";
import "package:picker/core/components/dialog/bottom_sheet/model/bottom_sheet_model.dart";

import "../model/urun_grubuna_gore_satis_grafigi_model.dart";
import "../model/urun_grubuna_gore_satis_grafigi_request_model.dart";

part "urun_grubuna_gore_satis_grafigi_view_model.g.dart";

class UrunGrubunaGoreSatisGrafigiViewModel = _UrunGrubunaGoreSatisGrafigiViewModelBase with _$UrunGrubunaGoreSatisGrafigiViewModel;

abstract class _UrunGrubunaGoreSatisGrafigiViewModelBase with Store {
  final List<String> donemTipiList = ["TUMU", "BUGUN", "DUN", "BU_HAFTA", "BU_AY", "GECEN_AY", "SON_3_AY", "BU_YIL", "GECEN_YIL", "OZEL"];

  List<BottomSheetModel> grupNoBottomSheetList = ["Stok Grup Kodu", "Stok Kod 1", "Stok Kod 2", "Stok Kod 3", "Stok Kod 4", "Stok Kod 5"]
      .mapIndexed((index, element) => BottomSheetModel(title: element, onTap: () => Get.back(result: element)))
      .toList();
  @observable
  UrunGrubunaGoreSatisGrafigiRequestModel model = UrunGrubunaGoreSatisGrafigiRequestModel();

  @observable
  List<BaseProjeModel>? projeList;
  
  @action
  void setProjeList(List<BaseProjeModel>? value) => projeList = value;

  @observable
  bool irsDahilValue = false;

  @action
  void setIrsDahilValue(bool value) {
    irsDahilValue = value;
    value ? model.irsDahil = "E" : model.irsDahil = "H";
  }

  @observable
  int donemTipiIndex = 0;

  @observable
  ObservableList<UrunGrubunaGoreSatisGrafigiModel>? modelList;

  @action
  void setModelList(List<UrunGrubunaGoreSatisGrafigiModel>? value) => modelList = value?.asObservable();
}
