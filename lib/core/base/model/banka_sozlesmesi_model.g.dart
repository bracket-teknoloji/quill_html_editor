// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'banka_sozlesmesi_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BankaSozlesmesiModelImpl _$$BankaSozlesmesiModelImplFromJson(
        Map<String, dynamic> json) =>
    _$BankaSozlesmesiModelImpl(
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
    );

Map<String, dynamic> _$$BankaSozlesmesiModelImplToJson(
    _$BankaSozlesmesiModelImpl instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('SOZLESME_KODU', instance.sozlesmeKodu);
  writeNotNull('SOZLESME_ADI', instance.sozlesmeAdi);
  writeNotNull('KREDI_KARTI_TANIMI', instance.krediKartiTanimi);
  writeNotNull('BANKA_TANIMI', instance.bankaTanimi);
  writeNotNull('BASLAMA_TARIHI', instance.baslamaTarihi?.toIso8601String());
  writeNotNull('BITIS_TARIHI', instance.bitisTarihi?.toIso8601String());
  return val;
}
