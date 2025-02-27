import "package:mobx/mobx.dart";
import "package:picker/core/base/model/base_network_mixin.dart";
import "package:picker/core/base/model/generic_response_model.dart";
import "package:picker/core/base/view/belge_kontrol/model/belge_kontrol_model.dart";
import "package:picker/core/base/view/belge_kontrol/model/belge_kontrol_request_model.dart";
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

  @observable
  BelgeKontrolRequestModel requestModel = BelgeKontrolRequestModel(durum: "T");

  @action
  void setBaslangicTarihi(String? value) => requestModel.baslamaTarihi = value != "" ? value : null;

  @action
  void setBitisTarihi(String? value) => requestModel.bitisTarihi = value != "" ? value : null;

  @computed
  ObservableList<BelgeKontrolModel>? get filteredList {
    if (searchText == null || searchText!.isEmpty) return observableList;
    return observableList
        ?.where(
          (element) => [
            if (element.belgeNo != null) element.belgeNo,
            if (element.cariAdi != null) element.cariAdi,
            if (element.cariKodu != null) element.cariKodu,
          ].cast<String>().any((element2) => element2.contains(searchText!)),
        )
        .toList()
        .asObservable();
  }

  @override
  @action
  void setObservableList(List<BelgeKontrolModel>? list) => observableList = list?.asObservable();

  @override
  @action
  Future<void> getData() async {
    final result = await networkManager.dioPost(
      path: ApiUrls.getBelgekontrolBelgeleri,
      bodyModel: BelgeKontrolModel(),
      data: requestModel.toJson(),
    );
    if (result.isSuccess) setObservableList(result.dataList);
  }

  @override
  Future<void> resetList() async {
    super.resetList();
    return getData();
  }

  @action
  Future<GenericResponseModel<NetworkManagerMixin>> deletekontrol(int id) async => await networkManager.dioPost(
    path: ApiUrls.saveBelgeKontrol,
    data: BelgeKontrolModel(id: id, islemKodu: 3).toJson(),
    bodyModel: BelgeKontrolModel(),
  );

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
