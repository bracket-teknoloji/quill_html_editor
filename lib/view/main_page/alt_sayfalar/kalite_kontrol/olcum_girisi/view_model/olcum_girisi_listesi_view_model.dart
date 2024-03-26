import "package:mobx/mobx.dart";
import "package:picker/core/base/view_model/mobx_network_mixin.dart";
import "package:picker/view/main_page/alt_sayfalar/kalite_kontrol/olcum_girisi/model/olcum_girisi_listesi_model.dart";

part "olcum_girisi_listesi_view_model.g.dart";

class OlcumGirisiViewModel = _OlcumGirisiViewModelBase with _$OlcumGirisiViewModel;

abstract class _OlcumGirisiViewModelBase with Store, MobxNetworkMixin {
  @observable
  bool searchBar = false;

  @observable
  ObservableList<OlcumGirisiListesiModel>? olcumList;

  @action
  void setSearchBar() {
    searchBar = !searchBar;
    if (!searchBar){
      setSearchText(null);
    }
  }

  @action
  void setOlcumList(List<OlcumGirisiListesiModel>? list) => olcumList = list?.asObservable();

  @action
  void setSearchText(String? value) {}

  @action
  Future<void> getData() async {

  }
}
