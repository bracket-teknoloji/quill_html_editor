import "package:mobx/mobx.dart";
import "package:picker/core/base/view_model/mobx_network_mixin.dart";
import "package:picker/core/init/cache/cache_manager.dart";
import "package:picker/core/init/network/login/api_urls.dart";
import "package:picker/view/main_page/alt_sayfalar/siparis/siparisler/model/siparisler_request_model.dart";
import "package:picker/view/main_page/alt_sayfalar/talep_teklif/talep_teklif_listesi/view/talep_teklif_listesi_model.dart";

part "talep_teklif_listesi_view_model.g.dart";

class TalepTeklifListesiViewModel = _TalepTeklifListesiViewModelBase with _$TalepTeklifListesiViewModel;

abstract class _TalepTeklifListesiViewModelBase with Store, MobxNetworkMixin {
  final Map<String, String> siralaMap = {
    "Belge No (A-Z)": "BELGE_NO_AZ",
    "Belge No (Z-A)": "BELGE_NO_ZA",
    "Tarih (A-Z)": "TARIH_AZ",
    "Tarih (Z-A)": "TARIH_ZA",
    "Cari Adı (A-Z)": "CARI_ADI_AZ",
    "Cari Adı (Z-A)": "CARI_ADI_ZA",
    "Vade Günü (A-Z)": "VADE_GUNU_AZ",
    "Vade Günü (Z-A)": "VADE_GUNU_ZA",
  };

  final List<String> teslimatDurumu = const ["Tümü", "Beklemede", "Tamamlandı"];

  @observable
  ObservableMap<String, bool> ekstraAlanlarMap = {
    "EK": CacheManager.getProfilParametre.siparisEkAlan,
    "MİK": CacheManager.getProfilParametre.siparisMiktar,
    "VADE": CacheManager.getProfilParametre.siparisVade,
  }.asObservable();
  @action
  void changeEkstraAlanlarMap(String key, bool value) {
    ekstraAlanlarMap.remove(key);
    switch (key) {
      case "EK":
        CacheManager.setProfilParametre(CacheManager.getProfilParametre.copyWith(siparisEkAlan: value));
        ekstraAlanlarMap["EK"] = value;
      case "MİK":
        CacheManager.setProfilParametre(CacheManager.getProfilParametre.copyWith(siparisMiktar: value));
        ekstraAlanlarMap["MİK"] = value;
      case "VADE":
        CacheManager.setProfilParametre(CacheManager.getProfilParametre.copyWith(siparisVade: value));
        ekstraAlanlarMap["VADE"] = value;
    }
    ekstraAlanlarMap[key] = value;
  }

  @action
  void resetEkstraAlanlarMap() {
    CacheManager.setProfilParametre(CacheManager.getProfilParametre.copyWith(siparisEkAlan: false, siparisMiktar: false, siparisVade: false));
    ekstraAlanlarMap = {
      "EK": false,
      "MİK": false,
      "VADE": false,
    }.asObservable();
  }

  @observable
  SiparislerRequestModel siparislerRequestModel = SiparislerRequestModel(sayfa: 1, faturalasmaGoster: true, ekranTipi: "L", iadeMi: false, cariKodu: "", siralama: "TARIH_ZA");

  @observable
  ObservableList<TalepTeklifListesiModel>? talepTeklifListesiModelList;

  @observable
  bool isScrolledDown = true;

  @observable
  bool dahaVarMi = true;

  @action
  void setIsScrolledDown(bool value) => isScrolledDown = value;

  @action
  void setPickerBelgeTuru(String value) => siparislerRequestModel = siparislerRequestModel.copyWith(pickerBelgeTuru: value);

  @action
  void setSiralama(String value) => siparislerRequestModel = siparislerRequestModel.copyWith(siralama: value);

  @action
  void setTalepTeklifiListesiModelList(List<TalepTeklifListesiModel> list) => talepTeklifListesiModelList = list.asObservable();

  @action
  void addTalepTeklifiListesiModelList(List<TalepTeklifListesiModel> list) => talepTeklifListesiModelList!.addAll(list);

  @action
  Future<void> resetPage() async {
    siparislerRequestModel = siparislerRequestModel.copyWith(sayfa: 1);
    talepTeklifListesiModelList = null;
    dahaVarMi = true;
    await getData();
  }

  @action
  Future<void> getData() async {
    final result = await networkManager.dioGet(path: ApiUrls.getFaturalar, bodyModel: TalepTeklifListesiModel(), queryParameters: siparislerRequestModel.toJson());
    if (result.data != null) {
      final List<TalepTeklifListesiModel> list = result.data.map<TalepTeklifListesiModel>((e) => e as TalepTeklifListesiModel).toList().cast<TalepTeklifListesiModel>();
      if (list.length < parametreModel.sabitSayfalamaOgeSayisi) {
        dahaVarMi = false;
      } else {
        dahaVarMi = true;
        siparislerRequestModel = siparislerRequestModel.copyWith(sayfa: (siparislerRequestModel.sayfa ?? 0) + 1);
      }
      if (talepTeklifListesiModelList == null) {
        setTalepTeklifiListesiModelList(list);
      } else {
        addTalepTeklifiListesiModelList(list);
      }
    }
  }
}
