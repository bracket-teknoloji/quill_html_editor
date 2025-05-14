import "package:hive_flutter/hive_flutter.dart";
import "package:json_annotation/json_annotation.dart";

import "../../../core/base/model/base_network_mixin.dart";

part "param_model.g.dart";

@JsonSerializable(createFactory: true)
final class ParamModel {
  ParamModel();
  factory ParamModel.fromJson(Map<String, dynamic> json) => _$ParamModelFromJson(json);
  @JsonKey(name: "ParamYuklendi")
  bool? paramYuklendi;
  @JsonKey(name: "KULLANICI")
  String? kullanici;
  @JsonKey(name: "SIRKET")
  String? sirket;
  @JsonKey(name: "ISLETME_KODU")
  int? isletmeKodu;
  @JsonKey(name: "MapCariKullSahalar")
  MapCariKullSahalar? mapCariKullSahalar;
  @JsonKey(name: "MapCariEkAlanlar")
  List<MapEkAlanlar>? mapCariEkAlanlar;
  @JsonKey(name: "sabitSayfalamaOgeSayisi", defaultValue: 25)
  int sabitSayfalamaOgeSayisi = 25;
  @JsonKey(name: "_NetsisOndalikResponseModel")
  List<NetsisOndalikResponseModel>? netsisOndalikResponseModel;
  @JsonKey(name: "DepoList")
  List<DepoList>? depoList;
  @JsonKey(name: "DovizList")
  List<DovizList>? dovizList;
  @JsonKey(name: "SatirAcikBaslikList")
  List<SatirAcikBaslikList>? satirAcikBaslikList;
  @JsonKey(name: "KasaList")
  List<KasaList>? kasaList;
  @JsonKey(name: "PlasiyerList")
  List<PlasiyerList>? plasiyerList;
  @JsonKey(name: "PlasiyerListTumu")
  List<PlasiyerList>? plasiyerListTumu;
  @JsonKey(name: "SubeList")
  List<SubeList>? subeList;
  @JsonKey(name: "TalTekParam")
  List<TalTekParam>? talTekParam;
  @JsonKey(name: "CekSenParam")
  List<CekSenParam>? cekSenParam;
  @JsonKey(name: "ListOzelKodTum")
  List<ListOzelKodTum>? listOzelKodTum;
  @JsonKey(name: "ListIskTip")
  List<ListIskTip>? listIskTip;
  @JsonKey(name: "ListCariOdemeKodu")
  List<ListCariOdemeKodu>? listCariOdemeKodu;
  @JsonKey(name: "YaziciList")
  List<YaziciList>? yaziciList;
  @JsonKey(name: "NetFectDizaynList")
  List<NetFectDizaynList>? netFectDizaynList;
  @JsonKey(name: "MapStokGrupAdlari")
  MapStokGrupAdlari? mapStokGrupAdlari;
  @JsonKey(name: "MustahsilParam")
  MustahsilParam? mustahsilParam;
  @JsonKey(name: "ListFatuEkMaliyet")
  List<ListFatuEkMaliyet>? listFatuEkMaliyet;
  @JsonKey(name: "MapKdvSifirBelgeTipiOzelKod2")
  MapKdvSifirBelgeTipiOzelKod2? mapKdvSifirBelgeTipiOzelKod2;
  @JsonKey(name: "LokalDepoUygulamasiAcik")
  bool? lokalDepoUygulamasiAcik;
  @JsonKey(name: "EsnekYapilandir")
  bool? esnekYapilandir;
  @JsonKey(name: "OzelFiyatSistemi")
  bool? ozelFiyatSistemi;
  @JsonKey(name: "SadeceOzelFiyatSistemi")
  String? sadeceOzelFiyatSistemi;
  @JsonKey(name: "OtvliStoklarVar")
  bool? otvliStoklarVar;
  @JsonKey(name: "MapStokKullSahalar")
  MapStokKullSahalar? mapStokKullSahalar;
  @JsonKey(name: "MapStokEkAlanlar")
  List<MapEkAlanlar>? mapStokEkAlanlar;
  @JsonKey(name: "KarmaKoliUyg")
  String? karmaKoliUyg;
  @JsonKey(name: "AlisEkAciklamalarAktif")
  bool? alisEkAciklamalarAktif;
  @JsonKey(name: "AlisEkAciklamaTanimi1")
  String? alisEkAciklamaTanimi1;
  @JsonKey(name: "AlisEkAciklamaTanimi2")
  String? alisEkAciklamaTanimi2;
  @JsonKey(name: "AlisEkAciklamaTanimi3")
  String? alisEkAciklamaTanimi3;
  @JsonKey(name: "AlisEkAciklamaTanimi4")
  String? alisEkAciklamaTanimi4;
  @JsonKey(name: "AlisEkAciklamaTanimi5")
  String? alisEkAciklamaTanimi5;
  @JsonKey(name: "AlisEkAciklamaTanimi6")
  String? alisEkAciklamaTanimi6;
  @JsonKey(name: "AlisEkAciklamaTanimi7")
  String? alisEkAciklamaTanimi7;
  @JsonKey(name: "AlisEkAciklamaTanimi8")
  String? alisEkAciklamaTanimi8;
  @JsonKey(name: "AlisEkAciklamaTanimi9")
  String? alisEkAciklamaTanimi9;
  @JsonKey(name: "AlisEkAciklamaTanimi10")
  String? alisEkAciklamaTanimi10;
  @JsonKey(name: "AlisEkAciklamaTanimi11")
  String? alisEkAciklamaTanimi11;
  @JsonKey(name: "AlisEkAciklamaTanimi12")
  String? alisEkAciklamaTanimi12;
  @JsonKey(name: "AlisEkAciklamaTanimi13")
  String? alisEkAciklamaTanimi13;
  @JsonKey(name: "AlisEkAciklamaTanimi14")
  String? alisEkAciklamaTanimi14;
  @JsonKey(name: "AlisEkAciklamaTanimi15")
  String? alisEkAciklamaTanimi15;
  @JsonKey(name: "AlisEkAciklamaTanimi16")
  String? alisEkAciklamaTanimi16;
  @JsonKey(name: "AlisOzelKod1Tablodan")
  bool? alisOzelKod1Tablodan;
  @JsonKey(name: "SatisOzelKod1Tablodan")
  bool? satisOzelKod1Tablodan;
  @JsonKey(name: "AlisKosulAktif")
  bool? alisKosulAktif;
  @JsonKey(name: "AlisFarkliTeslimCariAktif")
  bool? alisFarkliTeslimCariAktif;
  @JsonKey(name: "AlisMalFazMiktarIskontoAcik")
  bool? alisMalFazMiktarIskontoAcik;
  @JsonKey(name: "AlisSatirKademeliIskontoAcik")
  bool? alisSatirKademeliIskontoAcik;
  @JsonKey(name: "AlisSatirKademeliIskontoSayisi")
  int? alisSatirKademeliIskontoSayisi;
  @JsonKey(name: "AlisGenIsk1Aktif")
  bool? alisGenIsk1Aktif;
  @JsonKey(name: "AlisGenIsk2Aktif")
  bool? alisGenIsk2Aktif;
  @JsonKey(name: "AlisGenIsk3Aktif")
  bool? alisGenIsk3Aktif;
  @JsonKey(name: "AlisTopluDepoAktif")
  bool? alisTopluDepoAktif;
  @JsonKey(name: "AlisStokDepoKarttanGelsin")
  bool? alisStokDepoKarttanGelsin;
  @JsonKey(name: "AlisGenellikleKDVHaric")
  bool? alisGenellikleKdvHaric;
  @JsonKey(name: "AlisFarkliOlcuBirimleriKullan")
  bool? alisFarkliOlcuBirimleriKullan;
  @JsonKey(name: "AlisDovizAktif")
  bool? alisDovizAktif;
  @JsonKey(name: "AlisSatirdaKDVSor")
  bool? alisSatirdaKdvSor;
  @JsonKey(name: "AlisSatirdaAciklamalarAktif")
  bool? alisSatirdaAciklamalarAktif;
  @JsonKey(name: "AlisSatirdaEkAlan2Aktif")
  bool? alisSatirdaEkAlan2Aktif;
  @JsonKey(name: "AlisEkMaliyet2Aktif")
  bool? alisEkMaliyet2Aktif;
  @JsonKey(name: "AlisEkMaliyet2Adi")
  String? alisEkMaliyet2Adi;
  @JsonKey(name: "AlisTevkifatPay")
  int? alisTevkifatPay;
  @JsonKey(name: "AlisTevkifatPayda")
  int? alisTevkifatPayda;
  @JsonKey(name: "AlisFaturaFiyatSifirGecilsin")
  bool? alisFaturaFiyatSifirGecilsin;
  @JsonKey(name: "AlisFazlaTeslimat")
  bool? alisFazlaTeslimat;
  @JsonKey(name: "AlisDovizTakipHangiDeger")
  int? alisDovizTakipHangiDeger;
  @JsonKey(name: "AlisHizmetAktif")
  bool? alisHizmetAktif;
  @JsonKey(name: "AlisHizmetDepoKodu")
  int? alisHizmetDepoKodu;
  @JsonKey(name: "AlisMiktar2Sor")
  bool? alisMiktar2Sor;
  @JsonKey(name: "AlisSatirdaTeslimTarihiSor")
  bool? alisSatirdaTeslimTarihiSor;
  @JsonKey(name: "AlisFisSeriTakibiVar")
  bool? alisFisSeriTakibiVar;
  @JsonKey(name: "AlisTutardanFiyataGecilsin")
  bool? alisTutardanFiyataGecilsin;
  @JsonKey(name: "AlisCariIskSatiraUygula")
  bool? alisCariIskSatiraUygula;
  @JsonKey(name: "SeriUygulamasiAcik")
  bool? seriUygulamasiAcik;
  @JsonKey(name: "SirketDovizUygulamasiAcik")
  bool? sirketDovizUygulamasiAcik;
  @JsonKey(name: "SirketDovizUygulamasiDovizKodu")
  int? sirketDovizUygulamasiDovizKodu;
  @JsonKey(name: "PlasiyerUygulamasi")
  bool? plasiyerUygulamasi;
  @JsonKey(name: "ParaBirimi")
  String? paraBirimi;
  @JsonKey(name: "BankaEntegre")
  bool? bankaEntegre;
  @JsonKey(name: "BagliCariVar")
  bool? bagliCariVar;
  @JsonKey(name: "ProjeUygulamasiAcik")
  bool? projeUygulamasiAcik;
  @JsonKey(name: "SatisOzelKod1Aktif")
  bool? satisOzelKod1Aktif;
  @JsonKey(name: "SatisOzelKod2Aktif")
  bool? satisOzelKod2Aktif;
  @JsonKey(name: "SatisEkAciklamalarAktif")
  bool? satisEkAciklamalarAktif;
  @JsonKey(name: "SatisEkAciklamaTanimi1")
  String? satisEkAciklamaTanimi1;
  @JsonKey(name: "SatisEkAciklamaTanimi2")
  String? satisEkAciklamaTanimi2;
  @JsonKey(name: "SatisEkAciklamaTanimi3")
  String? satisEkAciklamaTanimi3;
  @JsonKey(name: "SatisEkAciklamaTanimi4")
  String? satisEkAciklamaTanimi4;
  @JsonKey(name: "SatisEkAciklamaTanimi5")
  String? satisEkAciklamaTanimi5;
  @JsonKey(name: "SatisEkAciklamaTanimi6")
  String? satisEkAciklamaTanimi6;
  @JsonKey(name: "SatisEkAciklamaTanimi7")
  String? satisEkAciklamaTanimi7;
  @JsonKey(name: "SatisEkAciklamaTanimi8")
  String? satisEkAciklamaTanimi8;
  @JsonKey(name: "SatisEkAciklamaTanimi9")
  String? satisEkAciklamaTanimi9;
  @JsonKey(name: "SatisEkAciklamaTanimi10")
  String? satisEkAciklamaTanimi10;
  @JsonKey(name: "SatisEkAciklamaTanimi11")
  String? satisEkAciklamaTanimi11;
  @JsonKey(name: "SatisEkAciklamaTanimi12")
  String? satisEkAciklamaTanimi12;
  @JsonKey(name: "SatisEkAciklamaTanimi13")
  String? satisEkAciklamaTanimi13;
  @JsonKey(name: "SatisEkAciklamaTanimi14")
  String? satisEkAciklamaTanimi14;
  @JsonKey(name: "SatisEkAciklamaTanimi15")
  String? satisEkAciklamaTanimi15;
  @JsonKey(name: "SatisEkAciklamaTanimi16")
  String? satisEkAciklamaTanimi16;
  @JsonKey(name: "SatisSatirIsk1YuzdeSor")
  bool? satisSatirIsk1YuzdeSor;
  @JsonKey(name: "SatisKosulAktif")
  bool? satisKosulAktif;
  @JsonKey(name: "SatisKosulSatirdaSor")
  bool? satisKosulSatirdaSor;
  @JsonKey(name: "SatisFarkliTeslimCariAktif")
  bool? satisFarkliTeslimCariAktif;
  @JsonKey(name: "SatisMalFazMiktarIskontoAcik")
  bool? satisMalFazMiktarIskontoAcik;
  @JsonKey(name: "SatisSatirKademeliIskontoAcik")
  bool? satisSatirKademeliIskontoAcik;
  @JsonKey(name: "SatisSatirKademeliIskontoSayisi")
  int? satisSatirKademeliIskontoSayisi;
  @JsonKey(name: "SatisSatirdaKDVSor")
  bool? satisSatirdaKdvSor;
  @JsonKey(name: "SatisGenIsk1Aktif")
  bool? satisGenIsk1Aktif;
  @JsonKey(name: "SatisGenIsk2Aktif")
  bool? satisGenIsk2Aktif;
  @JsonKey(name: "SatisGenIsk3Aktif")
  bool? satisGenIsk3Aktif;
  @JsonKey(name: "SatisTopluDepoAktif")
  bool? satisTopluDepoAktif;
  @JsonKey(name: "SatisStokDepoKarttanGelsin")
  bool? satisStokDepoKarttanGelsin;
  @JsonKey(name: "SatisGenellikleKDVHaric")
  bool? satisGenellikleKdvHaric;
  @JsonKey(name: "SatisFarkliOlcuBirimleriKullan")
  bool? satisFarkliOlcuBirimleriKullan;
  @JsonKey(name: "SatisCariRiskTakibi")
  String? satisCariRiskTakibi;
  @JsonKey(name: "SatisDovizAktif")
  bool? satisDovizAktif;
  @JsonKey(name: "SatisSatirdaAciklamalarAktif")
  bool? satisSatirdaAciklamalarAktif;
  @JsonKey(name: "SatisSatirdaEkAlan2Aktif")
  bool? satisSatirdaEkAlan2Aktif;
  @JsonKey(name: "SatisEkMaliyet2Aktif")
  bool? satisEkMaliyet2Aktif;
  @JsonKey(name: "SatisEkMaliyet2Adi")
  String? satisEkMaliyet2Adi;
  @JsonKey(name: "SatisTevkifatPay")
  int? satisTevkifatPay;
  @JsonKey(name: "SatisTevkifatPayda")
  int? satisTevkifatPayda;
  @JsonKey(name: "SatisFaturaFiyatSifirGecilsin")
  bool? satisFaturaFiyatSifirGecilsin;
  @JsonKey(name: "SatisFazlaTeslimat")
  bool? satisFazlaTeslimat;
  @JsonKey(name: "SatisDovizTakipHangiDeger")
  int? satisDovizTakipHangiDeger;
  @JsonKey(name: "SatisHizmetAktif")
  bool? satisHizmetAktif;
  @JsonKey(name: "SatisHizmetDepoKodu")
  int? satisHizmetDepoKodu;
  @JsonKey(name: "SatisMiktar2Sor")
  bool? satisMiktar2Sor;
  @JsonKey(name: "SatisSubeDATOnaylansin")
  bool? satisSubeDatOnaylansin;
  @JsonKey(name: "SatisSatirdaTeslimTarihiSor")
  bool? satisSatirdaTeslimTarihiSor;
  @JsonKey(name: "SatisSatirdaIsEmriSorulsun")
  bool? satisSatirdaIsEmriSorulsun;
  @JsonKey(name: "SatisFisSeriTakibiVar")
  bool? satisFisSeriTakibiVar;
  @JsonKey(name: "SatisIrsCariHesaba")
  bool? satisIrsCariHesaba;
  @JsonKey(name: "SatisEkAlan1Aktif")
  bool? satisEkAlan1Aktif;
  @JsonKey(name: "SatisDATSiparisTakibi")
  String? satisDatSiparisTakibi;
  @JsonKey(name: "SatisIrsFatuSipVadeDegissin")
  String? satisIrsFatuSipVadeDegissin;
  @JsonKey(name: "KonsinyeUygulamasi")
  bool? konsinyeUygulamasi;
  @JsonKey(name: "MSenetDovizAktif")
  bool? mSenetDovizAktif;
  @JsonKey(name: "MCekDovizAktif")
  bool? mCekDovizAktif;
  @JsonKey(name: "MCekAciklamaAktif")
  bool? mCekAciklamaAktif;
  @JsonKey(name: "SeriGirislerdeOtomatik")
  bool? seriGirislerdeOtomatik;
  @JsonKey(name: "SerideYilOlsun")
  bool? serideYilOlsun;
  @JsonKey(name: "SerideAyOlsun")
  bool? serideAyOlsun;
  @JsonKey(name: "SerideGunOlsun")
  bool? serideGunOlsun;
  @JsonKey(name: "SeriUzunlugu")
  int? seriUzunlugu;
  @JsonKey(name: "SeriEkAlanList")
  List<String>? seriEkAlanList;
  @JsonKey(name: "EFaturaAktif")
  bool? eFaturaAktif;
  @JsonKey(name: "Seri_EFatura")
  String? seriEFatura;
  @JsonKey(name: "EFaturaSenaryoDegistir")
  bool? eFaturaSenaryoDegistir;
  @JsonKey(name: "EIrsaliyeAktif")
  bool? eIrsaliyeAktif;
  @JsonKey(name: "SeriEIrsaliye")
  String? seriEIrsaliye;
  @JsonKey(name: "ArrEIrsSeri")
  List<String>? arrEIrsSeri;
  @JsonKey(name: "ArrEFatSeri")
  List<String>? arrEFatSeri;
  @JsonKey(name: "ArrEArSeri")
  List<String>? arrEArSeri;
  @JsonKey(name: "Seri_EArsiv")
  String? seriEArsiv;
  @JsonKey(name: "UretimEkAlanKullan")
  bool? uretimEkAlanKullan;
  @JsonKey(name: "OzelFaturaIadeMaliyetiZorunlu")
  bool? ozelFaturaIadeMaliyetiZorunlu;
  @JsonKey(name: "bankaKKartiKasayaIsle")
  bool? bankaKKartiKasayaIsle;
  @JsonKey(name: "KayitliBankaHesapTipleri")
  List<int>? kayitliBankaHesapTipleri;
  @JsonKey(name: "KKNoZorunluDegil")
  bool? kkNoZorunluDegil;
  @JsonKey(name: "FifoLifoYontem")
  String? fifoLifoYontem;
  @JsonKey(name: "CariAktiviteUygulamasi")
  String? cariAktiviteUygulamasi;
  @JsonKey(name: "CariAktiviteTipleri")
  List<CariAktiviteTipleri>? cariAktiviteTipleri;
  @JsonKey(name: "CariAktiviteEkAlanlar")
  List<int>? cariAktiviteEkAlanlar;
  @JsonKey(name: "SatisCariDovizTipiniKullan")
  bool? satisCariDovizTipiniKullan;
  @JsonKey(name: "AlisCariDovizTipiniKullan")
  bool? alisCariDovizTipiniKullan;
  @JsonKey(name: "Fatu_KontrolAciklamasiAktif")
  List<String>? fatuKontrolAciklamasiAktif;
  @JsonKey(name: "SatisFiyatGrubuSorulacakAlan")
  String? satisFiyatGrubuSorulacakAlan;
  @JsonKey(name: "Siparis_FarkliSubeUyg")
  String? siparisFarkliSubeUyg;
  @JsonKey(name: "SatisIskEkSahadanGelsin")
  String? satisIskEkSahadanGelsin;
  @JsonKey(name: "SatisIsk1Saha")
  String? satisIsk1Saha;
  @JsonKey(name: "SatisIsk1Kullanim")
  String? satisIsk1Kullanim;
  @JsonKey(name: "Uretim_MalTop_HangiHucrede")
  bool? uretimMalTopHangiHucrede;
  @JsonKey(name: "Uretim_MalTop_FazlaTeslimYapilabilir")
  bool? uretimMalTopFazlaTeslimYapilabilir;
  @JsonKey(name: "Uretim_USK_SeriGirilsin")
  bool? uretimUskSeriGirilsin;
  @JsonKey(name: "Finans_BankaIslemModulu")
  String? finansBankaIslemModulu;
  @JsonKey(name: "Finans_BankaTcmbBankaKodu")
  String? finansBankaTcmbBankaKodu;
  @JsonKey(name: "Finans_BankaTcmbSubeKodu")
  String? finansBankaTcmbSubeKodu;
  @JsonKey(name: "Finans_CekSenOzelOrtalamaVadeGunuHesapla")
  List<String>? finansCekSenOzelOrtalamaVadeGunuHesapla;
  @JsonKey(name: "Stok_Yap_RehberTipi")
  String? stokYapRehberTipi;
  @JsonKey(name: "Stok_KanbanBarkodEslemeUyg")
  String? stokKanbanBarkodEslemeUyg;
  @JsonKey(name: "Stok_SeriParcalamaUyg")
  String? stokSeriParcalamaUyg;
  @JsonKey(name: "Stok_DetayliAramaAlanlar")
  List<StokDetayliAramaAlanlar>? stokDetayliAramaAlanlar;
  @JsonKey(name: "Genel_KonumTakibiYapilsin")
  String? genelKonumTakibiYapilsin;
  @JsonKey(name: "Genel_KonumTakibiDakika")
  int? genelKonumTakibiDakika;
  @JsonKey(name: "Genel_KonumTakibiMetre")
  int? genelKonumTakibiMetre;
  @JsonKey(name: "UetdsEsyaAktif")
  bool? uetdsEsyaAktif;
  @JsonKey(name: "SatistaSiparisKullan")
  bool? satistaSiparisKullan;
  @JsonKey(name: "AlistaSiparisKullan")
  bool? alistaSiparisKullan;
  @JsonKey(name: "SipOtoEslestir")
  bool? sipOtoEslestir;
  @JsonKey(name: "SevkEmriTerminalFatura")
  bool? sevkEmriTerminalFatura;
  @JsonKey(name: "SevkEmriTerminalIrsaliye")
  bool? sevkEmriTerminalIrsaliye;
  @JsonKey(name: "SevkEmriTerminalTransfer")
  bool? sevkEmriTerminalTransfer;
  @JsonKey(name: "SevkEmriHucreKontrol")
  bool? sevkEmriHucreKontrol;
  @JsonKey(name: "SevkEmriMalTopGorunecekAlanlar")
  List<String>? sevkEmriMalTopGorunecekAlanlar;
  @JsonKey(name: "Seri_SevkIrsaliye")
  String? seriSevkIrsaliye;
  @JsonKey(name: "KontrolluBelgeAktarimAktif")
  bool? kontrolluBelgeAktarimAktif;
  @JsonKey(name: "KontrolluBelgeAktarimBelgeNoGoster")
  List<dynamic>? kontrolluBelgeAktarimBelgeNoGoster;
  @JsonKey(name: "EMustahsilAktif")
  bool? eMustahsilAktif;
  @JsonKey(name: "MuhasebeEntegre")
  bool? muhasebeEntegre;
  @JsonKey(name: "MuhFislerdeRefKodSorulsun")
  bool? muhFislerdeRefKodSorulsun;
  @JsonKey(name: "MuhFislerdeRefKodSorulsun_Aktif")
  bool? muhFislerdeRefKodSorulsunAktif;
  @JsonKey(name: "MuhFislerdeRefKodSorulsun_Pasif")
  bool? muhFislerdeRefKodSorulsunPasif;
  @JsonKey(name: "MuhFislerdeRefKodSorulsun_Gelir")
  bool? muhFislerdeRefKodSorulsunGelir;
  @JsonKey(name: "MuhFislerdeRefKodSorulsun_Gider")
  bool? muhFislerdeRefKodSorulsunGider;
  @JsonKey(name: "MuhFislerdeRefKodSorulsun_Nazim")
  bool? muhFislerdeRefKodSorulsunNazim;
  @JsonKey(name: "AlisOzelKod1Aktif")
  bool? alisOzelKod1Aktif;
  @JsonKey(name: "AlisOzelKod2Aktif")
  bool? alisOzelKod2Aktif;
  @JsonKey(name: "AlisOzelKod2Tablodan")
  bool? alisOzelKod2Tablodan;
  @JsonKey(name: "AlisMiktar1Gelsin")
  bool? alisMiktar1Gelsin;
  @JsonKey(name: "SatisMiktar1Gelsin")
  bool? satisMiktar1Gelsin;
  @JsonKey(name: "SatisOzelKod2Tablodan")
  bool? satisOzelKod2Tablodan;
  @JsonKey(name: "SeriCikislardaOtomatik")
  bool? seriCikislardaOtomatik;
  @JsonKey(name: "SerideSaatOlsun")
  bool? serideSaatOlsun;
  @JsonKey(name: "SeriEIrsaliyeYanit")
  String? seriEIrsaliyeYanit;
  @JsonKey(name: "DAT_SatirBazindaDepoSorulsun")
  bool? datSatirBazindaDepoSorulsun;
  @JsonKey(name: "StokResimleriKlasorden")
  bool? stokResimleriKlasorden;
  @JsonKey(name: "AlisEkAlan1Aktif")
  bool? alisEkAlan1Aktif;
  @JsonKey(name: "AlisEkMaliyet1KdvOrani")
  double? alisEkMaliyet1KdvOrani;
  @JsonKey(name: "SatisAciklamaAlaniGorunsun")
  bool? satisAciklamaAlaniGorunsun;
  @JsonKey(name: "AlisAciklamaAlaniGorunsun")
  bool? alisAciklamaAlaniGorunsun;
  @JsonKey(name: "SatisMusteriSiptenSaticiSipAktif")
  bool? satisMusteriSiptenSaticiSipAktif;
  @JsonKey(name: "SatisSipOnayAktif")
  bool? satisSipOnayAktif;
  @JsonKey(name: "SatisMuhRefKodSorulsun")
  bool? satisMuhRefKodSorulsun;
  @JsonKey(name: "AlisMuhRefKodSorulsun")
  bool? alisMuhRefKodSorulsun;
  @JsonKey(name: "SatisEkMaliyet1KdvOrani")
  double? satisEkMaliyet1KdvOrani;
  @JsonKey(name: "FatuSatisTeslimCarideBaglanmisCarilerSecilsin")
  bool? fatuSatisTeslimCarideBaglanmisCarilerSecilsin;
  @JsonKey(name: "FatuAlisTeslimCarideBaglanmisCarilerSecilsin")
  bool? fatuAlisTeslimCarideBaglanmisCarilerSecilsin;
  @JsonKey(name: "SeriUrunBazindaTekOlsun")
  bool? seriUrunBazindaTekOlsun;
  @JsonKey(name: "EArsivAktif")
  bool? eArsivAktif;
  @JsonKey(name: "SatisTeslimCarideBaglanmisCarilerSecilsin")
  bool? satisTeslimCarideBaglanmisCarilerSecilsin;
  @JsonKey(name: "AlisTeslimCarideBaglanmisCarilerSecilsin")
  bool? alisTeslimCarideBaglanmisCarilerSecilsin;
  @JsonKey(name: "FaturaSatisIadeUygulamasi")
  bool? faturaSatisIadeUygulamasi;
  @JsonKey(name: "CariRotaUygulamasi")
  String? cariRotaUygulamasi;
  @JsonKey(name: "sevkEmriYeniKullaniciSistemi")
  bool? sevkEmriYeniKullaniciSistemi;
  @JsonKey(name: "fatuEkMaliyet3FieldVar")
  bool? fatuEkMaliyet3FieldVar;
  @JsonKey(name: "ClientTimeoutSeconds")
  int? clientTimeoutSeconds;
  @JsonKey(name: "AlisIhracatMiktarStoklaraGecsin")
  bool? alisIhracatMiktarStoklaraGecsin;
  @JsonKey(name: "SatisIhracatMiktarStoklaraGecsin")
  bool? satisIhracatMiktarStoklaraGecsin;
  @JsonKey(name: "SeriOpsiyonelSahalar")
  int? seriOpsiyonelSahalar;
  @JsonKey(name: "UretimMiktar2Uyg")
  bool? uretimMiktar2Uyg;
  @JsonKey(name: "UretimFireUyg")
  bool? uretimFireUyg;
  @JsonKey(name: "UretimFireDetayUyg")
  bool? uretimFireDetayUyg;
  @JsonKey(name: "NetsisOzelParam_FaturaOzelIletisimVergisi")
  bool? netsisOzelParamFaturaOzelIletisimVergisi;
  @JsonKey(name: "eMail_Sunucu")
  String? eMailSunucu;
  @JsonKey(name: "eMail_MailAdresi")
  String? eMailMailAdresi;
  @JsonKey(name: "eMail_Parola")
  String? eMailParola;
  @JsonKey(name: "eMail_Port")
  int? eMailPort;
  @JsonKey(name: "eMail_SSLKullan")
  bool? eMailSslKullan;
  @JsonKey(name: "SevkEmriMalTopFazlaTeslimat")
  String? sevkEmriMalTopFazlaTeslimat;
  @JsonKey(name: "say_Kull1S")
  String? sayKull1S;
  @JsonKey(name: "say_Kull2S")
  String? sayKull2S;
  @JsonKey(name: "say_Kull3S")
  String? sayKull3S;
  @JsonKey(name: "say_Kull4S")
  String? sayKull4S;
  @JsonKey(name: "say_Kull5S")
  String? sayKull5S;
  @JsonKey(name: "AlisSatirBazindaVade")
  bool? alisSatirBazindaVade;
  @JsonKey(name: "SatisSatirBazindaVade")
  bool? satisSatirBazindaVade;
  @JsonKey(name: "NetOpenXEPosta")
  String? netOpenXePosta;
  @JsonKey(name: "NetOpenXLog")
  String? netOpenXLog;
  @JsonKey(name: "SayfalamaKayitSayisi")
  int? sayfalamaKayitSayisi;
  Map<String, dynamic> toJson() => _$ParamModelToJson(this);
}

@JsonSerializable(createFactory: true)
final class CariAktiviteTipleri {
  CariAktiviteTipleri();
  factory CariAktiviteTipleri.fromJson(Map<String, dynamic> json) => _$CariAktiviteTipleriFromJson(json);
  @JsonKey(name: "AKTIVITE_TIPI")
  int? aktiviteTipi;
  @JsonKey(name: "AKTIVITE_ADI")
  String? aktiviteAdi;
  Map<String, dynamic> toJson() => _$CariAktiviteTipleriToJson(this);
}

@JsonSerializable(createFactory: true)
final class CekSenParam {
  CekSenParam();

  factory CekSenParam.fromJson(Map<String, dynamic> json) => _$CekSenParamFromJson(json);
  @JsonKey(name: "BELGE_TIPI")
  String? belgeTipi;
  @JsonKey(name: "DOVIZ_AKTIF")
  String? dovizAktif;
  @JsonKey(name: "VERILEN_KODU_ISTENSIN")
  String? verilenKoduIstensin;
  @JsonKey(name: "EK_ACIKLAMA_KULLAN")
  String? ekAciklamaKullan;
  @JsonKey(name: "CIKISTA_BANKA_KODU")
  String? cikistaBankaKodu;
  Map<String, dynamic> toJson() => _$CekSenParamToJson(this);
}

@JsonSerializable(createFactory: true)
@HiveType(typeId: 3)
final class DepoList {
  DepoList();

  factory DepoList.fromJson(Map<String, dynamic> json) => _$DepoListFromJson(json);
  @JsonKey(name: "DEPO_KODU")
  @HiveField(0)
  int? depoKodu;
  @JsonKey(name: "DEPO_TANIMI")
  @HiveField(1)
  String? depoTanimi;
  @JsonKey(name: "BAKIYE_TAKIBI")
  @HiveField(2)
  String? bakiyeTakibi;
  @JsonKey(name: "HUCRE_TAKIBI")
  @HiveField(3)
  String? _hucreTakibi;
  @JsonKey(name: "SUBE_KODU")
  @HiveField(4)
  int? subeKodu;
  Map<String, dynamic> toJson() => _$DepoListToJson(this);

  bool get hucreTakibiMi => _hucreTakibi == "E";
}

@JsonSerializable(createFactory: true)
final class DovizList {
  DovizList({this.dovizKodu, this.dovizTipi, this.isim, this.alis, this.satis, this.efAlis, this.efSatis});

  factory DovizList.fromJson(Map<String, dynamic> json) => _$DovizListFromJson(json);
  @JsonKey(name: "DOVIZ_KODU")
  int? dovizKodu;
  @JsonKey(name: "DOVIZ_TIPI")
  int? dovizTipi;
  @JsonKey(name: "ISIM")
  String? isim;
  @JsonKey(name: "ALIS")
  double? alis;
  @JsonKey(name: "SATIS")
  double? satis;
  @JsonKey(name: "EF_ALIS")
  double? efAlis;
  @JsonKey(name: "EF_SATIS")
  double? efSatis;

  Map<String, dynamic> toJson() => _$DovizListToJson(this);
}

@JsonSerializable(createFactory: true)
final class KasaList with NetworkManagerMixin {
  KasaList();

  factory KasaList.fromJson(Map<String, dynamic> json) => _$KasaListFromJson(json);

  @JsonKey(name: "KASA_KODU")
  String? kasaKodu;
  @JsonKey(name: "KASA_TANIMI")
  String? kasaTanimi;
  @JsonKey(name: "SUBE_KODU")
  int? subeKodu;
  @JsonKey(name: "DOVIZLI")
  String? dovizli;
  @JsonKey(name: "DOVIZ_TIPI")
  int? dovizTipi;
  @JsonKey(name: "KKART_KASASI")
  bool? kkartKasasi;
  @JsonKey(name: "DEVIR_TUTARI")
  double? devirTutari;
  @JsonKey(name: "DOVIZ_DEVIR_TUTARI")
  double? dovizDevirTutari;
  @JsonKey(name: "DOVIZ_ADI")
  String? dovizAdi;
  @JsonKey(name: "TOPLAM_GIRIS")
  double? toplamGiris;
  @JsonKey(name: "TOPLAM_CIKIS")
  double? toplamCikis;
  @JsonKey(name: "BAKIYE")
  double? bakiye;
  @JsonKey(name: "DEVIRLI_BAKIYE")
  double? devirliBakiye;
  @JsonKey(name: "DOVIZ_TOPLAM_GIRIS")
  double? dovizToplamGiris;
  @JsonKey(name: "DOVIZ_TOPLAM_CIKIS")
  double? dovizToplamCikis;
  @JsonKey(name: "DOVIZ_BAKIYE")
  double? dovizBakiye;
  @JsonKey(name: "DEVIRLI_DOVIZ_BAKIYE")
  double? devirliDovizBakiye;

  @override
  KasaList fromJson(Map<String, dynamic> json) => _$KasaListFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$KasaListToJson(this);

  bool get dovizliMi => dovizli == "E";
}

@JsonSerializable(createFactory: true)
final class ListCariOdemeKodu {
  ListCariOdemeKodu();

  factory ListCariOdemeKodu.fromJson(Map<String, dynamic> json) => _$ListCariOdemeKoduFromJson(json);

  String? odemeKodu;
  String? aciklama;
  Map<String, dynamic> toJson() => _$ListCariOdemeKoduToJson(this);
}

@JsonSerializable(createFactory: true)
final class ListFatuEkMaliyet {
  ListFatuEkMaliyet();

  factory ListFatuEkMaliyet.fromJson(Map<String, dynamic> json) => _$ListFatuEkMaliyetFromJson(json);

  int? no;
  String? belgeTipi;
  String? adi;
  Map<String, dynamic> toJson() => _$ListFatuEkMaliyetToJson(this);
}

@JsonSerializable(createFactory: true)
final class ListIskTip {
  ListIskTip();

  factory ListIskTip.fromJson(Map<String, dynamic> json) => _$ListIskTipFromJson(json);

  int? iskontoTipi;
  String? aciklama;
  Map<String, dynamic> toJson() => _$ListIskTipToJson(this);
}

@JsonSerializable(createFactory: true)
final class ListOzelKodTum {
  ListOzelKodTum();

  factory ListOzelKodTum.fromJson(Map<String, dynamic> json) => _$ListOzelKodTumFromJson(json);

  int? kodTipi;
  String? belgeTipi;
  String? kod;
  String? aciklama;
  int? fiyatSirasi;
  Map<String, dynamic> toJson() => _$ListOzelKodTumToJson(this);
}

@JsonSerializable(createFactory: true, fieldRename: FieldRename.none)
final class MapEkAlanlar {
  MapEkAlanlar();

  factory MapEkAlanlar.fromJson(Map<String, dynamic> json) => _$MapEkAlanlarFromJson(json);

  String? caption;
  String? fieldName;
  @JsonKey(name: "-veriTipi")
  String? veriTipi;
  Map<String, dynamic> toJson() => _$MapEkAlanlarToJson(this);
}

@JsonSerializable()
final class MapCariKullSahalar {
  MapCariKullSahalar();

  factory MapCariKullSahalar.fromJson(Map<String, dynamic> json) => _$MapCariKullSahalarFromJson(json);

  @JsonKey(name: "1S")
  String? the1S;
  @JsonKey(name: "2S")
  String? the2S;
  @JsonKey(name: "3S")
  String? the3S;
  @JsonKey(name: "4S")
  String? the4S;
  @JsonKey(name: "5S")
  String? the5S;
  @JsonKey(name: "6S")
  String? the6S;
  @JsonKey(name: "7S")
  String? the7S;
  @JsonKey(name: "8S")
  String? the8S;
  @JsonKey(name: "1N")
  String? the1N;
  @JsonKey(name: "2N")
  String? the2N;
  @JsonKey(name: "3N")
  String? the3N;
  @JsonKey(name: "4N")
  String? the4N;
  @JsonKey(name: "5N")
  String? the5N;
  @JsonKey(name: "6N")
  String? the6N;
  @JsonKey(name: "7N")
  String? the7N;
  @JsonKey(name: "8N")
  String? the8N;
  Map<String, dynamic> toJson() => _$MapCariKullSahalarToJson(this);
}

@JsonSerializable(createFactory: true)
final class MapKdvSifirBelgeTipiOzelKod2 {
  MapKdvSifirBelgeTipiOzelKod2();

  factory MapKdvSifirBelgeTipiOzelKod2.fromJson(Map<String, dynamic> json) =>
      _$MapKdvSifirBelgeTipiOzelKod2FromJson(json);

  String? dc;
  String? ac;
  String? ms;
  String? si;
  String? sf;
  String? stek;
  Map<String, dynamic> toJson() => _$MapKdvSifirBelgeTipiOzelKod2ToJson(this);
}

@JsonSerializable(createFactory: true, fieldRename: FieldRename.pascal)
final class MapStokGrupAdlari {
  MapStokGrupAdlari();

  factory MapStokGrupAdlari.fromJson(Map<String, dynamic> json) => _$MapStokGrupAdlariFromJson(json);

  String? grupKodu;
  String? kod1;
  String? kod2;
  String? kod3;
  String? kod4;
  String? kod5;
  Map<String, dynamic> toJson() => _$MapStokGrupAdlariToJson(this);
}

@JsonSerializable(createFactory: true)
final class MapStokKullSahalar {
  MapStokKullSahalar();

  factory MapStokKullSahalar.fromJson(Map<String, dynamic> json) => _$MapStokKullSahalarFromJson(json);

  @JsonKey(name: "1S")
  String? the1S;
  @JsonKey(name: "2S")
  String? the2S;
  @JsonKey(name: "3S")
  String? the3S;
  @JsonKey(name: "4S")
  String? the4S;
  @JsonKey(name: "5S")
  String? the5S;
  @JsonKey(name: "6S")
  String? the6S;
  @JsonKey(name: "7S")
  String? the7S;
  @JsonKey(name: "8S")
  String? the8S;
  @JsonKey(name: "1N")
  String? the1N;
  @JsonKey(name: "2N")
  String? the2N;
  @JsonKey(name: "3N")
  String? the3N;
  @JsonKey(name: "4N")
  String? the4N;
  @JsonKey(name: "5N")
  String? the5N;
  @JsonKey(name: "6N")
  String? the6N;
  @JsonKey(name: "7N")
  String? the7N;
  @JsonKey(name: "8N")
  String? the8N;
  Map<String, dynamic> toJson() => _$MapStokKullSahalarToJson(this);
}

@JsonSerializable(createFactory: true)
final class MustahsilParam {
  MustahsilParam();

  factory MustahsilParam.fromJson(Map<String, dynamic> json) => _$MustahsilParamFromJson(json);

  double? stopajOrani;
  double? fonOrani;
  double? borsaOrani;
  int? bagkurOrani;
  String? bagkurYb;
  double? meraOrani;
  String? borsaUcretDuzenlemesi;
  Map<String, dynamic> toJson() => _$MustahsilParamToJson(this);
}

@JsonSerializable(createFactory: true)
@HiveType(typeId: 47)
final class NetFectDizaynList {
  NetFectDizaynList();

  factory NetFectDizaynList.fromJson(Map<dynamic, dynamic> json) =>
      _$NetFectDizaynListFromJson(json as Map<String, dynamic>);

  @HiveField(0)
  int? id;
  @HiveField(1)
  String? dizaynYeri;
  @HiveField(2)
  String? dizaynYolu;
  @HiveField(3)
  String? dizaynAdi;
  @HiveField(4)
  String? ozelKod;
  @HiveField(5)
  int? kopyaSayisi;
  @HiveField(6)
  String? sablonVar;
  @HiveField(7)
  String? aktif;
  @HiveField(8)
  String? dosyaAdi;
  @HiveField(9)
  String? parametreler;
  @HiveField(10)
  bool? varsayilanMi;
  @HiveField(11)
  String? detayKod;
  Map<String, dynamic> toJson() => _$NetFectDizaynListToJson(this);

  bool get aktifMi => aktif == "E";
}

@JsonSerializable(createFactory: true)
final class NetsisOndalikResponseModel {
  NetsisOndalikResponseModel();

  factory NetsisOndalikResponseModel.fromJson(Map<String, dynamic> json) => _$NetsisOndalikResponseModelFromJson(json);

  String? modul;
  int? miktar;
  int? fiyat;
  int? tutar;
  int? kur;
  int? doviz;
  int? dovizFiyati;
  int? oran;
  Map<String, dynamic> toJson() => _$NetsisOndalikResponseModelToJson(this);
}

@JsonSerializable(createFactory: true)
final class PlasiyerList {
  PlasiyerList({this.plasiyerKodu, this.plasiyerAciklama});

  factory PlasiyerList.fromJson(Map<String, dynamic> json) => _$PlasiyerListFromJson(json);

  String? plasiyerKodu;
  String? plasiyerAciklama;
  Map<String, dynamic> toJson() => _$PlasiyerListToJson(this);
}

@JsonSerializable(createFactory: true)
final class SatirAcikBaslikList {
  SatirAcikBaslikList();

  factory SatirAcikBaslikList.fromJson(Map<String, dynamic> json) => _$SatirAcikBaslikListFromJson(json);

  String? belgeKodu;
  String? aciklama1;
  String? aciklama2;
  String? aciklama3;
  String? aciklama4;
  String? aciklama5;
  String? aciklama6;
  String? aciklama7;
  String? aciklama8;
  String? aciklama9;
  String? aciklama10;
  Map<String, dynamic> toJson() => _$SatirAcikBaslikListToJson(this);
}

@JsonSerializable(createFactory: true, fieldRename: FieldRename.pascal)
final class StokDetayliAramaAlanlar {
  StokDetayliAramaAlanlar({this.searchField, this.name, this.searchCriter, this.searchText});

  factory StokDetayliAramaAlanlar.fromJson(Map<String, dynamic> json) => _$StokDetayliAramaAlanlarFromJson(json);
  String? searchField;
  String? name;
  String? searchCriter;
  String? searchText;
  Map<String, dynamic> toJson() => _$StokDetayliAramaAlanlarToJson(this);
}

@JsonSerializable(createFactory: true)
final class SubeList {
  SubeList();

  factory SubeList.fromJson(Map<String, dynamic> json) => _$SubeListFromJson(json);

  String? sirket;
  int? isletmeKodu;
  String? subeAdi;
  String? isletmeAdi;
  bool? lokalDepoAktif;
  String? merkezmi;
  String? adres;
  String? telefon;
  String? faks;
  String? email;
  String? ilAdi;
  String? ilce;
  String? vergiNumarasi;
  String? vergiDairesi;
  String? paraBirimi;
  String? paraBirimiKusurat;
  int? subeKodu;
  String? cariKodu;
  String? cariAdi;
  Map<String, dynamic> toJson() => _$SubeListToJson(this);
}

@JsonSerializable(createFactory: true)
final class TalTekParam {
  TalTekParam();

  factory TalTekParam.fromJson(Map<String, dynamic> json) => _$TalTekParamFromJson(json);
  int? tip;
  String? belgeTipi;
  String? dovizTakip;
  String? satirIskontoSayisi;
  String? farkliBirimlerdenIslem;
  String? farkliTeslimYeri;
  String? depoStokKartindanGelsin;
  String? ekaciklamalarAktif;
  String? ozelKod1Aktif;
  String? ozelKod1Secim11;
  String? ozelKod1Secim21;
  String? ozelKod1Secim31;
  String? ozelKod1Secim41;
  String? ozelKod2Aktif;
  String? aciklar1;
  String? aciklar2;
  String? aciklar3;
  String? aciklar4;
  String? aciklar5;
  String? aciklar6;
  String? aciklar7;
  String? aciklar8;
  String? aciklar9;
  String? aciklar10;
  String? aciklar11;
  String? aciklar12;
  String? aciklar13;
  String? aciklar14;
  String? aciklar15;
  String? aciklar16;
  String? satirdaKdvSor;
  String? satirTeslimTarSor;
  int? dovizTakipHangisi;
  String? satirEkalan2Kullan;
  String? hizmetUygulamasi;
  int? hizmetDepoKodu;
  String? kalemlerdeAciklamaAktif;
  String? onaySistemiKullan;
  String? kdvHaric;
  String? kdvDahilHaricSor;
  String? ozelKod2Tablodan;
  String? muhrefkodSorulsun;
  String? topluDepoKullan;
  String? kosulAktif;
  String? satirIskontosu;
  String? yuzdeSorulsun;
  String? malFazlasiIskonto;
  String? genIsk1Aktif;
  String? genIsk1Adi;
  String? genIsk2Aktif;
  String? genIsk2Adi;
  String? genIsk3Aktif;
  String? genIsk3Adi;
  String? ozelKod1Tablodan;
  String? aciklamaAktif;
  String? miktar2Sor;
  String? miktarBirGelsin;
  String? varsayilanMuhrefkod;
  String? tutardanBirimFiata;
  String? cariIskSatiraUygula;
  String? miktarSifirOlamaz;
  String? fatAltm1Varmi;
  String? fatAltm2Varmi;
  String? fatAltm1Tanim;
  String? fatAltm2Tanim;
  String? kdvSifirlanacakOzelkod2;
  String? kosulSatirdaAktif;
  Map<String, dynamic> toJson() => _$TalTekParamToJson(this);
}

@HiveType(typeId: 48)
@JsonSerializable(createFactory: true)
final class YaziciList {
  YaziciList();

  factory YaziciList.fromJson(Map<dynamic, dynamic> json) => _$YaziciListFromJson(json as Map<String, dynamic>);

  @HiveField(0)
  String? yaziciAdi;
  @HiveField(1)
  String? yaziciTipi;
  @HiveField(2)
  String? aciklama;
  Map<String, dynamic> toJson() => _$YaziciListToJson(this);
}
