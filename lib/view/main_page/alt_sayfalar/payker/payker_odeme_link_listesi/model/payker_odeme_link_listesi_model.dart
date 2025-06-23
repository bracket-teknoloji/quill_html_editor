// To parse this JSON data, do
//
//     final paykerOdemeLinkListesiModel = paykerOdemeLinkListesiModelFromJson(jsonString);

import "package:freezed_annotation/freezed_annotation.dart";
import "package:picker/core/base/model/base_network_mixin.dart";

part "payker_odeme_link_listesi_model.freezed.dart";
part "payker_odeme_link_listesi_model.g.dart";

@freezed
@JsonSerializable()
final class PaykerOdemeLinkListesiModel with _$PaykerOdemeLinkListesiModel, NetworkManagerMixin {
  PaykerOdemeLinkListesiModel({
    this.id,
    this.guid,
    this.firmaId,
    this.bayiId,
    this.tutar,
    this.email,
    this.unvan,
    this.alindi,
    this.bittar,
    this.taksitlerJson,
    this.kullanimSayisi,
    this.odemeler,
    this.silindi,
    this.kayittarihi,
    this.kayityapankul,
    this.duzeltmetarihi,
    this.duzeltmeyapankul,
  });
  factory PaykerOdemeLinkListesiModel.fromJson(Map<String, dynamic> json) =>
      _$PaykerOdemeLinkListesiModelFromJson(json);

  @override
  final int? id;
  @override
  final String? guid;
  @override
  final int? firmaId;
  @override
  final dynamic bayiId;
  @override
  final int? tutar;
  @override
  final String? email;
  @override
  final String? unvan;
  @override
  final bool? alindi;
  @override
  final DateTime? bittar;
  @override
  final String? taksitlerJson;
  @override
  final dynamic kullanimSayisi;
  @override
  final List<Odemeler>? odemeler;
  @override
  final dynamic silindi;
  @override
  final DateTime? kayittarihi;
  @override
  final String? kayityapankul;
  @override
  final DateTime? duzeltmetarihi;
  @override
  final String? duzeltmeyapankul;

  @override
  NetworkManagerMixin? fromJson(Map<String, dynamic> json) => PaykerOdemeLinkListesiModel.fromJson(json);

  @override
  Map<String, dynamic> toJson() => _$PaykerOdemeLinkListesiModelToJson(this);
}

@freezed
sealed class Odemeler with _$Odemeler {
  const factory Odemeler({
    int? id,
    int? firmaId,
    String? kartIsim,
    String? kartNo,
    int? tutar,
    dynamic aciklama,
    String? odemeTuru,
    String? ipAdres,
    int? bankaId,
    dynamic bayiId,
    String? durum,
    dynamic durumKodu,
    String? durumAciklama,
    String? odemelinkId,
    String? responsedata,
    dynamic requestdata,
    String? belgeNo,
    String? siparisNo,
    dynamic banka,
    dynamic bayi,
    dynamic firma,
    dynamic silindi,
    DateTime? kayittarihi,
    String? kayityapankul,
    DateTime? duzeltmetarihi,
    String? duzeltmeyapankul,
  }) = _Odemeler;

  factory Odemeler.fromJson(Map<String, dynamic> json) => _$OdemelerFromJson(json);
}
