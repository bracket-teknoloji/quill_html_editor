import "package:mobx/mobx.dart";
import "package:picker/core/base/view_model/mobx_network_mixin.dart";
import "package:picker/core/constants/enum/base_edit_enum.dart";
import "package:picker/core/constants/static_variables/singleton_models.dart";
import "package:picker/core/init/network/login/api_urls.dart";
import "package:picker/view/main_page/alt_sayfalar/cari/cari_aktivite_kayitlari/model/cari_aktivite_listesi_model.dart";

import "../../../../../../../core/base/model/base_network_mixin.dart";
import "../../../../../../../core/base/model/generic_response_model.dart";

part "cari_aktivite_edit_view_model.g.dart";

class CariAktiviteEditViewModel = _CariAktiviteEditViewModelBase with _$CariAktiviteEditViewModel;

abstract class _CariAktiviteEditViewModelBase with Store, MobxNetworkMixin {
  @observable
  BaseEditEnum? baseEditEnum;

  @action
  Future<GenericResponseModel<NetworkManagerMixin>> saveCariAktivite() async {
    SingletonModels.setCariAktiviteListesi = SingletonModels.cariAktiviteListesi?..islemKodu = baseEditEnum.islemKodu;
    return networkManager.dioPost(path: ApiUrls.saveAktivite, bodyModel: CariAktiviteListesiModel(), data: SingletonModels.cariAktiviteListesi?.toJson(), showLoading: true);
  }
}
