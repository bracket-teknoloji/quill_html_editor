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
  if (instance.belgeNo case final value?) 'BELGE_NO': value,
  if (instance.belgeTipi case final value?) 'BELGE_TIPI': value,
  if (instance.belgeSira case final value?) 'BELGE_SIRA': value,
  if (instance.seriNo case final value?) 'SERI_NO': value,
  if (instance.stokKodu case final value?) 'STOK_KODU': value,
  if (instance.yapkod case final value?) 'YAPKOD': value,
  if (instance.opkodu case final value?) 'OPKODU': value,
  if (instance.kayitOperator case final value?) 'KAYIT_OPERATOR': value,
  if (instance.kayitOperatorKodu case final value?)
    'KAYIT_OPERATOR_KODU': value,
  if (instance.belge?.map((e) => e.toJson()).toList() case final value?)
    'BELGE': value,
  if (instance.olcumler?.map((e) => e.toJson()).toList() case final value?)
    'OLCUMLER': value,
  if (instance.prosesler?.map((e) => e.toJson()).toList() case final value?)
    'PROSESLER': value,
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

Map<String, dynamic> _$OlcumBelgeModelToJson(
  _OlcumBelgeModel instance,
) => <String, dynamic>{
  if (instance.belgeNo case final value?) 'BELGE_NO': value,
  if (instance.belgeTipi case final value?) 'BELGE_TIPI': value,
  if (instance.belgeSira case final value?) 'BELGE_SIRA': value,
  if (instance.tarih?.toIso8601String() case final value?) 'TARIH': value,
  if (instance.sira case final value?) 'SIRA': value,
  if (instance.stokKodu case final value?) 'STOK_KODU': value,
  if (instance.stokAdi case final value?) 'STOK_ADI': value,
  if (instance.miktar case final value?) 'MIKTAR': value,
  if (instance.yapkod case final value?) 'YAPKOD': value,
  if (instance.yapacik case final value?) 'YAPACIK': value,
  if (instance.olcumAdedi case final value?) 'OLCUM_ADEDI': value,
  if (instance.kabulAdet case final value?) 'KABUL_ADET': value,
  if (instance.sartliAdet case final value?) 'SARTLI_ADET': value,
  if (instance.retAdet case final value?) 'RET_ADET': value,
  if (instance.opkodu case final value?) 'OPKODU': value,
  if (instance.cariKodu case final value?) 'CARI_KODU': value,
  if (instance.cariAdi case final value?) 'CARI_ADI': value,
  if (instance.belgeTuru case final value?) 'BELGE_TURU': value,
  if (instance.kalemAdedi case final value?) 'KALEM_ADEDI': value,
  if (instance.seriNo case final value?) 'SERI_NO': value,
  if (instance.prosesVar case final value?) 'PROSES_VAR': value,
  if (instance.teknikResimVarmi case final value?) 'TEKNIK_RESIM_VARMI': value,
  if (instance.kontrolPlaniVarmi case final value?)
    'KONTROL_PLANI_VARMI': value,
  if (instance.yarimOlcumYapabilirmi case final value?)
    'YARIM_OLCUM_YAPABILIRMI': value,
  if (instance.opkoduTanimi case final value?) 'OPKODU_TANIMI': value,
  if (instance.istasyonKodu case final value?) 'ISTASYON_KODU': value,
  if (instance.istasyonTanimi case final value?) 'ISTASYON_TANIMI': value,
  if (instance.datAdedi case final value?) 'DAT_ADEDI': value,
  if (instance.seriSorulsunmu case final value?) 'SERI_SORULSUNMU': value,
  if (instance.tur case final value?) 'TUR': value,
  if (instance.searchText case final value?) 'SearchText': value,
  if (instance.sayfa case final value?) 'Sayfa': value,
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

Map<String, dynamic> _$OlcumOlcumlerModelToJson(
  _OlcumOlcumlerModel instance,
) => <String, dynamic>{
  if (instance.id case final value?) 'ID': value,
  if (instance.belgeSira case final value?) 'BELGE_SIRA': value,
  if (instance.stokKodu case final value?) 'STOK_KODU': value,
  if (instance.stokAdi case final value?) 'STOK_ADI': value,
  if (instance.olcumlerOperator case final value?) 'OLCUMLER_OPERATOR': value,
  if (instance.kayityapankul case final value?) 'KAYITYAPANKUL': value,
  if (instance.kayitOperator case final value?) 'KAYIT_OPERATOR': value,
  if (instance.kayitOperatorKodu case final value?)
    'KAYIT_OPERATOR_KODU': value,
  if (instance.kayittarihi?.toIso8601String() case final value?)
    'KAYITTARIHI': value,
  if (instance.kabulAdet case final value?) 'KABUL_ADET': value,
  if (instance.sartliAdet case final value?) 'SARTLI_ADET': value,
  if (instance.retAdet case final value?) 'RET_ADET': value,
  if (instance.seriNo case final value?) 'SERI_NO': value,
  if (instance.tamamlandi case final value?) 'TAMAMLANDI': value,
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
      if (instance.id case final value?) 'ID': value,
      if (instance.sira case final value?) 'SIRA': value,
      if (instance.proses case final value?) 'PROSES': value,
      if (instance.kriter case final value?) 'KRITER': value,
      if (instance.kabulSarti case final value?) 'KABUL_SARTI': value,
      if (instance.tolerans case final value?) 'TOLERANS': value,
      if (instance.ekipman case final value?) 'EKIPMAN': value,
      if (instance.olculecekmi case final value?) 'OLCULECEKMI': value,
      if (instance.onemlimi case final value?) 'ONEMLIMI': value,
      if (instance.altSinir case final value?) 'ALT_SINIR': value,
      if (instance.ustSinir case final value?) 'UST_SINIR': value,
      if (instance.tur case final value?) 'TUR': value,
      if (instance.olcumSikligi case final value?) 'OLCUM_SIKLIGI': value,
      if (instance.numuneMiktari case final value?) 'NUMUNE_MIKTARI': value,
      if (instance.detayId case final value?) 'DETAY_ID': value,
      if (instance.prosesTipi case final value?) 'PROSES_TIPI': value,
      if (instance.sonuc case final value?) 'SONUC': value,
      if (instance.sartliKabulNedeni case final value?)
        'SARTLI_KABUL_NEDENI': value,
      if (instance.sartliKabulNedeniAciklama case final value?)
        'SARTLI_KABUL_NEDENI_ACIKLAMA': value,
      if (instance.olcumOperatorModelOperator case final value?)
        'OLCUM_OPERATOR_MODEL_OPERATOR': value,
      if (instance.oncekiOlcudeSartlivarmi case final value?)
        'ONCEKI_OLCUDE_SARTLIVARMI': value,
      if (instance.prosesId case final value?) 'PROSES_ID': value,
      if (instance.aciklama case final value?) 'ACIKLAMA': value,
      if (instance.kayitOperator case final value?) 'KAYIT_OPERATOR': value,
      if (instance.olcuBirimi case final value?) 'OLCU_BIRIMI': value,
      if (instance.talno case final value?) 'TALNO': value,
      if (instance.form case final value?) 'FORM': value,
      if (instance.detayAciklama case final value?) 'DETAY_ACIKLAMA': value,
      if (instance.olcumler?.map((e) => e.toJson()).toList() case final value?)
        'OLCUMLER': value,
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
  if (instance.deger case final value?) 'DEGER': value,
  if (instance.detayId case final value?) 'DETAY_ID': value,
  if (instance.zaman?.toIso8601String() case final value?) 'ZAMAN': value,
};
