import "package:mobx/mobx.dart";
import "package:picker/core/base/view_model/listable_mixin.dart";
import "package:picker/core/base/view_model/mobx_network_mixin.dart";
import "package:picker/core/base/view_model/searchable_mixin.dart";
import "package:picker/core/constants/extensions/number_extensions.dart";
import "package:picker/core/init/network/login/api_urls.dart";
import "package:picker/view/main_page/alt_sayfalar/transfer/base_transfer_edit/transfer_mal_talebi_listesi_model.dart";

part "transfer_mal_talebi_listesi_view_model.g.dart";

class TransferMalTalebiListesiViewModel = _TransferMalTalebiListesiViewModelBase with _$TransferMalTalebiListesiViewModel;

abstract class _TransferMalTalebiListesiViewModelBase with Store, MobxNetworkMixin, ListableMixin<TransferMalTalebiListesiModel>, SearchableMixin {
  @observable
  @override
  ObservableList<TransferMalTalebiListesiModel>? observableList;
  @observable
  @override
  bool isSearchBarOpen = false;

  @observable
  @override
  String? searchText;

  @computed
  List<TransferMalTalebiListesiModel>? get filteredObservableList {
    if (searchText == null || searchText!.isEmpty) {
      return observableList;
    }
    return observableList?.where((element) => element.id.toStringIfNotNull?.contains(searchText!) ?? false).toList();
  }

  @action
  @override
  Future<void> getData() async {
    final result = await networkManager.dioPost(path: ApiUrls.getDepoTalepleri, bodyModel: TransferMalTalebiListesiModel());
    setObservableList(result.dataList);
  }

  @action
  @override
  Future<void> resetList() async {
    super.resetList();
    setSearchText(null);
    await getData();
  }

  @action
  @override
  void setObservableList(List<TransferMalTalebiListesiModel>? list) => observableList = list?.asObservable();

  @override
  void changeSearchBarStatus() => isSearchBarOpen = !isSearchBarOpen;
  @override
  void setSearchText(String? value) => searchText = value;
}
