// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sayim_listesi_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SayimListesiModelImpl _$$SayimListesiModelImplFromJson(
        Map<String, dynamic> json) =>
    _$SayimListesiModelImpl(
      fisno: json['FISNO'] as String?,
      baslangicTarihi: json['BASLANGIC_TARIHI'] == null
          ? null
          : DateTime.parse(json['BASLANGIC_TARIHI'] as String),
      depo: json['DEPO'] as String?,
      aktif: json['AKTIF'] as String?,
      kullanicilarJson: json['KULLANICILAR_JSON'] as String?,
      depoList:
          (json['DEPO_LIST'] as List<dynamic>?)?.map((e) => e as int).toList(),
      kullaniciList: (json['KULLANICI_LIST'] as List<dynamic>?)
          ?.map((e) => e as int)
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
      id: json['ID'] as int?,
      depoKodu: json['DEPO_KODU'] as int?,
      cevrim: json['CEVRIM'] as int?,
      stokKodu: json['STOK_KODU'] as String?,
      kayityapankul: json['KAYITYAPANKUL'] as String?,
      depoTanimi: json['DEPO_TANIMI'] as String?,
      stokAdi: json['STOK_ADI'] as String?,
      projeKodu: json['PROJE_KODU'] as String?,
      kayittarihi: json['KAYITTARIHI'] == null
          ? null
          : DateTime.parse(json['KAYITTARIHI'] as String),
      barkod: json['BARKOD'] as String?,
    );

Map<String, dynamic> _$$SayimListesiModelImplToJson(
    _$SayimListesiModelImpl instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('FISNO', instance.fisno);
  writeNotNull('BASLANGIC_TARIHI', instance.baslangicTarihi?.toIso8601String());
  writeNotNull('DEPO', instance.depo);
  writeNotNull('AKTIF', instance.aktif);
  writeNotNull('KULLANICILAR_JSON', instance.kullanicilarJson);
  writeNotNull('DEPO_LIST', instance.depoList);
  writeNotNull('KULLANICI_LIST', instance.kullaniciList);
  writeNotNull('KULLANICILAR', instance.kullanicilar);
  writeNotNull('MIKTAR', instance.miktar);
  writeNotNull('DEPO_MIKTARI', instance.depoMiktari);
  writeNotNull('TIPI', instance.tipi);
  writeNotNull('FILTRE', instance.filtre?.toJson());
  writeNotNull('FILTRE_STR', instance.filtreStr);
  writeNotNull('BITIS_TARIHI', instance.bitisTarihi?.toIso8601String());
  writeNotNull('ID', instance.id);
  writeNotNull('DEPO_KODU', instance.depoKodu);
  writeNotNull('CEVRIM', instance.cevrim);
  writeNotNull('STOK_KODU', instance.stokKodu);
  writeNotNull('KAYITYAPANKUL', instance.kayityapankul);
  writeNotNull('DEPO_TANIMI', instance.depoTanimi);
  writeNotNull('STOK_ADI', instance.stokAdi);
  writeNotNull('PROJE_KODU', instance.projeKodu);
  writeNotNull('KAYITTARIHI', instance.kayittarihi?.toIso8601String());
  writeNotNull('BARKOD', instance.barkod);
  return val;
}

_$SayimFiltreModelImpl _$$SayimFiltreModelImplFromJson(
        Map<String, dynamic> json) =>
    _$SayimFiltreModelImpl(
      arrGrupKodu: (json['ArrGrupKodu'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      depoKodu: json['DEPO_KODU'] as int?,
      seriList: json['SeriList'] as List<dynamic>?,
      islemKodu: json['ISLEM_KODU'] as int?,
      belgeNo: json['BELGE_NO'] as String?,
      tipi: json['TIPI'] as String?,
      arrKod1:
          (json['ArrKod1'] as List<dynamic>?)?.map((e) => e as String).toList(),
      arrKod2:
          (json['ArrKod2'] as List<dynamic>?)?.map((e) => e as String).toList(),
      arrKod3:
          (json['ArrKod3'] as List<dynamic>?)?.map((e) => e as String).toList(),
      arrKod4:
          (json['ArrKod4'] as List<dynamic>?)?.map((e) => e as String).toList(),
      arrKod5:
          (json['ArrKod5'] as List<dynamic>?)?.map((e) => e as String).toList(),
      miktar: (json['MIKTAR'] as num?)?.toDouble(),
      olcuBirimKodu: json['OLCU_BIRIM_KODU'] as int?,
      projeKodu: json['PROJE_KODU'] as String?,
      stokKodu: json['STOK_KODU'] as String?,
      kull1s: json['KULL1S'] as String?,
      kull2s: json['KULL2S'] as String?,
      kull3s: json['KULL3S'] as String?,
      kull4s: json['KULL4S'] as String?,
      kull5s: json['KULL5S'] as String?,
    );

Map<String, dynamic> _$$SayimFiltreModelImplToJson(
    _$SayimFiltreModelImpl instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ArrGrupKodu', instance.arrGrupKodu);
  writeNotNull('DEPO_KODU', instance.depoKodu);
  writeNotNull('SeriList', instance.seriList);
  writeNotNull('ISLEM_KODU', instance.islemKodu);
  writeNotNull('BELGE_NO', instance.belgeNo);
  writeNotNull('TIPI', instance.tipi);
  writeNotNull('ArrKod1', instance.arrKod1);
  writeNotNull('ArrKod2', instance.arrKod2);
  writeNotNull('ArrKod3', instance.arrKod3);
  writeNotNull('ArrKod4', instance.arrKod4);
  writeNotNull('ArrKod5', instance.arrKod5);
  writeNotNull('MIKTAR', instance.miktar);
  writeNotNull('OLCU_BIRIM_KODU', instance.olcuBirimKodu);
  writeNotNull('PROJE_KODU', instance.projeKodu);
  writeNotNull('STOK_KODU', instance.stokKodu);
  writeNotNull('KULL1S', instance.kull1s);
  writeNotNull('KULL2S', instance.kull2s);
  writeNotNull('KULL3S', instance.kull3s);
  writeNotNull('KULL4S', instance.kull4s);
  writeNotNull('KULL5S', instance.kull5s);
  return val;
}
