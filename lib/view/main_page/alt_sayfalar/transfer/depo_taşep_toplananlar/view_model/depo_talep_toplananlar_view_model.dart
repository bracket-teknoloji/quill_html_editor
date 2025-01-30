import "package:mobx/mobx.dart";
import "package:picker/core/base/view_model/mobx_network_mixin.dart";
import "package:picker/core/init/network/login/api_urls.dart";
import "package:picker/view/main_page/alt_sayfalar/siparis/base_siparis_edit/model/base_siparis_edit_model.dart";

part "depo_talep_toplananlar_view_model.g.dart";

final class DepoTalepToplananlarViewModel = _DepoTalepToplananlarViewModelBase with _$DepoTalepToplananlarViewModel;

abstract class _DepoTalepToplananlarViewModelBase with Store, MobxNetworkMixin {
  @observable
  ObservableList<KalemModel>? kalemList;

  @action
  void setKalemList(List<KalemModel>? value) => kalemList = value?.asObservable();

  @action
  Future<void> getKalemler(int id) async {
    setKalemList(null);
    final result = await networkManager.dioPost(path: ApiUrls.getDepoTalepToplananlar, bodyModel: KalemModel(), data: {"DetayID": id});
    if (result.isSuccess) {
      setKalemList(result.dataList);
    }
  }

  @action
  Future<bool> deleteKalem(int id) async {
    final result = await networkManager.dioPost(path: ApiUrls.saveDepoTalep, bodyModel: KalemModel(), data: {"ID": id, "ISLEM_KODU": 8}, showLoading: true);
    return result.isSuccess;
  }
}
