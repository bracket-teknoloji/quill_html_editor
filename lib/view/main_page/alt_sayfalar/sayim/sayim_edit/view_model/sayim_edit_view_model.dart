import "package:mobx/mobx.dart";

part "sayim_edit_view_model.g.dart";

class SayimEditViewModel = _SayimEditViewModelBase with _$SayimEditViewModel;

abstract class _SayimEditViewModelBase with Store {
  @observable
  int tabIndex = 0;

  @computed
  bool get indexSifirMi => tabIndex == 0;

  @action
  void setTabIndex(int value) => tabIndex = value;
}
