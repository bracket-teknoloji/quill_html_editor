import "package:mobx/mobx.dart";

part "base_fatura_edit_view_model.g.dart";

class BaseFaturaEditViewModel = _BaseFaturaEditViewModelBase with _$BaseFaturaEditViewModel;

abstract class _BaseFaturaEditViewModelBase with Store {
  @observable
  bool isLastPage = false;

  @observable
  bool isLoaded = false;

  @action
  void changeIsLastPage(bool value) => isLastPage = value;

  @action
  void changeIsLoaded(bool value) => isLoaded = value;  
}
