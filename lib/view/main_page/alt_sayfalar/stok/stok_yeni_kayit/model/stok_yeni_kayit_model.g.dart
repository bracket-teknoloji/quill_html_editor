// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stok_yeni_kayit_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_StokYeniKayitModel _$StokYeniKayitModelFromJson(Map<String, dynamic> json) =>
    _StokYeniKayitModel(
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
      tarih: json['TARIH'] == null
          ? null
          : DateTime.parse(json['TARIH'] as String),
      tutar: (json['TUTAR'] as num?)?.toDouble(),
      stokKodu: json['STOK_KODU'] as String?,
      depoKodu: (json['DEPO_KODU'] as num?)?.toInt(),
      hareketTuru: json['HAREKET_TURU'] as String?,
      miktar: (json['MIKTAR'] as num?)?.toInt(),
      fiyat: (json['FIYAT'] as num?)?.toDouble(),
      dovizTutari: (json['DOVIZ_TUTARI'] as num?)?.toDouble(),
      dovizTipi: (json['DOVIZ_TIPI'] as num?)?.toInt(),
      yeniKayit: json['_YeniKayit'] as bool?,
    );

Map<String, dynamic> _$StokYeniKayitModelToJson(_StokYeniKayitModel instance) =>
    <String, dynamic>{
      'ACIKLAMA': ?instance.aciklama,
      'BELGE_NO': ?instance.belgeNo,
      'GC': ?instance.gc,
      'GUID': ?instance.guid,
      'HESAP_KODU': ?instance.hesapKodu,
      'HESAP_TIPI': ?instance.hesapTipi,
      'KASA_KODU': ?instance.kasaKodu,
      'PickerBelgeTuru': ?instance.pickerBelgeTuru,
      'PLASIYER_KODU': ?instance.plasiyerKodu,
      'PROJE_KODU': ?instance.projeKodu,
      'TAG': ?instance.tag,
      'TAHSILATMI': ?instance.tahsilatmi,
      'TARIH': ?instance.tarih?.toIso8601String(),
      'TUTAR': ?instance.tutar,
      'STOK_KODU': ?instance.stokKodu,
      'DEPO_KODU': ?instance.depoKodu,
      'HAREKET_TURU': ?instance.hareketTuru,
      'MIKTAR': ?instance.miktar,
      'FIYAT': ?instance.fiyat,
      'DOVIZ_TUTARI': ?instance.dovizTutari,
      'DOVIZ_TIPI': ?instance.dovizTipi,
      '_YeniKayit': ?instance.yeniKayit,
    };
