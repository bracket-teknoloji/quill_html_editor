// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'paket_icerigi_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PaketIcerigiModelImpl _$$PaketIcerigiModelImplFromJson(
        Map<String, dynamic> json) =>
    _$PaketIcerigiModelImpl(
      id: (json['ID'] as num?)?.toInt(),
      paketId: (json['PAKET_ID'] as num?)?.toInt(),
      paketKodu: json['PAKET_KODU'] as String?,
      depoKodu: (json['DEPO_KODU'] as num?)?.toInt(),
      depoAdi: json['DEPO_ADI'] as String?,
      stokKodu: json['STOK_KODU'] as String?,
      stokAdi: json['STOK_ADI'] as String?,
      miktar: (json['MIKTAR'] as num?)?.toDouble(),
      cikistaSeri: json['CIKISTA_SERI'] as String?,
      seriMiktarKadar: json['SERI_MIKTAR_KADAR'] as String?,
      seriBakiyeKontrol: json['SERI_BAKIYE_KONTROL'] as String?,
      seriCikistaOtomatik: json['SERI_CIKISTA_OTOMATIK'] as String?,
      seriList: (json['SERI_LIST'] as List<dynamic>?)
          ?.map((e) => SeriList.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$PaketIcerigiModelImplToJson(
    _$PaketIcerigiModelImpl instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ID', instance.id);
  writeNotNull('PAKET_ID', instance.paketId);
  writeNotNull('PAKET_KODU', instance.paketKodu);
  writeNotNull('DEPO_KODU', instance.depoKodu);
  writeNotNull('DEPO_ADI', instance.depoAdi);
  writeNotNull('STOK_KODU', instance.stokKodu);
  writeNotNull('STOK_ADI', instance.stokAdi);
  writeNotNull('MIKTAR', instance.miktar);
  writeNotNull('CIKISTA_SERI', instance.cikistaSeri);
  writeNotNull('SERI_MIKTAR_KADAR', instance.seriMiktarKadar);
  writeNotNull('SERI_BAKIYE_KONTROL', instance.seriBakiyeKontrol);
  writeNotNull('SERI_CIKISTA_OTOMATIK', instance.seriCikistaOtomatik);
  writeNotNull('SERI_LIST', instance.seriList?.map((e) => e.toJson()).toList());
  return val;
}
