import "dart:convert";

import "package:collection/collection.dart";
import "package:mobx/mobx.dart";

import "../../../../../../../core/base/view_model/mobx_network_mixin.dart";
import "../../../../../../../core/init/network/login/api_urls.dart";
import "../model/banka_listesi_model.dart";
import "../model/banka_listesi_request_model.dart";

part "banka_listesi_view_model.g.dart";

final class BankaListesiViewModel = _BankaListesiViewModelBase with _$BankaListesiViewModel;

abstract class _BankaListesiViewModelBase with Store, MobxNetworkMixin {
  final Map<String, String> siralaMap = {
    "Hesap Kodu (A-Z)": "KOD_AZ",
    "Hesap Kodu (Z-A)": "KOD_ZA",
    "Hesap Adı (A-Z)": "ADI_AZ",
    "Hesap Adı (Z-A)": "ADI_ZA",
  };

  final Map<String, String?> filtreleMap = {"Tümü": null, "Bakiyeli": "B", "Eksi": "E", "Artı": "A"};

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
    final filteredList = bankaListesi
        ?.where((element) => element.hesapAdi?.toLowerCase().contains(searchValue?.toLowerCase() ?? "") ?? true)
        .toList()
        .asObservable();
    final groupedList = groupBy(filteredList ?? <BankaListesiModel>[], (e) => e.hesapTipiAdi);
    return groupedList.values
        .toList()
        .sorted((a, b) => b.firstOrNull?.hesapTipi?.compareTo(a.firstOrNull?.hesapTipi ?? 0) ?? 0)
        .asObservable();
  }

  @computed
  ObservableList<List<BankaListesiModel>> get groupedWithBankName {
    if (bankaListesi == null) return <ObservableList<BankaListesiModel>>[].asObservable();
    // create a list of filtered items by searchValue
    final filteredList = bankaListesi
        ?.where((element) => element.hesapAdi?.toLowerCase().contains(searchValue?.toLowerCase() ?? "") ?? true)
        .toList()
        .asObservable();
    final groupedList = groupBy(filteredList ?? <BankaListesiModel>[], (e) => e.bankaAdi);
    return groupedList.values
        .toList()
        .sorted((a, b) => a.firstOrNull?.hesapTipi?.compareTo(b.firstOrNull?.hesapTipi ?? 0) ?? 0)
        .asObservable();
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
    if (result.isSuccess) {
      setBankaListesi(result.dataList);
    } else {
      setErrorText(result.message);
      setBankaListesi([]);
    }
  }
}
