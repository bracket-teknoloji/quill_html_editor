import "package:kartal/kartal.dart";
import "package:mobx/mobx.dart";
import "package:picker/core/base/view/masraf_kodu/model/masraf_kodu_rehberi_model.dart";
import "package:picker/core/base/view_model/mobx_network_mixin.dart";
import "package:picker/core/init/network/login/api_urls.dart";
import "package:picker/view/main_page/alt_sayfalar/siparis/siparisler/model/siparis_edit_request_model.dart";

part "masraf_kodu_rehberi_view_model.g.dart";

class MasrafKoduRehberiViewModel = _MasrafKoduRehberiViewModelBase with _$MasrafKoduRehberiViewModel;

abstract class _MasrafKoduRehberiViewModelBase with Store, MobxNetworkMixin {
  @observable
  ObservableList<MasrafKoduRehberiModel>? masrafKoduRehberiList;

  @observable
  SiparisEditRequestModel requestModel = SiparisEditRequestModel(sayfa: 1);

  @observable
  bool dahaVarMi = true;

  @observable
  bool searchBar = true;

  @action
  void changeSearchBar() {
    searchBar = !searchBar;
    if (!searchBar) {
      setSearchText(null);
    }
    resetPage();
  }

  @action
  void setSearchText(String? value) => requestModel = requestModel.copyWith(searchText: value);

  @action
  void setDahaVarMi(bool value) => dahaVarMi = value;

  @action
  void setMasrafKoduRehberiList(List<MasrafKoduRehberiModel>? value) => masrafKoduRehberiList = value?.asObservable();

  @action
  void addMasrafKoduRehberiList(List<MasrafKoduRehberiModel> value) => masrafKoduRehberiList!.addAll(value);

  @action
  void increaseSayfa() => requestModel = requestModel.copyWith(sayfa: (requestModel.sayfa ?? 0) + 1);

  @action
  void resetSayfa() => requestModel = requestModel.copyWith(sayfa: 1);

  @action
  Future<void> resetPage() async {
    setMasrafKoduRehberiList(null);
    setDahaVarMi(true);
    resetSayfa();
    await getData();
  }

  @action
  Future<void> getData() async {
    final result = await networkManager.dioGet(path: ApiUrls.getMasrafKodlari, bodyModel: MasrafKoduRehberiModel(), queryParameters: requestModel.toJson());
    if (result.data is List) {
      final List<MasrafKoduRehberiModel> list = result.data.cast<MasrafKoduRehberiModel>();
      if ((requestModel.sayfa ?? 0) < 2) {
        // paramData = result.paramData?.map((key, value) => MapEntry(key, double.tryParse((value as String).replaceAll(",", ".")) ?? value)).asObservable();
        if (masrafKoduRehberiList.ext.isNullOrEmpty) {
          setMasrafKoduRehberiList(list);
        } else {
          addMasrafKoduRehberiList(list);
        }
      } else {
        addMasrafKoduRehberiList(list);
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
