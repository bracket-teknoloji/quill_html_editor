// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'uretim_sonu_kaydi_edit_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UretimSonuKaydiEditModel _$UretimSonuKaydiEditModelFromJson(
  Map<String, dynamic> json,
) => _UretimSonuKaydiEditModel(
  belgeNo: json['BELGE_NO'] as String?,
  belgeTarihi: json['BELGE_TARIHI'] == null ? null : DateTime.parse(json['BELGE_TARIHI'] as String),
  cikisDepo: (json['CIKIS_DEPO'] as num?)?.toInt(),
  aciklama: json['ACIKLAMA'] as String?,
  depoOnceligi: json['DEPO_ONCELIGI'] as String?,
  ekAlanlar: json['EkAlanlar'] == null ? null : EkAlanlar.fromJson(json['EkAlanlar'] as Map<String, dynamic>),
  girisDepo: (json['GIRIS_DEPO'] as num?)?.toInt(),
  guid: json['GUID'] as String?,
  kalemList: (json['KalemList'] as List<dynamic>?)?.map((e) => KalemModel.fromJson(e as Map<String, dynamic>)).toList(),
  projeKodu: json['PROJE_KODU'] as String?,
  tarih: json['TARIH'] as String?,
  yeniKayit: json['_YeniKayit'] as bool?,
);

Map<String, dynamic> _$UretimSonuKaydiEditModelToJson(
  _UretimSonuKaydiEditModel instance,
) => <String, dynamic>{
  if (instance.belgeNo case final value?) 'BELGE_NO': value,
  if (instance.belgeTarihi?.toIso8601String() case final value?) 'BELGE_TARIHI': value,
  if (instance.cikisDepo case final value?) 'CIKIS_DEPO': value,
  if (instance.aciklama case final value?) 'ACIKLAMA': value,
  if (instance.depoOnceligi case final value?) 'DEPO_ONCELIGI': value,
  if (instance.ekAlanlar?.toJson() case final value?) 'EkAlanlar': value,
  if (instance.girisDepo case final value?) 'GIRIS_DEPO': value,
  if (instance.guid case final value?) 'GUID': value,
  if (instance.kalemList?.map((e) => e.toJson()).toList() case final value?) 'KalemList': value,
  if (instance.projeKodu case final value?) 'PROJE_KODU': value,
  if (instance.tarih case final value?) 'TARIH': value,
  if (instance.yeniKayit case final value?) '_YeniKayit': value,
};

_EkAlanlar _$EkAlanlarFromJson(Map<String, dynamic> json) => _EkAlanlar(
  ktAlan1: json['KT_ALAN1'] as String?,
  ktAlan3: json['KT_ALAN3'] as String?,
  ktAlan4: json['KT_ALAN4'] as String?,
);

Map<String, dynamic> _$EkAlanlarToJson(_EkAlanlar instance) => <String, dynamic>{
  if (instance.ktAlan1 case final value?) 'KT_ALAN1': value,
  if (instance.ktAlan3 case final value?) 'KT_ALAN3': value,
  if (instance.ktAlan4 case final value?) 'KT_ALAN4': value,
};
