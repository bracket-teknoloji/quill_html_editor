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
  String? getBilgi(int index) {
    switch (index) {
      case 0:
        return modelList?.first?.dovizTipi.dotSeparatedWithFixedDigits;
      case 1:
        return modelList?.first?.fiyat1.dotSeparatedWithFixedDigits;
      case 2:
        return modelList?.first?.fiyat2.dotSeparatedWithFixedDigits;
      case 3:
        return modelList?.first?.fiyat3.dotSeparatedWithFixedDigits;
      case 4:
        return modelList?.first?.fiyat4.dotSeparatedWithFixedDigits;
      default:
        return null;
    }
  }
}
