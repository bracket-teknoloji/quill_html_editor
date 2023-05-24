import 'package:json_annotation/json_annotation.dart';
import 'package:picker/core/base/model/base_network_mixin.dart';

part 'base_edit_siradaki_kod_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.screamingSnake, createToJson: true)
class BaseEditSiradakiKodModel with NetworkManagerMixin {
  BaseEditSiradakiKodModel();
  String? siradakiKod;

  @override
  fromJson(Map<String, dynamic> json) {
    return _$BaseEditSiradakiKodModelFromJson(json);
  }

  @override
  Map<String, dynamic> toJson() {
    return _$BaseEditSiradakiKodModelToJson(this);
  }
}
