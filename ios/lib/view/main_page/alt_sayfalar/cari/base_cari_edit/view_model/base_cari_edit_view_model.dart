import "package:mobx/mobx.dart";

part "base_cari_edit_view_model.g.dart";

class BaseCariEditViewModel = _BaseCariEditViewModelBase with _$BaseCariEditViewModel;

abstract class _BaseCariEditViewModelBase with Store {
  @observable
  bool isValidate = true;

  @action
  void setIsValidate(bool value) {
    isValidate = value;
  }
}
