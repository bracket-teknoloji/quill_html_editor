// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'banka_hareketleri_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BankaHareketleriModelImpl _$$BankaHareketleriModelImplFromJson(
        Map<String, dynamic> json) =>
    _$BankaHareketleriModelImpl(
      inckeyno: (json['INCKEYNO'] as num?)?.toInt(),
      netheskodu: json['NETHESKODU'] as String?,
      tarih: json['TARIH'] == null
          ? null
          : DateTime.parse(json['TARIH'] as String),
      harturu: (json['HARTURU'] as num?)?.toInt(),
      ba: json['BA'] as String?,
      tutar: (json['TUTAR'] as num?)?.toDouble(),
      aciklama: json['ACIKLAMA'] as String?,
      entegrefkey: json['ENTEGREFKEY'] as String?,
      dovizTipi: (json['DOVIZ_TIPI'] as num?)?.toInt(),
      dovizTutari: (json['DOVIZ_TUTARI'] as num?)?.toDouble(),
      hareketTipi: (json['HAREKET_TIPI'] as num?)?.toInt(),
      hesapAdi: json['HESAP_ADI'] as String?,
      hareketAciklama: json['HAREKET_ACIKLAMA'] as String?,
      bankaKodu: json['BANKA_KODU'] as String?,
      bankaAdi: json['BANKA_ADI'] as String?,
      bankasubeKodu: json['BANKASUBE_KODU'] as String?,
      subeAdi: json['SUBE_ADI'] as String?,
      belgeno: json['BELGENO'] as String?,
      dovizAdi: json['DOVIZ_ADI'] as String?,
    );

Map<String, dynamic> _$$BankaHareketleriModelImplToJson(
    _$BankaHareketleriModelImpl instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('INCKEYNO', instance.inckeyno);
  writeNotNull('NETHESKODU', instance.netheskodu);
  writeNotNull('TARIH', instance.tarih?.toIso8601String());
  writeNotNull('HARTURU', instance.harturu);
  writeNotNull('BA', instance.ba);
  writeNotNull('TUTAR', instance.tutar);
  writeNotNull('ACIKLAMA', instance.aciklama);
  writeNotNull('ENTEGREFKEY', instance.entegrefkey);
  writeNotNull('DOVIZ_TIPI', instance.dovizTipi);
  writeNotNull('DOVIZ_TUTARI', instance.dovizTutari);
  writeNotNull('HAREKET_TIPI', instance.hareketTipi);
  writeNotNull('HESAP_ADI', instance.hesapAdi);
  writeNotNull('HAREKET_ACIKLAMA', instance.hareketAciklama);
  writeNotNull('BANKA_KODU', instance.bankaKodu);
  writeNotNull('BANKA_ADI', instance.bankaAdi);
  writeNotNull('BANKASUBE_KODU', instance.bankasubeKodu);
  writeNotNull('SUBE_ADI', instance.subeAdi);
  writeNotNull('BELGENO', instance.belgeno);
  writeNotNull('DOVIZ_ADI', instance.dovizAdi);
  return val;
}
