import "package:freezed_annotation/freezed_annotation.dart";

import "base_network_mixin.dart";

part "seri_model.freezed.dart";
part "seri_model.g.dart";

@freezed
sealed class SeriModel with _$SeriModel, NetworkManagerMixin {
  factory SeriModel({
    String? seriNo,
    String? aciklama,
    String? stokKodu,
    String? stokAdi,
    int? depoKodu,
    int? miktar,
    String? depoTanimi,
  }) = _SeriModel;
  SeriModel._();

  factory SeriModel.fromJson(Map<String, dynamic> json) => _$SeriModelFromJson(json);

  @override
  SeriModel fromJson(Map<String, dynamic> json) => _$SeriModelFromJson(json);
}
