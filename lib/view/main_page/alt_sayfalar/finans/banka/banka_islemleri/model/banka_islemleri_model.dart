import "package:freezed_annotation/freezed_annotation.dart";

import "../../../../../../../core/base/model/base_network_mixin.dart";

part "banka_islemleri_model.freezed.dart";
part "banka_islemleri_model.g.dart";

@freezed
class BankaIslemleriModel with _$BankaIslemleriModel, NetworkManagerMixin {
  BankaIslemleriModel._();
  factory BankaIslemleriModel({
    int? inckeyno,
    String? netheskodu,
    DateTime? tarih,
    int? harturu,
    String? ba,
    double? tutar,
    String? belgeno,
    String? aciklama,
    String? entegrefkey,
    int? dovizTipi,
    double? dovizTutari,
    int? hareketTipi,
    String? hesapAdi,
    String? hareketAciklama,
    String? bankaKodu,
    String? bankaAdi,
    String? bankasubeKodu,
    String? subeAdi,
  }) = _BankaIslemleriModel;

  factory BankaIslemleriModel.fromJson(Map<String, dynamic> json) => _$BankaIslemleriModelFromJson(json);

  @override
  BankaIslemleriModel fromJson(Map<String, dynamic> json) => _$BankaIslemleriModelFromJson(json);
}
