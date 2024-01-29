import "package:mobx/mobx.dart";
import "package:picker/core/base/view/stok_rehberi/model/stok_rehberi_request_model.dart";
import "package:picker/core/base/view_model/mobx_network_mixin.dart";
import "package:picker/core/constants/extensions/date_time_extensions.dart";
import "package:picker/core/init/network/login/api_urls.dart";
import "package:picker/view/main_page/alt_sayfalar/stok/base_stok_edit/model/stok_detay_model.dart";

part "seri_rehberi_view_model.g.dart";

class SeriRehberiViewModel = _SeriRehberiViewModelBase with _$SeriRehberiViewModel;

abstract class _SeriRehberiViewModelBase with Store, MobxNetworkMixin {
  @observable
  ObservableList<SeriList>? seriList;

  @observable
  StokRehberiRequestModel requestModel = StokRehberiRequestModel(ekranTipi: "R", belgeTarihi: DateTime.now().toDateString);

  @observable
  String searchText = "";

  @observable
  bool searchBar = false;

  @computed
  ObservableList<SeriList>? get filteredList => seriList?.where((element) => element.seriNo?.toLowerCase().contains(searchText) ?? true).toList().asObservable();
  @action
  void setSeriList(List<SeriList>? list) => seriList = list?.asObservable();

  @action
  void setSearchText(String value) => searchText = value;

  @action
  void changeSearchBar() {
    searchBar = !searchBar;
    if (!searchBar) {
      searchText = "";
    }
  }

  @action
  Future<void> getData() async {
    setSeriList(null);
    final result = await networkManager.dioPost(path: ApiUrls.getSeriler, bodyModel: SeriList(), data: requestModel.toJson());
    if (result.data is List) {
      final List<SeriList> seriList = (result.data as List).map((e) => e as SeriList).toList();
      setSeriList(seriList);
    }
  }
}
