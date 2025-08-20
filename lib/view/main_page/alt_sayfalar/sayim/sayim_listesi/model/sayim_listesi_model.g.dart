// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sayim_listesi_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SayimListesiModel _$SayimListesiModelFromJson(Map<String, dynamic> json) =>
    _SayimListesiModel(
      fisno: json['FISNO'] as String?,
      baslangicTarihi: json['BASLANGIC_TARIHI'] == null
          ? null
          : DateTime.parse(json['BASLANGIC_TARIHI'] as String),
      depo: json['DEPO'] as String?,
      aktif: json['AKTIF'] as String?,
      kullanicilarJson: json['KULLANICILAR_JSON'] as String?,
      depoList: (json['DEPO_LIST'] as List<dynamic>?)
          ?.map((e) => (e as num).toInt())
          .toList(),
      kullaniciList: (json['KULLANICI_LIST'] as List<dynamic>?)
          ?.map((e) => (e as num).toInt())
          .toList(),
      kullanicilar: json['KULLANICILAR'] as String?,
      miktar: (json['MIKTAR'] as num?)?.toDouble(),
      depoMiktari: (json['DEPO_MIKTARI'] as num?)?.toDouble(),
      tipi: json['TIPI'] as String?,
      filtre: json['FILTRE'] == null
          ? null
          : SayimFiltreModel.fromJson(json['FILTRE'] as Map<String, dynamic>),
      filtreStr: json['FILTRE_STR'] as String?,
      bitisTarihi: json['BITIS_TARIHI'] == null
          ? null
          : DateTime.parse(json['BITIS_TARIHI'] as String),
      id: (json['ID'] as num?)?.toInt(),
      depoKodu: (json['DEPO_KODU'] as num?)?.toInt(),
      cevrim: (json['CEVRIM'] as num?)?.toInt(),
      stokKodu: json['STOK_KODU'] as String?,
      kayityapankul: json['KAYITYAPANKUL'] as String?,
      depoTanimi: json['DEPO_TANIMI'] as String?,
      stokAdi: json['STOK_ADI'] as String?,
      projeKodu: json['PROJE_KODU'] as String?,
      kayittarihi: json['KAYITTARIHI'] == null
          ? null
          : DateTime.parse(json['KAYITTARIHI'] as String),
      barkod: json['BARKOD'] as String?,
      stokBakiye: (json['STOK_BAKIYE'] as num?)?.toDouble(),
      seriNo: json['SERI_NO'] as String?,
      seri2: json['SERI2'] as String?,
      seri3: json['SERI3'] as String?,
      seri4: json['SERI4'] as String?,
      sonKullanmaTarihi: json['SON_KULLANMA_TARIHI'] == null
          ? null
          : DateTime.parse(json['SON_KULLANMA_TARIHI'] as String),
      stokModel: json['STOK_MODEL'] == null
          ? null
          : StokListesiModel.fromJson(
              json['STOK_MODEL'] as Map<String, dynamic>,
            ),
    );

Map<String, dynamic> _$SayimListesiModelToJson(_SayimListesiModel instance) =>
    <String, dynamic>{
      'FISNO': ?instance.fisno,
      'BASLANGIC_TARIHI': ?instance.baslangicTarihi?.toIso8601String(),
      'DEPO': ?instance.depo,
      'AKTIF': ?instance.aktif,
      'KULLANICILAR_JSON': ?instance.kullanicilarJson,
      'DEPO_LIST': ?instance.depoList,
      'KULLANICI_LIST': ?instance.kullaniciList,
      'KULLANICILAR': ?instance.kullanicilar,
      'MIKTAR': ?instance.miktar,
      'DEPO_MIKTARI': ?instance.depoMiktari,
      'TIPI': ?instance.tipi,
      'FILTRE': ?instance.filtre?.toJson(),
      'FILTRE_STR': ?instance.filtreStr,
      'BITIS_TARIHI': ?instance.bitisTarihi?.toIso8601String(),
      'ID': ?instance.id,
      'DEPO_KODU': ?instance.depoKodu,
      'CEVRIM': ?instance.cevrim,
      'STOK_KODU': ?instance.stokKodu,
      'KAYITYAPANKUL': ?instance.kayityapankul,
      'DEPO_TANIMI': ?instance.depoTanimi,
      'STOK_ADI': ?instance.stokAdi,
      'PROJE_KODU': ?instance.projeKodu,
      'KAYITTARIHI': ?instance.kayittarihi?.toIso8601String(),
      'BARKOD': ?instance.barkod,
      'STOK_BAKIYE': ?instance.stokBakiye,
      'SERI_NO': ?instance.seriNo,
      'SERI2': ?instance.seri2,
      'SERI3': ?instance.seri3,
      'SERI4': ?instance.seri4,
      'SON_KULLANMA_TARIHI': ?instance.sonKullanmaTarihi?.toIso8601String(),
      'STOK_MODEL': ?instance.stokModel?.toJson(),
    };

_SayimFiltreModel _$SayimFiltreModelFromJson(Map<String, dynamic> json) =>
    _SayimFiltreModel(
      arrGrupKodu: (json['ArrGrupKodu'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      depoKodu: (json['DEPO_KODU'] as num?)?.toInt(),
      seriList: (json['SeriList'] as List<dynamic>?)
          ?.map((e) => SeriList.fromJson(e as Map<String, dynamic>))
          .toList(),
      islemKodu: (json['ISLEM_KODU'] as num?)?.toInt(),
      belgeNo: json['BELGE_NO'] as String?,
      tipi: json['TIPI'] as String?,
      arrKod1: (json['ArrKod1'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      arrKod2: (json['ArrKod2'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      arrKod3: (json['ArrKod3'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      arrKod4: (json['ArrKod4'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      arrKod5: (json['ArrKod5'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      miktar: (json['MIKTAR'] as num?)?.toDouble() ?? 1,
      olcuBirimKodu: (json['OLCU_BIRIM_KODU'] as num?)?.toInt(),
      projeKodu: json['PROJE_KODU'] as String?,
      stokKodu: json['STOK_KODU'] as String?,
      stokAdi: json['STOK_ADI'] as String?,
      projeAdi: json['PROJE_ADI'] as String?,
      kull1s: json['KULL1S'] as String?,
      kull2s: json['KULL2S'] as String?,
      kull3s: json['KULL3S'] as String?,
      kull4s: json['KULL4S'] as String?,
      kull5s: json['KULL5S'] as String?,
      id: (json['ID'] as num?)?.toInt(),
      cevrim: (json['CEVRIM'] as num?)?.toInt(),
      fisno: json['FISNO'] as String?,
      kayityapankul: json['KAYITYAPANKUL'] as String?,
      depoTanimi: json['DEPO_TANIMI'] as String?,
      kayittarihi: json['KAYITTARIHI'] == null
          ? null
          : DateTime.parse(json['KAYITTARIHI'] as String),
    );

Map<String, dynamic> _$SayimFiltreModelToJson(_SayimFiltreModel instance) =>
    <String, dynamic>{
      'ArrGrupKodu': ?instance.arrGrupKodu,
      'DEPO_KODU': ?instance.depoKodu,
      'SeriList': ?instance.seriList?.map((e) => e.toJson()).toList(),
      'ISLEM_KODU': ?instance.islemKodu,
      'BELGE_NO': ?instance.belgeNo,
      'TIPI': ?instance.tipi,
      'ArrKod1': ?instance.arrKod1,
      'ArrKod2': ?instance.arrKod2,
      'ArrKod3': ?instance.arrKod3,
      'ArrKod4': ?instance.arrKod4,
      'ArrKod5': ?instance.arrKod5,
      'MIKTAR': ?instance.miktar,
      'OLCU_BIRIM_KODU': ?instance.olcuBirimKodu,
      'PROJE_KODU': ?instance.projeKodu,
      'STOK_KODU': ?instance.stokKodu,
      'STOK_ADI': ?instance.stokAdi,
      'PROJE_ADI': ?instance.projeAdi,
      'KULL1S': ?instance.kull1s,
      'KULL2S': ?instance.kull2s,
      'KULL3S': ?instance.kull3s,
      'KULL4S': ?instance.kull4s,
      'KULL5S': ?instance.kull5s,
      'ID': ?instance.id,
      'CEVRIM': ?instance.cevrim,
      'FISNO': ?instance.fisno,
      'KAYITYAPANKUL': ?instance.kayityapankul,
      'DEPO_TANIMI': ?instance.depoTanimi,
      'KAYITTARIHI': ?instance.kayittarihi?.toIso8601String(),
    };
