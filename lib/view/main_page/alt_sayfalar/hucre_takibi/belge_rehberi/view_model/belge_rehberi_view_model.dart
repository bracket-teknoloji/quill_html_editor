import "package:mobx/mobx.dart";

import "../../../../../../core/base/view_model/mobx_network_mixin.dart";
import "../../../../../../core/init/network/login/api_urls.dart";
import "../model/belge_rehberi_model.dart";
import "../model/belge_rehberi_request_model.dart";

part "belge_rehberi_view_model.g.dart";

final class BelgeRehberiViewModel = _BelgeRehberiViewModelBase with _$BelgeRehberiViewModel;

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
