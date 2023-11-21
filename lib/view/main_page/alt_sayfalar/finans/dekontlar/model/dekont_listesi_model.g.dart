// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dekont_listesi_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DekontListesiModelImpl _$$DekontListesiModelImplFromJson(
        Map<String, dynamic> json) =>
    _$DekontListesiModelImpl(
      inckeyno: json['INCKEYNO'] as int?,
      seri: json['SERI'] as String?,
      dekontNo: json['DEKONT_NO'] as int?,
      tarih: json['TARIH'] == null
          ? null
          : DateTime.parse(json['TARIH'] as String),
      kalemSayisi: json['KALEM_SAYISI'] as int?,
      borcToplami: (json['BORC_TOPLAMI'] as num?)?.toDouble(),
      seriAdi: json['SERI_ADI'] as String?,
    );

Map<String, dynamic> _$$DekontListesiModelImplToJson(
    _$DekontListesiModelImpl instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('INCKEYNO', instance.inckeyno);
  writeNotNull('SERI', instance.seri);
  writeNotNull('DEKONT_NO', instance.dekontNo);
  writeNotNull('TARIH', instance.tarih?.toIso8601String());
  writeNotNull('KALEM_SAYISI', instance.kalemSayisi);
  writeNotNull('BORC_TOPLAMI', instance.borcToplami);
  writeNotNull('SERI_ADI', instance.seriAdi);
  return val;
}
