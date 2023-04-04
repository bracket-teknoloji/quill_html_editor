import 'package:json_annotation/json_annotation.dart';

import '../../../core/base/model/base_network_mixin.dart';
import 'lang_model.dart';
import 'param_model.dart';
import 'sirket_model.dart';
import 'user_model.dart';

part 'main_page_model.g.dart';

@JsonSerializable(createToJson: true)
class MainPageModel with NetworkManagerMixin {

  @JsonKey(name: "UserModel",
  )
  late final UserModel? userModel;
  @JsonKey(name: "ServiceVersion")
  late final String? serviceVersion;
  @JsonKey(name: "LangVersion")
  late final String? langVersion;
  @JsonKey(name: "SirketModel", fromJson: SirketModel.fromJson)
  late final SirketModel? sirketModel;
  @JsonKey(name: "LangModel", fromJson: LangModel.fromJson)
  late final LangModel? langModel;
  @JsonKey(name: "MenuList")
  late final List<String>? menuList;
  @JsonKey(name: "ParamModel", fromJson: ParamModel.fromJson)
  late final ParamModel? paramModel;
  MainPageModel();

  @override
  fromJson(Map<String, dynamic> json) {
    return _$MainPageModelFromJson(json);
  }
  @override 
  Map<String, dynamic> toJson() {
    return _$MainPageModelToJson(this);
  }

  @override
  String toString() {
    return toJson().toString();
  }
}
