import "package:kartal/kartal.dart";
import "package:mobx/mobx.dart";

import "../../../../../../view/main_page/alt_sayfalar/stok/stok_liste/model/stok_listesi_model.dart";
import "../../../../../init/network/login/api_urls.dart";
import "../../../../view_model/mobx_network_mixin.dart";
import "../model/seri_hareketleri_model.dart";
import "../model/seri_hareketleri_request_model.dart";

part "seri_hareketleri_view_model.g.dart";

class SeriHareketleriViewModel = _SeriHareketleriViewModelBase with _$SeriHareketleriViewModel;

abstract class _SeriHareketleriViewModelBase with Store, MobxNetworkMixin {
  final Map<String, String> siralaMap = {
    "Tarih (A-Z)": "TARIH_AZ",
    "Tarih (Z-A)": "TARIH_ZA",
  };
  @observable
  bool isSearchBarOpened = false;

  @observable
  ObservableList<bool> selectedActionType = [true, false].asObservable();

  @observable
  String searchQuery = "";

  @observable
  StokListesiModel? stokListesiModel;

  @observable
  SeriHareketleriRequestModel requestModel = SeriHareketleriRequestModel(sirala: "TARIH_ZA");

  @observable
  ObservableList<SeriHareketleriModel>? seriHareketleriList;

  @computed
  ObservableList<SeriHareketleriModel>? get filteredList {
    if (searchQuery.isEmpty) return seriHareketleriList;
    return seriHareketleriList
        ?.where(
          (element) => searchQuery == "" ? true : element.seriNo?.toLowerCase().contains(searchQuery.toLowerCase()) ?? false,
        )
        .toList()
        .asObservable();
  }

  @action
  void setSearchQuery(String query) => searchQuery = query;

  @action
  void onActionTypeChanged(int? index) => selectedActionType = selectedActionType.mapIndexed((index2, e) => index == index2 ? true : false).toList().asObservable();

  @action
  void setIsSearchBarOpened() => isSearchBarOpened = !isSearchBarOpened;

  @action
  void setStokListesiModel(StokListesiModel model) => stokListesiModel = model;

  @action
  void setSirala(String sirala) => requestModel = requestModel.copyWith(sirala: sirala);

  @action
  void setStokKodu(String? stokKodu) => requestModel = requestModel.copyWith(stokKodu: stokKodu);

  @action
  void setSeriNo(String? seriNo) => requestModel = requestModel.copyWith(seriNo: seriNo);

  @action
  void setSerihareketleriList(List<SeriHareketleriModel>? list) => seriHareketleriList = list?.asObservable();

  @action
  Future<void> getData() async {
    setSerihareketleriList(null);
    final result = await networkManager.dioPost(path: ApiUrls.getSeriHareketleri, bodyModel: SeriHareketleriModel(), data: requestModel.toJson());
    if (result.data is List) {
      final List<SeriHareketleriModel> list = result.data.map((e) => e as SeriHareketleriModel).toList().cast<SeriHareketleriModel>();
      setSerihareketleriList(list);
    }
  }

  @action
  Future<bool> deleteSeriHareket(SeriHareketleriModel? model) async {
    final result = await networkManager.dioPost(path: ApiUrls.deleteSeriHareketi, bodyModel: SeriHareketleriModel(), showLoading: true, data: model?.toJson());

    return result.success ?? false;
  }
}
