// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'olcum_ekle_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OlcumEkleModelImpl _$$OlcumEkleModelImplFromJson(Map<String, dynamic> json) =>
    _$OlcumEkleModelImpl(
      belgeNo: json['BELGE_NO'] as String?,
      belgeTipi: json['BELGE_TIPI'] as String?,
      belgeSira: (json['BELGE_SIRA'] as num?)?.toInt(),
      stokKodu: json['STOK_KODU'] as String?,
      yapkod: json['YAPKOD'] as String?,
      opkodu: json['OPKODU'] as String?,
      kayitOperator: json['KAYIT_OPERATOR'] as String?,
      tarih: json['TARIH'] == null
          ? null
          : DateTime.parse(json['TARIH'] as String),
      sira: (json['SIRA'] as num?)?.toInt(),
      stokAdi: json['STOK_ADI'] as String?,
      seriNo: json['SERI_NO'] as String?,
      miktar: (json['MIKTAR'] as num?)?.toDouble(),
      belgeId: (json['BELGE_ID'] as num?)?.toInt(),
      tamamlandi: json['TAMAMLANDI'] as bool?,
      prosesler: (json['PROSESLER'] as List<dynamic>?)
          ?.map((e) => OlcumProsesModel.fromJson(e as Map<String, dynamic>))
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
  writeNotNull('BELGE_SIRA', instance.belgeSira);
  writeNotNull('STOK_KODU', instance.stokKodu);
  writeNotNull('YAPKOD', instance.yapkod);
  writeNotNull('OPKODU', instance.opkodu);
  writeNotNull('KAYIT_OPERATOR', instance.kayitOperator);
  writeNotNull('TARIH', instance.tarih?.toIso8601String());
  writeNotNull('SIRA', instance.sira);
  writeNotNull('STOK_ADI', instance.stokAdi);
  writeNotNull('SERI_NO', instance.seriNo);
  writeNotNull('MIKTAR', instance.miktar);
  writeNotNull('BELGE_ID', instance.belgeId);
  writeNotNull('TAMAMLANDI', instance.tamamlandi);
  writeNotNull(
      'PROSESLER', instance.prosesler?.map((e) => e.toJson()).toList());
  return val;
}
