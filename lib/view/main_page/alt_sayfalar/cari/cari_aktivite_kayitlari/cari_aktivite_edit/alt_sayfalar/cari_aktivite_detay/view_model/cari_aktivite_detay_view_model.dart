import "package:mobx/mobx.dart";
import "package:picker/core/base/model/base_network_mixin.dart";
import "package:picker/core/base/model/generic_response_model.dart";
import "package:picker/core/base/view_model/mobx_network_mixin.dart";
import "package:picker/core/constants/static_variables/singleton_models.dart";
import "package:picker/core/init/network/login/api_urls.dart";
import "package:picker/view/main_page/alt_sayfalar/cari/cari_aktivite_kayitlari/model/cari_aktivite_listesi_model.dart";

part "cari_aktivite_detay_view_model.g.dart";

class CariAktiviteDetayViewModel = _CariAktiviteDetayViewModelBase with _$CariAktiviteDetayViewModel;

abstract class _CariAktiviteDetayViewModelBase with Store, MobxNetworkMixin {
  @observable
  ObservableList<CariAktiviteListesiModel> aktiviteList = (SingletonModels.cariAktiviteListesi?.listDetay ?? []).asObservable();

  @action
  void addAktivite(CariAktiviteListesiModel value) {
    aktiviteList.add(value);
    SingletonModels.setCariAktiviteListesi = SingletonModels.cariAktiviteListesi?..listDetay = aktiviteList;
  }

  @action
  void deleteAktivite(CariAktiviteListesiModel value) {
    aktiviteList.remove(value);
    SingletonModels.setCariAktiviteListesi = SingletonModels.cariAktiviteListesi?..listDetay = aktiviteList;
  }

  @action
  void replaceAktivite(CariAktiviteListesiModel oldItem, CariAktiviteListesiModel newItem) {
    //replace these items
    final int index = aktiviteList.indexOf(oldItem);
    aktiviteList[index] = newItem;
    SingletonModels.setCariAktiviteListesi = SingletonModels.cariAktiviteListesi?..listDetay = aktiviteList;
  }

  @action
  Future<GenericResponseModel<NetworkManagerMixin>?> deleteDetay(int? id) async =>
      await networkManager.dioPost(path: ApiUrls.saveAktivite, bodyModel: CariAktiviteListesiModel(), data: {"ID": id, "ISLEM_KODU": 6}, showLoading: true);
}
