// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'temp_json_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TempJsonModel _$TempJsonModelFromJson(Map<String, dynamic> json) =>
    TempJsonModel()
      ..cariAdi = json['CARI_ADI'] as String?
      ..cariKodu = json['CARI_KODU'] as String?
      ..cariModel = json['CARI_MODEL'] == null
          ? null
          : CariModel.fromJson(json['CARI_MODEL'] as Map<String, dynamic>)
      ..acik1 = json['ACIK1'] as String?
      ..acik2 = json['ACIK2'] as String?
      ..acik7 = json['ACIK7'] as String?
      ..acik8 = json['ACIK8'] as String?
      ..ekMaliyet1Tutari = json['EK_MALIYET1_TUTARI'] as int?
      ..ekMaliyet2Tutari = (json['EK_MALIYET2_TUTARI'] as num?)?.toDouble()
      ..ekMaliyet3Tutari = json['EK_MALIYET3_TUTARI'] as int?
      ..belgeNo = json['BELGE_NO'] as String?
      ..genisk1Tipi = json['GENISK1_TIPI'] as int?
      ..genisk2Tipi = json['GENISK2_TIPI'] as int?
      ..genelIskonto1 = json['GENEL_ISKONTO1'] as int?
      ..genelIskonto2 = json['GENEL_ISKONTO2'] as int?
      ..genelIskonto3 = (json['GENEL_ISKONTO3'] as num?)?.toDouble()
      ..genelToplam = (json['GENEL_TOPLAM'] as num?)?.toDouble()
      ..ekAciklama = json['EK_ACIKLAMA'] as String?
      ..islemId = json['ISLEM_ID'] as String?
      ..islemeBaslamaTarihi = json['ISLEME_BASLAMA_TARIHI'] == null
          ? null
          : DateTime.parse(json['ISLEME_BASLAMA_TARIHI'] as String)
      ..kalemAdedi = json['KALEM_ADEDI'] as int?
      ..kalemList = (json['KALEM_LIST'] as List<dynamic>?)
          ?.map((e) => KalemModel.fromJson(e as Map<String, dynamic>))
          .toList()
      ..kayityapankul = json['KAYITYAPANKUL'] as String?
      ..kdvDahil = json['KDV_DAHIL'] as String?
      ..kdv = (json['KDV'] as num?)?.toDouble()
      ..tipi = json['TIPI'] as int?
      ..ozelKod1 = json['OZEL_KOD1'] as String?
      ..paramMap = json['PARAM_MAP'] as Map<String, dynamic>?
      ..belgeTuru = json['BELGE_TURU'] as String?
      ..plasiyerAciklama = json['PLASIYER_ACIKLAMA'] as String?
      ..plasiyerKodu = json['PLASIYER_KODU'] as String?
      ..projeKodu = json['PROJE_KODU'] as String?
      ..belgeTipi = json['BELGE_TIPI'] as int?
      ..ekAcik1 = json['EK_ACIK1'] as String?
      ..ekAcik2 = json['EK_ACIK2'] as String?
      ..ekAcik7 = json['EK_ACIK7'] as String?
      ..ekAcik8 = json['EK_ACIK8'] as String?
      ..genIsk1O = json['GEN_ISK1_O'] as int?
      ..genIsk1T = json['GEN_ISK1_T'] as int?
      ..genIsk2O = json['GEN_ISK2_O'] as int?
      ..genIsk2T = json['GEN_ISK2_T'] as int?
      ..genIsk3O = json['GEN_ISK3_O'] as int?
      ..genIsk3T = (json['GEN_ISK3_T'] as num?)?.toDouble()
      ..pickerBelgeTuru = json['PICKER_BELGE_TURU'] as String?
      ..tag = json['TAG'] as String?
      ..tarih =
          json['TARIH'] == null ? null : DateTime.parse(json['TARIH'] as String)
      ..vadeGunu = json['VADE_GUNU'] as int?;

Map<String, dynamic> _$TempJsonModelToJson(TempJsonModel instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('CARI_ADI', instance.cariAdi);
  writeNotNull('CARI_KODU', instance.cariKodu);
  writeNotNull('CARI_MODEL', instance.cariModel);
  writeNotNull('ACIK1', instance.acik1);
  writeNotNull('ACIK2', instance.acik2);
  writeNotNull('ACIK7', instance.acik7);
  writeNotNull('ACIK8', instance.acik8);
  writeNotNull('EK_MALIYET1_TUTARI', instance.ekMaliyet1Tutari);
  writeNotNull('EK_MALIYET2_TUTARI', instance.ekMaliyet2Tutari);
  writeNotNull('EK_MALIYET3_TUTARI', instance.ekMaliyet3Tutari);
  writeNotNull('BELGE_NO', instance.belgeNo);
  writeNotNull('GENISK1_TIPI', instance.genisk1Tipi);
  writeNotNull('GENISK2_TIPI', instance.genisk2Tipi);
  writeNotNull('GENEL_ISKONTO1', instance.genelIskonto1);
  writeNotNull('GENEL_ISKONTO2', instance.genelIskonto2);
  writeNotNull('GENEL_ISKONTO3', instance.genelIskonto3);
  writeNotNull('GENEL_TOPLAM', instance.genelToplam);
  writeNotNull('EK_ACIKLAMA', instance.ekAciklama);
  writeNotNull('ISLEM_ID', instance.islemId);
  writeNotNull(
      'ISLEME_BASLAMA_TARIHI', instance.islemeBaslamaTarihi?.toIso8601String());
  writeNotNull('KALEM_ADEDI', instance.kalemAdedi);
  writeNotNull('KALEM_LIST', instance.kalemList);
  writeNotNull('KAYITYAPANKUL', instance.kayityapankul);
  writeNotNull('KDV_DAHIL', instance.kdvDahil);
  writeNotNull('KDV', instance.kdv);
  writeNotNull('TIPI', instance.tipi);
  writeNotNull('OZEL_KOD1', instance.ozelKod1);
  writeNotNull('PARAM_MAP', instance.paramMap);
  writeNotNull('BELGE_TURU', instance.belgeTuru);
  writeNotNull('PLASIYER_ACIKLAMA', instance.plasiyerAciklama);
  writeNotNull('PLASIYER_KODU', instance.plasiyerKodu);
  writeNotNull('PROJE_KODU', instance.projeKodu);
  writeNotNull('BELGE_TIPI', instance.belgeTipi);
  writeNotNull('EK_ACIK1', instance.ekAcik1);
  writeNotNull('EK_ACIK2', instance.ekAcik2);
  writeNotNull('EK_ACIK7', instance.ekAcik7);
  writeNotNull('EK_ACIK8', instance.ekAcik8);
  writeNotNull('GEN_ISK1_O', instance.genIsk1O);
  writeNotNull('GEN_ISK1_T', instance.genIsk1T);
  writeNotNull('GEN_ISK2_O', instance.genIsk2O);
  writeNotNull('GEN_ISK2_T', instance.genIsk2T);
  writeNotNull('GEN_ISK3_O', instance.genIsk3O);
  writeNotNull('GEN_ISK3_T', instance.genIsk3T);
  writeNotNull('PICKER_BELGE_TURU', instance.pickerBelgeTuru);
  writeNotNull('TAG', instance.tag);
  writeNotNull('TARIH', instance.tarih?.toIso8601String());
  writeNotNull('VADE_GUNU', instance.vadeGunu);
  return val;
}
