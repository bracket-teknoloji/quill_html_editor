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
    switch (index) {
      case 0:
        return (isSatis ? modelList?.last?.dovizTipi : modelList?.first?.dovizTipi)?.toDouble();
      case 1:
        return (isSatis ? modelList?.last?.fiyat1 : modelList?.first?.fiyat1);
      case 2:
        return (isSatis ? modelList?.last?.fiyat2 : modelList?.first?.fiyat2);
      case 3:
        return (isSatis ? modelList?.last?.fiyat3 : modelList?.first?.fiyat3);
      case 4:
        return (isSatis ? modelList?.last?.fiyat4 : modelList?.first?.fiyat4);
      default:
        return null;
    }
  }
}
