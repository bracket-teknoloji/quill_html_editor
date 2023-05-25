import 'package:mobx/mobx.dart';
import 'package:picker/view/main_page/alt_sayfalar/cari/cari_listesi/model/cari_listesi_model.dart';

import '../model/stok_hareketleri_model.dart';

part 'stok_hareketleri_view_model.g.dart';

class StokHareketleriViewModel = _StokHareketleriViewModelBase with _$StokHareketleriViewModel;

abstract class _StokHareketleriViewModelBase with Store {
  @observable
  CariListesiModel? cariListesiModel;

  @action
  void setCariListesiModel(CariListesiModel? model) => cariListesiModel = model;

  @observable
  ObservableList<bool> isSelected = [true, false, false].asObservable();

  @action
  void resetIsSelected() => isSelected = [true, false, false].asObservable();

  @action
  void changeIsSelected(int index) {
    for (int i = 0; i < isSelected.length; i++) {
      if (i == index) {
        isSelected[i] = true;
      } else {
        isSelected[i] = false;
      }
    }
  }

  @computed
  String get getIsSelected => isSelected.indexWhere((element) => element == true) == 0
      ? ""
      : isSelected.indexWhere((element) => element == true) == 1
          ? "G"
          : "C";

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
    "Zayi İrade Fatura": "M",
  };

  @observable
  List<String> hareketYonuList = ["Tümü", "Giriş", "Çıkış"];
  @observable
  List<String>? arrHareketTuru = [];

  @action
  void addArrHareketTuru(String value) => arrHareketTuru?.add(value);
  @action
  void changeArrHareketTuru(List<String> value) => arrHareketTuru = value;
  @computed
  String get getArrHareketTuru => arrHareketTuru!.join(", ");
  @action
  void clearArrHareketTuru() => arrHareketTuru = [];
  @observable
  bool dovizliFiyat = false;

  @action
  void changeDovizliFiyat() {
    dovizliFiyat = !dovizliFiyat;
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
  void filterStokHareketleri(String value) => filteredStokHareketleri = stokHareketleri?.where((element) => element.fisno!.toLowerCase().contains(value.toLowerCase())).toList();
}
