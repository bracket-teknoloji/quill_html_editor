import "package:kartal/kartal.dart";
import "package:mobx/mobx.dart";
import "package:picker/view/main_page/alt_sayfalar/kalite_kontrol/olcum_ekle/model/olcum_ekle_model.dart";

part "proses_ekle_view_model.g.dart";

class ProsesEkleViewModel = _ProsesEkleViewModelBase with _$ProsesEkleViewModel;

abstract class _ProsesEkleViewModelBase with Store {
  @observable
  ObservableList<OlcumEkleDetayModel> prosesDetayListesi = ObservableList();

  @computed
  double get ortalamaDeger => prosesDetayListesi.map((element) => element.deger ?? 0).sum / prosesDetayListesi.length; 

  @computed
  double get enKucukDeger => prosesDetayListesi.map((element) => element.deger ?? 0).min;

  @computed
  double get enBuyukDeger => prosesDetayListesi.map((element) => element.deger ?? 0).max;

  @action
  void setProsesDetayListesi(int index) {
    prosesDetayListesi = List.generate(index, (index) => OlcumEkleDetayModel()).asObservable();
  }

  @action
  void setIndexedItem(int index, OlcumEkleDetayModel item) {
    prosesDetayListesi[index] = item..zaman = DateTime.now();
  }
}
