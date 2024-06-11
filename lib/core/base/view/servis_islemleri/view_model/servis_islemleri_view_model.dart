import "package:mobx/mobx.dart";

import "../../../../init/cache/cache_manager.dart";
import "../../../../init/network/login/api_urls.dart";
import "../../../view_model/mobx_network_mixin.dart";
import "../model/servis_info_model.dart";

part "servis_islemleri_view_model.g.dart";

class ServisIslemleriViewModel = _ServisIslemleriViewModelBase with _$ServisIslemleriViewModel;

abstract class _ServisIslemleriViewModelBase with Store, MobxNetworkMixin {
  @action
  Future<void> webServisleriCalistir() async {
    final result = await networkManager.dioGet(
      path: ApiUrls.getServiceInfos,
      bodyModel: ServisInfoModel(),
      showLoading: true,
    );
    if (result.data.first is ServisInfoModel) {
      final List<ServisInfoModel> list = result.data.map((e) => e as ServisInfoModel).toList().cast<ServisInfoModel>();
      dialogManager.showSuccesDialog(list.firstOrNull?.getInfo ?? "Servisler Çalışıyor");
    }
  }

  @action
  Future<void> dbUpdate() async {
    final result = await networkManager.dbUpdate(CacheManager.getVeriTabani["Şirket"]);
    if (result.isSuccess) dialogManager.showSuccesDialog(result.message);
  }

  @action
  Future<void> netOpenXCreateKernel() async {
    final result = await networkManager.dioGet(
      path: ApiUrls.netOpenXCreateKernel,
      bodyModel: ServisInfoModel(),
      showLoading: true,
    );
    if (result.isSuccess) dialogManager.showSuccesDialog(result.message);
  }

  @action
  Future<void> netOpenXStatus() async {
    final result = await networkManager.dioGet(
      path: ApiUrls.getNetOpenXStatus,
      bodyModel: ServisInfoModel(),
      showLoading: true,
    );
    if (result.isSuccess) dialogManager.showSuccesDialog(result.message);
  }

  @action
  Future<void> eFaturaDLLKayitla() async {
    final result = await networkManager.dioGet(
      path: ApiUrls.eFaturaDLLKayitla,
      bodyModel: ServisInfoModel(),
      showLoading: true,
    );
    if (result.isSuccess) dialogManager.showSuccesDialog(result.message);
  }

  @action
  Future<void> netFectWinServiceRestart() async {
    final result = await networkManager.dioGet(
      path: ApiUrls.netFectWinServiceRestart,
      bodyModel: ServisInfoModel(),
      showLoading: true,
    );
    if (result.isSuccess) dialogManager.showSuccesDialog(result.message ?? "Servis Yeniden Başlatıldı");
  }
}
