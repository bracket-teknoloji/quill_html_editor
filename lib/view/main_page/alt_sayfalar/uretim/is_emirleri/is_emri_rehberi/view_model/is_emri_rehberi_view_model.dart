import "package:flutter/widgets.dart";
import "package:mobx/mobx.dart";
import "package:picker/core/base/view_model/listable_mixin.dart";
import "package:picker/core/base/view_model/mobx_network_mixin.dart";
import "package:picker/core/base/view_model/pageable_mixin.dart";
import "package:picker/core/base/view_model/scroll_controllable_mixin.dart";
import "package:picker/core/base/view_model/searchable_mixin.dart";
import "package:picker/core/init/network/login/api_urls.dart";
import "package:picker/view/main_page/alt_sayfalar/siparis/siparisler/model/siparisler_request_model.dart";
import "package:picker/view/main_page/alt_sayfalar/uretim/is_emirleri/is_emri_rehberi/model/is_emirleri_model.dart";

part "is_emri_rehberi_view_model.g.dart";

class IsEmriRehberiViewModel = _IsEmriRehberiViewModelBase with _$IsEmriRehberiViewModel;

abstract class _IsEmriRehberiViewModelBase with Store, MobxNetworkMixin, ListableMixin<IsEmirleriModel>, SearchableMixin, ScrollControllableMixin, PageableMixin {
  SiparislerRequestModel get requestModel => SiparislerRequestModel(
        menuKodu: "URET_ISEM",
        sayfa: page,
        searchText: searchText,
        stokKodu: stokKodu,
        cariKodu: null,
        ekranTipi: null,
        belgeNo: null,
      );

  @override
  @observable
  bool isSearchBarOpen = false;

  @override
  @observable
  bool isScrollDown = true;

  @override
  @observable
  String? searchText;

  @observable
  String? stokKodu;
  @override
  @observable
  ObservableList<IsEmirleriModel>? observableList;

  @override
  @action
  Future<void> changeSearchBarStatus() async {
    isSearchBarOpen = !isSearchBarOpen;
    if (!isSearchBarOpen) {
      setSearchText(null);
      await resetList();
    }
  }

  @override
  @action
  void setSearchText(String? value) => searchText = value;

  @action
  void setIsScrollDown(bool value) => isScrollDown = value;

  @action
  void setStokKodu(String? value) => stokKodu = value;

  @override
  @action
  void setObservableList(List<IsEmirleriModel>? list) => observableList = list?.asObservable();

  @override
  @action
  void addObservableList(List<IsEmirleriModel>? list) => setObservableList(observableList?..addAll(list!));

  @override
  Future<void> changeScrollStatus(ScrollPosition position) async {
    super.changeScrollStatus(position);
    if (position.pixels == position.maxScrollExtent && dahaVarMi) {
      await getData();
      isScrollDown = false;
    }
  }

  @override
  @action
  Future<void> resetList() async {
    resetPage();
    await getData();
  }

  @override
  @action
  Future<void> getData() async {
    final result = await networkManager.dioGet(path: ApiUrls.getIsEmirleri, bodyModel: IsEmirleriModel(), queryParameters: requestModel.toJson());
    if (result.isSuccess) {
      if (page > 1) {
        addObservableList(result.dataList);
      } else {
        setObservableList(result.dataList);
      }
      if (result.dataList.length >= parametreModel.sabitSayfalamaOgeSayisi) {
        setDahaVarMi(true);
        increasePage();
      } else {
        setDahaVarMi(false);
      }
    }
  }
}
