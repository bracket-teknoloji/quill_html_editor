// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'finans_ozet_rapor_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FinansOzetRaporRequestModelImpl _$$FinansOzetRaporRequestModelImplFromJson(
        Map<String, dynamic> json) =>
    _$FinansOzetRaporRequestModelImpl(
      plasiyerKodu: json['PlasiyerKodu'] as String?,
      cariKodu: json['CariKodu'] as String?,
      tarihTipi: json['TarihTipi'] as String?,
      cariKoduIleBaslar: json['CariKoduIleBaslar'] as String?,
      kdvDahil: json['KDVDahil'] as bool?,
      baslamaTarihi: json['BaslamaTarihi'] as String?,
      bitisTarihi: json['BitisTarihi'] as String?,
      iadeDurumu: json['IadeDurumu'] as String?,
    );

Map<String, dynamic> _$$FinansOzetRaporRequestModelImplToJson(
    _$FinansOzetRaporRequestModelImpl instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('PlasiyerKodu', instance.plasiyerKodu);
  writeNotNull('CariKodu', instance.cariKodu);
  writeNotNull('TarihTipi', instance.tarihTipi);
  writeNotNull('CariKoduIleBaslar', instance.cariKoduIleBaslar);
  writeNotNull('KDVDahil', instance.kdvDahil);
  writeNotNull('BaslamaTarihi', instance.baslamaTarihi);
  writeNotNull('BitisTarihi', instance.bitisTarihi);
  writeNotNull('IadeDurumu', instance.iadeDurumu);
  return val;
}
