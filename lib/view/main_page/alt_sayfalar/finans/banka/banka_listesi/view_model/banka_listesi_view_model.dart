import "dart:convert";

import "package:collection/collection.dart";
import "package:mobx/mobx.dart";
import "package:picker/core/base/view_model/mobx_network_mixin.dart";
import "package:picker/core/init/network/login/api_urls.dart";
import "package:picker/view/main_page/alt_sayfalar/finans/banka/banka_listesi/model/banka_listesi_model.dart";
import "package:picker/view/main_page/alt_sayfalar/finans/banka/banka_listesi/model/banka_listesi_request_model.dart";

part "banka_listesi_view_model.g.dart";

class BankaListesiViewModel = _BankaListesiViewModelBase with _$BankaListesiViewModel;

abstract class _BankaListesiViewModelBase with Store, MobxNetworkMixin {
  final Map<String, String> siralaMap = {
    "Hesap Kodu (A-Z)": "KOD_AZ",
    "Hesap Kodu (Z-A)": "KOD_ZA",
    "Hesap Adı (A-Z)": "ADI_AZ",
    "Hesap Adı (Z-A)": "ADI_ZA",
  };

  final Map<String, String?> filtreleMap = {
    "Tümü": null,
    "Bakiyeli": "B",
    "Eksi": "E",
    "Artı": "A",
  };

  final List<String> hesapTipiList = [
    "Vadesiz Mevduat",
    "Vadeli Mevduat",
    "Repo",
    "Teminat Çekleri",
    "Teminat Senetleri",
    "Tahsil Çekleri",
    "Tahsil Senetleri",
    "Nak.Krd-Borç.Cari Krd.(Rot.)",
    "Nakit Kredi - Spot",
    "Nakit Kredi İskonto (İştira)",
    "Gayri Nakdi Krd.(Tem.Mek.)",
    "Gayri Nakdi Krd.(Harici Garanti)",
    "Gayri Nakdi Krd.(İthalat Akreditifi)",
    "Gayri Nakdi Krd.(Kabul ve Aval)",
    "Gayri Nakdi Krd.(Kredi Kartı Hesabı)",
    "Kredi kartı Hesabı",
    "Taksitli Kredi",
    "Uzun/Orta Vadeli Kredi",
    "Borç Çekleri",
    "Borç Senetleri",
    "Firma Kredi Kartı",
  ];

  @observable
  bool searchBar = false;

  @observable
  String? errorText;

  @observable
  String? searchValue;

  @observable
  ObservableList<BankaListesiModel>? bankaListesi;

  @observable
  BankaListesiRequestModel model = BankaListesiRequestModel(ekranTipi: "L", menuKodu: "YONE_BANK");

  @computed
  ObservableList<List<BankaListesiModel>> get groupedWithHesapTipiAdiList {
    if (bankaListesi == null) return <ObservableList<BankaListesiModel>>[].asObservable();
    // create a list of filtered items by searchValue
    final filteredList = bankaListesi?.where((element) => element.hesapAdi?.toLowerCase().contains(searchValue?.toLowerCase() ?? "") ?? false).toList().asObservable();
    final groupedList = groupBy(filteredList ?? <BankaListesiModel>[], (BankaListesiModel e) => e.hesapTipiAdi);
    return groupedList.values.toList().sorted((a, b) => b.first.hesapTipi!.compareTo(a.first.hesapTipi!)).asObservable();
  }

  @action
  void setSearchBar() => searchBar = !searchBar;

  @action
  void setSearchText(String? value) => searchValue = value;

  @action
  void setErrorText(String? value) => errorText = value;

  @action
  void setBankaListesi(List<BankaListesiModel>? value) => bankaListesi = value?.asObservable();

  @action
  void setSiralama(String value) => model = model.copyWith(sirala: value);

  @action
  void setHesapTipi(List<int>? value) => model = model.copyWith(arrHesapTipi: jsonEncode(value));

  @action
  void setBakiye(String? value) => model = model.copyWith(bakiye: value);

  @action
  Future<void> resetPage() async {
    setBankaListesi(null);
    await getData();
  }

  @action
  Future<void> getData() async {
    setErrorText(null);
    final result = await networkManager.dioGet<BankaListesiModel>(
      path: ApiUrls.getBankaHesaplari,
      bodyModel: BankaListesiModel(),
      queryParameters: model.toJson(),
    );
    if (result.data is List) {
      setBankaListesi(result.data.map((e) => e as BankaListesiModel).toList().cast<BankaListesiModel>());
    } else {
      setErrorText(result.message);
      setBankaListesi([]);
    }
  }
}
