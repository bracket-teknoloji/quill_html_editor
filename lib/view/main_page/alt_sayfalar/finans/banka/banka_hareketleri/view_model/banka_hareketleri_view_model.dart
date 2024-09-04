import "package:get/get.dart";
import "package:mobx/mobx.dart";

import "../../../../../../../core/base/view_model/mobx_network_mixin.dart";
import "../../../../../../../core/init/network/login/api_urls.dart";
import "../../banka_islemleri/model/banka_islemleri_request_model.dart";
import "../model/banka_hareketleri_model.dart";

part "banka_hareketleri_view_model.g.dart";

class BankaHareketleriViewModel = _BankaHareketleriViewModelBase with _$BankaHareketleriViewModel;

abstract class _BankaHareketleriViewModelBase with Store, MobxNetworkMixin {
  @observable
  BankaIslemleriRequestModel requestModel = BankaIslemleriRequestModel(menuKodu: "BANK_BHAR");

  @observable
  ObservableList<BankaHareketleriModel>? bankaHareketleriListesi;

  @computed
  double get gelenTutar => bankaHareketleriListesi?.where((element) => element.ba == "B").map((e) => e.tutar ?? 0).fold(0, (previousValue, element) => (previousValue ?? 0) + element) ?? 0;

  @computed
  double get dovizGelenTutar => bankaHareketleriListesi?.where((element) => element.ba == "B").map((e) => e.dovizTutari ?? 0).fold(0, (previousValue, element) => (previousValue ?? 0) + element) ?? 0;

  @computed
  double get gidenTutar => bankaHareketleriListesi?.where((element) => element.ba == "A").map((e) => e.tutar ?? 0).fold(0, (previousValue, element) => (previousValue ?? 0) + element) ?? 0;

  @computed
  double get dovizGidenTutar => bankaHareketleriListesi?.where((element) => element.ba == "A").map((e) => e.dovizTutari ?? 0).fold(0, (previousValue, element) => (previousValue ?? 0) + element) ?? 0;

  @computed
  double get bakiye => gelenTutar - gidenTutar;

  @computed
  double get dovizBakiye => dovizGelenTutar - dovizGidenTutar;

  @action
  void setHesapKodu(String? value) => requestModel = requestModel.copyWith(hesapKodu: value);

  @action
  void setBankaHareketleriListesi(List<BankaHareketleriModel>? value) => bankaHareketleriListesi = value?.asObservable();

  @action
  Future<void> getData() async {
    setBankaHareketleriListesi(null);
    final result = await networkManager.dioGet<BankaHareketleriModel>(path: ApiUrls.getBankaHareketleri, bodyModel: BankaHareketleriModel(), queryParameters: requestModel.toJson());
    if (result.isSuccess) {
      setBankaHareketleriListesi(result.dataList);
    } else {
      Get.back();
    }
  }
}
