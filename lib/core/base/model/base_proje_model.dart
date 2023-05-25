import 'package:json_annotation/json_annotation.dart';
import 'package:picker/core/base/model/base_network_mixin.dart';

part 'base_proje_model.g.dart';

@JsonSerializable(createToJson: true, fieldRename: FieldRename.screamingSnake, includeIfNull: false)
class BaseProjeModel with NetworkManagerMixin {
  String? projeKodu;
  String? projeAciklama;
  String? aktif;
  @override
  fromJson(Map<String, dynamic> json) {
    return _$BaseProjeModelFromJson(json);
  }

  @override
  Map<String, dynamic> toJson() {
    return _$BaseProjeModelToJson(this);
  }
}
