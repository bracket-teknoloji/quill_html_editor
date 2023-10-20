import "package:mobx/mobx.dart";

import "../view/toggle_button.dart";

part "toggle_button_view_model.g.dart";

class ToggleButtonViewModel = _ToggleButtonViewModelBase with _$ToggleButtonViewModel;

abstract class _ToggleButtonViewModelBase with Store {
  final List<String> title = <String>["Tümü", "Tahsil Edilecek", "Ödeme Yapılacak", "Sıfır Bakiye", "Bakiyeli"];
  @observable
  ObservableList<bool> isSelected = <bool>[false, false, false, false, false].asObservable();

  @action
  void initializeIsSelected() {
    for (int i = 0; i < isSelected.length; i++) {
      if (title[i] == ToggleButton.selected) {
        isSelected[i] = true;
      }
    }
    if (ToggleButton.selected == "" || ToggleButton.selected == "Tümü") {
      isSelected = <bool>[true, false, false, false, false].asObservable();
    }
  }

  @action
  void changeIsSelected(int index) {
    for (int i = 0; i < isSelected.length; i++) {
      isSelected[i] = i == index;
    }
  }

  @action
  void resetSelectedList() {
    isSelected = <bool>[true, false, false, false, false].asObservable();
  }
}
