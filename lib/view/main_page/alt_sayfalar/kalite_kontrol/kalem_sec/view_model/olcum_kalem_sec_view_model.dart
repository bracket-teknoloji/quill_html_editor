import "package:kartal/kartal.dart";
import "package:mobx/mobx.dart";
import "package:picker/core/base/view_model/mobx_network_mixin.dart";
import "package:picker/core/init/network/login/api_urls.dart";
import "package:picker/view/main_page/alt_sayfalar/kalite_kontrol/olcum_belge_edit/model/olcum_belge_edit_model.dart";

part "olcum_kalem_sec_view_model.g.dart";

class OlcumKalemSecViewModel = _OlcumKalemSecViewModelBase with _$OlcumKalemSecViewModel;

abstract class _OlcumKalemSecViewModelBase with Store, MobxNetworkMixin {
  @observable
  ObservableList<OlcumBelgeModel>? olcumGirisiListesi;

  @observable
  OlcumBelgeModel? requestModel;

  @observable
  bool searchBar = false;


  @observable
  bool dahaVarMi = true;

  @action
  void setSearchBar() {
    searchBar = !searchBar;
    if (!searchBar) {
      setOlcumBelgeModel(null);
      setSearchText(null);
      getData();
    }
  }

  @action
  void setDahaVarMi(bool value) => dahaVarMi = value;

  @action
  void setRequestModel(OlcumBelgeModel model) => requestModel = model.copyWith(sayfa: 1);

  @action
  void setOlcumBelgeModel(List<OlcumBelgeModel>? list) => olcumGirisiListesi = list?.asObservable();


  @action
  void addOlcumBelgeModel(List<OlcumBelgeModel> list) => olcumGirisiListesi!.addAll(list);


  @action
  void setSearchText(String? value) => requestModel = requestModel?.copyWith(searchText: value);


  @action
  void increaseSayfa() => requestModel = requestModel?.copyWith(sayfa: (requestModel?.sayfa ?? 0) + 1);

  @action
  void resetSayfa() {
    requestModel = requestModel?.copyWith(sayfa: 1);
    setOlcumBelgeModel(null);
    setDahaVarMi(true);
    getData();
  }


  @action
  Future<void> getData() async {
    final result = await networkManager.dioGet(path: ApiUrls.getOlcumBelgeStok, bodyModel: OlcumBelgeModel(), data: requestModel?.forKalemSec);
    // if (result.success == true) {
    //   final List<OlcumBelgeModel>? newList = (result.data as List?)?.map((e) => e as OlcumBelgeModel).toList().cast<OlcumBelgeModel>();
    //   setOlcumBelgeModel(newList);
    // }

    if (result.data is List) {
      final List<OlcumBelgeModel> list = (result.data as List).map((e) => e as OlcumBelgeModel).toList();
      if ((requestModel?.sayfa ?? 0) < 2) {
        // paramData = result.paramData?.map((key, value) => MapEntry(key, double.tryParse((value as String).replaceAll(",", ".")) ?? value)).asObservable();
        if (olcumGirisiListesi.ext.isNullOrEmpty) {
          setOlcumBelgeModel(list);
        } else {
          addOlcumBelgeModel(list);
        }
      } else {
        addOlcumBelgeModel(list);
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
