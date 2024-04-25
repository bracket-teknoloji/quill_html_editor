// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'e_belge_islem_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EBelgeIslemModelImpl _$$EBelgeIslemModelImplFromJson(
        Map<String, dynamic> json) =>
    _$EBelgeIslemModelImpl(
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

Map<String, dynamic> _$$EBelgeIslemModelImplToJson(
    _$EBelgeIslemModelImpl instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ACIKLAMA', instance.aciklama);
  writeNotNull('BELGE_TURU', instance.belgeTuru);
  writeNotNull('EBELGE_TURU', instance.ebelgeTuru);
  writeNotNull('KUTU_TURU', instance.kutuTuru);
  writeNotNull('INCKEYNO', instance.inckeyno);
  writeNotNull('ISLEM_KODU', instance.islemKodu);
  writeNotNull('RESMI_BELGE_NO', instance.resmiBelgeNo);
  writeNotNull('SENARYO_TIPI', instance.senaryoTipi);
  writeNotNull('ZARFID', instance.zarfid);
  writeNotNull('BELGE_NO', instance.belgeNo);
  writeNotNull('CARI_KODU', instance.cariKodu);
  writeNotNull('IPTAL_TARIHI', instance.iptalTarihi?.toIso8601String());
  writeNotNull('KOPYA_SAYISI', instance.kopyaSayisi);
  writeNotNull('YAZICI_ADI', instance.yaziciAdi);
  writeNotNull('DIZAYN_NO', instance.dizaynNo);
  writeNotNull('DOVIZLI_OLUSTUR', instance.dovizliOlustur);
  writeNotNull('GONDERIM_SEKLI_EPOSTA', instance.gonderimSekliEposta);
  writeNotNull('INTERNET_FATURASI', instance.internetFaturasi);
  writeNotNull('KABUL', instance.kabul);
  return val;
}
