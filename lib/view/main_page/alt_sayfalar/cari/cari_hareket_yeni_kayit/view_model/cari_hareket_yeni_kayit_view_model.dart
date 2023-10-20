import "package:mobx/mobx.dart";

import "../../../../../../core/base/model/base_proje_model.dart";
import "../model/cari_hareket_yeni_kayit_model.dart";

part "cari_hareket_yeni_kayit_view_model.g.dart";

class CariHareketYeniKayitViewModel = _CariHareketYeniKayitViewModelBase with _$CariHareketYeniKayitViewModel;

abstract class _CariHareketYeniKayitViewModelBase with Store {
  @observable
  List<BaseProjeModel> projeList = <BaseProjeModel>[];

  @action
  void setProjeList(List<BaseProjeModel>? value) {
    if (value != null) {
      projeList = value;
    }
  }

  @observable
  CariHareketYeniKayitModel model = CariHareketYeniKayitModel();

  @computed
  String get getHareketKodu => model.hareketKodu ?? "";

  @action
  void setModelHareketKodu(String value) {
    model.hareketKodu = value;
  }

  @observable
  List<bool> isSelected = <bool>[true, false];

  @action
  void setIsSelected(int index) {
    isSelected = <bool>[false, false];
    isSelected[index] = true;
    if (index == 0) {
      model.borc ??= model.alacak;
      model.alacak = null;
    } else {
      model.alacak ??= model.borc;
      model.borc = null;
    }
  }

  List<String> get toggleButtonLabelList => <String>["Borç", "Alacak"];
}
