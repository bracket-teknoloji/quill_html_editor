import "package:collection/collection.dart";
import "package:mobx/mobx.dart";

import "../../../../../../core/base/view_model/mobx_network_mixin.dart";
import "../../../../../../core/constants/enum/depo_fark_raporu_filtre_enum.dart";
import "../../../../../../core/init/network/login/api_urls.dart";
import "../../sayim_edit/sayilanlar_listesi/model/sayilan_kalemler_request_model.dart";
import "../../sayim_listesi/model/sayim_listesi_model.dart";

part "depo_fark_raporu_view_model.g.dart";

class DepoFarkRaporuViewModel = _DepoFarkRaporuViewModelBase with _$DepoFarkRaporuViewModel;

abstract class _DepoFarkRaporuViewModelBase with Store, MobxNetworkMixin {
  @observable
  ObservableList<SayimListesiModel>? sayimListesi;

  @observable
  bool searchBar = false;

  @observable
  String searchText = "";

  @observable
  DepoFarkRaporuFiltreEnum filtreTuru = DepoFarkRaporuFiltreEnum.tumu;

  @observable
  SayilanKalemlerRequestModel requestModel = SayilanKalemlerRequestModel();

  @computed
  ObservableList<SayimListesiModel>? get filteredSayimListesi => sayimListesi
      ?.where((element) => element.filtrele(filtreTuru))
      .where(
        (element) => element.stokAdi?.toLowerCase().contains(searchText.toLowerCase()) == true || element.stokKodu?.toLowerCase().contains(searchText.toLowerCase()) == true,
      )
      .toList()
      .asObservable();

  @computed
  double get toplamDepoMiktari => filteredSayimListesi?.map((element) => element.stokBakiye ?? 0).sum ?? 0;

  @computed
  double get toplamSayimMiktari => filteredSayimListesi?.map((element) => element.miktar ?? 0).sum ?? 0;

  @computed
  double get toplamFarkMiktari => filteredSayimListesi?.map((element) => element.depoFark).sum ?? 0;

  @action
  void setSearchBar(bool value) {
    searchBar = value;
    if (!searchBar) {
      setSearchText("");
    }
  }

  @action
  void setFiltreTuru(DepoFarkRaporuFiltreEnum value) => filtreTuru = value;

  @action
  void setSearchText(String? value) => searchText = value ?? "";

  @action
  void setSeriBazindaMi(bool value) => requestModel = requestModel.copyWith(seriBazinda: value ? "E" : "H");

  @action
  void setRequestModel(SayilanKalemlerRequestModel model) => requestModel = model;

  @action
  void setSayimListesi(List<SayimListesiModel>? list) => sayimListesi = list?.asObservable();

  @action
  Future<void> getData() async {
    setSayimListesi(null);
    final result = await networkManager.dioGet(path: ApiUrls.getSayimKalemleri, bodyModel: SayimListesiModel(), queryParameters: requestModel.toJson());
    if (result.isSuccess) {
      setSayimListesi(result.dataList);
    }
  }
}
