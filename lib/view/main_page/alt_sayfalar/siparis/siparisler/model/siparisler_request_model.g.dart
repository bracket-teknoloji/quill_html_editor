// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'siparisler_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SiparislerRequestModelImpl _$$SiparislerRequestModelImplFromJson(
        Map<String, dynamic> json) =>
    _$SiparislerRequestModelImpl(
      pickerBelgeTuru: json['PickerBelgeTuru'] as String?,
      iadeMi: json['IadeMi'] as bool?,
      cariKodu: json['CariKodu'] as String? ?? "",
      ozelKod2: json['OzelKod2'] as String?,
      cariTipi: json['CariTipi'] as String?,
      miktarGetir: json['MiktarGetir'] as String?,
      siralama: json['SIRALAMA'] as String?,
      siparisKarsilanmaDurumu: json['SiparisKarsilanmaDurumu'] as String?,
      ozelKod1: json['OzelKod1'] as String?,
      stokKodu: json['StokKodu'] as String?,
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
      ekranTipi: json['EkranTipi'] as String? ?? "R",
      sayfa: (json['Sayfa'] as num?)?.toInt(),
      baslamaTarihi: json['BaslamaTarihi'] as String?,
      bitisTarihi: json['BitisTarihi'] as String?,
      searchText: json['SearchText'] as String?,
      filtreKodu: (json['FiltreKodu'] as num?)?.toInt(),
      depoKodu: json['DepoKodu'] as String?,
      hedefDepoKodu: json['HedefDepoKodu'] as String?,
      belgeNo: json['BelgeNo'] as String? ?? "",
      siparisDurumu: json['SiparisDurumu'] as String?,
      referansStokKodu: json['ReferansStokKodu'] as String?,
      menuKodu: json['MenuKodu'] as String?,
      siparisSevkEdilenGoster: json['SiparisSevkEdilenGoster'] as bool?,
      refBelgeTuru: json['RefBelgeTuru'] as String?,
      kisitYok: json['KisitYok'] as bool?,
      arrBelgeTipi: json['ArrBelgeTipi'] as String?,
      arrBelgeNo: json['ArrBelgeNo'] as String?,
      lokalDAT: json['LokalDAT'] as String?,
      faturalanmisIrsaliyelerGelsin:
          json['FaturalanmisIrsaliyelerGelsin'] as bool?,
    );

Map<String, dynamic> _$$SiparislerRequestModelImplToJson(
    _$SiparislerRequestModelImpl instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('PickerBelgeTuru', instance.pickerBelgeTuru);
  writeNotNull('IadeMi', instance.iadeMi);
  writeNotNull('CariKodu', instance.cariKodu);
  writeNotNull('OzelKod2', instance.ozelKod2);
  writeNotNull('CariTipi', instance.cariTipi);
  writeNotNull('MiktarGetir', instance.miktarGetir);
  writeNotNull('SIRALAMA', instance.siralama);
  writeNotNull('SiparisKarsilanmaDurumu', instance.siparisKarsilanmaDurumu);
  writeNotNull('OzelKod1', instance.ozelKod1);
  writeNotNull('StokKodu', instance.stokKodu);
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
  writeNotNull('EkranTipi', instance.ekranTipi);
  writeNotNull('Sayfa', instance.sayfa);
  writeNotNull('BaslamaTarihi', instance.baslamaTarihi);
  writeNotNull('BitisTarihi', instance.bitisTarihi);
  writeNotNull('SearchText', instance.searchText);
  writeNotNull('FiltreKodu', instance.filtreKodu);
  writeNotNull('DepoKodu', instance.depoKodu);
  writeNotNull('HedefDepoKodu', instance.hedefDepoKodu);
  writeNotNull('BelgeNo', instance.belgeNo);
  writeNotNull('SiparisDurumu', instance.siparisDurumu);
  writeNotNull('ReferansStokKodu', instance.referansStokKodu);
  writeNotNull('MenuKodu', instance.menuKodu);
  writeNotNull('SiparisSevkEdilenGoster', instance.siparisSevkEdilenGoster);
  writeNotNull('RefBelgeTuru', instance.refBelgeTuru);
  writeNotNull('KisitYok', instance.kisitYok);
  writeNotNull('ArrBelgeTipi', instance.arrBelgeTipi);
  writeNotNull('ArrBelgeNo', instance.arrBelgeNo);
  writeNotNull('LokalDAT', instance.lokalDAT);
  writeNotNull(
      'FaturalanmisIrsaliyelerGelsin', instance.faturalanmisIrsaliyelerGelsin);
  return val;
}
