import "package:mobx/mobx.dart";
import "package:picker/core/base/view/stok_rehberi/model/stok_rehberi_request_model.dart";
import "package:picker/core/base/view_model/listable_mixin.dart";
import "package:picker/core/base/view_model/mobx_network_mixin.dart";
import "package:picker/core/base/view_model/searchable_mixin.dart";
import "package:picker/core/constants/extensions/date_time_extensions.dart";
import "package:picker/core/init/network/login/api_urls.dart";
import "package:picker/view/main_page/alt_sayfalar/stok/base_stok_edit/model/stok_detay_model.dart";

part "seri_rehberi_view_model.g.dart";

class SeriRehberiViewModel = _SeriRehberiViewModelBase with _$SeriRehberiViewModel;

abstract class _SeriRehberiViewModelBase with Store, MobxNetworkMixin, ListableMixin<SeriList>, SearchableMixin {
  @override
  @observable
  ObservableList<SeriList>? observableList;

  @observable
  StokRehberiRequestModel requestModel = StokRehberiRequestModel(
    ekranTipi: "R",
    belgeTarihi: DateTime.now().toDateString,
  );

  @override
  @observable
  String? searchText = "";

  @override
  @observable
  bool isSearchBarOpen = false;

  @computed
  ObservableList<SeriList>? get filteredList => observableList?.where((element) => element.seriNo?.toLowerCase().contains(searchText?.toLowerCase() ?? "") ?? true).toList().asObservable();
  @override
  @action
  void setObservableList(List<SeriList>? list) => observableList = list?.asObservable();

  @override
  @action
  void setSearchText(String? value) => searchText = value;

  @override
  @action
  void changeSearchBarStatus() {
    isSearchBarOpen = !isSearchBarOpen;
    if (!isSearchBarOpen) {
      searchText = "";
      getData();
    }
  }

  @override
  @action
  Future<void> getData() async {
    if (observableList != null) {
      setObservableList(null);
    }
    final result = await networkManager.dioPost(path: ApiUrls.getSeriler, bodyModel: SeriList(), data: requestModel.toJson());
    if (result.isSuccess) {
      setObservableList(result.dataList);
    }
  }
}
