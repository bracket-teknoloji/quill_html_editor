import "package:mobx/mobx.dart";
import "package:picker/core/base/view/seri_islemleri/seri_hareketleri/model/seri_hareketleri_model.dart";
import "package:picker/core/base/view/seri_islemleri/seri_hareketleri/model/seri_hareketleri_request_model.dart";
import "package:picker/core/base/view_model/mobx_network_mixin.dart";
import "package:picker/core/init/network/login/api_urls.dart";

part "seri_hareketleri_view_model.g.dart";

class SeriHareketleriViewModel = _SeriHareketleriViewModelBase with _$SeriHareketleriViewModel;

abstract class _SeriHareketleriViewModelBase with Store, MobxNetworkMixin {
  @observable
  bool isSearchBarOpened = false;

  @observable
  SeriHareketleriRequestModel requestModel = SeriHareketleriRequestModel(sirala: "TARIH_ZA");

  @observable
  ObservableList<SeriHareketleriModel>? seriHareketleriList;

  @action
  void changeIsSearchBarOpened() => isSearchBarOpened = !isSearchBarOpened;

  @action
  void setSirala(String sirala) => requestModel = requestModel.copyWith(sirala: sirala);

  @action
  void setStokKodu(String stokKodu) => requestModel = requestModel.copyWith(stokKodu: stokKodu);

  @action
  Future<void> getData() async {
    final result = await networkManager.dioPost(path: ApiUrls.getSeriHareketleri, bodyModel: SeriHareketleriModel(), data: requestModel.toJson());
    if (result.data is List) {
      final List<SeriHareketleriModel> list = result.data.map((e) => e as SeriHareketleriModel).toList().cast<SeriHareketleriModel>();
      seriHareketleriList = list.asObservable();
    }
  }
}
