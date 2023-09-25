import "package:mobx/mobx.dart";
import "package:picker/core/init/network/network_manager.dart";
import "package:picker/view/add_company/model/account_model.dart";

part "login_view_model.g.dart";

class LoginViewModel = _LoginViewModelBase with _$LoginViewModel;

abstract class _LoginViewModelBase with Store {
  @observable
  bool obscurePassword = true;

  @observable
  bool isDebug = AccountModel.instance.uyeEmail == "destek@netfect.com";

  @observable
  String baseUrl = "";

  @action
  void checkDebug() {
    isDebug = AccountModel.instance.isDebug;
    baseUrl = NetworkManager().getBaseUrl;
  }

  @action
  void changeShowPassword() {
    obscurePassword = !obscurePassword;
  }
}
