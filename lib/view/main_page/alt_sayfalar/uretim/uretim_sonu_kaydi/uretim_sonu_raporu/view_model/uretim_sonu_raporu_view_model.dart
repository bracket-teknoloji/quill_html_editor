import "dart:convert";

import "package:mobx/mobx.dart";
import "package:picker/core/base/view_model/listable_mixin.dart";
import "package:picker/core/base/view_model/mobx_network_mixin.dart";
import "package:picker/core/init/network/login/api_urls.dart";
import "package:picker/view/main_page/alt_sayfalar/stok/stok_hareketleri/model/stok_hareketleri_model.dart";
import "package:picker/view/main_page/alt_sayfalar/uretim/uretim_sonu_kaydi/uretim_sonu_raporu/model/uretim_sonu_raporu_request_model.dart";

part "uretim_sonu_raporu_view_model.g.dart";

class UretimSonuRaporuViewModel = _UretimSonuRaporuViewModelBase with _$UretimSonuRaporuViewModel;

abstract class _UretimSonuRaporuViewModelBase with Store, MobxNetworkMixin, ListableMixin<StokHareketleriModel> {
  UretimSonuRaporuRequestModel requestModel = UretimSonuRaporuRequestModel(filtreKodu: 1);

  void setBelgeNo(String? value) => requestModel.belgeNo = value;
  @override
  @observable
  ObservableList<StokHareketleriModel>? observableList;
  @override
  @action
  void setObservableList(List<StokHareketleriModel>? list) => observableList = list?.asObservable();

  @override
  @action
  Future<void> getData() async {
    if (observableList != null) {
      resetList();
    }
    final result = await networkManager.dioGet(
      path: ApiUrls.getStokHareketleri,
      bodyModel: StokHareketleriModel(),
      queryParameters: {"FilterModel": jsonEncode(requestModel.toJson())},
    );
    if (result.isSuccess) {
      setObservableList(result.dataList);
    }
  }
}
