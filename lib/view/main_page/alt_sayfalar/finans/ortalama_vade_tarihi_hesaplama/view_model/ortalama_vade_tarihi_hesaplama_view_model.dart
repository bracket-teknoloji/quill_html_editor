import "package:kartal/kartal.dart";
import "package:mobx/mobx.dart";
import "package:picker/core/constants/extensions/date_time_extensions.dart";
import "package:picker/view/main_page/alt_sayfalar/finans/ortalama_vade_tarihi_hesaplama/model/ortalama_vade_tarihi_model.dart";

part "ortalama_vade_tarihi_hesaplama_view_model.g.dart";

class OrtalamaVadeTarihiHesaplamaViewModel = _OrtalamaVadeTarihiHesaplamaViewModelBase with _$OrtalamaVadeTarihiHesaplamaViewModel;

abstract class _OrtalamaVadeTarihiHesaplamaViewModelBase with Store {
  @observable
  ObservableList<OrtalamaVadeTarihiModel> ortalamaVadeTarihiListesi = <OrtalamaVadeTarihiModel>[].asObservable();

  @computed
  int get toplamKayitSayisi => ortalamaVadeTarihiListesi.length;

  @computed
  double get toplamTutar => ortalamaVadeTarihiListesi.map((e) => e.tutar ?? 0).whereNotNull().fold(0, (previousValue, element) => previousValue + element);

  @computed
  double get ortalamaVadeTarihi =>
      ortalamaVadeTarihiListesi.map((e) => e.vadeTarihi?.difference(DateTime.now().dateTimeWithoutTime!).inDays ?? 0).whereNotNull().fold(0, (previousValue, element) => previousValue + element) /
      toplamKayitSayisi;

  @computed
  double get ortalamaVadeTarihi2 => ortalamaVadeTarihi.isNaN ? 0 : ortalamaVadeTarihi;

  @computed
  DateTime get ortalamaVadeTarihiDateTime {
    if (ortalamaVadeTarihi2 == 0) {
      return DateTime.now();
    }
    return DateTime.now().add(Duration(days: ortalamaVadeTarihi2.round()));
  }

  @computed
  String get ortalamaVadeTarihiString =>
      "${ortalamaVadeTarihi2 % 1 == 0 ? ortalamaVadeTarihi2.toInt().toString() : ortalamaVadeTarihi2.round().toString()} (${ortalamaVadeTarihiDateTime.toDateString})";

  // @computed
  @action
  void addOrtalamaVadeTarihiListesi(OrtalamaVadeTarihiModel value) => ortalamaVadeTarihiListesi.add(value);

  @action
  void removeOrtalamaVadeTarihiListesi(int index) => ortalamaVadeTarihiListesi.removeAt(index);

  @action
  void clearOrtalamaVadeTarihiListesi() => ortalamaVadeTarihiListesi.clear();
}
