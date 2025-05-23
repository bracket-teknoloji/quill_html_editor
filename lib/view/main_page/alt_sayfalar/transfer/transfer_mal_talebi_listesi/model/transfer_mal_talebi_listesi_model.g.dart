// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transfer_mal_talebi_listesi_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TransferMalTalebiListesiModelImpl _$$TransferMalTalebiListesiModelImplFromJson(Map<String, dynamic> json) =>
    _$TransferMalTalebiListesiModelImpl(
      id: (json['ID'] as num?)?.toInt() ?? -1,
      tarih: json['TARIH'] == null ? null : DateTime.parse(json['TARIH'] as String),
      depoKodu: (json['DEPO_KODU'] as num?)?.toInt(),
      durumAdi: json['DURUM_ADI'] as String?,
      kalemSayisi: (json['KALEM_SAYISI'] as num?)?.toInt(),
      miktar: (json['MIKTAR'] as num?)?.toDouble(),
      kalanMiktar: (json['KALAN_MIKTAR'] as num?)?.toDouble(),
      kayittarihi: json['KAYITTARIHI'] == null ? null : DateTime.parse(json['KAYITTARIHI'] as String),
      kayityapankul: json['KAYITYAPANKUL'] as String?,
      tamamlananMiktar: (json['TAMAMLANAN_MIKTAR'] as num?)?.toDouble(),
      aciklama: json['ACIKLAMA'] as String?,
      belgeNo: json['BELGE_NO'] as String?,
      kapali: json['KAPALI'] as bool?,
      belgeTipi: json['BELGE_TIPI'] as String?,
      hedefSube: (json['HEDEF_SUBE'] as num?)?.toInt(),
      islemKodu: (json['ISLEM_KODU'] as num?)?.toInt(),
      kalemList: (json['KALEM_LIST'] as List<dynamic>?)
          ?.map((e) => KalemModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$TransferMalTalebiListesiModelImplToJson(_$TransferMalTalebiListesiModelImpl instance) =>
    <String, dynamic>{
      'ID': instance.id,
      if (instance.tarih?.toIso8601String() case final value?) 'TARIH': value,
      if (instance.depoKodu case final value?) 'DEPO_KODU': value,
      if (instance.durumAdi case final value?) 'DURUM_ADI': value,
      if (instance.kalemSayisi case final value?) 'KALEM_SAYISI': value,
      if (instance.miktar case final value?) 'MIKTAR': value,
      if (instance.kalanMiktar case final value?) 'KALAN_MIKTAR': value,
      if (instance.kayittarihi?.toIso8601String() case final value?) 'KAYITTARIHI': value,
      if (instance.kayityapankul case final value?) 'KAYITYAPANKUL': value,
      if (instance.tamamlananMiktar case final value?) 'TAMAMLANAN_MIKTAR': value,
      if (instance.aciklama case final value?) 'ACIKLAMA': value,
      if (instance.belgeNo case final value?) 'BELGE_NO': value,
      if (instance.kapali case final value?) 'KAPALI': value,
      if (instance.belgeTipi case final value?) 'BELGE_TIPI': value,
      if (instance.hedefSube case final value?) 'HEDEF_SUBE': value,
      if (instance.islemKodu case final value?) 'ISLEM_KODU': value,
      if (instance.kalemList?.map((e) => e.toJson()).toList() case final value?) 'KALEM_LIST': value,
    };
