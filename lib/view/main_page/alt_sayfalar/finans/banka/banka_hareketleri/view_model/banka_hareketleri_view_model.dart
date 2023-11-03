import "package:mobx/mobx.dart";
import "package:picker/core/base/view_model/mobx_network_mixin.dart";
import "package:picker/view/main_page/alt_sayfalar/finans/banka/banka_hareketleri/model/banka_hareketleri_model.dart";
import "package:picker/view/main_page/alt_sayfalar/finans/banka/banka_islemleri/model/banka_islemleri_request_model.dart";
part "banka_hareketleri_view_model.g.dart";

class BankaHareketleriViewModel = _BankaHareketleriViewModelBase with _$BankaHareketleriViewModel;

abstract class _BankaHareketleriViewModelBase with Store, MobxNetworkMixin {

  @observable
  BankaIslemleriRequestModel requestModel = BankaIslemleriRequestModel();
  
  @observable
  ObservableList<BankaHareketleriModel>? bankaHareketleriListesi;

  // @action
  // Fut
}