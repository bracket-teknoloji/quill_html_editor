import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
part 'login_view_model.g.dart';

class LoginViewModel = _LoginViewModelBase with _$LoginViewModel;

abstract class _LoginViewModelBase with Store {
  @observable
  TextEditingController usernameController = TextEditingController();

  @observable
  TextEditingController passwordController = TextEditingController();

  @action
  String getUsername() => usernameController.text;

  
}