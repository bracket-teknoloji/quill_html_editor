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
      faturaTipi: (json['FaturaTipi'] as num?)?.toInt(),
      kisitYok: json['KisitYok'] as bool?,
      menuKodu: json['MenuKodu'] as String?,
      resimGoster: json['ResimGoster'] as String?,
      stokKodu: json['StokKodu'] as String?,
      seriTakibiVar: json['SeriTakibiVar'] as String?,
      depoKodu: (json['DepoKodu'] as num?)?.toInt(),
      okutuldu: json['Okutuldu'] as bool?,
      oto: json['Oto'] as String?,
      ozelKod1: json['OzelKod1'] as String?,
      ozelKod2: json['OzelKod2'] as String?,
      barkod2: json['Barkod2'] as String?,
      faturaDepoKodu: (json['FaturaDepoKodu'] as num?)?.toInt(),
      faturaHedefDepo: (json['FaturaHedefDepo'] as num?)?.toInt(),
      kosulKodu: json['KosulKodu'] as String?,
    );

Map<String, dynamic> _$$StokRehberiRequestModelImplToJson(
        _$StokRehberiRequestModelImpl instance) =>
    <String, dynamic>{
      if (instance.belgeNo case final value?) 'BelgeNo': value,
      if (instance.belgeTarihi case final value?) 'BelgeTarihi': value,
      if (instance.belgeTipi case final value?) 'BelgeTipi': value,
      if (instance.cariKodu case final value?) 'CariKodu': value,
      if (instance.ekranTipi case final value?) 'EkranTipi': value,
      if (instance.faturaTipi case final value?) 'FaturaTipi': value,
      if (instance.kisitYok case final value?) 'KisitYok': value,
      if (instance.menuKodu case final value?) 'MenuKodu': value,
      if (instance.resimGoster case final value?) 'ResimGoster': value,
      if (instance.stokKodu case final value?) 'StokKodu': value,
      if (instance.seriTakibiVar case final value?) 'SeriTakibiVar': value,
      if (instance.depoKodu case final value?) 'DepoKodu': value,
      if (instance.okutuldu case final value?) 'Okutuldu': value,
      if (instance.oto case final value?) 'Oto': value,
      if (instance.ozelKod1 case final value?) 'OzelKod1': value,
      if (instance.ozelKod2 case final value?) 'OzelKod2': value,
      if (instance.barkod2 case final value?) 'Barkod2': value,
      if (instance.faturaDepoKodu case final value?) 'FaturaDepoKodu': value,
      if (instance.faturaHedefDepo case final value?) 'FaturaHedefDepo': value,
      if (instance.kosulKodu case final value?) 'KosulKodu': value,
    };
