import "package:kartal/kartal.dart";
import "package:mobx/mobx.dart";
import "package:picker/core/base/view_model/mobx_network_mixin.dart";
import "package:picker/core/init/network/login/api_urls.dart";
import "package:picker/view/main_page/alt_sayfalar/siparis/siparisler/model/siparisler_request_model.dart";
import "package:picker/view/main_page/alt_sayfalar/uretim/is_emirleri/is_emri_rehberi/model/is_emirleri_model.dart";

part "is_emri_rehberi_view_model.g.dart";

class IsEmriRehberiViewModel = _IsEmriRehberiViewModelBase with _$IsEmriRehberiViewModel;

abstract class _IsEmriRehberiViewModelBase with Store, MobxNetworkMixin {
  @observable
  bool isScrollDown = true;

  @observable
  bool searchBar = false;

  @observable
  bool dahaVarMi = true;

  @observable
  ObservableList<IsEmirleriModel>? isEmriList;

  @observable
  SiparislerRequestModel requestModel = SiparislerRequestModel(menuKodu: "URET_ISEM", sayfa: 1);

  @action
  Future<void> changeSearchBar() async {
    searchBar = !searchBar;

    if (!searchBar) {
      setSearchText(null);
      await resetPage();
    }
  }

  @action
  void setDahaVarMi(bool value) => dahaVarMi = value;

  @action
  void setSearchText(String? value) => requestModel.searchText = value;

  @action
  void setIsScrollDown(bool value) => isScrollDown = value;

  @action
  void setIsEmirleriList(List<IsEmirleriModel>? list) => isEmriList = list?.asObservable();

  @action
  void addIsEmirleriList(List<IsEmirleriModel>? list) => isEmriList = isEmriList?..addAll(list ?? []);

  @action
  void resetSayfa() => requestModel = requestModel.copyWith(sayfa: 1);
  @action
  void increaseSayfa() => requestModel.sayfa = (requestModel.sayfa ?? 0) + 1;

  @action
  Future<void> resetPage() async {
    setIsEmirleriList(null);
    setDahaVarMi(true);
    resetSayfa();
    await getData();
  }

  @action
  Future<void> getData() async {
    final result = await networkManager.dioPost(path: ApiUrls.getIsEmirleri, bodyModel: IsEmirleriModel(), queryParameters: requestModel.toJson());
    if (result.data is List) {
      setIsEmirleriList(result.data.map((e) => e as IsEmirleriModel).toList().cast<IsEmirleriModel>());
    }
    if (result.data is List) {
      final List<IsEmirleriModel> list = result.data.cast<IsEmirleriModel>();
      if ((requestModel.sayfa ?? 0) < 2) {
        // paramData = result.paramData?.map((key, value) => MapEntry(key, double.tryParse((value as String).replaceAll(",", ".")) ?? value)).asObservable();
        if (isEmriList.ext.isNullOrEmpty) {
          setIsEmirleriList(list);
        } else {
          addIsEmirleriList(list);
        }
      } else {
        addIsEmirleriList(list);
      }
      if (list.length < parametreModel.sabitSayfalamaOgeSayisi) {
        setDahaVarMi(false);
      } else {
        setDahaVarMi(true);
        increaseSayfa();
      }
    }
  }
}
