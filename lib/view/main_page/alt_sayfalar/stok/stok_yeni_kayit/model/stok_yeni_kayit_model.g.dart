// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stok_yeni_kayit_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$StokYeniKayitModelImpl _$$StokYeniKayitModelImplFromJson(Map<String, dynamic> json) => _$StokYeniKayitModelImpl(
      aciklama: json['ACIKLAMA'] as String?,
      belgeNo: json['BELGE_NO'] as String?,
      gc: json['GC'] as String?,
      guid: json['GUID'] as String?,
      hesapKodu: json['HESAP_KODU'] as String?,
      hesapTipi: json['HESAP_TIPI'] as String?,
      kasaKodu: json['KASA_KODU'] as String?,
      pickerBelgeTuru: json['PickerBelgeTuru'] as String?,
      plasiyerKodu: json['PLASIYER_KODU'] as String?,
      projeKodu: json['PROJE_KODU'] as String?,
      tag: json['TAG'] as String?,
      tahsilatmi: json['TAHSILATMI'] as bool?,
      tarih: json['TARIH'] == null ? null : DateTime.parse(json['TARIH'] as String),
      tutar: (json['TUTAR'] as num?)?.toDouble(),
      stokKodu: json['STOK_KODU'] as String?,
      depoKodu: json['DEPO_KODU'] as int?,
      hareketTuru: json['HAREKET_TURU'] as String?,
      miktar: json['MIKTAR'] as int?,
      fiyat: json['FIYAT'] as int?,
      dovizTutari: (json['DOVIZ_TUTARI'] as num?)?.toDouble(),
      dovizTipi: json['DOVIZ_TIPI'] as int?,
      yeniKayit: json['_YeniKayit'] as bool?,
    );

Map<String, dynamic> _$$StokYeniKayitModelImplToJson(_$StokYeniKayitModelImpl instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ACIKLAMA', instance.aciklama);
  writeNotNull('BELGE_NO', instance.belgeNo);
  writeNotNull('GC', instance.gc);
  writeNotNull('GUID', instance.guid);
  writeNotNull('HESAP_KODU', instance.hesapKodu);
  writeNotNull('HESAP_TIPI', instance.hesapTipi);
  writeNotNull('KASA_KODU', instance.kasaKodu);
  writeNotNull('PickerBelgeTuru', instance.pickerBelgeTuru);
  writeNotNull('PLASIYER_KODU', instance.plasiyerKodu);
  writeNotNull('PROJE_KODU', instance.projeKodu);
  writeNotNull('TAG', instance.tag);
  writeNotNull('TAHSILATMI', instance.tahsilatmi);
  writeNotNull('TARIH', instance.tarih?.toIso8601String());
  writeNotNull('TUTAR', instance.tutar);
  writeNotNull('STOK_KODU', instance.stokKodu);
  writeNotNull('DEPO_KODU', instance.depoKodu);
  writeNotNull('HAREKET_TURU', instance.hareketTuru);
  writeNotNull('MIKTAR', instance.miktar);
  writeNotNull('FIYAT', instance.fiyat);
  writeNotNull('DOVIZ_TUTARI', instance.dovizTutari);
  writeNotNull('DOVIZ_TIPI', instance.dovizTipi);
  writeNotNull('_YeniKayit', instance.yeniKayit);
  return val;
}
