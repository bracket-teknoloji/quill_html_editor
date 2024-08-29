import "package:mobx/mobx.dart";
import "package:picker/core/base/model/generic_response_model.dart";
import "package:picker/core/base/view_model/listable_mixin.dart";
import "package:picker/core/base/view_model/mobx_network_mixin.dart";
import "package:picker/core/base/view_model/searchable_mixin.dart";
import "package:picker/core/init/network/login/api_urls.dart";
import "package:picker/view/main_page/alt_sayfalar/finans/banka/banka_hareketleri/model/banka_hareketleri_model.dart";
import "package:picker/view/main_page/alt_sayfalar/finans/hizli_tahsilat_kayitlari/model/hizli_tahsilat_kayitlari_request_model.dart";

part "hizli_tahsilat_kayitlari_view_model.g.dart";

class HizliTahsilatKayitlariViewModel = _HizliTahsilatKayitlariViewModelBase with _$HizliTahsilatKayitlariViewModel;

abstract class _HizliTahsilatKayitlariViewModelBase with Store, MobxNetworkMixin, ListableMixin<BankaHareketleriModel>, SearchableMixin {
  @override
  @observable
  ObservableList<BankaHareketleriModel>? observableList;

  @override
  @observable
  String? searchText;

  @override
  @observable
  bool isSearchBarOpen = false;

  @computed
  ObservableList<BankaHareketleriModel>? get filteredObservableList => observableList
      ?.where(
        (element) =>
            (element.cariAdi?.toLowerCase().contains(searchText?.toLowerCase() ?? "") ?? false) ||
            (element.cariKodu?.toLowerCase().contains(searchText?.toLowerCase() ?? "") ?? false) ||
            (element.belgeNo?.toLowerCase().contains(searchText?.toLowerCase() ?? "") ?? false),
      )
      .toList()
      .asObservable();

  @override
  @action
  void setObservableList(List<BankaHareketleriModel>? list) => observableList = list?.asObservable();

  @override
  @action
  void changeSearchBarStatus() {
    isSearchBarOpen = !isSearchBarOpen;
    if (!isSearchBarOpen) searchText = null;
  }

  @override
  @action
  void setSearchText(String? value) => searchText = value;

  @override
  @action
  Future<void> resetList() async {
    setObservableList(null);
    await getData();
  }

  @observable
  HizliTahsilatKayitlariRequestModel requestModel = HizliTahsilatKayitlariRequestModel(ekranTipi: "L");

  @action
  void setBaslangicTarihi(String value) => requestModel = requestModel.copyWith(baslamaTarihi: value);

  @action
  void setBitisTarihi(String value) => requestModel = requestModel.copyWith(bitisTarihi: value);

  @override
  Future<void> getData() async {
    final result = await networkManager.dioPost(path: ApiUrls.getHizliTahsilatlar, bodyModel: BankaHareketleriModel(), data: requestModel.toJson());
    if (result.isSuccess) {
      setObservableList(result.dataList);
    }
  }

  @action
  Future<GenericResponseModel<BankaHareketleriModel>> deleteHizliTahsilat(int id) async {
    final result = await networkManager.dioPost(path: ApiUrls.deleteHizliTahsilat, showLoading: true, bodyModel: BankaHareketleriModel(), data: {"ID": id});
    return result;
  }
}
