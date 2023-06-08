import 'package:mobx/mobx.dart';

part 'rapor_filtre_date_time_bottom_sheet_view_model.g.dart';

class RaporFiltreDateTimeBottomSheetViewModel = _RaporFiltreDateTimeBottomSheetViewModelBase with _$RaporFiltreDateTimeBottomSheetViewModel;

abstract class _RaporFiltreDateTimeBottomSheetViewModelBase with Store {
  static int getGroupValue = 0;
  
  @computed
  int get groupValue => getGroupValue;

  @action
  void changeGroupValue(int value) => getGroupValue = value;

  @action
  void resetGroupValue() => getGroupValue = 0;

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
}
