// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'temsilci_profil_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TemsilciProfilModel _$TemsilciProfilModelFromJson(Map<String, dynamic> json) =>
    TemsilciProfilModel()
      ..tabloTipi = json['TABLO_TIPI'] as String?
      ..kayitTipi = json['KAYIT_TIPI'] as String?
      ..ayKodu = json['AY_KODU'] as int?
      ..plasiyerKodu = json['PLASIYER_KODU'] as String?
      ..plasiyerAciklama = json['PLASIYER_ACIKLAMA'] as String?
      ..tutar = (json['TUTAR'] as num?)?.toDouble();

Map<String, dynamic> _$TemsilciProfilModelToJson(TemsilciProfilModel instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('TABLO_TIPI', instance.tabloTipi);
  writeNotNull('KAYIT_TIPI', instance.kayitTipi);
  writeNotNull('AY_KODU', instance.ayKodu);
  writeNotNull('PLASIYER_KODU', instance.plasiyerKodu);
  writeNotNull('PLASIYER_ACIKLAMA', instance.plasiyerAciklama);
  writeNotNull('TUTAR', instance.tutar);
  return val;
}
