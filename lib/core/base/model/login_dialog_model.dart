import "package:hive_flutter/hive_flutter.dart";

import "../../../view/add_company/model/account_response_model.dart";

part "login_dialog_model.g.dart";

@HiveType(typeId: 68)
class LoginDialogModel {
  @HiveField(0)
  AccountResponseModel? account;
  @HiveField(1)
  String? username;
  @HiveField(2)
  String? password;

  LoginDialogModel(
      {required this.account, required this.username, required this.password});
}
