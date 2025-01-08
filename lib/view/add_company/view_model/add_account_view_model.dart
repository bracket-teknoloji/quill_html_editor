import "package:mobx/mobx.dart";

part "add_account_view_model.g.dart";

final class AddAccountViewModel = _AddAccountViewModelBase with _$AddAccountViewModel;

abstract class _AddAccountViewModelBase with Store {
  @observable
  bool obscurePassword = false;

  @action
  Future<void> togglePassword() async => obscurePassword = !obscurePassword;
}
