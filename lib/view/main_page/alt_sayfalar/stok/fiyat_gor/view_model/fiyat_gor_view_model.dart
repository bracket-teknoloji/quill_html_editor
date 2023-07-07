import 'package:mobx/mobx.dart';
import 'package:picker/core/constants/extensions/number_extensions.dart';

import '../model/fiyat_gor_model.dart';

part 'fiyat_gor_view_model.g.dart';

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
        return isSatis ? modelList?.last?.dovizTipi.dotSeparatedWithFixedDigits : modelList?.first?.dovizTipi.dotSeparatedWithFixedDigits;
      case 1:
        return isSatis ? modelList?.last?.fiyat1.dotSeparatedWithFixedDigits : modelList?.first?.fiyat1.dotSeparatedWithFixedDigits;
      case 2:
        return isSatis ? modelList?.last?.fiyat2.dotSeparatedWithFixedDigits : modelList?.first?.fiyat2.dotSeparatedWithFixedDigits;
      case 3:
        return isSatis ? modelList?.last?.fiyat3.dotSeparatedWithFixedDigits : modelList?.first?.fiyat3.dotSeparatedWithFixedDigits;
      case 4:
        return isSatis ? modelList?.last?.fiyat4.dotSeparatedWithFixedDigits : modelList?.first?.fiyat4.dotSeparatedWithFixedDigits;
      default:
        return null;
    }
  }
}
