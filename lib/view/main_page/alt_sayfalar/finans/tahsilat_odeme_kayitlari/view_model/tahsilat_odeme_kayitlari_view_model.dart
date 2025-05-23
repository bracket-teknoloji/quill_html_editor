import "dart:convert";
import "dart:developer";

import "package:collection/collection.dart";
import "package:mobx/mobx.dart";

import "../../../../../../../core/base/view_model/mobx_network_mixin.dart";
import "../../../../../../../core/init/network/login/api_urls.dart";
import "../../../cari/cari_hareketleri/model/cari_hareketleri_model.dart";
import "../../../cari/cari_hareketleri/model/cari_hareketleri_request_model.dart";

part "tahsilat_odeme_kayitlari_view_model.g.dart";

final class TahsilatOdemeKayitlariViewModel = _TahsilatOdemeKayitlariViewModelBase
    with _$TahsilatOdemeKayitlariViewModel;

abstract class _TahsilatOdemeKayitlariViewModelBase with Store, MobxNetworkMixin {
  final Map<String, dynamic> hesapTipiMap = {"Tümü": null, "Tahsilat": "A", "Ödeme": "B"};

  final Map<String, String> hareketTuruMap = {
    "Kasa": "D",
    "Müşteri Senedi": "E",
    "Borç Senedi": "F",
    "Müşteri Çeki": "G",
    "Borç Çeki": "H",
    "Protestolu Senet": "I",
    "Karşılıksız Çek": "J",
    "Dekont": "K",
  };

  //* Observables
  @observable
  CariHareketleriRequestModel cariHareketleriRequestModel = CariHareketleriRequestModel(
    ekranTipi: "L",
    siralama: "AZ",
    sadeceTahsilatlarOdemeler: true,
  );

  @observable
  String? hesapTipiGroupValue;

  @observable
  bool isScrollDown = true;

  @observable
  ObservableList<CariHareketleriModel>? cariHareketleriListesi;

  @observable
  bool searchBar = false;

  @observable
  String? searchText;

  @computed
  double get toplamTahsilat => cariHareketleriListesi?.map((e) => e.alacak ?? 0).sum ?? 0;

  @computed
  double get toplamOdeme => cariHareketleriListesi?.map((e) => e.borc ?? 0).sum ?? 0;

  //* Computed
  @computed
  ObservableList<CariHareketleriModel>? get getCariHareketleriListesi => searchText != null
      ? cariHareketleriListesi
            ?.where(
              (element) =>
                  (element.belgeNo?.contains(searchText ?? "") ?? false) ||
                  (element.cariAdi?.contains(searchText ?? "") ?? false) ||
                  (element.cariKodu?.contains(searchText ?? "") ?? false),
            )
            .toList()
            .asObservable()
      : cariHareketleriListesi;

  @computed
  bool get getAnyFilter =>
      cariHareketleriRequestModel.ba != null ||
      cariHareketleriRequestModel.arrHareketTuru != null ||
      cariHareketleriRequestModel.cariKodu != null ||
      cariHareketleriRequestModel.arrPlasiyerKodu != null;

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
      cariHareketleriRequestModel = cariHareketleriRequestModel.copyWith(baslamaTarihi: value);

  @action
  void setBitisTarihi(String? value) =>
      cariHareketleriRequestModel = cariHareketleriRequestModel.copyWith(bitisTarihi: value);

  @action
  void setIslemTuru(int? value) =>
      cariHareketleriRequestModel = cariHareketleriRequestModel.copyWith(ba: hesapTipiMap.values.toList()[value ?? 0]);

  @action
  void setCariKodu(String? value) =>
      cariHareketleriRequestModel = cariHareketleriRequestModel.copyWith(cariKodu: value);

  @action
  void setHareketTuru(List<String>? value) =>
      cariHareketleriRequestModel = cariHareketleriRequestModel.copyWith(arrHareketTuru: jsonEncode(value));

  @action
  void setPlasiyerKodu(List<String>? value) =>
      cariHareketleriRequestModel = cariHareketleriRequestModel.copyWith(arrPlasiyerKodu: jsonEncode(value));

  @action
  void clearFilters() {
    cariHareketleriRequestModel = cariHareketleriRequestModel.copyWith(
      ba: null,
      arrHareketTuru: null,
      arrPlasiyerKodu: null,
      cariKodu: null,
    );
  }

  @action
  void setcariHareketleriListesi(List<CariHareketleriModel>? value) => cariHareketleriListesi = value?.asObservable();

  @action
  Future<void> resetPage() async {
    cariHareketleriListesi = null;
    await getData();
  }

  @action
  Future<void> getData() async {
    final result = await networkManager.dioGet<CariHareketleriModel>(
      path: ApiUrls.getCariHareketleri,
      bodyModel: CariHareketleriModel(),
      queryParameters: cariHareketleriRequestModel.toJson(),
    );
    if (result.isSuccess) {
      final List<CariHareketleriModel> list = result.dataList;
      setcariHareketleriListesi(list);
      log(list.map((e) => e.hareketAciklama).toSet().toString(), name: "Benzersiz Hareket Türleri");
    }
  }
}
