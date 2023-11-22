import "package:mobx/mobx.dart";
import "package:picker/core/base/model/base_network_mixin.dart";
import "package:picker/core/base/model/generic_response_model.dart";
import "package:picker/core/base/view_model/mobx_network_mixin.dart";
import "package:picker/core/init/network/login/api_urls.dart";
import "package:picker/view/main_page/alt_sayfalar/finans/dekontlar/dekont_edit/model/dekont_islemler_model.dart";
import "package:picker/view/main_page/alt_sayfalar/finans/dekontlar/dekont_edit/model/dekont_islemler_request_model.dart";
import "package:uuid/uuid.dart";

part "dekont_edit_view_model.g.dart";

class DekontEditViewModel = _DekontEditViewModelBase with _$DekontEditViewModel;

abstract class _DekontEditViewModelBase with Store, MobxNetworkMixin {
  @observable
  int selectedTab = 0;

  @observable
  int kalemSayisi = 0;

  @action
  void setSelectedTab(int value) => selectedTab = value;

  @action
  void setKalemSayisi(int value) => kalemSayisi = value;

  @action
  Future<GenericResponseModel<NetworkManagerMixin>> postData() async {
    SingletonDekontIslemlerRequestModel.instance.guid = const Uuid().v4();
    SingletonDekontIslemlerRequestModel.instance.kalemler?.map((e) => e.tarih = SingletonDekontIslemlerRequestModel.instance.tarih).toList();
    return await networkManager.dioPost(path: ApiUrls.saveDekont, bodyModel: DekontIslemlerModel(), data: SingletonDekontIslemlerRequestModel.instance.toJson(), showLoading: true);
  }
}
