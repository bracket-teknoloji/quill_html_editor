// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'e_belge_islem_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_EBelgeIslemModel _$EBelgeIslemModelFromJson(Map<String, dynamic> json) =>
    _EBelgeIslemModel(
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
      iptalTarihi: json['IPTAL_TARIHI'] == null
          ? null
          : DateTime.parse(json['IPTAL_TARIHI'] as String),
      kopyaSayisi: (json['KOPYA_SAYISI'] as num?)?.toInt(),
      yaziciAdi: json['YAZICI_ADI'] as String?,
      dizaynNo: (json['DIZAYN_NO'] as num?)?.toInt(),
      dovizliOlustur: json['DOVIZLI_OLUSTUR'] as bool?,
      gonderimSekliEposta: json['GONDERIM_SEKLI_EPOSTA'] as bool?,
      internetFaturasi: json['INTERNET_FATURASI'] as bool?,
      kabul: json['KABUL'] as String?,
    );

Map<String, dynamic> _$EBelgeIslemModelToJson(_EBelgeIslemModel instance) =>
    <String, dynamic>{
      'ACIKLAMA': ?instance.aciklama,
      'BELGE_TURU': ?instance.belgeTuru,
      'EBELGE_TURU': ?instance.ebelgeTuru,
      'KUTU_TURU': ?instance.kutuTuru,
      'INCKEYNO': ?instance.inckeyno,
      'ISLEM_KODU': ?instance.islemKodu,
      'RESMI_BELGE_NO': ?instance.resmiBelgeNo,
      'SENARYO_TIPI': ?instance.senaryoTipi,
      'ZARFID': ?instance.zarfid,
      'BELGE_NO': ?instance.belgeNo,
      'CARI_KODU': ?instance.cariKodu,
      'IPTAL_TARIHI': ?instance.iptalTarihi?.toIso8601String(),
      'KOPYA_SAYISI': ?instance.kopyaSayisi,
      'YAZICI_ADI': ?instance.yaziciAdi,
      'DIZAYN_NO': ?instance.dizaynNo,
      'DOVIZLI_OLUSTUR': ?instance.dovizliOlustur,
      'GONDERIM_SEKLI_EPOSTA': ?instance.gonderimSekliEposta,
      'INTERNET_FATURASI': ?instance.internetFaturasi,
      'KABUL': ?instance.kabul,
    };
