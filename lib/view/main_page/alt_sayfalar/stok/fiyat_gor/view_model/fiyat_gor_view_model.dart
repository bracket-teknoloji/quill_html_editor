import "package:mobx/mobx.dart";
import "../../../../../../core/constants/extensions/number_extensions.dart";

import "../model/fiyat_gor_model.dart";

part "fiyat_gor_view_model.g.dart";

class FiyatGorViewModel = _FiyatGorViewModelBase with _$FiyatGorViewModel;

abstract class _FiyatGorViewModelBase with Store {
  @observable
  List<FiyatGorModel?>? modelList;

  @action
  void setModelList(List<FiyatGorModel?>? modelList) => this.modelList = modelList;

  final List<String> titleList = ["Döviz Fiyatı", "Fiyat 1", "Fiyat 2", "Fiyat 3", "Fiyat 4"];

  @action
  String? getBilgi(int index, {bool isSatis = false}) {
    switch (index) {
      case 0:
        return isSatis ? modelList?.last?.dovizTipi?.commaSeparatedWithFixedDigits : modelList?.first?.dovizTipi.commaSeparatedWithFixedDigits;
      case 1:
        return isSatis ? modelList?.last?.fiyat1.commaSeparatedWithFixedDigits : modelList?.first?.fiyat1.commaSeparatedWithFixedDigits;
      case 2:
        return isSatis ? modelList?.last?.fiyat2.commaSeparatedWithFixedDigits : modelList?.first?.fiyat2.commaSeparatedWithFixedDigits;
      case 3:
        return isSatis ? modelList?.last?.fiyat3.commaSeparatedWithFixedDigits : modelList?.first?.fiyat3.commaSeparatedWithFixedDigits;
      case 4:
        return isSatis ? modelList?.last?.fiyat4.commaSeparatedWithFixedDigits : modelList?.first?.fiyat4.commaSeparatedWithFixedDigits;
      default:
        return null;
    }
  }
}
