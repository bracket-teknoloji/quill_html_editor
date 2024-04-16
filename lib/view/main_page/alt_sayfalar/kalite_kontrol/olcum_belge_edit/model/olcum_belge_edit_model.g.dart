// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'olcum_belge_edit_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OlcumBelgeEditModelImpl _$$OlcumBelgeEditModelImplFromJson(
        Map<String, dynamic> json) =>
    _$OlcumBelgeEditModelImpl(
      belgeNo: json['BELGE_NO'] as String?,
      belgeTipi: json['BELGE_TIPI'] as String?,
      belgeSira: json['BELGE_SIRA'] as int?,
      stokKodu: json['STOK_KODU'] as String?,
      yapkod: json['YAPKOD'] as String?,
      opkodu: json['OPKODU'] as String?,
      kayitOperator: json['KAYIT_OPERATOR'] as String?,
      belge: (json['BELGE'] as List<dynamic>?)
          ?.map((e) => OlcumBelgeModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      olcumler: (json['OLCUMLER'] as List<dynamic>?)
          ?.map((e) => OlcumOlcumlerModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      prosesler: (json['PROSESLER'] as List<dynamic>?)
          ?.map((e) => OlcumProsesModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$OlcumBelgeEditModelImplToJson(
    _$OlcumBelgeEditModelImpl instance) {
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
  writeNotNull('BELGE', instance.belge?.map((e) => e.toJson()).toList());
  writeNotNull('OLCUMLER', instance.olcumler?.map((e) => e.toJson()).toList());
  writeNotNull(
      'PROSESLER', instance.prosesler?.map((e) => e.toJson()).toList());
  return val;
}

_$OlcumBelgeModelImpl _$$OlcumBelgeModelImplFromJson(
        Map<String, dynamic> json) =>
    _$OlcumBelgeModelImpl(
      belgeNo: json['BELGE_NO'] as String?,
      belgeTipi: json['BELGE_TIPI'] as String?,
      tarih: json['TARIH'] == null
          ? null
          : DateTime.parse(json['TARIH'] as String),
      sira: json['SIRA'] as int?,
      stokKodu: json['STOK_KODU'] as String?,
      stokAdi: json['STOK_ADI'] as String?,
      miktar: (json['MIKTAR'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$OlcumBelgeModelImplToJson(
    _$OlcumBelgeModelImpl instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('BELGE_NO', instance.belgeNo);
  writeNotNull('BELGE_TIPI', instance.belgeTipi);
  writeNotNull('TARIH', instance.tarih?.toIso8601String());
  writeNotNull('SIRA', instance.sira);
  writeNotNull('STOK_KODU', instance.stokKodu);
  writeNotNull('STOK_ADI', instance.stokAdi);
  writeNotNull('MIKTAR', instance.miktar);
  return val;
}

_$OlcumOlcumlerModelImpl _$$OlcumOlcumlerModelImplFromJson(
        Map<String, dynamic> json) =>
    _$OlcumOlcumlerModelImpl(
      id: json['ID'] as int?,
      belgeSira: json['BELGE_SIRA'] as int?,
      stokKodu: json['STOK_KODU'] as String?,
      stokAdi: json['STOK_ADI'] as String?,
      olcumlerOperator: json['OLCUMLER_OPERATOR'] as String?,
      kayityapankul: json['KAYITYAPANKUL'] as String?,
      kayittarihi: json['KAYITTARIHI'] == null
          ? null
          : DateTime.parse(json['KAYITTARIHI'] as String),
      sira: json['SIRA'] as int?,
      kabulAdet: (json['KABUL_ADET'] as num?)?.toDouble(),
      sartliAdet: (json['SARTLI_ADET'] as num?)?.toDouble(),
      retAdet: (json['RET_ADET'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$OlcumOlcumlerModelImplToJson(
    _$OlcumOlcumlerModelImpl instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ID', instance.id);
  writeNotNull('BELGE_SIRA', instance.belgeSira);
  writeNotNull('STOK_KODU', instance.stokKodu);
  writeNotNull('STOK_ADI', instance.stokAdi);
  writeNotNull('OLCUMLER_OPERATOR', instance.olcumlerOperator);
  writeNotNull('KAYITYAPANKUL', instance.kayityapankul);
  writeNotNull('KAYITTARIHI', instance.kayittarihi?.toIso8601String());
  writeNotNull('SIRA', instance.sira);
  writeNotNull('KABUL_ADET', instance.kabulAdet);
  writeNotNull('SARTLI_ADET', instance.sartliAdet);
  writeNotNull('RET_ADET', instance.retAdet);
  return val;
}

_$OlcumProsesModelImpl _$$OlcumProsesModelImplFromJson(
        Map<String, dynamic> json) =>
    _$OlcumProsesModelImpl(
      id: json['ID'] as int?,
      sira: json['SIRA'] as int?,
      proses: json['PROSES'] as String?,
      kriter: json['KRITER'] as String?,
      kabulSarti: json['KABUL_SARTI'] as String?,
      tolerans: json['TOLERANS'] as String?,
      ekipman: json['EKIPMAN'] as String?,
      olculecekmi: json['OLCULECEKMI'] as String?,
      onemlimi: json['ONEMLIMI'] as String?,
      altSinir: (json['ALT_SINIR'] as num?)?.toDouble(),
      ustSinir: (json['UST_SINIR'] as num?)?.toDouble(),
      tur: json['TUR'] as String?,
      olcumSikligi: json['OLCUM_SIKLIGI'] as int?,
      numuneMiktari: json['NUMUNE_MIKTARI'] as int?,
      numunler: json['NUMUNLER'] == null
          ? null
          : OlcumEkleProsesModel.fromJson(
              json['NUMUNLER'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$OlcumProsesModelImplToJson(
    _$OlcumProsesModelImpl instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ID', instance.id);
  writeNotNull('SIRA', instance.sira);
  writeNotNull('PROSES', instance.proses);
  writeNotNull('KRITER', instance.kriter);
  writeNotNull('KABUL_SARTI', instance.kabulSarti);
  writeNotNull('TOLERANS', instance.tolerans);
  writeNotNull('EKIPMAN', instance.ekipman);
  writeNotNull('OLCULECEKMI', instance.olculecekmi);
  writeNotNull('ONEMLIMI', instance.onemlimi);
  writeNotNull('ALT_SINIR', instance.altSinir);
  writeNotNull('UST_SINIR', instance.ustSinir);
  writeNotNull('TUR', instance.tur);
  writeNotNull('OLCUM_SIKLIGI', instance.olcumSikligi);
  writeNotNull('NUMUNE_MIKTARI', instance.numuneMiktari);
  writeNotNull('NUMUNLER', instance.numunler?.toJson());
  return val;
}
