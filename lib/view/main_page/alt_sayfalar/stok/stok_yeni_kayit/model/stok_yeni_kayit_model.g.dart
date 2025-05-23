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
  depoKodu: (json['DEPO_KODU'] as num?)?.toInt(),
  hareketTuru: json['HAREKET_TURU'] as String?,
  miktar: (json['MIKTAR'] as num?)?.toInt(),
  fiyat: (json['FIYAT'] as num?)?.toDouble(),
  dovizTutari: (json['DOVIZ_TUTARI'] as num?)?.toDouble(),
  dovizTipi: (json['DOVIZ_TIPI'] as num?)?.toInt(),
  yeniKayit: json['_YeniKayit'] as bool?,
);

Map<String, dynamic> _$$StokYeniKayitModelImplToJson(_$StokYeniKayitModelImpl instance) => <String, dynamic>{
  if (instance.aciklama case final value?) 'ACIKLAMA': value,
  if (instance.belgeNo case final value?) 'BELGE_NO': value,
  if (instance.gc case final value?) 'GC': value,
  if (instance.guid case final value?) 'GUID': value,
  if (instance.hesapKodu case final value?) 'HESAP_KODU': value,
  if (instance.hesapTipi case final value?) 'HESAP_TIPI': value,
  if (instance.kasaKodu case final value?) 'KASA_KODU': value,
  if (instance.pickerBelgeTuru case final value?) 'PickerBelgeTuru': value,
  if (instance.plasiyerKodu case final value?) 'PLASIYER_KODU': value,
  if (instance.projeKodu case final value?) 'PROJE_KODU': value,
  if (instance.tag case final value?) 'TAG': value,
  if (instance.tahsilatmi case final value?) 'TAHSILATMI': value,
  if (instance.tarih?.toIso8601String() case final value?) 'TARIH': value,
  if (instance.tutar case final value?) 'TUTAR': value,
  if (instance.stokKodu case final value?) 'STOK_KODU': value,
  if (instance.depoKodu case final value?) 'DEPO_KODU': value,
  if (instance.hareketTuru case final value?) 'HAREKET_TURU': value,
  if (instance.miktar case final value?) 'MIKTAR': value,
  if (instance.fiyat case final value?) 'FIYAT': value,
  if (instance.dovizTutari case final value?) 'DOVIZ_TUTARI': value,
  if (instance.dovizTipi case final value?) 'DOVIZ_TIPI': value,
  if (instance.yeniKayit case final value?) '_YeniKayit': value,
};
