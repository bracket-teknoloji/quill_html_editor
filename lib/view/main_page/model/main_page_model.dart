import "dart:convert";
import "dart:developer";

import "package:hive_flutter/hive_flutter.dart";
import "package:json_annotation/json_annotation.dart";

import "../../../core/base/model/base_network_mixin.dart";
import "param_model.dart";
import "sirket_model.dart";
import "user_model/user_model.dart";

part "main_page_model.g.dart";

@JsonSerializable()
@HiveType(typeId: 100)
final class MainPageModel with NetworkManagerMixin {
  MainPageModel();
  @JsonKey(name: "UserModel")
  @HiveField(0)
  UserModel? userModel;
  @JsonKey(name: "ServiceVersion")
  @HiveField(1)
  String? serviceVersion;
  @JsonKey(name: "LangVersion")
  @HiveField(2)
  String? langVersion;
  @JsonKey(name: "SirketModel", fromJson: SirketModel.fromJson)
  @HiveField(3)
  SirketModel? sirketModel;
  // @JsonKey(name: "LangModel", fromJson: LangModel.fromJson)
  // LangModel? langModel;
  @JsonKey(name: "MenuList")
  @HiveField(5)
  List<String>? menuList;
  @JsonKey(name: "ParamModel", fromJson: ParamModel.fromJson)
  ParamModel? paramModel;

  @override
  MainPageModel fromJson(Map<String, dynamic> json) {
    log(jsonEncode(json));
    return _$MainPageModelFromJson(json);
  }

  @override
  Map<String, dynamic> toJson() => _$MainPageModelToJson(this);
}
