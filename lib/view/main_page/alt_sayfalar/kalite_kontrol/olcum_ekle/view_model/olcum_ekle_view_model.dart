import "package:mobx/mobx.dart";

import "../../../../../../core/base/model/base_network_mixin.dart";
import "../../../../../../core/base/model/generic_response_model.dart";
import "../../../../../../core/base/view_model/mobx_network_mixin.dart";
import "../../../../../../core/constants/enum/base_edit_enum.dart";
import "../../../../../../core/init/network/login/api_urls.dart";
import "../../olcum_belge_edit/model/olcum_belge_edit_model.dart";
import "../model/olcum_ekle_model.dart";

part "olcum_ekle_view_model.g.dart";

class OlcumEkleViewModel = _OlcumEkleViewModelBase with _$OlcumEkleViewModel;

abstract class _OlcumEkleViewModelBase with Store, MobxNetworkMixin {
  @observable
  OlcumEkleModel requestModel = OlcumEkleModel();

  @action
  void setRequestModel(OlcumEkleModel model) => requestModel = model;

  @action
  void setSeriNo(String? value) => requestModel = requestModel.copyWith(seriNo: value);

  @action
  void setKayitOperatoru(String? value) => requestModel = requestModel.copyWith(kayitOperator: value);

  @action
  void addProsesModel(OlcumProsesModel model) {
    if (requestModel.prosesler == null) {
      requestModel = requestModel.copyWith(prosesler: []);
    }
    if (requestModel.prosesler!.any((proses) => proses.id == model.id)) {
      requestModel = requestModel.copyWith(
        prosesler: requestModel.prosesler!.map((proses) => proses.id == model.id ? model : proses).toList(),
      );
    } else {
      requestModel = requestModel.copyWith(prosesler: (requestModel.prosesler ?? []) + [model]);
    }
  }

  @action
  Future<GenericResponseModel<NetworkManagerMixin>?> sendData(BaseEditEnum baseEditEnum) async {
    OlcumEkleModel newReqModel = requestModel;
    if (baseEditEnum.ekleMi) {
      newReqModel = newReqModel.copyWith(belgeId: 0, prosesler: newReqModel.prosesler?.map((e) => e..detayId = 0).toList());
    }
    return await networkManager.dioPost(
      path: ApiUrls.olcumEkle,
      bodyModel: OlcumEkleModel(),
      showLoading: true,
      data: newReqModel
          .copyWith(prosesler: requestModel.prosesler?.map((e) => e..prosesId = e.id).toList(), tamamlandi: requestModel.prosesler?.every((element) => element.sonuc != null) ?? false)
          .toJson(),
    );
  }
}
