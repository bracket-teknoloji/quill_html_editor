import "package:mobx/mobx.dart";

import "../../../../../../../core/base/view_model/base_scrolled_view_model.dart";

part "kasa_listesi_view_model.g.dart";

class KasaListesiViewModel = _KasaListesiViewModelBase with _$KasaListesiViewModel;

abstract class _KasaListesiViewModelBase with Store, BaseScrolledViewModelMixin {
  //* Observables
  @observable
  bool dahaVarMi = true;

  @observable
  bool searchBar = true;

  @observable
  bool isScrollDown = true;

  //* Computed

  //* Actions
  @action
  void setDahaVarMi(bool value) => dahaVarMi = value;

  @action
  void setSearchBar() => searchBar = !searchBar;

  @action
  void setIsScrollDown(bool value) => isScrollDown = value;
}
