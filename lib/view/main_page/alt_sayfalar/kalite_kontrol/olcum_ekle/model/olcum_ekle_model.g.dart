// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'olcum_ekle_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OlcumEkleModelImpl _$$OlcumEkleModelImplFromJson(Map<String, dynamic> json) =>
    _$OlcumEkleModelImpl(
      belgeNo: json['BELGE_NO'] as String?,
      belgeTipi: json['BELGE_TIPI'] as String?,
      stokKodu: json['STOK_KODU'] as String?,
      belgeSira: json['BELGE_SIRA'] as int?,
      yapkod: json['YAPKOD'] as String?,
      prosesId: json['PROSES_ID'] as String?,
      sonuc: json['SONUC'] as String?,
      kayitOperator: json['KAYIT_OPERATOR'] as String?,
      prosesler: (json['PROSESLER'] as List<dynamic>?)
          ?.map((e) => OlcumEkleProsesModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$OlcumEkleModelImplToJson(
    _$OlcumEkleModelImpl instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('BELGE_NO', instance.belgeNo);
  writeNotNull('BELGE_TIPI', instance.belgeTipi);
  writeNotNull('STOK_KODU', instance.stokKodu);
  writeNotNull('BELGE_SIRA', instance.belgeSira);
  writeNotNull('YAPKOD', instance.yapkod);
  writeNotNull('PROSES_ID', instance.prosesId);
  writeNotNull('SONUC', instance.sonuc);
  writeNotNull('KAYIT_OPERATOR', instance.kayitOperator);
  writeNotNull(
      'PROSESLER', instance.prosesler?.map((e) => e.toJson()).toList());
  return val;
}

_$OlcumEkleProsesModelImpl _$$OlcumEkleProsesModelImplFromJson(
        Map<String, dynamic> json) =>
    _$OlcumEkleProsesModelImpl(
      belgeNo: json['BELGE_NO'] as String?,
      belgeSira: json['BELGE_SIRA'] as int?,
      yapkod: json['YAPKOD'] as String?,
      prosesId: json['PROSES_ID'] as int?,
      detayId: json['DETAY_ID'] as int?,
      sonuc: json['SONUC'] as String?,
      sartliKabulNedeni: json['SARTLI_KABUL_NEDENI'] as String?,
      aciklama: json['ACIKLAMA'] as String?,
      detaylar: (json['DETAYLAR'] as List<dynamic>?)
          ?.map((e) => OlcumEkleDetayModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$OlcumEkleProsesModelImplToJson(
    _$OlcumEkleProsesModelImpl instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('BELGE_NO', instance.belgeNo);
  writeNotNull('BELGE_SIRA', instance.belgeSira);
  writeNotNull('YAPKOD', instance.yapkod);
  writeNotNull('PROSES_ID', instance.prosesId);
  writeNotNull('DETAY_ID', instance.detayId);
  writeNotNull('SONUC', instance.sonuc);
  writeNotNull('SARTLI_KABUL_NEDENI', instance.sartliKabulNedeni);
  writeNotNull('ACIKLAMA', instance.aciklama);
  writeNotNull('DETAYLAR', instance.detaylar?.map((e) => e.toJson()).toList());
  return val;
}

_$OlcumEkleDetayModelImpl _$$OlcumEkleDetayModelImplFromJson(
        Map<String, dynamic> json) =>
    _$OlcumEkleDetayModelImpl(
      deger: (json['DEGER'] as num?)?.toDouble(),
      detayId: json['DETAY_ID'] as int?,
      zaman: json['ZAMAN'] == null
          ? null
          : DateTime.parse(json['ZAMAN'] as String),
    );

Map<String, dynamic> _$$OlcumEkleDetayModelImplToJson(
    _$OlcumEkleDetayModelImpl instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('DEGER', instance.deger);
  writeNotNull('DETAY_ID', instance.detayId);
  writeNotNull('ZAMAN', instance.zaman?.toIso8601String());
  return val;
}
