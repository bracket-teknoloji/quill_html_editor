import "dart:ui";

import "package:mobx/mobx.dart";
import "package:picker/core/base/view/yapilandirma_rehberi/model/yapilandirma_rehberi_model.dart";

import "../../../../../view/main_page/alt_sayfalar/stok/stok_liste/model/stok_listesi_model.dart";
import "../../../../init/network/login/api_urls.dart";
import "../../../view_model/base_scrolled_view_model.dart";
import "../model/yapilandirma_profil_model.dart";

part "yapilandirma_rehberi_view_model.g.dart";

class YapilandirmaRehberiViewModel = _YapilandirmaRehberiViewModelBase with _$YapilandirmaRehberiViewModel;

abstract class _YapilandirmaRehberiViewModelBase with Store, BaseScrolledViewModelMixin {
  final List<Color> colors = <Color>[
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
  YapilandirmaProfilModel? get yapilandirmaProfilModel => yapilandirmaProfilList?[page - 1];

  @computed
  Color get color => page > colors.length ? colors[(page % colors.length) - 1] : colors[page - 1];

  @computed
  int? get count => (filteredList?.length ?? 0) + (page != 1 ? 1 : 0);

  @computed
  bool get isLastPage => page == maxPage;

  @computed
  int? get maxPage => yapilandirmaProfilList?.length;

  @computed
  YapilandirmaRehberiModel? get yapilandirmaRehberiModel {
    for (var i = 0; i < (yapilandirmaProfilList?.length ?? 0); i++) {
      if (yapilandirmaList?[i].deger == yapilandirmaProfilModel?.deger) {
        return yapilandirmaList?[i];
      }
    }
    return null;
  }

  @observable
  ObservableList<YapilandirmaRehberiModel>? filteredList;
  @action
  void altKodlariGetir() {
    var list = yapilandirmaList?.where((element) => element.kod == yapilandirmaProfilModel?.ozellikKodu).toList().asObservable();
    List<YapilandirmaRehberiModel> list2 = [];
    list?.forEach((element) {
      if (!list2.any((element2) => element2.degerAciklama == element.degerAciklama)) {
        if (!(yapilandirmaProfilList?.any((element2) => element2.deger == element.deger) ?? true)) {
          list2.add(element);
        }
      }
    });
    filteredList = list2.asObservable();
  }

  @computed
  String get title => yapilandirmaProfilList?[page - 1].aciklama ?? "";

  @action
  void setYapilandirmaRehberiModel(YapilandirmaRehberiModel? value) => yapilandirmaProfilList?[page - 1].deger = value?.deger;
  @action
  void incrementPage() {
    page++;
    altKodlariGetir();
  }

  @action
  void decrementPage() {
    yapilandirmaProfilList?[page - 1].deger = null;
    yapilandirmaProfilList?[page - 2].deger = null;
    page--;
    altKodlariGetir();
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
      altKodlariGetir();
    }
  }
}
