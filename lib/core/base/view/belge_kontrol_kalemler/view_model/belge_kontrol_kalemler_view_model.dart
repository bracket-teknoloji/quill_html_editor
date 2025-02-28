import "package:mobx/mobx.dart";
import "package:picker/core/base/view/belge_kontrol/model/belge_kontrol_model.dart";
import "package:picker/core/base/view/belge_kontrol_kalemler/model/belge_kontrol_kalemler_model.dart";
import "package:picker/core/base/view_model/listable_mixin.dart";
import "package:picker/core/base/view_model/mobx_network_mixin.dart";
import "package:picker/core/base/view_model/searchable_mixin.dart";
import "package:picker/core/init/network/login/api_urls.dart";

part "belge_kontrol_kalemler_view_model.g.dart";

class BelgeKontrolKalemlerViewModel = _BelgeKontrolKalemlerViewModelBase with _$BelgeKontrolKalemlerViewModel;

abstract class _BelgeKontrolKalemlerViewModelBase
    with Store, MobxNetworkMixin, ListableMixin<BelgeKontrolKalemlerModel>, SearchableMixin {
  @observable
  BelgeKontrolModel requestModel = BelgeKontrolModel();

  @override
  @observable
  ObservableList<BelgeKontrolKalemlerModel>? observableList;

  @override
  @observable
  bool isSearchBarOpen = false;

  @override
  @observable
  String? searchText = "";

  @computed
  ObservableList<BelgeKontrolKalemlerModel>? get filteredList {
    if (searchText == null || searchText!.isEmpty) return observableList;
    return observableList
        ?.where(
          (element) => [
            if (element.belgeNo case final value?) value,
            if (element.cariKodu case final value?) value,
            if (element.stokKodu case final value?) value,
            if (element.stokAdi case final value?) value,
          ].any((element) => element.toLowerCase().contains(searchText!.toLowerCase())),
        )
        .toList()
        .asObservable();
  }

  @override
  @action
  void setObservableList(List<BelgeKontrolKalemlerModel>? list) => observableList = list?.asObservable();
  @override
  @action
  void changeSearchBarStatus() {
    isSearchBarOpen = !isSearchBarOpen;
    if (!isSearchBarOpen) searchText = "";
  }

  @override
  @action
  void setSearchText(String? value) => searchText = value;

  @override
  @action
  Future<void> resetList() async {
    super.resetList();
    await getData();
  }

  @override
  @action
  Future<void> getData() async {
    final result = await networkManager.dioPost(
      path: ApiUrls.getBelgekontrolKalemleri,
      bodyModel: BelgeKontrolKalemlerModel(),
      data: requestModel.toJson(),
    );
    if (result.isSuccess) setObservableList(result.dataList);
  }

  @action
  Future<void> deleteKalem(BelgeKontrolKalemlerModel model) async {
    final result = await networkManager.dioPost(
      path: ApiUrls.saveBelgeKontrol,
      bodyModel: BelgeKontrolModel(),
      data: BelgeKontrolModel(id: model.kontrolId, islemKodu: 6, sira: model.sira).toJson(),
      showLoading: true,
    );
    if (result.isSuccess) await getData();
  }
}
