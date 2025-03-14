import "package:mobx/mobx.dart";
import "package:picker/core/base/view_model/mobx_network_mixin.dart";
import "package:picker/core/init/cache/cache_manager.dart";
import "package:picker/core/init/network/login/api_urls.dart";
import "package:picker/view/main_page/alt_sayfalar/siparis/base_siparis_edit/model/base_siparis_edit_model.dart";
import "package:picker/view/main_page/model/param_model.dart";

part "depo_talep_mal_toplama_view_model.g.dart";

final class DepoTalepMalToplamaViewModel = _DepoTalepMalToplamaViewModelBase with _$DepoTalepMalToplamaViewModel;

abstract class _DepoTalepMalToplamaViewModelBase with Store, MobxNetworkMixin {
  @observable
  BaseSiparisEditModel? model;

  @observable
  DepoList? depoList;

  @action
  void setModel(BaseSiparisEditModel value) => model = value;

  @action
  void setDepoList(DepoList value) {
    depoList = value;
    CacheManager.setProfilParametre(CacheManager.getProfilParametre.copyWith(depoTalepDepoList: value));
  }

  @action
  Future<void> getKalemler() async {
    final result = await networkManager.dioPost(
      path: ApiUrls.getDepoTalepKalemleri,
      bodyModel: KalemModel(),
      data: {
        "Filtreler": [7],
        "EkranTipi": "D",
        "TalepID": model?.id,
      },
    );
    if (result.isSuccess) model = model?.copyWith(kalemler: result.dataList);
  }

  @action
  Future<bool> saveKalem(KalemModel kalem) async {
    final result = await networkManager.dioPost(
      path: ApiUrls.saveDepoTalep,
      bodyModel: KalemModel(),
      data: kalem.copyWith(islemKodu: 7, talepId: model?.id).toJson(),
    );
    return result.isSuccess;
  }
}
