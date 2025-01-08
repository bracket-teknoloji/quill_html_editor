import "package:mobx/mobx.dart";

import "../../../../constants/extensions/date_time_extensions.dart";
import "../../../../init/cache/cache_manager.dart";
import "../../../../init/network/login/api_urls.dart";
import "../../../model/doviz_kurlari_model.dart";
import "../../../view_model/listable_mixin.dart";
import "../../../view_model/mobx_network_mixin.dart";

part "doviz_kurlari_view_model.g.dart";

final class DovizKurlariViewModel = _DovizKurlariViewModelBase with _$DovizKurlariViewModel;

abstract class _DovizKurlariViewModelBase with Store, MobxNetworkMixin, ListableMixin<DovizKurlariModel> {
  @override
  @observable
  ObservableList<DovizKurlariModel>? observableList;

  @override
  @action
  void setObservableList(List<DovizKurlariModel>? value) => observableList = value?.asObservable();

  @observable
  DateTime tarih = DateTime.now();

  @action
  void changeTarih(DateTime? value) => value != null ? tarih = value : null;

  @action
  void changeTarihTomorow() => tarih = tarih.add(const Duration(days: 1));

  @action
  void changeTarihYesterday() => tarih = tarih.subtract(const Duration(days: 1));

  @observable
  bool kurlariSilTekrarGuncelle = CacheManager.getProfilParametre.kurlariSilTekrarGuncelle;

  @action
  void changeKurlariSilTekrarGuncelle() {
    kurlariSilTekrarGuncelle = !kurlariSilTekrarGuncelle;
    CacheManager.setProfilParametre(
      CacheManager.getProfilParametre.copyWith(kurlariSilTekrarGuncelle: kurlariSilTekrarGuncelle),
    );
  }

  @override
  @action
  Future<void> getData() async {
    setObservableList(null);
    final result = await networkManager.dioGet<DovizKurlariModel>(
      path: ApiUrls.getDovizKurlari,
      bodyModel: DovizKurlariModel(),
      queryParameters: {
        "EkranTipi": "L",
        "SabitTarih": tarih.toDateString,
      },
    );
    if (result.isSuccess) {
      setObservableList(result.dataList);
    }
  }
}
