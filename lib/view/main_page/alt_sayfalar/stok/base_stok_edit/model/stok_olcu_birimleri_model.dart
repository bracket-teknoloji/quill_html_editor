import "package:json_annotation/json_annotation.dart";

import "../../../../../../core/base/model/base_network_mixin.dart";

part "stok_olcu_birimleri_model.g.dart";

@JsonSerializable()
class StokOlcuBirimleriModel with NetworkManagerMixin {
  int? birimNo;
  String? olcuBirimi;

  @override
  fromJson(Map<String, dynamic> json) => _$StokOlcuBirimleriModelFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$StokOlcuBirimleriModelToJson(this);
}
