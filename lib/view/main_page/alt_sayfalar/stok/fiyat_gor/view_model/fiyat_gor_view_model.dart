import "package:mobx/mobx.dart";

import "../../stok_liste/model/stok_listesi_model.dart";
import "../model/fiyat_gor_model.dart";

part "fiyat_gor_view_model.g.dart";

class FiyatGorViewModel = _FiyatGorViewModelBase with _$FiyatGorViewModel;

abstract class _FiyatGorViewModelBase with Store {
  @observable
  List<FiyatGorModel?>? modelList;

  @observable
  StokListesiModel? stokListesiModel;

  @action
  void setStokListesiModel(StokListesiModel? model) => stokListesiModel = model;

  @action
  void setModelList(List<FiyatGorModel?>? modelList) => this.modelList = modelList;

  final List<String> titleList = [
    "Döviz Fiyatı",
    "Fiyat 1",
    "Fiyat 2",
    "Fiyat 3",
    "Fiyat 4",
  ];

  @action
  double? getBilgi(int index, {bool isSatis = false}) {
    if (isSatis) {
      return switch (index) {
        0 => modelList?.last?.dovizTipi?.toDouble(),
        1  => modelList?.last?.fiyat1,
        2 => modelList?.last?.fiyat2,
        3 => modelList?.last?.fiyat3,
        4 => modelList?.last?.fiyat4,
        _ => null,
      };
    }
    return switch (index) {
      0 => modelList?.first?.dovizTipi?.toDouble(),
      1 => modelList?.first?.fiyat1,
      2 => modelList?.first?.fiyat2,
      3 => modelList?.first?.fiyat3,
      4 => modelList?.first?.fiyat4,
      _ => null,
    };
  }
}
