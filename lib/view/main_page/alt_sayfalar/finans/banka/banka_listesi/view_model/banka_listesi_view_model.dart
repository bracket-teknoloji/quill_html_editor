import "package:mobx/mobx.dart";
import "package:picker/core/base/view_model/mobx_network_mixin.dart";

part "banka_listesi_view_model.g.dart";

class BankaListesiViewModel = _BankaListesiViewModelBase with _$BankaListesiViewModel;

abstract class _BankaListesiViewModelBase with Store, MobxNetworkMixin {


  @observable
  bool searchBar = false;

  @action
  void setSearchBar() => searchBar = !searchBar;
}
