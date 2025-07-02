import "package:freezed_annotation/freezed_annotation.dart";
import "package:picker/core/base/model/base_network_mixin.dart";
import "package:picker/core/constants/enum/badge_color_enum.dart";
import "package:picker/view/main_page/alt_sayfalar/payker/payker_tahsilat/model/taksit_response_model.dart";

part "payker_odeme_listesi_model.freezed.dart";
part "payker_odeme_listesi_model.g.dart";

@freezed
@JsonSerializable()
final class BasePaykerOdemeListesiModel with _$BasePaykerOdemeListesiModel, NetworkManagerMixin {
  BasePaykerOdemeListesiModel({
    this.draw,
    this.recordsTotal,
    this.recordsFiltered,
    this.data,
  });
  factory BasePaykerOdemeListesiModel.fromJson(Map<String, dynamic> json) =>
      _$BasePaykerOdemeListesiModelFromJson(json);

  @override
  final int? draw;
  @override
  @JsonKey(name: "recordsTotal")
  final int? recordsTotal;
  @override
  @JsonKey(name: "recordsFiltered")
  final int? recordsFiltered;
  @override
  @JsonKey(name: "data")
  final List<PaykerOdemeListesiModel>? data;

  @override
  Map<String, dynamic> toJson() => _$BasePaykerOdemeListesiModelToJson(this);

  @override
  BasePaykerOdemeListesiModel fromJson(Map<String, dynamic> json) => BasePaykerOdemeListesiModel.fromJson(json);
}

@freezed
@JsonSerializable()
final class PaykerOdemeListesiModel with _$PaykerOdemeListesiModel, NetworkManagerMixin {
  PaykerOdemeListesiModel({
    this.id,
    this.firmaId,
    this.kartIsim,
    this.kartNo,
    this.enrollmentId,
    this.transactionId,
    this.tutar,
    this.aciklama,
    this.ipAdres,
    this.bankaId,
    this.bayiId,
    this.durum,
    this.durumKodu,
    this.durumAciklama,
    this.odemelinkId,
    this.responsedata,
    this.banka,
    this.bayi,
    this.firma,
    this.odemeLink,
    this.silindi,
    this.siparisNo,
    this.firmaKodu,
    this.kayittarihi,
    this.kayityapankul,
    this.duzeltmetarihi,
    this.duzeltmeyapankul,
    this.belgeNo,
    this.uygulama,
    this.platform,
    this.erpSirket,
    this.erpIsletmeKodu,
    this.alinmaTarihi,
    this.taksitSayisi,
  });

  factory PaykerOdemeListesiModel.fromJson(Map<String, dynamic> json) => _$PaykerOdemeListesiModelFromJson(json);

  @override
  PaykerOdemeListesiModel fromJson(Map<String, dynamic> json) => PaykerOdemeListesiModel.fromJson(json);

  @override
  Map<String, dynamic> toJson() => _$PaykerOdemeListesiModelToJson(this);
  @override
  @JsonKey(name: "ID")
  int? id;
  @override
  @JsonKey(name: "FIRMA_ID")
  int? firmaId;
  @override
  @JsonKey(name: "KART_ISIM")
  String? kartIsim;
  @override
  @JsonKey(name: "KART_NO")
  String? kartNo;
  @override
  @Deprecated("Use enrollmentId instead")
  @JsonKey(name: "ENROLLMENT_ID")
  String? enrollmentId;
  @override
  @JsonKey(name: "TRANSACTION_ID")
  String? transactionId;
  @override
  @JsonKey(name: "TUTAR")
  double? tutar;
  @override
  @JsonKey(name: "ACIKLAMA")
  String? aciklama;
  @override
  @JsonKey(name: "TAKSIT_SAYISI")
  int? taksitSayisi;
  @override
  @JsonKey(name: "IP_ADRES")
  String? ipAdres;
  @override
  @JsonKey(name: "BANKA_ID")
  int? bankaId;
  @override
  @JsonKey(name: "BAYI_ID")
  dynamic bayiId;
  @override
  @JsonKey(name: "DURUM")
  String? durum;
  @override
  @JsonKey(name: "DURUM_KODU")
  String? durumKodu;
  @override
  @JsonKey(name: "DURUM_ACIKLAMA")
  String? durumAciklama;
  @override
  @JsonKey(name: "ODEMELINK_ID")
  dynamic odemelinkId;
  @override
  @JsonKey(name: "RESPONSEDATA")
  String? responsedata;
  @override
  @JsonKey(name: "BANKA")
  Banka? banka;
  @override
  @JsonKey(name: "BAYI")
  dynamic bayi;
  @override
  @JsonKey(name: "FIRMA")
  dynamic firma;
  @override
  @JsonKey(name: "ODEME_LINK")
  dynamic odemeLink;
  @override
  @JsonKey(name: "SILINDI")
  dynamic silindi;
  @override
  @JsonKey(name: "KAYITTARIHI")
  DateTime? kayittarihi;
  @override
  @JsonKey(name: "KAYITYAPANKUL")
  dynamic kayityapankul;
  @override
  @JsonKey(name: "DUZELTMETARIHI")
  DateTime? duzeltmetarihi;
  @override
  @JsonKey(name: "DUZELTMEYAPANKUL")
  dynamic duzeltmeyapankul;
  @override
  @JsonKey(name: "SIPARIS_NO")
  String? siparisNo;
  @override
  @JsonKey(name: "FIRMA_KODU")
  String? firmaKodu;
  @override
  @JsonKey(name: "BELGE_NO")
  String? belgeNo;
  @override
  @JsonKey(name: "UYGULAMA")
  String? uygulama;
  @override
  @JsonKey(name: "PLATFORM")
  String? platform;
  @override
  @JsonKey(name: "ERP_SIRKET")
  String? erpSirket;
  @override
  @JsonKey(name: "ERP_ISLETME_KODU")
  int? erpIsletmeKodu;
  @override
  @JsonKey(name: "ALINMA_TARIHI")
  DateTime? alinmaTarihi;

  BadgeColorEnum get badgeColor => switch (durum) {
    "ONAYDA" => BadgeColorEnum.cari,
    "ALINDI" => BadgeColorEnum.basarili,
    "HATA" => BadgeColorEnum.hata,
    _ => BadgeColorEnum.kapali,
  };
}
