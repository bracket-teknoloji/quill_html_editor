import "package:json_annotation/json_annotation.dart";

import "base_network_mixin.dart";

part "base_pdf_model.g.dart";

@JsonSerializable(createToJson: true, fieldRename: FieldRename.screamingSnake, includeIfNull: false)
class BasePdfModel with NetworkManagerMixin {
  String? byteData;
  String? uzanti;
  double? reportWidth;
  double? reportHeight;

  @override
  fromJson(Map<String, dynamic> json) => _$BasePdfModelFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$BasePdfModelToJson(this);
}
