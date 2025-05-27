// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cari_hareketleri_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CariHareketleriRequestModelImpl _$$CariHareketleriRequestModelImplFromJson(
        Map<String, dynamic> json) =>
    _$CariHareketleriRequestModelImpl(
      siralama: json['SIRALAMA'] as String?,
      sadeceTahsilatlarOdemeler: json['SadeceTahsilatlarOdemeler'] as bool?,
      cariKodu: json['CariKodu'] as String?,
      ekranTipi: json['EkranTipi'] as String?,
      arrPlasiyerKodu: json['ArrPlasiyerKodu'] as String?,
      arrHareketTuru: json['ArrHareketTuru'] as String?,
      baslamaTarihi: json['BaslamaTarihi'] as String?,
      bitisTarihi: json['BitisTarihi'] as String?,
      ba: json['BA'] as String?,
      menuKodu: json['MenuKodu'] as String?,
      kapatilmis: json['Kapatilmis'] as String?,
    );

Map<String, dynamic> _$$CariHareketleriRequestModelImplToJson(
        _$CariHareketleriRequestModelImpl instance) =>
    <String, dynamic>{
      if (instance.siralama case final value?) 'SIRALAMA': value,
      if (instance.sadeceTahsilatlarOdemeler case final value?)
        'SadeceTahsilatlarOdemeler': value,
      if (instance.cariKodu case final value?) 'CariKodu': value,
      if (instance.ekranTipi case final value?) 'EkranTipi': value,
      if (instance.arrPlasiyerKodu case final value?) 'ArrPlasiyerKodu': value,
      if (instance.arrHareketTuru case final value?) 'ArrHareketTuru': value,
      if (instance.baslamaTarihi case final value?) 'BaslamaTarihi': value,
      if (instance.bitisTarihi case final value?) 'BitisTarihi': value,
      if (instance.ba case final value?) 'BA': value,
      if (instance.menuKodu case final value?) 'MenuKodu': value,
      if (instance.kapatilmis case final value?) 'Kapatilmis': value,
    };
