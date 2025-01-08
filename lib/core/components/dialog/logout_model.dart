import "package:json_annotation/json_annotation.dart";

import "../../base/model/base_network_mixin.dart";

part "logout_model.g.dart";

@JsonSerializable()
final class LogoutModel with NetworkManagerMixin {
  LogoutModel();
  @JsonKey(name: "Success")
  String? succes;
  @JsonKey(name: "Message")
  String? message;

  @override
  LogoutModel fromJson(Map<String, dynamic> json) => _$LogoutModelFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$LogoutModelToJson(this);
}
