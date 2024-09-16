import "package:mobx/mobx.dart";

import "../../../../../view/add_company/model/account_model.dart";
import "../../../../init/network/login/api_urls.dart";
import "../../../view_model/listable_mixin.dart";
import "../../../view_model/mobx_network_mixin.dart";
import "../model/surum_yenilikleri_model.dart";

part "surum_yenilikleri_view_model.g.dart";

class SurumYenilikleriViewModel = _SurumYenilikleriViewModelBase with _$SurumYenilikleriViewModel;

abstract class _SurumYenilikleriViewModelBase with Store, MobxNetworkMixin, ListableMixin<SurumYenilikleriModel> {
  @observable
  bool searchBar = false;

  @observable
  String? searchText;

  @override
  @observable
  ObservableList<SurumYenilikleriModel>? observableList;

  @computed
  ObservableList<SurumYenilikleriModel>? get getSurumYenilikleriModelList => (searchText != null && searchText != "")
      ? observableList?.where((element) => element.liste?.any((element) => element.aciklama?.toLowerCase().contains(searchText!.toLowerCase()) ?? false) ?? false).toList().asObservable()
      : observableList;

  @action
  void setSearchText(String? value) => searchText = value;

  @action
  void changeSearchBar() => searchBar = !searchBar;

  @override
  @action
  void setObservableList(List<SurumYenilikleriModel>? value) => observableList = value?.asObservable();

  @override
  @action
  Future<void> getData() async {
    if (observableList != null) setObservableList(null);
    final result = await networkManager.dioPost<SurumYenilikleriModel>(
      path: ApiUrls.surumYenilikleri,
      bodyModel: SurumYenilikleriModel(),
      data: AccountModel.instance.toJson(),
      addCKey: false,
      addTokenKey: false,
      addQuery: false,
      addSirketBilgileri: false,
    );
    if (result.isSuccess) {
      setObservableList(result.dataList);
    } else {
      observableList = null;
    }
  }
}
