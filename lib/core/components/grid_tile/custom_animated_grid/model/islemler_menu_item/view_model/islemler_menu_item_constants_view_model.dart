import "package:mobx/mobx.dart";

part "islemler_menu_item_constants_view_model.g.dart";

class IslemlerMenuItemConstantsViewModel = _IslemlerMenuItemConstantsViewModelBase
    with _$IslemlerMenuItemConstantsViewModel;

abstract class _IslemlerMenuItemConstantsViewModelBase with Store {
  @observable
  bool cariKodDegistirSwitch = false;

  @action
  void changeCariKodDegistirSwitch(bool value) => cariKodDegistirSwitch = value;
}
