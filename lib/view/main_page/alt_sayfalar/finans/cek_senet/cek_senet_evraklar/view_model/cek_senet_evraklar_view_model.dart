import "package:mobx/mobx.dart";

import "../../../../../../../core/base/model/base_network_mixin.dart";
import "../../../../../../../core/base/model/generic_response_model.dart";
import "../../../../../../../core/base/view_model/mobx_network_mixin.dart";
import "../../../../../../../core/init/network/login/api_urls.dart";
import "../model/evraklar_model.dart";
import "../model/evraklar_request_model.dart";

part "cek_senet_evraklar_view_model.g.dart";

class CekSenetEvraklarViewModel = _CekSenetEvraklarViewModelBase with _$CekSenetEvraklarViewModel;

abstract class _CekSenetEvraklarViewModelBase with Store, MobxNetworkMixin {
  //create a constructor
  _CekSenetEvraklarViewModelBase({required this.requestModel});

  @observable
  ObservableList<EvraklarModel>? evraklarListesi;

  @observable
  late EvraklarRequestModel requestModel;

  @action
  void setEvraklarListesi(List<EvraklarModel>? value) => evraklarListesi = value?.asObservable();

  @action
  Future<void> resetPage() async {
    setEvraklarListesi(null);
    await getData();
  }

  @action
  Future<GenericResponseModel<NetworkManagerMixin>> deleteEvrak(EvraklarModel model) async {
    final result = await networkManager.dioPost(path: ApiUrls.saveEvrak, bodyModel: EvraklarModel(), data: EvraklarModel.forDelete(model).toJson());
    return result;
  }

  @action
  Future<GenericResponseModel<NetworkManagerMixin>> uploadEvrak(EvraklarModel model) async {
    final result = await networkManager.dioPost(path: ApiUrls.saveEvrak, bodyModel: EvraklarModel(), data: EvraklarModel.forDelete(model).toJson());
    return result;
  }

  @action
  Future<void> getData() async {
    final result = await networkManager.dioGet(path: ApiUrls.getEvraklar, bodyModel: EvraklarModel(), queryParameters: requestModel.toJson());
    if ((result.isSuccess) && result.data is List) {
      setEvraklarListesi(result.data!.map((e) => e as EvraklarModel).toList().cast<EvraklarModel>());
    }
  }
}
