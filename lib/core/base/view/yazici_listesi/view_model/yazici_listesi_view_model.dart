import "package:mobx/mobx.dart";
import "package:picker/app/picker_app_imports.dart";
import "package:picker/core/base/model/yazici_model.dart";

part "yazici_listesi_view_model.g.dart";

class YaziciListesiViewModel = _YaziciListesiViewModelBase with _$YaziciListesiViewModel;

abstract class _YaziciListesiViewModelBase with Store {

  @observable
  ObservableList<YaziciModel>? yaziciListesi;

  @action
  void setYaziciListesi() => yaziciListesi = CacheManager.instance.getYazicilar().asObservable();

  @action
  void addYaziciListesi(YaziciModel value) {
    CacheManager.instance.addYazici(value);
    setYaziciListesi();
  }

  @action
  void removeYaziciListesi(YaziciModel value) {
    CacheManager.instance.removeYazici(value.macAdresi);
    setYaziciListesi();
}

}
