import "package:mobx/mobx.dart";
import "package:picker/core/base/model/ek_rehber_request_model.dart";
import "package:picker/core/base/view/genel_rehber/model/genel_rehber_model.dart";
import "package:picker/core/base/view_model/listable_mixin.dart";
import "package:picker/core/base/view_model/mobx_network_mixin.dart";
import "package:picker/core/base/view_model/searchable_mixin.dart";
import "package:picker/core/init/network/login/api_urls.dart";

part "genel_rehber_view_model.g.dart";

class GenelRehberViewModel = _GenelRehberViewModelBase with _$GenelRehberViewModel;

abstract class _GenelRehberViewModelBase with Store, MobxNetworkMixin, ListableMixin<GenelRehberModel>, SearchableMixin {
  _GenelRehberViewModelBase(this.requestModel);

  @observable
  EkRehberRequestModel? requestModel;

  @observable
  @override
  ObservableList<GenelRehberModel>? observableList;

  @observable
  @override
  bool isSearchBarOpen = false;

  @observable
  @override
  String? searchText = "";

  @computed
  ObservableList<GenelRehberModel>? get filteredObservableList => observableList
      ?.where(
        (element) => (element.adi?.toLowerCase().contains(searchText?.toLowerCase() ?? "") ?? false) || (element.kodu?.toLowerCase().contains(searchText?.toLowerCase() ?? "") ?? false),
      )
      .toList()
      .asObservable();

  @action
  @override
  void changeSearchBarStatus() => isSearchBarOpen = !isSearchBarOpen;

  @action
  @override
  void setSearchText(String? value) => searchText = value;

  @action
  @override
  void setObservableList(List<GenelRehberModel>? list) => observableList = list?.asObservable();

  @action
  @override
  Future<void> getData() async {
    final result = await networkManager.dioPost(path: ApiUrls.getGenelRehber, bodyModel: GenelRehberModel(), data: requestModel?.toJson());
    if (result.isSuccess) {
      setObservableList(result.dataList);
    }
  }
}
