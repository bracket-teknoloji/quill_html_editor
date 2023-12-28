// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'siparis_edit_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SiparisEditRequestModelImpl _$$SiparisEditRequestModelImplFromJson(
        Map<String, dynamic> json) =>
    _$SiparisEditRequestModelImpl(
      ekranTipi: json['EkranTipi'] as String? ?? 'D',
      kisitYok: json['KisitYok'] as bool? ?? true,
      belgeTipi: json['BelgeTipi'] as String?,
      pickerBelgeTuru: json['PickerBelgeTuru'] as String?,
      remoteTempBelge: json['RemoteTempBelge'] as bool?,
      faturaTipi: json['FaturaTipi'] as int?,
      tempBelgeId: json['TempBelgeId'] as int?,
      tipi: json['Tipi'] as int?,
      belgeNo: json['BelgeNo'] as String?,
      belgeTarihi: json['BelgeTarihi'] as String?,
      belgeTuru: json['BelgeTuru'] as String?,
      cariKodu: json['CariKodu'] as String?,
      islemId: json['IslemId'] as String?,
      kayitModu: json['KayitModu'] as String?,
      menuKodu: json['MenuKodu'] as String?,
      mevcutBelgeNo: json['MevcutBelgeNo'] as String?,
      mevcutCariKodu: json['MevcutCariKodu'] as String?,
      paramMap: json['ParamMap'] as String?,
      resimGoster: json['ResimGoster'] as String?,
      stokKodu: json['StokKodu'] as String?,
      tag: json['Tag'] as String?,
      siparisSevkEdilenGoster: json['SiparisSevkEdilenGoster'] as bool?,
      filtreKodu: json['FiltreKodu'] as int?,
      eFaturaIncKeyNo: json['EFaturaIncKeyNo'] as int?,
      depoKodu: json['DepoKodu'] as int?,
    );

Map<String, dynamic> _$$SiparisEditRequestModelImplToJson(
    _$SiparisEditRequestModelImpl instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('EkranTipi', instance.ekranTipi);
  writeNotNull('KisitYok', instance.kisitYok);
  writeNotNull('BelgeTipi', instance.belgeTipi);
  writeNotNull('PickerBelgeTuru', instance.pickerBelgeTuru);
  writeNotNull('RemoteTempBelge', instance.remoteTempBelge);
  writeNotNull('FaturaTipi', instance.faturaTipi);
  writeNotNull('TempBelgeId', instance.tempBelgeId);
  writeNotNull('Tipi', instance.tipi);
  writeNotNull('BelgeNo', instance.belgeNo);
  writeNotNull('BelgeTarihi', instance.belgeTarihi);
  writeNotNull('BelgeTuru', instance.belgeTuru);
  writeNotNull('CariKodu', instance.cariKodu);
  writeNotNull('IslemId', instance.islemId);
  writeNotNull('KayitModu', instance.kayitModu);
  writeNotNull('MenuKodu', instance.menuKodu);
  writeNotNull('MevcutBelgeNo', instance.mevcutBelgeNo);
  writeNotNull('MevcutCariKodu', instance.mevcutCariKodu);
  writeNotNull('ParamMap', instance.paramMap);
  writeNotNull('ResimGoster', instance.resimGoster);
  writeNotNull('StokKodu', instance.stokKodu);
  writeNotNull('Tag', instance.tag);
  writeNotNull('SiparisSevkEdilenGoster', instance.siparisSevkEdilenGoster);
  writeNotNull('FiltreKodu', instance.filtreKodu);
  writeNotNull('EFaturaIncKeyNo', instance.eFaturaIncKeyNo);
  writeNotNull('DepoKodu', instance.depoKodu);
  return val;
}
