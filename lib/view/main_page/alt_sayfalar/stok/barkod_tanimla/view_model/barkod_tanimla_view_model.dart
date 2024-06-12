import "package:mobx/mobx.dart";
import "package:picker/core/base/view/stok_rehberi/model/stok_rehberi_request_model.dart";
import "package:picker/core/base/view_model/mobx_network_mixin.dart";
import "package:picker/view/main_page/alt_sayfalar/stok/stok_liste/model/stok_listesi_model.dart";

part "barkod_tanimla_view_model.g.dart";

class BarkodTanimlaViewModel = _BarkodTanimlaViewModelBase with _$BarkodTanimlaViewModel;

abstract class _BarkodTanimlaViewModelBase with Store, MobxNetworkMixin {
  @observable
  StokListesiModel? stokModel;

  @action
  void setStokModel(StokListesiModel? model) {
    stokModel = model;
  }

  @action
  Future<void> getStok(String? stokKodu) async {
    final result = await networkManager.getStokModel(StokRehberiRequestModel(stokKodu: stokKodu));
    if (result != null) {
      setStokModel(result);
    }
  }
}
