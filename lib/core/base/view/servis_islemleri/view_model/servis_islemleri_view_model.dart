import "package:mobx/mobx.dart";
import "package:picker/core/base/view/servis_islemleri/model/servis_info_model.dart";
import "package:picker/core/base/view_model/mobx_network_mixin.dart";
import "package:picker/core/init/cache/cache_manager.dart";
import "package:picker/core/init/network/login/api_urls.dart";

part "servis_islemleri_view_model.g.dart";

class ServisIslemleriViewModel = _ServisIslemleriViewModelBase with _$ServisIslemleriViewModel;

abstract class _ServisIslemleriViewModelBase with Store, MobxNetworkMixin {
  @action
  Future<void> webServisleriCalistir() async {
    final result = await networkManager.dioGet(
      path: ApiUrls.getServiceInfos,
      bodyModel: ServisInfoModel(),
    );
    if (result.data.first is ServisInfoModel) {
      dialogManager.showSuccesDialog(result.data.first.getInfo ?? "Servisler Çalışıyor");
    }
  }

  @action
  Future<void> dbUpdate() async {
    await networkManager.dbUpdate(CacheManager.getVeriTabani()["Şirket"]);
  }
}
