import "package:kartal/kartal.dart";
import "package:mobx/mobx.dart";

import "../../../../../../core/constants/extensions/date_time_extensions.dart";
import "../model/ortalama_vade_tarihi_model.dart";

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
  double get ortalamaVadeTarihi {
    double toplamTutar = 0;
    double toplamVadeTarihi = 0;
    for (var item in ortalamaVadeTarihiListesi) {
      toplamTutar += item.tutar ?? 0;
      toplamVadeTarihi += (item.vadeTarihi?.difference(DateTime.now().dateTimeWithoutTime!).inDays ?? 0) * (item.tutar ?? 0);
    }
    return toplamVadeTarihi / toplamTutar;
  }

  @computed
  double get ortalamaVadeTarihi2 => ortalamaVadeTarihi.isNaN ? 0 : ortalamaVadeTarihi;

  @computed
  DateTime get ortalamaVadeTarihiDateTime {
    if (ortalamaVadeTarihi2 == 0) {
      return DateTime.now().dateTimeWithoutTime!;
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
