import "package:mobx/mobx.dart";

import "../../../../cari_listesi/model/cari_listesi_model.dart";

part "base_cari_genel_edit_view_model.g.dart";

class BaseCariGenelEditViewModel = _BaseCariGenelEditViewModelBase with _$BaseCariGenelEditViewModel;

abstract class _BaseCariGenelEditViewModelBase with Store {
  @observable
  bool isSahisFirmasi = false;

  @action
  void changeIsSahisFirmasi(bool value) {
    isSahisFirmasi = value;
  }

  @observable
  bool isDovizli = false;

  @action
  void changeIsDovizli(bool value) {
    isDovizli = value;
  }

  @observable
  CariListesiModel? model;

  @action
  void changeModel(CariListesiModel? value) {
    value?.subeKodu ??= -1;
    value?.kilit ??= "H";
    CariListesiModel.setInstance(value!);
    model = value;
  }
}
