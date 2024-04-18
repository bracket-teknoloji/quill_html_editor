import "package:mobx/mobx.dart";
import "package:picker/core/base/view_model/mobx_network_mixin.dart";
import "package:picker/core/init/network/login/api_urls.dart";
import "package:picker/view/main_page/alt_sayfalar/kalite_kontrol/olcum_belge_edit/model/olcum_belge_edit_model.dart";

part "olcum_kalem_sec_view_model.g.dart";

class OlcumKalemSecViewModel = _OlcumKalemSecViewModelBase with _$OlcumKalemSecViewModel;

abstract class _OlcumKalemSecViewModelBase with Store, MobxNetworkMixin {
  @observable
  ObservableList<OlcumBelgeModel>? olcumGirisiListesi;

  OlcumBelgeModel? requestModel;

  void setRequestModel(OlcumBelgeModel model) => requestModel = model;

  @action
  void setOlcumBelgeModel(List<OlcumBelgeModel>? list) => olcumGirisiListesi = list?.asObservable();

  @action
  Future<void> getData() async {
    final result = await networkManager.dioGet(path: ApiUrls.getOlcumBelgeStok, bodyModel: OlcumBelgeModel(), data: requestModel?.forKalemSec);
    if (result.success == true) {
      final List<OlcumBelgeModel>? newList = (result.data as List?)?.map((e) => e as OlcumBelgeModel).toList().cast<OlcumBelgeModel>();
      setOlcumBelgeModel(newList);
    }
  }
}
