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
  baslamaTarihi: json['BASLAMA_TARIHI'] == null
      ? null
      : DateTime.parse(json['BASLAMA_TARIHI'] as String),
  bitisTarihi: json['BITIS_TARIHI'] == null
      ? null
      : DateTime.parse(json['BITIS_TARIHI'] as String),
  taksitBitis: (json['TAKSIT_BITIS'] as num?)?.toInt(),
);

Map<String, dynamic> _$BankaSozlesmesiModelToJson(
  _BankaSozlesmesiModel instance,
) => <String, dynamic>{
  'SOZLESME_KODU': ?instance.sozlesmeKodu,
  'SOZLESME_ADI': ?instance.sozlesmeAdi,
  'KREDI_KARTI_TANIMI': ?instance.krediKartiTanimi,
  'BANKA_TANIMI': ?instance.bankaTanimi,
  'BASLAMA_TARIHI': ?instance.baslamaTarihi?.toIso8601String(),
  'BITIS_TARIHI': ?instance.bitisTarihi?.toIso8601String(),
  'TAKSIT_BITIS': ?instance.taksitBitis,
};
