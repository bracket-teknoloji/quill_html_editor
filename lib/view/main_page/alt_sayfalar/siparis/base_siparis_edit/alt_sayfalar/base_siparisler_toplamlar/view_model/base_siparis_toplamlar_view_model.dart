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
}