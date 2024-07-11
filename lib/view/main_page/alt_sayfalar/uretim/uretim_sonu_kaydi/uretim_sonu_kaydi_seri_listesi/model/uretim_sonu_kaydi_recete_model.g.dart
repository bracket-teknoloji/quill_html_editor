// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'uretim_sonu_kaydi_recete_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UskReceteModelImpl _$$UskReceteModelImplFromJson(Map<String, dynamic> json) =>
    _$UskReceteModelImpl(
      mamulKodu: json['MAMUL_KODU'] as String?,
      stokKodu: json['STOK_KODU'] as String?,
      stokAdi: json['STOK_ADI'] as String?,
      sonOperasyon: json['SON_OPERASYON'] as String?,
      ob: json['OB'] as String?,
      miktar: (json['MIKTAR'] as num?)?.toDouble(),
      cikistaSeri: json['CIKISTA_SERI'] as String?,
      seriMiktarKadar: json['SERI_MIKTAR_KADAR'] as String?,
      seriBakiyeKontrol: json['SERI_BAKIYE_KONTROL'] as String?,
      seriCikistaOtomatik: json['SERI_CIKISTA_OTOMATIK'] as String?,
      seriGiristeOtomatik: json['SERI_GIRISTE_OTOMATIK'] as String?,
      sira: json['SIRA'] as String?,
      otorec: json['OTOREC'] as String?,
      seriList: (json['SERI_LIST'] as List<dynamic>?)
          ?.map((e) => SeriList.fromJson(e as Map<String, dynamic>))
          .toList(),
      giristeSeri: json['GIRISTE_SERI'] as String?,
    );

Map<String, dynamic> _$$UskReceteModelImplToJson(
    _$UskReceteModelImpl instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('MAMUL_KODU', instance.mamulKodu);
  writeNotNull('STOK_KODU', instance.stokKodu);
  writeNotNull('STOK_ADI', instance.stokAdi);
  writeNotNull('SON_OPERASYON', instance.sonOperasyon);
  writeNotNull('OB', instance.ob);
  writeNotNull('MIKTAR', instance.miktar);
  writeNotNull('CIKISTA_SERI', instance.cikistaSeri);
  writeNotNull('SERI_MIKTAR_KADAR', instance.seriMiktarKadar);
  writeNotNull('SERI_BAKIYE_KONTROL', instance.seriBakiyeKontrol);
  writeNotNull('SERI_CIKISTA_OTOMATIK', instance.seriCikistaOtomatik);
  writeNotNull('SERI_GIRISTE_OTOMATIK', instance.seriGiristeOtomatik);
  writeNotNull('SIRA', instance.sira);
  writeNotNull('OTOREC', instance.otorec);
  writeNotNull('SERI_LIST', instance.seriList?.map((e) => e.toJson()).toList());
  writeNotNull('GIRISTE_SERI', instance.giristeSeri);
  return val;
}
