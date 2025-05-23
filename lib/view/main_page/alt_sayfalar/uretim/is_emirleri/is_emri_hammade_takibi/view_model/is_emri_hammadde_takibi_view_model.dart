import "package:mobx/mobx.dart";

import "../../../../../../../core/base/view_model/listable_mixin.dart";
import "../../../../../../../core/base/view_model/mobx_network_mixin.dart";
import "../../../../../../../core/base/view_model/searchable_mixin.dart";
import "../../../../../../../core/init/network/login/api_urls.dart";
import "../model/is_emri_hammadde_takibi_listesi_model.dart";

part "is_emri_hammadde_takibi_view_model.g.dart";

final class IsEmriHammaddeTakibiViewModel = _IsEmriHammaddeTakibiViewModelBase with _$IsEmriHammaddeTakibiViewModel;

abstract class _IsEmriHammaddeTakibiViewModelBase
    with Store, MobxNetworkMixin, ListableMixin<IsEmriHammaddeTakibiListesiModel>, SearchableMixin {
  @override
  @observable
  String? searchText;
  @override
  @observable
  bool isSearchBarOpen = false;
  @override
  @observable
  ObservableList<IsEmriHammaddeTakibiListesiModel>? observableList;
  @override
  @action
  void setSearchText(String? value) => searchText = value;

  @computed
  ObservableList<IsEmriHammaddeTakibiListesiModel>? get getList => observableList
      ?.where(
        (element) =>
            (element.stokKodu?.toLowerCase().contains(searchText?.toLowerCase() ?? "") ?? false) ||
            (element.isemrino?.toLowerCase().contains(searchText?.toLowerCase() ?? "") ?? false),
      )
      .toList()
      .asObservable();
  @override
  @action
  void changeSearchBarStatus() {
    isSearchBarOpen = !isSearchBarOpen;
    if (!isSearchBarOpen) {
      setSearchText(null);
      getData();
    }
  }

  @override
  @action
  void setObservableList(List<IsEmriHammaddeTakibiListesiModel>? list) => observableList = list?.asObservable();
  @override
  @action
  Future<void> getData() async {
    if (observableList != null) {
      setObservableList(null);
    }
    final result = await networkManager.dioGet(
      path: ApiUrls.getIsemriHammaddeTakipListe,
      bodyModel: IsEmriHammaddeTakibiListesiModel(),
    );
    if (result.isSuccess) {
      setObservableList(result.dataList);
    }
  }
}
