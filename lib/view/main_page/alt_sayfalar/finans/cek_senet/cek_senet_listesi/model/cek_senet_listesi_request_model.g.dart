// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cek_senet_listesi_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CekSenetListesiRequestModelImpl _$$CekSenetListesiRequestModelImplFromJson(Map<String, dynamic> json) => _$CekSenetListesiRequestModelImpl(
      verenKodu: json['VerenKodu'] as String?,
      sirala: json['Sirala'] as String?,
      ekranTipi: json['EkranTipi'] as String?,
      yer: json['Yer'] as String?,
      donemTipi: json['DonemTipi'] as String?,
      tarihTipi: json['TarihTipi'] as String?,
      tipi: json['Tipi'] as String?,
      verilenKodu: json['VerilenKodu'] as String?,
      durum: json['Durum'] as String?,
      searchText: json['SearchText'] as String?,
      baslangicTarihi: json['BaslangicTarihi'] as String?,
      bitisTarihi: json['BitisTarihi'] as String?,
    );

Map<String, dynamic> _$$CekSenetListesiRequestModelImplToJson(_$CekSenetListesiRequestModelImpl instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('VerenKodu', instance.verenKodu);
  writeNotNull('Sirala', instance.sirala);
  writeNotNull('EkranTipi', instance.ekranTipi);
  writeNotNull('Yer', instance.yer);
  writeNotNull('DonemTipi', instance.donemTipi);
  writeNotNull('TarihTipi', instance.tarihTipi);
  writeNotNull('Tipi', instance.tipi);
  writeNotNull('VerilenKodu', instance.verilenKodu);
  writeNotNull('Durum', instance.durum);
  writeNotNull('SearchText', instance.searchText);
  writeNotNull('BaslangicTarihi', instance.baslangicTarihi);
  writeNotNull('BitisTarihi', instance.bitisTarihi);
  return val;
}
