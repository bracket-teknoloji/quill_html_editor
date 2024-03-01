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
          : Filtre.fromJson(json['FILTRE'] as Map<String, dynamic>),
      filtreStr: json['FILTRE_STR'] as String?,
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
  return val;
}

_$FiltreImpl _$$FiltreImplFromJson(Map<String, dynamic> json) => _$FiltreImpl(
      arrGrupKodu: (json['ARR_GRUP_KODU'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      depoKodu: json['DEPO_KODU'] as int?,
      seriList: json['SERI_LIST'] as List<dynamic>?,
      islemKodu: json['ISLEM_KODU'] as int?,
      tipi: json['TIPI'] as String?,
    );

Map<String, dynamic> _$$FiltreImplToJson(_$FiltreImpl instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ARR_GRUP_KODU', instance.arrGrupKodu);
  writeNotNull('DEPO_KODU', instance.depoKodu);
  writeNotNull('SERI_LIST', instance.seriList);
  writeNotNull('ISLEM_KODU', instance.islemKodu);
  writeNotNull('TIPI', instance.tipi);
  return val;
}
