// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ek_alanlar_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EkAlanlarModelImpl _$$EkAlanlarModelImplFromJson(Map<String, dynamic> json) =>
    _$EkAlanlarModelImpl(
      tabloAdi: json['TABLO_ADI'] as String?,
      alanKodu: json['ALAN_KODU'] as String?,
      alanAciklama: json['ALAN_ACIKLAMA'] as String?,
      zorunlu: json['ZORUNLU'] as String?,
      aktif: json['AKTIF'] as String?,
      sira: (json['SIRA'] as num?)?.toInt(),
      veriTipi: (json['VERI_TIPI'] as num?)?.toInt(),
      uzunluk: (json['UZUNLUK'] as num?)?.toInt(),
      componentTipi: (json['COMPONENT_TIPI'] as num?)?.toInt(),
      secimListesi: (json['SecimListesi'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      ondeger: json['ONDEGER'] as String?,
    );

Map<String, dynamic> _$$EkAlanlarModelImplToJson(
    _$EkAlanlarModelImpl instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('TABLO_ADI', instance.tabloAdi);
  writeNotNull('ALAN_KODU', instance.alanKodu);
  writeNotNull('ALAN_ACIKLAMA', instance.alanAciklama);
  writeNotNull('ZORUNLU', instance.zorunlu);
  writeNotNull('AKTIF', instance.aktif);
  writeNotNull('SIRA', instance.sira);
  writeNotNull('VERI_TIPI', instance.veriTipi);
  writeNotNull('UZUNLUK', instance.uzunluk);
  writeNotNull('COMPONENT_TIPI', instance.componentTipi);
  writeNotNull('SecimListesi', instance.secimListesi);
  writeNotNull('ONDEGER', instance.ondeger);
  return val;
}
