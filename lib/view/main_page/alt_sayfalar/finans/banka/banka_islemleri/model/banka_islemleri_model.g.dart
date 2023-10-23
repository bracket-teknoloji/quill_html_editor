// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'banka_islemleri_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BankaIslemleriModelImpl _$$BankaIslemleriModelImplFromJson(Map<String, dynamic> json) => _$BankaIslemleriModelImpl(
      inckeyno: json['INCKEYNO'] as int?,
      netheskodu: json['NETHESKODU'] as String?,
      tarih: json['TARIH'] == null ? null : DateTime.parse(json['TARIH'] as String),
      harturu: json['HARTURU'] as int?,
      ba: json['BA'] as String?,
      tutar: (json['TUTAR'] as num?)?.toDouble(),
      belgeno: json['BELGENO'] as String?,
      aciklama: json['ACIKLAMA'] as String?,
      entegrefkey: json['ENTEGREFKEY'] as String?,
      dovizTipi: json['DOVIZ_TIPI'] as int?,
      dovizTutari: (json['DOVIZ_TUTARI'] as num?)?.toDouble(),
      hareketTipi: json['HAREKET_TIPI'] as int?,
      hesapAdi: json['HESAP_ADI'] as String?,
      hareketAciklama: json['HAREKET_ACIKLAMA'] as String?,
      bankaKodu: json['BANKA_KODU'] as String?,
      bankaAdi: json['BANKA_ADI'] as String?,
      bankasubeKodu: json['BANKASUBE_KODU'] as String?,
      subeAdi: json['SUBE_ADI'] as String?,
    );

Map<String, dynamic> _$$BankaIslemleriModelImplToJson(_$BankaIslemleriModelImpl instance) {
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
  writeNotNull('BELGENO', instance.belgeno);
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
  return val;
}
