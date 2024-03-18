import "package:mobx/mobx.dart";
import "package:picker/core/constants/static_variables/singleton_models.dart";
import "package:picker/view/main_page/alt_sayfalar/cari/cari_aktivite_kayitlari/model/cari_aktivite_listesi_model.dart";

part "cari_aktivite_detay_view_model.g.dart";

class CariAktiviteDetayViewModel = _CariAktiviteDetayViewModelBase with _$CariAktiviteDetayViewModel;

abstract class _CariAktiviteDetayViewModelBase with Store {

  @observable
  ObservableList<CariAktiviteListesiModel> aktiviteList = (SingletonModels.cariAktiviteListesi?.listDetay ?? []).asObservable();
}
