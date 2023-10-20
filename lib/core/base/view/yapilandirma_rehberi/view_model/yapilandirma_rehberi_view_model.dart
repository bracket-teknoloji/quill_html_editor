import "dart:ui";

import "package:kartal/kartal.dart";
import "package:mobx/mobx.dart";

import "../../../../../view/main_page/alt_sayfalar/stok/stok_liste/model/stok_listesi_model.dart";
import "../../../../init/network/login/api_urls.dart";
import "../../../model/base_network_mixin.dart";
import "../../../model/generic_response_model.dart";
import "../../../view_model/mobx_network_mixin.dart";
import "../model/yapilandirma_profil_model.dart";
import "../model/yapilandirma_rehberi_model.dart";

part "yapilandirma_rehberi_view_model.g.dart";

class YapilandirmaRehberiViewModel = _YapilandirmaRehberiViewModelBase with _$YapilandirmaRehberiViewModel;

abstract class _YapilandirmaRehberiViewModelBase with Store, MobxNetworkMixin {
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
  ObservableList<YapilandirmaProfilModel?>? yapilandirmaProfilList;

  @computed
  YapilandirmaProfilModel? get yapilandirmaProfilModel => yapilandirmaProfilList?[page - 1];

  @computed
  Color get color => page > colors.length ? colors[(page % colors.length) - 1] : colors[page - 1];

  @computed
  int? get count => (filteredList?.length ?? 0) + (page != 1 ? 1 : 0);

  @computed
  bool get isLastPage => page == maxPage;

  @observable
  int? maxPage;

  @action
  void setMaxPage(int? value) => maxPage = value;

  @computed
  YapilandirmaRehberiModel? get yapilandirmaRehberiModel => yapilandirmaList?[page - 1];

  List<List<YapilandirmaRehberiModel>> denemeList = <List<YapilandirmaRehberiModel>>[];

  @observable
  ObservableList<YapilandirmaRehberiModel>? filteredList;

  @observable
  ObservableList<YapilandirmaRehberiModel>? filteredList2;
  @action
  Future<void> altKodlariGetir() async {
    final List<YapilandirmaRehberiModel> list = denemeList[page - 1];
    final List<YapilandirmaRehberiModel> list2 = <YapilandirmaRehberiModel>[];
    for (YapilandirmaRehberiModel item in list) {
      if (item.kod != yapilandirmaProfilModel?.ozellikKodu) {
        continue;
      }
      if (yapilandirmaProfilList?.every((YapilandirmaProfilModel? element) => element?.deger?.any((YapilandirmaRehberiModel? element) => element?.yapkod == item.yapkod) ?? true) ?? false) {
        if (!list2.any((YapilandirmaRehberiModel element) => element.degerAciklama == item.degerAciklama)) {
          list2.add(item);
        }
      }
      // if (page == 1) {
      //   if (!list2.any((element) => element.degerAciklama == item.degerAciklama)) {
      //     list2.add(item);
      //   }
      // } else if (page > 1) {
      //    if (yapilandirmaProfilList?.every((element) => element?.deger?.any((element) => element?.yapkod == item.yapkod) ?? true) ?? false) {
      //   if (!list2.any((element) => element.degerAciklama == item.degerAciklama)) {
      //     list2.add(item);
      //   }
      // }
      // }
      filteredList = list2.asObservable();
      filteredList2 = list2.asObservable();
    }
  }

  @computed
  String get title => yapilandirmaProfilList?[page - 1]?.aciklama ?? "";

  @action
  void setYapilandirmaRehberiModel(YapilandirmaRehberiModel? value) {
    // altKodlariGetir();
    yapilandirmaProfilList?[page - 1]?.deger = yapilandirmaList?.where((YapilandirmaRehberiModel element) => element.ozellikSira == value?.ozellikSira && element.deger == value?.deger).toList();
  }

  // yapilandirmaProfilList?[page - 1]?.copyWith(deger: yapilandirmaList?.where((element) => element.degerAciklama == value?.degerAciklama && element.deger == value?.deger).toList());
  @action
  Future<void> incrementPage() async {
    resetFilteredList();
    await Future.delayed(const Duration(milliseconds: 50));
    // yapilandirmaProfilList?[page - 1] = yapilandirmaProfilList?[page - 1]
    //     ?.copyWith(deger: [...yapilandirmaProfilList?[page - 1]?.deger ?? [], ...yapilandirmaList?.where((element) => element.kod == yapilandirmaProfilList?[page - 1]?.ozellikKodu).toList() ?? []]);
    page++;
    await altKodlariGetir();
  }

  @action
  Future<void> decrementPage() async {
    yapilandirmaProfilList?[page - 1]?.deger = null;
    yapilandirmaProfilList?[page - 2]?.deger = null;
    page--;
    await altKodlariGetir();
  }

  @action
  void resetFilteredList() {
    filteredList = null;
  }

  @action
  void setStokListesiModel(StokListesiModel? value) => stokListesiModel = value;

  @action
  Future<void> getData() async {
    final GenericResponseModel<NetworkManagerMixin> yapilandirmaListesi = await networkManager
        .dioGet<YapilandirmaProfilModel>(path: ApiUrls.getYapilandirmaProfili, bodyModel: YapilandirmaProfilModel(), queryParameters: <String, dynamic>{"stokKodu": stokListesiModel?.stokKodu});
    if (yapilandirmaListesi.data != null && yapilandirmaListesi.data is List) {
      final ObservableList<YapilandirmaProfilModel> list = <YapilandirmaProfilModel>[].asObservable();
      list.addAll(yapilandirmaListesi.data.whereType<YapilandirmaProfilModel>().toList());
      yapilandirmaProfilList = list;
    }
    final GenericResponseModel<NetworkManagerMixin> result = await networkManager
        .dioGet<YapilandirmaRehberiModel>(path: ApiUrls.getYapilandirmaListesi, bodyModel: YapilandirmaRehberiModel(), queryParameters: <String, dynamic>{"stokKodu": stokListesiModel?.stokKodu});
    if (result.data != null && result.data is List) {
      final ObservableList<YapilandirmaRehberiModel> list = <YapilandirmaRehberiModel>[].asObservable();
      list.addAll(result.data.whereType<YapilandirmaRehberiModel>().toList());
      yapilandirmaList = list;

      for (int i = 0; i < (yapilandirmaProfilList?.length ?? 0); i++) {
        if (yapilandirmaList?.where((YapilandirmaRehberiModel element) => element.kod == yapilandirmaProfilList?[i]?.ozellikKodu).toList() != null) {
          denemeList.add(yapilandirmaList!.where((YapilandirmaRehberiModel element) => element.kod == yapilandirmaProfilList?[i]?.ozellikKodu).toList());
        }
      }
      if (denemeList.ext.isNotNullOrEmpty) {
        await altKodlariGetir();
      }
    }
  }
}
