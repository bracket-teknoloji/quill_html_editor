// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'param_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class NetFectDizaynListAdapter extends TypeAdapter<NetFectDizaynList> {
  @override
  final int typeId = 47;

  @override
  NetFectDizaynList read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return NetFectDizaynList()
      ..id = fields[0] as int?
      ..dizaynYeri = fields[1] as String?
      ..dizaynYolu = fields[2] as String?
      ..dizaynAdi = fields[3] as String?
      ..ozelKod = fields[4] as String?
      ..kopyaSayisi = fields[5] as int?
      ..sablonVar = fields[6] as String?
      ..aktif = fields[7] as String?
      ..dosyaAdi = fields[8] as String?
      ..parametreler = fields[9] as String?
      ..varsayilanMi = fields[10] as bool?
      ..detayKod = fields[11] as String?;
  }

  @override
  void write(BinaryWriter writer, NetFectDizaynList obj) {
    writer
      ..writeByte(12)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.dizaynYeri)
      ..writeByte(2)
      ..write(obj.dizaynYolu)
      ..writeByte(3)
      ..write(obj.dizaynAdi)
      ..writeByte(4)
      ..write(obj.ozelKod)
      ..writeByte(5)
      ..write(obj.kopyaSayisi)
      ..writeByte(6)
      ..write(obj.sablonVar)
      ..writeByte(7)
      ..write(obj.aktif)
      ..writeByte(8)
      ..write(obj.dosyaAdi)
      ..writeByte(9)
      ..write(obj.parametreler)
      ..writeByte(10)
      ..write(obj.varsayilanMi)
      ..writeByte(11)
      ..write(obj.detayKod);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is NetFectDizaynListAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class YaziciListAdapter extends TypeAdapter<YaziciList> {
  @override
  final int typeId = 48;

  @override
  YaziciList read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return YaziciList()
      ..yaziciAdi = fields[0] as String?
      ..yaziciTipi = fields[1] as String?
      ..aciklama = fields[2] as String?;
  }

  @override
  void write(BinaryWriter writer, YaziciList obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.yaziciAdi)
      ..writeByte(1)
      ..write(obj.yaziciTipi)
      ..writeByte(2)
      ..write(obj.aciklama);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is YaziciListAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ParamModel _$ParamModelFromJson(Map<String, dynamic> json) => ParamModel()
  ..paramYuklendi = json['ParamYuklendi'] as bool?
  ..kullanici = json['KULLANICI'] as String?
  ..sirket = json['SIRKET'] as String?
  ..isletmeKodu = json['ISLETME_KODU'] as int?
  ..mapCariKullSahalar = json['MapCariKullSahalar'] == null
      ? null
      : MapCariKullSahalar.fromJson(
          json['MapCariKullSahalar'] as Map<String, dynamic>)
  ..mapCariEkAlanlar = (json['MapCariEkAlanlar'] as List<dynamic>?)
      ?.map((e) => MapEkAlanlar.fromJson(e as Map<String, dynamic>))
      .toList()
  ..sabitSayfalamaOgeSayisi = json['sabitSayfalamaOgeSayisi'] as int? ?? 25
  ..netsisOndalikResponseModel = (json['_NetsisOndalikResponseModel']
          as List<dynamic>?)
      ?.map(
          (e) => NetsisOndalikResponseModel.fromJson(e as Map<String, dynamic>))
      .toList()
  ..depoList = (json['DepoList'] as List<dynamic>?)
      ?.map((e) => DepoList.fromJson(e as Map<String, dynamic>))
      .toList()
  ..dovizList = (json['DovizList'] as List<dynamic>?)
      ?.map((e) => DovizList.fromJson(e as Map<String, dynamic>))
      .toList()
  ..satirAcikBaslikList = (json['SatirAcikBaslikList'] as List<dynamic>?)
      ?.map((e) => SatirAcikBaslikList.fromJson(e as Map<String, dynamic>))
      .toList()
  ..kasaList = (json['KasaList'] as List<dynamic>?)
      ?.map((e) => KasaList.fromJson(e as Map<String, dynamic>))
      .toList()
  ..plasiyerList = (json['PlasiyerList'] as List<dynamic>?)
      ?.map((e) => PlasiyerList.fromJson(e as Map<String, dynamic>))
      .toList()
  ..plasiyerListTumu = (json['PlasiyerListTumu'] as List<dynamic>?)
      ?.map((e) => PlasiyerList.fromJson(e as Map<String, dynamic>))
      .toList()
  ..subeList = (json['SubeList'] as List<dynamic>?)
      ?.map((e) => SubeList.fromJson(e as Map<String, dynamic>))
      .toList()
  ..talTekParam = (json['TalTekParam'] as List<dynamic>?)
      ?.map((e) => TalTekParam.fromJson(e as Map<String, dynamic>))
      .toList()
  ..cekSenParam = (json['CekSenParam'] as List<dynamic>?)
      ?.map((e) => CekSenParam.fromJson(e as Map<String, dynamic>))
      .toList()
  ..listOzelKodTum = (json['ListOzelKodTum'] as List<dynamic>?)
      ?.map((e) => ListOzelKodTum.fromJson(e as Map<String, dynamic>))
      .toList()
  ..listIskTip = (json['ListIskTip'] as List<dynamic>?)
      ?.map((e) => ListIskTip.fromJson(e as Map<String, dynamic>))
      .toList()
  ..listCariOdemeKodu = (json['ListCariOdemeKodu'] as List<dynamic>?)
      ?.map((e) => ListCariOdemeKodu.fromJson(e as Map<String, dynamic>))
      .toList()
  ..yaziciList = (json['YaziciList'] as List<dynamic>?)
      ?.map((e) => YaziciList.fromJson(e as Map<String, dynamic>))
      .toList()
  ..netFectDizaynList = (json['NetFectDizaynList'] as List<dynamic>?)
      ?.map((e) => NetFectDizaynList.fromJson(e as Map<String, dynamic>))
      .toList()
  ..mapStokGrupAdlari = json['MapStokGrupAdlari'] == null
      ? null
      : MapStokGrupAdlari.fromJson(
          json['MapStokGrupAdlari'] as Map<String, dynamic>)
  ..mustahsilParam = json['MustahsilParam'] == null
      ? null
      : MustahsilParam.fromJson(json['MustahsilParam'] as Map<String, dynamic>)
  ..listFatuEkMaliyet = (json['ListFatuEkMaliyet'] as List<dynamic>?)
      ?.map((e) => ListFatuEkMaliyet.fromJson(e as Map<String, dynamic>))
      .toList()
  ..mapKdvSifirBelgeTipiOzelKod2 = json['MapKdvSifirBelgeTipiOzelKod2'] == null
      ? null
      : MapKdvSifirBelgeTipiOzelKod2.fromJson(
          json['MapKdvSifirBelgeTipiOzelKod2'] as Map<String, dynamic>)
  ..lokalDepoUygulamasiAcik = json['LokalDepoUygulamasiAcik'] as bool?
  ..esnekYapilandir = json['EsnekYapilandir'] as bool?
  ..ozelFiyatSistemi = json['OzelFiyatSistemi'] as bool?
  ..sadeceOzelFiyatSistemi = json['SadeceOzelFiyatSistemi'] as String?
  ..otvliStoklarVar = json['OtvliStoklarVar'] as bool?
  ..mapStokKullSahalar = json['MapStokKullSahalar'] == null
      ? null
      : MapStokKullSahalar.fromJson(
          json['MapStokKullSahalar'] as Map<String, dynamic>)
  ..mapStokEkAlanlar = (json['MapStokEkAlanlar'] as List<dynamic>?)
      ?.map((e) => MapEkAlanlar.fromJson(e as Map<String, dynamic>))
      .toList()
  ..karmaKoliUyg = json['KarmaKoliUyg'] as String?
  ..alisEkAciklamalarAktif = json['AlisEkAciklamalarAktif'] as bool?
  ..alisEkAciklamaTanimi1 = json['AlisEkAciklamaTanimi1'] as String?
  ..alisEkAciklamaTanimi2 = json['AlisEkAciklamaTanimi2'] as String?
  ..alisEkAciklamaTanimi3 = json['AlisEkAciklamaTanimi3'] as String?
  ..alisEkAciklamaTanimi4 = json['AlisEkAciklamaTanimi4'] as String?
  ..alisEkAciklamaTanimi5 = json['AlisEkAciklamaTanimi5'] as String?
  ..alisEkAciklamaTanimi6 = json['AlisEkAciklamaTanimi6'] as String?
  ..alisEkAciklamaTanimi7 = json['AlisEkAciklamaTanimi7'] as String?
  ..alisEkAciklamaTanimi8 = json['AlisEkAciklamaTanimi8'] as String?
  ..alisEkAciklamaTanimi9 = json['AlisEkAciklamaTanimi9'] as String?
  ..alisEkAciklamaTanimi10 = json['AlisEkAciklamaTanimi10'] as String?
  ..alisEkAciklamaTanimi11 = json['AlisEkAciklamaTanimi11'] as String?
  ..alisEkAciklamaTanimi12 = json['AlisEkAciklamaTanimi12'] as String?
  ..alisEkAciklamaTanimi13 = json['AlisEkAciklamaTanimi13'] as String?
  ..alisEkAciklamaTanimi14 = json['AlisEkAciklamaTanimi14'] as String?
  ..alisEkAciklamaTanimi15 = json['AlisEkAciklamaTanimi15'] as String?
  ..alisEkAciklamaTanimi16 = json['AlisEkAciklamaTanimi16'] as String?
  ..alisOzelKod1Tablodan = json['AlisOzelKod1Tablodan'] as bool?
  ..alisKosulAktif = json['AlisKosulAktif'] as bool?
  ..alisFarkliTeslimCariAktif = json['AlisFarkliTeslimCariAktif'] as bool?
  ..alisMalFazMiktarIskontoAcik = json['AlisMalFazMiktarIskontoAcik'] as bool?
  ..alisSatirKademeliIskontoAcik = json['AlisSatirKademeliIskontoAcik'] as bool?
  ..alisSatirKademeliIskontoSayisi =
      json['AlisSatirKademeliIskontoSayisi'] as int?
  ..alisGenIsk1Aktif = json['AlisGenIsk1Aktif'] as bool?
  ..alisGenIsk2Aktif = json['AlisGenIsk2Aktif'] as bool?
  ..alisGenIsk3Aktif = json['AlisGenIsk3Aktif'] as bool?
  ..alisTopluDepoAktif = json['AlisTopluDepoAktif'] as bool?
  ..alisStokDepoKarttanGelsin = json['AlisStokDepoKarttanGelsin'] as bool?
  ..alisGenellikleKdvHaric = json['AlisGenellikleKDVHaric'] as bool?
  ..alisFarkliOlcuBirimleriKullan =
      json['AlisFarkliOlcuBirimleriKullan'] as bool?
  ..alisDovizAktif = json['AlisDovizAktif'] as bool?
  ..alisSatirdaKdvSor = json['AlisSatirdaKDVSor'] as bool?
  ..alisSatirdaAciklamalarAktif = json['AlisSatirdaAciklamalarAktif'] as bool?
  ..alisSatirdaEkAlan2Aktif = json['AlisSatirdaEkAlan2Aktif'] as bool?
  ..alisEkMaliyet2Aktif = json['AlisEkMaliyet2Aktif'] as bool?
  ..alisEkMaliyet2Adi = json['AlisEkMaliyet2Adi'] as String?
  ..alisTevkifatPay = json['AlisTevkifatPay'] as int?
  ..alisTevkifatPayda = json['AlisTevkifatPayda'] as int?
  ..alisFaturaFiyatSifirGecilsin = json['AlisFaturaFiyatSifirGecilsin'] as bool?
  ..alisFazlaTeslimat = json['AlisFazlaTeslimat'] as bool?
  ..alisDovizTakipHangiDeger = json['AlisDovizTakipHangiDeger'] as int?
  ..alisHizmetAktif = json['AlisHizmetAktif'] as bool?
  ..alisHizmetDepoKodu = json['AlisHizmetDepoKodu'] as int?
  ..alisMiktar2Sor = json['AlisMiktar2Sor'] as bool?
  ..alisSatirdaTeslimTarihiSor = json['AlisSatirdaTeslimTarihiSor'] as bool?
  ..alisFisSeriTakibiVar = json['AlisFisSeriTakibiVar'] as bool?
  ..alisTutardanFiyataGecilsin = json['AlisTutardanFiyataGecilsin'] as bool?
  ..alisCariIskSatiraUygula = json['AlisCariIskSatiraUygula'] as bool?
  ..seriUygulamasiAcik = json['SeriUygulamasiAcik'] as bool?
  ..sirketDovizUygulamasiAcik = json['SirketDovizUygulamasiAcik'] as bool?
  ..sirketDovizUygulamasiDovizKodu =
      json['SirketDovizUygulamasiDovizKodu'] as int?
  ..plasiyerUygulamasi = json['PlasiyerUygulamasi'] as bool?
  ..paraBirimi = json['ParaBirimi'] as String?
  ..bankaEntegre = json['BankaEntegre'] as bool?
  ..bagliCariVar = json['BagliCariVar'] as bool?
  ..projeUygulamasiAcik = json['ProjeUygulamasiAcik'] as bool?
  ..satisOzelKod1Aktif = json['SatisOzelKod1Aktif'] as bool?
  ..satisOzelKod2Aktif = json['SatisOzelKod2Aktif'] as bool?
  ..satisEkAciklamalarAktif = json['SatisEkAciklamalarAktif'] as bool?
  ..satisEkAciklamaTanimi1 = json['SatisEkAciklamaTanimi1'] as String?
  ..satisEkAciklamaTanimi2 = json['SatisEkAciklamaTanimi2'] as String?
  ..satisEkAciklamaTanimi3 = json['SatisEkAciklamaTanimi3'] as String?
  ..satisEkAciklamaTanimi4 = json['SatisEkAciklamaTanimi4'] as String?
  ..satisEkAciklamaTanimi5 = json['SatisEkAciklamaTanimi5'] as String?
  ..satisEkAciklamaTanimi6 = json['SatisEkAciklamaTanimi6'] as String?
  ..satisEkAciklamaTanimi7 = json['SatisEkAciklamaTanimi7'] as String?
  ..satisEkAciklamaTanimi8 = json['SatisEkAciklamaTanimi8'] as String?
  ..satisEkAciklamaTanimi9 = json['SatisEkAciklamaTanimi9'] as String?
  ..satisEkAciklamaTanimi10 = json['SatisEkAciklamaTanimi10'] as String?
  ..satisEkAciklamaTanimi11 = json['SatisEkAciklamaTanimi11'] as String?
  ..satisEkAciklamaTanimi12 = json['SatisEkAciklamaTanimi12'] as String?
  ..satisEkAciklamaTanimi13 = json['SatisEkAciklamaTanimi13'] as String?
  ..satisEkAciklamaTanimi14 = json['SatisEkAciklamaTanimi14'] as String?
  ..satisEkAciklamaTanimi15 = json['SatisEkAciklamaTanimi15'] as String?
  ..satisEkAciklamaTanimi16 = json['SatisEkAciklamaTanimi16'] as String?
  ..satisSatirIsk1YuzdeSor = json['SatisSatirIsk1YuzdeSor'] as bool?
  ..satisKosulAktif = json['SatisKosulAktif'] as bool?
  ..satisKosulSatirdaSor = json['SatisKosulSatirdaSor'] as bool?
  ..satisFarkliTeslimCariAktif = json['SatisFarkliTeslimCariAktif'] as bool?
  ..satisMalFazMiktarIskontoAcik = json['SatisMalFazMiktarIskontoAcik'] as bool?
  ..satisSatirKademeliIskontoAcik =
      json['SatisSatirKademeliIskontoAcik'] as bool?
  ..satisSatirKademeliIskontoSayisi =
      json['SatisSatirKademeliIskontoSayisi'] as int?
  ..satisSatirdaKdvSor = json['SatisSatirdaKDVSor'] as bool?
  ..satisGenIsk1Aktif = json['SatisGenIsk1Aktif'] as bool?
  ..satisGenIsk2Aktif = json['SatisGenIsk2Aktif'] as bool?
  ..satisGenIsk3Aktif = json['SatisGenIsk3Aktif'] as bool?
  ..satisTopluDepoAktif = json['SatisTopluDepoAktif'] as bool?
  ..satisStokDepoKarttanGelsin = json['SatisStokDepoKarttanGelsin'] as bool?
  ..satisGenellikleKdvHaric = json['SatisGenellikleKDVHaric'] as bool?
  ..satisFarkliOlcuBirimleriKullan =
      json['SatisFarkliOlcuBirimleriKullan'] as bool?
  ..satisCariRiskTakibi = json['SatisCariRiskTakibi'] as String?
  ..satisDovizAktif = json['SatisDovizAktif'] as bool?
  ..satisSatirdaAciklamalarAktif = json['SatisSatirdaAciklamalarAktif'] as bool?
  ..satisSatirdaEkAlan2Aktif = json['SatisSatirdaEkAlan2Aktif'] as bool?
  ..satisEkMaliyet2Aktif = json['SatisEkMaliyet2Aktif'] as bool?
  ..satisEkMaliyet2Adi = json['SatisEkMaliyet2Adi'] as String?
  ..satisTevkifatPay = json['SatisTevkifatPay'] as int?
  ..satisTevkifatPayda = json['SatisTevkifatPayda'] as int?
  ..satisFaturaFiyatSifirGecilsin =
      json['SatisFaturaFiyatSifirGecilsin'] as bool?
  ..satisFazlaTeslimat = json['SatisFazlaTeslimat'] as bool?
  ..satisDovizTakipHangiDeger = json['SatisDovizTakipHangiDeger'] as int?
  ..satisHizmetAktif = json['SatisHizmetAktif'] as bool?
  ..satisHizmetDepoKodu = json['SatisHizmetDepoKodu'] as int?
  ..satisMiktar2Sor = json['SatisMiktar2Sor'] as bool?
  ..satisSubeDatOnaylansin = json['SatisSubeDATOnaylansin'] as bool?
  ..satisSatirdaTeslimTarihiSor = json['SatisSatirdaTeslimTarihiSor'] as bool?
  ..satisSatirdaIsEmriSorulsun = json['SatisSatirdaIsEmriSorulsun'] as bool?
  ..satisFisSeriTakibiVar = json['SatisFisSeriTakibiVar'] as bool?
  ..satisIrsCariHesaba = json['SatisIrsCariHesaba'] as bool?
  ..satisEkAlan1Aktif = json['SatisEkAlan1Aktif'] as bool?
  ..satisDatSiparisTakibi = json['SatisDATSiparisTakibi'] as String?
  ..satisIrsFatuSipVadeDegissin = json['SatisIrsFatuSipVadeDegissin'] as String?
  ..konsinyeUygulamasi = json['KonsinyeUygulamasi'] as bool?
  ..mSenetDovizAktif = json['MSenetDovizAktif'] as bool?
  ..mCekDovizAktif = json['MCekDovizAktif'] as bool?
  ..mCekAciklamaAktif = json['MCekAciklamaAktif'] as bool?
  ..seriGirislerdeOtomatik = json['SeriGirislerdeOtomatik'] as bool?
  ..serideYilOlsun = json['SerideYilOlsun'] as bool?
  ..serideAyOlsun = json['SerideAyOlsun'] as bool?
  ..serideGunOlsun = json['SerideGunOlsun'] as bool?
  ..seriUzunlugu = json['SeriUzunlugu'] as int?
  ..seriEkAlanList = (json['SeriEkAlanList'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList()
  ..eFaturaAktif = json['EFaturaAktif'] as bool?
  ..seriEFatura = json['Seri_EFatura'] as String?
  ..eFaturaSenaryoDegistir = json['EFaturaSenaryoDegistir'] as bool?
  ..eIrsaliyeAktif = json['EIrsaliyeAktif'] as bool?
  ..seriEIrsaliye = json['SeriEIrsaliye'] as String?
  ..arrEIrsSeri =
      (json['ArrEIrsSeri'] as List<dynamic>?)?.map((e) => e as String).toList()
  ..arrEFatSeri =
      (json['ArrEFatSeri'] as List<dynamic>?)?.map((e) => e as String?).toList()
  ..arrEArSeri =
      (json['ArrEArSeri'] as List<dynamic>?)?.map((e) => e as String?).toList()
  ..seriEArsiv = json['Seri_EArsiv'] as String?
  ..uretimEkAlanKullan = json['UretimEkAlanKullan'] as bool?
  ..ozelFaturaIadeMaliyetiZorunlu =
      json['OzelFaturaIadeMaliyetiZorunlu'] as bool?
  ..bankaKKartiKasayaIsle = json['bankaKKartiKasayaIsle'] as bool?
  ..kayitliBankaHesapTipleri =
      json['KayitliBankaHesapTipleri'] as List<dynamic>?
  ..kkNoZorunluDegil = json['KKNoZorunluDegil'] as bool?
  ..fifoLifoYontem = json['FifoLifoYontem'] as String?
  ..cariAktiviteUygulamasi = json['CariAktiviteUygulamasi'] as String?
  ..cariAktiviteTipleri = (json['CariAktiviteTipleri'] as List<dynamic>?)
      ?.map((e) => CariAktiviteTipleri.fromJson(e as Map<String, dynamic>))
      .toList()
  ..cariAktiviteEkAlanlar = (json['CariAktiviteEkAlanlar'] as List<dynamic>?)
      ?.map((e) => e as int)
      .toList()
  ..satisCariDovizTipiniKullan = json['SatisCariDovizTipiniKullan'] as bool?
  ..alisCariDovizTipiniKullan = json['AlisCariDovizTipiniKullan'] as bool?
  ..fatuKontrolAciklamasiAktif =
      (json['Fatu_KontrolAciklamasiAktif'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList()
  ..satisFiyatGrubuSorulacakAlan =
      json['SatisFiyatGrubuSorulacakAlan'] as String?
  ..siparisFarkliSubeUyg = json['Siparis_FarkliSubeUyg'] as String?
  ..satisIskEkSahadanGelsin = json['SatisIskEkSahadanGelsin'] as String?
  ..satisIsk1Saha = json['SatisIsk1Saha'] as String?
  ..satisIsk1Kullanim = json['SatisIsk1Kullanim'] as String?
  ..uretimMalTopHangiHucrede = json['Uretim_MalTop_HangiHucrede'] as bool?
  ..uretimMalTopFazlaTeslimYapilabilir =
      json['Uretim_MalTop_FazlaTeslimYapilabilir'] as bool?
  ..uretimUskSeriGirilsin = json['Uretim_USK_SeriGirilsin'] as bool?
  ..finansBankaIslemModulu = json['Finans_BankaIslemModulu'] as String?
  ..finansBankaTcmbBankaKodu = json['Finans_BankaTcmbBankaKodu'] as String?
  ..finansBankaTcmbSubeKodu = json['Finans_BankaTcmbSubeKodu'] as String?
  ..finansCekSenOzelOrtalamaVadeGunuHesapla =
      (json['Finans_CekSenOzelOrtalamaVadeGunuHesapla'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList()
  ..stokYapRehberTipi = json['Stok_Yap_RehberTipi'] as String?
  ..stokKanbanBarkodEslemeUyg = json['Stok_KanbanBarkodEslemeUyg'] as String?
  ..stokSeriParcalamaUyg = json['Stok_SeriParcalamaUyg'] as String?
  ..stokDetayliAramaAlanlar = (json['Stok_DetayliAramaAlanlar']
          as List<dynamic>?)
      ?.map((e) => StokDetayliAramaAlanlar.fromJson(e as Map<String, dynamic>))
      .toList()
  ..genelKonumTakibiYapilsin = json['Genel_KonumTakibiYapilsin'] as String?
  ..genelKonumTakibiDakika = json['Genel_KonumTakibiDakika'] as int?
  ..genelKonumTakibiMetre = json['Genel_KonumTakibiMetre'] as int?
  ..uetdsEsyaAktif = json['UetdsEsyaAktif'] as bool?
  ..satistaSiparisKullan = json['SatistaSiparisKullan'] as bool?
  ..alistaSiparisKullan = json['AlistaSiparisKullan'] as bool?
  ..sipOtoEslestir = json['SipOtoEslestir'] as bool?
  ..sevkEmriTerminalFatura = json['SevkEmriTerminalFatura'] as bool?
  ..sevkEmriTerminalIrsaliye = json['SevkEmriTerminalIrsaliye'] as bool?
  ..sevkEmriTerminalTransfer = json['SevkEmriTerminalTransfer'] as bool?
  ..sevkEmriHucreKontrol = json['SevkEmriHucreKontrol'] as bool?
  ..sevkEmriMalTopGorunecekAlanlar =
      (json['SevkEmriMalTopGorunecekAlanlar'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList()
  ..seriSevkIrsaliye = json['Seri_SevkIrsaliye'] as String?
  ..kontrolluBelgeAktarimAktif = json['KontrolluBelgeAktarimAktif'] as bool?
  ..kontrolluBelgeAktarimBelgeNoGoster =
      json['KontrolluBelgeAktarimBelgeNoGoster'] as List<dynamic>?
  ..eMustahsilAktif = json['EMustahsilAktif'] as bool?
  ..muhasebeEntegre = json['MuhasebeEntegre'] as bool?
  ..muhFislerdeRefKodSorulsun = json['MuhFislerdeRefKodSorulsun'] as bool?
  ..muhFislerdeRefKodSorulsunAktif =
      json['MuhFislerdeRefKodSorulsun_Aktif'] as bool?
  ..muhFislerdeRefKodSorulsunPasif =
      json['MuhFislerdeRefKodSorulsun_Pasif'] as bool?
  ..muhFislerdeRefKodSorulsunGelir =
      json['MuhFislerdeRefKodSorulsun_Gelir'] as bool?
  ..muhFislerdeRefKodSorulsunGider =
      json['MuhFislerdeRefKodSorulsun_Gider'] as bool?
  ..muhFislerdeRefKodSorulsunNazim =
      json['MuhFislerdeRefKodSorulsun_Nazim'] as bool?
  ..alisOzelKod2Aktif = json['AlisOzelKod2Aktif'] as bool?
  ..alisOzelKod2Tablodan = json['AlisOzelKod2Tablodan'] as bool?
  ..alisMiktar1Gelsin = json['AlisMiktar1Gelsin'] as bool?
  ..satisOzelKod2Tablodan = json['SatisOzelKod2Tablodan'] as bool?
  ..seriCikislardaOtomatik = json['SeriCikislardaOtomatik'] as bool?
  ..serideSaatOlsun = json['SerideSaatOlsun'] as bool?
  ..seriEIrsaliyeYanit = json['SeriEIrsaliyeYanit'] as String?;

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
  val['sabitSayfalamaOgeSayisi'] = instance.sabitSayfalamaOgeSayisi;
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
  writeNotNull('SatisOzelKod1Aktif', instance.satisOzelKod1Aktif);
  writeNotNull('SatisOzelKod2Aktif', instance.satisOzelKod2Aktif);
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
  writeNotNull('SatisSatirdaKDVSor', instance.satisSatirdaKdvSor);
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
  writeNotNull('MuhasebeEntegre', instance.muhasebeEntegre);
  writeNotNull('MuhFislerdeRefKodSorulsun', instance.muhFislerdeRefKodSorulsun);
  writeNotNull('MuhFislerdeRefKodSorulsun_Aktif',
      instance.muhFislerdeRefKodSorulsunAktif);
  writeNotNull('MuhFislerdeRefKodSorulsun_Pasif',
      instance.muhFislerdeRefKodSorulsunPasif);
  writeNotNull('MuhFislerdeRefKodSorulsun_Gelir',
      instance.muhFislerdeRefKodSorulsunGelir);
  writeNotNull('MuhFislerdeRefKodSorulsun_Gider',
      instance.muhFislerdeRefKodSorulsunGider);
  writeNotNull('MuhFislerdeRefKodSorulsun_Nazim',
      instance.muhFislerdeRefKodSorulsunNazim);
  writeNotNull('AlisOzelKod2Aktif', instance.alisOzelKod2Aktif);
  writeNotNull('AlisOzelKod2Tablodan', instance.alisOzelKod2Tablodan);
  writeNotNull('AlisMiktar1Gelsin', instance.alisMiktar1Gelsin);
  writeNotNull('SatisOzelKod2Tablodan', instance.satisOzelKod2Tablodan);
  writeNotNull('SeriCikislardaOtomatik', instance.seriCikislardaOtomatik);
  writeNotNull('SerideSaatOlsun', instance.serideSaatOlsun);
  writeNotNull('SeriEIrsaliyeYanit', instance.seriEIrsaliyeYanit);
  return val;
}

CariAktiviteTipleri _$CariAktiviteTipleriFromJson(Map<String, dynamic> json) =>
    CariAktiviteTipleri()
      ..aktiviteTipi = json['AKTIVITE_TIPI'] as int?
      ..aktiviteAdi = json['AKTIVITE_ADI'] as String?;

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

CekSenParam _$CekSenParamFromJson(Map<String, dynamic> json) => CekSenParam()
  ..belgeTipi = json['BELGE_TIPI'] as String?
  ..dovizAktif = json['DOVIZ_AKTIF'] as String?
  ..verilenKoduIstensin = json['VERILEN_KODU_ISTENSIN'] as String?
  ..ekAciklamaKullan = json['EK_ACIKLAMA_KULLAN'] as String?
  ..cikistaBankaKodu = json['CIKISTA_BANKA_KODU'] as String?;

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

DepoList _$DepoListFromJson(Map<String, dynamic> json) => DepoList()
  ..depoKodu = json['DEPO_KODU'] as int?
  ..depoTanimi = json['DEPO_TANIMI'] as String?
  ..bakiyeTakibi = json['BAKIYE_TAKIBI'] as String?
  ..hucreTakibi = json['HUCRE_TAKIBI'] as String?
  ..subeKodu = json['SUBE_KODU'] as int?;

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

DovizList _$DovizListFromJson(Map<String, dynamic> json) => DovizList()
  ..dovizKodu = json['DOVIZ_KODU'] as int?
  ..dovizTipi = json['DOVIZ_TIPI'] as int?
  ..isim = json['ISIM'] as String?
  ..alis = (json['ALIS'] as num?)?.toDouble()
  ..satis = (json['SATIS'] as num?)?.toDouble()
  ..efAlis = (json['EF_ALIS'] as num?)?.toDouble()
  ..efSatis = (json['EF_SATIS'] as num?)?.toDouble();

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

KasaList _$KasaListFromJson(Map<String, dynamic> json) => KasaList()
  ..kasaKodu = json['KASA_KODU'] as String?
  ..kasaTanimi = json['KASA_TANIMI'] as String?
  ..subeKodu = json['SUBE_KODU'] as int?
  ..dovizli = json['DOVIZLI'] as String?
  ..dovizTipi = json['DOVIZ_TIPI'] as int?
  ..kkartKasasi = json['KKART_KASASI'] as bool?
  ..devirTutari = (json['DEVIR_TUTARI'] as num?)?.toDouble()
  ..dovizDevirTutari = (json['DOVIZ_DEVIR_TUTARI'] as num?)?.toDouble()
  ..dovizAdi = json['DOVIZ_ADI'] as String?
  ..toplamGiris = (json['TOPLAM_GIRIS'] as num?)?.toDouble()
  ..toplamCikis = (json['TOPLAM_CIKIS'] as num?)?.toDouble()
  ..bakiye = (json['BAKIYE'] as num?)?.toDouble()
  ..devirliBakiye = (json['DEVIRLI_BAKIYE'] as num?)?.toDouble()
  ..dovizToplamGiris = (json['DOVIZ_TOPLAM_GIRIS'] as num?)?.toDouble()
  ..dovizToplamCikis = (json['DOVIZ_TOPLAM_CIKIS'] as num?)?.toDouble()
  ..dovizBakiye = (json['DOVIZ_BAKIYE'] as num?)?.toDouble()
  ..devirliDovizBakiye = (json['DEVIRLI_DOVIZ_BAKIYE'] as num?)?.toDouble();

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
    ListCariOdemeKodu()
      ..odemeKodu = json['ODEME_KODU'] as String?
      ..aciklama = json['ACIKLAMA'] as String?;

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
    ListFatuEkMaliyet()
      ..no = json['NO'] as int?
      ..belgeTipi = json['BELGE_TIPI'] as String?
      ..adi = json['ADI'] as String?;

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

ListIskTip _$ListIskTipFromJson(Map<String, dynamic> json) => ListIskTip()
  ..iskontoTipi = json['ISKONTO_TIPI'] as int?
  ..aciklama = json['ACIKLAMA'] as String?;

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
    ListOzelKodTum()
      ..kodTipi = json['KOD_TIPI'] as int?
      ..belgeTipi = json['BELGE_TIPI'] as String?
      ..kod = json['KOD'] as String?
      ..aciklama = json['ACIKLAMA'] as String?
      ..fiyatSirasi = json['FIYAT_SIRASI'] as int?;

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

MapEkAlanlar _$MapEkAlanlarFromJson(Map<String, dynamic> json) => MapEkAlanlar()
  ..caption = json['caption'] as String?
  ..fieldName = json['fieldName'] as String?
  ..veriTipi = json['-veriTipi'] as String?;

Map<String, dynamic> _$MapEkAlanlarToJson(MapEkAlanlar instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('caption', instance.caption);
  writeNotNull('fieldName', instance.fieldName);
  writeNotNull('-veriTipi', instance.veriTipi);
  return val;
}

MapCariKullSahalar _$MapCariKullSahalarFromJson(Map<String, dynamic> json) =>
    MapCariKullSahalar()
      ..the1S = json['1S'] as String?
      ..the2S = json['2S'] as String?
      ..the3S = json['3S'] as String?
      ..the4S = json['4S'] as String?
      ..the5S = json['5S'] as String?
      ..the6S = json['6S'] as String?
      ..the7S = json['7S'] as String?
      ..the8S = json['8S'] as String?
      ..the1N = json['1N'] as String?
      ..the2N = json['2N'] as String?
      ..the3N = json['3N'] as String?
      ..the4N = json['4N'] as String?
      ..the5N = json['5N'] as String?
      ..the6N = json['6N'] as String?
      ..the7N = json['7N'] as String?
      ..the8N = json['8N'] as String?;

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
    MapKdvSifirBelgeTipiOzelKod2()
      ..dc = json['DC'] as String?
      ..ac = json['AC'] as String?
      ..ms = json['MS'] as String?
      ..si = json['SI'] as String?
      ..sf = json['SF'] as String?
      ..stek = json['STEK'] as String?;

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
    MapStokGrupAdlari()
      ..grupKodu = json['GrupKodu'] as String?
      ..kod1 = json['Kod1']
      ..kod2 = json['Kod2']
      ..kod3 = json['Kod3']
      ..kod4 = json['Kod4']
      ..kod5 = json['Kod5'];

Map<String, dynamic> _$MapStokGrupAdlariToJson(MapStokGrupAdlari instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('GrupKodu', instance.grupKodu);
  writeNotNull('Kod1', instance.kod1);
  writeNotNull('Kod2', instance.kod2);
  writeNotNull('Kod3', instance.kod3);
  writeNotNull('Kod4', instance.kod4);
  writeNotNull('Kod5', instance.kod5);
  return val;
}

MapStokKullSahalar _$MapStokKullSahalarFromJson(Map<String, dynamic> json) =>
    MapStokKullSahalar()
      ..the1S = json['1S'] as String?
      ..the2S = json['2S'] as String?
      ..the3S = json['3S'] as String?
      ..the4S = json['4S'] as String?
      ..the5S = json['5S'] as String?
      ..the6S = json['6S'] as String?
      ..the7S = json['7S'] as String?
      ..the8S = json['8S'] as String?
      ..the1N = json['1N'] as String?
      ..the2N = json['2N'] as String?
      ..the3N = json['3N'] as String?
      ..the4N = json['4N'] as String?
      ..the5N = json['5N'] as String?
      ..the6N = json['6N'] as String?
      ..the7N = json['7N'] as String?
      ..the8N = json['8N'] as String?;

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
    MustahsilParam()
      ..stopajOrani = (json['STOPAJ_ORANI'] as num?)?.toDouble()
      ..fonOrani = (json['FON_ORANI'] as num?)?.toDouble()
      ..borsaOrani = (json['BORSA_ORANI'] as num?)?.toDouble()
      ..bagkurOrani = json['BAGKUR_ORANI'] as int?
      ..bagkurYb = json['BAGKUR_YB'] as String?
      ..meraOrani = (json['MERA_ORANI'] as num?)?.toDouble()
      ..borsaUcretDuzenlemesi = json['BORSA_UCRET_DUZENLEMESI'] as String?;

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
    NetFectDizaynList()
      ..id = json['ID'] as int?
      ..dizaynYeri = json['DIZAYN_YERI'] as String?
      ..dizaynYolu = json['DIZAYN_YOLU'] as String?
      ..dizaynAdi = json['DIZAYN_ADI'] as String?
      ..ozelKod = json['OZEL_KOD'] as String?
      ..kopyaSayisi = json['KOPYA_SAYISI'] as int?
      ..sablonVar = json['SABLON_VAR'] as String?
      ..aktif = json['AKTIF'] as String?
      ..dosyaAdi = json['DOSYA_ADI'] as String?
      ..parametreler = json['PARAMETRELER'] as String?
      ..varsayilanMi = json['VARSAYILAN_MI'] as bool?
      ..detayKod = json['DETAY_KOD'] as String?;

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
  writeNotNull('DETAY_KOD', instance.detayKod);
  return val;
}

NetsisOndalikResponseModel _$NetsisOndalikResponseModelFromJson(
        Map<String, dynamic> json) =>
    NetsisOndalikResponseModel()
      ..modul = json['MODUL'] as String?
      ..miktar = json['MIKTAR'] as int?
      ..fiyat = json['FIYAT'] as int?
      ..tutar = json['TUTAR'] as int?
      ..kur = json['KUR'] as int?
      ..doviz = json['DOVIZ'] as int?
      ..dovizFiyati = json['DOVIZ_FIYATI'] as int?
      ..oran = json['ORAN'] as int?;

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

PlasiyerList _$PlasiyerListFromJson(Map<String, dynamic> json) => PlasiyerList(
      plasiyerKodu: json['PLASIYER_KODU'] as String?,
      plasiyerAciklama: json['PLASIYER_ACIKLAMA'] as String?,
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
    SatirAcikBaslikList()
      ..belgeKodu = json['BELGE_KODU'] as String?
      ..aciklama1 = json['ACIKLAMA1'] as String?
      ..aciklama2 = json['ACIKLAMA2'] as String?
      ..aciklama3 = json['ACIKLAMA3'] as String?
      ..aciklama4 = json['ACIKLAMA4'] as String?
      ..aciklama5 = json['ACIKLAMA5'] as String?
      ..aciklama6 = json['ACIKLAMA6'] as String?
      ..aciklama7 = json['ACIKLAMA7'] as String?
      ..aciklama8 = json['ACIKLAMA8'] as String?
      ..aciklama9 = json['ACIKLAMA9'] as String?
      ..aciklama10 = json['ACIKLAMA10'] as String?;

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
    StokDetayliAramaAlanlar()
      ..searchField = json['SearchField'] as String?
      ..name = json['Name'] as String?;

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

SubeList _$SubeListFromJson(Map<String, dynamic> json) => SubeList()
  ..sirket = json['SIRKET'] as String?
  ..isletmeKodu = json['ISLETME_KODU'] as int?
  ..subeAdi = json['SUBE_ADI'] as String?
  ..isletmeAdi = json['ISLETME_ADI'] as String?
  ..lokalDepoAktif = json['LOKAL_DEPO_AKTIF'] as bool?
  ..merkezmi = json['MERKEZMI'] as String?
  ..adres = json['ADRES'] as String?
  ..telefon = json['TELEFON'] as String?
  ..faks = json['FAKS'] as String?
  ..email = json['EMAIL'] as String?
  ..ilAdi = json['IL_ADI'] as String?
  ..ilce = json['ILCE'] as String?
  ..vergiNumarasi = json['VERGI_NUMARASI'] as String?
  ..vergiDairesi = json['VERGI_DAIRESI'] as String?
  ..paraBirimi = json['PARA_BIRIMI'] as String?
  ..paraBirimiKusurat = json['PARA_BIRIMI_KUSURAT'] as String?
  ..subeKodu = json['SUBE_KODU'] as int?
  ..cariKodu = json['CARI_KODU'] as String?
  ..cariAdi = json['CARI_ADI'] as String?;

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

TalTekParam _$TalTekParamFromJson(Map<String, dynamic> json) => TalTekParam()
  ..tip = json['TIP'] as int?
  ..belgeTipi = json['BELGE_TIPI'] as String?
  ..dovizTakip = json['DOVIZ_TAKIP'] as String?
  ..satirIskontoSayisi = json['SATIR_ISKONTO_SAYISI'] as String?
  ..farkliBirimlerdenIslem = json['FARKLI_BIRIMLERDEN_ISLEM'] as String?
  ..farkliTeslimYeri = json['FARKLI_TESLIM_YERI'] as String?
  ..depoStokKartindanGelsin = json['DEPO_STOK_KARTINDAN_GELSIN'] as String?
  ..ekaciklamalarAktif = json['EKACIKLAMALAR_AKTIF'] as String?
  ..ozelKod1Aktif = json['OZEL_KOD1_AKTIF'] as String?
  ..ozelKod1Secim11 = json['OZEL_KOD1_SECIM11'] as String?
  ..ozelKod1Secim21 = json['OZEL_KOD1_SECIM21'] as String?
  ..ozelKod1Secim31 = json['OZEL_KOD1_SECIM31'] as String?
  ..ozelKod1Secim41 = json['OZEL_KOD1_SECIM41'] as String?
  ..ozelKod2Aktif = json['OZEL_KOD2_AKTIF'] as String?
  ..aciklar1 = json['ACIKLAR1'] as String?
  ..aciklar2 = json['ACIKLAR2'] as String?
  ..satirdaKdvSor = json['SATIRDA_KDV_SOR'] as String?
  ..satirTeslimTarSor = json['SATIR_TESLIM_TAR_SOR'] as String?
  ..dovizTakipHangisi = json['DOVIZ_TAKIP_HANGISI'] as int?
  ..satirEkalan2Kullan = json['SATIR_EKALAN2_KULLAN'] as String?
  ..hizmetUygulamasi = json['HIZMET_UYGULAMASI'] as String?
  ..hizmetDepoKodu = json['HIZMET_DEPO_KODU'] as int?
  ..kalemlerdeAciklamaAktif = json['KALEMLERDE_ACIKLAMA_AKTIF'] as String?
  ..onaySistemiKullan = json['ONAY_SISTEMI_KULLAN'] as String?
  ..kdvHaric = json['KDV_HARIC'] as String?
  ..kdvDahilHaricSor = json['KDV_DAHIL_HARIC_SOR'] as String?
  ..ozelKod2Tablodan = json['OZEL_KOD2_TABLODAN'] as String?
  ..muhrefkodSorulsun = json['MUHREFKOD_SORULSUN'] as String?
  ..topluDepoKullan = json['TOPLU_DEPO_KULLAN'] as String?
  ..kosulAktif = json['KOSUL_AKTIF'] as String?
  ..satirIskontosu = json['SATIR_ISKONTOSU'] as String?
  ..yuzdeSorulsun = json['YUZDE_SORULSUN'] as String?
  ..malFazlasiIskonto = json['MAL_FAZLASI_ISKONTO'] as String?
  ..genIsk1Aktif = json['GEN_ISK1_AKTIF'] as String?
  ..genIsk1Adi = json['GEN_ISK1_ADI'] as String?
  ..genIsk2Aktif = json['GEN_ISK2_AKTIF'] as String?
  ..genIsk2Adi = json['GEN_ISK2_ADI'] as String?
  ..genIsk3Aktif = json['GEN_ISK3_AKTIF'] as String?
  ..genIsk3Adi = json['GEN_ISK3_ADI'] as String?
  ..ozelKod1Tablodan = json['OZEL_KOD1_TABLODAN'] as String?
  ..aciklamaAktif = json['ACIKLAMA_AKTIF'] as String?
  ..miktar2Sor = json['MIKTAR2_SOR'] as String?
  ..miktarBirGelsin = json['MIKTAR_BIR_GELSIN'] as String?
  ..varsayilanMuhrefkod = json['VARSAYILAN_MUHREFKOD'] as String?
  ..tutardanBirimFiata = json['TUTARDAN_BIRIM_FIATA'] as String?
  ..cariIskSatiraUygula = json['CARI_ISK_SATIRA_UYGULA'] as String?
  ..miktarSifirOlamaz = json['MIKTAR_SIFIR_OLAMAZ'] as String?
  ..fatAltm1Varmi = json['FAT_ALTM1_VARMI'] as String?
  ..fatAltm2Varmi = json['FAT_ALTM2_VARMI'] as String?
  ..fatAltm1Tanim = json['FAT_ALTM1_TANIM'] as String?
  ..fatAltm2Tanim = json['FAT_ALTM2_TANIM'] as String?
  ..kdvSifirlanacakOzelkod2 = json['KDV_SIFIRLANACAK_OZELKOD2'] as String?
  ..kosulSatirdaAktif = json['KOSUL_SATIRDA_AKTIF'] as String?;

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

YaziciList _$YaziciListFromJson(Map<String, dynamic> json) => YaziciList()
  ..yaziciAdi = json['YAZICI_ADI'] as String?
  ..yaziciTipi = json['YAZICI_TIPI'] as String?
  ..aciklama = json['ACIKLAMA'] as String?;

Map<String, dynamic> _$YaziciListToJson(YaziciList instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('YAZICI_ADI', instance.yaziciAdi);
  writeNotNull('YAZICI_TIPI', instance.yaziciTipi);
  writeNotNull('ACIKLAMA', instance.aciklama);
  return val;
}
