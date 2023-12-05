import "package:mobx/mobx.dart";
import "package:picker/core/base/view_model/mobx_network_mixin.dart";
import "package:picker/core/init/network/login/api_urls.dart";
import "package:picker/view/main_page/alt_sayfalar/siparis/base_siparis_edit/model/base_siparis_edit_model.dart";
import "package:picker/view/main_page/alt_sayfalar/siparis/siparisler/model/siparisler_request_model.dart";

part "siparis_rehberi_view_model.g.dart";

class SiparisRehberiViewModel = _SiparisRehberiViewModelBase with _$SiparisRehberiViewModel;

abstract class _SiparisRehberiViewModelBase with Store, MobxNetworkMixin {
  @observable
  ObservableList<BaseSiparisEditModel>? siparisList;

  @observable
  ObservableList<BaseSiparisEditModel> selectedSiparisList = <BaseSiparisEditModel>[].asObservable();

  @observable
  SiparislerRequestModel requestModel = SiparislerRequestModel(sayfa: 1, iadeMi: false);

  @action
  void setRequestModel(BaseSiparisEditModel model) {
    requestModel = requestModel.copyWith(
      cariKodu: model.cariKodu ?? "",
      projeKodu: model.projeKodu,
      belgeNo: model.belgeNo,
      miktarGetir: "E",
      siparisKarsilanmaDurumu: "K",
      kapaliBelgelerListelenmesin: false,
      pickerBelgeTuru: "MS",
      siralama: "TESLIM_TARIHI_AZ",
      refBelgeTuru: model.pickerBelgeTuru,
    );
  }

  @action
  void setBaslangicTarihi(String? value) => requestModel = requestModel.copyWith(baslamaTarihi: value);

  @action
  void setBitisTarihi(String? value) => requestModel = requestModel.copyWith(bitisTarihi: value);

  @action
  void setSiparisList(List<BaseSiparisEditModel>? value) => siparisList = value?.asObservable();

  @action
  void incrementPage() => requestModel = requestModel.copyWith(sayfa: requestModel.sayfa! + 1);

  @action
  void addSelectedSiparis(BaseSiparisEditModel value) => selectedSiparisList.add(value);

  @action
  void removeSelectedSiparis(BaseSiparisEditModel value) => selectedSiparisList.removeWhere((element) => element.belgeNo == value.belgeNo);

  @action
  Future<void> resetPage() async {
    requestModel = requestModel.copyWith(sayfa: 1);
    siparisList = null;
    await getData();
  }

  @action
  Future<void> getData() async {
    final result = await networkManager.dioGet(path: ApiUrls.getFaturalar, bodyModel: BaseSiparisEditModel(), queryParameters: requestModel.toJson());
    if (result.data != null) {
      final List<BaseSiparisEditModel> list = result.data.map((e) => e as BaseSiparisEditModel).toList().cast<BaseSiparisEditModel>();
      if (siparisList == null) {
        setSiparisList(list);
      }
    }
  }
}
