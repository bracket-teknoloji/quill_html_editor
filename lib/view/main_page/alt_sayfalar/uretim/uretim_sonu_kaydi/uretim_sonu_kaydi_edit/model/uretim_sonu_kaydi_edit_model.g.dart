// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'uretim_sonu_kaydi_edit_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UretimSonuKaydiEditModel _$UretimSonuKaydiEditModelFromJson(
  Map<String, dynamic> json,
) => _UretimSonuKaydiEditModel(
  belgeNo: json['BELGE_NO'] as String?,
  belgeTarihi: json['BELGE_TARIHI'] == null
      ? null
      : DateTime.parse(json['BELGE_TARIHI'] as String),
  cikisDepo: (json['CIKIS_DEPO'] as num?)?.toInt(),
  aciklama: json['ACIKLAMA'] as String?,
  depoOnceligi: json['DEPO_ONCELIGI'] as String?,
  ekAlanlar: json['EkAlanlar'] == null
      ? null
      : EkAlanlar.fromJson(json['EkAlanlar'] as Map<String, dynamic>),
  girisDepo: (json['GIRIS_DEPO'] as num?)?.toInt(),
  guid: json['GUID'] as String?,
  kalemList: (json['KalemList'] as List<dynamic>?)
      ?.map((e) => KalemModel.fromJson(e as Map<String, dynamic>))
      .toList(),
  projeKodu: json['PROJE_KODU'] as String?,
  tarih: json['TARIH'] as String?,
  yeniKayit: json['_YeniKayit'] as bool?,
);

Map<String, dynamic> _$UretimSonuKaydiEditModelToJson(
  _UretimSonuKaydiEditModel instance,
) => <String, dynamic>{
  'BELGE_NO': ?instance.belgeNo,
  'BELGE_TARIHI': ?instance.belgeTarihi?.toIso8601String(),
  'CIKIS_DEPO': ?instance.cikisDepo,
  'ACIKLAMA': ?instance.aciklama,
  'DEPO_ONCELIGI': ?instance.depoOnceligi,
  'EkAlanlar': ?instance.ekAlanlar?.toJson(),
  'GIRIS_DEPO': ?instance.girisDepo,
  'GUID': ?instance.guid,
  'KalemList': ?instance.kalemList?.map((e) => e.toJson()).toList(),
  'PROJE_KODU': ?instance.projeKodu,
  'TARIH': ?instance.tarih,
  '_YeniKayit': ?instance.yeniKayit,
};

_EkAlanlar _$EkAlanlarFromJson(Map<String, dynamic> json) => _EkAlanlar(
  ktAlan1: json['KT_ALAN1'] as String?,
  ktAlan3: json['KT_ALAN3'] as String?,
  ktAlan4: json['KT_ALAN4'] as String?,
);

Map<String, dynamic> _$EkAlanlarToJson(_EkAlanlar instance) =>
    <String, dynamic>{
      'KT_ALAN1': ?instance.ktAlan1,
      'KT_ALAN3': ?instance.ktAlan3,
      'KT_ALAN4': ?instance.ktAlan4,
    };
