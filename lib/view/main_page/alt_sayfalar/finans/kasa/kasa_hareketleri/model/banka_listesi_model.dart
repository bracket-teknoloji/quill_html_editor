import "package:freezed_annotation/freezed_annotation.dart";

part "banka_listesi_model.freezed.dart";
part "banka_listesi_model.g.dart";

@freezed
class BankaListesiModel with _$BankaListesiModel {
  const factory BankaListesiModel({
    String? bankaKodu,
    String? bankasubeKodu,
    String? hesapKodu,
    String? hesapAdi,
    String? muhasebeHesapTipi,
    String? hesapNo,
    String? ibanNo,
    String? kilit,
    int? hesapTipi,
    String? hesapTipiAdi,
    int? dovizTipi,
    double? borcToplami,
    double? alacakToplami,
    double? dovizborcToplami,
    double? dovizalacakToplami,
    String? dovizAdi,
    String? bankaAdi,
    String? subeAdi,
    String? baglihesapKodu,
  }) = _BankaListesiModel;

  factory BankaListesiModel.fromJson(Map<String, dynamic> json) => _$BankaListesiModelFromJson(json);
}
