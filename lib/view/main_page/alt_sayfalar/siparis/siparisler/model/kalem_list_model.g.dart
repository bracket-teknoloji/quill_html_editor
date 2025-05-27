// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'kalem_list_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

KalemListModel _$KalemListModelFromJson(Map<String, dynamic> json) =>
    KalemListModel()
      ..tempBarkodList = json['TEMP_BARKOD_LIST'] as List<dynamic>?
      ..sira = (json['SIRA'] as num?)?.toInt()
      ..belgeNo = json['BELGE_NO'] as String?
      ..tarih =
          json['TARIH'] == null ? null : DateTime.parse(json['TARIH'] as String)
      ..teslimTarihi = json['TESLIM_TARIHI'] == null
          ? null
          : DateTime.parse(json['TESLIM_TARIHI'] as String)
      ..belgeTipi = json['BELGE_TIPI'] as String?
      ..stokKodu = json['STOK_KODU'] as String?
      ..stokAdi = json['STOK_ADI'] as String?
      ..cariKodu = json['CARI_KODU'] as String?
      ..depoKodu = (json['DEPO_KODU'] as num?)?.toInt()
      ..depoTanimi = json['DEPO_TANIMI'] as String?
      ..miktar = (json['MIKTAR'] as num?)?.toDouble()
      ..seriList = json['SERI_LIST'] as List<dynamic>?
      ..kdvOrani = (json['KDV_ORANI'] as num?)?.toDouble()
      ..brutFiyat = (json['BRUT_FIYAT'] as num?)?.toDouble()
      ..dipFiyat = (json['DIP_FIYAT'] as num?)?.toDouble()
      ..iskonto1OranMi = json['ISKONTO1_ORAN_MI'] as bool?
      ..stokSatDovTip = (json['STOK_SAT_DOV_TIP'] as num?)?.toInt()
      ..stokSatisKuru = (json['STOK_SATIS_KURU'] as num?)?.toDouble()
      ..stokSatDovizAdi = json['STOK_SAT_DOVIZ_ADI'] as String?
      ..olcuBirimKodu = (json['OLCU_BIRIM_KODU'] as num?)?.toInt()
      ..olcuBirimAdi = json['OLCU_BIRIM_ADI'] as String?
      ..olcuBirimCarpani = (json['OLCU_BIRIM_CARPANI'] as num?)?.toDouble()
      ..stokOlcuBirimi = json['STOK_OLCU_BIRIMI'] as String?
      ..projeKodu = json['PROJE_KODU'] as String?
      ..kalemListHucreList = json['KALEM_LIST_HUCRE_LIST'] as List<dynamic>?
      ..hucreList = json['HUCRE_LIST'] as List<dynamic>?
      ..stokBakiye = (json['STOK_BAKIYE'] as num?)?.toDouble()
      ..kosulKodu = json['KOSUL_KODU'] as String?
      ..stokBirimAgirlik = (json['STOK_BIRIM_AGIRLIK'] as num?)?.toDouble();

Map<String, dynamic> _$KalemListModelToJson(KalemListModel instance) =>
    <String, dynamic>{
      'TEMP_BARKOD_LIST': instance.tempBarkodList,
      'SIRA': instance.sira,
      'BELGE_NO': instance.belgeNo,
      'TARIH': instance.tarih?.toIso8601String(),
      'TESLIM_TARIHI': instance.teslimTarihi?.toIso8601String(),
      'BELGE_TIPI': instance.belgeTipi,
      'STOK_KODU': instance.stokKodu,
      'STOK_ADI': instance.stokAdi,
      'CARI_KODU': instance.cariKodu,
      'DEPO_KODU': instance.depoKodu,
      'DEPO_TANIMI': instance.depoTanimi,
      'MIKTAR': instance.miktar,
      'SERI_LIST': instance.seriList,
      'KDV_ORANI': instance.kdvOrani,
      'BRUT_FIYAT': instance.brutFiyat,
      'DIP_FIYAT': instance.dipFiyat,
      'ISKONTO1_ORAN_MI': instance.iskonto1OranMi,
      'STOK_SAT_DOV_TIP': instance.stokSatDovTip,
      'STOK_SATIS_KURU': instance.stokSatisKuru,
      'STOK_SAT_DOVIZ_ADI': instance.stokSatDovizAdi,
      'OLCU_BIRIM_KODU': instance.olcuBirimKodu,
      'OLCU_BIRIM_ADI': instance.olcuBirimAdi,
      'OLCU_BIRIM_CARPANI': instance.olcuBirimCarpani,
      'STOK_OLCU_BIRIMI': instance.stokOlcuBirimi,
      'PROJE_KODU': instance.projeKodu,
      'KALEM_LIST_HUCRE_LIST': instance.kalemListHucreList,
      'HUCRE_LIST': instance.hucreList,
      'STOK_BAKIYE': instance.stokBakiye,
      'KOSUL_KODU': instance.kosulKodu,
      'STOK_BIRIM_AGIRLIK': instance.stokBirimAgirlik,
    };
