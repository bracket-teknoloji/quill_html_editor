import "package:mobx/mobx.dart";
import "package:picker/core/base/model/base_network_mixin.dart";
import "package:picker/core/base/model/generic_response_model.dart";
import "package:picker/core/base/view_model/mobx_network_mixin.dart";
import "package:picker/core/constants/enum/paket_islemler_enum.dart";
import "package:picker/core/init/network/login/api_urls.dart";
import "package:picker/view/main_page/alt_sayfalar/stok/paketleme/paketleme_listesi/model/paketleme_edit_request_model.dart";
import "package:picker/view/main_page/alt_sayfalar/stok/paketleme/paketleme_listesi/model/paketleme_listesi_model.dart";
import "package:picker/view/main_page/alt_sayfalar/stok/paketleme/paketleme_listesi/model/paketleme_listesi_request_model.dart";

part "paketleme_listesi_view_model.g.dart";

class PaketlemeListesiViewModel = _PaketlemeListesiViewModelBase with _$PaketlemeListesiViewModel;

abstract class _PaketlemeListesiViewModelBase with Store, MobxNetworkMixin {
  @observable
  ObservableList<PaketlemeListesiModel>? paketlemeListesi;

  @observable
  String searchText = "";
  @observable
  bool searchBar = false;

  @observable
  PaketlemeListesiRequestModel requestModel = PaketlemeListesiRequestModel(menuKodu: "STOK_PKET");

  @computed
  List<PaketlemeListesiModel>? get filteredPaketlemeListesi => paketlemeListesi?.where((element) => element.kodu?.toLowerCase().contains(searchText.toLowerCase()) ?? false).toList();

  @action
  void setPaketlemeListesi(List<PaketlemeListesiModel>? value) => paketlemeListesi = value?.asObservable();

  @action
  void setSearchText(String value) => searchText = value;

  @action
  void setSearchBar() {
    searchBar = !searchBar;
    if (!searchBar) {
      setSearchText("");
    }
  }

  @action
  Future<void> getData() async {
    setPaketlemeListesi(null);
    final result = await networkManager.dioPost(path: ApiUrls.getPaketler, bodyModel: PaketlemeListesiModel(), data: requestModel.toJson());
    if (result.success == true) {
      final List<PaketlemeListesiModel> paketlemeListesi = (result.data as List).map((e) => e as PaketlemeListesiModel).toList();
      setPaketlemeListesi(paketlemeListesi);
    }
  }

  @action
  Future<GenericResponseModel<NetworkManagerMixin>> deleteItem(int? paketID) async {
    final result = await networkManager.dioPost(
      path: ApiUrls.savePaket,
      bodyModel: PaketlemeListesiModel(),
      showLoading: true,
      data: PaketlemeEditRequestModel(islemKodu: PaketIslemlerEnum.sil.islemKodu, paketId: paketID).toJson(),
    );
    return result;
  }
}
