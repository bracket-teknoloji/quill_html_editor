import "package:mobx/mobx.dart";

import "../../../../model/param_model.dart";

part "stok_detayli_arama_view_model.g.dart";

typedef DetaySekliRecord = ({String adi, String kodu});

final class StokDetayliAramaViewModel = _StokDetayliAramaViewModelBase with _$StokDetayliAramaViewModel;

abstract class _StokDetayliAramaViewModelBase with Store {
  final List<DetaySekliRecord> detaySekliList = [
    (adi: "Eşittir", kodu: "ES"),
    (adi: "İçerir", kodu: "IC"),
    (adi: "İle Başlar", kodu: "IB"),
    (adi: "İle Biter", kodu: "IR"),
  ];

  @observable
  ObservableList<StokDetayliAramaAlanlar>? observableList;

  @action
  void setObservableList(List<StokDetayliAramaAlanlar>? list) => observableList = list?.asObservable();

  @action
  void setKriter(int index, DetaySekliRecord sekli) =>
      setObservableList(observableList?..[index].searchCriter = sekli.kodu);

  @action
  void setSearchText(int index, String? value) => setObservableList(observableList?..[index].searchText = value);
}
