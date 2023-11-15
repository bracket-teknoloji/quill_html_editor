import "dart:convert";

import "package:mobx/mobx.dart";

import "../../../../../../../core/base/view_model/mobx_network_mixin.dart";
import "../../../../../../../core/init/network/login/api_urls.dart";
import "../../kasa_islemleri/model/kasa_islemleri_model.dart";
import "../../kasa_islemleri/model/kasa_islemleri_request_model.dart";

part "kasa_hareket_detay_view_model.g.dart";

class KasaHareketDetayViewModel = _KasaHareketDetayViewModelBase with _$KasaHareketDetayViewModel;

abstract class _KasaHareketDetayViewModelBase with Store, MobxNetworkMixin {
  _KasaHareketDetayViewModelBase({required this.kasaIslemleriRequestModel});

  @observable
  String? message;

  @observable
  late KasaIslemleriRequestModel kasaIslemleriRequestModel;

  @observable
  KasaIslemleriModel? kasaIslemleriModel;

  @action
  void setKasaIslemleriModel(KasaIslemleriModel? value) => kasaIslemleriModel = value;

  @action
  Future<void> getData() async {
    message = null;
    final result = await networkManager.dioGet<KasaIslemleriModel>(
      path: ApiUrls.getKasaHareketleri,
      bodyModel: KasaIslemleriModel(),
      showLoading: true,
      queryParameters: {"FilterModel": jsonEncode(kasaIslemleriRequestModel.toJson())},
    ;
    if (result.data is List) {
      setKasaIslemleriModel((result.data as List).firstOrNull);
    } else {
      message = result.message ?? "";
    }
  }
}
