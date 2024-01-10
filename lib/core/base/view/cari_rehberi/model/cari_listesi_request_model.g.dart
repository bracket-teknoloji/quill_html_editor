// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cari_listesi_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CariListesiRequestModelImpl _$$CariListesiRequestModelImplFromJson(Map<String, dynamic> json) => _$CariListesiRequestModelImpl(
      eFaturaGoster: json['EFaturaGoster'] as bool?,
      siralama: json['SIRALAMA'] as String? ?? "AZ",
      sayfa: json['Sayfa'] as int? ?? 1,
      menuKodu: json['MenuKodu'] as String? ?? "CARI_CREH",
      filterText: json['FilterText'] as String? ?? "",
      kod: json['Kod'] as String? ?? "",
      arrPlasiyer: (json['ArrPlasiyer'] as List<dynamic>?)?.map((e) => e as String).toList(),
      arrKod1: (json['ArrKod1'] as List<dynamic>?)?.map((e) => e as String).toList(),
      arrKod2: (json['ArrKod2'] as List<dynamic>?)?.map((e) => e as String).toList(),
      arrKod3: (json['ArrKod3'] as List<dynamic>?)?.map((e) => e as String).toList(),
      arrKod4: (json['ArrKod4'] as List<dynamic>?)?.map((e) => e as String).toList(),
      arrKod5: (json['ArrKod5'] as List<dynamic>?)?.map((e) => e as String).toList(),
      arrSehir: (json['ArrSehir'] as List<dynamic>?)?.map((e) => e as String).toList(),
      arrGrupKodu: (json['ArrGrupKodu'] as List<dynamic>?)?.map((e) => e as String).toList(),
      ilce: json['Ilce'] as String?,
      cariTipi: json['CariTipi'] as String?,
      filterBakiye: json['FILTER_BAKIYE'] as String?,
      bagliCariKodu: json['BagliCariKodu'] as String?,
      belgeTuru: json['BelgeTuru'] as String?,
      teslimCari: json['TeslimCari'] as String?,
      sehir: json['Sehir'] as String?,
      siparisKarsilanmaDurumu: json['SiparisKarsilanmaDurumu'] as String?,
    );

Map<String, dynamic> _$$CariListesiRequestModelImplToJson(_$CariListesiRequestModelImpl instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('EFaturaGoster', instance.eFaturaGoster);
  writeNotNull('SIRALAMA', instance.siralama);
  writeNotNull('Sayfa', instance.sayfa);
  writeNotNull('MenuKodu', instance.menuKodu);
  writeNotNull('FilterText', instance.filterText);
  writeNotNull('Kod', instance.kod);
  writeNotNull('ArrPlasiyer', instance.arrPlasiyer);
  writeNotNull('ArrKod1', instance.arrKod1);
  writeNotNull('ArrKod2', instance.arrKod2);
  writeNotNull('ArrKod3', instance.arrKod3);
  writeNotNull('ArrKod4', instance.arrKod4);
  writeNotNull('ArrKod5', instance.arrKod5);
  writeNotNull('ArrSehir', instance.arrSehir);
  writeNotNull('ArrGrupKodu', instance.arrGrupKodu);
  writeNotNull('Ilce', instance.ilce);
  writeNotNull('CariTipi', instance.cariTipi);
  writeNotNull('FILTER_BAKIYE', instance.filterBakiye);
  writeNotNull('BagliCariKodu', instance.bagliCariKodu);
  writeNotNull('BelgeTuru', instance.belgeTuru);
  writeNotNull('TeslimCari', instance.teslimCari);
  writeNotNull('Sehir', instance.sehir);
  writeNotNull('SiparisKarsilanmaDurumu', instance.siparisKarsilanmaDurumu);
  return val;
}
