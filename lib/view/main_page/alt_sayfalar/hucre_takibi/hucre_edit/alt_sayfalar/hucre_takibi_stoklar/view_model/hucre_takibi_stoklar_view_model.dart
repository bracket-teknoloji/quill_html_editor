import "package:mobx/mobx.dart";

import "../../../../../../../../core/base/view_model/mobx_network_mixin.dart";
import "../../../../../../../../core/constants/static_variables/singleton_models.dart";
import "../../../../../../../../core/init/network/login/api_urls.dart";
import "../model/hucre_takibi_stoklar_model.dart";
import "../model/hucre_takibi_stoklar_request_model.dart";

part "hucre_takibi_stoklar_view_model.g.dart";

final class HucreTakibiStoklarViewModel = _HucreTakibiStoklarViewModelBase with _$HucreTakibiStoklarViewModel;

abstract class _HucreTakibiStoklarViewModelBase with Store, MobxNetworkMixin {
  @observable
  ObservableList<HucreTakibiStoklarModel>? hucreTakibiStoklarListesi;

  @observable
  HucreTakibiStoklarRequestModel requestModel = HucreTakibiStoklarRequestModel.fromHucreTransferiModel(SingletonModels.hucreTransferiModel.copyWith(stokKodu: null));

  @action
  void setHucreTakibiStoklarListesi(List<HucreTakibiStoklarModel>? list) => hucreTakibiStoklarListesi = list?.asObservable();

  @action
  Future<void> getData() async {
    if (hucreTakibiStoklarListesi != null) {
      setHucreTakibiStoklarListesi(null);
    }
    final result = await networkManager.dioGet(path: ApiUrls.getHucreTakibiStoklar, bodyModel: HucreTakibiStoklarModel(), queryParameters: requestModel.toJson());
    if (result.isSuccess) {
      setHucreTakibiStoklarListesi(result.dataList);
    }
  }
}
