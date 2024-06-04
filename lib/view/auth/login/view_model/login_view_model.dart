import "package:mobx/mobx.dart";

import "../../../add_company/model/account_model.dart";

part "login_view_model.g.dart";

class LoginViewModel = _LoginViewModelBase with _$LoginViewModel;

abstract class _LoginViewModelBase with Store {
  @observable
  bool obscurePassword = true;

  @observable
  bool isDebug = AccountModel.instance.uyeEmail == "destek@netfect.com";

  @observable
  String baglantiTipi = "Uzak";

  @action
  void changeBaglantiTipi(bool value) {
    if (value) {
      baglantiTipi = "Uzak";
    } else {
      baglantiTipi = "Yerel";
    }
  }

  @action
  void checkDebug() {
    isDebug = AccountModel.instance.isDebug;
  }

  @action
  void changeShowPassword() {
    obscurePassword = !obscurePassword;
  }
}
