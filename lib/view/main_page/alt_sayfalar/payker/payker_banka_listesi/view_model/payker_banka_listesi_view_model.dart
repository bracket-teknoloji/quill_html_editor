import "package:mobx/mobx.dart";
import "package:picker/core/base/view_model/mobx_network_mixin.dart";
import "package:picker/view/main_page/alt_sayfalar/payker/payker_firma_bayi_listesi/model/payker_drop_down_model.dart";

part "payker_banka_listesi_view_model.g.dart";

class PaykerBankaListesiViewModel = _PaykerBankaListesiViewModelBase with _$PaykerBankaListesiViewModel;

abstract class _PaykerBankaListesiViewModelBase with Store, MobxNetworkMixin {
  @observable
  ObservableList<PaykerFirmaModel>? observableList;

  @action
  void setObservableList(List<PaykerFirmaModel>? value) => observableList = value?.asObservable();

  @action
  Future<void> getData() async {
    final result = await networkManager.getPaykerBankalar();
    setObservableList(result?.results);
  }
}
