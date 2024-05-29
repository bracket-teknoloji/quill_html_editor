import "package:mobx/mobx.dart";
import "package:picker/core/base/view_model/mobx_network_mixin.dart";
import "package:picker/core/constants/static_variables/singleton_models.dart";
import "package:picker/core/init/network/login/api_urls.dart";
import "package:picker/view/main_page/alt_sayfalar/stok/paketleme/paketleme_listesi/model/paketleme_listesi_model.dart";

part "hucre_edit_view_model.g.dart";

class HucreEditViewModel = _HucreEditViewModelBase with _$HucreEditViewModel;

abstract class _HucreEditViewModelBase with Store, MobxNetworkMixin {
  @action
  Future<bool> sendData() async {
    final result = await networkManager.dioPost(
      path: ApiUrls.saveHucreTakibi,
      bodyModel: PaketlemeListesiModel(),
      data: SingletonModels.hucreTransferiModel.toJson(),
      // data: (isStok ? HucreTransferiModel.forStok(model) : HucreTransferiModel.forPaket(model)).toJson(),
      showLoading: true,
    );
    return result.success ?? false;
  }
}
