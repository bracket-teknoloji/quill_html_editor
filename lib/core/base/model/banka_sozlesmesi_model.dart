import "package:freezed_annotation/freezed_annotation.dart";

import "base_network_mixin.dart";

part "banka_sozlesmesi_model.freezed.dart";
part "banka_sozlesmesi_model.g.dart";

@unfreezed
sealed class BankaSozlesmesiModel with _$BankaSozlesmesiModel, NetworkManagerMixin {
  factory BankaSozlesmesiModel({
    String? sozlesmeKodu,
    String? sozlesmeAdi,
    String? krediKartiTanimi,
    String? bankaTanimi,
    DateTime? baslamaTarihi,
    DateTime? bitisTarihi,
    int? taksitBitis,
  }) = _BankaSozlesmesiModel;
  BankaSozlesmesiModel._();

  factory BankaSozlesmesiModel.fromJson(Map<String, dynamic> json) => _$BankaSozlesmesiModelFromJson(json);

  @override
  BankaSozlesmesiModel fromJson(Map<String, dynamic> json) => _$BankaSozlesmesiModelFromJson(json);
}
