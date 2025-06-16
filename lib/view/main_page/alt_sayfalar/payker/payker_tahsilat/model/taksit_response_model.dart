// To parse this JSON data, do
//
//     final taksitResponseModel = taksitResponseModelFromJson(jsonString);

import "package:freezed_annotation/freezed_annotation.dart";
import "package:picker/core/base/model/base_network_mixin.dart";

part "taksit_response_model.freezed.dart";
part "taksit_response_model.g.dart";

@freezed
@JsonSerializable(fieldRename: FieldRename.screamingSnake)
class TaksitResponseModel with _$TaksitResponseModel, NetworkManagerMixin {
  const TaksitResponseModel({
    this.bankaId,
    this.bankaAdi,
    this.tutar,
    this.taksitler,
  });

  // factory TaksitResponseModel.fromJson(Map<String, dynamic> json) => _$TaksitResponseModelFromJson(json);
  @override
  final int? bankaId;
  @override
  final String? bankaAdi;
  @override
  final int? tutar;
  @override
  final List<Taksitler>? taksitler;

  @override
  TaksitResponseModel fromJson(Map<String, dynamic> json) => _$TaksitResponseModelFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$TaksitResponseModelToJson(this);
}

@freezed
@JsonSerializable(fieldRename: FieldRename.screamingSnake)
final class Taksitler with _$Taksitler, NetworkManagerMixin {
  const Taksitler({
    this.id,
    this.firmaId,
    this.bankaId,
    this.odemeMetni,
    this.taksit,
    this.ekstraTaksit,
    this.altLimit,
    this.vadeFarki,
    this.sira,
    this.banka,
    this.silindi,
    this.kayittarihi,
    this.kayityapankul,
    this.duzeltmetarihi,
    this.duzeltmeyapankul,
  });
  factory Taksitler.fromJson(Map<String, dynamic> json) => _$TaksitlerFromJson(json);

  @override
  final int? id;
  @override
  final int? firmaId;
  @override
  final int? bankaId;
  @override
  final String? odemeMetni;
  @override
  final int? taksit;
  @override
  final int? ekstraTaksit;
  @override
  final int? altLimit;
  @override
  final int? vadeFarki;
  @override
  final int? sira;
  @override
  final Banka? banka;
  @override
  final String? silindi;
  @override
  final DateTime? kayittarihi;
  @override
  final String? kayityapankul;
  @override
  final DateTime? duzeltmetarihi;
  @override
  final String? duzeltmeyapankul;

  double? vadeFarkliTaksitTutari(double? tutar) {
    if (tutar == null || vadeFarki == null) return null;
    // vade farkı yüzde olarak hesaplanıyor
    return (tutar * (1 + ((vadeFarki ?? 0) / 100))) / taksit!;
  }

  double? toplamVadeFarkliTaksitTutari(double? tutar) => (vadeFarkliTaksitTutari(tutar) ?? 0.0) * (taksit ?? 1);

  @override
  Map<String, dynamic> toJson() => _$TaksitlerToJson(this);

  @override
  Taksitler fromJson(Map<String, dynamic> json) => _$TaksitlerFromJson(json);
}

@freezed
sealed class Banka with _$Banka {
  @JsonSerializable(fieldRename: FieldRename.screamingSnake)
  const factory Banka({
    int? id,
    String? adi,
    String? odemeLink,
    String? logoUrl,
    // List<Sanalpos>? sanalpos,
    // List<dynamic>? bankaTaksitler,
    String? silindi,
    DateTime? kayittarihi,
    String? kayityapankul,
    DateTime? duzeltmetarihi,
    String? duzeltmeyapankul,
    
  }) = _Banka;

  factory Banka.fromJson(Map<String, dynamic> json) => _$BankaFromJson(json);
}

@freezed
sealed class Sanalpos with _$Sanalpos {
  @JsonSerializable(fieldRename: FieldRename.screamingSnake)
  const factory Sanalpos({
    int? id,
    int? bankaId,
    int? firmaId,
    String? merchantId,
    String? merchantUser,
    String? merchantPassword,
    String? terminalNo,
    String? storeKey,
    bool? aktifMi,
    bool? testMi,
    String? silindi,
    DateTime? kayittarihi,
    String? kayityapankul,
    DateTime? duzeltmetarihi,
    String? duzeltmeyapankul,
  }) = _Sanalpos;

  factory Sanalpos.fromJson(Map<String, dynamic> json) => _$SanalposFromJson(json);
}
