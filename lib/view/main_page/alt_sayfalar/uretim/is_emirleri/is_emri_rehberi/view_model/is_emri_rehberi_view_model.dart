import "package:mobx/mobx.dart";
import "package:picker/core/base/view_model/mobx_network_mixin.dart";
import "package:picker/core/init/network/login/api_urls.dart";
import "package:picker/view/main_page/alt_sayfalar/cari/cari_listesi/model/cari_request_model.dart";
import "package:picker/view/main_page/alt_sayfalar/uretim/is_emirleri/is_emri_rehberi/model/is_emirleri_model.dart";

part "is_emri_rehberi_view_model.g.dart";

class IsEmriRehberiViewModel = _IsEmriRehberiViewModelBase with _$IsEmriRehberiViewModel;

abstract class _IsEmriRehberiViewModelBase with Store, MobxNetworkMixin {
  @observable
  bool isScrollDown = true;

  @observable
  bool searchBar = false;

  @observable
  ObservableList<IsEmirleriModel>? isEmriList;

  @observable
  CariRequestModel requestModel = CariRequestModel(menuKodu: "URET_ISEM", sayfa: 1);

  @action
  void changeSearchBar() => searchBar = !searchBar;

  @action
  void setIsScrollDown(bool value) => isScrollDown = value;

  @action
  void setIsEmirleriList(List<IsEmirleriModel>? list) => isEmriList = list?.asObservable();

  @action
  void increaseSayfa() => requestModel.sayfa = (requestModel.sayfa ?? 0) + 1;

  @action
  Future<void> getData() async {
    final result = await networkManager.dioPost(path: ApiUrls.getIsEmirleri, bodyModel: IsEmirleriModel(), data: requestModel.toJson());
    if (result.data is List) {
      setIsEmirleriList(result.data.map((e) => e as IsEmirleriModel).toList().cast<IsEmirleriModel>());
    }
  }
}
