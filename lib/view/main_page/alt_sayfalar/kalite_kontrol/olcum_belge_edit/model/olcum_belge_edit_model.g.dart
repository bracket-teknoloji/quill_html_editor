// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'olcum_belge_edit_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_OlcumBelgeEditModel _$OlcumBelgeEditModelFromJson(Map<String, dynamic> json) =>
    _OlcumBelgeEditModel(
      belgeNo: json['BELGE_NO'] as String?,
      belgeTipi: json['BELGE_TIPI'] as String?,
      belgeSira: (json['BELGE_SIRA'] as num?)?.toInt(),
      seriNo: json['SERI_NO'] as String?,
      stokKodu: json['STOK_KODU'] as String?,
      yapkod: json['YAPKOD'] as String?,
      opkodu: json['OPKODU'] as String?,
      kayitOperator: json['KAYIT_OPERATOR'] as String?,
      kayitOperatorKodu: json['KAYIT_OPERATOR_KODU'] as String?,
      belge: (json['BELGE'] as List<dynamic>?)
          ?.map((e) => OlcumBelgeModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      olcumler: (json['OLCUMLER'] as List<dynamic>?)
          ?.map((e) => OlcumOlcumlerModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      prosesler: (json['PROSESLER'] as List<dynamic>?)
          ?.map((e) => OlcumProsesModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$OlcumBelgeEditModelToJson(
  _OlcumBelgeEditModel instance,
) => <String, dynamic>{
  'BELGE_NO': ?instance.belgeNo,
  'BELGE_TIPI': ?instance.belgeTipi,
  'BELGE_SIRA': ?instance.belgeSira,
  'SERI_NO': ?instance.seriNo,
  'STOK_KODU': ?instance.stokKodu,
  'YAPKOD': ?instance.yapkod,
  'OPKODU': ?instance.opkodu,
  'KAYIT_OPERATOR': ?instance.kayitOperator,
  'KAYIT_OPERATOR_KODU': ?instance.kayitOperatorKodu,
  'BELGE': ?instance.belge?.map((e) => e.toJson()).toList(),
  'OLCUMLER': ?instance.olcumler?.map((e) => e.toJson()).toList(),
  'PROSESLER': ?instance.prosesler?.map((e) => e.toJson()).toList(),
};

_OlcumBelgeModel _$OlcumBelgeModelFromJson(Map<String, dynamic> json) =>
    _OlcumBelgeModel(
      belgeNo: json['BELGE_NO'] as String?,
      belgeTipi: json['BELGE_TIPI'] as String?,
      belgeSira: (json['BELGE_SIRA'] as num?)?.toInt(),
      tarih: json['TARIH'] == null
          ? null
          : DateTime.parse(json['TARIH'] as String),
      sira: (json['SIRA'] as num?)?.toInt(),
      stokKodu: json['STOK_KODU'] as String?,
      stokAdi: json['STOK_ADI'] as String?,
      miktar: (json['MIKTAR'] as num?)?.toDouble(),
      yapkod: json['YAPKOD'] as String?,
      yapacik: json['YAPACIK'] as String?,
      olcumAdedi: (json['OLCUM_ADEDI'] as num?)?.toDouble(),
      kabulAdet: (json['KABUL_ADET'] as num?)?.toDouble(),
      sartliAdet: (json['SARTLI_ADET'] as num?)?.toDouble(),
      retAdet: (json['RET_ADET'] as num?)?.toDouble(),
      opkodu: json['OPKODU'] as String?,
      cariKodu: json['CARI_KODU'] as String?,
      cariAdi: json['CARI_ADI'] as String?,
      belgeTuru: json['BELGE_TURU'] as String?,
      kalemAdedi: (json['KALEM_ADEDI'] as num?)?.toInt(),
      seriNo: json['SERI_NO'] as String?,
      prosesVar: json['PROSES_VAR'] as String?,
      teknikResimVarmi: json['TEKNIK_RESIM_VARMI'] as String?,
      kontrolPlaniVarmi: json['KONTROL_PLANI_VARMI'] as String?,
      yarimOlcumYapabilirmi: json['YARIM_OLCUM_YAPABILIRMI'] as String?,
      opkoduTanimi: json['OPKODU_TANIMI'] as String?,
      istasyonKodu: json['ISTASYON_KODU'] as String?,
      istasyonTanimi: json['ISTASYON_TANIMI'] as String?,
      datAdedi: (json['DAT_ADEDI'] as num?)?.toInt(),
      seriSorulsunmu: json['SERI_SORULSUNMU'] as String?,
      tur: json['TUR'] as String?,
      searchText: json['SearchText'] as String?,
      sayfa: (json['Sayfa'] as num?)?.toInt(),
    );

Map<String, dynamic> _$OlcumBelgeModelToJson(_OlcumBelgeModel instance) =>
    <String, dynamic>{
      'BELGE_NO': ?instance.belgeNo,
      'BELGE_TIPI': ?instance.belgeTipi,
      'BELGE_SIRA': ?instance.belgeSira,
      'TARIH': ?instance.tarih?.toIso8601String(),
      'SIRA': ?instance.sira,
      'STOK_KODU': ?instance.stokKodu,
      'STOK_ADI': ?instance.stokAdi,
      'MIKTAR': ?instance.miktar,
      'YAPKOD': ?instance.yapkod,
      'YAPACIK': ?instance.yapacik,
      'OLCUM_ADEDI': ?instance.olcumAdedi,
      'KABUL_ADET': ?instance.kabulAdet,
      'SARTLI_ADET': ?instance.sartliAdet,
      'RET_ADET': ?instance.retAdet,
      'OPKODU': ?instance.opkodu,
      'CARI_KODU': ?instance.cariKodu,
      'CARI_ADI': ?instance.cariAdi,
      'BELGE_TURU': ?instance.belgeTuru,
      'KALEM_ADEDI': ?instance.kalemAdedi,
      'SERI_NO': ?instance.seriNo,
      'PROSES_VAR': ?instance.prosesVar,
      'TEKNIK_RESIM_VARMI': ?instance.teknikResimVarmi,
      'KONTROL_PLANI_VARMI': ?instance.kontrolPlaniVarmi,
      'YARIM_OLCUM_YAPABILIRMI': ?instance.yarimOlcumYapabilirmi,
      'OPKODU_TANIMI': ?instance.opkoduTanimi,
      'ISTASYON_KODU': ?instance.istasyonKodu,
      'ISTASYON_TANIMI': ?instance.istasyonTanimi,
      'DAT_ADEDI': ?instance.datAdedi,
      'SERI_SORULSUNMU': ?instance.seriSorulsunmu,
      'TUR': ?instance.tur,
      'SearchText': ?instance.searchText,
      'Sayfa': ?instance.sayfa,
    };

_OlcumOlcumlerModel _$OlcumOlcumlerModelFromJson(Map<String, dynamic> json) =>
    _OlcumOlcumlerModel(
      id: (json['ID'] as num?)?.toInt(),
      belgeSira: (json['BELGE_SIRA'] as num?)?.toInt(),
      stokKodu: json['STOK_KODU'] as String?,
      stokAdi: json['STOK_ADI'] as String?,
      olcumlerOperator: json['OLCUMLER_OPERATOR'] as String?,
      kayityapankul: json['KAYITYAPANKUL'] as String?,
      kayitOperator: json['KAYIT_OPERATOR'] as String?,
      kayitOperatorKodu: json['KAYIT_OPERATOR_KODU'] as String?,
      kayittarihi: json['KAYITTARIHI'] == null
          ? null
          : DateTime.parse(json['KAYITTARIHI'] as String),
      kabulAdet: (json['KABUL_ADET'] as num?)?.toDouble(),
      sartliAdet: (json['SARTLI_ADET'] as num?)?.toDouble(),
      retAdet: (json['RET_ADET'] as num?)?.toDouble(),
      seriNo: json['SERI_NO'] as String?,
      tamamlandi: json['TAMAMLANDI'] as String?,
    );

Map<String, dynamic> _$OlcumOlcumlerModelToJson(_OlcumOlcumlerModel instance) =>
    <String, dynamic>{
      'ID': ?instance.id,
      'BELGE_SIRA': ?instance.belgeSira,
      'STOK_KODU': ?instance.stokKodu,
      'STOK_ADI': ?instance.stokAdi,
      'OLCUMLER_OPERATOR': ?instance.olcumlerOperator,
      'KAYITYAPANKUL': ?instance.kayityapankul,
      'KAYIT_OPERATOR': ?instance.kayitOperator,
      'KAYIT_OPERATOR_KODU': ?instance.kayitOperatorKodu,
      'KAYITTARIHI': ?instance.kayittarihi?.toIso8601String(),
      'KABUL_ADET': ?instance.kabulAdet,
      'SARTLI_ADET': ?instance.sartliAdet,
      'RET_ADET': ?instance.retAdet,
      'SERI_NO': ?instance.seriNo,
      'TAMAMLANDI': ?instance.tamamlandi,
    };

_OlcumProsesModel _$OlcumProsesModelFromJson(
  Map<String, dynamic> json,
) => _OlcumProsesModel(
  id: (json['ID'] as num?)?.toInt(),
  sira: (json['SIRA'] as num?)?.toInt(),
  proses: json['PROSES'] as String?,
  kriter: json['KRITER'] as String?,
  kabulSarti: json['KABUL_SARTI'] as String?,
  tolerans: json['TOLERANS'] as String?,
  ekipman: json['EKIPMAN'] as String?,
  olculecekmi: json['OLCULECEKMI'] as String?,
  onemlimi: json['ONEMLIMI'] as String?,
  altSinir: (json['ALT_SINIR'] as num?)?.toDouble(),
  ustSinir: (json['UST_SINIR'] as num?)?.toDouble(),
  tur: json['TUR'] as String?,
  olcumSikligi: (json['OLCUM_SIKLIGI'] as num?)?.toInt(),
  numuneMiktari: (json['NUMUNE_MIKTARI'] as num?)?.toInt(),
  detayId: (json['DETAY_ID'] as num?)?.toInt(),
  prosesTipi: json['PROSES_TIPI'] as String?,
  sonuc: json['SONUC'] as String?,
  sartliKabulNedeni: json['SARTLI_KABUL_NEDENI'] as String?,
  sartliKabulNedeniAciklama: json['SARTLI_KABUL_NEDENI_ACIKLAMA'] as String?,
  olcumOperatorModelOperator: json['OLCUM_OPERATOR_MODEL_OPERATOR'] as String?,
  oncekiOlcudeSartlivarmi: json['ONCEKI_OLCUDE_SARTLIVARMI'] as String?,
  prosesId: (json['PROSES_ID'] as num?)?.toInt(),
  aciklama: json['ACIKLAMA'] as String?,
  kayitOperator: json['KAYIT_OPERATOR'] as String?,
  olcuBirimi: json['OLCU_BIRIMI'] as String?,
  talno: json['TALNO'] as String?,
  form: json['FORM'] as String?,
  detayAciklama: json['DETAY_ACIKLAMA'] as String?,
  olcumler: (json['OLCUMLER'] as List<dynamic>?)
      ?.map((e) => OlcumEkleDetayModel.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$OlcumProsesModelToJson(_OlcumProsesModel instance) =>
    <String, dynamic>{
      'ID': ?instance.id,
      'SIRA': ?instance.sira,
      'PROSES': ?instance.proses,
      'KRITER': ?instance.kriter,
      'KABUL_SARTI': ?instance.kabulSarti,
      'TOLERANS': ?instance.tolerans,
      'EKIPMAN': ?instance.ekipman,
      'OLCULECEKMI': ?instance.olculecekmi,
      'ONEMLIMI': ?instance.onemlimi,
      'ALT_SINIR': ?instance.altSinir,
      'UST_SINIR': ?instance.ustSinir,
      'TUR': ?instance.tur,
      'OLCUM_SIKLIGI': ?instance.olcumSikligi,
      'NUMUNE_MIKTARI': ?instance.numuneMiktari,
      'DETAY_ID': ?instance.detayId,
      'PROSES_TIPI': ?instance.prosesTipi,
      'SONUC': ?instance.sonuc,
      'SARTLI_KABUL_NEDENI': ?instance.sartliKabulNedeni,
      'SARTLI_KABUL_NEDENI_ACIKLAMA': ?instance.sartliKabulNedeniAciklama,
      'OLCUM_OPERATOR_MODEL_OPERATOR': ?instance.olcumOperatorModelOperator,
      'ONCEKI_OLCUDE_SARTLIVARMI': ?instance.oncekiOlcudeSartlivarmi,
      'PROSES_ID': ?instance.prosesId,
      'ACIKLAMA': ?instance.aciklama,
      'KAYIT_OPERATOR': ?instance.kayitOperator,
      'OLCU_BIRIMI': ?instance.olcuBirimi,
      'TALNO': ?instance.talno,
      'FORM': ?instance.form,
      'DETAY_ACIKLAMA': ?instance.detayAciklama,
      'OLCUMLER': ?instance.olcumler?.map((e) => e.toJson()).toList(),
    };

_OlcumEkleDetayModel _$OlcumEkleDetayModelFromJson(Map<String, dynamic> json) =>
    _OlcumEkleDetayModel(
      deger: (json['DEGER'] as num?)?.toDouble(),
      detayId: (json['DETAY_ID'] as num?)?.toInt(),
      zaman: json['ZAMAN'] == null
          ? null
          : DateTime.parse(json['ZAMAN'] as String),
    );

Map<String, dynamic> _$OlcumEkleDetayModelToJson(
  _OlcumEkleDetayModel instance,
) => <String, dynamic>{
  'DEGER': ?instance.deger,
  'DETAY_ID': ?instance.detayId,
  'ZAMAN': ?instance.zaman?.toIso8601String(),
};
