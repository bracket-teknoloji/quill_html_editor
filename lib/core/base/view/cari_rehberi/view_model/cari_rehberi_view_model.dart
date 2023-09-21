import "package:mobx/mobx.dart";
import "package:picker/view/main_page/alt_sayfalar/cari/cari_network_manager.dart";

import "../../../../../view/main_page/alt_sayfalar/cari/cari_listesi/model/cari_listesi_model.dart";
import "../../../../../view/main_page/alt_sayfalar/cari/cari_listesi/model/cari_sehirler_model.dart";
import "../../../../constants/static_variables/static_variables.dart";
import "../../../../init/network/login/api_urls.dart";
import "../../../model/base_grup_kodu_model.dart";
import "../../../view_model/base_scrolled_view_model.dart";
import "../model/cari_listesi_request_model.dart";

part "cari_rehberi_view_model.g.dart";

class CariRehberiViewModel = _CariRehberiViewModelBase with _$CariRehberiViewModel;

abstract class _CariRehberiViewModelBase with Store, BaseScrolledViewModelMixin {
  final Map<String, dynamic> siralaMap = {
    "Cari Adı (A-Z)": "AZ",
    "Cari Adı (Z-A)": "ZA",
    "Cari Kodu (A-Z)": "CARI_KODU_AZ",
    "Cari Kodu (Z-A)": "CARI_KODU_ZA",
    "Kayıt Tarihi (Önce Yeni)": "KAYITTAR_ASC",
    "Kayıt Tarihi (Önce Eski)": "KAYITTAR_DESC",
    "Konum (En Yakın)": "KONUM_AZ",
    "Konum (En Uzak)": "KONUM_ZA",
  };
  final Map<String, dynamic> tipiMap = {
    "Alıcı": "A",
    "Satıcı": "S",
    "Toptancı": "T",
    "Kefil": "K",
    "Müstahsil": "M",
    "Diğer": "D",
    "Komisyoncu": "I",
  };
  @observable
  bool dahaVarMi = true;

  @observable
  bool searchBar = true;

  @observable
  bool isScrollDown = true;

  @observable
  ObservableList<CariListesiModel>? cariListesi;

  @observable
  ObservableList<CariSehirlerModel>? sehirler;

  @observable
  ObservableList<BaseGrupKoduModel>? grupKodlari;

  @observable
  CariListesiRequestModel? cariListesiRequestModel =
      CariListesiRequestModel(eFaturaGoster: true, sayfa: 1, siralama: "AZ", belgeTuru: StaticVariables.instance.isMusteriSiparisleri ? "MS" : "SS", teslimCari: "E");

  @computed
  List<BaseGrupKoduModel>? get grupKodlari1 => grupKodlari?.where((element) => element.grupNo == 1).toList();

  @computed
  List<BaseGrupKoduModel>? get grupKodlari2 => grupKodlari?.where((element) => element.grupNo == 2).toList();

  @computed
  List<BaseGrupKoduModel>? get grupKodlari3 => grupKodlari?.where((element) => element.grupNo == 3).toList();

  @computed
  List<BaseGrupKoduModel>? get grupKodlari4 => grupKodlari?.where((element) => element.grupNo == 4).toList();

  @computed
  List<BaseGrupKoduModel>? get grupKodlari5 => grupKodlari?.where((element) => element.grupNo == 5).toList();

  @action
  void setDahaVarMi(bool value) => dahaVarMi = value;

  @action
  void changeSearchBar() => searchBar = !searchBar;

  @action
  void changeIsScrollDown(bool value) => isScrollDown = value;

  @action
  void changeCariListesi(List<CariListesiModel>? value) => cariListesi = value?.asObservable();

  @action
  void addCariListesi(List<CariListesiModel> value) => cariListesi?.addAll(value);

  @action
  void changeBagliCariKodu(String? value) => cariListesiRequestModel = cariListesiRequestModel?.copyWith(bagliCariKodu: value);

  @action
  void changeSehir(String? value) => cariListesiRequestModel = cariListesiRequestModel?.copyWith(sehir: value);

  @action
  void changeIlce(String? value) => cariListesiRequestModel = cariListesiRequestModel?.copyWith(ilce: value);

  @action
  void changeTipi(String? value) => cariListesiRequestModel = cariListesiRequestModel?.copyWith(cariTipi: value);

  @action
  void changeKod1(List<String>? value) => cariListesiRequestModel = cariListesiRequestModel?.copyWith(arrKod1: value);

  @action
  void changeKod2(List<String>? value) => cariListesiRequestModel = cariListesiRequestModel?.copyWith(arrKod2: value);

  @action
  void changeKod3(List<String>? value) => cariListesiRequestModel = cariListesiRequestModel?.copyWith(arrKod3: value);

  @action
  void changeKod4(List<String>? value) => cariListesiRequestModel = cariListesiRequestModel?.copyWith(arrKod4: value);

  @action
  void changeKod5(List<String>? value) => cariListesiRequestModel = cariListesiRequestModel?.copyWith(arrKod5: value);

  @action
  void changeSiralama(String? value) {
    cariListesiRequestModel = cariListesiRequestModel?.copyWith(siralama: value);
    resetAll();
  }

  @action
  void changeFilterText(String? value) {
    cariListesiRequestModel = cariListesiRequestModel?.copyWith(filterText: value);
    resetAll();
  }

  @action
  void resetAll() {
    changeCariListesi(null);
    setDahaVarMi(true);
    cariListesiRequestModel = cariListesiRequestModel?.copyWith(sayfa: 1);
    getCariListesi();
  }

  @action
  Future<void> getCariListesi() async {
    final response = await networkManager.dioGet<CariListesiModel>(path: ApiUrls.getCariler, queryParameters: cariListesiRequestModel?.toJsonWithList(), bodyModel: CariListesiModel());
    if (response.data != null && response.data is List) {
      List<CariListesiModel> list = response.data.whereType<CariListesiModel>().toList();
      if (cariListesi == null) {
        changeCariListesi(list);
      } else {
        addCariListesi(list);
      }
      if (list.length < 25) {
        setDahaVarMi(false);
      } else {
        setDahaVarMi(true);
        cariListesiRequestModel = cariListesiRequestModel?.copyWith(sayfa: cariListesiRequestModel!.sayfa! + 1);
      }
    }
  }

  @action
  Future<void> getSehirBilgileri() async {
    var result = await networkManager.dioGet<CariSehirlerModel>(path: ApiUrls.getCariKayitliSehirler, bodyModel: CariSehirlerModel(), showLoading: true);
    if (result.data != null && result.data is List) {
      List<CariSehirlerModel> list = result.data.whereType<CariSehirlerModel>().toList();
      sehirler = list.asObservable();
    }
  }

  @action
  Future<void> getGrupKodlari() async {
    var result = await CariNetworkManager.getKod();
    if (result.data != null) {
      List<BaseGrupKoduModel> list = result.data.whereType<BaseGrupKoduModel>().toList();
      grupKodlari = list.asObservable();
    }
  }
}
