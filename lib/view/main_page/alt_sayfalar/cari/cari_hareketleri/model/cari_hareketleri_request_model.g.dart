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
      ba: json['Ba'] as String?,
    );

Map<String, dynamic> _$$CariHareketleriRequestModelImplToJson(
    _$CariHareketleriRequestModelImpl instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('SIRALAMA', instance.siralama);
  writeNotNull('SadeceTahsilatlarOdemeler', instance.sadeceTahsilatlarOdemeler);
  writeNotNull('CariKodu', instance.cariKodu);
  writeNotNull('EkranTipi', instance.ekranTipi);
  writeNotNull('ArrPlasiyerKodu', instance.arrPlasiyerKodu);
  writeNotNull('ArrHareketTuru', instance.arrHareketTuru);
  writeNotNull('BaslamaTarihi', instance.baslamaTarihi);
  writeNotNull('BitisTarihi', instance.bitisTarihi);
  writeNotNull('Ba', instance.ba);
  return val;
}
