import "package:mobx/mobx.dart";
import "package:picker/core/init/network/network_manager.dart";
import "package:picker/view/add_company/model/account_model.dart";
import "package:picker/view/add_company/model/account_response_model.dart";

import "../../../../core/init/cache/cache_manager.dart";

part "login_view_model.g.dart";

class LoginViewModel = _LoginViewModelBase with _$LoginViewModel;

abstract class _LoginViewModelBase with Store {
  @observable
  bool showPassword = false;

  @observable
  bool isDebug = AccountModel.instance.uyeEmail == "destek@netfect.com";

  @observable
  String baseUrl = "";

  @action
  void checkDebug() {
    isDebug = CacheManager.accountsBox.values.any((element) => (element as AccountResponseModel?)?.email == "destek@netfect.com");
    baseUrl = NetworkManager().getBaseUrl;
  }

  @action
  void changeShowPassword() {
    showPassword = !showPassword;
  }
}
