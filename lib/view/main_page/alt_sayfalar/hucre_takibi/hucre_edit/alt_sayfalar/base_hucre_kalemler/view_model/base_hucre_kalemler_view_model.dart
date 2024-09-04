import "package:mobx/mobx.dart";
import "package:picker/core/base/model/base_stok_mixin.dart";
import "package:picker/core/base/view_model/mobx_network_mixin.dart";
import "package:picker/core/constants/static_variables/singleton_models.dart";
import "package:picker/core/init/network/login/api_urls.dart";
import "package:picker/view/main_page/alt_sayfalar/hucre_takibi/hucre_transferi/model/hucre_transferi_model.dart";
import "package:picker/view/main_page/alt_sayfalar/stok/paketleme/paketleme_listesi/model/paketleme_listesi_model.dart";
import "package:picker/view/main_page/alt_sayfalar/stok/paketleme/paketleme_listesi/model/paketleme_listesi_request_model.dart";

part "base_hucre_kalemler_view_model.g.dart";

class BaseHucreKalemlerViewModel = _BaseHucreKalemlerViewModelBase with _$BaseHucreKalemlerViewModel;

abstract class _BaseHucreKalemlerViewModelBase with Store, MobxNetworkMixin {
  @observable
  HucreTransferiModel model = SingletonModels.hucreTransferiModel;

  @observable
  PaketlemeListesiRequestModel paketRequestModel = PaketlemeListesiRequestModel(menuKodu: "HTAK_HUCT", ekranTipi: "R", kisitYok: "E");

  @action
  void setStok(BaseStokMixin? stok) {
    model = model.copyWith(stokKodu: stok?.stokKodu, stokAdi: stok?.stokAdi);
    SingletonModels.hucreTransferiModel = model;
  }

  @action
  void setHucre(String? hucre) {
    model = model.copyWith(hucreKodu: hucre);
    SingletonModels.hucreTransferiModel = model;
  }

  @action
  void setMiktar(double? miktar) {
    model = model.copyWith(miktar: miktar);
    SingletonModels.hucreTransferiModel = model;
  }

  @action
  @action
  Future<String?> getPaket(String? paketKodu) async {
    final result = await networkManager.dioPost(
      path: ApiUrls.getPaketler,
      bodyModel: PaketlemeListesiModel(),
      data: (paketRequestModel.copyWith(depoKodu: model.depoKodu, paketKodu: paketKodu)).toJson(),
      showLoading: true,
    );
    if (result.isSuccess) {
      return result.dataList.firstOrNull?.kodu;
    }
    return null;
  }
}
