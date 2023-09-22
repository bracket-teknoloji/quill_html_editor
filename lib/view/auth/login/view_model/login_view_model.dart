import "package:mobx/mobx.dart";
import "package:picker/view/add_company/model/account_model.dart";

part "login_view_model.g.dart";

class LoginViewModel = _LoginViewModelBase with _$LoginViewModel;

abstract class _LoginViewModelBase with Store {
  @observable
  bool showPassword = false;

  @observable
  bool isDebug = AccountModel.instance.uyeEmail == "destek@netfect.com";

  @action
  void checkDebug() {
    isDebug = AccountModel.instance.uyeEmail == "destek@netfect.com";
  }

  @action
  void changeShowPassword() {
    showPassword = !showPassword;
  }
}
