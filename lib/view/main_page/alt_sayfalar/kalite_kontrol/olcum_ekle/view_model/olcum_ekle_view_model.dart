import "package:mobx/mobx.dart";
import "package:picker/core/base/view_model/mobx_network_mixin.dart";
import "package:picker/core/init/network/login/api_urls.dart";
import "package:picker/view/main_page/alt_sayfalar/cari/cari_listesi/model/cari_listesi_model.dart";
import "package:picker/view/main_page/alt_sayfalar/kalite_kontrol/olcum_ekle/model/olcum_ekle_model.dart";

part "olcum_ekle_view_model.g.dart";

class OlcumEkleViewModel = _OlcumEkleViewModelBase with _$OlcumEkleViewModel;

abstract class _OlcumEkleViewModelBase with Store, MobxNetworkMixin {
  @observable
  OlcumEkleModel requestModel = OlcumEkleModel(prosesler: []);

  @action
  void setRequestModel(OlcumEkleModel model) => requestModel = model;

  @action
  void addProsesModel(OlcumEkleProsesModel model) {
    if (requestModel.prosesler == null) {
      requestModel = requestModel.copyWith(prosesler: []);
    }
    if (requestModel.prosesler!.any((proses) => proses.prosesId == model.prosesId)) {
      requestModel = requestModel.copyWith(prosesler: requestModel.prosesler!.map((proses) => proses.prosesId == model.prosesId ? model : proses).toList());
    } else {
      requestModel = requestModel.copyWith(prosesler: (requestModel.prosesler ?? []) + [model]);
    }
  }

  @action
  Future<void> sendData() async {
    //TODO CariListesiModel'i kaldır
    final result = await networkManager.dioPost(path: ApiUrls.createOlcum, bodyModel: CariListesiModel(), data: requestModel.toJson());
  }
}
