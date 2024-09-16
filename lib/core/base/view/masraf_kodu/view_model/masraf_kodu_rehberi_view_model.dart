import "package:flutter/material.dart";
import "package:mobx/mobx.dart";

import "../../../../../view/main_page/alt_sayfalar/siparis/siparisler/model/siparis_edit_request_model.dart";
import "../../../../init/network/login/api_urls.dart";
import "../../../view_model/listable_mixin.dart";
import "../../../view_model/mobx_network_mixin.dart";
import "../../../view_model/pageable_mixin.dart";
import "../../../view_model/scroll_controllable_mixin.dart";
import "../../../view_model/searchable_mixin.dart";
import "../model/masraf_kodu_rehberi_model.dart";

part "masraf_kodu_rehberi_view_model.g.dart";

class MasrafKoduRehberiViewModel = _MasrafKoduRehberiViewModelBase with _$MasrafKoduRehberiViewModel;

abstract class _MasrafKoduRehberiViewModelBase with Store, MobxNetworkMixin, ListableMixin<MasrafKoduRehberiModel>, SearchableMixin, ScrollControllableMixin, PageableMixin {
  @override
  @observable
  ObservableList<MasrafKoduRehberiModel>? observableList;

  @observable
  SiparisEditRequestModel requestModel = SiparisEditRequestModel(sayfa: 1);

  @override
  @observable
  bool isSearchBarOpen = true;

  @override
  bool isScrollDown = false;

  @override
  String? searchText;

  @action
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
  Future<void> changeSearchBarStatus() async {
    isSearchBarOpen = !isSearchBarOpen;
    if (!isSearchBarOpen) {
      searchText = null;
      resetList();
    }
  }

  @action
  void changeSearchBar() {
    isSearchBarOpen = !isSearchBarOpen;
    if (!isSearchBarOpen) {
      setSearchText(null);
    }
    resetPage();
  }

  @override
  @action
  void setSearchText(String? value) => searchText = value;

  @override
  @action
  void setObservableList(List<MasrafKoduRehberiModel>? value) => observableList = value?.asObservable();

  @override
  @action
  void addObservableList(List<MasrafKoduRehberiModel>? value) => setObservableList(observableList?..addAll(value!));

  @override
  @action
  Future<void> resetList() async {
    setObservableList(null);
    setDahaVarMi(true);
    resetPage();
    await getData();
  }

  @override
  @action
  Future<void> getData() async {
    final result =
        await networkManager.dioGet(path: ApiUrls.getMasrafKodlari, bodyModel: MasrafKoduRehberiModel(), queryParameters: requestModel.copyWith(sayfa: page, searchText: searchText).toJson());
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
    } else if (page == 1) {
      setObservableList([]);
    }
  }
}
