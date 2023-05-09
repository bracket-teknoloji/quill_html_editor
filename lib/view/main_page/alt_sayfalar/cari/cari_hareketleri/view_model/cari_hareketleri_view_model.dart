import 'package:mobx/mobx.dart';

import '../model/cari_hareketleri_model.dart';

part 'cari_hareketleri_view_model.g.dart';

class CariHareketleriViewModel = _CariHareketleriViewModelBase with _$CariHareketleriViewModel;

abstract class _CariHareketleriViewModelBase with Store {
  @observable
  ObservableList<CariHareketleriModel>? cariHareketleriList;

  @action
  void setCariHareketleri(List<CariHareketleriModel>? value) {
    if (value == null) {
      cariHareketleriList = null;
    } else {
      cariHareketleriList = value.asObservable();
    }
  }

  @observable
  String siralama = "";

  @action
  void setSiralama(String value) {
    siralama = value;
  }

  @observable
  double? alacaklar = 0.0;

  @action
  void addAlacaklar(double value) {
    alacaklar = alacaklar! + value;
  }

  @observable
  double? borclar = 0.0;

  @action
  void addBorclar(double value) {
    borclar = borclar! + value;
  }

  @action
  void resetAlacaklarBorclar() {
    alacaklar = 0.0;
    borclar = 0.0;
  }
}
