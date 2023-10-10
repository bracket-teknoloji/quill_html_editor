import "package:mobx/mobx.dart";
import "../../../../init/cache/cache_manager.dart";

import "../../../model/doviz_kurlari_model.dart";

part "doviz_kurlari_view_model.g.dart";

class DovizKurlariViewModel = _DovizKurlariViewModelBase
    with _$DovizKurlariViewModel;

abstract class _DovizKurlariViewModelBase with Store {
  @observable
  ObservableList<DovizKurlariModel>? dovizKurlariList;

  @action
  void changeDovizKurlariList(List<DovizKurlariModel>? value) =>
      dovizKurlariList = value?.asObservable();

  @observable
  DateTime tarih = DateTime.now();

  @action
  void changeTarih(DateTime? value) => value != null ? tarih = value : null;

  @action
  void changeTarihTomorow() => tarih = tarih.add(const Duration(days: 1));

  @action
  void changeTarihYesterday() =>
      tarih = tarih.subtract(const Duration(days: 1));

  @observable
  bool kurlariSilTekrarGuncelle =
      CacheManager.getProfilParametre.kurlariSilTekrarGuncelle;

  @action
  void changeKurlariSilTekrarGuncelle() {
    kurlariSilTekrarGuncelle = !kurlariSilTekrarGuncelle;
    CacheManager.setProfilParametre(CacheManager.getProfilParametre
        .copyWith(kurlariSilTekrarGuncelle: kurlariSilTekrarGuncelle));
  }
}
