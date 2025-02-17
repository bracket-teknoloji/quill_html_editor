import "package:freezed_annotation/freezed_annotation.dart";

import "../../../../../../core/base/model/base_network_mixin.dart";

part "olcum_pdf_model.freezed.dart";
part "olcum_pdf_model.g.dart";

@freezed
class OlcumPdfModel with _$OlcumPdfModel, NetworkManagerMixin {
  factory OlcumPdfModel({String? stokKodu, String? yapkod, String? revno, DateTime? revtar, String? tur}) =
      _OlcumPdfModel;
  OlcumPdfModel._();

  factory OlcumPdfModel.fromJson(Map<String, dynamic> json) => _$OlcumPdfModelFromJson(json);

  @override
  OlcumPdfModel fromJson(Map<String, dynamic> json) => _$OlcumPdfModelFromJson(json);
}
