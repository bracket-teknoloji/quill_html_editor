import 'dart:convert';
import 'package:hive_flutter/hive_flutter.dart';
part 'login_model.g.dart';

@HiveType(typeId: 0)
class LoginAuth extends Object {
  @HiveField(0)
  String? accessToken;
  @HiveField(1)
  String? tokenType;
  @HiveField(2)
  int? expiresIn;
  @HiveField(3)
  Map<String, dynamic>? userJson;
  @HiveField(4)
  String? issued;
  @HiveField(5)
  String? expires;

  LoginAuth(
      {this.accessToken,
      this.tokenType,
      this.expiresIn,
      this.userJson,
      this.issued,
      this.expires});
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['access_token'] = accessToken;
    data['token_type'] = tokenType;
    data['expires_in'] = expiresIn;
    data['USER_JSON'] = userJson;
    data['.issued'] = issued;
    data['.expires'] = expires;
    return data;
  }

  LoginAuth.fromJson(Map<String, dynamic> json) {
    String encode = utf8.decode(base64.decode(json['USER_JSON']));
    userJson = jsonDecode(encode);
    accessToken = json['access_token'];
    tokenType = json['token_type'];
    expiresIn = json['expires_in'];
    issued = json['.issued'];
    expires = json['.expires'];
  }
  @override
  toString() =>
      "LoginAuth {\n accessToken: $accessToken,\n tokenType: $tokenType,\n expiresIn: $expiresIn,\n userJson: $userJson,\n issued: $issued,\n expires: $expires \n}";
}
