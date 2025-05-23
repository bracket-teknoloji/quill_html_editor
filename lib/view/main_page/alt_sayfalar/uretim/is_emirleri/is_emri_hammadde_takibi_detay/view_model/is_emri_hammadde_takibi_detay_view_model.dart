import "package:mobx/mobx.dart";

import "../../../../../../../core/base/model/generic_response_model.dart";
import "../../../../../../../core/base/view_model/listable_mixin.dart";
import "../../../../../../../core/base/view_model/mobx_network_mixin.dart";
import "../../../../../../../core/constants/extensions/number_extensions.dart";
import "../../../../../../../core/init/network/login/api_urls.dart";
import "../../is_emri_hammade_takibi/model/is_emri_hammadde_takibi_listesi_model.dart";
import "../model/is_emri_hammadde_takibi_detay_model.dart";
import "../model/is_emri_hammadde_takibi_detay_request_model.dart";

part "is_emri_hammadde_takibi_detay_view_model.g.dart";

final class IsEmriHammaddeTakibiDetayViewModel = _IsEmriHammaddeTakibiDetayViewModelBase
    with _$IsEmriHammaddeTakibiDetayViewModel;

abstract class _IsEmriHammaddeTakibiDetayViewModelBase
    with Store, MobxNetworkMixin, ListableMixin<IsEmriHammaddeTakibiDetayModel> {
  _IsEmriHammaddeTakibiDetayViewModelBase({required this.model}) {
    requestModel = requestModel.copyWith(takipno: model.takipno);
  }

  late final IsEmriHammaddeTakibiListesiModel model;

  final Map<String, String?> tipiMap = {"Tümü": null, "Tamamlanan": "T", "Kalan": "K"};

  @override
  @observable
  ObservableList<IsEmriHammaddeTakibiDetayModel>? observableList;

  @computed
  ObservableList<bool> get valueList =>
      List.generate(tipiMap.length, (index) => tipiMap.values.toList()[index] == requestModel.tip).asObservable();

  @observable
  IsEmriHammaddeTakibiDetayRequestModel requestModel = IsEmriHammaddeTakibiDetayRequestModel();

  @override
  @action
  void setObservableList(List<IsEmriHammaddeTakibiDetayModel>? list) => observableList = list?.asObservable();

  @action
  void setSelectedTipi(String? value) {
    requestModel = requestModel.copyWith(tip: value);
    getData();
  }

  @override
  @action
  Future<void> getData() async {
    if (observableList != null) setObservableList(null);
    final result = await networkManager.dioGet(
      path: ApiUrls.getIsemriHammaddeTakipDetay,
      bodyModel: IsEmriHammaddeTakibiDetayModel(),
      queryParameters: requestModel.toJson(),
    );
    if (result.isSuccess) {
      setObservableList(result.dataList);
    }
  }

  @action
  Future<GenericResponseModel<IsEmriHammaddeTakibiDetayModel>> setBarkod(String stok) async =>
      await networkManager.dioPost(
        path: ApiUrls.isemriHammaddeTakipIslem,
        bodyModel: IsEmriHammaddeTakibiDetayModel(),
        showLoading: true,
        queryParameters: requestModel.copyWith(barcode: stok, islemKodu: 1).toJson(),
      );

  @action
  Future<bool> addItem(String stok, String referansStok) async {
    final result = await networkManager.dioPost(
      path: ApiUrls.isemriHammaddeTakipIslem,
      bodyModel: IsEmriHammaddeTakibiDetayModel(),
      showLoading: true,
      queryParameters: requestModel.copyWith(referansStokKodu: referansStok, barcode: stok, islemKodu: 2).toJson(),
    );
    return result.isSuccess;
  }

  @action
  Future<bool> deleteItem(IsEmriHammaddeTakibiDetayModel model) async {
    final result = await networkManager.dioPost(
      path: ApiUrls.isemriHammaddeTakipIslem,
      bodyModel: IsEmriHammaddeTakibiDetayModel(),
      showLoading: true,
      queryParameters: requestModel
          .copyWith(barcode: model.referanslar?.firstOrNull?.id.toStringIfNotNull, islemKodu: 3)
          .toJson(),
    );
    return result.isSuccess;
  }
}
