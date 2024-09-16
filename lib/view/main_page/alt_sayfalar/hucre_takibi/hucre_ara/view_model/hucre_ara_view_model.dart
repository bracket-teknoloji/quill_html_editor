import "package:mobx/mobx.dart";

import "../../../../../../core/base/view_model/mobx_network_mixin.dart";
import "../../../../../../core/init/network/login/api_urls.dart";
import "../../hucre_edit/alt_sayfalar/hucre_takibi_stoklar/model/hucre_takibi_stoklar_model.dart";
import "../model/hucre_ara_request_model.dart";

part "hucre_ara_view_model.g.dart";

class HucreAraViewModel = _HucreAraViewModelBase with _$HucreAraViewModel;

abstract class _HucreAraViewModelBase with Store, MobxNetworkMixin {
  //* observable olmasına gerek yok çünkü view ile alakası yok
  final HucreAraRequestModel requestModel = HucreAraRequestModel(menuKodu: "HTAK_HUCA", filtreKodu: 3, ekranTipi: "L", hucreMiktarArray: {});

  @observable
  ObservableList<HucreTakibiStoklarModel>? stokList;

  @action
  void setStokList(List<HucreTakibiStoklarModel>? list) => stokList = list?.asObservable();

  void setBarkod(String? value) => requestModel.barkod = value;

  @action
  Future<void> getData() async {
    if (stokList != null) {
      setStokList(null);
    }
    final result = await networkManager.dioPost(path: ApiUrls.getHucreBakiyeListesi, bodyModel: HucreTakibiStoklarModel(), data: requestModel.toJson());
    if (result.isSuccess) {
      setStokList(result.dataList);
    }
  }
}
