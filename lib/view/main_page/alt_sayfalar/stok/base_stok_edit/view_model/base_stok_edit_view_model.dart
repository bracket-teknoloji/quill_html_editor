import "package:mobx/mobx.dart";
import "package:picker/view/main_page/alt_sayfalar/stok/base_stok_edit/model/stok_detay_model.dart";
import "package:picker/view/main_page/alt_sayfalar/stok/stok_liste/model/stok_listesi_model.dart";

import "../../../../../../core/base/view_model/mobx_network_mixin.dart";
import "../../../../../../core/init/network/login/api_urls.dart";

part "base_stok_edit_view_model.g.dart";

class BaseStokEditingViewModel = _BaseStokEditingViewModelBase with _$BaseStokEditingViewModel;

abstract class _BaseStokEditingViewModelBase with Store, MobxNetworkMixin {
  @observable
  StokListesiModel? stokListesiModel;

  @action
  void setStokListesiModel(StokListesiModel? value) {
    stokListesiModel = value;
    StokListesiModel.setInstance(stokListesiModel);
  }

  @observable
  bool isSuccess = false;

  @action
  void setIsSuccess(bool value) => isSuccess = value;

  @action
  Future<void> getData() async {
    final result = await networkManager.dioGet<StokDetayModel>(
      path: ApiUrls.getStokDetay,
      bodyModel: StokDetayModel(),
      addCKey: true,
      addSirketBilgileri: true,
      showLoading: true,
      queryParameters: {
        "stokKodu": stokListesiModel?.stokKodu ?? "",
      },
    );
    if (result.data != null) {
      StokDetayModel.setInstance(result.dataList.firstOrNull as StokDetayModel);
      isSuccess = true;
    }
  }
}
