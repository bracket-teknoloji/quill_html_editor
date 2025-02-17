import "package:mobx/mobx.dart";

import "../../../../../view/main_page/alt_sayfalar/finans/cek_senet/cek_senet_evraklar/model/evraklar_model.dart";
import "../../../../../view/main_page/alt_sayfalar/finans/cek_senet/cek_senet_evraklar/model/evraklar_request_model.dart";
import "../../../../base/model/base_network_mixin.dart";
import "../../../../base/model/generic_response_model.dart";
import "../../../../base/view_model/listable_mixin.dart";
import "../../../../base/view_model/mobx_network_mixin.dart";
import "../../../../init/network/login/api_urls.dart";

part "evraklar_view_model.g.dart";

final class EvraklarViewModel = _EvraklarViewModelBase with _$EvraklarViewModel;

abstract class _EvraklarViewModelBase with Store, MobxNetworkMixin, ListableMixin<EvraklarModel> {
  @override
  @observable
  ObservableList<EvraklarModel>? observableList;

  bool? refresh;

  @observable
  EvraklarRequestModel? requestModel;

  void setRequestModel(EvraklarRequestModel? model) => requestModel = model;

  @override
  @action
  void setObservableList(List<EvraklarModel>? list) => observableList = list?.asObservable();

  void setRefresh(bool? value) => refresh = value;

  @override
  Future<void> getData() async {
    if (observableList != null) setObservableList(null);
    final result = await networkManager.dioGet(
      path: ApiUrls.getEvraklar,
      bodyModel: EvraklarModel(),
      queryParameters: requestModel?.toJson(),
    );
    if (result.isSuccess) setObservableList(result.dataList);
  }

  @action
  Future<GenericResponseModel<NetworkManagerMixin>> deleteEvrak(EvraklarModel model) async {
    setRefresh(true);
    final result = await networkManager.dioPost(
      path: ApiUrls.saveEvrak,
      bodyModel: EvraklarModel(),
      data: EvraklarModel.forDelete(model).toJson(),
    );
    return result;
  }
}
