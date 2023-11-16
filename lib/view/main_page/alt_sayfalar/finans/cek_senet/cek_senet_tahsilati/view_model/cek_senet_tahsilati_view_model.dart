import "package:mobx/mobx.dart";
import "package:picker/core/base/model/base_network_mixin.dart";
import "package:picker/core/base/model/generic_response_model.dart";
import "package:picker/core/base/view_model/mobx_network_mixin.dart";
import "package:picker/core/init/network/login/api_urls.dart";

import "../model/save_cek_senet_model.dart";

part "cek_senet_tahsilati_view_model.g.dart";

class CekSenetTahsilatiViewModel = _CekSenetTahsilatiViewModelBase with _$CekSenetTahsilatiViewModel;

abstract class _CekSenetTahsilatiViewModelBase with Store, MobxNetworkMixin {
  @observable
  SaveCekSenetModel model = SaveCekSenetModel(islemKodu: 3);

  @action
  void setGirisTarihi(DateTime? value) => model = model.copyWith(tarih: value);

  @action
  void setCariKodu(String? value) => model = model.copyWith(cariKodu: value);

  @action
  void setPlasiyerKodu(String? value) => model = model.copyWith(plasiyerKodu: value);

  @action
  void setProjeKodu(String? value) => model = model.copyWith(projeKodu: value);

  @action
  void addCekSenetKalemlerModel(CekSenetKalemlerModel? value) {
    if (value != null) {
      model = model.copyWith(kalemler: [...model.kalemler ?? [], value]);
    }
  }

  @action
  void removeCekSenetKalemlerModel(CekSenetKalemlerModel? value) {
    if (value != null) {
      model = model.copyWith(kalemler: model.kalemler?.where((element) => element != value).toList());
    }
  }

  @action
  void replaceCekSenetKalemlerModel(CekSenetKalemlerModel? oldValue, CekSenetKalemlerModel? newValue) {
    if (oldValue != null && newValue != null) {
      model = model.copyWith(kalemler: model.kalemler?.map((e) => e == oldValue ? newValue : e).toList());
    }
  }

  @action
  Future<GenericResponseModel<NetworkManagerMixin>> postData() async =>
      await networkManager.dioPost<SaveCekSenetModel>(path: ApiUrls.saveCekSenetler, bodyModel: SaveCekSenetModel(), data: model.toJson());
}
