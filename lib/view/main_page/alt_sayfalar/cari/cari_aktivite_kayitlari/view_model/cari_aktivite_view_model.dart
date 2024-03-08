import "package:mobx/mobx.dart";
import "package:picker/core/base/view/cari_rehberi/model/cari_listesi_request_model.dart";
import "package:picker/core/base/view_model/mobx_network_mixin.dart";
import "package:picker/core/init/network/login/api_urls.dart";
import "package:picker/view/main_page/alt_sayfalar/cari/cari_aktivite_kayitlari/model/cari_aktivite_listesi_model.dart";

part "cari_aktivite_view_model.g.dart";

class CariAktiviteViewModel = _CariAktiviteViewModelBase with _$CariAktiviteViewModel;

abstract class _CariAktiviteViewModelBase with Store, MobxNetworkMixin {
  @observable
  CariListesiRequestModel requestModel = CariListesiRequestModel();

  @observable
  ObservableList<CariAktiviteListesiModel>? aktiviteList;

  @action
  void setCariKodu(String? value) => requestModel = requestModel.copyWith(cariKodu: value);

  @action
  void setAktiviteList(List<CariAktiviteListesiModel>? value) => aktiviteList = value?.asObservable();

  @action
  void setBaslangicTarihi(DateTime? value) => requestModel = requestModel.copyWith(baslamaTarihi: value);

  @action
  void setBitisTarihi(DateTime? value) => requestModel = requestModel.copyWith(bitisTarihi: value);

  // @action
  // void setKullanici(String? value) => requestModel = requestModel.copyWith(kullanici: value);

  @action
  Future<void> getData() async {
    setAktiviteList(null);
    final result = await networkManager.dioPost(path: ApiUrls.getAktiviteler, bodyModel: CariAktiviteListesiModel());
    if (result.success == true) {
      final List<CariAktiviteListesiModel> list = (result.data as List).map((e) => e as CariAktiviteListesiModel).toList();
      setAktiviteList(list);
    }
  }
}
