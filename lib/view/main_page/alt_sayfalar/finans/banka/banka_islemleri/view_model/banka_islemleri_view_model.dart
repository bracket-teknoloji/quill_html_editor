import "package:mobx/mobx.dart";
import "package:picker/core/base/model/base_network_mixin.dart";
import "package:picker/core/base/model/generic_response_model.dart";

import "../../../../../../../core/base/view_model/mobx_network_mixin.dart";
import "../../../../../../../core/constants/extensions/date_time_extensions.dart";
import "../../../../../../../core/init/network/login/api_urls.dart";
import "../model/banka_islemleri_model.dart";
import "../model/banka_islemleri_request_model.dart";

part "banka_islemleri_view_model.g.dart";

class BankaIslemleriViewModel = _BankaIslemleriViewModelBase with _$BankaIslemleriViewModel;

abstract class _BankaIslemleriViewModelBase with Store, MobxNetworkMixin {
  //* Observables
  @observable
  BankaIslemleriRequestModel bankaIslemleriRequestModel = BankaIslemleriRequestModel(menuKodu: "YONE_BISL", baslamaTarihi: DateTime.now().toDateString, bitisTarihi: DateTime.now().toDateString);

  @observable
  bool isScrollDown = true;
  @observable
  bool searchBar = false;

  @observable
  ObservableList<BankaIslemleriModel>? bankaIslemleriListesi;

  @observable
  String? searchText;

  //* Computed

  @computed
  double get gelenTutar => bankaIslemleriListesi?.where((BankaIslemleriModel element) => element.ba == "B").map((BankaIslemleriModel e) => e.tutar ?? 0).fold(0, (double? previousValue, double element) => (previousValue ?? 0) + element) ?? 0;

  @computed
  double get gidenTutar => bankaIslemleriListesi?.where((BankaIslemleriModel element) => element.ba == "A").map((BankaIslemleriModel e) => e.tutar ?? 0).fold(0, (double? previousValue, double element) => (previousValue ?? 0) + element) ?? 0;

  @computed
  ObservableList<BankaIslemleriModel>? get getBankaIslemleriListesi => (searchText != null && searchText != "")
      ? bankaIslemleriListesi?.where((BankaIslemleriModel element) => element.belgeno != null && element.belgeno!.toLowerCase().contains(searchText!.toLowerCase())).toList().asObservable()
      : bankaIslemleriListesi;

  //* Actions
  @action
  void setIsScrollDown(bool value) => isScrollDown = value;

  @action
  void changeSearchBar() {
    searchBar = !searchBar;
    searchText = null;
  }

  @action
  void setSearchText(String? value) => searchText = value;
  @action
  void setBaslamaTarihi(String? value) => bankaIslemleriRequestModel = bankaIslemleriRequestModel.copyWith(baslamaTarihi: value);

  @action
  void setBitisTarihi(String? value) => bankaIslemleriRequestModel = bankaIslemleriRequestModel.copyWith(bitisTarihi: value);

  @action
  void setBankaIslemleriListesi(List<BankaIslemleriModel>? value) => bankaIslemleriListesi = value?.asObservable();

  @action
  void addBankaIslemleriListesi(List<BankaIslemleriModel>? value) => bankaIslemleriListesi?.addAll(value ?? <BankaIslemleriModel>[]);

  @action
  void clearFilters() {
    bankaIslemleriRequestModel = bankaIslemleriRequestModel.copyWith(hesapKodu: null, hesapTipi: null);
  }

  @action
  Future<void> resetPage() async {
    bankaIslemleriListesi = null;
    await getData();
  }

  @action
  Future<void> getData() async {
    final GenericResponseModel<NetworkManagerMixin> result = await networkManager.dioGet<BankaIslemleriModel>(path: ApiUrls.getBankaHareketleri, bodyModel: BankaIslemleriModel(), queryParameters: bankaIslemleriRequestModel.toJson());
    if (result.data is List) {
      final List<BankaIslemleriModel> list = result.data.cast<BankaIslemleriModel>();
      setBankaIslemleriListesi(list);
    }
  }
}
