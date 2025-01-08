import "package:mobx/mobx.dart";

import "../../../../../../core/base/view/cari_rehberi/model/cari_listesi_request_model.dart";
import "../../../../../../core/base/view_model/listable_mixin.dart";
import "../../../../../../core/base/view_model/mobx_network_mixin.dart";
import "../../../../../../core/init/network/login/api_urls.dart";
import "../model/cari_aktivite_listesi_model.dart";

part "cari_aktivite_view_model.g.dart";

final class CariAktiviteViewModel = _CariAktiviteViewModelBase with _$CariAktiviteViewModel;

abstract class _CariAktiviteViewModelBase with Store, MobxNetworkMixin, ListableMixin<CariAktiviteListesiModel> {
  @observable
  CariListesiRequestModel requestModel = CariListesiRequestModel(
    sayfa: null,
    menuKodu: null,
    kod: null,
    filterText: null,
    siralama: null,
  );

  @override
  @observable
  ObservableList<CariAktiviteListesiModel>? observableList;

  @action
  void setCariKodu(String? value) => requestModel = requestModel.copyWith(cariKodu: value);

  @action
  void setKullanici(String? value) => requestModel = requestModel.copyWith(kullanici: value);

  @override
  @action
  void setObservableList(List<CariAktiviteListesiModel>? value) => observableList = value?.asObservable();

  @action
  void setBaslangicTarihi(DateTime? value) => requestModel = requestModel.copyWith(baslamaTarihi: value);

  @action
  void setBitisTarihi(DateTime? value) => requestModel = requestModel.copyWith(bitisTarihi: value);

  @action
  void setSearchText(String? value) => requestModel = requestModel.copyWith(searchText: value);

  // @action
  // void setSearchText(String? value) => requestModel = requestModel.copyWith(: value);

  // @action
  // void setKullanici(String? value) => requestModel = requestModel.copyWith(kullanici: value);

  @override
  @action
  Future<void> getData() async {
    setObservableList(null);
    final result = await networkManager.dioPost(path: ApiUrls.getAktiviteler, bodyModel: CariAktiviteListesiModel(), data: requestModel.toJson());
    if (result.isSuccess) {
      setObservableList(result.dataList);
    }
  }

  @action
  Future<CariAktiviteListesiModel?> getNewItem(int? value) async {
    final result = await networkManager.dioPost(path: ApiUrls.getAktiviteler, bodyModel: CariAktiviteListesiModel(), data: {"ID": value}, showLoading: true);
    if (result.isSuccess) {
      return result.dataList.firstOrNull;
    }
    return null;
  }
}
