// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'e_belge_islem_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EBelgeIslemModelImpl _$$EBelgeIslemModelImplFromJson(Map<String, dynamic> json) => _$EBelgeIslemModelImpl(
  aciklama: json['ACIKLAMA'] as String?,
  belgeTuru: json['BELGE_TURU'] as String?,
  ebelgeTuru: json['EBELGE_TURU'] as String?,
  kutuTuru: json['KUTU_TURU'] as String?,
  inckeyno: (json['INCKEYNO'] as num?)?.toInt(),
  islemKodu: (json['ISLEM_KODU'] as num?)?.toInt(),
  resmiBelgeNo: json['RESMI_BELGE_NO'] as String?,
  senaryoTipi: json['SENARYO_TIPI'] as String?,
  zarfid: json['ZARFID'] as String?,
  belgeNo: json['BELGE_NO'] as String?,
  cariKodu: json['CARI_KODU'] as String?,
  iptalTarihi: json['IPTAL_TARIHI'] == null ? null : DateTime.parse(json['IPTAL_TARIHI'] as String),
  kopyaSayisi: (json['KOPYA_SAYISI'] as num?)?.toInt(),
  yaziciAdi: json['YAZICI_ADI'] as String?,
  dizaynNo: (json['DIZAYN_NO'] as num?)?.toInt(),
  dovizliOlustur: json['DOVIZLI_OLUSTUR'] as bool?,
  gonderimSekliEposta: json['GONDERIM_SEKLI_EPOSTA'] as bool?,
  internetFaturasi: json['INTERNET_FATURASI'] as bool?,
  kabul: json['KABUL'] as String?,
);

Map<String, dynamic> _$$EBelgeIslemModelImplToJson(_$EBelgeIslemModelImpl instance) => <String, dynamic>{
  if (instance.aciklama case final value?) 'ACIKLAMA': value,
  if (instance.belgeTuru case final value?) 'BELGE_TURU': value,
  if (instance.ebelgeTuru case final value?) 'EBELGE_TURU': value,
  if (instance.kutuTuru case final value?) 'KUTU_TURU': value,
  if (instance.inckeyno case final value?) 'INCKEYNO': value,
  if (instance.islemKodu case final value?) 'ISLEM_KODU': value,
  if (instance.resmiBelgeNo case final value?) 'RESMI_BELGE_NO': value,
  if (instance.senaryoTipi case final value?) 'SENARYO_TIPI': value,
  if (instance.zarfid case final value?) 'ZARFID': value,
  if (instance.belgeNo case final value?) 'BELGE_NO': value,
  if (instance.cariKodu case final value?) 'CARI_KODU': value,
  if (instance.iptalTarihi?.toIso8601String() case final value?) 'IPTAL_TARIHI': value,
  if (instance.kopyaSayisi case final value?) 'KOPYA_SAYISI': value,
  if (instance.yaziciAdi case final value?) 'YAZICI_ADI': value,
  if (instance.dizaynNo case final value?) 'DIZAYN_NO': value,
  if (instance.dovizliOlustur case final value?) 'DOVIZLI_OLUSTUR': value,
  if (instance.gonderimSekliEposta case final value?) 'GONDERIM_SEKLI_EPOSTA': value,
  if (instance.internetFaturasi case final value?) 'INTERNET_FATURASI': value,
  if (instance.kabul case final value?) 'KABUL': value,
};
