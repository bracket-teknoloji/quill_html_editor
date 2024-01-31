// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cari_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CariRequestModelImpl _$$CariRequestModelImplFromJson(
        Map<String, dynamic> json) =>
    _$CariRequestModelImpl(
      filterText: json['FilterText'] as String? ?? "",
      kod: (json['Kod'] as List<dynamic>?)?.map((e) => e as String).toList(),
      sayfa: json['Sayfa'] as int?,
      ilce: json['Ilce'] as String?,
      cariTipi: json['CariTipi'] as String?,
      siralama: json['SIRALAMA'] as String?,
      menuKodu: json['MenuKodu'] as String?,
      eFaturaGoster: json['EFaturaGoster'] as bool?,
      filterBakiye: json['FILTER_BAKIYE'] as String?,
      arrGrupKodu: (json['ArrGrupKodu'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
      arrKod1: (json['ArrKod1'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
      arrKod2: (json['ArrKod2'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
      arrKod3: (json['ArrKod3'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
      arrKod4: (json['ArrKod4'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
      arrKod5: (json['ArrKod5'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
      arrSehir: (json['ArrSehir'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
      arrPlasiyerKodu: (json['ArrPlasiyerKodu'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      plasiyerKisitiYok: json['PlasiyerKisitiYok'] as bool?,
      belgeTuru: json['BelgeTuru'] as String?,
      vergiNo: json['VergiNo'] as String?,
      siparisKarsilanmaDurumu: json['SiparisKarsilanmaDurumu'] as String?,
      kisitYok: json['KisitYok'] as bool?,
      secildi: json['Secildi'] as String?,
      teslimCari: json['TeslimCari'] as String?,
    );

Map<String, dynamic> _$$CariRequestModelImplToJson(
    _$CariRequestModelImpl instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('FilterText', instance.filterText);
  writeNotNull('Kod', instance.kod);
  writeNotNull('Sayfa', instance.sayfa);
  writeNotNull('Ilce', instance.ilce);
  writeNotNull('CariTipi', instance.cariTipi);
  writeNotNull('SIRALAMA', instance.siralama);
  writeNotNull('MenuKodu', instance.menuKodu);
  writeNotNull('EFaturaGoster', instance.eFaturaGoster);
  writeNotNull('FILTER_BAKIYE', instance.filterBakiye);
  writeNotNull('ArrGrupKodu', instance.arrGrupKodu);
  writeNotNull('ArrKod1', instance.arrKod1);
  writeNotNull('ArrKod2', instance.arrKod2);
  writeNotNull('ArrKod3', instance.arrKod3);
  writeNotNull('ArrKod4', instance.arrKod4);
  writeNotNull('ArrKod5', instance.arrKod5);
  writeNotNull('ArrSehir', instance.arrSehir);
  writeNotNull('ArrPlasiyerKodu', instance.arrPlasiyerKodu);
  writeNotNull('PlasiyerKisitiYok', instance.plasiyerKisitiYok);
  writeNotNull('BelgeTuru', instance.belgeTuru);
  writeNotNull('VergiNo', instance.vergiNo);
  writeNotNull('SiparisKarsilanmaDurumu', instance.siparisKarsilanmaDurumu);
  writeNotNull('KisitYok', instance.kisitYok);
  writeNotNull('Secildi', instance.secildi);
  writeNotNull('TeslimCari', instance.teslimCari);
  return val;
}
