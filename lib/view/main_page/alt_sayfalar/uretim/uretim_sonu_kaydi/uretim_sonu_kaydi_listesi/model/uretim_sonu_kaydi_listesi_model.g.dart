// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'uretim_sonu_kaydi_listesi_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UretimSonuKaydiListesiModelImpl _$$UretimSonuKaydiListesiModelImplFromJson(
        Map<String, dynamic> json) =>
    _$UretimSonuKaydiListesiModelImpl(
      belgeNo: json['BELGE_NO'] as String?,
      tarih: json['TARIH'] == null
          ? null
          : DateTime.parse(json['TARIH'] as String),
      kalemSayisi: (json['KALEM_SAYISI'] as num?)?.toInt(),
      cikisDepo: (json['CIKIS_DEPO'] as num?)?.toInt(),
      girisDepo: (json['GIRIS_DEPO'] as num?)?.toInt(),
      stokKodu: json['STOK_KODU'] as String?,
      stokAdi: json['STOK_ADI'] as String?,
      miktar: (json['MIKTAR'] as num?)?.toDouble(),
      aciklama: json['ACIKLAMA'] as String?,
      miktar2: (json['MIKTAR2'] as num?)?.toInt(),
      yapkod: json['YAPKOD'] as String?,
      yapacik: json['YAPACIK'] as String?,
    );

Map<String, dynamic> _$$UretimSonuKaydiListesiModelImplToJson(
    _$UretimSonuKaydiListesiModelImpl instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('BELGE_NO', instance.belgeNo);
  writeNotNull('TARIH', instance.tarih?.toIso8601String());
  writeNotNull('KALEM_SAYISI', instance.kalemSayisi);
  writeNotNull('CIKIS_DEPO', instance.cikisDepo);
  writeNotNull('GIRIS_DEPO', instance.girisDepo);
  writeNotNull('STOK_KODU', instance.stokKodu);
  writeNotNull('STOK_ADI', instance.stokAdi);
  writeNotNull('MIKTAR', instance.miktar);
  writeNotNull('ACIKLAMA', instance.aciklama);
  writeNotNull('MIKTAR2', instance.miktar2);
  writeNotNull('YAPKOD', instance.yapkod);
  writeNotNull('YAPACIK', instance.yapacik);
  return val;
}
