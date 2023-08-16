import "package:mobx/mobx.dart";

import "../model/base_siparis_edit_model.dart";

part "base_siparis_editing_view_model.g.dart";

class BaseSiparisEditingViewModel = _BaseSiparisEditingViewModelBase with _$BaseSiparisEditingViewModel;

abstract class _BaseSiparisEditingViewModelBase with Store {
  @observable
  bool isLastPage = false;

  @action
  void changeIsLastPage(bool value) => isLastPage = value;

  @computed
  int get getKalemCount => BaseSiparisEditModel.instance.getKalemSayisi;

  @observable
  bool isBaseSiparisEmpty = BaseSiparisEditModel.instance.isEmpty;

  @action
  void changeIsBaseSiparisEmpty(bool value) => isBaseSiparisEmpty = value;
  @action
  void changeFuture() {
    changeIsBaseSiparisEmpty(BaseSiparisEditModel.instance.isEmpty);
  }
  @observable
  bool yeniKaydaHazirlaMi = false;

  @action
  void changeYeniKaydaHazirlaMi() => yeniKaydaHazirlaMi = !yeniKaydaHazirlaMi;
}
