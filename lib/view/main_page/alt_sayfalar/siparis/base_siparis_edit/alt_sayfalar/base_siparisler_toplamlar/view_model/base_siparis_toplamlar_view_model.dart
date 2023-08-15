import "package:mobx/mobx.dart";

part "base_siparis_toplamlar_view_model.g.dart";

class BaseSiparisToplamlarViewModel = _BaseSiparisToplamlarViewModelBase with _$BaseSiparisToplamlarViewModel;

abstract class _BaseSiparisToplamlarViewModelBase with Store {
  @observable
  bool isGenIsk1O = false;

  @observable
  bool isGenIsk2O = false;

  @observable
  bool isGenIsk3O = false;

  @action
  void changeGenIsk1O() => isGenIsk1O = !isGenIsk1O;

  @action
  void changeGenIsk2O() => isGenIsk2O = !isGenIsk2O;

  @action
  void changeGenIsk3O() => isGenIsk3O = !isGenIsk3O;

  Map<String, double> tevkifatMap = {
    "9/10 (Varsayılan)": 0.9,
    "1/10": 0.1,
    "2/10": 0.2,
    "3/10": 0.3,
    "4/10": 0.4,
    "5/10": 0.5,
    "6/10": 0.6,
    "7/10": 0.7,
    "8/10": 0.8,
    "9/10": 0.9,
  };
}
