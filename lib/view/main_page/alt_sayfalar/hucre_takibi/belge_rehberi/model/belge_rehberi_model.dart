import "package:freezed_annotation/freezed_annotation.dart";
import "package:picker/core/base/model/base_network_mixin.dart";

part "belge_rehberi_model.freezed.dart";
part "belge_rehberi_model.g.dart";

@freezed
class BelgeRehberiModel with _$BelgeRehberiModel, NetworkManagerMixin {
  BelgeRehberiModel._();
  factory BelgeRehberiModel({
    String? belgeNo,
    String? belgeTipi,
    String? cariKodu,
    String? cariAdi,
    DateTime? tarih,
    int? depoKodu,
    String? depoTanimi,
    double? kalemSayisi,
  }) = _BelgeRehberiModel;

  factory BelgeRehberiModel.fromJson(Map<String, dynamic> json) => _$BelgeRehberiModelFromJson(json);

  @override
  BelgeRehberiModel fromJson(Map<String, dynamic> json) => _$BelgeRehberiModelFromJson(json);
}
