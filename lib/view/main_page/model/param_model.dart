import 'package:json_annotation/json_annotation.dart';

part 'param_model.g.dart';

@JsonSerializable(includeIfNull: false, createFactory: true, createToJson: true, fieldRename: FieldRename.screamingSnake)
class ParamModel {
  ParamModel();
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
  @JsonKey(name: "sabitSayfalamaOgeSayisi")
  int? sabitSayfalamaOgeSayisi;
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
  @JsonKey(name: "SatisOzelKod1Aktif")
  bool? satisOzelKod1Aktif;
  @JsonKey(name: "SatisOzelKod2Aktif")
  bool? satisOzelKod2Aktif;
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
  @JsonKey(name: "SatisSatirdaKDVSor")
  bool? satisSatirdaKdvSor;
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
  List<String?>? arrEFatSeri;
  @JsonKey(name: "ArrEArSeri")
  List<String?>? arrEArSeri;
  @JsonKey(name: "Seri_EArsiv")
  String? seriEArsiv;
  @JsonKey(name: "UretimEkAlanKullan")
  bool? uretimEkAlanKullan;
  @JsonKey(name: "OzelFaturaIadeMaliyetiZorunlu")
  bool? ozelFaturaIadeMaliyetiZorunlu;
  @JsonKey(name: "bankaKKartiKasayaIsle")
  bool? bankaKKartiKasayaIsle;
  @JsonKey(name: "KayitliBankaHesapTipleri")
  List? kayitliBankaHesapTipleri;
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
  factory ParamModel.fromJson(Map<String, dynamic> json) {
    return _$ParamModelFromJson(json);
  }
  Map<String, dynamic> toJson() {
    return _$ParamModelToJson(this);
  }

  @override
  String toString() {
    return toJson().toString();
  }
}

@JsonSerializable(includeIfNull: false, createFactory: true, createToJson: true, fieldRename: FieldRename.screamingSnake)
class CariAktiviteTipleri {
  CariAktiviteTipleri();
  @JsonKey(name: "AKTIVITE_TIPI")
  int? aktiviteTipi;
  @JsonKey(name: "AKTIVITE_ADI")
  String? aktiviteAdi;
  factory CariAktiviteTipleri.fromJson(Map<String, dynamic> json) {
    return _$CariAktiviteTipleriFromJson(json);
  }
  Map<String, dynamic> toJson() {
    return _$CariAktiviteTipleriToJson(this);
  }

  @override
  String toString() {
    return toJson().toString();
  }
}

@JsonSerializable(includeIfNull: false, createFactory: true, createToJson: true, fieldRename: FieldRename.screamingSnake)
class CekSenParam {
  CekSenParam();
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

  factory CekSenParam.fromJson(Map<String, dynamic> json) {
    return _$CekSenParamFromJson(json);
  }
  Map<String, dynamic> toJson() {
    return _$CekSenParamToJson(this);
  }

  @override
  String toString() {
    return toJson().toString();
  }
}

@JsonSerializable(includeIfNull: false, createFactory: true, createToJson: true, fieldRename: FieldRename.screamingSnake)
class DepoList {
  DepoList();
  @JsonKey(name: "DEPO_KODU")
  int? depoKodu;
  @JsonKey(name: "DEPO_TANIMI")
  String? depoTanimi;
  @JsonKey(name: "BAKIYE_TAKIBI")
  String? bakiyeTakibi;
  @JsonKey(name: "HUCRE_TAKIBI")
  String? hucreTakibi;
  @JsonKey(name: "SUBE_KODU")
  int? subeKodu;

  factory DepoList.fromJson(Map<String, dynamic> json) {
    return _$DepoListFromJson(json);
  }
  Map<String, dynamic> toJson() {
    return _$DepoListToJson(this);
  }

  @override
  String toString() {
    return toJson().toString();
  }
}

@JsonSerializable(includeIfNull: false, createFactory: true, createToJson: true, fieldRename: FieldRename.screamingSnake)
class DovizList {
  DovizList();
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

  factory DovizList.fromJson(Map<String, dynamic> json) {
    return _$DovizListFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$DovizListToJson(this);
  }

  @override
  String toString() {
    return toJson().toString();
  }
}

@JsonSerializable(
  includeIfNull: false,
  createFactory: true,
  createToJson: true,
  fieldRename: FieldRename.screamingSnake,
)
class KasaList {
  KasaList();

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

  factory KasaList.fromJson(Map<String, dynamic> json) {
    return _$KasaListFromJson(json);
  }
  Map<String, dynamic> toJson() {
    return _$KasaListToJson(this);
  }

  @override
  String toString() {
    return toJson().toString();
  }
}

@JsonSerializable(includeIfNull: false, createFactory: true, createToJson: true, fieldRename: FieldRename.screamingSnake)
class ListCariOdemeKodu {
  ListCariOdemeKodu();

  String? odemeKodu;
  String? aciklama;

  factory ListCariOdemeKodu.fromJson(Map<String, dynamic> json) {
    return _$ListCariOdemeKoduFromJson(json);
  }
  Map<String, dynamic> toJson() {
    return _$ListCariOdemeKoduToJson(this);
  }

  @override
  String toString() {
    return toJson().toString();
  }
}

@JsonSerializable(includeIfNull: false, createFactory: true, createToJson: true, fieldRename: FieldRename.screamingSnake)
class ListFatuEkMaliyet {
  ListFatuEkMaliyet();

  int? no;
  String? belgeTipi;
  String? adi;

  factory ListFatuEkMaliyet.fromJson(Map<String, dynamic> json) {
    return _$ListFatuEkMaliyetFromJson(json);
  }
  Map<String, dynamic> toJson() {
    return _$ListFatuEkMaliyetToJson(this);
  }

  @override
  String toString() {
    return toJson().toString();
  }
}

@JsonSerializable(includeIfNull: false, createFactory: true, createToJson: true, fieldRename: FieldRename.screamingSnake)
class ListIskTip {
  ListIskTip();

  int? iskontoTipi;
  String? aciklama;

  factory ListIskTip.fromJson(Map<String, dynamic> json) {
    return _$ListIskTipFromJson(json);
  }
  Map<String, dynamic> toJson() {
    return _$ListIskTipToJson(this);
  }

  @override
  String toString() {
    return toJson().toString();
  }
}

@JsonSerializable(includeIfNull: false, createFactory: true, createToJson: true, fieldRename: FieldRename.screamingSnake)
class ListOzelKodTum {
  ListOzelKodTum();

  int? kodTipi;
  String? belgeTipi;
  String? kod;
  String? aciklama;
  int? fiyatSirasi;

  factory ListOzelKodTum.fromJson(Map<String, dynamic> json) {
    return _$ListOzelKodTumFromJson(json);
  }
  Map<String, dynamic> toJson() {
    return _$ListOzelKodTumToJson(this);
  }

  @override
  String toString() {
    return toJson().toString();
  }
}

@JsonSerializable(includeIfNull: false, createFactory: true, createToJson: true)
class MapEkAlanlar {
  MapEkAlanlar();

  String? caption;
  String? fieldName;
  String? veriTipi;

  factory MapEkAlanlar.fromJson(Map<String, dynamic> json) {
    return _$MapEkAlanlarFromJson(json);
  }
  Map<String, dynamic> toJson() {
    return _$MapEkAlanlarToJson(this);
  }

  @override
  String toString() {
    return toJson().toString();
  }
}

@JsonSerializable(includeIfNull: false, createToJson: true, genericArgumentFactories: true)
class MapCariKullSahalar {
  MapCariKullSahalar();

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

  factory MapCariKullSahalar.fromJson(Map<String, dynamic> json) {
    return _$MapCariKullSahalarFromJson(json);
  }
  Map<String, dynamic> toJson() {
    return _$MapCariKullSahalarToJson(this);
  }

  @override
  String toString() {
    return toJson().toString();
  }
}

// TODO kontrol et
@JsonSerializable(includeIfNull: false, createFactory: true, createToJson: true, fieldRename: FieldRename.screamingSnake)
class MapKdvSifirBelgeTipiOzelKod2 {
  MapKdvSifirBelgeTipiOzelKod2();

  String? dc;
  String? ac;
  String? ms;
  String? si;
  String? sf;
  String? stek;

  factory MapKdvSifirBelgeTipiOzelKod2.fromJson(Map<String, dynamic> json) {
    return _$MapKdvSifirBelgeTipiOzelKod2FromJson(json);
  }
  Map<String, dynamic> toJson() {
    return _$MapKdvSifirBelgeTipiOzelKod2ToJson(this);
  }

  @override
  String toString() {
    return toJson().toString();
  }
}

@JsonSerializable(includeIfNull: false, createFactory: true, createToJson: true, fieldRename: FieldRename.screamingSnake)
class MapStokGrupAdlari {
  MapStokGrupAdlari();

  String? grupKodu;
  dynamic kod1;
  dynamic kod2;
  dynamic kod3;
  dynamic kod4;
  dynamic kod5;

  factory MapStokGrupAdlari.fromJson(Map<String, dynamic> json) {
    return _$MapStokGrupAdlariFromJson(json);
  }
  Map<String, dynamic> toJson() {
    return _$MapStokGrupAdlariToJson(this);
  }

  @override
  String toString() {
    return toJson().toString();
  }
}

@JsonSerializable(includeIfNull: false, createFactory: true, createToJson: true, fieldRename: FieldRename.screamingSnake)
class MapStokKullSahalar {
  MapStokKullSahalar();

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

  factory MapStokKullSahalar.fromJson(Map<String, dynamic> json) {
    return _$MapStokKullSahalarFromJson(json);
  }
  Map<String, dynamic> toJson() {
    return _$MapStokKullSahalarToJson(this);
  }

  @override
  String toString() {
    return toJson().toString();
  }
}

@JsonSerializable(includeIfNull: false, createFactory: true, createToJson: true, fieldRename: FieldRename.screamingSnake)
class MustahsilParam {
  MustahsilParam();

  double? stopajOrani;
  double? fonOrani;
  double? borsaOrani;
  int? bagkurOrani;
  String? bagkurYb;
  double? meraOrani;
  String? borsaUcretDuzenlemesi;

  factory MustahsilParam.fromJson(Map<String, dynamic> json) {
    return _$MustahsilParamFromJson(json);
  }
  Map<String, dynamic> toJson() {
    return _$MustahsilParamToJson(this);
  }

  @override
  String toString() {
    return toJson().toString();
  }
}

@JsonSerializable(includeIfNull: false, createFactory: true, createToJson: true, fieldRename: FieldRename.screamingSnake)
class NetFectDizaynList {
  NetFectDizaynList();

  @JsonKey(name: "ID")
  int? id;
  @JsonKey(name: "DIZAYN_YERI")
  String? dizaynYeri;
  @JsonKey(name: "DIZAYN_YOLU")
  String? dizaynYolu;
  @JsonKey(name: "DIZAYN_ADI")
  String? dizaynAdi;
  @JsonKey(name: "OZEL_KOD")
  String? ozelKod;
  @JsonKey(name: "KOPYA_SAYISI")
  int? kopyaSayisi;
  @JsonKey(name: "SABLON_VAR")
  String? sablonVar;
  @JsonKey(name: "AKTIF")
  String? aktif;
  @JsonKey(name: "DOSYA_ADI")
  String? dosyaAdi;
  @JsonKey(name: "PARAMETRELER")
  String? parametreler;
  @JsonKey(name: "VARSAYILAN_MI")
  bool? varsayilanMi;

  factory NetFectDizaynList.fromJson(Map<String, dynamic> json) {
    return _$NetFectDizaynListFromJson(json);
  }
  Map<String, dynamic> toJson() {
    return _$NetFectDizaynListToJson(this);
  }

  @override
  String toString() {
    return toJson().toString();
  }
}

@JsonSerializable(includeIfNull: false, createFactory: true, createToJson: true, fieldRename: FieldRename.screamingSnake)
class NetsisOndalikResponseModel {
  NetsisOndalikResponseModel();

  String? modul;
  int? miktar;
  int? fiyat;
  int? tutar;
  int? kur;
  int? doviz;
  int? dovizFiyati;
  int? oran;

  factory NetsisOndalikResponseModel.fromJson(Map<String, dynamic> json) {
    return _$NetsisOndalikResponseModelFromJson(json);
  }
  Map<String, dynamic> toJson() {
    return _$NetsisOndalikResponseModelToJson(this);
  }

  @override
  String toString() {
    return toJson().toString();
  }
}

@JsonSerializable(includeIfNull: false, createFactory: true, createToJson: true, fieldRename: FieldRename.screamingSnake)
class PlasiyerList {
  PlasiyerList();

  String? plasiyerKodu;
  String? plasiyerAciklama;

  factory PlasiyerList.fromJson(Map<String, dynamic> json) {
    return _$PlasiyerListFromJson(json);
  }
  Map<String, dynamic> toJson() {
    return _$PlasiyerListToJson(this);
  }

  @override
  String toString() {
    return toJson().toString();
  }
}

@JsonSerializable(includeIfNull: false, createFactory: true, createToJson: true, fieldRename: FieldRename.screamingSnake)
class SatirAcikBaslikList {
  SatirAcikBaslikList();

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

  factory SatirAcikBaslikList.fromJson(Map<String, dynamic> json) {
    return _$SatirAcikBaslikListFromJson(json);
  }
  Map<String, dynamic> toJson() {
    return _$SatirAcikBaslikListToJson(this);
  }

  @override
  String toString() {
    return toJson().toString();
  }
}

@JsonSerializable(includeIfNull: false, createFactory: true, createToJson: true)
class StokDetayliAramaAlanlar {
  StokDetayliAramaAlanlar();

  @JsonKey(name: "SearchField")
  String? searchField;
  @JsonKey(name: "Name")
  String? name;

  factory StokDetayliAramaAlanlar.fromJson(Map<String, dynamic> json) {
    return _$StokDetayliAramaAlanlarFromJson(json);
  }
  Map<String, dynamic> toJson() {
    return _$StokDetayliAramaAlanlarToJson(this);
  }

  @override
  String toString() {
    return toJson().toString();
  }
}

@JsonSerializable(includeIfNull: false, createFactory: true, createToJson: true, fieldRename: FieldRename.screamingSnake)
class SubeList {
  SubeList();

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

  factory SubeList.fromJson(Map<String, dynamic> json) {
    return _$SubeListFromJson(json);
  }
  Map<String, dynamic> toJson() {
    return _$SubeListToJson(this);
  }

  @override
  String toString() {
    return toJson().toString();
  }
}

@JsonSerializable(includeIfNull: false, createFactory: true, createToJson: true, fieldRename: FieldRename.screamingSnake)
class TalTekParam {
  TalTekParam();
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

  factory TalTekParam.fromJson(Map<String, dynamic> json) {
    return _$TalTekParamFromJson(json);
  }
  Map<String, dynamic> toJson() {
    return _$TalTekParamToJson(this);
  }

  @override
  String toString() {
    return toJson().toString();
  }
}

@JsonSerializable(includeIfNull: false, createFactory: true, createToJson: true, fieldRename: FieldRename.screamingSnake)
class YaziciList {
  YaziciList();

  String? yaziciAdi;
  String? yaziciTipi;
  String? aciklama;

  factory YaziciList.fromJson(Map<String, dynamic> json) {
    return _$YaziciListFromJson(json);
  }
  Map<String, dynamic> toJson() {
    return _$YaziciListToJson(this);
  }

  @override
  String toString() {
    return toJson().toString();
  }
}
