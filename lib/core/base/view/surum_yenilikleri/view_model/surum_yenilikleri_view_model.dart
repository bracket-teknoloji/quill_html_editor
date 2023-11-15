import "package:mobx/mobx.dart";
import "../model/surum_yenilikleri_model.dart";
import "../../../view_model/mobx_network_mixin.dart";
import "../../../../init/network/login/api_urls.dart";
import "../../../../../view/add_company/model/account_model.dart";

part "surum_yenilikleri_view_model.g.dart";

class SurumYenilikleriViewModel = _SurumYenilikleriViewModelBase with _$SurumYenilikleriViewModel;

abstract class _SurumYenilikleriViewModelBase with Store, MobxNetworkMixin {
  @observable
  bool searchBar = false;

  @observable
  String? searchText;

  @observable
  ObservableList<SurumYenilikleriModel>? surumYenilikleriModelList;

  @computed
  ObservableList<SurumYenilikleriModel>? get getSurumYenilikleriModelList => (searchText != null && searchText != "")
      ? surumYenilikleriModelList?.where((element) => element.liste?.any((element) => element.aciklama?.toLowerCase().contains(searchText!.toLowerCase()) ?? false) ?? false).toList().asObservable()
      : surumYenilikleriModelList;

  @action
  void setSearchText(String? value) => searchText = value;

  @action
  void changeSearchBar() => searchBar = !searchBar;

  @action
  void setSurumYenilikleriModelList(List<SurumYenilikleriModel>? value) => surumYenilikleriModelList = value?.asObservable();

  @action
  Future<void> getData() async {
    final result = await networkManager.dioPost<SurumYenilikleriModel>(path: ApiUrls.surumYenilikleri, bodyModel: SurumYenilikleriModel(), data: AccountModel.instance.toJson());
    if (result.success == true && result.data is List) {
      setSurumYenilikleriModelList(result.data.map((e) => e as SurumYenilikleriModel).toList().cast<SurumYenilikleriModel>());
    } else {
      surumYenilikleriModelList = null;
    }
  }
}
