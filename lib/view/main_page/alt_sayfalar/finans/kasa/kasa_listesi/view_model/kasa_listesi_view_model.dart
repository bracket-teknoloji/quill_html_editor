import "package:kartal/kartal.dart";
import "package:mobx/mobx.dart";

import "../../../../../../../core/base/view_model/listable_mixin.dart";
import "../../../../../../../core/base/view_model/mobx_network_mixin.dart";
import "../../../../../../../core/base/view_model/searchable_mixin.dart";
import "../../../../../../../core/init/network/login/api_urls.dart";
import "../model/kasa_listesi_model.dart";

part "kasa_listesi_view_model.g.dart";

class KasaListesiViewModel = _KasaListesiViewModelBase with _$KasaListesiViewModel;

abstract class _KasaListesiViewModelBase with Store, MobxNetworkMixin, ListableMixin<KasaListesiModel>, SearchableMixin {
  final Map<String, String> siralaMap = {
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

  @override
  @observable
  bool isSearchBarOpen = false;

  @observable
  String filtreGroupValue = "T";

  @observable
  String sirala = "KOD_AZ";

  @override
  @observable
  String? searchText;

  @override
  @observable
  ObservableList<KasaListesiModel>? observableList;

  //* Computed
  @computed
  double get getGelir {
    // Bütün kasaların toplam giriş tutarını hesaplar
    double toplamGiris = 0;
    observableList?.forEach((element) {
      toplamGiris += element.toplamGiris ?? 0;
    });
    return toplamGiris;
  }

  @computed
  double get getGider {
    // Bütün kasaların toplam çıkış tutarını hesaplar
    double toplamCikis = 0;
    observableList?.forEach((element) {
      toplamCikis += element.toplamCikis ?? 0;
    });
    return toplamCikis;
  }

  @action
  @override
  Future<void> resetList() async {
    super.resetList();
    await getData();
  }

  @computed
  double get bakiye => getGelir - getGider;

  @computed
  ObservableList<KasaListesiModel>? get getKasaListesi {
    // Arama çubuğuna yazılan değere göre filtreleme yapar
    if (searchText.ext.isNotNullOrNoEmpty) {
      return observableList?.where((element) => element.kasaTanimi?.toLowerCase().contains(searchText!.toLowerCase()) ?? false).toList().asObservable();
    }
    return observableList;
  }

  int? get index => null;

  //* Actions
  @action
  void setFiltreGroupValue(int? value) => filtreGroupValue = filtreleMap.values.toList()[value ?? 0];

  @action
  void setSirala(String value) => sirala = value;

  @override
  @action
  void setSearchText(String? value) => searchText = value;

  @override
  @action
  void changeSearchBarStatus() {
    isSearchBarOpen = !isSearchBarOpen;
    if (!isSearchBarOpen) {
      setSearchText(null);
    }
  }

  @override
  @action
  void setObservableList(List<KasaListesiModel>? value) => observableList = value?.asObservable();

  @override
  @action
  Future<void> getData() async {
    final result = await networkManager
        .dioGet<KasaListesiModel>(path: ApiUrls.getKasalar, bodyModel: KasaListesiModel(), queryParameters: {"MenuKodu": "YONE_KASA", "Sirala": sirala, "Bakiye": filtreGroupValue});
    if (result.isSuccess) {
      setObservableList(result.dataList);
    }
  }
}
