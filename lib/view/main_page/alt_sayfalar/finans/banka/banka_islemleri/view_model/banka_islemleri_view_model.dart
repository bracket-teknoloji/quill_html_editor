import "dart:convert";

import "package:collection/collection.dart";
import "package:mobx/mobx.dart";

import "../../../../../../../core/base/view_model/mobx_network_mixin.dart";
import "../../../../../../../core/constants/extensions/date_time_extensions.dart";
import "../../../../../../../core/init/network/login/api_urls.dart";
import "../../banka_hareketleri/model/banka_hareketleri_model.dart";
import "../model/banka_islemleri_request_model.dart";

part "banka_islemleri_view_model.g.dart";

final class BankaIslemleriViewModel = _BankaIslemleriViewModelBase with _$BankaIslemleriViewModel;

abstract class _BankaIslemleriViewModelBase with Store, MobxNetworkMixin {
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

  //* Observables
  @observable
  BankaIslemleriRequestModel bankaIslemleriRequestModel = BankaIslemleriRequestModel(
    menuKodu: "YONE_BISL",
    baslamaTarihi: DateTime.now().toDateString,
    bitisTarihi: DateTime.now().toDateString,
  );

  @observable
  bool isScrollDown = true;
  @observable
  bool searchBar = false;

  @observable
  ObservableList<BankaHareketleriModel>? bankaIslemleriListesi;

  @observable
  String? searchText;

  //* Computed

  @computed
  double get gelenTutar =>
      bankaIslemleriListesi?.where((element) => element.ba == "B").map((e) => e.tutar ?? 0).sum ?? 0;

  @computed
  double get gidenTutar =>
      bankaIslemleriListesi?.where((element) => element.ba == "A").map((e) => e.tutar ?? 0).sum ?? 0;

  @computed
  ObservableList<BankaHareketleriModel>? get getBankaIslemleriListesi =>
      (searchText != null && searchText != "")
          ? bankaIslemleriListesi
              ?.where(
                (element) =>
                    element.belgeno != null && element.belgeno!.toLowerCase().contains(searchText!.toLowerCase()),
              )
              .toList()
              .asObservable()
          : bankaIslemleriListesi;

  //* Actions
  @action
  void setIsScrollDown(bool value) => isScrollDown = value;

  @action
  void changeSearchBar() {
    searchBar = !searchBar;
    searchText = null;
  }

  @action
  void setSearchText(String? value) => searchText = value;
  @action
  void setBaslamaTarihi(String? value) =>
      bankaIslemleriRequestModel = bankaIslemleriRequestModel.copyWith(baslamaTarihi: value);

  @action
  void setBitisTarihi(String? value) =>
      bankaIslemleriRequestModel = bankaIslemleriRequestModel.copyWith(bitisTarihi: value);

  @action
  void setBankaIslemleriListesi(List<BankaHareketleriModel>? value) => bankaIslemleriListesi = value?.asObservable();

  @action
  void addBankaIslemleriListesi(List<BankaHareketleriModel>? value) => bankaIslemleriListesi?.addAll(value ?? []);

  @action
  void clearFilters() {
    bankaIslemleriRequestModel = bankaIslemleriRequestModel.copyWith(hesapKodu: null, hesapTipi: null);
  }

  @action
  void setHesapKodu(String? value) =>
      bankaIslemleriRequestModel = bankaIslemleriRequestModel.copyWith(hesapKodu: value);

  @action
  void setHesapTipi(List<int>? value) =>
      bankaIslemleriRequestModel = bankaIslemleriRequestModel.copyWith(hesapTipi: jsonEncode(value));

  @action
  Future<void> resetPage() async {
    bankaIslemleriListesi = null;
    await getData();
  }

  @action
  Future<void> getData() async {
    final result = await networkManager.dioGet<BankaHareketleriModel>(
      path: ApiUrls.getBankaHareketleri,
      bodyModel: BankaHareketleriModel(),
      queryParameters: bankaIslemleriRequestModel.toJson(),
    );
    if (result.isSuccess) {
      setBankaIslemleriListesi(result.dataList);
    }
  }
}
