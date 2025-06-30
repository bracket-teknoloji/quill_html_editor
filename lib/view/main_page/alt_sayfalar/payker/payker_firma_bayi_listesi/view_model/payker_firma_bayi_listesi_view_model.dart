import "package:mobx/mobx.dart";
import "package:picker/core/base/view_model/listable_mixin.dart";
import "package:picker/core/base/view_model/mobx_network_mixin.dart";
import "package:picker/core/base/view_model/searchable_mixin.dart";
import "package:picker/view/main_page/alt_sayfalar/payker/payker_firma_bayi_listesi/model/payker_drop_down_model.dart";

part "payker_firma_bayi_listesi_view_model.g.dart";

class PaykerFirmaBayiListesiViewModel = _PaykerFirmaBayiListesiViewModelBase with _$PaykerFirmaBayiListesiViewModel;

abstract class _PaykerFirmaBayiListesiViewModelBase
    with Store, MobxNetworkMixin, ListableMixin<PaykerFirmaModel>, SearchableMixin {
  @override
  @action
  void changeSearchBarStatus() {
    isSearchBarOpen = !isSearchBarOpen;
  }

  @override
  @action
  Future<void> getData() async {
    final result = await networkManager.getPaykerFirmalar();
    if (result != null) {
      setObservableList(result.results);
    } else {
      setObservableList(null);
    }
  }

  @override
  @observable
  bool isSearchBarOpen = false;

  @override
  @observable
  ObservableList<PaykerFirmaModel>? observableList;

  @override
  @observable
  String? searchText;

  @override
  @action
  void setObservableList(List<PaykerFirmaModel>? list) => observableList = list?.asObservable();

  @override
  @action
  void setSearchText(String? value) {
    searchText = value;
  }
}
