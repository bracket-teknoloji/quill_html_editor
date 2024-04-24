import "dart:developer";

import "package:mobx/mobx.dart";
import "package:picker/core/base/model/base_network_mixin.dart";
import "package:picker/core/base/model/generic_response_model.dart";
import "package:picker/core/base/view_model/mobx_network_mixin.dart";
import "package:picker/core/init/network/login/api_urls.dart";
import "package:picker/view/main_page/alt_sayfalar/kalite_kontrol/olcum_belge_edit/model/olcum_belge_edit_model.dart";

part "olcum_belge_edit_view_model.g.dart";

class OlcumBelgeEditViewModel = _OlcumBelgeEditViewModelBase with _$OlcumBelgeEditViewModel;

abstract class _OlcumBelgeEditViewModelBase with Store, MobxNetworkMixin {
  @observable
  OlcumBelgeModel? requestModel;

  @observable
  OlcumBelgeEditModel? model;

  @computed
  OlcumBelgeModel? get belgeModel => model?.belge?.firstOrNull;

  @action
  void setRequestModel(OlcumBelgeModel reqModel) => requestModel = reqModel;

  @action
  void setOlcumlerList(List<OlcumOlcumlerModel>? list) => model = model?.copyWith(olcumler: list);

  @action
  Future<void> getData() async {
    model = null;
    final result = await networkManager.dioGet(path: ApiUrls.getOlcumBelgeDetaylar, bodyModel: OlcumBelgeEditModel(), data: requestModel?.forDetayRequest.toJson());
    if (result.data is List) {
      final List<OlcumBelgeEditModel> data = result.data.map((e) => e as OlcumBelgeEditModel).toList().cast<OlcumBelgeEditModel>();
      model = data.firstOrNull;
      log(model?.toJson().toString() ?? "");
    }
  }

  @action
  Future<List<OlcumOlcumlerModel>?> getOlcumler() async {
    setOlcumlerList(null);
    final result = await networkManager.dioGet(path: ApiUrls.getOlcumler, bodyModel: OlcumOlcumlerModel(), data: model?.belge?.first.forOlcumlerList.toJson());
    if (result.data is List) {
      final List<OlcumOlcumlerModel>? data = result.data.map((e) => e as OlcumOlcumlerModel).toList().cast<OlcumOlcumlerModel>();
      setOlcumlerList(data);
    }
    return null;
  }

  @action
  Future<List<OlcumProsesModel>?> getProsesler(int? id) async {
    final result = await networkManager.dioGet(path: ApiUrls.getOlcum, bodyModel: OlcumProsesModel(), showLoading: true, queryParameters: {"id": id});
    if (result.data is List) {
      final List<OlcumProsesModel>? data = result.data.map((e) => e as OlcumProsesModel).toList().cast<OlcumProsesModel>();
      return data;
    }
    return null;
  }

  @action
  Future<GenericResponseModel<NetworkManagerMixin>?> deleteOlcum(int? id) async => await networkManager.dioGet(path: ApiUrls.olcumSil, bodyModel: OlcumBelgeEditModel(), queryParameters: {"id": id});
}
