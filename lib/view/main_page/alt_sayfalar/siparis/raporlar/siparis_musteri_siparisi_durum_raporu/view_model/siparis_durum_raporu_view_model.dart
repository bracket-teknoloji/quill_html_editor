import "package:mobx/mobx.dart";

import "../../../../../../../core/constants/enum/siparis_tipi_enum.dart";
import "../../../../../../../core/constants/extensions/date_time_extensions.dart";
import "../../../base_siparis_edit/model/base_siparis_edit_model.dart";
import "../../../siparisler/model/siparisler_request_model.dart";

part "siparis_durum_raporu_view_model.g.dart";

class SiparisDurumRaporuViewModel = _SiparisDurumRaporuViewModelBase
    with _$SiparisDurumRaporuViewModel;

abstract class _SiparisDurumRaporuViewModelBase with Store {
  _SiparisDurumRaporuViewModelBase(this.siparisTipiEnum) {
    siparislerRequestModel =
        siparislerRequestModel.copyWith(pickerBelgeTuru: pickerBelgeTuru);
  }
  final Map<String, String> siralaMap = {
    "Belge No (Artan)": "AZ",
    "Belge No (Azalan)": "ZA",
    "Tarih (Artan)": "TARIH_AZ",
    "Tarih (Azalan)": "TARIH_ZA",
    "Stok Adı (Artan)": "STOK_ADI_AZ",
    "Stok Adı (Azalan)": "STOK_ADI_ZA",
    "Stok Kodu (Artan)": "STOK_KODU_AZ",
    "Stok Kodu (Azalan)": "STOK_KODU_ZA",
  };
  final Map<String, bool> gorunecekAlanlarMap = {
    "Stok": true,
    "Cari": true,
    "Belge No": true,
    "Tarih": true,
  };
  final List<String?> karsilamaValueList = [null, "K", "A"];
  final List<String?> siparisValueList = [null, "K", "B"];
  late final SiparisTipiEnum siparisTipiEnum;
  @observable
  bool searchBar = false;
  @action
  void setSearchBar() => searchBar = !searchBar;
  @observable
  String? searchKey;
  @action
  void setSearchKey(String? value) => searchKey = value;
  @observable
  bool dahaVarMi = false;
  @action
  void setDahaVarMi(bool value) => dahaVarMi = value;
  @observable
  int karsilanmaGroupValue = 1;
  @action
  void setKarsilanmaGroupValue(int value) {
    karsilanmaGroupValue = value + 1;
    siparislerRequestModel = siparislerRequestModel.copyWith(
        siparisKarsilanmaDurumu: karsilamaValueList[value]);
  }

  @observable
  int durumGroupValue = 1;
  @action
  void setDurumGroupValue(int value) {
    durumGroupValue = value + 1;
    siparislerRequestModel =
        siparislerRequestModel.copyWith(siparisDurumu: siparisValueList[value]);
  }

  @computed
  String get pickerBelgeTuru => siparisTipiEnum.rawValue;
  @observable
  SiparislerRequestModel siparislerRequestModel = SiparislerRequestModel(
      sayfa: 1,
      ekranTipi: "R",
      baslamaTarihi: DateTime.now().toDateString,
      bitisTarihi: DateTime.now().toDateString,
      siralama: "TARIH_ZA");

  @observable
  ObservableList<KalemModel?>? kalemList;

  @computed
  ObservableList<KalemModel?>? get kalemListComputed => kalemList
      ?.where((element) =>
          element?.stokAdi
              ?.toUpperCase()
              .contains(searchKey?.toUpperCase() ?? "") ??
          false)
      .toList()
      .asObservable();

  @action
  void setKalemList(List<KalemModel?>? value) =>
      kalemList = value?.asObservable();

  @action
  void addKalemList(List<KalemModel?>? value) => kalemList =
      (kalemList! + value!.asObservable()) as ObservableList<KalemModel?>?;

  @action
  void setSiralama(String? value) =>
      siparislerRequestModel = siparislerRequestModel.copyWith(siralama: value);
  @action
  void setStokKodu(String? value) => siparislerRequestModel =
      siparislerRequestModel.copyWith(referansStokKodu: value);
  @action
  void setCariKodu(String? value) =>
      siparislerRequestModel = siparislerRequestModel.copyWith(cariKodu: value);
  @action
  void setBelgeNo(String? value) =>
      siparislerRequestModel = siparislerRequestModel.copyWith(belgeNo: value);
  @action
  void setBaslamaTarihi(String? value) => siparislerRequestModel =
      siparislerRequestModel.copyWith(baslamaTarihi: value);
  @action
  void setBitisTarihi(String? value) => siparislerRequestModel =
      siparislerRequestModel.copyWith(bitisTarihi: value);
  @action
  void increaseSayfa() => siparislerRequestModel =
      siparislerRequestModel.copyWith(sayfa: siparislerRequestModel.sayfa! + 1);
  @action
  void resetSayfa() =>
      siparislerRequestModel = siparislerRequestModel.copyWith(sayfa: 1);
}
