import "package:mobx/mobx.dart";
part "splash_auth_view_model.g.dart";

class SplashAuthViewModel = _SplashAuthViewModelBase with _$SplashAuthViewModel;

abstract class _SplashAuthViewModelBase with Store {
  @observable
  String title = "Giriş Yapılıyor...";

  @action
  void setTitle(String value) => title = value;

  @observable
  bool isError = false;

  @action
  void setIsError(bool value) => isError = value;
}