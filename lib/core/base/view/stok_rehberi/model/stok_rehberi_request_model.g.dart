// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stok_rehberi_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$StokRehberiRequestModelImpl _$$StokRehberiRequestModelImplFromJson(
        Map<String, dynamic> json) =>
    _$StokRehberiRequestModelImpl(
      belgeNo: json['BelgeNo'] as String?,
      belgeTarihi: json['BelgeTarihi'] as String?,
      belgeTipi: json['BelgeTipi'] as String?,
      cariKodu: json['CariKodu'] as String?,
      ekranTipi: json['EkranTipi'] as String? ?? "D",
      faturaTipi: json['FaturaTipi'] as int?,
      kisitYok: json['KisitYok'] as bool?,
      menuKodu: json['MenuKodu'] as String?,
      resimGoster: json['ResimGoster'] as String?,
      stokKodu: json['StokKodu'] as String?,
      seriTakibiVar: json['SeriTakibiVar'] as String?,
    );

Map<String, dynamic> _$$StokRehberiRequestModelImplToJson(
    _$StokRehberiRequestModelImpl instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('BelgeNo', instance.belgeNo);
  writeNotNull('BelgeTarihi', instance.belgeTarihi);
  writeNotNull('BelgeTipi', instance.belgeTipi);
  writeNotNull('CariKodu', instance.cariKodu);
  writeNotNull('EkranTipi', instance.ekranTipi);
  writeNotNull('FaturaTipi', instance.faturaTipi);
  writeNotNull('KisitYok', instance.kisitYok);
  writeNotNull('MenuKodu', instance.menuKodu);
  writeNotNull('ResimGoster', instance.resimGoster);
  writeNotNull('StokKodu', instance.stokKodu);
  writeNotNull('SeriTakibiVar', instance.seriTakibiVar);
  return val;
}
