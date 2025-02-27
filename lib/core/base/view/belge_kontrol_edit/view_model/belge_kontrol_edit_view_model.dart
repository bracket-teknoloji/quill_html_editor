import "package:mobx/mobx.dart";
import "package:picker/app/picker_app_imports.dart";
import "package:picker/core/base/view/belge_kontrol/model/belge_kontrol_model.dart";
import "package:picker/core/base/view_model/mobx_network_mixin.dart";
import "package:picker/core/init/network/login/api_urls.dart";

part "belge_kontrol_edit_view_model.g.dart";

class BelgeKontrolEditViewModel = _BelgeKontrolEditViewModelBase with _$BelgeKontrolEditViewModel;

abstract class _BelgeKontrolEditViewModelBase with Store, MobxNetworkMixin {
  @observable
  BelgeKontrolModel belgeKontrolModel = BelgeKontrolModel(islemKodu: 1);

  @action
  void setBelgeTuru(String value) => belgeKontrolModel = belgeKontrolModel.copyWith(belgeTipi: value);

  @action
  void setBelge(BaseSiparisEditModel value) =>
      belgeKontrolModel = belgeKontrolModel.copyWith(belgeNo: value.belgeNo, cariKodu: value.cariKodu);

  @action
  Future<bool> saveData() async {
    final result = await networkManager.dioPost(path: ApiUrls.saveBelgeKontrol, bodyModel: BelgeKontrolModel(),showLoading: true, data: belgeKontrolModel.toJson());
    return result.isSuccess;
  }
}
