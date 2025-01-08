import "package:mobx/mobx.dart";

part "custom_text_field_view_model.g.dart";

final class CustomTextFieldViewModel = _CustomTextFieldViewModelBase with _$CustomTextFieldViewModel;

abstract class _CustomTextFieldViewModelBase with Store {
  @observable
  bool showClearButton = false;

  @action
  void setShowClearButton(bool value) => showClearButton = value;
}
