import "dart:ui";

import "package:kartal/kartal.dart";
import "package:mobx/mobx.dart";
import "package:picker/core/base/view/yapilandirma_rehberi/model/yapilandirma_rehberi_model.dart";

import "../../../../../view/main_page/alt_sayfalar/stok/stok_liste/model/stok_listesi_model.dart";
import "../../../../init/network/login/api_urls.dart";
import "../../../view_model/base_scrolled_view_model.dart";
import "../model/yapilandirma_profil_model.dart";

part "yapilandirma_rehberi_view_model.g.dart";

class YapilandirmaRehberiViewModel = _YapilandirmaRehberiViewModelBase with _$YapilandirmaRehberiViewModel;

abstract class _YapilandirmaRehberiViewModelBase with Store, BaseScrolledViewModelMixin {
  List colors = [
    const Color.fromRGBO(84, 141, 212, 1),
    const Color.fromRGBO(849, 93, 21, 1),
    const Color.fromRGBO(203, 82, 17, 1),
    const Color.fromRGBO(150, 1, 106, 1),
    const Color.fromRGBO(65, 61, 61, 1)
  ];
  @observable
  int page = 1;

  @observable
  StokListesiModel? stokListesiModel;

  @observable
  ObservableList<YapilandirmaRehberiModel>? yapilandirmaList;

  @observable
  ObservableList<YapilandirmaProfilModel>? yapilandirmaProfilList;

  @computed
  int? get count => (filteredList?.length ?? 0) + (page != 1 ? 1 : 0);

  @computed
  bool get isLastPage => page == maxPage;

  @computed
  int? get maxPage {
    var list = yapilandirmaList?.map((e) => e.ozellikSira).toList();
    if (list.ext.isNotNullOrEmpty) {
      return list?.isNotEmpty == true ? list?.reduce((value, element) => value! > element! ? value : element) : 1;
    }
    return null;
  }

  @observable
  ObservableList<YapilandirmaRehberiModel>? filteredList;
  @action
  void filterList() {
    var list = yapilandirmaList?.where((element) => element.ozellikSira == page).toList().asObservable();
    List<YapilandirmaRehberiModel> list2 = [];
    list?.forEach((element) {
      if (!list2.any((element2) => element2.degerAciklama == element.degerAciklama)) {
        list2.add(element);
      }
    });
    filteredList = list2.asObservable();
  }

  @computed
  String get title => yapilandirmaProfilList?[page - 1].aciklama ?? "";
  @action
  void incrementPage() {
    page++;
    filterList();
  }

  @action
  void decrementPage() {
    page--;
    filterList();
  }

  @action
  void resetFilteredList() {
    filteredList = null;
  }

  @action
  void setStokListesiModel(StokListesiModel? value) => stokListesiModel = value;

  @action
  Future<void> getData() async {
    var yapilandirmaListesi =
        await networkManager.dioGet<YapilandirmaProfilModel>(path: ApiUrls.getYapilandirmaProfili, bodyModel: YapilandirmaProfilModel(), queryParameters: {"stokKodu": stokListesiModel?.stokKodu});
    if (yapilandirmaListesi.data != null && yapilandirmaListesi.data is List) {
      ObservableList<YapilandirmaProfilModel> list = <YapilandirmaProfilModel>[].asObservable();
      list.addAll(yapilandirmaListesi.data.whereType<YapilandirmaProfilModel>().toList());
      yapilandirmaProfilList = list;
    }
    var result =
        await networkManager.dioGet<YapilandirmaRehberiModel>(path: ApiUrls.getYapilandirmaListesi, bodyModel: YapilandirmaRehberiModel(), queryParameters: {"stokKodu": stokListesiModel?.stokKodu});
    if (result.data != null && result.data is List) {
      ObservableList<YapilandirmaRehberiModel> list = <YapilandirmaRehberiModel>[].asObservable();
      list.addAll(result.data.whereType<YapilandirmaRehberiModel>().toList());
      yapilandirmaList = list;
      filterList();
    }
  }
}
