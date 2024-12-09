import "package:mobx/mobx.dart";
import "package:picker/view/add_company/model/account_response_model.dart";

part "splash_auth_view_model.g.dart";

class SplashAuthViewModel = _SplashAuthViewModelBase with _$SplashAuthViewModel;

abstract class _SplashAuthViewModelBase with Store {
  @observable
  String title = "Uygulama başlatılıyor...";

  @action
  void setTitle(String value) => title = value;

  @observable
  bool isError = false;

  @observable
  AccountResponseModel? accountResponseModel;

  @action
  void setAccountResponseModel(AccountResponseModel? value) => accountResponseModel = value;

  @action
  void setIsError(bool value) => isError = value;
}
