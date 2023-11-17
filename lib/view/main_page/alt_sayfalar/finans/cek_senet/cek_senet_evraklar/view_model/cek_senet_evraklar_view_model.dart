import "package:flutter/widgets.dart";
import "package:mobx/mobx.dart";
import "package:picker/core/base/view_model/mobx_network_mixin.dart";
import "package:picker/core/init/network/login/api_urls.dart";
import "package:picker/view/main_page/alt_sayfalar/finans/cek_senet/cek_senet_evraklar/model/evraklar_model.dart";
import "package:picker/view/main_page/alt_sayfalar/finans/cek_senet/cek_senet_evraklar/model/evraklar_request_model.dart";

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
  Future<MemoryImage?> getImage(String? path) async => await networkManager.getImage(path);

  @action
  Future<void> getData() async {
    final result = await networkManager.dioGet(path: ApiUrls.getEvraklar, bodyModel: EvraklarModel(), queryParameters: requestModel.toJson());
    if ((result.success ?? false) && result.data is List) {
      setEvraklarListesi(result.data!.map((e) => e as EvraklarModel).toList().cast<EvraklarModel>());
    }
  }
}
