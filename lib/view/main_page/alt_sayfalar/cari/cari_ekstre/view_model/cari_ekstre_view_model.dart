import 'package:mobx/mobx.dart';
import 'package:picker/core/constants/extensions/number_extensions.dart';

import '../../../../../../core/base/view/pdf_viewer/model/pdf_viewer_model.dart';

part 'cari_ekstre_view_model.g.dart';

class CariEkstreViewModel = _CariEkstreViewModelBase with _$CariEkstreViewModel;

abstract class _CariEkstreViewModelBase with Store {
  @observable
  int groupValue = 0;

  @action
  void changeGroupValue(int value) => groupValue = value;

  @observable
  String? dovizValue;

  @action
  void changeDovizValue(String value) => dovizValue = value;
  @observable
  PdfModel pdfModel = PdfModel(raporOzelKod: "Rapor_CariEkstre", standart: true, dicParams: DicParams());

  @action
  void changeCariKodu(value)=> pdfModel.dicParams!.cariKodu = value;

  @action
  void changeDovizTipi(int value)=> pdfModel.dicParams!.dovizTipi = value.toStringIfNull;
  @observable
  ObservableFuture<bool?> futureController = ObservableFuture(Future.error(false));

  @action
  void setFuture() => futureController = ObservableFuture.value(true);

  @action
  void resetFuture() => futureController = ObservableFuture.value(false);

  final List<String> childrenTitleList = ["Tümü", "Bugün", "Dün", "Bu Hafta", "Bu Ay", "Geçen Ay", "Son 3 Ay", "Bu Yıl", "Geçen Yıl"];

  Map<String, DateTime?> dateMap = {
    "Tümü": null,
    "Bugün": DateTime.now().subtract(const Duration(days: 0)),
    "Dün": DateTime.now().subtract(const Duration(days: 1)),
    "Bu Hafta": DateTime.now().subtract(const Duration(days: 7)),
    "Bu Ay": DateTime.now().subtract(const Duration(days: 30)),
    "Geçen Ay": DateTime.now().subtract(const Duration(days: 60)),
    "Son 3 Ay": DateTime.now().subtract(const Duration(days: 90)),
    "Bu Yıl": DateTime.now().subtract(const Duration(days: 365)),
    "Geçen Yıl": DateTime.now().subtract(const Duration(days: 730)),
  };

  @observable
  ObservableList<bool> selectedValueList = ObservableList.of([true, false, false, false, false, false, false, false, false, false]);

  @action
  void changeSelectedValue(int index) {
    selectedValueList = ObservableList.of([false, false, false, false, false, false, false, false, false, false]);
    if (selectedValueList[index] == false) {
      selectedValueList[index] = true;
    } else {
      selectedValueList[index] = true;
    }
  }
}
