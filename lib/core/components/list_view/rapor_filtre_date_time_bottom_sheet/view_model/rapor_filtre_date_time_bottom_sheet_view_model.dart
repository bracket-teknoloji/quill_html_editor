import "package:mobx/mobx.dart";

part "rapor_filtre_date_time_bottom_sheet_view_model.g.dart";

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
  ObservableList<bool> selectedValueList = ObservableList.of(
    [true, false, false, false, false, false, false, false, false, false],
  );

  @action
  void changeSelectedValue(int index) {
    selectedValueList = ObservableList.of(
      [false, false, false, false, false, false, false, false, false, false],
    );
    if (!selectedValueList[index]) {
      selectedValueList[index] = true;
    } else {
      selectedValueList[index] = true;
    }
  }

  final List<String> childrenTitleList = [
    "Tümü",
    "Bugün",
    "Dün",
    "Bu Hafta",
    "Bu Ay",
    "Geçen Ay",
    "Son 3 Ay",
    "Bu Yıl",
    "Geçen Yıl",
  ];

  final Map<String, DateTime?> startDateMap = {
    "Tümü": null,
    "Bugün": DateTime.now(),
    "Dün": DateTime.now().subtract(const Duration(days: 1)),
    "Bu Hafta": DateTime.now().subtract(Duration(days: DateTime.now().weekday - 1)),
    "Bu Ay": DateTime(DateTime.now().year, DateTime.now().month),
    "Geçen Ay": DateTime(DateTime.now().year, DateTime.now().month - 1),
    "Son 3 Ay": DateTime(DateTime.now().year, DateTime.now().month - 2),
    "Bu Yıl": DateTime(DateTime.now().year),
    "Geçen Yıl": DateTime(DateTime.now().year - 1),
  };
  final Map<String, DateTime?> finishDateMap = {
    "Tümü": null,
    "Bugün": DateTime.now(),
    "Dün": DateTime.now().subtract(const Duration(days: 1)),
    "Bu Hafta": DateTime.now(),
    "Bu Ay": DateTime.now(),
    "Geçen Ay": DateTime(DateTime.now().year, DateTime.now().month).subtract(const Duration(seconds: 1)),
    "Son 3 Ay": DateTime.now(),
    "Bu Yıl": DateTime.now(),
    "Geçen Yıl": DateTime(DateTime.now().year).subtract(const Duration(days: 1)),
  };
}
