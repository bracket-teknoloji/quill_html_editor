import "package:freezed_annotation/freezed_annotation.dart";

import "base_network_mixin.dart";

part "banka_hesaplari_model.freezed.dart";
part "banka_hesaplari_model.g.dart";

@unfreezed
class BankaHesaplariModel with _$BankaHesaplariModel, NetworkManagerMixin {
  BankaHesaplariModel._();
  factory BankaHesaplariModel({
    String? bankaKodu,
    String? bankasubeKodu,
    String? hesapKodu,
    String? hesapAdi,
    String? kilit,
    int? hesapTipi,
    String? hesapTipiAdi,
    int? dovizTipi,
    double? borcToplami,
    double? alacakToplami,
    double? dovizborcToplami,
    double? dovizalacakToplami,
    String? bankaAdi,
    String? subeAdi,
    String? baglihesapKodu,
    String? muhasebeHesapTipi,
    String? dovizAdi,
    String? hesapNo,
  }) = _BankaHesaplariModel;

  factory BankaHesaplariModel.fromJson(Map<String, dynamic> json) => _$BankaHesaplariModelFromJson(json);

  @override
  fromJson(Map<String, dynamic> json) => _$BankaHesaplariModelFromJson(json);
}
