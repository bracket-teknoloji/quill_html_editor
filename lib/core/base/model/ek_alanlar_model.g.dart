// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ek_alanlar_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EkAlanlarModelImpl _$$EkAlanlarModelImplFromJson(Map<String, dynamic> json) => _$EkAlanlarModelImpl(
  tabloAdi: json['TABLO_ADI'] as String?,
  alanKodu: json['ALAN_KODU'] as String?,
  alanAciklama: json['ALAN_ACIKLAMA'] as String?,
  zorunlu: json['ZORUNLU'] as String?,
  aktif: json['AKTIF'] as String?,
  sira: (json['SIRA'] as num?)?.toInt(),
  veriTipi: (json['VERI_TIPI'] as num?)?.toInt(),
  uzunluk: (json['UZUNLUK'] as num?)?.toInt(),
  componentTipi: (json['COMPONENT_TIPI'] as num?)?.toInt(),
  secimListesi: (json['SecimListesi'] as List<dynamic>?)?.map((e) => e as String).toList(),
  ondeger: json['ONDEGER'] as String?,
);

Map<String, dynamic> _$$EkAlanlarModelImplToJson(_$EkAlanlarModelImpl instance) => <String, dynamic>{
  if (instance.tabloAdi case final value?) 'TABLO_ADI': value,
  if (instance.alanKodu case final value?) 'ALAN_KODU': value,
  if (instance.alanAciklama case final value?) 'ALAN_ACIKLAMA': value,
  if (instance.zorunlu case final value?) 'ZORUNLU': value,
  if (instance.aktif case final value?) 'AKTIF': value,
  if (instance.sira case final value?) 'SIRA': value,
  if (instance.veriTipi case final value?) 'VERI_TIPI': value,
  if (instance.uzunluk case final value?) 'UZUNLUK': value,
  if (instance.componentTipi case final value?) 'COMPONENT_TIPI': value,
  if (instance.secimListesi case final value?) 'SecimListesi': value,
  if (instance.ondeger case final value?) 'ONDEGER': value,
};
