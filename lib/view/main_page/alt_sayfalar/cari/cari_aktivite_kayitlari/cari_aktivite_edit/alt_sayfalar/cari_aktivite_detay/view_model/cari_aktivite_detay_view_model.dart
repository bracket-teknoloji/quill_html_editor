import "package:mobx/mobx.dart";
import "package:picker/core/constants/static_variables/singleton_models.dart";
import "package:picker/view/main_page/alt_sayfalar/cari/cari_aktivite_kayitlari/model/cari_aktivite_listesi_model.dart";

part "cari_aktivite_detay_view_model.g.dart";

class CariAktiviteDetayViewModel = _CariAktiviteDetayViewModelBase with _$CariAktiviteDetayViewModel;

abstract class _CariAktiviteDetayViewModelBase with Store {
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
}
