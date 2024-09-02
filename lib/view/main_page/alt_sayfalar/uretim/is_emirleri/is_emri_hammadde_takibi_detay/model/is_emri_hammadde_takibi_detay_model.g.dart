// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'is_emri_hammadde_takibi_detay_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$IsEmriHammaddeTakibiDetayModelImpl
    _$$IsEmriHammaddeTakibiDetayModelImplFromJson(Map<String, dynamic> json) =>
        _$IsEmriHammaddeTakibiDetayModelImpl(
          hamKodu: json['HAM_KODU'] as String?,
          hamAdi: json['HAM_ADI'] as String?,
          miktar: (json['MIKTAR'] as num?)?.toInt(),
          referanslar: (json['REFERANSLAR'] as List<dynamic>?)
              ?.map((e) => Referanslar.fromJson(e as Map<String, dynamic>))
              .toList(),
        );

Map<String, dynamic> _$$IsEmriHammaddeTakibiDetayModelImplToJson(
    _$IsEmriHammaddeTakibiDetayModelImpl instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('HAM_KODU', instance.hamKodu);
  writeNotNull('HAM_ADI', instance.hamAdi);
  writeNotNull('MIKTAR', instance.miktar);
  writeNotNull(
      'REFERANSLAR', instance.referanslar?.map((e) => e.toJson()).toList());
  return val;
}

_$ReferanslarImpl _$$ReferanslarImplFromJson(Map<String, dynamic> json) =>
    _$ReferanslarImpl(
      id: (json['ID'] as num?)?.toInt(),
      hammaddeNo: json['HAMMADDE_NO'] as String?,
      stokKodu: json['STOK_KODU'] as String?,
      stokAdi: json['STOK_ADI'] as String?,
      referansStokKodu: json['REFERANS_STOK_KODU'] as String?,
      referansStokAdi: json['REFERANS_STOK_ADI'] as String?,
    );

Map<String, dynamic> _$$ReferanslarImplToJson(_$ReferanslarImpl instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ID', instance.id);
  writeNotNull('HAMMADDE_NO', instance.hammaddeNo);
  writeNotNull('STOK_KODU', instance.stokKodu);
  writeNotNull('STOK_ADI', instance.stokAdi);
  writeNotNull('REFERANS_STOK_KODU', instance.referansStokKodu);
  writeNotNull('REFERANS_STOK_ADI', instance.referansStokAdi);
  return val;
}
