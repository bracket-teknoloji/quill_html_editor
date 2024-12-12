import "dart:convert";

import "package:flutter/material.dart";
import "package:mobx/mobx.dart";

import "../../../../../../../core/base/model/base_network_mixin.dart";
import "../../../../../../../core/base/model/generic_response_model.dart";
import "../../../../../../../core/base/view_model/listable_mixin.dart";
import "../../../../../../../core/base/view_model/mobx_network_mixin.dart";
import "../../../../../../../core/base/view_model/pageable_mixin.dart";
import "../../../../../../../core/base/view_model/scroll_controllable_mixin.dart";
import "../../../../../../../core/init/network/login/api_urls.dart";
import "../../kasa_islemleri/model/kasa_islemleri_model.dart";
import "../../kasa_islemleri/model/kasa_islemleri_request_model.dart";

part "kasa_hareketleri_view_model.g.dart";

class KasaHareketleriViewModel = _KasaHareketleriViewModelBase with _$KasaHareketleriViewModel;

abstract class _KasaHareketleriViewModelBase with Store, MobxNetworkMixin, ListableMixin<KasaIslemleriModel>, ScrollControllableMixin, PageableMixin {
  //* Observables
  @observable
  KasaIslemleriRequestModel kasaIslemleriRequestModel = KasaIslemleriRequestModel(menuKodu: "KASA_KHAR");

  @observable
  ObservableMap<String, dynamic>? paramData;

  @override
  @observable
  bool isScrollDown = true;

  @override
  @observable
  ObservableList<KasaIslemleriModel>? observableList;

  @observable
  String? dovizAdi;

  @computed
  double get bakiye => (paramData?["TOPLAM_GELIR"] as double? ?? 0) - (paramData?["TOPLAM_GIDER"] as double? ?? 0);

  // //* Actions
  @action
  void setDovizAdi(String? value) => dovizAdi = value;

  @action
  void setIsScrollDown(bool value) => isScrollDown = value;

  @action
  void incrementSayfa() => kasaIslemleriRequestModel = kasaIslemleriRequestModel.copyWith(sayfa: (kasaIslemleriRequestModel.sayfa ?? 0) + 1);

  @action
  void setKasaKodu(String? value) => kasaIslemleriRequestModel = kasaIslemleriRequestModel.copyWith(kasaKodu: value);

  @override
  @action
  void setObservableList(List<KasaIslemleriModel>? value) => observableList = value?.asObservable();

  @override
  @action
  void addObservableList(List<KasaIslemleriModel>? list) => setObservableList(observableList?..addAll(list!));

  @override
  @action
  Future<void> resetList() async {
    resetPage();
    await getData();
  }

  @action
  @override
  Future<void> changeScrollStatus(ScrollPosition position) async {
    super.changeScrollStatus(position);
    if (position.pixels == position.maxScrollExtent && dahaVarMi) {
      await getData();
      isScrollDown = false;
    }
  }

  @action
  // return GenericResponseModel(success: true);
  Future<GenericResponseModel<NetworkManagerMixin>> deleteData(int? inckeyNo) async =>
      await networkManager.dioPost<KasaIslemleriModel>(path: ApiUrls.deleteKasaHareket, bodyModel: KasaIslemleriModel(), queryParameters: {"INCKEYNO": inckeyNo});

  @override
  @action
  Future<void> getData() async {
    final result = await networkManager.dioGet<KasaIslemleriModel>(
      path: ApiUrls.getKasaHareketleri,
      bodyModel: KasaIslemleriModel(),
      queryParameters: {"FilterModel": jsonEncode(kasaIslemleriRequestModel.copyWith(sayfa: page).toJson())},
    );
    if (result.isSuccess) {
      if (page > 1) {
        addObservableList(result.dataList);
      } else {
        setObservableList(result.dataList);
        paramData = result.paramData?.map((key, value) => MapEntry(key, double.tryParse((value as String).replaceAll(",", ".")) ?? value)).asObservable();
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
