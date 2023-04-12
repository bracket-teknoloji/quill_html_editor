// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: implicit_dynamic_parameter

part of 'param_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ParamModel _$ParamModelFromJson(Map<String, dynamic> json) => $checkedCreate(
      'ParamModel',
      json,
      ($checkedConvert) {
        final val = ParamModel();
        $checkedConvert('ParamYuklendi', (v) => val.paramYuklendi = v as bool?);
        $checkedConvert('KULLANICI', (v) => val.kullanici = v as String?);
        $checkedConvert('SIRKET', (v) => val.sirket = v as String?);
        $checkedConvert('ISLETME_KODU', (v) => val.isletmeKodu = v as int?);
        $checkedConvert(
            'MapCariKullSahalar',
            (v) => val.mapCariKullSahalar = v == null
                ? null
                : MapCariKullSahalar.fromJson(v as Map<String, dynamic>));
        $checkedConvert(
            'MapCariEkAlanlar',
            (v) => val.mapCariEkAlanlar = (v as List<dynamic>?)
                ?.map((e) => MapEkAlanlar.fromJson(e as Map<String, dynamic>))
                .toList());
        $checkedConvert('sabitSayfalamaOgeSayisi',
            (v) => val.sabitSayfalamaOgeSayisi = v as int?);
        $checkedConvert(
            '_NetsisOndalikResponseModel',
            (v) => val.netsisOndalikResponseModel = (v as List<dynamic>?)
                ?.map((e) => NetsisOndalikResponseModel.fromJson(
                    e as Map<String, dynamic>))
                .toList());
        $checkedConvert(
            'DepoList',
            (v) => val.depoList = (v as List<dynamic>?)
                ?.map((e) => DepoList.fromJson(e as Map<String, dynamic>))
                .toList());
        $checkedConvert(
            'DovizList',
            (v) => val.dovizList = (v as List<dynamic>?)
                ?.map((e) => DovizList.fromJson(e as Map<String, dynamic>))
                .toList());
        $checkedConvert(
            'SatirAcikBaslikList',
            (v) => val.satirAcikBaslikList = (v as List<dynamic>?)
                ?.map((e) =>
                    SatirAcikBaslikList.fromJson(e as Map<String, dynamic>))
                .toList());
        $checkedConvert(
            'KasaList',
            (v) => val.kasaList = (v as List<dynamic>?)
                ?.map((e) => KasaList.fromJson(e as Map<String, dynamic>))
                .toList());
        $checkedConvert(
            'PlasiyerList',
            (v) => val.plasiyerList = (v as List<dynamic>?)
                ?.map((e) => PlasiyerList.fromJson(e as Map<String, dynamic>))
                .toList());
        $checkedConvert(
            'PlasiyerListTumu',
            (v) => val.plasiyerListTumu = (v as List<dynamic>?)
                ?.map((e) => PlasiyerList.fromJson(e as Map<String, dynamic>))
                .toList());
        $checkedConvert(
            'SubeList',
            (v) => val.subeList = (v as List<dynamic>?)
                ?.map((e) => SubeList.fromJson(e as Map<String, dynamic>))
                .toList());
        $checkedConvert(
            'TalTekParam',
            (v) => val.talTekParam = (v as List<dynamic>?)
                ?.map((e) => TalTekParam.fromJson(e as Map<String, dynamic>))
                .toList());
        $checkedConvert(
            'CekSenParam',
            (v) => val.cekSenParam = (v as List<dynamic>?)
                ?.map((e) => CekSenParam.fromJson(e as Map<String, dynamic>))
                .toList());
        $checkedConvert(
            'ListOzelKodTum',
            (v) => val.listOzelKodTum = (v as List<dynamic>?)
                ?.map((e) => ListOzelKodTum.fromJson(e as Map<String, dynamic>))
                .toList());
        $checkedConvert(
            'ListIskTip',
            (v) => val.listIskTip = (v as List<dynamic>?)
                ?.map((e) => ListIskTip.fromJson(e as Map<String, dynamic>))
                .toList());
        $checkedConvert(
            'ListCariOdemeKodu',
            (v) => val.listCariOdemeKodu = (v as List<dynamic>?)
                ?.map((e) =>
                    ListCariOdemeKodu.fromJson(e as Map<String, dynamic>))
                .toList());
        $checkedConvert(
            'YaziciList',
            (v) => val.yaziciList = (v as List<dynamic>?)
                ?.map((e) => YaziciList.fromJson(e as Map<String, dynamic>))
                .toList());
        $checkedConvert(
            'NetFectDizaynList',
            (v) => val.netFectDizaynList = (v as List<dynamic>?)
                ?.map((e) =>
                    NetFectDizaynList.fromJson(e as Map<String, dynamic>))
                .toList());
        $checkedConvert(
            'MapStokGrupAdlari',
            (v) => val.mapStokGrupAdlari = v == null
                ? null
                : MapStokGrupAdlari.fromJson(v as Map<String, dynamic>));
        $checkedConvert(
            'MustahsilParam',
            (v) => val.mustahsilParam = v == null
                ? null
                : MustahsilParam.fromJson(v as Map<String, dynamic>));
        $checkedConvert(
            'ListFatuEkMaliyet',
            (v) => val.listFatuEkMaliyet = (v as List<dynamic>?)
                ?.map((e) =>
                    ListFatuEkMaliyet.fromJson(e as Map<String, dynamic>))
                .toList());
        $checkedConvert(
            'MapKdvSifirBelgeTipiOzelKod2',
            (v) => val.mapKdvSifirBelgeTipiOzelKod2 = v == null
                ? null
                : MapKdvSifirBelgeTipiOzelKod2.fromJson(
                    v as Map<String, dynamic>));
        $checkedConvert('LokalDepoUygulamasiAcik',
            (v) => val.lokalDepoUygulamasiAcik = v as bool?);
        $checkedConvert(
            'EsnekYapilandir', (v) => val.esnekYapilandir = v as bool?);
        $checkedConvert(
            'OzelFiyatSistemi', (v) => val.ozelFiyatSistemi = v as bool?);
        $checkedConvert('SadeceOzelFiyatSistemi',
            (v) => val.sadeceOzelFiyatSistemi = v as String?);
        $checkedConvert(
            'OtvliStoklarVar', (v) => val.otvliStoklarVar = v as bool?);
        $checkedConvert(
            'MapStokKullSahalar',
            (v) => val.mapStokKullSahalar = v == null
                ? null
                : MapStokKullSahalar.fromJson(v as Map<String, dynamic>));
        $checkedConvert(
            'MapStokEkAlanlar',
            (v) => val.mapStokEkAlanlar = (v as List<dynamic>?)
                ?.map((e) => MapEkAlanlar.fromJson(e as Map<String, dynamic>))
                .toList());
        $checkedConvert('KarmaKoliUyg', (v) => val.karmaKoliUyg = v as String?);
        $checkedConvert('AlisEkAciklamalarAktif',
            (v) => val.alisEkAciklamalarAktif = v as bool?);
        $checkedConvert('AlisEkAciklamaTanimi1',
            (v) => val.alisEkAciklamaTanimi1 = v as String?);
        $checkedConvert('AlisEkAciklamaTanimi2',
            (v) => val.alisEkAciklamaTanimi2 = v as String?);
        $checkedConvert('AlisEkAciklamaTanimi3',
            (v) => val.alisEkAciklamaTanimi3 = v as String?);
        $checkedConvert('AlisEkAciklamaTanimi4',
            (v) => val.alisEkAciklamaTanimi4 = v as String?);
        $checkedConvert('AlisEkAciklamaTanimi5',
            (v) => val.alisEkAciklamaTanimi5 = v as String?);
        $checkedConvert('AlisEkAciklamaTanimi6',
            (v) => val.alisEkAciklamaTanimi6 = v as String?);
        $checkedConvert('AlisEkAciklamaTanimi7',
            (v) => val.alisEkAciklamaTanimi7 = v as String?);
        $checkedConvert('AlisEkAciklamaTanimi8',
            (v) => val.alisEkAciklamaTanimi8 = v as String?);
        $checkedConvert('AlisEkAciklamaTanimi9',
            (v) => val.alisEkAciklamaTanimi9 = v as String?);
        $checkedConvert('AlisEkAciklamaTanimi10',
            (v) => val.alisEkAciklamaTanimi10 = v as String?);
        $checkedConvert('AlisEkAciklamaTanimi11',
            (v) => val.alisEkAciklamaTanimi11 = v as String?);
        $checkedConvert('AlisEkAciklamaTanimi12',
            (v) => val.alisEkAciklamaTanimi12 = v as String?);
        $checkedConvert('AlisEkAciklamaTanimi13',
            (v) => val.alisEkAciklamaTanimi13 = v as String?);
        $checkedConvert('AlisEkAciklamaTanimi14',
            (v) => val.alisEkAciklamaTanimi14 = v as String?);
        $checkedConvert('AlisEkAciklamaTanimi15',
            (v) => val.alisEkAciklamaTanimi15 = v as String?);
        $checkedConvert('AlisEkAciklamaTanimi16',
            (v) => val.alisEkAciklamaTanimi16 = v as String?);
        $checkedConvert('AlisOzelKod1Tablodan',
            (v) => val.alisOzelKod1Tablodan = v as bool?);
        $checkedConvert(
            'AlisKosulAktif', (v) => val.alisKosulAktif = v as bool?);
        $checkedConvert('AlisFarkliTeslimCariAktif',
            (v) => val.alisFarkliTeslimCariAktif = v as bool?);
        $checkedConvert('AlisMalFazMiktarIskontoAcik',
            (v) => val.alisMalFazMiktarIskontoAcik = v as bool?);
        $checkedConvert('AlisSatirKademeliIskontoAcik',
            (v) => val.alisSatirKademeliIskontoAcik = v as bool?);
        $checkedConvert('AlisSatirKademeliIskontoSayisi',
            (v) => val.alisSatirKademeliIskontoSayisi = v as int?);
        $checkedConvert(
            'AlisGenIsk1Aktif', (v) => val.alisGenIsk1Aktif = v as bool?);
        $checkedConvert(
            'AlisGenIsk2Aktif', (v) => val.alisGenIsk2Aktif = v as bool?);
        $checkedConvert(
            'AlisGenIsk3Aktif', (v) => val.alisGenIsk3Aktif = v as bool?);
        $checkedConvert(
            'AlisTopluDepoAktif', (v) => val.alisTopluDepoAktif = v as bool?);
        $checkedConvert('AlisStokDepoKarttanGelsin',
            (v) => val.alisStokDepoKarttanGelsin = v as bool?);
        $checkedConvert('AlisGenellikleKDVHaric',
            (v) => val.alisGenellikleKdvHaric = v as bool?);
        $checkedConvert('AlisFarkliOlcuBirimleriKullan',
            (v) => val.alisFarkliOlcuBirimleriKullan = v as bool?);
        $checkedConvert(
            'AlisDovizAktif', (v) => val.alisDovizAktif = v as bool?);
        $checkedConvert(
            'AlisSatirdaKDVSor', (v) => val.alisSatirdaKdvSor = v as bool?);
        $checkedConvert('AlisSatirdaAciklamalarAktif',
            (v) => val.alisSatirdaAciklamalarAktif = v as bool?);
        $checkedConvert('AlisSatirdaEkAlan2Aktif',
            (v) => val.alisSatirdaEkAlan2Aktif = v as bool?);
        $checkedConvert(
            'AlisEkMaliyet2Aktif', (v) => val.alisEkMaliyet2Aktif = v as bool?);
        $checkedConvert(
            'AlisEkMaliyet2Adi', (v) => val.alisEkMaliyet2Adi = v as String?);
        $checkedConvert(
            'AlisTevkifatPay', (v) => val.alisTevkifatPay = v as int?);
        $checkedConvert(
            'AlisTevkifatPayda', (v) => val.alisTevkifatPayda = v as int?);
        $checkedConvert('AlisFaturaFiyatSifirGecilsin',
            (v) => val.alisFaturaFiyatSifirGecilsin = v as bool?);
        $checkedConvert(
            'AlisFazlaTeslimat', (v) => val.alisFazlaTeslimat = v as bool?);
        $checkedConvert('AlisDovizTakipHangiDeger',
            (v) => val.alisDovizTakipHangiDeger = v as int?);
        $checkedConvert(
            'AlisHizmetAktif', (v) => val.alisHizmetAktif = v as bool?);
        $checkedConvert(
            'AlisHizmetDepoKodu', (v) => val.alisHizmetDepoKodu = v as int?);
        $checkedConvert(
            'AlisMiktar2Sor', (v) => val.alisMiktar2Sor = v as bool?);
        $checkedConvert('AlisSatirdaTeslimTarihiSor',
            (v) => val.alisSatirdaTeslimTarihiSor = v as bool?);
        $checkedConvert('AlisFisSeriTakibiVar',
            (v) => val.alisFisSeriTakibiVar = v as bool?);
        $checkedConvert('AlisTutardanFiyataGecilsin',
            (v) => val.alisTutardanFiyataGecilsin = v as bool?);
        $checkedConvert('AlisCariIskSatiraUygula',
            (v) => val.alisCariIskSatiraUygula = v as bool?);
        $checkedConvert(
            'SeriUygulamasiAcik', (v) => val.seriUygulamasiAcik = v as bool?);
        $checkedConvert('SirketDovizUygulamasiAcik',
            (v) => val.sirketDovizUygulamasiAcik = v as bool?);
        $checkedConvert('SirketDovizUygulamasiDovizKodu',
            (v) => val.sirketDovizUygulamasiDovizKodu = v as int?);
        $checkedConvert(
            'PlasiyerUygulamasi', (v) => val.plasiyerUygulamasi = v as bool?);
        $checkedConvert('ParaBirimi', (v) => val.paraBirimi = v as String?);
        $checkedConvert('BankaEntegre', (v) => val.bankaEntegre = v as bool?);
        $checkedConvert('BagliCariVar', (v) => val.bagliCariVar = v as bool?);
        $checkedConvert(
            'ProjeUygulamasiAcik', (v) => val.projeUygulamasiAcik = v as bool?);
        $checkedConvert('SatisEkAciklamalarAktif',
            (v) => val.satisEkAciklamalarAktif = v as bool?);
        $checkedConvert('SatisEkAciklamaTanimi1',
            (v) => val.satisEkAciklamaTanimi1 = v as String?);
        $checkedConvert('SatisEkAciklamaTanimi2',
            (v) => val.satisEkAciklamaTanimi2 = v as String?);
        $checkedConvert('SatisEkAciklamaTanimi3',
            (v) => val.satisEkAciklamaTanimi3 = v as String?);
        $checkedConvert('SatisEkAciklamaTanimi4',
            (v) => val.satisEkAciklamaTanimi4 = v as String?);
        $checkedConvert('SatisEkAciklamaTanimi5',
            (v) => val.satisEkAciklamaTanimi5 = v as String?);
        $checkedConvert('SatisEkAciklamaTanimi6',
            (v) => val.satisEkAciklamaTanimi6 = v as String?);
        $checkedConvert('SatisEkAciklamaTanimi7',
            (v) => val.satisEkAciklamaTanimi7 = v as String?);
        $checkedConvert('SatisEkAciklamaTanimi8',
            (v) => val.satisEkAciklamaTanimi8 = v as String?);
        $checkedConvert('SatisEkAciklamaTanimi9',
            (v) => val.satisEkAciklamaTanimi9 = v as String?);
        $checkedConvert('SatisEkAciklamaTanimi10',
            (v) => val.satisEkAciklamaTanimi10 = v as String?);
        $checkedConvert('SatisEkAciklamaTanimi11',
            (v) => val.satisEkAciklamaTanimi11 = v as String?);
        $checkedConvert('SatisEkAciklamaTanimi12',
            (v) => val.satisEkAciklamaTanimi12 = v as String?);
        $checkedConvert('SatisEkAciklamaTanimi13',
            (v) => val.satisEkAciklamaTanimi13 = v as String?);
        $checkedConvert('SatisEkAciklamaTanimi14',
            (v) => val.satisEkAciklamaTanimi14 = v as String?);
        $checkedConvert('SatisEkAciklamaTanimi15',
            (v) => val.satisEkAciklamaTanimi15 = v as String?);
        $checkedConvert('SatisEkAciklamaTanimi16',
            (v) => val.satisEkAciklamaTanimi16 = v as String?);
        $checkedConvert(
            'SatisOzelKod1Aktif', (v) => val.satisOzelKod1Aktif = v as bool?);
        $checkedConvert(
            'SatisOzelKod2Aktif', (v) => val.satisOzelKod2Aktif = v as bool?);
        $checkedConvert('SatisSatirIsk1YuzdeSor',
            (v) => val.satisSatirIsk1YuzdeSor = v as bool?);
        $checkedConvert(
            'SatisKosulAktif', (v) => val.satisKosulAktif = v as bool?);
        $checkedConvert('SatisKosulSatirdaSor',
            (v) => val.satisKosulSatirdaSor = v as bool?);
        $checkedConvert('SatisFarkliTeslimCariAktif',
            (v) => val.satisFarkliTeslimCariAktif = v as bool?);
        $checkedConvert('SatisMalFazMiktarIskontoAcik',
            (v) => val.satisMalFazMiktarIskontoAcik = v as bool?);
        $checkedConvert('SatisSatirKademeliIskontoAcik',
            (v) => val.satisSatirKademeliIskontoAcik = v as bool?);
        $checkedConvert('SatisSatirKademeliIskontoSayisi',
            (v) => val.satisSatirKademeliIskontoSayisi = v as int?);
        $checkedConvert(
            'SatisGenIsk1Aktif', (v) => val.satisGenIsk1Aktif = v as bool?);
        $checkedConvert(
            'SatisGenIsk2Aktif', (v) => val.satisGenIsk2Aktif = v as bool?);
        $checkedConvert(
            'SatisGenIsk3Aktif', (v) => val.satisGenIsk3Aktif = v as bool?);
        $checkedConvert(
            'SatisTopluDepoAktif', (v) => val.satisTopluDepoAktif = v as bool?);
        $checkedConvert('SatisStokDepoKarttanGelsin',
            (v) => val.satisStokDepoKarttanGelsin = v as bool?);
        $checkedConvert('SatisGenellikleKDVHaric',
            (v) => val.satisGenellikleKdvHaric = v as bool?);
        $checkedConvert('SatisFarkliOlcuBirimleriKullan',
            (v) => val.satisFarkliOlcuBirimleriKullan = v as bool?);
        $checkedConvert('SatisCariRiskTakibi',
            (v) => val.satisCariRiskTakibi = v as String?);
        $checkedConvert(
            'SatisDovizAktif', (v) => val.satisDovizAktif = v as bool?);
        $checkedConvert(
            'SatisSatirdaKDVSor', (v) => val.satisSatirdaKdvSor = v as bool?);
        $checkedConvert('SatisSatirdaAciklamalarAktif',
            (v) => val.satisSatirdaAciklamalarAktif = v as bool?);
        $checkedConvert('SatisSatirdaEkAlan2Aktif',
            (v) => val.satisSatirdaEkAlan2Aktif = v as bool?);
        $checkedConvert('SatisEkMaliyet2Aktif',
            (v) => val.satisEkMaliyet2Aktif = v as bool?);
        $checkedConvert(
            'SatisEkMaliyet2Adi', (v) => val.satisEkMaliyet2Adi = v as String?);
        $checkedConvert(
            'SatisTevkifatPay', (v) => val.satisTevkifatPay = v as int?);
        $checkedConvert(
            'SatisTevkifatPayda', (v) => val.satisTevkifatPayda = v as int?);
        $checkedConvert('SatisFaturaFiyatSifirGecilsin',
            (v) => val.satisFaturaFiyatSifirGecilsin = v as bool?);
        $checkedConvert(
            'SatisFazlaTeslimat', (v) => val.satisFazlaTeslimat = v as bool?);
        $checkedConvert('SatisDovizTakipHangiDeger',
            (v) => val.satisDovizTakipHangiDeger = v as int?);
        $checkedConvert(
            'SatisHizmetAktif', (v) => val.satisHizmetAktif = v as bool?);
        $checkedConvert(
            'SatisHizmetDepoKodu', (v) => val.satisHizmetDepoKodu = v as int?);
        $checkedConvert(
            'SatisMiktar2Sor', (v) => val.satisMiktar2Sor = v as bool?);
        $checkedConvert('SatisSubeDATOnaylansin',
            (v) => val.satisSubeDatOnaylansin = v as bool?);
        $checkedConvert('SatisSatirdaTeslimTarihiSor',
            (v) => val.satisSatirdaTeslimTarihiSor = v as bool?);
        $checkedConvert('SatisSatirdaIsEmriSorulsun',
            (v) => val.satisSatirdaIsEmriSorulsun = v as bool?);
        $checkedConvert('SatisFisSeriTakibiVar',
            (v) => val.satisFisSeriTakibiVar = v as bool?);
        $checkedConvert(
            'SatisIrsCariHesaba', (v) => val.satisIrsCariHesaba = v as bool?);
        $checkedConvert(
            'SatisEkAlan1Aktif', (v) => val.satisEkAlan1Aktif = v as bool?);
        $checkedConvert('SatisDATSiparisTakibi',
            (v) => val.satisDatSiparisTakibi = v as String?);
        $checkedConvert('SatisIrsFatuSipVadeDegissin',
            (v) => val.satisIrsFatuSipVadeDegissin = v as String?);
        $checkedConvert(
            'KonsinyeUygulamasi', (v) => val.konsinyeUygulamasi = v as bool?);
        $checkedConvert(
            'MSenetDovizAktif', (v) => val.mSenetDovizAktif = v as bool?);
        $checkedConvert(
            'MCekDovizAktif', (v) => val.mCekDovizAktif = v as bool?);
        $checkedConvert(
            'MCekAciklamaAktif', (v) => val.mCekAciklamaAktif = v as bool?);
        $checkedConvert('SeriGirislerdeOtomatik',
            (v) => val.seriGirislerdeOtomatik = v as bool?);
        $checkedConvert(
            'SerideYilOlsun', (v) => val.serideYilOlsun = v as bool?);
        $checkedConvert('SerideAyOlsun', (v) => val.serideAyOlsun = v as bool?);
        $checkedConvert(
            'SerideGunOlsun', (v) => val.serideGunOlsun = v as bool?);
        $checkedConvert('SeriUzunlugu', (v) => val.seriUzunlugu = v as int?);
        $checkedConvert(
            'SeriEkAlanList',
            (v) => val.seriEkAlanList =
                (v as List<dynamic>?)?.map((e) => e as String).toList());
        $checkedConvert('EFaturaAktif', (v) => val.eFaturaAktif = v as bool?);
        $checkedConvert('Seri_EFatura', (v) => val.seriEFatura = v as String?);
        $checkedConvert('EFaturaSenaryoDegistir',
            (v) => val.eFaturaSenaryoDegistir = v as bool?);
        $checkedConvert(
            'EIrsaliyeAktif', (v) => val.eIrsaliyeAktif = v as bool?);
        $checkedConvert(
            'SeriEIrsaliye', (v) => val.seriEIrsaliye = v as String?);
        $checkedConvert(
            'ArrEIrsSeri',
            (v) => val.arrEIrsSeri =
                (v as List<dynamic>?)?.map((e) => e as String).toList());
        $checkedConvert(
            'ArrEFatSeri',
            (v) => val.arrEFatSeri =
                (v as List<dynamic>?)?.map((e) => e as String?).toList());
        $checkedConvert(
            'ArrEArSeri',
            (v) => val.arrEArSeri =
                (v as List<dynamic>?)?.map((e) => e as String?).toList());
        $checkedConvert('Seri_EArsiv', (v) => val.seriEArsiv = v as String?);
        $checkedConvert(
            'UretimEkAlanKullan', (v) => val.uretimEkAlanKullan = v as bool?);
        $checkedConvert('OzelFaturaIadeMaliyetiZorunlu',
            (v) => val.ozelFaturaIadeMaliyetiZorunlu = v as bool?);
        $checkedConvert('bankaKKartiKasayaIsle',
            (v) => val.bankaKKartiKasayaIsle = v as bool?);
        $checkedConvert('KayitliBankaHesapTipleri',
            (v) => val.kayitliBankaHesapTipleri = v as List<dynamic>?);
        $checkedConvert(
            'KKNoZorunluDegil', (v) => val.kkNoZorunluDegil = v as bool?);
        $checkedConvert(
            'FifoLifoYontem', (v) => val.fifoLifoYontem = v as String?);
        $checkedConvert('CariAktiviteUygulamasi',
            (v) => val.cariAktiviteUygulamasi = v as String?);
        $checkedConvert(
            'CariAktiviteTipleri',
            (v) => val.cariAktiviteTipleri = (v as List<dynamic>?)
                ?.map((e) =>
                    CariAktiviteTipleri.fromJson(e as Map<String, dynamic>))
                .toList());
        $checkedConvert(
            'CariAktiviteEkAlanlar',
            (v) => val.cariAktiviteEkAlanlar =
                (v as List<dynamic>?)?.map((e) => e as int).toList());
        $checkedConvert('SatisCariDovizTipiniKullan',
            (v) => val.satisCariDovizTipiniKullan = v as bool?);
        $checkedConvert('AlisCariDovizTipiniKullan',
            (v) => val.alisCariDovizTipiniKullan = v as bool?);
        $checkedConvert(
            'Fatu_KontrolAciklamasiAktif',
            (v) => val.fatuKontrolAciklamasiAktif =
                (v as List<dynamic>?)?.map((e) => e as String).toList());
        $checkedConvert('SatisFiyatGrubuSorulacakAlan',
            (v) => val.satisFiyatGrubuSorulacakAlan = v as String?);
        $checkedConvert('Siparis_FarkliSubeUyg',
            (v) => val.siparisFarkliSubeUyg = v as String?);
        $checkedConvert('SatisIskEkSahadanGelsin',
            (v) => val.satisIskEkSahadanGelsin = v as String?);
        $checkedConvert(
            'SatisIsk1Saha', (v) => val.satisIsk1Saha = v as String?);
        $checkedConvert(
            'SatisIsk1Kullanim', (v) => val.satisIsk1Kullanim = v as String?);
        $checkedConvert('Uretim_MalTop_HangiHucrede',
            (v) => val.uretimMalTopHangiHucrede = v as bool?);
        $checkedConvert('Uretim_MalTop_FazlaTeslimYapilabilir',
            (v) => val.uretimMalTopFazlaTeslimYapilabilir = v as bool?);
        $checkedConvert('Uretim_USK_SeriGirilsin',
            (v) => val.uretimUskSeriGirilsin = v as bool?);
        $checkedConvert('Finans_BankaIslemModulu',
            (v) => val.finansBankaIslemModulu = v as String?);
        $checkedConvert('Finans_BankaTcmbBankaKodu',
            (v) => val.finansBankaTcmbBankaKodu = v as String?);
        $checkedConvert('Finans_BankaTcmbSubeKodu',
            (v) => val.finansBankaTcmbSubeKodu = v as String?);
        $checkedConvert(
            'Finans_CekSenOzelOrtalamaVadeGunuHesapla',
            (v) => val.finansCekSenOzelOrtalamaVadeGunuHesapla =
                (v as List<dynamic>?)?.map((e) => e as String).toList());
        $checkedConvert(
            'Stok_Yap_RehberTipi', (v) => val.stokYapRehberTipi = v as String?);
        $checkedConvert('Stok_KanbanBarkodEslemeUyg',
            (v) => val.stokKanbanBarkodEslemeUyg = v as String?);
        $checkedConvert('Stok_SeriParcalamaUyg',
            (v) => val.stokSeriParcalamaUyg = v as String?);
        $checkedConvert(
            'Stok_DetayliAramaAlanlar',
            (v) => val.stokDetayliAramaAlanlar = (v as List<dynamic>?)
                ?.map((e) =>
                    StokDetayliAramaAlanlar.fromJson(e as Map<String, dynamic>))
                .toList());
        $checkedConvert('Genel_KonumTakibiYapilsin',
            (v) => val.genelKonumTakibiYapilsin = v as String?);
        $checkedConvert('Genel_KonumTakibiDakika',
            (v) => val.genelKonumTakibiDakika = v as int?);
        $checkedConvert('Genel_KonumTakibiMetre',
            (v) => val.genelKonumTakibiMetre = v as int?);
        $checkedConvert(
            'UetdsEsyaAktif', (v) => val.uetdsEsyaAktif = v as bool?);
        $checkedConvert('SatistaSiparisKullan',
            (v) => val.satistaSiparisKullan = v as bool?);
        $checkedConvert(
            'AlistaSiparisKullan', (v) => val.alistaSiparisKullan = v as bool?);
        $checkedConvert(
            'SipOtoEslestir', (v) => val.sipOtoEslestir = v as bool?);
        $checkedConvert('SevkEmriTerminalFatura',
            (v) => val.sevkEmriTerminalFatura = v as bool?);
        $checkedConvert('SevkEmriTerminalIrsaliye',
            (v) => val.sevkEmriTerminalIrsaliye = v as bool?);
        $checkedConvert('SevkEmriTerminalTransfer',
            (v) => val.sevkEmriTerminalTransfer = v as bool?);
        $checkedConvert('SevkEmriHucreKontrol',
            (v) => val.sevkEmriHucreKontrol = v as bool?);
        $checkedConvert(
            'SevkEmriMalTopGorunecekAlanlar',
            (v) => val.sevkEmriMalTopGorunecekAlanlar =
                (v as List<dynamic>?)?.map((e) => e as String).toList());
        $checkedConvert(
            'Seri_SevkIrsaliye', (v) => val.seriSevkIrsaliye = v as String?);
        $checkedConvert('KontrolluBelgeAktarimAktif',
            (v) => val.kontrolluBelgeAktarimAktif = v as bool?);
        $checkedConvert(
            'KontrolluBelgeAktarimBelgeNoGoster',
            (v) =>
                val.kontrolluBelgeAktarimBelgeNoGoster = v as List<dynamic>?);
        $checkedConvert(
            'EMustahsilAktif', (v) => val.eMustahsilAktif = v as bool?);
        return val;
      },
      fieldKeyMap: const {
        'paramYuklendi': 'ParamYuklendi',
        'kullanici': 'KULLANICI',
        'sirket': 'SIRKET',
        'isletmeKodu': 'ISLETME_KODU',
        'mapCariKullSahalar': 'MapCariKullSahalar',
        'mapCariEkAlanlar': 'MapCariEkAlanlar',
        'netsisOndalikResponseModel': '_NetsisOndalikResponseModel',
        'depoList': 'DepoList',
        'dovizList': 'DovizList',
        'satirAcikBaslikList': 'SatirAcikBaslikList',
        'kasaList': 'KasaList',
        'plasiyerList': 'PlasiyerList',
        'plasiyerListTumu': 'PlasiyerListTumu',
        'subeList': 'SubeList',
        'talTekParam': 'TalTekParam',
        'cekSenParam': 'CekSenParam',
        'listOzelKodTum': 'ListOzelKodTum',
        'listIskTip': 'ListIskTip',
        'listCariOdemeKodu': 'ListCariOdemeKodu',
        'yaziciList': 'YaziciList',
        'netFectDizaynList': 'NetFectDizaynList',
        'mapStokGrupAdlari': 'MapStokGrupAdlari',
        'mustahsilParam': 'MustahsilParam',
        'listFatuEkMaliyet': 'ListFatuEkMaliyet',
        'mapKdvSifirBelgeTipiOzelKod2': 'MapKdvSifirBelgeTipiOzelKod2',
        'lokalDepoUygulamasiAcik': 'LokalDepoUygulamasiAcik',
        'esnekYapilandir': 'EsnekYapilandir',
        'ozelFiyatSistemi': 'OzelFiyatSistemi',
        'sadeceOzelFiyatSistemi': 'SadeceOzelFiyatSistemi',
        'otvliStoklarVar': 'OtvliStoklarVar',
        'mapStokKullSahalar': 'MapStokKullSahalar',
        'mapStokEkAlanlar': 'MapStokEkAlanlar',
        'karmaKoliUyg': 'KarmaKoliUyg',
        'alisEkAciklamalarAktif': 'AlisEkAciklamalarAktif',
        'alisEkAciklamaTanimi1': 'AlisEkAciklamaTanimi1',
        'alisEkAciklamaTanimi2': 'AlisEkAciklamaTanimi2',
        'alisEkAciklamaTanimi3': 'AlisEkAciklamaTanimi3',
        'alisEkAciklamaTanimi4': 'AlisEkAciklamaTanimi4',
        'alisEkAciklamaTanimi5': 'AlisEkAciklamaTanimi5',
        'alisEkAciklamaTanimi6': 'AlisEkAciklamaTanimi6',
        'alisEkAciklamaTanimi7': 'AlisEkAciklamaTanimi7',
        'alisEkAciklamaTanimi8': 'AlisEkAciklamaTanimi8',
        'alisEkAciklamaTanimi9': 'AlisEkAciklamaTanimi9',
        'alisEkAciklamaTanimi10': 'AlisEkAciklamaTanimi10',
        'alisEkAciklamaTanimi11': 'AlisEkAciklamaTanimi11',
        'alisEkAciklamaTanimi12': 'AlisEkAciklamaTanimi12',
        'alisEkAciklamaTanimi13': 'AlisEkAciklamaTanimi13',
        'alisEkAciklamaTanimi14': 'AlisEkAciklamaTanimi14',
        'alisEkAciklamaTanimi15': 'AlisEkAciklamaTanimi15',
        'alisEkAciklamaTanimi16': 'AlisEkAciklamaTanimi16',
        'alisOzelKod1Tablodan': 'AlisOzelKod1Tablodan',
        'alisKosulAktif': 'AlisKosulAktif',
        'alisFarkliTeslimCariAktif': 'AlisFarkliTeslimCariAktif',
        'alisMalFazMiktarIskontoAcik': 'AlisMalFazMiktarIskontoAcik',
        'alisSatirKademeliIskontoAcik': 'AlisSatirKademeliIskontoAcik',
        'alisSatirKademeliIskontoSayisi': 'AlisSatirKademeliIskontoSayisi',
        'alisGenIsk1Aktif': 'AlisGenIsk1Aktif',
        'alisGenIsk2Aktif': 'AlisGenIsk2Aktif',
        'alisGenIsk3Aktif': 'AlisGenIsk3Aktif',
        'alisTopluDepoAktif': 'AlisTopluDepoAktif',
        'alisStokDepoKarttanGelsin': 'AlisStokDepoKarttanGelsin',
        'alisGenellikleKdvHaric': 'AlisGenellikleKDVHaric',
        'alisFarkliOlcuBirimleriKullan': 'AlisFarkliOlcuBirimleriKullan',
        'alisDovizAktif': 'AlisDovizAktif',
        'alisSatirdaKdvSor': 'AlisSatirdaKDVSor',
        'alisSatirdaAciklamalarAktif': 'AlisSatirdaAciklamalarAktif',
        'alisSatirdaEkAlan2Aktif': 'AlisSatirdaEkAlan2Aktif',
        'alisEkMaliyet2Aktif': 'AlisEkMaliyet2Aktif',
        'alisEkMaliyet2Adi': 'AlisEkMaliyet2Adi',
        'alisTevkifatPay': 'AlisTevkifatPay',
        'alisTevkifatPayda': 'AlisTevkifatPayda',
        'alisFaturaFiyatSifirGecilsin': 'AlisFaturaFiyatSifirGecilsin',
        'alisFazlaTeslimat': 'AlisFazlaTeslimat',
        'alisDovizTakipHangiDeger': 'AlisDovizTakipHangiDeger',
        'alisHizmetAktif': 'AlisHizmetAktif',
        'alisHizmetDepoKodu': 'AlisHizmetDepoKodu',
        'alisMiktar2Sor': 'AlisMiktar2Sor',
        'alisSatirdaTeslimTarihiSor': 'AlisSatirdaTeslimTarihiSor',
        'alisFisSeriTakibiVar': 'AlisFisSeriTakibiVar',
        'alisTutardanFiyataGecilsin': 'AlisTutardanFiyataGecilsin',
        'alisCariIskSatiraUygula': 'AlisCariIskSatiraUygula',
        'seriUygulamasiAcik': 'SeriUygulamasiAcik',
        'sirketDovizUygulamasiAcik': 'SirketDovizUygulamasiAcik',
        'sirketDovizUygulamasiDovizKodu': 'SirketDovizUygulamasiDovizKodu',
        'plasiyerUygulamasi': 'PlasiyerUygulamasi',
        'paraBirimi': 'ParaBirimi',
        'bankaEntegre': 'BankaEntegre',
        'bagliCariVar': 'BagliCariVar',
        'projeUygulamasiAcik': 'ProjeUygulamasiAcik',
        'satisEkAciklamalarAktif': 'SatisEkAciklamalarAktif',
        'satisEkAciklamaTanimi1': 'SatisEkAciklamaTanimi1',
        'satisEkAciklamaTanimi2': 'SatisEkAciklamaTanimi2',
        'satisEkAciklamaTanimi3': 'SatisEkAciklamaTanimi3',
        'satisEkAciklamaTanimi4': 'SatisEkAciklamaTanimi4',
        'satisEkAciklamaTanimi5': 'SatisEkAciklamaTanimi5',
        'satisEkAciklamaTanimi6': 'SatisEkAciklamaTanimi6',
        'satisEkAciklamaTanimi7': 'SatisEkAciklamaTanimi7',
        'satisEkAciklamaTanimi8': 'SatisEkAciklamaTanimi8',
        'satisEkAciklamaTanimi9': 'SatisEkAciklamaTanimi9',
        'satisEkAciklamaTanimi10': 'SatisEkAciklamaTanimi10',
        'satisEkAciklamaTanimi11': 'SatisEkAciklamaTanimi11',
        'satisEkAciklamaTanimi12': 'SatisEkAciklamaTanimi12',
        'satisEkAciklamaTanimi13': 'SatisEkAciklamaTanimi13',
        'satisEkAciklamaTanimi14': 'SatisEkAciklamaTanimi14',
        'satisEkAciklamaTanimi15': 'SatisEkAciklamaTanimi15',
        'satisEkAciklamaTanimi16': 'SatisEkAciklamaTanimi16',
        'satisOzelKod1Aktif': 'SatisOzelKod1Aktif',
        'satisOzelKod2Aktif': 'SatisOzelKod2Aktif',
        'satisSatirIsk1YuzdeSor': 'SatisSatirIsk1YuzdeSor',
        'satisKosulAktif': 'SatisKosulAktif',
        'satisKosulSatirdaSor': 'SatisKosulSatirdaSor',
        'satisFarkliTeslimCariAktif': 'SatisFarkliTeslimCariAktif',
        'satisMalFazMiktarIskontoAcik': 'SatisMalFazMiktarIskontoAcik',
        'satisSatirKademeliIskontoAcik': 'SatisSatirKademeliIskontoAcik',
        'satisSatirKademeliIskontoSayisi': 'SatisSatirKademeliIskontoSayisi',
        'satisGenIsk1Aktif': 'SatisGenIsk1Aktif',
        'satisGenIsk2Aktif': 'SatisGenIsk2Aktif',
        'satisGenIsk3Aktif': 'SatisGenIsk3Aktif',
        'satisTopluDepoAktif': 'SatisTopluDepoAktif',
        'satisStokDepoKarttanGelsin': 'SatisStokDepoKarttanGelsin',
        'satisGenellikleKdvHaric': 'SatisGenellikleKDVHaric',
        'satisFarkliOlcuBirimleriKullan': 'SatisFarkliOlcuBirimleriKullan',
        'satisCariRiskTakibi': 'SatisCariRiskTakibi',
        'satisDovizAktif': 'SatisDovizAktif',
        'satisSatirdaKdvSor': 'SatisSatirdaKDVSor',
        'satisSatirdaAciklamalarAktif': 'SatisSatirdaAciklamalarAktif',
        'satisSatirdaEkAlan2Aktif': 'SatisSatirdaEkAlan2Aktif',
        'satisEkMaliyet2Aktif': 'SatisEkMaliyet2Aktif',
        'satisEkMaliyet2Adi': 'SatisEkMaliyet2Adi',
        'satisTevkifatPay': 'SatisTevkifatPay',
        'satisTevkifatPayda': 'SatisTevkifatPayda',
        'satisFaturaFiyatSifirGecilsin': 'SatisFaturaFiyatSifirGecilsin',
        'satisFazlaTeslimat': 'SatisFazlaTeslimat',
        'satisDovizTakipHangiDeger': 'SatisDovizTakipHangiDeger',
        'satisHizmetAktif': 'SatisHizmetAktif',
        'satisHizmetDepoKodu': 'SatisHizmetDepoKodu',
        'satisMiktar2Sor': 'SatisMiktar2Sor',
        'satisSubeDatOnaylansin': 'SatisSubeDATOnaylansin',
        'satisSatirdaTeslimTarihiSor': 'SatisSatirdaTeslimTarihiSor',
        'satisSatirdaIsEmriSorulsun': 'SatisSatirdaIsEmriSorulsun',
        'satisFisSeriTakibiVar': 'SatisFisSeriTakibiVar',
        'satisIrsCariHesaba': 'SatisIrsCariHesaba',
        'satisEkAlan1Aktif': 'SatisEkAlan1Aktif',
        'satisDatSiparisTakibi': 'SatisDATSiparisTakibi',
        'satisIrsFatuSipVadeDegissin': 'SatisIrsFatuSipVadeDegissin',
        'konsinyeUygulamasi': 'KonsinyeUygulamasi',
        'mSenetDovizAktif': 'MSenetDovizAktif',
        'mCekDovizAktif': 'MCekDovizAktif',
        'mCekAciklamaAktif': 'MCekAciklamaAktif',
        'seriGirislerdeOtomatik': 'SeriGirislerdeOtomatik',
        'serideYilOlsun': 'SerideYilOlsun',
        'serideAyOlsun': 'SerideAyOlsun',
        'serideGunOlsun': 'SerideGunOlsun',
        'seriUzunlugu': 'SeriUzunlugu',
        'seriEkAlanList': 'SeriEkAlanList',
        'eFaturaAktif': 'EFaturaAktif',
        'seriEFatura': 'Seri_EFatura',
        'eFaturaSenaryoDegistir': 'EFaturaSenaryoDegistir',
        'eIrsaliyeAktif': 'EIrsaliyeAktif',
        'seriEIrsaliye': 'SeriEIrsaliye',
        'arrEIrsSeri': 'ArrEIrsSeri',
        'arrEFatSeri': 'ArrEFatSeri',
        'arrEArSeri': 'ArrEArSeri',
        'seriEArsiv': 'Seri_EArsiv',
        'uretimEkAlanKullan': 'UretimEkAlanKullan',
        'ozelFaturaIadeMaliyetiZorunlu': 'OzelFaturaIadeMaliyetiZorunlu',
        'kayitliBankaHesapTipleri': 'KayitliBankaHesapTipleri',
        'kkNoZorunluDegil': 'KKNoZorunluDegil',
        'fifoLifoYontem': 'FifoLifoYontem',
        'cariAktiviteUygulamasi': 'CariAktiviteUygulamasi',
        'cariAktiviteTipleri': 'CariAktiviteTipleri',
        'cariAktiviteEkAlanlar': 'CariAktiviteEkAlanlar',
        'satisCariDovizTipiniKullan': 'SatisCariDovizTipiniKullan',
        'alisCariDovizTipiniKullan': 'AlisCariDovizTipiniKullan',
        'fatuKontrolAciklamasiAktif': 'Fatu_KontrolAciklamasiAktif',
        'satisFiyatGrubuSorulacakAlan': 'SatisFiyatGrubuSorulacakAlan',
        'siparisFarkliSubeUyg': 'Siparis_FarkliSubeUyg',
        'satisIskEkSahadanGelsin': 'SatisIskEkSahadanGelsin',
        'satisIsk1Saha': 'SatisIsk1Saha',
        'satisIsk1Kullanim': 'SatisIsk1Kullanim',
        'uretimMalTopHangiHucrede': 'Uretim_MalTop_HangiHucrede',
        'uretimMalTopFazlaTeslimYapilabilir':
            'Uretim_MalTop_FazlaTeslimYapilabilir',
        'uretimUskSeriGirilsin': 'Uretim_USK_SeriGirilsin',
        'finansBankaIslemModulu': 'Finans_BankaIslemModulu',
        'finansBankaTcmbBankaKodu': 'Finans_BankaTcmbBankaKodu',
        'finansBankaTcmbSubeKodu': 'Finans_BankaTcmbSubeKodu',
        'finansCekSenOzelOrtalamaVadeGunuHesapla':
            'Finans_CekSenOzelOrtalamaVadeGunuHesapla',
        'stokYapRehberTipi': 'Stok_Yap_RehberTipi',
        'stokKanbanBarkodEslemeUyg': 'Stok_KanbanBarkodEslemeUyg',
        'stokSeriParcalamaUyg': 'Stok_SeriParcalamaUyg',
        'stokDetayliAramaAlanlar': 'Stok_DetayliAramaAlanlar',
        'genelKonumTakibiYapilsin': 'Genel_KonumTakibiYapilsin',
        'genelKonumTakibiDakika': 'Genel_KonumTakibiDakika',
        'genelKonumTakibiMetre': 'Genel_KonumTakibiMetre',
        'uetdsEsyaAktif': 'UetdsEsyaAktif',
        'satistaSiparisKullan': 'SatistaSiparisKullan',
        'alistaSiparisKullan': 'AlistaSiparisKullan',
        'sipOtoEslestir': 'SipOtoEslestir',
        'sevkEmriTerminalFatura': 'SevkEmriTerminalFatura',
        'sevkEmriTerminalIrsaliye': 'SevkEmriTerminalIrsaliye',
        'sevkEmriTerminalTransfer': 'SevkEmriTerminalTransfer',
        'sevkEmriHucreKontrol': 'SevkEmriHucreKontrol',
        'sevkEmriMalTopGorunecekAlanlar': 'SevkEmriMalTopGorunecekAlanlar',
        'seriSevkIrsaliye': 'Seri_SevkIrsaliye',
        'kontrolluBelgeAktarimAktif': 'KontrolluBelgeAktarimAktif',
        'kontrolluBelgeAktarimBelgeNoGoster':
            'KontrolluBelgeAktarimBelgeNoGoster',
        'eMustahsilAktif': 'EMustahsilAktif'
      },
    );

Map<String, dynamic> _$ParamModelToJson(ParamModel instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ParamYuklendi', instance.paramYuklendi);
  writeNotNull('KULLANICI', instance.kullanici);
  writeNotNull('SIRKET', instance.sirket);
  writeNotNull('ISLETME_KODU', instance.isletmeKodu);
  writeNotNull('MapCariKullSahalar', instance.mapCariKullSahalar?.toJson());
  writeNotNull('MapCariEkAlanlar',
      instance.mapCariEkAlanlar?.map((e) => e.toJson()).toList());
  writeNotNull('sabitSayfalamaOgeSayisi', instance.sabitSayfalamaOgeSayisi);
  writeNotNull('_NetsisOndalikResponseModel',
      instance.netsisOndalikResponseModel?.map((e) => e.toJson()).toList());
  writeNotNull('DepoList', instance.depoList?.map((e) => e.toJson()).toList());
  writeNotNull(
      'DovizList', instance.dovizList?.map((e) => e.toJson()).toList());
  writeNotNull('SatirAcikBaslikList',
      instance.satirAcikBaslikList?.map((e) => e.toJson()).toList());
  writeNotNull('KasaList', instance.kasaList?.map((e) => e.toJson()).toList());
  writeNotNull(
      'PlasiyerList', instance.plasiyerList?.map((e) => e.toJson()).toList());
  writeNotNull('PlasiyerListTumu',
      instance.plasiyerListTumu?.map((e) => e.toJson()).toList());
  writeNotNull('SubeList', instance.subeList?.map((e) => e.toJson()).toList());
  writeNotNull(
      'TalTekParam', instance.talTekParam?.map((e) => e.toJson()).toList());
  writeNotNull(
      'CekSenParam', instance.cekSenParam?.map((e) => e.toJson()).toList());
  writeNotNull('ListOzelKodTum',
      instance.listOzelKodTum?.map((e) => e.toJson()).toList());
  writeNotNull(
      'ListIskTip', instance.listIskTip?.map((e) => e.toJson()).toList());
  writeNotNull('ListCariOdemeKodu',
      instance.listCariOdemeKodu?.map((e) => e.toJson()).toList());
  writeNotNull(
      'YaziciList', instance.yaziciList?.map((e) => e.toJson()).toList());
  writeNotNull('NetFectDizaynList',
      instance.netFectDizaynList?.map((e) => e.toJson()).toList());
  writeNotNull('MapStokGrupAdlari', instance.mapStokGrupAdlari?.toJson());
  writeNotNull('MustahsilParam', instance.mustahsilParam?.toJson());
  writeNotNull('ListFatuEkMaliyet',
      instance.listFatuEkMaliyet?.map((e) => e.toJson()).toList());
  writeNotNull('MapKdvSifirBelgeTipiOzelKod2',
      instance.mapKdvSifirBelgeTipiOzelKod2?.toJson());
  writeNotNull('LokalDepoUygulamasiAcik', instance.lokalDepoUygulamasiAcik);
  writeNotNull('EsnekYapilandir', instance.esnekYapilandir);
  writeNotNull('OzelFiyatSistemi', instance.ozelFiyatSistemi);
  writeNotNull('SadeceOzelFiyatSistemi', instance.sadeceOzelFiyatSistemi);
  writeNotNull('OtvliStoklarVar', instance.otvliStoklarVar);
  writeNotNull('MapStokKullSahalar', instance.mapStokKullSahalar?.toJson());
  writeNotNull('MapStokEkAlanlar',
      instance.mapStokEkAlanlar?.map((e) => e.toJson()).toList());
  writeNotNull('KarmaKoliUyg', instance.karmaKoliUyg);
  writeNotNull('AlisEkAciklamalarAktif', instance.alisEkAciklamalarAktif);
  writeNotNull('AlisEkAciklamaTanimi1', instance.alisEkAciklamaTanimi1);
  writeNotNull('AlisEkAciklamaTanimi2', instance.alisEkAciklamaTanimi2);
  writeNotNull('AlisEkAciklamaTanimi3', instance.alisEkAciklamaTanimi3);
  writeNotNull('AlisEkAciklamaTanimi4', instance.alisEkAciklamaTanimi4);
  writeNotNull('AlisEkAciklamaTanimi5', instance.alisEkAciklamaTanimi5);
  writeNotNull('AlisEkAciklamaTanimi6', instance.alisEkAciklamaTanimi6);
  writeNotNull('AlisEkAciklamaTanimi7', instance.alisEkAciklamaTanimi7);
  writeNotNull('AlisEkAciklamaTanimi8', instance.alisEkAciklamaTanimi8);
  writeNotNull('AlisEkAciklamaTanimi9', instance.alisEkAciklamaTanimi9);
  writeNotNull('AlisEkAciklamaTanimi10', instance.alisEkAciklamaTanimi10);
  writeNotNull('AlisEkAciklamaTanimi11', instance.alisEkAciklamaTanimi11);
  writeNotNull('AlisEkAciklamaTanimi12', instance.alisEkAciklamaTanimi12);
  writeNotNull('AlisEkAciklamaTanimi13', instance.alisEkAciklamaTanimi13);
  writeNotNull('AlisEkAciklamaTanimi14', instance.alisEkAciklamaTanimi14);
  writeNotNull('AlisEkAciklamaTanimi15', instance.alisEkAciklamaTanimi15);
  writeNotNull('AlisEkAciklamaTanimi16', instance.alisEkAciklamaTanimi16);
  writeNotNull('AlisOzelKod1Tablodan', instance.alisOzelKod1Tablodan);
  writeNotNull('AlisKosulAktif', instance.alisKosulAktif);
  writeNotNull('AlisFarkliTeslimCariAktif', instance.alisFarkliTeslimCariAktif);
  writeNotNull(
      'AlisMalFazMiktarIskontoAcik', instance.alisMalFazMiktarIskontoAcik);
  writeNotNull(
      'AlisSatirKademeliIskontoAcik', instance.alisSatirKademeliIskontoAcik);
  writeNotNull('AlisSatirKademeliIskontoSayisi',
      instance.alisSatirKademeliIskontoSayisi);
  writeNotNull('AlisGenIsk1Aktif', instance.alisGenIsk1Aktif);
  writeNotNull('AlisGenIsk2Aktif', instance.alisGenIsk2Aktif);
  writeNotNull('AlisGenIsk3Aktif', instance.alisGenIsk3Aktif);
  writeNotNull('AlisTopluDepoAktif', instance.alisTopluDepoAktif);
  writeNotNull('AlisStokDepoKarttanGelsin', instance.alisStokDepoKarttanGelsin);
  writeNotNull('AlisGenellikleKDVHaric', instance.alisGenellikleKdvHaric);
  writeNotNull(
      'AlisFarkliOlcuBirimleriKullan', instance.alisFarkliOlcuBirimleriKullan);
  writeNotNull('AlisDovizAktif', instance.alisDovizAktif);
  writeNotNull('AlisSatirdaKDVSor', instance.alisSatirdaKdvSor);
  writeNotNull(
      'AlisSatirdaAciklamalarAktif', instance.alisSatirdaAciklamalarAktif);
  writeNotNull('AlisSatirdaEkAlan2Aktif', instance.alisSatirdaEkAlan2Aktif);
  writeNotNull('AlisEkMaliyet2Aktif', instance.alisEkMaliyet2Aktif);
  writeNotNull('AlisEkMaliyet2Adi', instance.alisEkMaliyet2Adi);
  writeNotNull('AlisTevkifatPay', instance.alisTevkifatPay);
  writeNotNull('AlisTevkifatPayda', instance.alisTevkifatPayda);
  writeNotNull(
      'AlisFaturaFiyatSifirGecilsin', instance.alisFaturaFiyatSifirGecilsin);
  writeNotNull('AlisFazlaTeslimat', instance.alisFazlaTeslimat);
  writeNotNull('AlisDovizTakipHangiDeger', instance.alisDovizTakipHangiDeger);
  writeNotNull('AlisHizmetAktif', instance.alisHizmetAktif);
  writeNotNull('AlisHizmetDepoKodu', instance.alisHizmetDepoKodu);
  writeNotNull('AlisMiktar2Sor', instance.alisMiktar2Sor);
  writeNotNull(
      'AlisSatirdaTeslimTarihiSor', instance.alisSatirdaTeslimTarihiSor);
  writeNotNull('AlisFisSeriTakibiVar', instance.alisFisSeriTakibiVar);
  writeNotNull(
      'AlisTutardanFiyataGecilsin', instance.alisTutardanFiyataGecilsin);
  writeNotNull('AlisCariIskSatiraUygula', instance.alisCariIskSatiraUygula);
  writeNotNull('SeriUygulamasiAcik', instance.seriUygulamasiAcik);
  writeNotNull('SirketDovizUygulamasiAcik', instance.sirketDovizUygulamasiAcik);
  writeNotNull('SirketDovizUygulamasiDovizKodu',
      instance.sirketDovizUygulamasiDovizKodu);
  writeNotNull('PlasiyerUygulamasi', instance.plasiyerUygulamasi);
  writeNotNull('ParaBirimi', instance.paraBirimi);
  writeNotNull('BankaEntegre', instance.bankaEntegre);
  writeNotNull('BagliCariVar', instance.bagliCariVar);
  writeNotNull('ProjeUygulamasiAcik', instance.projeUygulamasiAcik);
  writeNotNull('SatisEkAciklamalarAktif', instance.satisEkAciklamalarAktif);
  writeNotNull('SatisEkAciklamaTanimi1', instance.satisEkAciklamaTanimi1);
  writeNotNull('SatisEkAciklamaTanimi2', instance.satisEkAciklamaTanimi2);
  writeNotNull('SatisEkAciklamaTanimi3', instance.satisEkAciklamaTanimi3);
  writeNotNull('SatisEkAciklamaTanimi4', instance.satisEkAciklamaTanimi4);
  writeNotNull('SatisEkAciklamaTanimi5', instance.satisEkAciklamaTanimi5);
  writeNotNull('SatisEkAciklamaTanimi6', instance.satisEkAciklamaTanimi6);
  writeNotNull('SatisEkAciklamaTanimi7', instance.satisEkAciklamaTanimi7);
  writeNotNull('SatisEkAciklamaTanimi8', instance.satisEkAciklamaTanimi8);
  writeNotNull('SatisEkAciklamaTanimi9', instance.satisEkAciklamaTanimi9);
  writeNotNull('SatisEkAciklamaTanimi10', instance.satisEkAciklamaTanimi10);
  writeNotNull('SatisEkAciklamaTanimi11', instance.satisEkAciklamaTanimi11);
  writeNotNull('SatisEkAciklamaTanimi12', instance.satisEkAciklamaTanimi12);
  writeNotNull('SatisEkAciklamaTanimi13', instance.satisEkAciklamaTanimi13);
  writeNotNull('SatisEkAciklamaTanimi14', instance.satisEkAciklamaTanimi14);
  writeNotNull('SatisEkAciklamaTanimi15', instance.satisEkAciklamaTanimi15);
  writeNotNull('SatisEkAciklamaTanimi16', instance.satisEkAciklamaTanimi16);
  writeNotNull('SatisOzelKod1Aktif', instance.satisOzelKod1Aktif);
  writeNotNull('SatisOzelKod2Aktif', instance.satisOzelKod2Aktif);
  writeNotNull('SatisSatirIsk1YuzdeSor', instance.satisSatirIsk1YuzdeSor);
  writeNotNull('SatisKosulAktif', instance.satisKosulAktif);
  writeNotNull('SatisKosulSatirdaSor', instance.satisKosulSatirdaSor);
  writeNotNull(
      'SatisFarkliTeslimCariAktif', instance.satisFarkliTeslimCariAktif);
  writeNotNull(
      'SatisMalFazMiktarIskontoAcik', instance.satisMalFazMiktarIskontoAcik);
  writeNotNull(
      'SatisSatirKademeliIskontoAcik', instance.satisSatirKademeliIskontoAcik);
  writeNotNull('SatisSatirKademeliIskontoSayisi',
      instance.satisSatirKademeliIskontoSayisi);
  writeNotNull('SatisGenIsk1Aktif', instance.satisGenIsk1Aktif);
  writeNotNull('SatisGenIsk2Aktif', instance.satisGenIsk2Aktif);
  writeNotNull('SatisGenIsk3Aktif', instance.satisGenIsk3Aktif);
  writeNotNull('SatisTopluDepoAktif', instance.satisTopluDepoAktif);
  writeNotNull(
      'SatisStokDepoKarttanGelsin', instance.satisStokDepoKarttanGelsin);
  writeNotNull('SatisGenellikleKDVHaric', instance.satisGenellikleKdvHaric);
  writeNotNull('SatisFarkliOlcuBirimleriKullan',
      instance.satisFarkliOlcuBirimleriKullan);
  writeNotNull('SatisCariRiskTakibi', instance.satisCariRiskTakibi);
  writeNotNull('SatisDovizAktif', instance.satisDovizAktif);
  writeNotNull('SatisSatirdaKDVSor', instance.satisSatirdaKdvSor);
  writeNotNull(
      'SatisSatirdaAciklamalarAktif', instance.satisSatirdaAciklamalarAktif);
  writeNotNull('SatisSatirdaEkAlan2Aktif', instance.satisSatirdaEkAlan2Aktif);
  writeNotNull('SatisEkMaliyet2Aktif', instance.satisEkMaliyet2Aktif);
  writeNotNull('SatisEkMaliyet2Adi', instance.satisEkMaliyet2Adi);
  writeNotNull('SatisTevkifatPay', instance.satisTevkifatPay);
  writeNotNull('SatisTevkifatPayda', instance.satisTevkifatPayda);
  writeNotNull(
      'SatisFaturaFiyatSifirGecilsin', instance.satisFaturaFiyatSifirGecilsin);
  writeNotNull('SatisFazlaTeslimat', instance.satisFazlaTeslimat);
  writeNotNull('SatisDovizTakipHangiDeger', instance.satisDovizTakipHangiDeger);
  writeNotNull('SatisHizmetAktif', instance.satisHizmetAktif);
  writeNotNull('SatisHizmetDepoKodu', instance.satisHizmetDepoKodu);
  writeNotNull('SatisMiktar2Sor', instance.satisMiktar2Sor);
  writeNotNull('SatisSubeDATOnaylansin', instance.satisSubeDatOnaylansin);
  writeNotNull(
      'SatisSatirdaTeslimTarihiSor', instance.satisSatirdaTeslimTarihiSor);
  writeNotNull(
      'SatisSatirdaIsEmriSorulsun', instance.satisSatirdaIsEmriSorulsun);
  writeNotNull('SatisFisSeriTakibiVar', instance.satisFisSeriTakibiVar);
  writeNotNull('SatisIrsCariHesaba', instance.satisIrsCariHesaba);
  writeNotNull('SatisEkAlan1Aktif', instance.satisEkAlan1Aktif);
  writeNotNull('SatisDATSiparisTakibi', instance.satisDatSiparisTakibi);
  writeNotNull(
      'SatisIrsFatuSipVadeDegissin', instance.satisIrsFatuSipVadeDegissin);
  writeNotNull('KonsinyeUygulamasi', instance.konsinyeUygulamasi);
  writeNotNull('MSenetDovizAktif', instance.mSenetDovizAktif);
  writeNotNull('MCekDovizAktif', instance.mCekDovizAktif);
  writeNotNull('MCekAciklamaAktif', instance.mCekAciklamaAktif);
  writeNotNull('SeriGirislerdeOtomatik', instance.seriGirislerdeOtomatik);
  writeNotNull('SerideYilOlsun', instance.serideYilOlsun);
  writeNotNull('SerideAyOlsun', instance.serideAyOlsun);
  writeNotNull('SerideGunOlsun', instance.serideGunOlsun);
  writeNotNull('SeriUzunlugu', instance.seriUzunlugu);
  writeNotNull('SeriEkAlanList', instance.seriEkAlanList);
  writeNotNull('EFaturaAktif', instance.eFaturaAktif);
  writeNotNull('Seri_EFatura', instance.seriEFatura);
  writeNotNull('EFaturaSenaryoDegistir', instance.eFaturaSenaryoDegistir);
  writeNotNull('EIrsaliyeAktif', instance.eIrsaliyeAktif);
  writeNotNull('SeriEIrsaliye', instance.seriEIrsaliye);
  writeNotNull('ArrEIrsSeri', instance.arrEIrsSeri);
  writeNotNull('ArrEFatSeri', instance.arrEFatSeri);
  writeNotNull('ArrEArSeri', instance.arrEArSeri);
  writeNotNull('Seri_EArsiv', instance.seriEArsiv);
  writeNotNull('UretimEkAlanKullan', instance.uretimEkAlanKullan);
  writeNotNull(
      'OzelFaturaIadeMaliyetiZorunlu', instance.ozelFaturaIadeMaliyetiZorunlu);
  writeNotNull('bankaKKartiKasayaIsle', instance.bankaKKartiKasayaIsle);
  writeNotNull('KayitliBankaHesapTipleri', instance.kayitliBankaHesapTipleri);
  writeNotNull('KKNoZorunluDegil', instance.kkNoZorunluDegil);
  writeNotNull('FifoLifoYontem', instance.fifoLifoYontem);
  writeNotNull('CariAktiviteUygulamasi', instance.cariAktiviteUygulamasi);
  writeNotNull('CariAktiviteTipleri',
      instance.cariAktiviteTipleri?.map((e) => e.toJson()).toList());
  writeNotNull('CariAktiviteEkAlanlar', instance.cariAktiviteEkAlanlar);
  writeNotNull(
      'SatisCariDovizTipiniKullan', instance.satisCariDovizTipiniKullan);
  writeNotNull('AlisCariDovizTipiniKullan', instance.alisCariDovizTipiniKullan);
  writeNotNull(
      'Fatu_KontrolAciklamasiAktif', instance.fatuKontrolAciklamasiAktif);
  writeNotNull(
      'SatisFiyatGrubuSorulacakAlan', instance.satisFiyatGrubuSorulacakAlan);
  writeNotNull('Siparis_FarkliSubeUyg', instance.siparisFarkliSubeUyg);
  writeNotNull('SatisIskEkSahadanGelsin', instance.satisIskEkSahadanGelsin);
  writeNotNull('SatisIsk1Saha', instance.satisIsk1Saha);
  writeNotNull('SatisIsk1Kullanim', instance.satisIsk1Kullanim);
  writeNotNull('Uretim_MalTop_HangiHucrede', instance.uretimMalTopHangiHucrede);
  writeNotNull('Uretim_MalTop_FazlaTeslimYapilabilir',
      instance.uretimMalTopFazlaTeslimYapilabilir);
  writeNotNull('Uretim_USK_SeriGirilsin', instance.uretimUskSeriGirilsin);
  writeNotNull('Finans_BankaIslemModulu', instance.finansBankaIslemModulu);
  writeNotNull('Finans_BankaTcmbBankaKodu', instance.finansBankaTcmbBankaKodu);
  writeNotNull('Finans_BankaTcmbSubeKodu', instance.finansBankaTcmbSubeKodu);
  writeNotNull('Finans_CekSenOzelOrtalamaVadeGunuHesapla',
      instance.finansCekSenOzelOrtalamaVadeGunuHesapla);
  writeNotNull('Stok_Yap_RehberTipi', instance.stokYapRehberTipi);
  writeNotNull(
      'Stok_KanbanBarkodEslemeUyg', instance.stokKanbanBarkodEslemeUyg);
  writeNotNull('Stok_SeriParcalamaUyg', instance.stokSeriParcalamaUyg);
  writeNotNull('Stok_DetayliAramaAlanlar',
      instance.stokDetayliAramaAlanlar?.map((e) => e.toJson()).toList());
  writeNotNull('Genel_KonumTakibiYapilsin', instance.genelKonumTakibiYapilsin);
  writeNotNull('Genel_KonumTakibiDakika', instance.genelKonumTakibiDakika);
  writeNotNull('Genel_KonumTakibiMetre', instance.genelKonumTakibiMetre);
  writeNotNull('UetdsEsyaAktif', instance.uetdsEsyaAktif);
  writeNotNull('SatistaSiparisKullan', instance.satistaSiparisKullan);
  writeNotNull('AlistaSiparisKullan', instance.alistaSiparisKullan);
  writeNotNull('SipOtoEslestir', instance.sipOtoEslestir);
  writeNotNull('SevkEmriTerminalFatura', instance.sevkEmriTerminalFatura);
  writeNotNull('SevkEmriTerminalIrsaliye', instance.sevkEmriTerminalIrsaliye);
  writeNotNull('SevkEmriTerminalTransfer', instance.sevkEmriTerminalTransfer);
  writeNotNull('SevkEmriHucreKontrol', instance.sevkEmriHucreKontrol);
  writeNotNull('SevkEmriMalTopGorunecekAlanlar',
      instance.sevkEmriMalTopGorunecekAlanlar);
  writeNotNull('Seri_SevkIrsaliye', instance.seriSevkIrsaliye);
  writeNotNull(
      'KontrolluBelgeAktarimAktif', instance.kontrolluBelgeAktarimAktif);
  writeNotNull('KontrolluBelgeAktarimBelgeNoGoster',
      instance.kontrolluBelgeAktarimBelgeNoGoster);
  writeNotNull('EMustahsilAktif', instance.eMustahsilAktif);
  return val;
}

CariAktiviteTipleri _$CariAktiviteTipleriFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'CariAktiviteTipleri',
      json,
      ($checkedConvert) {
        final val = CariAktiviteTipleri();
        $checkedConvert('AKTIVITE_TIPI', (v) => val.aktiviteTipi = v as int?);
        $checkedConvert('AKTIVITE_ADI', (v) => val.aktiviteAdi = v as String?);
        return val;
      },
      fieldKeyMap: const {
        'aktiviteTipi': 'AKTIVITE_TIPI',
        'aktiviteAdi': 'AKTIVITE_ADI'
      },
    );

Map<String, dynamic> _$CariAktiviteTipleriToJson(CariAktiviteTipleri instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('AKTIVITE_TIPI', instance.aktiviteTipi);
  writeNotNull('AKTIVITE_ADI', instance.aktiviteAdi);
  return val;
}

CekSenParam _$CekSenParamFromJson(Map<String, dynamic> json) => $checkedCreate(
      'CekSenParam',
      json,
      ($checkedConvert) {
        final val = CekSenParam();
        $checkedConvert('BELGE_TIPI', (v) => val.belgeTipi = v as String?);
        $checkedConvert('DOVIZ_AKTIF', (v) => val.dovizAktif = v as String?);
        $checkedConvert('VERILEN_KODU_ISTENSIN',
            (v) => val.verilenKoduIstensin = v as String?);
        $checkedConvert(
            'EK_ACIKLAMA_KULLAN', (v) => val.ekAciklamaKullan = v as String?);
        $checkedConvert(
            'CIKISTA_BANKA_KODU', (v) => val.cikistaBankaKodu = v as String?);
        return val;
      },
      fieldKeyMap: const {
        'belgeTipi': 'BELGE_TIPI',
        'dovizAktif': 'DOVIZ_AKTIF',
        'verilenKoduIstensin': 'VERILEN_KODU_ISTENSIN',
        'ekAciklamaKullan': 'EK_ACIKLAMA_KULLAN',
        'cikistaBankaKodu': 'CIKISTA_BANKA_KODU'
      },
    );

Map<String, dynamic> _$CekSenParamToJson(CekSenParam instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('BELGE_TIPI', instance.belgeTipi);
  writeNotNull('DOVIZ_AKTIF', instance.dovizAktif);
  writeNotNull('VERILEN_KODU_ISTENSIN', instance.verilenKoduIstensin);
  writeNotNull('EK_ACIKLAMA_KULLAN', instance.ekAciklamaKullan);
  writeNotNull('CIKISTA_BANKA_KODU', instance.cikistaBankaKodu);
  return val;
}

DepoList _$DepoListFromJson(Map<String, dynamic> json) => $checkedCreate(
      'DepoList',
      json,
      ($checkedConvert) {
        final val = DepoList();
        $checkedConvert('DEPO_KODU', (v) => val.depoKodu = v as int?);
        $checkedConvert('DEPO_TANIMI', (v) => val.depoTanimi = v as String?);
        $checkedConvert(
            'BAKIYE_TAKIBI', (v) => val.bakiyeTakibi = v as String?);
        $checkedConvert('HUCRE_TAKIBI', (v) => val.hucreTakibi = v as String?);
        $checkedConvert('SUBE_KODU', (v) => val.subeKodu = v as int?);
        return val;
      },
      fieldKeyMap: const {
        'depoKodu': 'DEPO_KODU',
        'depoTanimi': 'DEPO_TANIMI',
        'bakiyeTakibi': 'BAKIYE_TAKIBI',
        'hucreTakibi': 'HUCRE_TAKIBI',
        'subeKodu': 'SUBE_KODU'
      },
    );

Map<String, dynamic> _$DepoListToJson(DepoList instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('DEPO_KODU', instance.depoKodu);
  writeNotNull('DEPO_TANIMI', instance.depoTanimi);
  writeNotNull('BAKIYE_TAKIBI', instance.bakiyeTakibi);
  writeNotNull('HUCRE_TAKIBI', instance.hucreTakibi);
  writeNotNull('SUBE_KODU', instance.subeKodu);
  return val;
}

DovizList _$DovizListFromJson(Map<String, dynamic> json) => $checkedCreate(
      'DovizList',
      json,
      ($checkedConvert) {
        final val = DovizList();
        $checkedConvert('DOVIZ_KODU', (v) => val.dovizKodu = v as int?);
        $checkedConvert('DOVIZ_TIPI', (v) => val.dovizTipi = v as int?);
        $checkedConvert('ISIM', (v) => val.isim = v as String?);
        $checkedConvert('ALIS', (v) => val.alis = (v as num?)?.toDouble());
        $checkedConvert('SATIS', (v) => val.satis = (v as num?)?.toDouble());
        $checkedConvert('EF_ALIS', (v) => val.efAlis = (v as num?)?.toDouble());
        $checkedConvert(
            'EF_SATIS', (v) => val.efSatis = (v as num?)?.toDouble());
        return val;
      },
      fieldKeyMap: const {
        'dovizKodu': 'DOVIZ_KODU',
        'dovizTipi': 'DOVIZ_TIPI',
        'isim': 'ISIM',
        'alis': 'ALIS',
        'satis': 'SATIS',
        'efAlis': 'EF_ALIS',
        'efSatis': 'EF_SATIS'
      },
    );

Map<String, dynamic> _$DovizListToJson(DovizList instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('DOVIZ_KODU', instance.dovizKodu);
  writeNotNull('DOVIZ_TIPI', instance.dovizTipi);
  writeNotNull('ISIM', instance.isim);
  writeNotNull('ALIS', instance.alis);
  writeNotNull('SATIS', instance.satis);
  writeNotNull('EF_ALIS', instance.efAlis);
  writeNotNull('EF_SATIS', instance.efSatis);
  return val;
}

KasaList _$KasaListFromJson(Map<String, dynamic> json) => $checkedCreate(
      'KasaList',
      json,
      ($checkedConvert) {
        final val = KasaList();
        $checkedConvert('KASA_KODU', (v) => val.kasaKodu = v as String?);
        $checkedConvert('KASA_TANIMI', (v) => val.kasaTanimi = v as String?);
        $checkedConvert('SUBE_KODU', (v) => val.subeKodu = v as int?);
        $checkedConvert('DOVIZLI', (v) => val.dovizli = v as String?);
        $checkedConvert('DOVIZ_TIPI', (v) => val.dovizTipi = v as int?);
        $checkedConvert('KKART_KASASI', (v) => val.kkartKasasi = v as bool?);
        $checkedConvert(
            'DEVIR_TUTARI', (v) => val.devirTutari = (v as num?)?.toDouble());
        $checkedConvert('DOVIZ_DEVIR_TUTARI',
            (v) => val.dovizDevirTutari = (v as num?)?.toDouble());
        $checkedConvert('DOVIZ_ADI', (v) => val.dovizAdi = v as String?);
        $checkedConvert(
            'TOPLAM_GIRIS', (v) => val.toplamGiris = (v as num?)?.toDouble());
        $checkedConvert(
            'TOPLAM_CIKIS', (v) => val.toplamCikis = (v as num?)?.toDouble());
        $checkedConvert('BAKIYE', (v) => val.bakiye = (v as num?)?.toDouble());
        $checkedConvert('DEVIRLI_BAKIYE',
            (v) => val.devirliBakiye = (v as num?)?.toDouble());
        $checkedConvert('DOVIZ_TOPLAM_GIRIS',
            (v) => val.dovizToplamGiris = (v as num?)?.toDouble());
        $checkedConvert('DOVIZ_TOPLAM_CIKIS',
            (v) => val.dovizToplamCikis = (v as num?)?.toDouble());
        $checkedConvert(
            'DOVIZ_BAKIYE', (v) => val.dovizBakiye = (v as num?)?.toDouble());
        $checkedConvert('DEVIRLI_DOVIZ_BAKIYE',
            (v) => val.devirliDovizBakiye = (v as num?)?.toDouble());
        return val;
      },
      fieldKeyMap: const {
        'kasaKodu': 'KASA_KODU',
        'kasaTanimi': 'KASA_TANIMI',
        'subeKodu': 'SUBE_KODU',
        'dovizli': 'DOVIZLI',
        'dovizTipi': 'DOVIZ_TIPI',
        'kkartKasasi': 'KKART_KASASI',
        'devirTutari': 'DEVIR_TUTARI',
        'dovizDevirTutari': 'DOVIZ_DEVIR_TUTARI',
        'dovizAdi': 'DOVIZ_ADI',
        'toplamGiris': 'TOPLAM_GIRIS',
        'toplamCikis': 'TOPLAM_CIKIS',
        'bakiye': 'BAKIYE',
        'devirliBakiye': 'DEVIRLI_BAKIYE',
        'dovizToplamGiris': 'DOVIZ_TOPLAM_GIRIS',
        'dovizToplamCikis': 'DOVIZ_TOPLAM_CIKIS',
        'dovizBakiye': 'DOVIZ_BAKIYE',
        'devirliDovizBakiye': 'DEVIRLI_DOVIZ_BAKIYE'
      },
    );

Map<String, dynamic> _$KasaListToJson(KasaList instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('KASA_KODU', instance.kasaKodu);
  writeNotNull('KASA_TANIMI', instance.kasaTanimi);
  writeNotNull('SUBE_KODU', instance.subeKodu);
  writeNotNull('DOVIZLI', instance.dovizli);
  writeNotNull('DOVIZ_TIPI', instance.dovizTipi);
  writeNotNull('KKART_KASASI', instance.kkartKasasi);
  writeNotNull('DEVIR_TUTARI', instance.devirTutari);
  writeNotNull('DOVIZ_DEVIR_TUTARI', instance.dovizDevirTutari);
  writeNotNull('DOVIZ_ADI', instance.dovizAdi);
  writeNotNull('TOPLAM_GIRIS', instance.toplamGiris);
  writeNotNull('TOPLAM_CIKIS', instance.toplamCikis);
  writeNotNull('BAKIYE', instance.bakiye);
  writeNotNull('DEVIRLI_BAKIYE', instance.devirliBakiye);
  writeNotNull('DOVIZ_TOPLAM_GIRIS', instance.dovizToplamGiris);
  writeNotNull('DOVIZ_TOPLAM_CIKIS', instance.dovizToplamCikis);
  writeNotNull('DOVIZ_BAKIYE', instance.dovizBakiye);
  writeNotNull('DEVIRLI_DOVIZ_BAKIYE', instance.devirliDovizBakiye);
  return val;
}

ListCariOdemeKodu _$ListCariOdemeKoduFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'ListCariOdemeKodu',
      json,
      ($checkedConvert) {
        final val = ListCariOdemeKodu();
        $checkedConvert('ODEME_KODU', (v) => val.odemeKodu = v as String?);
        $checkedConvert('ACIKLAMA', (v) => val.aciklama = v as String?);
        return val;
      },
      fieldKeyMap: const {'odemeKodu': 'ODEME_KODU', 'aciklama': 'ACIKLAMA'},
    );

Map<String, dynamic> _$ListCariOdemeKoduToJson(ListCariOdemeKodu instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ODEME_KODU', instance.odemeKodu);
  writeNotNull('ACIKLAMA', instance.aciklama);
  return val;
}

ListFatuEkMaliyet _$ListFatuEkMaliyetFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'ListFatuEkMaliyet',
      json,
      ($checkedConvert) {
        final val = ListFatuEkMaliyet();
        $checkedConvert('NO', (v) => val.no = v as int?);
        $checkedConvert('BELGE_TIPI', (v) => val.belgeTipi = v as String?);
        $checkedConvert('ADI', (v) => val.adi = v as String?);
        return val;
      },
      fieldKeyMap: const {'no': 'NO', 'belgeTipi': 'BELGE_TIPI', 'adi': 'ADI'},
    );

Map<String, dynamic> _$ListFatuEkMaliyetToJson(ListFatuEkMaliyet instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('NO', instance.no);
  writeNotNull('BELGE_TIPI', instance.belgeTipi);
  writeNotNull('ADI', instance.adi);
  return val;
}

ListIskTip _$ListIskTipFromJson(Map<String, dynamic> json) => $checkedCreate(
      'ListIskTip',
      json,
      ($checkedConvert) {
        final val = ListIskTip();
        $checkedConvert('ISKONTO_TIPI', (v) => val.iskontoTipi = v as int?);
        $checkedConvert('ACIKLAMA', (v) => val.aciklama = v as String?);
        return val;
      },
      fieldKeyMap: const {
        'iskontoTipi': 'ISKONTO_TIPI',
        'aciklama': 'ACIKLAMA'
      },
    );

Map<String, dynamic> _$ListIskTipToJson(ListIskTip instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ISKONTO_TIPI', instance.iskontoTipi);
  writeNotNull('ACIKLAMA', instance.aciklama);
  return val;
}

ListOzelKodTum _$ListOzelKodTumFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'ListOzelKodTum',
      json,
      ($checkedConvert) {
        final val = ListOzelKodTum();
        $checkedConvert('KOD_TIPI', (v) => val.kodTipi = v as int?);
        $checkedConvert('BELGE_TIPI', (v) => val.belgeTipi = v as String?);
        $checkedConvert('KOD', (v) => val.kod = v as String?);
        $checkedConvert('ACIKLAMA', (v) => val.aciklama = v as String?);
        $checkedConvert('FIYAT_SIRASI', (v) => val.fiyatSirasi = v as int?);
        return val;
      },
      fieldKeyMap: const {
        'kodTipi': 'KOD_TIPI',
        'belgeTipi': 'BELGE_TIPI',
        'kod': 'KOD',
        'aciklama': 'ACIKLAMA',
        'fiyatSirasi': 'FIYAT_SIRASI'
      },
    );

Map<String, dynamic> _$ListOzelKodTumToJson(ListOzelKodTum instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('KOD_TIPI', instance.kodTipi);
  writeNotNull('BELGE_TIPI', instance.belgeTipi);
  writeNotNull('KOD', instance.kod);
  writeNotNull('ACIKLAMA', instance.aciklama);
  writeNotNull('FIYAT_SIRASI', instance.fiyatSirasi);
  return val;
}

MapEkAlanlar _$MapEkAlanlarFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'MapEkAlanlar',
      json,
      ($checkedConvert) {
        final val = MapEkAlanlar();
        $checkedConvert('caption', (v) => val.caption = v as String?);
        $checkedConvert('field_name', (v) => val.fieldName = v as String?);
        $checkedConvert('veri_tipi', (v) => val.veriTipi = v as String?);
        return val;
      },
      fieldKeyMap: const {'fieldName': 'field_name', 'veriTipi': 'veri_tipi'},
    );

Map<String, dynamic> _$MapEkAlanlarToJson(MapEkAlanlar instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('caption', instance.caption);
  writeNotNull('field_name', instance.fieldName);
  writeNotNull('veri_tipi', instance.veriTipi);
  return val;
}

MapCariKullSahalar _$MapCariKullSahalarFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'MapCariKullSahalar',
      json,
      ($checkedConvert) {
        final val = MapCariKullSahalar();
        $checkedConvert('1S', (v) => val.the1S = v as String?);
        $checkedConvert('2S', (v) => val.the2S = v as String?);
        $checkedConvert('3S', (v) => val.the3S = v as String?);
        $checkedConvert('4S', (v) => val.the4S = v as String?);
        $checkedConvert('5S', (v) => val.the5S = v as String?);
        $checkedConvert('6S', (v) => val.the6S = v as String?);
        $checkedConvert('7S', (v) => val.the7S = v as String?);
        $checkedConvert('8S', (v) => val.the8S = v as String?);
        $checkedConvert('1N', (v) => val.the1N = v as String?);
        $checkedConvert('2N', (v) => val.the2N = v as String?);
        $checkedConvert('3N', (v) => val.the3N = v as String?);
        $checkedConvert('4N', (v) => val.the4N = v as String?);
        $checkedConvert('5N', (v) => val.the5N = v as String?);
        $checkedConvert('6N', (v) => val.the6N = v as String?);
        $checkedConvert('7N', (v) => val.the7N = v as String?);
        $checkedConvert('8N', (v) => val.the8N = v as String?);
        return val;
      },
      fieldKeyMap: const {
        'the1S': '1S',
        'the2S': '2S',
        'the3S': '3S',
        'the4S': '4S',
        'the5S': '5S',
        'the6S': '6S',
        'the7S': '7S',
        'the8S': '8S',
        'the1N': '1N',
        'the2N': '2N',
        'the3N': '3N',
        'the4N': '4N',
        'the5N': '5N',
        'the6N': '6N',
        'the7N': '7N',
        'the8N': '8N'
      },
    );

Map<String, dynamic> _$MapCariKullSahalarToJson(MapCariKullSahalar instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('1S', instance.the1S);
  writeNotNull('2S', instance.the2S);
  writeNotNull('3S', instance.the3S);
  writeNotNull('4S', instance.the4S);
  writeNotNull('5S', instance.the5S);
  writeNotNull('6S', instance.the6S);
  writeNotNull('7S', instance.the7S);
  writeNotNull('8S', instance.the8S);
  writeNotNull('1N', instance.the1N);
  writeNotNull('2N', instance.the2N);
  writeNotNull('3N', instance.the3N);
  writeNotNull('4N', instance.the4N);
  writeNotNull('5N', instance.the5N);
  writeNotNull('6N', instance.the6N);
  writeNotNull('7N', instance.the7N);
  writeNotNull('8N', instance.the8N);
  return val;
}

MapKdvSifirBelgeTipiOzelKod2 _$MapKdvSifirBelgeTipiOzelKod2FromJson(
        Map<String, dynamic> json) =>
    $checkedCreate(
      'MapKdvSifirBelgeTipiOzelKod2',
      json,
      ($checkedConvert) {
        final val = MapKdvSifirBelgeTipiOzelKod2();
        $checkedConvert('DC', (v) => val.dc = v as String?);
        $checkedConvert('AC', (v) => val.ac = v as String?);
        $checkedConvert('MS', (v) => val.ms = v as String?);
        $checkedConvert('SI', (v) => val.si = v as String?);
        $checkedConvert('SF', (v) => val.sf = v as String?);
        $checkedConvert('STEK', (v) => val.stek = v as String?);
        return val;
      },
      fieldKeyMap: const {
        'dc': 'DC',
        'ac': 'AC',
        'ms': 'MS',
        'si': 'SI',
        'sf': 'SF',
        'stek': 'STEK'
      },
    );

Map<String, dynamic> _$MapKdvSifirBelgeTipiOzelKod2ToJson(
    MapKdvSifirBelgeTipiOzelKod2 instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('DC', instance.dc);
  writeNotNull('AC', instance.ac);
  writeNotNull('MS', instance.ms);
  writeNotNull('SI', instance.si);
  writeNotNull('SF', instance.sf);
  writeNotNull('STEK', instance.stek);
  return val;
}

MapStokGrupAdlari _$MapStokGrupAdlariFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'MapStokGrupAdlari',
      json,
      ($checkedConvert) {
        final val = MapStokGrupAdlari();
        $checkedConvert('GRUP_KODU', (v) => val.grupKodu = v as String?);
        $checkedConvert('KOD1', (v) => val.kod1 = v);
        $checkedConvert('KOD2', (v) => val.kod2 = v);
        $checkedConvert('KOD3', (v) => val.kod3 = v);
        $checkedConvert('KOD4', (v) => val.kod4 = v);
        $checkedConvert('KOD5', (v) => val.kod5 = v);
        return val;
      },
      fieldKeyMap: const {
        'grupKodu': 'GRUP_KODU',
        'kod1': 'KOD1',
        'kod2': 'KOD2',
        'kod3': 'KOD3',
        'kod4': 'KOD4',
        'kod5': 'KOD5'
      },
    );

Map<String, dynamic> _$MapStokGrupAdlariToJson(MapStokGrupAdlari instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('GRUP_KODU', instance.grupKodu);
  writeNotNull('KOD1', instance.kod1);
  writeNotNull('KOD2', instance.kod2);
  writeNotNull('KOD3', instance.kod3);
  writeNotNull('KOD4', instance.kod4);
  writeNotNull('KOD5', instance.kod5);
  return val;
}

MapStokKullSahalar _$MapStokKullSahalarFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'MapStokKullSahalar',
      json,
      ($checkedConvert) {
        final val = MapStokKullSahalar();
        $checkedConvert('1S', (v) => val.the1S = v as String?);
        $checkedConvert('2S', (v) => val.the2S = v as String?);
        $checkedConvert('3S', (v) => val.the3S = v as String?);
        $checkedConvert('4S', (v) => val.the4S = v as String?);
        $checkedConvert('5S', (v) => val.the5S = v as String?);
        $checkedConvert('6S', (v) => val.the6S = v as String?);
        $checkedConvert('7S', (v) => val.the7S = v as String?);
        $checkedConvert('8S', (v) => val.the8S = v as String?);
        $checkedConvert('1N', (v) => val.the1N = v as String?);
        $checkedConvert('2N', (v) => val.the2N = v as String?);
        $checkedConvert('3N', (v) => val.the3N = v as String?);
        $checkedConvert('4N', (v) => val.the4N = v as String?);
        $checkedConvert('5N', (v) => val.the5N = v as String?);
        $checkedConvert('6N', (v) => val.the6N = v as String?);
        $checkedConvert('7N', (v) => val.the7N = v as String?);
        $checkedConvert('8N', (v) => val.the8N = v as String?);
        return val;
      },
      fieldKeyMap: const {
        'the1S': '1S',
        'the2S': '2S',
        'the3S': '3S',
        'the4S': '4S',
        'the5S': '5S',
        'the6S': '6S',
        'the7S': '7S',
        'the8S': '8S',
        'the1N': '1N',
        'the2N': '2N',
        'the3N': '3N',
        'the4N': '4N',
        'the5N': '5N',
        'the6N': '6N',
        'the7N': '7N',
        'the8N': '8N'
      },
    );

Map<String, dynamic> _$MapStokKullSahalarToJson(MapStokKullSahalar instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('1S', instance.the1S);
  writeNotNull('2S', instance.the2S);
  writeNotNull('3S', instance.the3S);
  writeNotNull('4S', instance.the4S);
  writeNotNull('5S', instance.the5S);
  writeNotNull('6S', instance.the6S);
  writeNotNull('7S', instance.the7S);
  writeNotNull('8S', instance.the8S);
  writeNotNull('1N', instance.the1N);
  writeNotNull('2N', instance.the2N);
  writeNotNull('3N', instance.the3N);
  writeNotNull('4N', instance.the4N);
  writeNotNull('5N', instance.the5N);
  writeNotNull('6N', instance.the6N);
  writeNotNull('7N', instance.the7N);
  writeNotNull('8N', instance.the8N);
  return val;
}

MustahsilParam _$MustahsilParamFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'MustahsilParam',
      json,
      ($checkedConvert) {
        final val = MustahsilParam();
        $checkedConvert(
            'STOPAJ_ORANI', (v) => val.stopajOrani = (v as num?)?.toDouble());
        $checkedConvert(
            'FON_ORANI', (v) => val.fonOrani = (v as num?)?.toDouble());
        $checkedConvert(
            'BORSA_ORANI', (v) => val.borsaOrani = (v as num?)?.toDouble());
        $checkedConvert('BAGKUR_ORANI', (v) => val.bagkurOrani = v as int?);
        $checkedConvert('BAGKUR_YB', (v) => val.bagkurYb = v as String?);
        $checkedConvert(
            'MERA_ORANI', (v) => val.meraOrani = (v as num?)?.toDouble());
        $checkedConvert('BORSA_UCRET_DUZENLEMESI',
            (v) => val.borsaUcretDuzenlemesi = v as String?);
        return val;
      },
      fieldKeyMap: const {
        'stopajOrani': 'STOPAJ_ORANI',
        'fonOrani': 'FON_ORANI',
        'borsaOrani': 'BORSA_ORANI',
        'bagkurOrani': 'BAGKUR_ORANI',
        'bagkurYb': 'BAGKUR_YB',
        'meraOrani': 'MERA_ORANI',
        'borsaUcretDuzenlemesi': 'BORSA_UCRET_DUZENLEMESI'
      },
    );

Map<String, dynamic> _$MustahsilParamToJson(MustahsilParam instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('STOPAJ_ORANI', instance.stopajOrani);
  writeNotNull('FON_ORANI', instance.fonOrani);
  writeNotNull('BORSA_ORANI', instance.borsaOrani);
  writeNotNull('BAGKUR_ORANI', instance.bagkurOrani);
  writeNotNull('BAGKUR_YB', instance.bagkurYb);
  writeNotNull('MERA_ORANI', instance.meraOrani);
  writeNotNull('BORSA_UCRET_DUZENLEMESI', instance.borsaUcretDuzenlemesi);
  return val;
}

NetFectDizaynList _$NetFectDizaynListFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'NetFectDizaynList',
      json,
      ($checkedConvert) {
        final val = NetFectDizaynList();
        $checkedConvert('ID', (v) => val.id = v as int?);
        $checkedConvert('DIZAYN_YERI', (v) => val.dizaynYeri = v as String?);
        $checkedConvert('DIZAYN_YOLU', (v) => val.dizaynYolu = v as String?);
        $checkedConvert('DIZAYN_ADI', (v) => val.dizaynAdi = v as String?);
        $checkedConvert('OZEL_KOD', (v) => val.ozelKod = v as String?);
        $checkedConvert('KOPYA_SAYISI', (v) => val.kopyaSayisi = v as int?);
        $checkedConvert('SABLON_VAR', (v) => val.sablonVar = v as String?);
        $checkedConvert('AKTIF', (v) => val.aktif = v as String?);
        $checkedConvert('DOSYA_ADI', (v) => val.dosyaAdi = v as String?);
        $checkedConvert('PARAMETRELER', (v) => val.parametreler = v as String?);
        $checkedConvert('VARSAYILAN_MI', (v) => val.varsayilanMi = v as bool?);
        return val;
      },
      fieldKeyMap: const {
        'id': 'ID',
        'dizaynYeri': 'DIZAYN_YERI',
        'dizaynYolu': 'DIZAYN_YOLU',
        'dizaynAdi': 'DIZAYN_ADI',
        'ozelKod': 'OZEL_KOD',
        'kopyaSayisi': 'KOPYA_SAYISI',
        'sablonVar': 'SABLON_VAR',
        'aktif': 'AKTIF',
        'dosyaAdi': 'DOSYA_ADI',
        'parametreler': 'PARAMETRELER',
        'varsayilanMi': 'VARSAYILAN_MI'
      },
    );

Map<String, dynamic> _$NetFectDizaynListToJson(NetFectDizaynList instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ID', instance.id);
  writeNotNull('DIZAYN_YERI', instance.dizaynYeri);
  writeNotNull('DIZAYN_YOLU', instance.dizaynYolu);
  writeNotNull('DIZAYN_ADI', instance.dizaynAdi);
  writeNotNull('OZEL_KOD', instance.ozelKod);
  writeNotNull('KOPYA_SAYISI', instance.kopyaSayisi);
  writeNotNull('SABLON_VAR', instance.sablonVar);
  writeNotNull('AKTIF', instance.aktif);
  writeNotNull('DOSYA_ADI', instance.dosyaAdi);
  writeNotNull('PARAMETRELER', instance.parametreler);
  writeNotNull('VARSAYILAN_MI', instance.varsayilanMi);
  return val;
}

NetsisOndalikResponseModel _$NetsisOndalikResponseModelFromJson(
        Map<String, dynamic> json) =>
    $checkedCreate(
      'NetsisOndalikResponseModel',
      json,
      ($checkedConvert) {
        final val = NetsisOndalikResponseModel();
        $checkedConvert('MODUL', (v) => val.modul = v as String?);
        $checkedConvert('MIKTAR', (v) => val.miktar = v as int?);
        $checkedConvert('FIYAT', (v) => val.fiyat = v as int?);
        $checkedConvert('TUTAR', (v) => val.tutar = v as int?);
        $checkedConvert('KUR', (v) => val.kur = v as int?);
        $checkedConvert('DOVIZ', (v) => val.doviz = v as int?);
        $checkedConvert('DOVIZ_FIYATI', (v) => val.dovizFiyati = v as int?);
        $checkedConvert('ORAN', (v) => val.oran = v as int?);
        return val;
      },
      fieldKeyMap: const {
        'modul': 'MODUL',
        'miktar': 'MIKTAR',
        'fiyat': 'FIYAT',
        'tutar': 'TUTAR',
        'kur': 'KUR',
        'doviz': 'DOVIZ',
        'dovizFiyati': 'DOVIZ_FIYATI',
        'oran': 'ORAN'
      },
    );

Map<String, dynamic> _$NetsisOndalikResponseModelToJson(
    NetsisOndalikResponseModel instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('MODUL', instance.modul);
  writeNotNull('MIKTAR', instance.miktar);
  writeNotNull('FIYAT', instance.fiyat);
  writeNotNull('TUTAR', instance.tutar);
  writeNotNull('KUR', instance.kur);
  writeNotNull('DOVIZ', instance.doviz);
  writeNotNull('DOVIZ_FIYATI', instance.dovizFiyati);
  writeNotNull('ORAN', instance.oran);
  return val;
}

PlasiyerList _$PlasiyerListFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'PlasiyerList',
      json,
      ($checkedConvert) {
        final val = PlasiyerList();
        $checkedConvert(
            'PLASIYER_KODU', (v) => val.plasiyerKodu = v as String?);
        $checkedConvert(
            'PLASIYER_ACIKLAMA', (v) => val.plasiyerAciklama = v as String?);
        return val;
      },
      fieldKeyMap: const {
        'plasiyerKodu': 'PLASIYER_KODU',
        'plasiyerAciklama': 'PLASIYER_ACIKLAMA'
      },
    );

Map<String, dynamic> _$PlasiyerListToJson(PlasiyerList instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('PLASIYER_KODU', instance.plasiyerKodu);
  writeNotNull('PLASIYER_ACIKLAMA', instance.plasiyerAciklama);
  return val;
}

SatirAcikBaslikList _$SatirAcikBaslikListFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'SatirAcikBaslikList',
      json,
      ($checkedConvert) {
        final val = SatirAcikBaslikList();
        $checkedConvert('BELGE_KODU', (v) => val.belgeKodu = v as String?);
        $checkedConvert('ACIKLAMA1', (v) => val.aciklama1 = v as String?);
        $checkedConvert('ACIKLAMA2', (v) => val.aciklama2 = v as String?);
        $checkedConvert('ACIKLAMA3', (v) => val.aciklama3 = v as String?);
        $checkedConvert('ACIKLAMA4', (v) => val.aciklama4 = v as String?);
        $checkedConvert('ACIKLAMA5', (v) => val.aciklama5 = v as String?);
        $checkedConvert('ACIKLAMA6', (v) => val.aciklama6 = v as String?);
        $checkedConvert('ACIKLAMA7', (v) => val.aciklama7 = v as String?);
        $checkedConvert('ACIKLAMA8', (v) => val.aciklama8 = v as String?);
        $checkedConvert('ACIKLAMA9', (v) => val.aciklama9 = v as String?);
        $checkedConvert('ACIKLAMA10', (v) => val.aciklama10 = v as String?);
        return val;
      },
      fieldKeyMap: const {
        'belgeKodu': 'BELGE_KODU',
        'aciklama1': 'ACIKLAMA1',
        'aciklama2': 'ACIKLAMA2',
        'aciklama3': 'ACIKLAMA3',
        'aciklama4': 'ACIKLAMA4',
        'aciklama5': 'ACIKLAMA5',
        'aciklama6': 'ACIKLAMA6',
        'aciklama7': 'ACIKLAMA7',
        'aciklama8': 'ACIKLAMA8',
        'aciklama9': 'ACIKLAMA9',
        'aciklama10': 'ACIKLAMA10'
      },
    );

Map<String, dynamic> _$SatirAcikBaslikListToJson(SatirAcikBaslikList instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('BELGE_KODU', instance.belgeKodu);
  writeNotNull('ACIKLAMA1', instance.aciklama1);
  writeNotNull('ACIKLAMA2', instance.aciklama2);
  writeNotNull('ACIKLAMA3', instance.aciklama3);
  writeNotNull('ACIKLAMA4', instance.aciklama4);
  writeNotNull('ACIKLAMA5', instance.aciklama5);
  writeNotNull('ACIKLAMA6', instance.aciklama6);
  writeNotNull('ACIKLAMA7', instance.aciklama7);
  writeNotNull('ACIKLAMA8', instance.aciklama8);
  writeNotNull('ACIKLAMA9', instance.aciklama9);
  writeNotNull('ACIKLAMA10', instance.aciklama10);
  return val;
}

StokDetayliAramaAlanlar _$StokDetayliAramaAlanlarFromJson(
        Map<String, dynamic> json) =>
    $checkedCreate(
      'StokDetayliAramaAlanlar',
      json,
      ($checkedConvert) {
        final val = StokDetayliAramaAlanlar();
        $checkedConvert('SearchField', (v) => val.searchField = v as String?);
        $checkedConvert('Name', (v) => val.name = v as String?);
        return val;
      },
      fieldKeyMap: const {'searchField': 'SearchField', 'name': 'Name'},
    );

Map<String, dynamic> _$StokDetayliAramaAlanlarToJson(
    StokDetayliAramaAlanlar instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('SearchField', instance.searchField);
  writeNotNull('Name', instance.name);
  return val;
}

SubeList _$SubeListFromJson(Map<String, dynamic> json) => $checkedCreate(
      'SubeList',
      json,
      ($checkedConvert) {
        final val = SubeList();
        $checkedConvert('SIRKET', (v) => val.sirket = v as String?);
        $checkedConvert('ISLETME_KODU', (v) => val.isletmeKodu = v as int?);
        $checkedConvert('SUBE_ADI', (v) => val.subeAdi = v as String?);
        $checkedConvert('ISLETME_ADI', (v) => val.isletmeAdi = v as String?);
        $checkedConvert(
            'LOKAL_DEPO_AKTIF', (v) => val.lokalDepoAktif = v as bool?);
        $checkedConvert('MERKEZMI', (v) => val.merkezmi = v as String?);
        $checkedConvert('ADRES', (v) => val.adres = v as String?);
        $checkedConvert('TELEFON', (v) => val.telefon = v as String?);
        $checkedConvert('FAKS', (v) => val.faks = v as String?);
        $checkedConvert('EMAIL', (v) => val.email = v as String?);
        $checkedConvert('IL_ADI', (v) => val.ilAdi = v as String?);
        $checkedConvert('ILCE', (v) => val.ilce = v as String?);
        $checkedConvert(
            'VERGI_NUMARASI', (v) => val.vergiNumarasi = v as String?);
        $checkedConvert(
            'VERGI_DAIRESI', (v) => val.vergiDairesi = v as String?);
        $checkedConvert('PARA_BIRIMI', (v) => val.paraBirimi = v as String?);
        $checkedConvert(
            'PARA_BIRIMI_KUSURAT', (v) => val.paraBirimiKusurat = v as String?);
        $checkedConvert('SUBE_KODU', (v) => val.subeKodu = v as int?);
        $checkedConvert('CARI_KODU', (v) => val.cariKodu = v as String?);
        $checkedConvert('CARI_ADI', (v) => val.cariAdi = v as String?);
        return val;
      },
      fieldKeyMap: const {
        'sirket': 'SIRKET',
        'isletmeKodu': 'ISLETME_KODU',
        'subeAdi': 'SUBE_ADI',
        'isletmeAdi': 'ISLETME_ADI',
        'lokalDepoAktif': 'LOKAL_DEPO_AKTIF',
        'merkezmi': 'MERKEZMI',
        'adres': 'ADRES',
        'telefon': 'TELEFON',
        'faks': 'FAKS',
        'email': 'EMAIL',
        'ilAdi': 'IL_ADI',
        'ilce': 'ILCE',
        'vergiNumarasi': 'VERGI_NUMARASI',
        'vergiDairesi': 'VERGI_DAIRESI',
        'paraBirimi': 'PARA_BIRIMI',
        'paraBirimiKusurat': 'PARA_BIRIMI_KUSURAT',
        'subeKodu': 'SUBE_KODU',
        'cariKodu': 'CARI_KODU',
        'cariAdi': 'CARI_ADI'
      },
    );

Map<String, dynamic> _$SubeListToJson(SubeList instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('SIRKET', instance.sirket);
  writeNotNull('ISLETME_KODU', instance.isletmeKodu);
  writeNotNull('SUBE_ADI', instance.subeAdi);
  writeNotNull('ISLETME_ADI', instance.isletmeAdi);
  writeNotNull('LOKAL_DEPO_AKTIF', instance.lokalDepoAktif);
  writeNotNull('MERKEZMI', instance.merkezmi);
  writeNotNull('ADRES', instance.adres);
  writeNotNull('TELEFON', instance.telefon);
  writeNotNull('FAKS', instance.faks);
  writeNotNull('EMAIL', instance.email);
  writeNotNull('IL_ADI', instance.ilAdi);
  writeNotNull('ILCE', instance.ilce);
  writeNotNull('VERGI_NUMARASI', instance.vergiNumarasi);
  writeNotNull('VERGI_DAIRESI', instance.vergiDairesi);
  writeNotNull('PARA_BIRIMI', instance.paraBirimi);
  writeNotNull('PARA_BIRIMI_KUSURAT', instance.paraBirimiKusurat);
  writeNotNull('SUBE_KODU', instance.subeKodu);
  writeNotNull('CARI_KODU', instance.cariKodu);
  writeNotNull('CARI_ADI', instance.cariAdi);
  return val;
}

TalTekParam _$TalTekParamFromJson(Map<String, dynamic> json) => $checkedCreate(
      'TalTekParam',
      json,
      ($checkedConvert) {
        final val = TalTekParam();
        $checkedConvert('TIP', (v) => val.tip = v as int?);
        $checkedConvert('BELGE_TIPI', (v) => val.belgeTipi = v as String?);
        $checkedConvert('DOVIZ_TAKIP', (v) => val.dovizTakip = v as String?);
        $checkedConvert('SATIR_ISKONTO_SAYISI',
            (v) => val.satirIskontoSayisi = v as String?);
        $checkedConvert('FARKLI_BIRIMLERDEN_ISLEM',
            (v) => val.farkliBirimlerdenIslem = v as String?);
        $checkedConvert(
            'FARKLI_TESLIM_YERI', (v) => val.farkliTeslimYeri = v as String?);
        $checkedConvert('DEPO_STOK_KARTINDAN_GELSIN',
            (v) => val.depoStokKartindanGelsin = v as String?);
        $checkedConvert('EKACIKLAMALAR_AKTIF',
            (v) => val.ekaciklamalarAktif = v as String?);
        $checkedConvert(
            'OZEL_KOD1_AKTIF', (v) => val.ozelKod1Aktif = v as String?);
        $checkedConvert(
            'OZEL_KOD1_SECIM11', (v) => val.ozelKod1Secim11 = v as String?);
        $checkedConvert(
            'OZEL_KOD1_SECIM21', (v) => val.ozelKod1Secim21 = v as String?);
        $checkedConvert(
            'OZEL_KOD1_SECIM31', (v) => val.ozelKod1Secim31 = v as String?);
        $checkedConvert(
            'OZEL_KOD1_SECIM41', (v) => val.ozelKod1Secim41 = v as String?);
        $checkedConvert(
            'OZEL_KOD2_AKTIF', (v) => val.ozelKod2Aktif = v as String?);
        $checkedConvert('ACIKLAR1', (v) => val.aciklar1 = v as String?);
        $checkedConvert('ACIKLAR2', (v) => val.aciklar2 = v as String?);
        $checkedConvert(
            'SATIRDA_KDV_SOR', (v) => val.satirdaKdvSor = v as String?);
        $checkedConvert('SATIR_TESLIM_TAR_SOR',
            (v) => val.satirTeslimTarSor = v as String?);
        $checkedConvert(
            'DOVIZ_TAKIP_HANGISI', (v) => val.dovizTakipHangisi = v as int?);
        $checkedConvert('SATIR_EKALAN2_KULLAN',
            (v) => val.satirEkalan2Kullan = v as String?);
        $checkedConvert(
            'HIZMET_UYGULAMASI', (v) => val.hizmetUygulamasi = v as String?);
        $checkedConvert(
            'HIZMET_DEPO_KODU', (v) => val.hizmetDepoKodu = v as int?);
        $checkedConvert('KALEMLERDE_ACIKLAMA_AKTIF',
            (v) => val.kalemlerdeAciklamaAktif = v as String?);
        $checkedConvert(
            'ONAY_SISTEMI_KULLAN', (v) => val.onaySistemiKullan = v as String?);
        $checkedConvert('KDV_HARIC', (v) => val.kdvHaric = v as String?);
        $checkedConvert(
            'KDV_DAHIL_HARIC_SOR', (v) => val.kdvDahilHaricSor = v as String?);
        $checkedConvert(
            'OZEL_KOD2_TABLODAN', (v) => val.ozelKod2Tablodan = v as String?);
        $checkedConvert(
            'MUHREFKOD_SORULSUN', (v) => val.muhrefkodSorulsun = v as String?);
        $checkedConvert(
            'TOPLU_DEPO_KULLAN', (v) => val.topluDepoKullan = v as String?);
        $checkedConvert('KOSUL_AKTIF', (v) => val.kosulAktif = v as String?);
        $checkedConvert(
            'SATIR_ISKONTOSU', (v) => val.satirIskontosu = v as String?);
        $checkedConvert(
            'YUZDE_SORULSUN', (v) => val.yuzdeSorulsun = v as String?);
        $checkedConvert(
            'MAL_FAZLASI_ISKONTO', (v) => val.malFazlasiIskonto = v as String?);
        $checkedConvert(
            'GEN_ISK1_AKTIF', (v) => val.genIsk1Aktif = v as String?);
        $checkedConvert('GEN_ISK1_ADI', (v) => val.genIsk1Adi = v as String?);
        $checkedConvert(
            'GEN_ISK2_AKTIF', (v) => val.genIsk2Aktif = v as String?);
        $checkedConvert('GEN_ISK2_ADI', (v) => val.genIsk2Adi = v as String?);
        $checkedConvert(
            'GEN_ISK3_AKTIF', (v) => val.genIsk3Aktif = v as String?);
        $checkedConvert('GEN_ISK3_ADI', (v) => val.genIsk3Adi = v as String?);
        $checkedConvert(
            'OZEL_KOD1_TABLODAN', (v) => val.ozelKod1Tablodan = v as String?);
        $checkedConvert(
            'ACIKLAMA_AKTIF', (v) => val.aciklamaAktif = v as String?);
        $checkedConvert('MIKTAR2_SOR', (v) => val.miktar2Sor = v as String?);
        $checkedConvert(
            'MIKTAR_BIR_GELSIN', (v) => val.miktarBirGelsin = v as String?);
        $checkedConvert('VARSAYILAN_MUHREFKOD',
            (v) => val.varsayilanMuhrefkod = v as String?);
        $checkedConvert('TUTARDAN_BIRIM_FIATA',
            (v) => val.tutardanBirimFiata = v as String?);
        $checkedConvert('CARI_ISK_SATIRA_UYGULA',
            (v) => val.cariIskSatiraUygula = v as String?);
        $checkedConvert(
            'MIKTAR_SIFIR_OLAMAZ', (v) => val.miktarSifirOlamaz = v as String?);
        $checkedConvert(
            'FAT_ALTM1_VARMI', (v) => val.fatAltm1Varmi = v as String?);
        $checkedConvert(
            'FAT_ALTM2_VARMI', (v) => val.fatAltm2Varmi = v as String?);
        $checkedConvert(
            'FAT_ALTM1_TANIM', (v) => val.fatAltm1Tanim = v as String?);
        $checkedConvert(
            'FAT_ALTM2_TANIM', (v) => val.fatAltm2Tanim = v as String?);
        $checkedConvert('KDV_SIFIRLANACAK_OZELKOD2',
            (v) => val.kdvSifirlanacakOzelkod2 = v as String?);
        $checkedConvert(
            'KOSUL_SATIRDA_AKTIF', (v) => val.kosulSatirdaAktif = v as String?);
        return val;
      },
      fieldKeyMap: const {
        'tip': 'TIP',
        'belgeTipi': 'BELGE_TIPI',
        'dovizTakip': 'DOVIZ_TAKIP',
        'satirIskontoSayisi': 'SATIR_ISKONTO_SAYISI',
        'farkliBirimlerdenIslem': 'FARKLI_BIRIMLERDEN_ISLEM',
        'farkliTeslimYeri': 'FARKLI_TESLIM_YERI',
        'depoStokKartindanGelsin': 'DEPO_STOK_KARTINDAN_GELSIN',
        'ekaciklamalarAktif': 'EKACIKLAMALAR_AKTIF',
        'ozelKod1Aktif': 'OZEL_KOD1_AKTIF',
        'ozelKod1Secim11': 'OZEL_KOD1_SECIM11',
        'ozelKod1Secim21': 'OZEL_KOD1_SECIM21',
        'ozelKod1Secim31': 'OZEL_KOD1_SECIM31',
        'ozelKod1Secim41': 'OZEL_KOD1_SECIM41',
        'ozelKod2Aktif': 'OZEL_KOD2_AKTIF',
        'aciklar1': 'ACIKLAR1',
        'aciklar2': 'ACIKLAR2',
        'satirdaKdvSor': 'SATIRDA_KDV_SOR',
        'satirTeslimTarSor': 'SATIR_TESLIM_TAR_SOR',
        'dovizTakipHangisi': 'DOVIZ_TAKIP_HANGISI',
        'satirEkalan2Kullan': 'SATIR_EKALAN2_KULLAN',
        'hizmetUygulamasi': 'HIZMET_UYGULAMASI',
        'hizmetDepoKodu': 'HIZMET_DEPO_KODU',
        'kalemlerdeAciklamaAktif': 'KALEMLERDE_ACIKLAMA_AKTIF',
        'onaySistemiKullan': 'ONAY_SISTEMI_KULLAN',
        'kdvHaric': 'KDV_HARIC',
        'kdvDahilHaricSor': 'KDV_DAHIL_HARIC_SOR',
        'ozelKod2Tablodan': 'OZEL_KOD2_TABLODAN',
        'muhrefkodSorulsun': 'MUHREFKOD_SORULSUN',
        'topluDepoKullan': 'TOPLU_DEPO_KULLAN',
        'kosulAktif': 'KOSUL_AKTIF',
        'satirIskontosu': 'SATIR_ISKONTOSU',
        'yuzdeSorulsun': 'YUZDE_SORULSUN',
        'malFazlasiIskonto': 'MAL_FAZLASI_ISKONTO',
        'genIsk1Aktif': 'GEN_ISK1_AKTIF',
        'genIsk1Adi': 'GEN_ISK1_ADI',
        'genIsk2Aktif': 'GEN_ISK2_AKTIF',
        'genIsk2Adi': 'GEN_ISK2_ADI',
        'genIsk3Aktif': 'GEN_ISK3_AKTIF',
        'genIsk3Adi': 'GEN_ISK3_ADI',
        'ozelKod1Tablodan': 'OZEL_KOD1_TABLODAN',
        'aciklamaAktif': 'ACIKLAMA_AKTIF',
        'miktar2Sor': 'MIKTAR2_SOR',
        'miktarBirGelsin': 'MIKTAR_BIR_GELSIN',
        'varsayilanMuhrefkod': 'VARSAYILAN_MUHREFKOD',
        'tutardanBirimFiata': 'TUTARDAN_BIRIM_FIATA',
        'cariIskSatiraUygula': 'CARI_ISK_SATIRA_UYGULA',
        'miktarSifirOlamaz': 'MIKTAR_SIFIR_OLAMAZ',
        'fatAltm1Varmi': 'FAT_ALTM1_VARMI',
        'fatAltm2Varmi': 'FAT_ALTM2_VARMI',
        'fatAltm1Tanim': 'FAT_ALTM1_TANIM',
        'fatAltm2Tanim': 'FAT_ALTM2_TANIM',
        'kdvSifirlanacakOzelkod2': 'KDV_SIFIRLANACAK_OZELKOD2',
        'kosulSatirdaAktif': 'KOSUL_SATIRDA_AKTIF'
      },
    );

Map<String, dynamic> _$TalTekParamToJson(TalTekParam instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('TIP', instance.tip);
  writeNotNull('BELGE_TIPI', instance.belgeTipi);
  writeNotNull('DOVIZ_TAKIP', instance.dovizTakip);
  writeNotNull('SATIR_ISKONTO_SAYISI', instance.satirIskontoSayisi);
  writeNotNull('FARKLI_BIRIMLERDEN_ISLEM', instance.farkliBirimlerdenIslem);
  writeNotNull('FARKLI_TESLIM_YERI', instance.farkliTeslimYeri);
  writeNotNull('DEPO_STOK_KARTINDAN_GELSIN', instance.depoStokKartindanGelsin);
  writeNotNull('EKACIKLAMALAR_AKTIF', instance.ekaciklamalarAktif);
  writeNotNull('OZEL_KOD1_AKTIF', instance.ozelKod1Aktif);
  writeNotNull('OZEL_KOD1_SECIM11', instance.ozelKod1Secim11);
  writeNotNull('OZEL_KOD1_SECIM21', instance.ozelKod1Secim21);
  writeNotNull('OZEL_KOD1_SECIM31', instance.ozelKod1Secim31);
  writeNotNull('OZEL_KOD1_SECIM41', instance.ozelKod1Secim41);
  writeNotNull('OZEL_KOD2_AKTIF', instance.ozelKod2Aktif);
  writeNotNull('ACIKLAR1', instance.aciklar1);
  writeNotNull('ACIKLAR2', instance.aciklar2);
  writeNotNull('SATIRDA_KDV_SOR', instance.satirdaKdvSor);
  writeNotNull('SATIR_TESLIM_TAR_SOR', instance.satirTeslimTarSor);
  writeNotNull('DOVIZ_TAKIP_HANGISI', instance.dovizTakipHangisi);
  writeNotNull('SATIR_EKALAN2_KULLAN', instance.satirEkalan2Kullan);
  writeNotNull('HIZMET_UYGULAMASI', instance.hizmetUygulamasi);
  writeNotNull('HIZMET_DEPO_KODU', instance.hizmetDepoKodu);
  writeNotNull('KALEMLERDE_ACIKLAMA_AKTIF', instance.kalemlerdeAciklamaAktif);
  writeNotNull('ONAY_SISTEMI_KULLAN', instance.onaySistemiKullan);
  writeNotNull('KDV_HARIC', instance.kdvHaric);
  writeNotNull('KDV_DAHIL_HARIC_SOR', instance.kdvDahilHaricSor);
  writeNotNull('OZEL_KOD2_TABLODAN', instance.ozelKod2Tablodan);
  writeNotNull('MUHREFKOD_SORULSUN', instance.muhrefkodSorulsun);
  writeNotNull('TOPLU_DEPO_KULLAN', instance.topluDepoKullan);
  writeNotNull('KOSUL_AKTIF', instance.kosulAktif);
  writeNotNull('SATIR_ISKONTOSU', instance.satirIskontosu);
  writeNotNull('YUZDE_SORULSUN', instance.yuzdeSorulsun);
  writeNotNull('MAL_FAZLASI_ISKONTO', instance.malFazlasiIskonto);
  writeNotNull('GEN_ISK1_AKTIF', instance.genIsk1Aktif);
  writeNotNull('GEN_ISK1_ADI', instance.genIsk1Adi);
  writeNotNull('GEN_ISK2_AKTIF', instance.genIsk2Aktif);
  writeNotNull('GEN_ISK2_ADI', instance.genIsk2Adi);
  writeNotNull('GEN_ISK3_AKTIF', instance.genIsk3Aktif);
  writeNotNull('GEN_ISK3_ADI', instance.genIsk3Adi);
  writeNotNull('OZEL_KOD1_TABLODAN', instance.ozelKod1Tablodan);
  writeNotNull('ACIKLAMA_AKTIF', instance.aciklamaAktif);
  writeNotNull('MIKTAR2_SOR', instance.miktar2Sor);
  writeNotNull('MIKTAR_BIR_GELSIN', instance.miktarBirGelsin);
  writeNotNull('VARSAYILAN_MUHREFKOD', instance.varsayilanMuhrefkod);
  writeNotNull('TUTARDAN_BIRIM_FIATA', instance.tutardanBirimFiata);
  writeNotNull('CARI_ISK_SATIRA_UYGULA', instance.cariIskSatiraUygula);
  writeNotNull('MIKTAR_SIFIR_OLAMAZ', instance.miktarSifirOlamaz);
  writeNotNull('FAT_ALTM1_VARMI', instance.fatAltm1Varmi);
  writeNotNull('FAT_ALTM2_VARMI', instance.fatAltm2Varmi);
  writeNotNull('FAT_ALTM1_TANIM', instance.fatAltm1Tanim);
  writeNotNull('FAT_ALTM2_TANIM', instance.fatAltm2Tanim);
  writeNotNull('KDV_SIFIRLANACAK_OZELKOD2', instance.kdvSifirlanacakOzelkod2);
  writeNotNull('KOSUL_SATIRDA_AKTIF', instance.kosulSatirdaAktif);
  return val;
}

YaziciList _$YaziciListFromJson(Map<String, dynamic> json) => $checkedCreate(
      'YaziciList',
      json,
      ($checkedConvert) {
        final val = YaziciList();
        $checkedConvert('yazici_adi', (v) => val.yaziciAdi = v as String?);
        $checkedConvert('yazici_tipi', (v) => val.yaziciTipi = v as String?);
        $checkedConvert('aciklama', (v) => val.aciklama = v as String?);
        return val;
      },
      fieldKeyMap: const {
        'yaziciAdi': 'yazici_adi',
        'yaziciTipi': 'yazici_tipi'
      },
    );

Map<String, dynamic> _$YaziciListToJson(YaziciList instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('yazici_adi', instance.yaziciAdi);
  writeNotNull('yazici_tipi', instance.yaziciTipi);
  writeNotNull('aciklama', instance.aciklama);
  return val;
}
