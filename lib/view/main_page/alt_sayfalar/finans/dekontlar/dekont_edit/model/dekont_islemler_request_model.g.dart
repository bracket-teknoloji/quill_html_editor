// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dekont_islemler_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DekontIslemlerRequestModelImpl _$$DekontIslemlerRequestModelImplFromJson(
        Map<String, dynamic> json) =>
    _$DekontIslemlerRequestModelImpl(
      dekontIslemTuru: json['DEKONT_ISLEM_TURU'] as String?,
      dekontSeri: json['DEKONT_SERI'] as String?,
      guid: json['GUID'] as String?,
      kalemler: (json['KALEMLER'] as List<dynamic>?)
          ?.map((e) => DekontKalemler.fromJson(e as Map<String, dynamic>))
          .toList(),
      plasiyerKodu: json['PLASIYER_KODU'] as String?,
      projeKodu: json['PROJE_KODU'] as String?,
      tag: json['TAG'] as String? ?? "DekontModel",
      tarih: json['TARIH'] == null
          ? null
          : DateTime.parse(json['TARIH'] as String),
      yeniKayit: json['_YeniKayit'] as bool?,
      dekontNo: json['DEKONT_NO'] as int?,
    );

Map<String, dynamic> _$$DekontIslemlerRequestModelImplToJson(
    _$DekontIslemlerRequestModelImpl instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('DEKONT_ISLEM_TURU', instance.dekontIslemTuru);
  writeNotNull('DEKONT_SERI', instance.dekontSeri);
  writeNotNull('GUID', instance.guid);
  writeNotNull('KALEMLER', instance.kalemler?.map((e) => e.toJson()).toList());
  writeNotNull('PLASIYER_KODU', instance.plasiyerKodu);
  writeNotNull('PROJE_KODU', instance.projeKodu);
  writeNotNull('TAG', instance.tag);
  writeNotNull('TARIH', instance.tarih?.toIso8601String());
  writeNotNull('_YeniKayit', instance.yeniKayit);
  writeNotNull('DEKONT_NO', instance.dekontNo);
  return val;
}
