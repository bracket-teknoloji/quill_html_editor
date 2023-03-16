import 'package:hive_flutter/hive_flutter.dart';

part 'login_model.g.dart';

@HiveType(typeId: 0)
class LoginAuth {
  @HiveField(0)
  String? accessToken;
  @HiveField(1)
  String? tokenType;
  @HiveField(2)
  int? expiresIn;
  @HiveField(3)
  String? userJson;
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

  LoginAuth.fromJson(Map<String, dynamic> json) {
    accessToken = json['access_token'];
    tokenType = json['token_type'];
    expiresIn = json['expires_in'];
    userJson = json['USER_JSON'];
    issued = json['.issued'];
    expires = json['.expires'];
  }

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

  @override
  String toString() {
    return """
LoginAuth{accessToken: $accessToken,
tokenType: $tokenType,
expiresIn: $expiresIn,
userJson: $userJson,
issued: $issued,
expires: $expires}""";
  }
}
