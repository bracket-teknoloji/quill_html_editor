import "package:hive_flutter/hive_flutter.dart";
import "package:json_annotation/json_annotation.dart";

import "../../../core/base/model/base_network_mixin.dart";
import "user_json_model.dart";

part "login_model.g.dart";

@HiveType(typeId: 99)
@JsonSerializable(disallowUnrecognizedKeys: true)
class TokenModel with NetworkManagerMixin {
  @HiveField(0)
  @JsonKey(name: "access_token")
  String? accessToken;
  @HiveField(1)
  @JsonKey(name: "token_type")
  String? tokenType;
  @HiveField(2)
  @JsonKey(name: "expires_in")
  int? expiresIn;
  @HiveField(3)
  @JsonKey(required: false, name: "USER_JSON", fromJson: UserJson.fromJson)
  UserJson? userJson;
  @HiveField(4)
  @JsonKey(name: ".issued")
  String? issued;
  @HiveField(5)
  @JsonKey(name: ".expires")
  String? expires;
  @HiveField(6)
  @JsonKey(name: "error")
  String? error;
  @HiveField(7)
  @JsonKey(name: "error_description")
  String? errorDescription;

  TokenModel();
  
  @override
  fromJson(Map<String, dynamic> json) {
    return _$TokenModelFromJson(json);
  }

  @override
  Map<String, dynamic> toJson() {
    return _$TokenModelToJson(this);
  }
}
