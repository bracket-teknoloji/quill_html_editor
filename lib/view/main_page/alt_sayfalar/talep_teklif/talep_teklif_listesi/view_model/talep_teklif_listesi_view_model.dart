import "dart:convert";

import "package:collection/collection.dart";
import "package:mobx/mobx.dart";
import "package:picker/core/constants/enum/edit_tipi_enum.dart";

import "../../../../../../core/base/model/base_grup_kodu_model.dart";
import "../../../../../../core/base/view_model/listable_mixin.dart";
import "../../../../../../core/base/view_model/mobx_network_mixin.dart";
import "../../../../../../core/base/view_model/pageable_mixin.dart";
import "../../../../../../core/base/view_model/scroll_controllable_mixin.dart";
import "../../../../../../core/base/view_model/searchable_mixin.dart";
import "../../../../../../core/constants/enum/grup_kodu_enums.dart";
import "../../../../../../core/init/cache/cache_manager.dart";
import "../../../../../../core/init/network/login/api_urls.dart";
import "../../../siparis/base_siparis_edit/model/base_siparis_edit_model.dart";
import "../../../siparis/siparisler/model/siparisler_request_model.dart";

part "talep_teklif_listesi_view_model.g.dart";

class TalepTeklifListesiViewModel = _TalepTeklifListesiViewModelBase with _$TalepTeklifListesiViewModel;

abstract class _TalepTeklifListesiViewModelBase with Store, MobxNetworkMixin, ListableMixin<BaseSiparisEditModel>, SearchableMixin, ScrollControllableMixin, PageableMixin {
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
  List<String?> teslimatDurumuValueList = const [null, "K", "B"];

  @observable
  ObservableMap<String, bool> ekstraAlanlarMap = {
    "EK": CacheManager.getProfilParametre.siparisEkAlan,
    "MİK": CacheManager.getProfilParametre.siparisMiktar,
    "VADE": CacheManager.getProfilParametre.siparisVade,
  }.asObservable();

  @observable
  bool grupKodlariGoster = false;

  @override
  @observable
  bool isSearchBarOpen = false;

  @override
  @observable
  String? searchText;

  @observable
  SiparislerRequestModel siparislerRequestModel = SiparislerRequestModel(sayfa: 1, faturalasmaGoster: true, miktarGetir: "E", ekranTipi: "L", iadeMi: false, siralama: "TARIH_ZA");

  @override
  @observable
  ObservableList<BaseSiparisEditModel>? observableList;

  @observable
  ObservableList<BaseGrupKoduModel>? grupKodlariList;

  @override
  @observable
  bool isScrollDown = true;

  @observable
  ObservableMap<String, dynamic>? paramData;

  @computed
  String get getKdvHaric => paramData?["ARA_TOPLAM"] ?? "";

  @computed
  String get getKdv => paramData?["KDV"] ?? "";

  @computed
  String get getKdvDahilToplam => paramData?["GENEL_TOPLAM"] ?? "";

  @computed
  List<BaseGrupKoduModel>? get getGrupKodlari0 => grupKodlariList?.where((element) => element.grupNo == 0).toList();

  @computed
  List<BaseGrupKoduModel>? get getGrupKodlari1 => grupKodlariList?.where((element) => element.grupNo == 1).toList();

  @computed
  List<BaseGrupKoduModel>? get getGrupKodlari2 => grupKodlariList?.where((element) => element.grupNo == 2).toList();

  @computed
  List<BaseGrupKoduModel>? get getGrupKodlari3 => grupKodlariList?.where((element) => element.grupNo == 3).toList();

  @computed
  List<BaseGrupKoduModel>? get getGrupKodlari4 => grupKodlariList?.where((element) => element.grupNo == 4).toList();

  @computed
  List<BaseGrupKoduModel>? get getGrupKodlari5 => grupKodlariList?.where((element) => element.grupNo == 5).toList();

  @computed
  bool get hasFilter =>
      siparislerRequestModel.cariKodu != "" ||
      siparislerRequestModel.siparisKarsilanmaDurumu != null ||
      siparislerRequestModel.ozelKod1 != null ||
      siparislerRequestModel.kapaliBelgelerListelenmesin != null ||
      siparislerRequestModel.projeKodu != null ||
      siparislerRequestModel.arrGrupKodu != null ||
      siparislerRequestModel.arrKod1 != null ||
      siparislerRequestModel.arrKod2 != null ||
      siparislerRequestModel.arrKod3 != null ||
      siparislerRequestModel.arrKod4 != null ||
      siparislerRequestModel.arrKod5 != null ||
      siparislerRequestModel.arrPlasiyerKodu != null ||
      siparislerRequestModel.arrBelgeTipi != null ||
      siparislerRequestModel.baslamaTarihi != null ||
      siparislerRequestModel.bitisTarihi != null ||
      siparislerRequestModel.siparisDurumu != null;

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

  @override
  @action
  Future<void> changeSearchBarStatus() async {
    isSearchBarOpen = !isSearchBarOpen;
    if (!isSearchBarOpen) {
      searchText = null;
      resetList();
    }
  }

  @override
  @action
  void setSearchText(String? value) => siparislerRequestModel = siparislerRequestModel.copyWith(searchText: value);

  @action
  void setIsScrolledDown(bool value) => isScrollDown = value;

  @action
  void setPickerBelgeTuru(String value) => siparislerRequestModel = siparislerRequestModel.copyWith(pickerBelgeTuru: value);

  @action
  void setSiralama(String value) => siparislerRequestModel = siparislerRequestModel.copyWith(siralama: value);

  @override
  @action
  void setObservableList(List<BaseSiparisEditModel>? list) => observableList = list?.asObservable();

  @override
  @action
  void addObservableList(List<BaseSiparisEditModel>? list) => setObservableList(observableList?..addAll(list!));

  @action
  void setArrPlasiyerKodu(List<String>? value) => siparislerRequestModel = siparislerRequestModel.copyWith(arrPlasiyerKodu: jsonEncode(value));

  @action
  void setArrKod0(List<String>? value) => siparislerRequestModel = siparislerRequestModel.copyWith(arrGrupKodu: jsonEncode(value));

  @action
  void setArrKod1(List<String>? value) => siparislerRequestModel = siparislerRequestModel.copyWith(arrKod1: jsonEncode(value));

  @action
  void setArrKod2(List<String>? value) => siparislerRequestModel = siparislerRequestModel.copyWith(arrKod2: jsonEncode(value));

  @action
  void setArrKod3(List<String>? value) => siparislerRequestModel = siparislerRequestModel.copyWith(arrKod3: jsonEncode(value));

  @action
  void setArrKod4(List<String>? value) => siparislerRequestModel = siparislerRequestModel.copyWith(arrKod4: jsonEncode(value));

  @action
  void setArrKod5(List<String>? value) => siparislerRequestModel = siparislerRequestModel.copyWith(arrKod5: jsonEncode(value));

  @action
  void setCariKodu(String? value) => siparislerRequestModel = siparislerRequestModel.copyWith(cariKodu: value);

  @action
  void setCariTipi(String? value) => siparislerRequestModel = siparislerRequestModel.copyWith(cariTipi: value);

  @action
  void setTeslimatDurumuGroupValue(int? value) => siparislerRequestModel = siparislerRequestModel.copyWith(siparisKarsilanmaDurumu: teslimatDurumuValueList[value ?? 0]);

  @action
  void setKapaliBelgelerListelenmesin(bool? value) {
    siparislerRequestModel = siparislerRequestModel.copyWith(kapaliBelgelerListelenmesin: value);
    CacheManager.setProfilParametre(CacheManager.getProfilParametre.copyWith(kapaliBelgelerListelenmesinMi: value ?? false));
  }

  @action
  void setBaslamaTarihi(String? value) => siparislerRequestModel = siparislerRequestModel.copyWith(baslamaTarihi: value);

  @action
  void setBitisTarihi(String? value) => siparislerRequestModel = siparislerRequestModel.copyWith(bitisTarihi: value);

  @action
  Future<void> resetFilter() async {
    siparislerRequestModel = siparislerRequestModel.copyWith(
      cariKodu: "",
      siparisKarsilanmaDurumu: null,
      ozelKod1: null,
      kapaliBelgelerListelenmesin: null,
      projeKodu: null,
      arrGrupKodu: null,
      arrKod1: null,
      arrKod2: null,
      arrKod3: null,
      arrKod4: null,
      arrKod5: null,
      arrPlasiyerKodu: null,
      arrBelgeTipi: null,
      ekranTipi: "L",
      sayfa: 1,
      baslamaTarihi: null,
      bitisTarihi: null,
      searchText: null,
      belgeNo: "",
      siparisDurumu: null,
    );
  }

  @action
  Future<void> changeGrupKodlariGoster() async {
    if (grupKodlariList == null) {
      await getGrupKodlari();
    }
    grupKodlariGoster = !grupKodlariGoster;
  }

  @override
  @action
  Future<void> resetList() async {
    super.resetList();
    setDahaVarMi(true);
    resetPage();
    await getData();
  }

  @action
  void setParamData(Map<String, dynamic> paramData) {
    this.paramData = paramData.asObservable();
  }

  @override
  @action
  Future<void> getData() async {
    final result = await networkManager.dioGet(path: ApiUrls.getFaturalar, bodyModel: BaseSiparisEditModel(), queryParameters: siparislerRequestModel.copyWith(sayfa: page).toJson());
    if (result.isSuccess) {
      final List<BaseSiparisEditModel> list = result.dataList;
      if (list.length < parametreModel.sabitSayfalamaOgeSayisi) {
        dahaVarMi = false;
      } else {
        dahaVarMi = true;
        siparislerRequestModel = siparislerRequestModel.copyWith(sayfa: (siparislerRequestModel.sayfa ?? 0) + 1);
      }
      if (observableList == null) {
        setObservableList(
          ((CacheManager.getTaltekEditLists(list.firstOrNull?.getEditTipiEnum ?? EditTipiEnum.satisTeklifi)?.toList().cast<BaseSiparisEditModel>() ?? <BaseSiparisEditModel>[])
                ..mapIndexed((index, element) => element..index = index).toList()) +
              result.dataList,
        );
      } else {
        addObservableList(list);
      }
      if (!(result.paramData?.values.contains("0") ?? true)) {
        final Map<String, dynamic> paramData = result.paramData?.map((key, value) => MapEntry(key, double.tryParse((value as String).replaceAll(",", ".")))).cast<String, dynamic>() ?? {};
        setParamData(paramData);
      }
    }
  }

  @action
  Future<void> getGrupKodlari() async {
    final result = await networkManager.getGrupKod(name: GrupKoduEnum.cari, grupNo: -1, kullanimda: true);
    grupKodlariList = result.asObservable();
  }
}
