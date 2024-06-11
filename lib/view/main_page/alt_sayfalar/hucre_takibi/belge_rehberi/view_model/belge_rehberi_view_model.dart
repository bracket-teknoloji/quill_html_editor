import "package:mobx/mobx.dart";
import "package:picker/core/base/view_model/mobx_network_mixin.dart";
import "package:picker/core/init/network/login/api_urls.dart";
import "package:picker/view/main_page/alt_sayfalar/hucre_takibi/belge_rehberi/model/belge_rehberi_model.dart";
import "package:picker/view/main_page/alt_sayfalar/hucre_takibi/belge_rehberi/model/belge_rehberi_request_model.dart";

part "belge_rehberi_view_model.g.dart";

class BelgeRehberiViewModel = _BelgeRehberiViewModelBase with _$BelgeRehberiViewModel;

abstract class _BelgeRehberiViewModelBase with Store, MobxNetworkMixin {
  @observable
  ObservableList<BelgeRehberiModel>? belgeRehberiList;

  @observable
  BelgeRehberiRequestModel requestModel = const BelgeRehberiRequestModel();

  @action
  void setHucreTransferiModel(BelgeRehberiRequestModel model) => requestModel = model;

  @action
  void setSearchText(String? value) => requestModel = requestModel.copyWith(searchText: value);

  @action
  void setBelgeRehberiList(List<BelgeRehberiModel>? list) => belgeRehberiList = list?.asObservable();

  @action
  Future<void> getData() async {
    setBelgeRehberiList(null);
    final result = await networkManager.dioGet(
      path: ApiUrls.getHucreTakibiBelgeler,
      bodyModel: BelgeRehberiModel(),
      queryParameters: requestModel.toJson(),
    );
    if (result.isSuccess) {
      setBelgeRehberiList(result.dataList);
    }
  }
}
