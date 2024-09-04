import "package:mobx/mobx.dart";

import "../../../../../../../core/base/view_model/mobx_network_mixin.dart";
import "../../../../../../../core/init/network/login/api_urls.dart";
import "../../cek_senet_listesi/model/cek_senet_listesi_model.dart";
import "../model/cek_senet_hareketleri_model.dart";

part "cek_senet_hareketleri_view_model.g.dart";

class CekSenetHareketleriViewModel = _CekSenetHareketleriViewModelBase with _$CekSenetHareketleriViewModel;

abstract class _CekSenetHareketleriViewModelBase with Store, MobxNetworkMixin {
  @observable
  CekSenetListesiModel? cekSenetListesiModel;

  @observable
  ObservableList<CekSenetHareketleriModel>? cekSenetHareketleriListesi;

  @action
  void setCekSenetListesiModel(CekSenetListesiModel model) => cekSenetListesiModel = model;

  @action
  void setCekSenetHareketleriListesi(List<CekSenetHareketleriModel> list) => cekSenetHareketleriListesi = list.asObservable();

  @action
  Future<void> getData() async {
    final result = await networkManager
        .dioGet(path: ApiUrls.getCekSenetLoglari, bodyModel: CekSenetHareketleriModel(), queryParameters: {"BelgeTipi": cekSenetListesiModel?.belgeTipi, "BelgeNo": cekSenetListesiModel?.belgeNo});
    if (result.isSuccess) {
      setCekSenetHareketleriListesi(result.dataList);
    }
  }
}
