class LoginAuth {
  String? accessToken;
  String? tokenType;
  int? expiresIn;
  String? userJson;
  String? issued;
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
}
