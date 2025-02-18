import "package:mobx/mobx.dart";
import "package:picker/core/constants/extensions/iterable_extensions.dart";
import "package:picker/core/init/cache/cache_manager.dart";

import "../../../cari/cari_listesi/model/cari_listesi_model.dart";
import "../model/stok_hareketleri_model.dart";

part "stok_hareketleri_view_model.g.dart";

typedef GizlenecekAlanlar = ({String name, String value});

final class StokHareketleriViewModel = _StokHareketleriViewModelBase with _$StokHareketleriViewModel;

abstract class _StokHareketleriViewModelBase with Store {
  @observable
  CariListesiModel? cariListesiModel;

  @action
  void setCariListesiModel(CariListesiModel? model) => cariListesiModel = model;

  @observable
  ObservableList<int> isSelected = [0, 1, 2].asObservable();

  // @action
  // void resetIsSelected() => isSelected = [true, false, false].asObservable();

  @observable
  int? isSelectedGroupValue = 0;

  @action
  void changeIsSelected(int index) {
    isSelectedGroupValue = index;
    // for (int i = 0; i < isSelected.length; i++) {
    //   if (i == index) {
    //     isSelected[i] = true;
    //   } else {
    //     isSelected[i] = false;
    //   }
    // }
  }

  @computed
  String get getIsSelected =>
      isSelectedGroupValue == 0
          ? ""
          : isSelectedGroupValue == 1
          ? "G"
          : "C";

  @computed
  double get toplamGiris =>
      stokHareketleri!.where((element) => element.cikisIslemi != true).map((e) => e.stharGcmik).sum;

  @computed
  double get toplamCikis =>
      stokHareketleri!.where((element) => element.cikisIslemi == true).map((e) => e.stharGcmik).sum;

  @computed
  double get toplamBakiye => toplamGiris - toplamCikis;

  @observable
  Map<String, String> hareketTuruMap = {
    "Devir": "A",
    "Depo Transferi": "B",
    "Üretim": "C",
    "Muhtelif": "D",
    "Miktarsız Maliyet": "E",
    "Konsinye": "F",
    "Müstahsil Makbuzu": "G",
    "İrsaliye": "H",
    "Kapalı Fatura": "I",
    "Açık Fatura": "J",
    "Muhtelif Fatura": "K",
    "İade Fatura": "L",
    "Zayi İade Fatura": "M",
  };

  final List<GizlenecekAlanlar> gizlenecekAlanlar = [
    (name: "Belge No", value: "BN"),
    (name: "Cari/Stok Adı", value: "CSA"),
    (name: "Depo", value: "D"),
    (name: "Fiyat", value: "F"),
    (name: "Tutar", value: "T"),
    (name: "KDV", value: "K"),
    (name: "Hareket Türü", value: "HT"),
    (name: "Plasiyer", value: "P"),
    (name: "Yapılandırma", value: "Y"),
  ];

  @observable
  List<GizlenecekAlanlar> gizlenecekAlanlarList = [];

  @observable
  List<String> hareketYonuList = ["Tümü", "Giriş", "Çıkış"];
  @observable
  List<String>? arrHareketTuru = [];

  @action
  void setGizlenecekAlanlar(List<GizlenecekAlanlar> list) => gizlenecekAlanlarList = list;

  @action
  void addArrHareketTuru(String value) => arrHareketTuru?.add(value);
  @action
  void changeArrHareketTuru(List<String> value) => arrHareketTuru = value;
  @computed
  String get getArrHareketTuru => arrHareketTuru!.join(", ");
  @action
  void clearArrHareketTuru() => arrHareketTuru = [];
  @observable
  bool dovizliFiyat = CacheManager.getProfilParametre.stokhareketleriDovizliGoster;

  @action
  void changeDovizliFiyat() {
    dovizliFiyat = !dovizliFiyat;
    CacheManager.setProfilParametre(
      CacheManager.getProfilParametre.copyWith(stokhareketleriDovizliGoster: dovizliFiyat),
    );
  }

  @observable
  String? siralama = "TARIH_ZA";

  @action
  void setSiralama(String value) => siralama = value;
  @observable
  Future? future;

  @action
  void setFuture(Future? value) => future = value;

  @observable
  bool searchBar = false;

  @action
  void changeSearchBar() {
    searchBar = !searchBar;
  }

  @observable
  List<StokHareketleriModel>? stokHareketleri = [];

  @action
  void setStokHareketleri(List<StokHareketleriModel> value) {
    stokHareketleri = value;
  }

  @action
  void addStokHareketleri(StokHareketleriModel value) => stokHareketleri?.add(value);

  @observable
  List<StokHareketleriModel>? filteredStokHareketleri = [];

  @action
  void filterStokHareketleri(String value) =>
      filteredStokHareketleri =
          stokHareketleri?.where((element) => element.fisno!.toLowerCase().contains(value.toLowerCase())).toList();
}
