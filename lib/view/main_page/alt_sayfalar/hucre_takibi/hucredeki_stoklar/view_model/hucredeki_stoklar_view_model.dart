import "package:mobx/mobx.dart";
import "package:picker/core/base/view_model/mobx_network_mixin.dart";
import "package:picker/core/init/network/login/api_urls.dart";
import "package:picker/view/main_page/alt_sayfalar/hucre_takibi/hucre_listesi/model/hucre_listesi_request_model.dart";
import "package:picker/view/main_page/alt_sayfalar/hucre_takibi/hucredeki_stoklar/model/hucredeki_stoklar_model.dart";

part "hucredeki_stoklar_view_model.g.dart";

class HucredekiStoklarViewModel = _HucredekiStoklarViewModelBase with _$HucredekiStoklarViewModel;

abstract class _HucredekiStoklarViewModelBase with Store, MobxNetworkMixin {
  @observable
  ObservableList<HucredekiStoklarModel>? stoklarListesi;

  @observable
  HucreListesiRequestModel? requestModel;

  @observable
  String searchText = "";

  @computed
  List<HucredekiStoklarModel>? get filteredStoklarListesi =>
      stoklarListesi?.where((e) => <String?>[e.stokKodu, e.stokAdi].map((e) => e?.toLowerCase() ?? false).any((element) => (element as String?)?.contains(searchText.toLowerCase()) ?? false)).toList();

  @action
  void setSearchText(String value) => searchText = value;

  @action
  void setRequestModel(HucreListesiRequestModel model) => requestModel = model;

  @action
  void setStoklarListesi(List<HucredekiStoklarModel>? list) => stoklarListesi = list?.asObservable();

  @action
  Future<void> getData() async {
    setStoklarListesi(null);
    final result = await networkManager.dioGet(
      path: ApiUrls.getHucredekiStoklar,
      bodyModel: HucredekiStoklarModel(),
      queryParameters: requestModel?.toJson(),
    );
    if (result.success == true) {
      final list = (result.data as List).map((e) => e as HucredekiStoklarModel).toList();
      setStoklarListesi(list);
    }
  }
}
