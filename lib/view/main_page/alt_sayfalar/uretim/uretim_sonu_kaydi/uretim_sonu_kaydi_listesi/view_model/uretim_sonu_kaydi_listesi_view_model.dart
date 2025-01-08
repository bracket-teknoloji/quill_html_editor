import "package:flutter/material.dart";
import "package:mobx/mobx.dart";

import "../../../../../../../core/base/model/base_network_mixin.dart";
import "../../../../../../../core/base/model/generic_response_model.dart";
import "../../../../../../../core/base/view_model/listable_mixin.dart";
import "../../../../../../../core/base/view_model/mobx_network_mixin.dart";
import "../../../../../../../core/base/view_model/pageable_mixin.dart";
import "../../../../../../../core/base/view_model/scroll_controllable_mixin.dart";
import "../../../../../../../core/base/view_model/searchable_mixin.dart";
import "../../../../../../../core/init/network/login/api_urls.dart";
import "../../../../siparis/base_siparis_edit/model/base_siparis_edit_model.dart";
import "../model/uretim_sonu_kaydi_listesi_request_model.dart";

part "uretim_sonu_kaydi_listesi_view_model.g.dart";

final class UretimSonuKaydiListesiViewModel = _UretimSonuKaydiListesiViewModelBase with _$UretimSonuKaydiListesiViewModel;

abstract class _UretimSonuKaydiListesiViewModelBase with Store, MobxNetworkMixin, ListableMixin<KalemModel>, SearchableMixin, ScrollControllableMixin, PageableMixin {
  /// İsteği atarken data'ları güncel olarak alsın diye getter fonksiyon olarak ayarlandı.
  UretimSonuKaydiListesiRequestModel get requestModel => UretimSonuKaydiListesiRequestModel(ekranTipi: "L", sayfa: page, searchText: searchText);

  @override
  @observable
  bool isSearchBarOpen = false;

  @override
  @observable
  bool isScrollDown = true;

  @override
  @observable
  String? searchText;
  @override
  @observable
  ObservableList<KalemModel>? observableList;

  @override
  @action
  void changeSearchBarStatus() {
    isSearchBarOpen = !isSearchBarOpen;
    if (!isSearchBarOpen) {
      setSearchText(null);
      resetList();
    }
  }

  @override
  @action
  void setSearchText(String? value) => searchText = value;

  @override
  @action
  void setObservableList(List<KalemModel>? list) => observableList = list?.asObservable();

  @override
  @action
  void addObservableList(List<KalemModel>? list) => setObservableList(observableList?..addAll(list!));

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

  @action
  Future<GenericResponseModel<NetworkManagerMixin>> deleteItem(KalemModel item) async =>
      await networkManager.dioPost(path: ApiUrls.deleteUSK, bodyModel: KalemModel(), showLoading: true, queryParameters: {"BelgeNo": item.belgeNo});

  @override
  @action
  Future<void> getData() async {
    final result = await networkManager.dioGet(path: ApiUrls.getUSKListesi, bodyModel: KalemModel(), queryParameters: requestModel.toJson());
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
