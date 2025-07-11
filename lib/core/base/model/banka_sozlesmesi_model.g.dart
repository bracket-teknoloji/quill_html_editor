// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'banka_sozlesmesi_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_BankaSozlesmesiModel _$BankaSozlesmesiModelFromJson(
  Map<String, dynamic> json,
) => _BankaSozlesmesiModel(
  sozlesmeKodu: json['SOZLESME_KODU'] as String?,
  sozlesmeAdi: json['SOZLESME_ADI'] as String?,
  krediKartiTanimi: json['KREDI_KARTI_TANIMI'] as String?,
  bankaTanimi: json['BANKA_TANIMI'] as String?,
  baslamaTarihi: json['BASLAMA_TARIHI'] == null ? null : DateTime.parse(json['BASLAMA_TARIHI'] as String),
  bitisTarihi: json['BITIS_TARIHI'] == null ? null : DateTime.parse(json['BITIS_TARIHI'] as String),
  taksitBitis: (json['TAKSIT_BITIS'] as num?)?.toInt(),
);

Map<String, dynamic> _$BankaSozlesmesiModelToJson(
  _BankaSozlesmesiModel instance,
) => <String, dynamic>{
  if (instance.sozlesmeKodu case final value?) 'SOZLESME_KODU': value,
  if (instance.sozlesmeAdi case final value?) 'SOZLESME_ADI': value,
  if (instance.krediKartiTanimi case final value?) 'KREDI_KARTI_TANIMI': value,
  if (instance.bankaTanimi case final value?) 'BANKA_TANIMI': value,
  if (instance.baslamaTarihi?.toIso8601String() case final value?) 'BASLAMA_TARIHI': value,
  if (instance.bitisTarihi?.toIso8601String() case final value?) 'BITIS_TARIHI': value,
  if (instance.taksitBitis case final value?) 'TAKSIT_BITIS': value,
};
