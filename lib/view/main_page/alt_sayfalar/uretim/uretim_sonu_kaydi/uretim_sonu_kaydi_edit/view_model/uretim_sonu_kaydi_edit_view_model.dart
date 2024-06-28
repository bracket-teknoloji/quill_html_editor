import "package:mobx/mobx.dart";
import "package:picker/core/base/view_model/mobx_network_mixin.dart";
import "package:picker/core/init/network/login/api_urls.dart";
import "package:picker/view/main_page/alt_sayfalar/uretim/uretim_sonu_kaydi/uretim_sonu_kaydi_listesi/model/uretim_sonu_kaydi_listesi_model.dart";
import "package:picker/view/main_page/alt_sayfalar/uretim/uretim_sonu_kaydi/uretim_sonu_kaydi_listesi/model/uretim_sonu_kaydi_listesi_request_model.dart";

part "uretim_sonu_kaydi_edit_view_model.g.dart";

class UretimSonuKaydiEditViewModel = _UretimSonuKaydiEditViewModelBase with _$UretimSonuKaydiEditViewModel;

abstract class _UretimSonuKaydiEditViewModelBase with Store, MobxNetworkMixin {
  UretimSonuKaydiListesiModel? selectedItem;

  @observable
  UretimSonuKaydiListesiModel? model;

  @computed
  UretimSonuKaydiListesiRequestModel get requestModel => UretimSonuKaydiListesiRequestModel(belgeNo: selectedItem?.belgeNo, ekranTipi: "D");

  @action
  void setSelectedItem(UretimSonuKaydiListesiModel? item) => selectedItem = item;

  @action
  void setModel(UretimSonuKaydiListesiModel? item) => model = item;

  @action
  Future<void> getKalemler() async {
    final result = await networkManager.dioGet(path: ApiUrls.getUSKKalemleri, bodyModel: UretimSonuKaydiListesiModel(), showLoading: true, queryParameters: requestModel.toJson());
    if (result.isSuccess) setModel(result.dataList.firstOrNull);
  }
}
