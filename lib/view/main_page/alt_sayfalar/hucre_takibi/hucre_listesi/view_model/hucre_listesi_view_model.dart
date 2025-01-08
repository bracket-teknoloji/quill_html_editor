import "package:mobx/mobx.dart";
import "package:picker/core/base/view_model/listable_mixin.dart";
import "package:picker/core/base/view_model/mobx_network_mixin.dart";
import "package:picker/core/base/view_model/searchable_mixin.dart";
import "package:picker/core/init/network/login/api_urls.dart";
import "package:picker/view/main_page/alt_sayfalar/hucre_takibi/hucre_listesi/model/hucre_listesi_model.dart";
import "package:picker/view/main_page/alt_sayfalar/hucre_takibi/hucre_listesi/model/hucre_listesi_request_model.dart";

part "hucre_listesi_view_model.g.dart";

final class HucreListesiViewModel = _HucreListesiViewModelBase with _$HucreListesiViewModel;

abstract class _HucreListesiViewModelBase with Store, MobxNetworkMixin, ListableMixin<HucreListesiModel>, SearchableMixin {
  @observable
  HucreListesiRequestModel requestModel = HucreListesiRequestModel();

  @override
  @observable
  ObservableList<HucreListesiModel>? observableList;

  @override
  @observable
  String? searchText;

  @computed
  ObservableList<HucreListesiModel>? get filteredHucreListesi {
    if (observableList == null) return null;
    if (searchText == null) return observableList;
    return observableList!.where((element) => element.hucreKodu?.toLowerCase().contains((searchText ?? "").toLowerCase()) ?? false).toList().asObservable();
  }

  @override
  void changeSearchBarStatus() {}

  @override
  bool get isSearchBarOpen => false;
  @override
  @action
  void setSearchText(String? value) => searchText = value;

  @action
  void setDepoKodu(int? value) => requestModel = requestModel.copyWith(depoKodu: value);

  @override
  @action
  void setObservableList(List<HucreListesiModel>? list) => observableList = list?.asObservable();

  @override
  @action
  Future<void> getData() async {
    setObservableList(null);
    final result = await networkManager.dioGet(path: ApiUrls.getHucreListesi, queryParameters: requestModel.toJson(), bodyModel: HucreListesiModel());
    if (result.isSuccess) {
      setObservableList(result.dataList);
    }
  }
}
