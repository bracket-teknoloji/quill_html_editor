import "package:collection/collection.dart";
import "package:mobx/mobx.dart";

import "../../olcum_belge_edit/model/olcum_belge_edit_model.dart";

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
  OlcumProsesModel ekleModel = OlcumProsesModel(sonuc: "S");

  @computed
  double get ortalamaDeger => (ekleModel.olcumler?.map((element) => element.deger ?? 0).sum ?? 0) / (ekleModel.olcumler?.length ?? 1);

  @computed
  double get enKucukDeger => ekleModel.olcumler?.map((element) => element.deger ?? 0).min ?? 0;

  @computed
  double get enBuyukDeger => ekleModel.olcumler?.map((element) => element.deger ?? 0).max ?? 0;
  @computed
  ObservableList<OlcumEkleDetayModel>? get olcumler => ekleModel.olcumler?.asObservable();

  @computed
  bool get sartliKabulMu => sonucTuruGroupValue == "S";

  @action
  void setEkleModel(OlcumProsesModel model) => ekleModel = model;

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
    ekleModel = ekleModel.copyWith(olcumler: List.generate(index, (index) => OlcumEkleDetayModel()));
  }

  @action
  void setIndexedItem(int index, OlcumEkleDetayModel item) {
    final List<OlcumEkleDetayModel>? newList = ekleModel.olcumler;
    newList?[index] = item..zaman = DateTime.now();
    setEkleModel(ekleModel.copyWith(olcumler: newList));
  }
}
