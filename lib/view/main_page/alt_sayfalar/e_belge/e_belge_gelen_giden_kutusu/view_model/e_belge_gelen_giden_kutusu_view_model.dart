import "dart:convert";

import "package:mobx/mobx.dart";
import "package:picker/core/base/view_model/mobx_network_mixin.dart";
import "package:picker/core/constants/enum/e_belge_enum.dart";
import "package:picker/core/constants/enum/e_belge_turu_enum.dart";
import "package:picker/core/constants/extensions/date_time_extensions.dart";
import "package:picker/core/init/network/login/api_urls.dart";
import "package:picker/view/main_page/alt_sayfalar/e_belge/e_belge_gelen_giden_kutusu/model/e_belge_listesi_model.dart";
import "package:picker/view/main_page/alt_sayfalar/e_belge/e_belge_gelen_giden_kutusu/model/e_belge_request_model.dart";

part "e_belge_gelen_giden_kutusu_view_model.g.dart";

class EBelgeGelenGidenKutusuViewModel = _EBelgeGelenGidenKutusuViewModelBase with _$EBelgeGelenGidenKutusuViewModel;

abstract class _EBelgeGelenGidenKutusuViewModelBase with Store, MobxNetworkMixin {
  //create constructor
  _EBelgeGelenGidenKutusuViewModelBase({required this.eBelgeEnum}) {
    eBelgeRequestModel.faturaYonu = eBelgeEnum.faturaYonu;
  }

  final Map<String, String> siralaMap = {
    "Belge No (A-Z)": "BELGE_NO_AZ",
    "Belge No (Z-A)": "BELGE_NO_ZA",
    "Tarih (Artan)": "TARIH_AZ",
    "Tarih (Azalan)": "TARIH_ZA",
    "Cari Adı (A-Z)": "CARI_ADI_AZ",
    "Cari Adı (Z-A)": "CARI_ADI_ZA",
  };

  List<EBelgeTuruEnum> get eBelgeTuru => EBelgeTuruEnum.values.where((element) => element.yetkiVarMi(eBelgeEnum)).toList();

  final Map<String, bool> tarihTuru = {
    "Kayıt Tarihi": true,
    "Belge Tarihi": false,
  };

  final Map<String, String?> senaryoMap = {
    "Tümü": null,
    "Temel": "TEM",
    "Ticari": "TIC",
  };

  final Map<String, String?> basimMap = {
    "Tümü": null,
    "Basım Yapıldı": "E",
    "Basım Yapılmadı": "H",
  };

  final Map<String, String?> onayMap = {
    "Tümü": null,
    "Kabul": "0",
    "Ret": "1",
    "Şartlı Kabul": "2",
    "Bekliyor": "3",
  };

  final Map<String, String?> kontrolMap = {
    "Tümü": null,
    "Evet": "E",
    "Hayır": "H",
  };

  final Map<String, String?> netsisIslenmeMap = {
    "Tümü": null,
    "İşlendi": "E",
    "Bekliyor": "H",
  };

  @observable
  late EBelgeEnum eBelgeEnum;

  @observable
  ObservableMap<String, dynamic>? paramData;

  @observable
  bool searchBar = false;

  @observable
  bool digerGoster = false;

  @observable
  bool dahaVarMi = true;

  @observable
  bool isScrolledDown = false;

  @observable
  String? error;

  @observable
  String eArsivDateString = "Bu hafta ${DateTime.now().getWeekOfYear}";

  @observable
  EBelgeRequestModel eBelgeRequestModel = EBelgeRequestModel(
    sayfa: 1,
    eBelgeTuru: "EFT",
    sirala: "TARIH_ZA",
    kayitTarihineGore: true,
    baslamaTarihi: DateTime.now().toDateString,
    bitisTarihi: DateTime.now().toDateString,
  );

  @observable
  ObservableList<EBelgeListesiModel>? eBelgeListesi = ObservableList<EBelgeListesiModel>();

  @action
  void changeIsScrolledDown(bool isScrolledDown) => this.isScrolledDown = isScrolledDown;

  @action
  void changeDahaVarMi(bool dahaVarMi) => this.dahaVarMi = dahaVarMi;

  @action
  void changeSearchBar() => searchBar = !searchBar;

  @action
  void setEBelgeListesi(List<EBelgeListesiModel>? eBelgeListesi) => this.eBelgeListesi = eBelgeListesi?.asObservable();

  @action
  void addEBelgeListesi(List<EBelgeListesiModel> eBelgeListesi) => this.eBelgeListesi?.addAll(eBelgeListesi);

  @action
  void increaseSayfa() => eBelgeRequestModel = eBelgeRequestModel.copyWith(sayfa: (eBelgeRequestModel.sayfa ?? 0) + 1);

  @action
  void resetSayfa() => eBelgeRequestModel = eBelgeRequestModel.copyWith(sayfa: 1);

  @action
  void changeSiralama(String siralama) => eBelgeRequestModel = eBelgeRequestModel.copyWith(sirala: siralama);

  @action
  void changeSearchText(String? searchText) => eBelgeRequestModel = eBelgeRequestModel.copyWith(searchText: searchText != "" ? searchText : null);

  @action
  void changeEBelgeTuru(String? eBelgeTuru) {
    eBelgeRequestModel = eBelgeRequestModel.copyWith(eBelgeTuru: eBelgeTuru);
    if (eBelgeTuru == "AFT") {
      eBelgeRequestModel.sorgulanmasin = null;
      changeSenaryo(null);
      changeOnayDurumu(null);
    } else if (eBelgeTuru == "EIR") {
      changeSenaryo(null);
    }
  }

  @action
  void changeTarihTuru(bool? value) => eBelgeRequestModel = eBelgeRequestModel.copyWith(kayitTarihineGore: value);

  @action
  void changeDigerGoster() => digerGoster = !digerGoster;

  @action
  void changeSorgulanmasin() => eBelgeRequestModel = eBelgeRequestModel.copyWith(sorgulanmasin: eBelgeRequestModel.sorgulanmasin == null ? true : null);

  @action
  void changeBaslangicTarihi(String? value) => eBelgeRequestModel = eBelgeRequestModel.copyWith(baslamaTarihi: value);

  @action
  void changeBitisTarihi(String? value) => eBelgeRequestModel = eBelgeRequestModel.copyWith(bitisTarihi: value);

  @action
  void changeOnayDurumu(String? value) => eBelgeRequestModel = eBelgeRequestModel.copyWith(onayDurumu: value);

  @action
  void changeSenaryo(String? value) => eBelgeRequestModel = eBelgeRequestModel.copyWith(senaryo: value);

  @action
  void changeKontrol(String? value) => eBelgeRequestModel = eBelgeRequestModel.copyWith(kontrolEdildi: value);

  @action
  void changeBasim(String? value) => eBelgeRequestModel = eBelgeRequestModel.copyWith(basimDurumu: value);

  @action
  void changeNetsisIslenme(String? value) => eBelgeRequestModel = eBelgeRequestModel.copyWith(islendi: value);

  @action
  Future<void> resetPage() async {
    resetSayfa();
    setEBelgeListesi(null);
    await getData();
  }

  @action
  Future<void> getData() async {
    error = null;
    final result =
        await networkManager.dioGet<EBelgeListesiModel>(path: ApiUrls.getEFaturalar, bodyModel: EBelgeListesiModel(), queryParameters: {"FilterModel": jsonEncode(eBelgeRequestModel.toJson())});
    // if (result.data is List) {
    //   final List<EBelgeListesiModel> eBelgeListesi = result.data as List<EBelgeListesiModel>;
    // }
    if (result.success != true) {
      error = result.message;
      setEBelgeListesi([]);
      return;
    }

    if (result.data is List) {
      if (eBelgeRequestModel.sayfa == 1) {
        paramData = result.paramData?.map((key, value) => MapEntry(key, double.tryParse((value as String).replaceAll(",", ".")) ?? value)).asObservable();
      }
      final List<EBelgeListesiModel> list = result.data.cast<EBelgeListesiModel>();
      if ((eBelgeRequestModel.sayfa ?? 0) < 2) {
        setEBelgeListesi(list);
      } else {
        addEBelgeListesi(list);
      }
      if (list.length < parametreModel.sabitSayfalamaOgeSayisi) {
        changeDahaVarMi(false);
      } else {
        changeDahaVarMi(true);
        increaseSayfa();
      }
    }
  }
}
