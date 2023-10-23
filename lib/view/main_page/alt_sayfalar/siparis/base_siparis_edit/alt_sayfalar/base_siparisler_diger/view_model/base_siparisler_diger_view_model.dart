import "package:mobx/mobx.dart";

part "base_siparisler_diger_view_model.g.dart";

class BaseSiparislerDigerViewModel = _BaseSiparislerDigerViewModelBase with _$BaseSiparislerDigerViewModel;

abstract class _BaseSiparislerDigerViewModelBase with Store {
  @observable
  bool isInit = false;

  @action
  void init() => isInit = true;
}
