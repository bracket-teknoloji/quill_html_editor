import "package:mobx/mobx.dart";
import "package:picker/core/base/view/belge_kontrol/model/belge_kontrol_model.dart";
import "package:picker/core/base/view/belge_kontrol_kalemler/model/belge_kontrol_kalemler_model.dart";
import "package:picker/core/base/view_model/mobx_network_mixin.dart";
import "package:picker/core/init/network/login/api_urls.dart";

part "belge_kontrol_kalem_edit_view_model.g.dart";

class BelgeKontrolKalemEditViewModel = _BelgeKontrolKalemEditViewModelBase with _$BelgeKontrolKalemEditViewModel;

abstract class _BelgeKontrolKalemEditViewModelBase with Store, MobxNetworkMixin {
  @observable
  BelgeKontrolModel requestModel = BelgeKontrolModel();

  @action
  void setRequestModel(BelgeKontrolKalemlerModel value) {
    requestModel = requestModel.copyWith(
      islemKodu: 4,
      cariKodu: value.cariKodu,
      stokKodu: value.stokKodu,
      belgeNo: value.belgeNo,
      id: value.kontrolId,
      sira: value.sira,
      miktar: value.kalanMiktar,
      belgeTipi: value.belgeTipi,
    );
  }

  @action
  void setMiktar(double? value) {
    requestModel = requestModel.copyWith(miktar: value);
  }

  @action
  Future<bool> saveKalem() async {
    final result = await networkManager.dioPost(
      path: ApiUrls.saveBelgeKontrol,
      bodyModel: requestModel,
      data: requestModel.toJson(),
      showLoading: true,
    );
    return result.isSuccess;
  }
}
