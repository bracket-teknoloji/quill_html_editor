import "package:mobx/mobx.dart";
import "package:picker/core/base/model/base_network_mixin.dart";
import "package:picker/core/base/model/generic_response_model.dart";
import "package:picker/core/base/view_model/mobx_network_mixin.dart";
import "package:picker/core/init/network/login/api_urls.dart";
import "package:picker/view/main_page/alt_sayfalar/kalite_kontrol/olcum_belge_edit/model/olcum_belge_edit_model.dart";
import "package:picker/view/main_page/alt_sayfalar/kalite_kontrol/olcum_ekle/model/olcum_ekle_model.dart";

part "olcum_ekle_view_model.g.dart";

class OlcumEkleViewModel = _OlcumEkleViewModelBase with _$OlcumEkleViewModel;

abstract class _OlcumEkleViewModelBase with Store, MobxNetworkMixin {
  @observable
  OlcumEkleModel requestModel = OlcumEkleModel();

  @action
  void setRequestModel(OlcumEkleModel model) => requestModel = model;

  @action
  void addProsesModel(OlcumProsesModel model) {
    if (requestModel.prosesler == null) {
      requestModel = requestModel.copyWith(prosesler: []);
    }
    if (requestModel.prosesler!.any((proses) => proses.id == model.id)) {
      requestModel = requestModel.copyWith(prosesler: requestModel.prosesler!.map((proses) => proses.id == model.id ? model : proses).toList());
    } else {
      requestModel = requestModel.copyWith(prosesler: (requestModel.prosesler ?? []) + [model]);
    }
  }

  @action
  Future<GenericResponseModel<NetworkManagerMixin>?> sendData() async =>
      await networkManager.dioPost(path: ApiUrls.olcumEkle, bodyModel: OlcumEkleModel(), showLoading: true, data: requestModel.toJson());
}
