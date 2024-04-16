import "package:kartal/kartal.dart";
import "package:mobx/mobx.dart";
import "package:picker/view/main_page/alt_sayfalar/kalite_kontrol/olcum_ekle/model/olcum_ekle_model.dart";

part "proses_ekle_view_model.g.dart";

class ProsesEkleViewModel = _ProsesEkleViewModelBase with _$ProsesEkleViewModel;

abstract class _ProsesEkleViewModelBase with Store {
  final List<String> sonucTuruTitleList = [
    "Şartlı Kabul",
    "Ret",
  ];

  @observable
  ObservableList<String> sonucTuruValueList = [
    "S",
    "R",
  ].asObservable();

  @observable
  String sonucTuruGroupValue = "S";

  @observable
  OlcumEkleProsesModel ekleModel = OlcumEkleProsesModel(sonuc: "S");

  @computed
  double get ortalamaDeger => (ekleModel.detaylar?.map((element) => element.deger ?? 0).sum ?? 0) / (ekleModel.detaylar?.length ?? 1);

  @computed
  double get enKucukDeger => ekleModel.detaylar?.map((element) => element.deger ?? 0).min ?? 0;

  @computed
  double get enBuyukDeger => ekleModel.detaylar?.map((element) => element.deger ?? 0).max ?? 0;

  @computed
  bool get sartliKabulMu => sonucTuruGroupValue == "S";

  @action
  void setSonucTuruGroupValue(int index) {
    sonucTuruGroupValue = sonucTuruValueList[index];
    ekleModel.sonuc = sonucTuruValueList[index];
    if (!sartliKabulMu) {
      setSartliKabul(null);
    }
  }

  @action
  void setAciklama(String? value) => ekleModel.aciklama = value;

  @action
  void setOperator(String? value) => ekleModel = ekleModel.copyWith(kayitOperator: value);

  @action
  void setSartliKabul(String? value) => ekleModel = ekleModel.copyWith(sartliKabulNedeni: value);

  @action
  void setProsesDetayListesi(int index) {
    ekleModel = ekleModel.copyWith(detaylar: List.generate(index, (index) => OlcumEkleDetayModel()));
  }

  @action
  void setIndexedItem(int index, OlcumEkleDetayModel item) {
    final List<OlcumEkleDetayModel>? newList = ekleModel.detaylar;
    newList?[index] = item..zaman = DateTime.now();
    ekleModel = ekleModel.copyWith(detaylar: newList);
  }
}
