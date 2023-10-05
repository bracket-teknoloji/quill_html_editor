import "package:kartal/kartal.dart";
import "package:mobx/mobx.dart";
import "../../../../../../../core/init/network/login/api_urls.dart";
import "../model/kasa_listesi_model.dart";

import "../../../../../../../core/base/view_model/mobx_network_mixin.dart";

part "kasa_listesi_view_model.g.dart";

class KasaListesiViewModel = _KasaListesiViewModelBase with _$KasaListesiViewModel;

abstract class _KasaListesiViewModelBase with Store, MobxNetworkMixin {
  final Map<String, dynamic> siralaMap = {
    "Kasa Kodu (A-Z)": "KOD_AZ",
    "Kasa Kodu (Z-A)": "KOD_ZA",
    "Kasa Adı (A-Z)": "ADI_AZ",
    "Kasa Adı (Z-A)": "ADI_ZA",
  };

  final Map<String, String> filtreleMap = {
    "Tümü": "T",
    "Bakiyeli": "B",
    "Eksi": "E",
    "Artı": "A",
  };
  //* Observables

  @observable
  bool searchBar = false;

  @observable
  bool isScrollDown = true;

  @observable
  String filtreGroupValue = "T";

  @observable
  String sirala = "KOD_AZ";

  @observable
  String? searchText;

  @observable
  ObservableList<KasaListesiModel>? kasaListesi;

  //* Computed
  @computed
  double get getGelir {
    // Bütün kasaların toplam giriş tutarını hesaplar
    double toplamGiris = 0;
    kasaListesi?.forEach((element) {
      toplamGiris += element.toplamGiris ?? 0;
    });
    return toplamGiris;
  }

  @computed
  double get getGider {
    // Bütün kasaların toplam çıkış tutarını hesaplar
    double toplamCikis = 0;
    kasaListesi?.forEach((element) {
      toplamCikis += element.toplamCikis ?? 0;
    });
    return toplamCikis;
  }

  @computed
  double get bakiye => getGelir - getGider;

  @computed
  ObservableList<KasaListesiModel>? get getKasaListesi {
    // Arama çubuğuna yazılan değere göre filtreleme yapar
    if (searchText.ext.isNotNullOrNoEmpty) {
      return kasaListesi?.where((element) => element.kasaTanimi?.toLowerCase().contains(searchText!.toLowerCase()) ?? false).toList().asObservable();
    }
    return kasaListesi;
  }

  get index => null;

  //* Actions
  @action
  void setFiltreGroupValue(int? value) => filtreGroupValue = filtreleMap.values.toList()[value ?? 0];

  @action
  void setSirala(String value) => sirala = value;

  @action
  void setSearchText(String? value) => searchText = value;

  @action
  void setSearchBar() {
    searchBar = !searchBar;
    if (!searchBar) {
      setSearchText(null);
    }
  }

  @action
  void setIsScrollDown(bool value) => isScrollDown = value;

  @action
  void setKasaListesi(List<KasaListesiModel>? value) => kasaListesi = value?.asObservable();

  @action
  Future<void> getData() async {
    var result = await networkManager
        .dioGet<KasaListesiModel>(path: ApiUrls.getKasalar, bodyModel: KasaListesiModel(), queryParameters: {"MenuKodu": "YONE_KASA", "Sirala": sirala, "Bakiye": filtreGroupValue});
    if (result.data is List) {
      setKasaListesi(result.data.cast<KasaListesiModel>());
    }
  }
}
