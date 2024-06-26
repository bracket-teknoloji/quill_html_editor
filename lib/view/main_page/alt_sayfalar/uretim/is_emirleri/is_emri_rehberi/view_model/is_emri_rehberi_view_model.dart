import "package:kartal/kartal.dart";
import "package:mobx/mobx.dart";
import "package:picker/core/base/view_model/listable_mixin.dart";
import "package:picker/core/base/view_model/mobx_network_mixin.dart";
import "package:picker/core/base/view_model/scroll_controllable_mixin.dart";
import "package:picker/core/base/view_model/searchable_mixin.dart";
import "package:picker/core/init/network/login/api_urls.dart";
import "package:picker/view/main_page/alt_sayfalar/siparis/siparisler/model/siparisler_request_model.dart";
import "package:picker/view/main_page/alt_sayfalar/uretim/is_emirleri/is_emri_rehberi/model/is_emirleri_model.dart";

part "is_emri_rehberi_view_model.g.dart";

class IsEmriRehberiViewModel = _IsEmriRehberiViewModelBase with _$IsEmriRehberiViewModel;

abstract class _IsEmriRehberiViewModelBase with Store, MobxNetworkMixin, ListableMixin<IsEmirleriModel>, SearchableMixin, ScrollControllableMixin {
  @override
  @observable
  bool isScrollDown = true;

  @override
  @observable
  bool isSearchBarOpen = false;
  @override
  @observable
  String? searchText;

  @observable
  bool dahaVarMi = true;

  @override
  @observable
  ObservableList<IsEmirleriModel>? observableList;

  @observable
  SiparislerRequestModel requestModel = SiparislerRequestModel(
    menuKodu: "URET_ISEM",
    sayfa: 1,
    cariKodu: null,
    ekranTipi: null,
    belgeNo: null,
  );

  @override
  @action
  Future<void> changeSearchBarStatus() async {
    isSearchBarOpen = !isSearchBarOpen;

    if (!isSearchBarOpen) {
      setSearchText(null);
      await resetPage();
    }
  }

  @action
  void setDahaVarMi(bool value) => dahaVarMi = value;

  @override
  @action
  void setSearchText(String? value) => requestModel.searchText = value;

  @action
  void setIsScrollDown(bool value) => isScrollDown = value;

  @override
  @action
  void setObservableList(List<IsEmirleriModel>? list) => observableList = list?.asObservable();

  @action
  void addIsEmirleriList(List<IsEmirleriModel>? list) => observableList = observableList?..addAll(list ?? []);

  @action
  void resetSayfa() => requestModel = requestModel.copyWith(sayfa: 1);
  @action
  void increaseSayfa() => requestModel.sayfa = (requestModel.sayfa ?? 0) + 1;

  @action
  Future<void> resetPage() async {
    setObservableList(null);
    setDahaVarMi(true);
    resetSayfa();
    await getData();
  }

  @override
  @action
  Future<void> getData() async {
    final result = await networkManager.dioGet(path: ApiUrls.getIsEmirleri, bodyModel: IsEmirleriModel(), queryParameters: requestModel.toJson());
    if (result.data is List) {
      setObservableList(result.data.map((e) => e as IsEmirleriModel).toList().cast<IsEmirleriModel>());
    }
    if (result.data is List) {
      final List<IsEmirleriModel> list = result.data.cast<IsEmirleriModel>();
      if ((requestModel.sayfa ?? 0) < 2) {
        // paramData = result.paramData?.map((key, value) => MapEntry(key, double.tryParse((value as String).replaceAll(",", ".")) ?? value)).asObservable();
        if (observableList.ext.isNullOrEmpty) {
          setObservableList(list);
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
