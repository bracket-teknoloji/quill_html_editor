// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cek_senet_listesi_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CekSenetListesiRequestModelImpl _$$CekSenetListesiRequestModelImplFromJson(
        Map<String, dynamic> json) =>
    _$CekSenetListesiRequestModelImpl(
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

Map<String, dynamic> _$$CekSenetListesiRequestModelImplToJson(
        _$CekSenetListesiRequestModelImpl instance) =>
    <String, dynamic>{
      if (instance.verenKodu case final value?) 'VerenKodu': value,
      if (instance.sirala case final value?) 'Sirala': value,
      if (instance.ekranTipi case final value?) 'EkranTipi': value,
      if (instance.yer case final value?) 'Yer': value,
      if (instance.donemTipi case final value?) 'DonemTipi': value,
      if (instance.tarihTipi case final value?) 'TarihTipi': value,
      if (instance.tipi case final value?) 'Tipi': value,
      if (instance.verilenKodu case final value?) 'VerilenKodu': value,
      if (instance.durum case final value?) 'Durum': value,
      if (instance.searchText case final value?) 'SearchText': value,
      if (instance.baslangicTarihi case final value?) 'BaslangicTarihi': value,
      if (instance.bitisTarihi case final value?) 'BitisTarihi': value,
    };
