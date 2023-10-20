import "package:json_annotation/json_annotation.dart";

import "../../base/model/base_network_mixin.dart";

part "logout_model.g.dart";

@JsonSerializable()
class LogoutModel with NetworkManagerMixin {
  @JsonKey(name: "Success")
  String? succes;
  @JsonKey(name: "Message")
  String? message;
  LogoutModel();

  @override
  fromJson(Map<String, dynamic> json) => _$LogoutModelFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$LogoutModelToJson(this);
}
