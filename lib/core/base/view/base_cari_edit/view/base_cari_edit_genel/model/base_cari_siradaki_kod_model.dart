import 'package:json_annotation/json_annotation.dart';
import 'package:picker/core/base/model/base_network_mixin.dart';

part 'base_cari_siradaki_kod_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.screamingSnake, createToJson: true)
class BaseCariEditSiradakiKodModel with NetworkManagerMixin {
  BaseCariEditSiradakiKodModel();
  String? siradakiKod;

  @override
  fromJson(Map<String, dynamic> json) {
    return _$BaseCariEditSiradakiKodModelFromJson(json);
  }

  @override
  Map<String, dynamic> toJson() {
    return _$BaseCariEditSiradakiKodModelToJson(this);
  }
}
