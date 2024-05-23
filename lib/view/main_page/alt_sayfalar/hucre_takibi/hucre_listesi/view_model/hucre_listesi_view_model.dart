import "package:mobx/mobx.dart";
import "package:picker/core/base/view_model/mobx_network_mixin.dart";
import "package:picker/core/init/network/login/api_urls.dart";
import "package:picker/view/main_page/alt_sayfalar/hucre_takibi/hucre_listesi/model/hucre_listesi_model.dart";
import "package:picker/view/main_page/alt_sayfalar/hucre_takibi/hucre_listesi/model/hucre_listesi_request_model.dart";

part "hucre_listesi_view_model.g.dart";

class HucreListesiViewModel = _HucreListesiViewModelBase with _$HucreListesiViewModel;

abstract class _HucreListesiViewModelBase with Store, MobxNetworkMixin {
  @observable
  HucreListesiRequestModel requestModel = HucreListesiRequestModel();

  @observable
  ObservableList<HucreListesiModel>? hucreListesi;

  @observable
  String? searchText;

  @computed
  ObservableList<HucreListesiModel>? get filteredHucreListesi {
    if (hucreListesi == null) return null;
    if (searchText == null) return hucreListesi;
    return hucreListesi!.where((element) => element.hucreKodu?.toLowerCase().contains((searchText ?? "").toLowerCase()) ?? false).toList().asObservable();
  }

  @action
  void setSearchText(String? value) => searchText = value;

  @action
  void setDepoKodu(int? value) => requestModel = requestModel.copyWith(depoKodu: value);

  @action
  void setHucreListesi(List<HucreListesiModel>? list) => hucreListesi = list?.asObservable();

  @action
  Future<void> getData() async {
    setHucreListesi(null);
    final result = await networkManager.dioGet(path: ApiUrls.getHucreListesi, queryParameters: requestModel.toJson(), bodyModel: HucreListesiModel());
    if (result.success == true) {
      final List<HucreListesiModel> list = (result.data as List).map((e) => e as HucreListesiModel).toList();
      setHucreListesi(list);
    }
  }
}
