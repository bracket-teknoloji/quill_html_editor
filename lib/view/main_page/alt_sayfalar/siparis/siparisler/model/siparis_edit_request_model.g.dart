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
      faturaTipi: (json['FaturaTipi'] as num?)?.toInt(),
      tempBelgeId: (json['TempBelgeId'] as num?)?.toInt(),
      tipi: (json['Tipi'] as num?)?.toInt(),
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
      filtreKodu: (json['FiltreKodu'] as num?)?.toInt(),
      eFaturaIncKeyNo: (json['EFaturaIncKeyNo'] as num?)?.toInt(),
      depoKodu: (json['DepoKodu'] as num?)?.toInt(),
      iadeMi: json['IadeMi'] as bool?,
      ozelKod2: json['OzelKod2'] as String?,
      cariTipi: json['CariTipi'] as String?,
      miktarGetir: json['MiktarGetir'] as String?,
      siralama: json['SIRALAMA'] as String?,
      siparisKarsilanmaDurumu: json['SiparisKarsilanmaDurumu'] as String?,
      ozelKod1: json['OzelKod1'] as String?,
      kapaliBelgelerListelenmesin: json['KapaliBelgelerListelenmesin'] as bool?,
      projeKodu: json['ProjeKodu'] as String?,
      faturalasmaGoster: json['FaturalasmaGoster'] as bool?,
      arrKod5: json['ArrKod5'] as String?,
      arrGrupKodu: json['ArrGrupKodu'] as String?,
      arrKod4: json['ArrKod4'] as String?,
      arrKod3: json['ArrKod3'] as String?,
      arrKod2: json['ArrKod2'] as String?,
      arrPlasiyerKodu: json['ArrPlasiyerKodu'] as String?,
      arrKod1: json['ArrKod1'] as String?,
      sayfa: (json['Sayfa'] as num?)?.toInt(),
      baslamaTarihi: json['BaslamaTarihi'] as String?,
      bitisTarihi: json['BitisTarihi'] as String?,
      searchText: json['SearchText'] as String?,
      siparisDurumu: json['SiparisDurumu'] as String?,
      referansStokKodu: json['ReferansStokKodu'] as String?,
      refBelgeTuru: json['RefBelgeTuru'] as String?,
      arrBelgeTipi: json['ArrBelgeTipi'] as String?,
      arrBelgeNo: json['ArrBelgeNo'] as String?,
      bakiyeDurumu: json['BakiyeDurumu'] as String?,
      isNew: json['IsNew'] as bool?,
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
  writeNotNull('IadeMi', instance.iadeMi);
  writeNotNull('OzelKod2', instance.ozelKod2);
  writeNotNull('CariTipi', instance.cariTipi);
  writeNotNull('MiktarGetir', instance.miktarGetir);
  writeNotNull('SIRALAMA', instance.siralama);
  writeNotNull('SiparisKarsilanmaDurumu', instance.siparisKarsilanmaDurumu);
  writeNotNull('OzelKod1', instance.ozelKod1);
  writeNotNull(
      'KapaliBelgelerListelenmesin', instance.kapaliBelgelerListelenmesin);
  writeNotNull('ProjeKodu', instance.projeKodu);
  writeNotNull('FaturalasmaGoster', instance.faturalasmaGoster);
  writeNotNull('ArrKod5', instance.arrKod5);
  writeNotNull('ArrGrupKodu', instance.arrGrupKodu);
  writeNotNull('ArrKod4', instance.arrKod4);
  writeNotNull('ArrKod3', instance.arrKod3);
  writeNotNull('ArrKod2', instance.arrKod2);
  writeNotNull('ArrPlasiyerKodu', instance.arrPlasiyerKodu);
  writeNotNull('ArrKod1', instance.arrKod1);
  writeNotNull('Sayfa', instance.sayfa);
  writeNotNull('BaslamaTarihi', instance.baslamaTarihi);
  writeNotNull('BitisTarihi', instance.bitisTarihi);
  writeNotNull('SearchText', instance.searchText);
  writeNotNull('SiparisDurumu', instance.siparisDurumu);
  writeNotNull('ReferansStokKodu', instance.referansStokKodu);
  writeNotNull('RefBelgeTuru', instance.refBelgeTuru);
  writeNotNull('ArrBelgeTipi', instance.arrBelgeTipi);
  writeNotNull('ArrBelgeNo', instance.arrBelgeNo);
  writeNotNull('BakiyeDurumu', instance.bakiyeDurumu);
  writeNotNull('IsNew', instance.isNew);
  return val;
}
