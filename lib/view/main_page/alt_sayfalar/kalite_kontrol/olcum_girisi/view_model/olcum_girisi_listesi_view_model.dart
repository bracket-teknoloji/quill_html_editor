import "package:mobx/mobx.dart";
import "package:picker/core/base/view_model/mobx_network_mixin.dart";
import "package:picker/core/constants/enum/edit_tipi_enum.dart";
import "package:picker/core/init/network/login/api_urls.dart";
import "package:picker/view/main_page/alt_sayfalar/kalite_kontrol/olcum_girisi/model/olcum_girisi_listesi_model.dart";
import "package:picker/view/main_page/alt_sayfalar/kalite_kontrol/olcum_girisi/model/olcum_girisi_request_model.dart";

part "olcum_girisi_listesi_view_model.g.dart";

class OlcumGirisiViewModel = _OlcumGirisiViewModelBase with _$OlcumGirisiViewModel;

abstract class _OlcumGirisiViewModelBase with Store, MobxNetworkMixin {
  final List<EditTipiEnum> belgeTipiList = [
    EditTipiEnum.alisIrsaliye,
    EditTipiEnum.satisIrsaliye,
    EditTipiEnum.alisFatura,
    EditTipiEnum.satisFatura,
    EditTipiEnum.isEmri,
    EditTipiEnum.altIsEmri,
    EditTipiEnum.isEmriTakip,
    EditTipiEnum.uretimSonuKaydi,
  ];

  final List<String> durumList = [
    "Tümü",
    "Ölçüm Yapılanlar",
    "Ölçüm Yapılmayanlar",
  ];

  @observable
  bool searchBar = false;

  @observable
  String? searchText;

  @observable
  OlcumGirisiRequestModel requestModel = OlcumGirisiRequestModel();

  @observable
  ObservableList<OlcumGirisiListesiModel>? olcumList;

  @computed
  List<OlcumGirisiListesiModel>? get getList => olcumList?.where((element) => element.belgeNo?.toLowerCase().contains(searchText ?? "") ?? false).toList();

  @action
  void setSearchBar() {
    searchBar = !searchBar;
    if (!searchBar) {
      setSearchText(null);
    }
  }

  @action
  void setBastar(String? value) => requestModel = requestModel.copyWith(bastar: value);

  @action
  void setBittar(String? value) => requestModel = requestModel.copyWith(bittar: value);

  @action
  void setBelgeTipi(String? value) => requestModel = requestModel.copyWith(belgeTipi: value);

  @action
  void setDurum(int? value) => requestModel = requestModel.copyWith(durum: value);

  @action
  void setOlcumList(List<OlcumGirisiListesiModel>? list) => olcumList = list?.asObservable();

  @action
  void setSearchText(String? value) => searchText = value;

  @action
  Future<void> getData() async {
    //TODO sayfalama gelince düzenle
    setOlcumList(null);
    final result = await networkManager.dioPost(path: ApiUrls.getOlcumBelgeler, bodyModel: OlcumGirisiListesiModel(), data: requestModel.toJson());
    if (result.success == true) {
      final List<OlcumGirisiListesiModel> list = (result.data as List).map((e) => e as OlcumGirisiListesiModel).toList();
      setOlcumList(list);
    }
  }
}
