import "package:flutter/material.dart";
import "package:mobx/mobx.dart";
import "package:picker/core/base/view/servis_islemleri/model/servis_info_model.dart";
import "package:picker/core/base/view_model/mobx_network_mixin.dart";
import "package:picker/core/components/dialog/bottom_sheet/model/bottom_sheet_model.dart";
import "package:picker/core/init/cache/cache_manager.dart";
import "package:picker/core/init/network/login/api_urls.dart";

part "servis_islemleri_view_model.g.dart";

class ServisIslemleriViewModel = _ServisIslemleriViewModelBase with _$ServisIslemleriViewModel;

abstract class _ServisIslemleriViewModelBase with Store, MobxNetworkMixin {
  // @action
  // Future<void>
  List<BottomSheetModel> get itemList => [
        BottomSheetModel(
          title: "Web Servisleri Çalışıyor Mu?",
          description: "Web servislerinin çalışıp çalışmadığını kontrol eder.",
          iconWidget: Icons.travel_explore_outlined,
          onTap: webServisleriCalistir,
        ),
        BottomSheetModel(
          title: "Servisi Güncelle",
          description: "Servisi güncellemek için kullanılır.",
          iconWidget: Icons.sync_alt_outlined,
        ),
        BottomSheetModel(
          title: "Web Servisi Yeniden Başlat",
          description: "Web servisini yeniden başlatmak için kullanılır.",
          iconWidget: Icons.restart_alt_outlined,
        ),
        BottomSheetModel(
          title: "DB Update",
          description: "SQL veritabanını güncellemek için kullanılır.",
          iconWidget: Icons.system_update_alt_outlined,
          onTap: dbUpdate,
        ),
      ];

  @action
  Future<void> webServisleriCalistir() async {
    final result = await networkManager.dioGet(
      path: ApiUrls.getServiceInfos,
      bodyModel: ServisInfoModel(),
    );
    if (result.data.first is ServisInfoModel) {
      dialogManager.showInfoDialog(result.data.first.getInfo ?? "Servisler Çalışıyor");
    }
  }

  @action
  Future<void> dbUpdate() async {
    await networkManager.dbUpdate(CacheManager.getVeriTabani()["Şirket"]);
  }
}
