import "package:mobx/mobx.dart";
import "package:picker/core/base/view_model/mobx_network_mixin.dart";
import "package:picker/core/init/network/login/api_urls.dart";
import "package:picker/view/main_page/alt_sayfalar/transfer/transfer_mal_talebi_listesi/model/transfer_mal_talebi_listesi_model.dart";

part "transfer_mal_talebi_edit_view_model.g.dart";

class TransferMalTalebiEditViewModel = _TransferMalTalebiEditViewModelBase with _$TransferMalTalebiEditViewModel;

abstract class _TransferMalTalebiEditViewModelBase with Store, MobxNetworkMixin {
  @observable
  TransferMalTalebiListesiModel model = TransferMalTalebiListesiModel();

  @action
  void setModel(TransferMalTalebiListesiModel value) => model = value;

  @action
  getData() async {
    final result = await networkManager.dioPost(path: ApiUrls.getDepoTalepleri, bodyModel: TransferMalTalebiListesiModel(), data: {"ID": model.id});
  }
}
