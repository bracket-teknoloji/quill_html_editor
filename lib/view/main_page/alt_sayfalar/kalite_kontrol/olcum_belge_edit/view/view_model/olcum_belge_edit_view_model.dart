import "dart:developer";

import "package:mobx/mobx.dart";
import "package:picker/core/base/view_model/mobx_network_mixin.dart";
import "package:picker/core/init/network/login/api_urls.dart";
import "package:picker/view/main_page/alt_sayfalar/kalite_kontrol/olcum_belge_edit/model/olcum_belge_edit_model.dart";
import "package:picker/view/main_page/alt_sayfalar/kalite_kontrol/olcum_girisi/model/olcum_girisi_listesi_model.dart";

part "olcum_belge_edit_view_model.g.dart";

class OlcumBelgeEditViewModel = _OlcumBelgeEditViewModelBase with _$OlcumBelgeEditViewModel;

abstract class _OlcumBelgeEditViewModelBase with Store, MobxNetworkMixin {
  @observable
  OlcumGirisiListesiModel? requestModel;

  @observable
  OlcumBelgeEditModel? model;

  @computed
  OlcumBelgeModel? get belgeModel => model?.belge?.firstOrNull;

  @action
  void setRequestModel(OlcumGirisiListesiModel reqModel) => requestModel = reqModel;

  @action
  Future<void> getData() async {
    model = null;
    final result = await networkManager.dioGet(path: ApiUrls.getOlcumBelgeDetaylar, bodyModel: OlcumBelgeEditModel(), data: requestModel?.toJson());
    if (result.data is List) {
      final List<OlcumBelgeEditModel> data = result.data.map((e) => e as OlcumBelgeEditModel).toList().cast<OlcumBelgeEditModel>();
      model = data.firstOrNull;
      log(model?.toJson().toString() ?? "");
    }
  }
}
