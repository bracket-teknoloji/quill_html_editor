

import 'package:hive_flutter/hive_flutter.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../../../../core/base/model/base_network_mixin.dart';

part 'cari_sehirler_model.g.dart';

@HiveType(typeId: 7)
@JsonSerializable(fieldRename: FieldRename.screamingSnake, createToJson: true)
class CariSehirlerModel with NetworkManagerMixin {
  @HiveField(0)
  String? sehirAdi;
  @override
  fromJson(Map<String, dynamic> json) {
    return _$CariSehirlerModelFromJson(json);
  }

  @override
  Map<String, dynamic> toJson() {
    return _$CariSehirlerModelToJson(this);
  }
}