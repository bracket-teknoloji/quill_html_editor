import "package:mobx/mobx.dart";
import "package:picker/core/init/network/login/api_urls.dart";
import "package:picker/view/main_page/alt_sayfalar/finans/dekontlar/model/dekont_listesi_model.dart";
import "package:picker/view/main_page/alt_sayfalar/finans/dekontlar/model/dekont_request_model.dart";

import "../../../../../../core/base/view_model/mobx_network_mixin.dart";

part "dekontlar_view_model.g.dart";

class DekontlarViewModel = _DekontlarViewModelBase with _$DekontlarViewModel;

abstract class _DekontlarViewModelBase with Store, MobxNetworkMixin {
  @observable
  bool searchBar = false;

  @observable
  bool dahaVarMi = true;

  @observable
  bool isScrolledDown = false;

  @observable
  DekontRequestModel dekontRequestModel = DekontRequestModel(sayfa: 1);

  @observable
  ObservableList<DekontListesiModel>? dekontListesi;

  @action
  void setIsScrolledDown(bool value) => isScrolledDown = value;

  @action
  void setDahaVarMi(bool value) => dahaVarMi = value;

  @action
  void increaseSayfa() => dekontRequestModel = dekontRequestModel.copyWith(sayfa: (dekontRequestModel.sayfa ?? 0) + 1);

  @action
  void resetSayfa() => dekontRequestModel = dekontRequestModel.copyWith(sayfa: 1);

  @action
  Future<void> resetPage() async {
    resetSayfa();
    clearDekontListesi();
    await getData();
  }

  @action
  void setDekontListesi(List<DekontListesiModel>? value) => dekontListesi = value?.asObservable();

  @action
  void addDekontListesi(List<DekontListesiModel>? value) => dekontListesi?.addAll(value ?? []);

  @action
  void clearDekontListesi() => setDekontListesi(null);

  @action
  @action
  Future<void> getData() async {
    final response = await networkManager.dioGet(path: ApiUrls.getDekontlar, bodyModel: DekontListesiModel(), queryParameters: dekontRequestModel.toJson());
    if (response.success ?? false) {
      final List<DekontListesiModel>? list = response.data?.map((e) => e as DekontListesiModel).toList().cast<DekontListesiModel>();
      if ((dekontRequestModel.sayfa ?? 0) < 2) {
        setDekontListesi(list);
      } else {
        addDekontListesi(list);
      }
      if ((list?.length ?? 0) < parametreModel.sabitSayfalamaOgeSayisi) {
        setDahaVarMi(false);
      } else {
        setDahaVarMi(true);
        increaseSayfa();
      }
    }
  }
}
