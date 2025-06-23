import "package:json_annotation/json_annotation.dart";

import "base_network_mixin.dart";

part "base_pdf_model.g.dart";

@JsonSerializable()
final class BasePdfModel with NetworkManagerMixin {
  BasePdfModel({
    this.byteData,
    this.uzanti,
    this.reportWidth,
    this.reportHeight,
    this.dosyaAdi,
    this.fromMemory = false,
  });
  String? byteData;
  String? uzanti;
  double? reportWidth;
  double? reportHeight;
  String? dosyaAdi;
  bool? fromMemory;

  @override
  BasePdfModel fromJson(Map<String, dynamic> json) => _$BasePdfModelFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$BasePdfModelToJson(this);
}
