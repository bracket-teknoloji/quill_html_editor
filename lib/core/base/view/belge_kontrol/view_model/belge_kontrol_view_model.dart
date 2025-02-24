import "package:mobx/mobx.dart";
import "package:picker/core/base/view/belge_kontrol/model/belge_kontrol_model.dart";
import "package:picker/core/base/view_model/listable_mixin.dart";
import "package:picker/core/base/view_model/mobx_network_mixin.dart";
import "package:picker/core/base/view_model/searchable_mixin.dart";
import "package:picker/core/init/network/login/api_urls.dart";

part "belge_kontrol_view_model.g.dart";

class BelgeKontrolViewModel = _BelgeKontrolViewModelBase with _$BelgeKontrolViewModel;

abstract class _BelgeKontrolViewModelBase
    with Store, MobxNetworkMixin, ListableMixin<BelgeKontrolModel>, SearchableMixin {
  @override
  @observable
  ObservableList<BelgeKontrolModel>? observableList;

  @override
  @action
  void setObservableList(List<BelgeKontrolModel>? list) => observableList = list?.asObservable();

  @override
  @action
  Future<void> getData() async {
    final result = await networkManager.dioPost(path: ApiUrls.getBelgekontrolBelgeleri, bodyModel: BelgeKontrolModel());
    if (result.isSuccess) setObservableList(result.dataList);
  }

  @override
  @action
  void changeSearchBarStatus() => isSearchBarOpen = !isSearchBarOpen;

  @override
  @observable
  bool isSearchBarOpen = false;

  @override
  @observable
  String? searchText;

  @override
  @action
  void setSearchText(String? value) => searchText = value;
}
