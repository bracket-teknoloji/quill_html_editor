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
      dovizTipi: json['DOVIZ_TIPI'] as int?,
      genisk3Tipi: json['GENISK3_TIPI'] as int?,
      kalemAdedi: json['KALEM_ADEDI'] as int?,
      tipi: json['TIPI'] as int?,
      vadeGunu: json['VADE_GUNU'] as int?,
      tempSipList: json['TEMP_SIP_LIST'] as List<dynamic>?,
      kalemList: (json['KALEM_LIST'] as List<dynamic>?)
          ?.map((e) => KalemListModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      acik1: json['ACIK1'] as String?,
      acik2: json['ACIK2'] as String?,
      acik3: json['ACIK3'] as String?,
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
  return val;
}
