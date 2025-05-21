import "package:mobx/mobx.dart";

import "../../../../../../../core/base/model/generic_response_model.dart";
import "../../../../../../../core/base/view_model/mobx_network_mixin.dart";
import "../../../../../../../core/init/network/login/api_urls.dart";
import "../../cek_senet_listesi/model/cek_senet_listesi_model.dart";
import "../model/cek_senet_evrak_ekle_model.dart";

part "cek_senet_evrak_ekle_view_model.g.dart";

final class CekSenetEvrakEkleViewModel = _CekSenetEvrakEkleViewModelBase with _$CekSenetEvrakEkleViewModel;

abstract class _CekSenetEvrakEkleViewModelBase with Store, MobxNetworkMixin {
  _CekSenetEvrakEkleViewModelBase({required this.model}) {
    model.islemKodu = 1;
  }
  @observable
  late CekSenetEvrakEkleModel model;

  @observable
  String? base64Data;

  @action
  void setBase64Data(String? base64Data) {
    this.base64Data = base64Data;
    model = model.copyWith(base64Data: base64Data);
  }

  @action
  void setBoyutByte(int? boyutByte) => model = model.copyWith(boyutByte: boyutByte);

  @action
  void setAciklama(String? aciklama) => model = model.copyWith(aciklama: aciklama);

  @action
  Future<GenericResponseModel<CekSenetListesiModel>> saveData() async =>
      await networkManager.dioPost(path: ApiUrls.saveEvrak, bodyModel: CekSenetListesiModel(), data: model.toJson());
}
