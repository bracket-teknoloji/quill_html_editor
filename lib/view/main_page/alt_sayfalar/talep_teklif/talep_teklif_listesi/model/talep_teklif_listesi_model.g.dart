// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'talep_teklif_listesi_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TalepTeklifListesiModelImpl _$$TalepTeklifListesiModelImplFromJson(
        Map<String, dynamic> json) =>
    _$TalepTeklifListesiModelImpl(
      cariDovizli: json['CARI_DOVIZLI'] as bool?,
      kayittarihi: json['KAYITTARIHI'] == null
          ? null
          : DateTime.parse(json['KAYITTARIHI'] as String),
      tarih: json['TARIH'] == null
          ? null
          : DateTime.parse(json['TARIH'] as String),
      teslimTarihi: json['TESLIM_TARIHI'] == null
          ? null
          : DateTime.parse(json['TESLIM_TARIHI'] as String),
      vadeTarihi: json['VADE_TARIHI'] == null
          ? null
          : DateTime.parse(json['VADE_TARIHI'] as String),
      dovizTutari: (json['DOVIZ_TUTARI'] as num?)?.toDouble(),
      genelIskonto1: (json['GENEL_ISKONTO1'] as num?)?.toDouble(),
      genelIskonto2: (json['GENEL_ISKONTO2'] as num?)?.toDouble(),
      genelIskonto3: (json['GENEL_ISKONTO3'] as num?)?.toDouble(),
      genelToplam: (json['GENEL_TOPLAM'] as num?)?.toDouble(),
      genIsk1O: (json['GEN_ISK1_O'] as num?)?.toDouble(),
      genisk1Tipi: (json['GENISK1_TIPI'] as num?)?.toDouble(),
      genIsk2O: (json['GEN_ISK2_O'] as num?)?.toDouble(),
      genIsk3O: (json['GEN_ISK3_O'] as num?)?.toDouble(),
      kalanMiktar: (json['KALAN_MIKTAR'] as num?)?.toDouble(),
      kdv: (json['KDV'] as num?)?.toDouble(),
      miktar: (json['MIKTAR'] as num?)?.toDouble(),
      tamamlananMiktar: (json['TAMAMLANAN_MIKTAR'] as num?)?.toDouble(),
      dovizTipi: (json['DOVIZ_TIPI'] as num?)?.toInt(),
      genisk3Tipi: (json['GENISK3_TIPI'] as num?)?.toInt(),
      kalemAdedi: (json['KALEM_ADEDI'] as num?)?.toInt(),
      tipi: (json['TIPI'] as num?)?.toInt(),
      vadeGunu: (json['VADE_GUNU'] as num?)?.toInt(),
      tempSipList: json['TEMP_SIP_LIST'] as List<dynamic>?,
      kalemList: (json['KALEM_LIST'] as List<dynamic>?)
          ?.map((e) => KalemListModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      acik1: json['ACIK1'] as String?,
      acik2: json['ACIK2'] as String?,
      acik3: json['ACIK3'] as String?,
      acik4: json['ACIK4'] as String?,
      acik5: json['ACIK5'] as String?,
      acik6: json['ACIK6'] as String?,
      acik7: json['ACIK7'] as String?,
      acik8: json['ACIK8'] as String?,
      acik9: json['ACIK9'] as String?,
      acik10: json['ACIK10'] as String?,
      acik11: json['ACIK11'] as String?,
      acik12: json['ACIK12'] as String?,
      acik13: json['ACIK13'] as String?,
      acik14: json['ACIK14'] as String?,
      acik15: json['ACIK15'] as String?,
      acik16: json['ACIK16'] as String?,
      belgeKodu: json['BELGE_KODU'] as String?,
      belgeNo: json['BELGE_NO'] as String?,
      belgeTuru: json['BELGE_TURU'] as String?,
      cariAdi: json['CARI_ADI'] as String?,
      cariKodu: json['CARI_KODU'] as String?,
      cYedek6: json['C_YEDEK6'] as String?,
      dovizAdi: json['DOVIZ_ADI'] as String?,
      ekAciklama: json['EK_ACIKLAMA'] as String?,
      faturalasti: json['FATURALASTI'] as String?,
      kasaKodu: json['KASA_KODU'] as String?,
      kayityapankul: json['KAYITYAPANKUL'] as String?,
      kdvDahil: json['KDV_DAHIL'] as String?,
      plasiyerAciklama: json['PLASIYER_ACIKLAMA'] as String?,
      plasiyerKodu: json['PLASIYER_KODU'] as String?,
      siparislesti: json['SIPARISLESTI'] as String?,
      ekAcik1: json['EK_ACIK1'] as String?,
      ekAcik10: json['EK_ACIK10'] as String?,
      ekAcik11: json['EK_ACIK11'] as String?,
      ekAcik12: json['EK_ACIK12'] as String?,
      ekAcik13: json['EK_ACIK13'] as String?,
      ekAcik14: json['EK_ACIK14'] as String?,
      ekAcik15: json['EK_ACIK15'] as String?,
      ekAcik16: json['EK_ACIK16'] as String?,
      ekAcik2: json['EK_ACIK2'] as String?,
      ekAcik3: json['EK_ACIK3'] as String?,
      ekAcik4: json['EK_ACIK4'] as String?,
      ekAcik5: json['EK_ACIK5'] as String?,
      ekAcik6: json['EK_ACIK6'] as String?,
      ekAcik7: json['EK_ACIK7'] as String?,
      ekAcik8: json['EK_ACIK8'] as String?,
      ekAcik9: json['EK_ACIK9'] as String?,
      islemKodu: (json['ISLEM_KODU'] as num?)?.toInt(),
      tag: json['TAG'] as String? ?? "FaturaModel",
    );

Map<String, dynamic> _$$TalepTeklifListesiModelImplToJson(
    _$TalepTeklifListesiModelImpl instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('CARI_DOVIZLI', instance.cariDovizli);
  writeNotNull('KAYITTARIHI', instance.kayittarihi?.toIso8601String());
  writeNotNull('TARIH', instance.tarih?.toIso8601String());
  writeNotNull('TESLIM_TARIHI', instance.teslimTarihi?.toIso8601String());
  writeNotNull('VADE_TARIHI', instance.vadeTarihi?.toIso8601String());
  writeNotNull('DOVIZ_TUTARI', instance.dovizTutari);
  writeNotNull('GENEL_ISKONTO1', instance.genelIskonto1);
  writeNotNull('GENEL_ISKONTO2', instance.genelIskonto2);
  writeNotNull('GENEL_ISKONTO3', instance.genelIskonto3);
  writeNotNull('GENEL_TOPLAM', instance.genelToplam);
  writeNotNull('GEN_ISK1_O', instance.genIsk1O);
  writeNotNull('GENISK1_TIPI', instance.genisk1Tipi);
  writeNotNull('GEN_ISK2_O', instance.genIsk2O);
  writeNotNull('GEN_ISK3_O', instance.genIsk3O);
  writeNotNull('KALAN_MIKTAR', instance.kalanMiktar);
  writeNotNull('KDV', instance.kdv);
  writeNotNull('MIKTAR', instance.miktar);
  writeNotNull('TAMAMLANAN_MIKTAR', instance.tamamlananMiktar);
  writeNotNull('DOVIZ_TIPI', instance.dovizTipi);
  writeNotNull('GENISK3_TIPI', instance.genisk3Tipi);
  writeNotNull('KALEM_ADEDI', instance.kalemAdedi);
  writeNotNull('TIPI', instance.tipi);
  writeNotNull('VADE_GUNU', instance.vadeGunu);
  writeNotNull('TEMP_SIP_LIST', instance.tempSipList);
  writeNotNull(
      'KALEM_LIST', instance.kalemList?.map((e) => e.toJson()).toList());
  writeNotNull('ACIK1', instance.acik1);
  writeNotNull('ACIK2', instance.acik2);
  writeNotNull('ACIK3', instance.acik3);
  writeNotNull('ACIK4', instance.acik4);
  writeNotNull('ACIK5', instance.acik5);
  writeNotNull('ACIK6', instance.acik6);
  writeNotNull('ACIK7', instance.acik7);
  writeNotNull('ACIK8', instance.acik8);
  writeNotNull('ACIK9', instance.acik9);
  writeNotNull('ACIK10', instance.acik10);
  writeNotNull('ACIK11', instance.acik11);
  writeNotNull('ACIK12', instance.acik12);
  writeNotNull('ACIK13', instance.acik13);
  writeNotNull('ACIK14', instance.acik14);
  writeNotNull('ACIK15', instance.acik15);
  writeNotNull('ACIK16', instance.acik16);
  writeNotNull('BELGE_KODU', instance.belgeKodu);
  writeNotNull('BELGE_NO', instance.belgeNo);
  writeNotNull('BELGE_TURU', instance.belgeTuru);
  writeNotNull('CARI_ADI', instance.cariAdi);
  writeNotNull('CARI_KODU', instance.cariKodu);
  writeNotNull('C_YEDEK6', instance.cYedek6);
  writeNotNull('DOVIZ_ADI', instance.dovizAdi);
  writeNotNull('EK_ACIKLAMA', instance.ekAciklama);
  writeNotNull('FATURALASTI', instance.faturalasti);
  writeNotNull('KASA_KODU', instance.kasaKodu);
  writeNotNull('KAYITYAPANKUL', instance.kayityapankul);
  writeNotNull('KDV_DAHIL', instance.kdvDahil);
  writeNotNull('PLASIYER_ACIKLAMA', instance.plasiyerAciklama);
  writeNotNull('PLASIYER_KODU', instance.plasiyerKodu);
  writeNotNull('SIPARISLESTI', instance.siparislesti);
  writeNotNull('EK_ACIK1', instance.ekAcik1);
  writeNotNull('EK_ACIK10', instance.ekAcik10);
  writeNotNull('EK_ACIK11', instance.ekAcik11);
  writeNotNull('EK_ACIK12', instance.ekAcik12);
  writeNotNull('EK_ACIK13', instance.ekAcik13);
  writeNotNull('EK_ACIK14', instance.ekAcik14);
  writeNotNull('EK_ACIK15', instance.ekAcik15);
  writeNotNull('EK_ACIK16', instance.ekAcik16);
  writeNotNull('EK_ACIK2', instance.ekAcik2);
  writeNotNull('EK_ACIK3', instance.ekAcik3);
  writeNotNull('EK_ACIK4', instance.ekAcik4);
  writeNotNull('EK_ACIK5', instance.ekAcik5);
  writeNotNull('EK_ACIK6', instance.ekAcik6);
  writeNotNull('EK_ACIK7', instance.ekAcik7);
  writeNotNull('EK_ACIK8', instance.ekAcik8);
  writeNotNull('EK_ACIK9', instance.ekAcik9);
  writeNotNull('ISLEM_KODU', instance.islemKodu);
  writeNotNull('TAG', instance.tag);
  return val;
}
