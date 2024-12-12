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
  ..isletmeKodu = (json['ISLETME_KODU'] as num?)?.toInt()
  ..mapCariKullSahalar = json['MapCariKullSahalar'] == null
      ? null
      : MapCariKullSahalar.fromJson(
          json['MapCariKullSahalar'] as Map<String, dynamic>)
  ..mapCariEkAlanlar = (json['MapCariEkAlanlar'] as List<dynamic>?)
      ?.map((e) => MapEkAlanlar.fromJson(e as Map<String, dynamic>))
      .toList()
  ..sabitSayfalamaOgeSayisi =
      (json['sabitSayfalamaOgeSayisi'] as num?)?.toInt() ?? 25
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
      (json['AlisSatirKademeliIskontoSayisi'] as num?)?.toInt()
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
  ..alisTevkifatPay = (json['AlisTevkifatPay'] as num?)?.toInt()
  ..alisTevkifatPayda = (json['AlisTevkifatPayda'] as num?)?.toInt()
  ..alisFaturaFiyatSifirGecilsin = json['AlisFaturaFiyatSifirGecilsin'] as bool?
  ..alisFazlaTeslimat = json['AlisFazlaTeslimat'] as bool?
  ..alisDovizTakipHangiDeger =
      (json['AlisDovizTakipHangiDeger'] as num?)?.toInt()
  ..alisHizmetAktif = json['AlisHizmetAktif'] as bool?
  ..alisHizmetDepoKodu = (json['AlisHizmetDepoKodu'] as num?)?.toInt()
  ..alisMiktar2Sor = json['AlisMiktar2Sor'] as bool?
  ..alisSatirdaTeslimTarihiSor = json['AlisSatirdaTeslimTarihiSor'] as bool?
  ..alisFisSeriTakibiVar = json['AlisFisSeriTakibiVar'] as bool?
  ..alisTutardanFiyataGecilsin = json['AlisTutardanFiyataGecilsin'] as bool?
  ..alisCariIskSatiraUygula = json['AlisCariIskSatiraUygula'] as bool?
  ..seriUygulamasiAcik = json['SeriUygulamasiAcik'] as bool?
  ..sirketDovizUygulamasiAcik = json['SirketDovizUygulamasiAcik'] as bool?
  ..sirketDovizUygulamasiDovizKodu =
      (json['SirketDovizUygulamasiDovizKodu'] as num?)?.toInt()
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
      (json['SatisSatirKademeliIskontoSayisi'] as num?)?.toInt()
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
  ..satisTevkifatPay = (json['SatisTevkifatPay'] as num?)?.toInt()
  ..satisTevkifatPayda = (json['SatisTevkifatPayda'] as num?)?.toInt()
  ..satisFaturaFiyatSifirGecilsin =
      json['SatisFaturaFiyatSifirGecilsin'] as bool?
  ..satisFazlaTeslimat = json['SatisFazlaTeslimat'] as bool?
  ..satisDovizTakipHangiDeger =
      (json['SatisDovizTakipHangiDeger'] as num?)?.toInt()
  ..satisHizmetAktif = json['SatisHizmetAktif'] as bool?
  ..satisHizmetDepoKodu = (json['SatisHizmetDepoKodu'] as num?)?.toInt()
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
  ..seriUzunlugu = (json['SeriUzunlugu'] as num?)?.toInt()
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
      (json['ArrEFatSeri'] as List<dynamic>?)?.map((e) => e as String).toList()
  ..arrEArSeri =
      (json['ArrEArSeri'] as List<dynamic>?)?.map((e) => e as String).toList()
  ..seriEArsiv = json['Seri_EArsiv'] as String?
  ..uretimEkAlanKullan = json['UretimEkAlanKullan'] as bool?
  ..ozelFaturaIadeMaliyetiZorunlu =
      json['OzelFaturaIadeMaliyetiZorunlu'] as bool?
  ..bankaKKartiKasayaIsle = json['bankaKKartiKasayaIsle'] as bool?
  ..kayitliBankaHesapTipleri =
      (json['KayitliBankaHesapTipleri'] as List<dynamic>?)
          ?.map((e) => (e as num).toInt())
          .toList()
  ..kkNoZorunluDegil = json['KKNoZorunluDegil'] as bool?
  ..fifoLifoYontem = json['FifoLifoYontem'] as String?
  ..cariAktiviteUygulamasi = json['CariAktiviteUygulamasi'] as String?
  ..cariAktiviteTipleri = (json['CariAktiviteTipleri'] as List<dynamic>?)
      ?.map((e) => CariAktiviteTipleri.fromJson(e as Map<String, dynamic>))
      .toList()
  ..cariAktiviteEkAlanlar = (json['CariAktiviteEkAlanlar'] as List<dynamic>?)
      ?.map((e) => (e as num).toInt())
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
  ..genelKonumTakibiDakika = (json['Genel_KonumTakibiDakika'] as num?)?.toInt()
  ..genelKonumTakibiMetre = (json['Genel_KonumTakibiMetre'] as num?)?.toInt()
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
  ..alisOzelKod1Aktif = json['AlisOzelKod1Aktif'] as bool?
  ..alisOzelKod2Aktif = json['AlisOzelKod2Aktif'] as bool?
  ..alisOzelKod2Tablodan = json['AlisOzelKod2Tablodan'] as bool?
  ..alisMiktar1Gelsin = json['AlisMiktar1Gelsin'] as bool?
  ..satisMiktar1Gelsin = json['SatisMiktar1Gelsin'] as bool?
  ..satisOzelKod2Tablodan = json['SatisOzelKod2Tablodan'] as bool?
  ..seriCikislardaOtomatik = json['SeriCikislardaOtomatik'] as bool?
  ..serideSaatOlsun = json['SerideSaatOlsun'] as bool?
  ..seriEIrsaliyeYanit = json['SeriEIrsaliyeYanit'] as String?
  ..datSatirBazindaDepoSorulsun = json['DAT_SatirBazindaDepoSorulsun'] as bool?
  ..stokResimleriKlasorden = json['StokResimleriKlasorden'] as bool?
  ..alisEkAlan1Aktif = json['AlisEkAlan1Aktif'] as bool?
  ..alisEkMaliyet1KdvOrani =
      (json['AlisEkMaliyet1KdvOrani'] as num?)?.toDouble()
  ..satisAciklamaAlaniGorunsun = json['SatisAciklamaAlaniGorunsun'] as bool?
  ..satisMusteriSiptenSaticiSipAktif =
      json['SatisMusteriSiptenSaticiSipAktif'] as bool?
  ..satisSipOnayAktif = json['SatisSipOnayAktif'] as bool?
  ..satisMuhRefKodSorulsun = json['SatisMuhRefKodSorulsun'] as bool?
  ..alisMuhRefKodSorulsun = json['AlisMuhRefKodSorulsun'] as bool?
  ..satisEkMaliyet1KdvOrani =
      (json['SatisEkMaliyet1KdvOrani'] as num?)?.toDouble()
  ..fatuSatisTeslimCarideBaglanmisCarilerSecilsin =
      json['FatuSatisTeslimCarideBaglanmisCarilerSecilsin'] as bool?
  ..fatuAlisTeslimCarideBaglanmisCarilerSecilsin =
      json['FatuAlisTeslimCarideBaglanmisCarilerSecilsin'] as bool?
  ..seriUrunBazindaTekOlsun = json['SeriUrunBazindaTekOlsun'] as bool?
  ..eArsivAktif = json['EArsivAktif'] as bool?
  ..satisTeslimCarideBaglanmisCarilerSecilsin =
      json['SatisTeslimCarideBaglanmisCarilerSecilsin'] as bool?
  ..alisTeslimCarideBaglanmisCarilerSecilsin =
      json['AlisTeslimCarideBaglanmisCarilerSecilsin'] as bool?
  ..faturaSatisIadeUygulamasi = json['FaturaSatisIadeUygulamasi'] as bool?
  ..cariRotaUygulamasi = json['CariRotaUygulamasi'] as String?;

Map<String, dynamic> _$ParamModelToJson(ParamModel instance) =>
    <String, dynamic>{
      if (instance.paramYuklendi case final value?) 'ParamYuklendi': value,
      if (instance.kullanici case final value?) 'KULLANICI': value,
      if (instance.sirket case final value?) 'SIRKET': value,
      if (instance.isletmeKodu case final value?) 'ISLETME_KODU': value,
      if (instance.mapCariKullSahalar?.toJson() case final value?)
        'MapCariKullSahalar': value,
      if (instance.mapCariEkAlanlar?.map((e) => e.toJson()).toList()
          case final value?)
        'MapCariEkAlanlar': value,
      'sabitSayfalamaOgeSayisi': instance.sabitSayfalamaOgeSayisi,
      if (instance.netsisOndalikResponseModel?.map((e) => e.toJson()).toList()
          case final value?)
        '_NetsisOndalikResponseModel': value,
      if (instance.depoList?.map((e) => e.toJson()).toList() case final value?)
        'DepoList': value,
      if (instance.dovizList?.map((e) => e.toJson()).toList() case final value?)
        'DovizList': value,
      if (instance.satirAcikBaslikList?.map((e) => e.toJson()).toList()
          case final value?)
        'SatirAcikBaslikList': value,
      if (instance.kasaList?.map((e) => e.toJson()).toList() case final value?)
        'KasaList': value,
      if (instance.plasiyerList?.map((e) => e.toJson()).toList()
          case final value?)
        'PlasiyerList': value,
      if (instance.plasiyerListTumu?.map((e) => e.toJson()).toList()
          case final value?)
        'PlasiyerListTumu': value,
      if (instance.subeList?.map((e) => e.toJson()).toList() case final value?)
        'SubeList': value,
      if (instance.talTekParam?.map((e) => e.toJson()).toList()
          case final value?)
        'TalTekParam': value,
      if (instance.cekSenParam?.map((e) => e.toJson()).toList()
          case final value?)
        'CekSenParam': value,
      if (instance.listOzelKodTum?.map((e) => e.toJson()).toList()
          case final value?)
        'ListOzelKodTum': value,
      if (instance.listIskTip?.map((e) => e.toJson()).toList()
          case final value?)
        'ListIskTip': value,
      if (instance.listCariOdemeKodu?.map((e) => e.toJson()).toList()
          case final value?)
        'ListCariOdemeKodu': value,
      if (instance.yaziciList?.map((e) => e.toJson()).toList()
          case final value?)
        'YaziciList': value,
      if (instance.netFectDizaynList?.map((e) => e.toJson()).toList()
          case final value?)
        'NetFectDizaynList': value,
      if (instance.mapStokGrupAdlari?.toJson() case final value?)
        'MapStokGrupAdlari': value,
      if (instance.mustahsilParam?.toJson() case final value?)
        'MustahsilParam': value,
      if (instance.listFatuEkMaliyet?.map((e) => e.toJson()).toList()
          case final value?)
        'ListFatuEkMaliyet': value,
      if (instance.mapKdvSifirBelgeTipiOzelKod2?.toJson() case final value?)
        'MapKdvSifirBelgeTipiOzelKod2': value,
      if (instance.lokalDepoUygulamasiAcik case final value?)
        'LokalDepoUygulamasiAcik': value,
      if (instance.esnekYapilandir case final value?) 'EsnekYapilandir': value,
      if (instance.ozelFiyatSistemi case final value?)
        'OzelFiyatSistemi': value,
      if (instance.sadeceOzelFiyatSistemi case final value?)
        'SadeceOzelFiyatSistemi': value,
      if (instance.otvliStoklarVar case final value?) 'OtvliStoklarVar': value,
      if (instance.mapStokKullSahalar?.toJson() case final value?)
        'MapStokKullSahalar': value,
      if (instance.mapStokEkAlanlar?.map((e) => e.toJson()).toList()
          case final value?)
        'MapStokEkAlanlar': value,
      if (instance.karmaKoliUyg case final value?) 'KarmaKoliUyg': value,
      if (instance.alisEkAciklamalarAktif case final value?)
        'AlisEkAciklamalarAktif': value,
      if (instance.alisEkAciklamaTanimi1 case final value?)
        'AlisEkAciklamaTanimi1': value,
      if (instance.alisEkAciklamaTanimi2 case final value?)
        'AlisEkAciklamaTanimi2': value,
      if (instance.alisEkAciklamaTanimi3 case final value?)
        'AlisEkAciklamaTanimi3': value,
      if (instance.alisEkAciklamaTanimi4 case final value?)
        'AlisEkAciklamaTanimi4': value,
      if (instance.alisEkAciklamaTanimi5 case final value?)
        'AlisEkAciklamaTanimi5': value,
      if (instance.alisEkAciklamaTanimi6 case final value?)
        'AlisEkAciklamaTanimi6': value,
      if (instance.alisEkAciklamaTanimi7 case final value?)
        'AlisEkAciklamaTanimi7': value,
      if (instance.alisEkAciklamaTanimi8 case final value?)
        'AlisEkAciklamaTanimi8': value,
      if (instance.alisEkAciklamaTanimi9 case final value?)
        'AlisEkAciklamaTanimi9': value,
      if (instance.alisEkAciklamaTanimi10 case final value?)
        'AlisEkAciklamaTanimi10': value,
      if (instance.alisEkAciklamaTanimi11 case final value?)
        'AlisEkAciklamaTanimi11': value,
      if (instance.alisEkAciklamaTanimi12 case final value?)
        'AlisEkAciklamaTanimi12': value,
      if (instance.alisEkAciklamaTanimi13 case final value?)
        'AlisEkAciklamaTanimi13': value,
      if (instance.alisEkAciklamaTanimi14 case final value?)
        'AlisEkAciklamaTanimi14': value,
      if (instance.alisEkAciklamaTanimi15 case final value?)
        'AlisEkAciklamaTanimi15': value,
      if (instance.alisEkAciklamaTanimi16 case final value?)
        'AlisEkAciklamaTanimi16': value,
      if (instance.alisOzelKod1Tablodan case final value?)
        'AlisOzelKod1Tablodan': value,
      if (instance.alisKosulAktif case final value?) 'AlisKosulAktif': value,
      if (instance.alisFarkliTeslimCariAktif case final value?)
        'AlisFarkliTeslimCariAktif': value,
      if (instance.alisMalFazMiktarIskontoAcik case final value?)
        'AlisMalFazMiktarIskontoAcik': value,
      if (instance.alisSatirKademeliIskontoAcik case final value?)
        'AlisSatirKademeliIskontoAcik': value,
      if (instance.alisSatirKademeliIskontoSayisi case final value?)
        'AlisSatirKademeliIskontoSayisi': value,
      if (instance.alisGenIsk1Aktif case final value?)
        'AlisGenIsk1Aktif': value,
      if (instance.alisGenIsk2Aktif case final value?)
        'AlisGenIsk2Aktif': value,
      if (instance.alisGenIsk3Aktif case final value?)
        'AlisGenIsk3Aktif': value,
      if (instance.alisTopluDepoAktif case final value?)
        'AlisTopluDepoAktif': value,
      if (instance.alisStokDepoKarttanGelsin case final value?)
        'AlisStokDepoKarttanGelsin': value,
      if (instance.alisGenellikleKdvHaric case final value?)
        'AlisGenellikleKDVHaric': value,
      if (instance.alisFarkliOlcuBirimleriKullan case final value?)
        'AlisFarkliOlcuBirimleriKullan': value,
      if (instance.alisDovizAktif case final value?) 'AlisDovizAktif': value,
      if (instance.alisSatirdaKdvSor case final value?)
        'AlisSatirdaKDVSor': value,
      if (instance.alisSatirdaAciklamalarAktif case final value?)
        'AlisSatirdaAciklamalarAktif': value,
      if (instance.alisSatirdaEkAlan2Aktif case final value?)
        'AlisSatirdaEkAlan2Aktif': value,
      if (instance.alisEkMaliyet2Aktif case final value?)
        'AlisEkMaliyet2Aktif': value,
      if (instance.alisEkMaliyet2Adi case final value?)
        'AlisEkMaliyet2Adi': value,
      if (instance.alisTevkifatPay case final value?) 'AlisTevkifatPay': value,
      if (instance.alisTevkifatPayda case final value?)
        'AlisTevkifatPayda': value,
      if (instance.alisFaturaFiyatSifirGecilsin case final value?)
        'AlisFaturaFiyatSifirGecilsin': value,
      if (instance.alisFazlaTeslimat case final value?)
        'AlisFazlaTeslimat': value,
      if (instance.alisDovizTakipHangiDeger case final value?)
        'AlisDovizTakipHangiDeger': value,
      if (instance.alisHizmetAktif case final value?) 'AlisHizmetAktif': value,
      if (instance.alisHizmetDepoKodu case final value?)
        'AlisHizmetDepoKodu': value,
      if (instance.alisMiktar2Sor case final value?) 'AlisMiktar2Sor': value,
      if (instance.alisSatirdaTeslimTarihiSor case final value?)
        'AlisSatirdaTeslimTarihiSor': value,
      if (instance.alisFisSeriTakibiVar case final value?)
        'AlisFisSeriTakibiVar': value,
      if (instance.alisTutardanFiyataGecilsin case final value?)
        'AlisTutardanFiyataGecilsin': value,
      if (instance.alisCariIskSatiraUygula case final value?)
        'AlisCariIskSatiraUygula': value,
      if (instance.seriUygulamasiAcik case final value?)
        'SeriUygulamasiAcik': value,
      if (instance.sirketDovizUygulamasiAcik case final value?)
        'SirketDovizUygulamasiAcik': value,
      if (instance.sirketDovizUygulamasiDovizKodu case final value?)
        'SirketDovizUygulamasiDovizKodu': value,
      if (instance.plasiyerUygulamasi case final value?)
        'PlasiyerUygulamasi': value,
      if (instance.paraBirimi case final value?) 'ParaBirimi': value,
      if (instance.bankaEntegre case final value?) 'BankaEntegre': value,
      if (instance.bagliCariVar case final value?) 'BagliCariVar': value,
      if (instance.projeUygulamasiAcik case final value?)
        'ProjeUygulamasiAcik': value,
      if (instance.satisOzelKod1Aktif case final value?)
        'SatisOzelKod1Aktif': value,
      if (instance.satisOzelKod2Aktif case final value?)
        'SatisOzelKod2Aktif': value,
      if (instance.satisEkAciklamalarAktif case final value?)
        'SatisEkAciklamalarAktif': value,
      if (instance.satisEkAciklamaTanimi1 case final value?)
        'SatisEkAciklamaTanimi1': value,
      if (instance.satisEkAciklamaTanimi2 case final value?)
        'SatisEkAciklamaTanimi2': value,
      if (instance.satisEkAciklamaTanimi3 case final value?)
        'SatisEkAciklamaTanimi3': value,
      if (instance.satisEkAciklamaTanimi4 case final value?)
        'SatisEkAciklamaTanimi4': value,
      if (instance.satisEkAciklamaTanimi5 case final value?)
        'SatisEkAciklamaTanimi5': value,
      if (instance.satisEkAciklamaTanimi6 case final value?)
        'SatisEkAciklamaTanimi6': value,
      if (instance.satisEkAciklamaTanimi7 case final value?)
        'SatisEkAciklamaTanimi7': value,
      if (instance.satisEkAciklamaTanimi8 case final value?)
        'SatisEkAciklamaTanimi8': value,
      if (instance.satisEkAciklamaTanimi9 case final value?)
        'SatisEkAciklamaTanimi9': value,
      if (instance.satisEkAciklamaTanimi10 case final value?)
        'SatisEkAciklamaTanimi10': value,
      if (instance.satisEkAciklamaTanimi11 case final value?)
        'SatisEkAciklamaTanimi11': value,
      if (instance.satisEkAciklamaTanimi12 case final value?)
        'SatisEkAciklamaTanimi12': value,
      if (instance.satisEkAciklamaTanimi13 case final value?)
        'SatisEkAciklamaTanimi13': value,
      if (instance.satisEkAciklamaTanimi14 case final value?)
        'SatisEkAciklamaTanimi14': value,
      if (instance.satisEkAciklamaTanimi15 case final value?)
        'SatisEkAciklamaTanimi15': value,
      if (instance.satisEkAciklamaTanimi16 case final value?)
        'SatisEkAciklamaTanimi16': value,
      if (instance.satisSatirIsk1YuzdeSor case final value?)
        'SatisSatirIsk1YuzdeSor': value,
      if (instance.satisKosulAktif case final value?) 'SatisKosulAktif': value,
      if (instance.satisKosulSatirdaSor case final value?)
        'SatisKosulSatirdaSor': value,
      if (instance.satisFarkliTeslimCariAktif case final value?)
        'SatisFarkliTeslimCariAktif': value,
      if (instance.satisMalFazMiktarIskontoAcik case final value?)
        'SatisMalFazMiktarIskontoAcik': value,
      if (instance.satisSatirKademeliIskontoAcik case final value?)
        'SatisSatirKademeliIskontoAcik': value,
      if (instance.satisSatirKademeliIskontoSayisi case final value?)
        'SatisSatirKademeliIskontoSayisi': value,
      if (instance.satisSatirdaKdvSor case final value?)
        'SatisSatirdaKDVSor': value,
      if (instance.satisGenIsk1Aktif case final value?)
        'SatisGenIsk1Aktif': value,
      if (instance.satisGenIsk2Aktif case final value?)
        'SatisGenIsk2Aktif': value,
      if (instance.satisGenIsk3Aktif case final value?)
        'SatisGenIsk3Aktif': value,
      if (instance.satisTopluDepoAktif case final value?)
        'SatisTopluDepoAktif': value,
      if (instance.satisStokDepoKarttanGelsin case final value?)
        'SatisStokDepoKarttanGelsin': value,
      if (instance.satisGenellikleKdvHaric case final value?)
        'SatisGenellikleKDVHaric': value,
      if (instance.satisFarkliOlcuBirimleriKullan case final value?)
        'SatisFarkliOlcuBirimleriKullan': value,
      if (instance.satisCariRiskTakibi case final value?)
        'SatisCariRiskTakibi': value,
      if (instance.satisDovizAktif case final value?) 'SatisDovizAktif': value,
      if (instance.satisSatirdaAciklamalarAktif case final value?)
        'SatisSatirdaAciklamalarAktif': value,
      if (instance.satisSatirdaEkAlan2Aktif case final value?)
        'SatisSatirdaEkAlan2Aktif': value,
      if (instance.satisEkMaliyet2Aktif case final value?)
        'SatisEkMaliyet2Aktif': value,
      if (instance.satisEkMaliyet2Adi case final value?)
        'SatisEkMaliyet2Adi': value,
      if (instance.satisTevkifatPay case final value?)
        'SatisTevkifatPay': value,
      if (instance.satisTevkifatPayda case final value?)
        'SatisTevkifatPayda': value,
      if (instance.satisFaturaFiyatSifirGecilsin case final value?)
        'SatisFaturaFiyatSifirGecilsin': value,
      if (instance.satisFazlaTeslimat case final value?)
        'SatisFazlaTeslimat': value,
      if (instance.satisDovizTakipHangiDeger case final value?)
        'SatisDovizTakipHangiDeger': value,
      if (instance.satisHizmetAktif case final value?)
        'SatisHizmetAktif': value,
      if (instance.satisHizmetDepoKodu case final value?)
        'SatisHizmetDepoKodu': value,
      if (instance.satisMiktar2Sor case final value?) 'SatisMiktar2Sor': value,
      if (instance.satisSubeDatOnaylansin case final value?)
        'SatisSubeDATOnaylansin': value,
      if (instance.satisSatirdaTeslimTarihiSor case final value?)
        'SatisSatirdaTeslimTarihiSor': value,
      if (instance.satisSatirdaIsEmriSorulsun case final value?)
        'SatisSatirdaIsEmriSorulsun': value,
      if (instance.satisFisSeriTakibiVar case final value?)
        'SatisFisSeriTakibiVar': value,
      if (instance.satisIrsCariHesaba case final value?)
        'SatisIrsCariHesaba': value,
      if (instance.satisEkAlan1Aktif case final value?)
        'SatisEkAlan1Aktif': value,
      if (instance.satisDatSiparisTakibi case final value?)
        'SatisDATSiparisTakibi': value,
      if (instance.satisIrsFatuSipVadeDegissin case final value?)
        'SatisIrsFatuSipVadeDegissin': value,
      if (instance.konsinyeUygulamasi case final value?)
        'KonsinyeUygulamasi': value,
      if (instance.mSenetDovizAktif case final value?)
        'MSenetDovizAktif': value,
      if (instance.mCekDovizAktif case final value?) 'MCekDovizAktif': value,
      if (instance.mCekAciklamaAktif case final value?)
        'MCekAciklamaAktif': value,
      if (instance.seriGirislerdeOtomatik case final value?)
        'SeriGirislerdeOtomatik': value,
      if (instance.serideYilOlsun case final value?) 'SerideYilOlsun': value,
      if (instance.serideAyOlsun case final value?) 'SerideAyOlsun': value,
      if (instance.serideGunOlsun case final value?) 'SerideGunOlsun': value,
      if (instance.seriUzunlugu case final value?) 'SeriUzunlugu': value,
      if (instance.seriEkAlanList case final value?) 'SeriEkAlanList': value,
      if (instance.eFaturaAktif case final value?) 'EFaturaAktif': value,
      if (instance.seriEFatura case final value?) 'Seri_EFatura': value,
      if (instance.eFaturaSenaryoDegistir case final value?)
        'EFaturaSenaryoDegistir': value,
      if (instance.eIrsaliyeAktif case final value?) 'EIrsaliyeAktif': value,
      if (instance.seriEIrsaliye case final value?) 'SeriEIrsaliye': value,
      if (instance.arrEIrsSeri case final value?) 'ArrEIrsSeri': value,
      if (instance.arrEFatSeri case final value?) 'ArrEFatSeri': value,
      if (instance.arrEArSeri case final value?) 'ArrEArSeri': value,
      if (instance.seriEArsiv case final value?) 'Seri_EArsiv': value,
      if (instance.uretimEkAlanKullan case final value?)
        'UretimEkAlanKullan': value,
      if (instance.ozelFaturaIadeMaliyetiZorunlu case final value?)
        'OzelFaturaIadeMaliyetiZorunlu': value,
      if (instance.bankaKKartiKasayaIsle case final value?)
        'bankaKKartiKasayaIsle': value,
      if (instance.kayitliBankaHesapTipleri case final value?)
        'KayitliBankaHesapTipleri': value,
      if (instance.kkNoZorunluDegil case final value?)
        'KKNoZorunluDegil': value,
      if (instance.fifoLifoYontem case final value?) 'FifoLifoYontem': value,
      if (instance.cariAktiviteUygulamasi case final value?)
        'CariAktiviteUygulamasi': value,
      if (instance.cariAktiviteTipleri?.map((e) => e.toJson()).toList()
          case final value?)
        'CariAktiviteTipleri': value,
      if (instance.cariAktiviteEkAlanlar case final value?)
        'CariAktiviteEkAlanlar': value,
      if (instance.satisCariDovizTipiniKullan case final value?)
        'SatisCariDovizTipiniKullan': value,
      if (instance.alisCariDovizTipiniKullan case final value?)
        'AlisCariDovizTipiniKullan': value,
      if (instance.fatuKontrolAciklamasiAktif case final value?)
        'Fatu_KontrolAciklamasiAktif': value,
      if (instance.satisFiyatGrubuSorulacakAlan case final value?)
        'SatisFiyatGrubuSorulacakAlan': value,
      if (instance.siparisFarkliSubeUyg case final value?)
        'Siparis_FarkliSubeUyg': value,
      if (instance.satisIskEkSahadanGelsin case final value?)
        'SatisIskEkSahadanGelsin': value,
      if (instance.satisIsk1Saha case final value?) 'SatisIsk1Saha': value,
      if (instance.satisIsk1Kullanim case final value?)
        'SatisIsk1Kullanim': value,
      if (instance.uretimMalTopHangiHucrede case final value?)
        'Uretim_MalTop_HangiHucrede': value,
      if (instance.uretimMalTopFazlaTeslimYapilabilir case final value?)
        'Uretim_MalTop_FazlaTeslimYapilabilir': value,
      if (instance.uretimUskSeriGirilsin case final value?)
        'Uretim_USK_SeriGirilsin': value,
      if (instance.finansBankaIslemModulu case final value?)
        'Finans_BankaIslemModulu': value,
      if (instance.finansBankaTcmbBankaKodu case final value?)
        'Finans_BankaTcmbBankaKodu': value,
      if (instance.finansBankaTcmbSubeKodu case final value?)
        'Finans_BankaTcmbSubeKodu': value,
      if (instance.finansCekSenOzelOrtalamaVadeGunuHesapla case final value?)
        'Finans_CekSenOzelOrtalamaVadeGunuHesapla': value,
      if (instance.stokYapRehberTipi case final value?)
        'Stok_Yap_RehberTipi': value,
      if (instance.stokKanbanBarkodEslemeUyg case final value?)
        'Stok_KanbanBarkodEslemeUyg': value,
      if (instance.stokSeriParcalamaUyg case final value?)
        'Stok_SeriParcalamaUyg': value,
      if (instance.stokDetayliAramaAlanlar?.map((e) => e.toJson()).toList()
          case final value?)
        'Stok_DetayliAramaAlanlar': value,
      if (instance.genelKonumTakibiYapilsin case final value?)
        'Genel_KonumTakibiYapilsin': value,
      if (instance.genelKonumTakibiDakika case final value?)
        'Genel_KonumTakibiDakika': value,
      if (instance.genelKonumTakibiMetre case final value?)
        'Genel_KonumTakibiMetre': value,
      if (instance.uetdsEsyaAktif case final value?) 'UetdsEsyaAktif': value,
      if (instance.satistaSiparisKullan case final value?)
        'SatistaSiparisKullan': value,
      if (instance.alistaSiparisKullan case final value?)
        'AlistaSiparisKullan': value,
      if (instance.sipOtoEslestir case final value?) 'SipOtoEslestir': value,
      if (instance.sevkEmriTerminalFatura case final value?)
        'SevkEmriTerminalFatura': value,
      if (instance.sevkEmriTerminalIrsaliye case final value?)
        'SevkEmriTerminalIrsaliye': value,
      if (instance.sevkEmriTerminalTransfer case final value?)
        'SevkEmriTerminalTransfer': value,
      if (instance.sevkEmriHucreKontrol case final value?)
        'SevkEmriHucreKontrol': value,
      if (instance.sevkEmriMalTopGorunecekAlanlar case final value?)
        'SevkEmriMalTopGorunecekAlanlar': value,
      if (instance.seriSevkIrsaliye case final value?)
        'Seri_SevkIrsaliye': value,
      if (instance.kontrolluBelgeAktarimAktif case final value?)
        'KontrolluBelgeAktarimAktif': value,
      if (instance.kontrolluBelgeAktarimBelgeNoGoster case final value?)
        'KontrolluBelgeAktarimBelgeNoGoster': value,
      if (instance.eMustahsilAktif case final value?) 'EMustahsilAktif': value,
      if (instance.muhasebeEntegre case final value?) 'MuhasebeEntegre': value,
      if (instance.muhFislerdeRefKodSorulsun case final value?)
        'MuhFislerdeRefKodSorulsun': value,
      if (instance.muhFislerdeRefKodSorulsunAktif case final value?)
        'MuhFislerdeRefKodSorulsun_Aktif': value,
      if (instance.muhFislerdeRefKodSorulsunPasif case final value?)
        'MuhFislerdeRefKodSorulsun_Pasif': value,
      if (instance.muhFislerdeRefKodSorulsunGelir case final value?)
        'MuhFislerdeRefKodSorulsun_Gelir': value,
      if (instance.muhFislerdeRefKodSorulsunGider case final value?)
        'MuhFislerdeRefKodSorulsun_Gider': value,
      if (instance.muhFislerdeRefKodSorulsunNazim case final value?)
        'MuhFislerdeRefKodSorulsun_Nazim': value,
      if (instance.alisOzelKod1Aktif case final value?)
        'AlisOzelKod1Aktif': value,
      if (instance.alisOzelKod2Aktif case final value?)
        'AlisOzelKod2Aktif': value,
      if (instance.alisOzelKod2Tablodan case final value?)
        'AlisOzelKod2Tablodan': value,
      if (instance.alisMiktar1Gelsin case final value?)
        'AlisMiktar1Gelsin': value,
      if (instance.satisMiktar1Gelsin case final value?)
        'SatisMiktar1Gelsin': value,
      if (instance.satisOzelKod2Tablodan case final value?)
        'SatisOzelKod2Tablodan': value,
      if (instance.seriCikislardaOtomatik case final value?)
        'SeriCikislardaOtomatik': value,
      if (instance.serideSaatOlsun case final value?) 'SerideSaatOlsun': value,
      if (instance.seriEIrsaliyeYanit case final value?)
        'SeriEIrsaliyeYanit': value,
      if (instance.datSatirBazindaDepoSorulsun case final value?)
        'DAT_SatirBazindaDepoSorulsun': value,
      if (instance.stokResimleriKlasorden case final value?)
        'StokResimleriKlasorden': value,
      if (instance.alisEkAlan1Aktif case final value?)
        'AlisEkAlan1Aktif': value,
      if (instance.alisEkMaliyet1KdvOrani case final value?)
        'AlisEkMaliyet1KdvOrani': value,
      if (instance.satisAciklamaAlaniGorunsun case final value?)
        'SatisAciklamaAlaniGorunsun': value,
      if (instance.satisMusteriSiptenSaticiSipAktif case final value?)
        'SatisMusteriSiptenSaticiSipAktif': value,
      if (instance.satisSipOnayAktif case final value?)
        'SatisSipOnayAktif': value,
      if (instance.satisMuhRefKodSorulsun case final value?)
        'SatisMuhRefKodSorulsun': value,
      if (instance.alisMuhRefKodSorulsun case final value?)
        'AlisMuhRefKodSorulsun': value,
      if (instance.satisEkMaliyet1KdvOrani case final value?)
        'SatisEkMaliyet1KdvOrani': value,
      if (instance.fatuSatisTeslimCarideBaglanmisCarilerSecilsin
          case final value?)
        'FatuSatisTeslimCarideBaglanmisCarilerSecilsin': value,
      if (instance.fatuAlisTeslimCarideBaglanmisCarilerSecilsin
          case final value?)
        'FatuAlisTeslimCarideBaglanmisCarilerSecilsin': value,
      if (instance.seriUrunBazindaTekOlsun case final value?)
        'SeriUrunBazindaTekOlsun': value,
      if (instance.eArsivAktif case final value?) 'EArsivAktif': value,
      if (instance.satisTeslimCarideBaglanmisCarilerSecilsin case final value?)
        'SatisTeslimCarideBaglanmisCarilerSecilsin': value,
      if (instance.alisTeslimCarideBaglanmisCarilerSecilsin case final value?)
        'AlisTeslimCarideBaglanmisCarilerSecilsin': value,
      if (instance.faturaSatisIadeUygulamasi case final value?)
        'FaturaSatisIadeUygulamasi': value,
      if (instance.cariRotaUygulamasi case final value?)
        'CariRotaUygulamasi': value,
    };

CariAktiviteTipleri _$CariAktiviteTipleriFromJson(Map<String, dynamic> json) =>
    CariAktiviteTipleri()
      ..aktiviteTipi = (json['AKTIVITE_TIPI'] as num?)?.toInt()
      ..aktiviteAdi = json['AKTIVITE_ADI'] as String?;

Map<String, dynamic> _$CariAktiviteTipleriToJson(
        CariAktiviteTipleri instance) =>
    <String, dynamic>{
      if (instance.aktiviteTipi case final value?) 'AKTIVITE_TIPI': value,
      if (instance.aktiviteAdi case final value?) 'AKTIVITE_ADI': value,
    };

CekSenParam _$CekSenParamFromJson(Map<String, dynamic> json) => CekSenParam()
  ..belgeTipi = json['BELGE_TIPI'] as String?
  ..dovizAktif = json['DOVIZ_AKTIF'] as String?
  ..verilenKoduIstensin = json['VERILEN_KODU_ISTENSIN'] as String?
  ..ekAciklamaKullan = json['EK_ACIKLAMA_KULLAN'] as String?
  ..cikistaBankaKodu = json['CIKISTA_BANKA_KODU'] as String?;

Map<String, dynamic> _$CekSenParamToJson(CekSenParam instance) =>
    <String, dynamic>{
      if (instance.belgeTipi case final value?) 'BELGE_TIPI': value,
      if (instance.dovizAktif case final value?) 'DOVIZ_AKTIF': value,
      if (instance.verilenKoduIstensin case final value?)
        'VERILEN_KODU_ISTENSIN': value,
      if (instance.ekAciklamaKullan case final value?)
        'EK_ACIKLAMA_KULLAN': value,
      if (instance.cikistaBankaKodu case final value?)
        'CIKISTA_BANKA_KODU': value,
    };

DepoList _$DepoListFromJson(Map<String, dynamic> json) => DepoList()
  ..depoKodu = (json['DEPO_KODU'] as num?)?.toInt()
  ..depoTanimi = json['DEPO_TANIMI'] as String?
  ..bakiyeTakibi = json['BAKIYE_TAKIBI'] as String?
  ..hucreTakibi = json['HUCRE_TAKIBI'] as String?
  ..subeKodu = (json['SUBE_KODU'] as num?)?.toInt();

Map<String, dynamic> _$DepoListToJson(DepoList instance) => <String, dynamic>{
      if (instance.depoKodu case final value?) 'DEPO_KODU': value,
      if (instance.depoTanimi case final value?) 'DEPO_TANIMI': value,
      if (instance.bakiyeTakibi case final value?) 'BAKIYE_TAKIBI': value,
      if (instance.hucreTakibi case final value?) 'HUCRE_TAKIBI': value,
      if (instance.subeKodu case final value?) 'SUBE_KODU': value,
    };

DovizList _$DovizListFromJson(Map<String, dynamic> json) => DovizList(
      dovizKodu: (json['DOVIZ_KODU'] as num?)?.toInt(),
      dovizTipi: (json['DOVIZ_TIPI'] as num?)?.toInt(),
      isim: json['ISIM'] as String?,
      alis: (json['ALIS'] as num?)?.toDouble(),
      satis: (json['SATIS'] as num?)?.toDouble(),
      efAlis: (json['EF_ALIS'] as num?)?.toDouble(),
      efSatis: (json['EF_SATIS'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$DovizListToJson(DovizList instance) => <String, dynamic>{
      if (instance.dovizKodu case final value?) 'DOVIZ_KODU': value,
      if (instance.dovizTipi case final value?) 'DOVIZ_TIPI': value,
      if (instance.isim case final value?) 'ISIM': value,
      if (instance.alis case final value?) 'ALIS': value,
      if (instance.satis case final value?) 'SATIS': value,
      if (instance.efAlis case final value?) 'EF_ALIS': value,
      if (instance.efSatis case final value?) 'EF_SATIS': value,
    };

KasaList _$KasaListFromJson(Map<String, dynamic> json) => KasaList()
  ..kasaKodu = json['KASA_KODU'] as String?
  ..kasaTanimi = json['KASA_TANIMI'] as String?
  ..subeKodu = (json['SUBE_KODU'] as num?)?.toInt()
  ..dovizli = json['DOVIZLI'] as String?
  ..dovizTipi = (json['DOVIZ_TIPI'] as num?)?.toInt()
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

Map<String, dynamic> _$KasaListToJson(KasaList instance) => <String, dynamic>{
      if (instance.kasaKodu case final value?) 'KASA_KODU': value,
      if (instance.kasaTanimi case final value?) 'KASA_TANIMI': value,
      if (instance.subeKodu case final value?) 'SUBE_KODU': value,
      if (instance.dovizli case final value?) 'DOVIZLI': value,
      if (instance.dovizTipi case final value?) 'DOVIZ_TIPI': value,
      if (instance.kkartKasasi case final value?) 'KKART_KASASI': value,
      if (instance.devirTutari case final value?) 'DEVIR_TUTARI': value,
      if (instance.dovizDevirTutari case final value?)
        'DOVIZ_DEVIR_TUTARI': value,
      if (instance.dovizAdi case final value?) 'DOVIZ_ADI': value,
      if (instance.toplamGiris case final value?) 'TOPLAM_GIRIS': value,
      if (instance.toplamCikis case final value?) 'TOPLAM_CIKIS': value,
      if (instance.bakiye case final value?) 'BAKIYE': value,
      if (instance.devirliBakiye case final value?) 'DEVIRLI_BAKIYE': value,
      if (instance.dovizToplamGiris case final value?)
        'DOVIZ_TOPLAM_GIRIS': value,
      if (instance.dovizToplamCikis case final value?)
        'DOVIZ_TOPLAM_CIKIS': value,
      if (instance.dovizBakiye case final value?) 'DOVIZ_BAKIYE': value,
      if (instance.devirliDovizBakiye case final value?)
        'DEVIRLI_DOVIZ_BAKIYE': value,
    };

ListCariOdemeKodu _$ListCariOdemeKoduFromJson(Map<String, dynamic> json) =>
    ListCariOdemeKodu()
      ..odemeKodu = json['ODEME_KODU'] as String?
      ..aciklama = json['ACIKLAMA'] as String?;

Map<String, dynamic> _$ListCariOdemeKoduToJson(ListCariOdemeKodu instance) =>
    <String, dynamic>{
      if (instance.odemeKodu case final value?) 'ODEME_KODU': value,
      if (instance.aciklama case final value?) 'ACIKLAMA': value,
    };

ListFatuEkMaliyet _$ListFatuEkMaliyetFromJson(Map<String, dynamic> json) =>
    ListFatuEkMaliyet()
      ..no = (json['NO'] as num?)?.toInt()
      ..belgeTipi = json['BELGE_TIPI'] as String?
      ..adi = json['ADI'] as String?;

Map<String, dynamic> _$ListFatuEkMaliyetToJson(ListFatuEkMaliyet instance) =>
    <String, dynamic>{
      if (instance.no case final value?) 'NO': value,
      if (instance.belgeTipi case final value?) 'BELGE_TIPI': value,
      if (instance.adi case final value?) 'ADI': value,
    };

ListIskTip _$ListIskTipFromJson(Map<String, dynamic> json) => ListIskTip()
  ..iskontoTipi = (json['ISKONTO_TIPI'] as num?)?.toInt()
  ..aciklama = json['ACIKLAMA'] as String?;

Map<String, dynamic> _$ListIskTipToJson(ListIskTip instance) =>
    <String, dynamic>{
      if (instance.iskontoTipi case final value?) 'ISKONTO_TIPI': value,
      if (instance.aciklama case final value?) 'ACIKLAMA': value,
    };

ListOzelKodTum _$ListOzelKodTumFromJson(Map<String, dynamic> json) =>
    ListOzelKodTum()
      ..kodTipi = (json['KOD_TIPI'] as num?)?.toInt()
      ..belgeTipi = json['BELGE_TIPI'] as String?
      ..kod = json['KOD'] as String?
      ..aciklama = json['ACIKLAMA'] as String?
      ..fiyatSirasi = (json['FIYAT_SIRASI'] as num?)?.toInt();

Map<String, dynamic> _$ListOzelKodTumToJson(ListOzelKodTum instance) =>
    <String, dynamic>{
      if (instance.kodTipi case final value?) 'KOD_TIPI': value,
      if (instance.belgeTipi case final value?) 'BELGE_TIPI': value,
      if (instance.kod case final value?) 'KOD': value,
      if (instance.aciklama case final value?) 'ACIKLAMA': value,
      if (instance.fiyatSirasi case final value?) 'FIYAT_SIRASI': value,
    };

MapEkAlanlar _$MapEkAlanlarFromJson(Map<String, dynamic> json) => MapEkAlanlar()
  ..caption = json['caption'] as String?
  ..fieldName = json['fieldName'] as String?
  ..veriTipi = json['-veriTipi'] as String?;

Map<String, dynamic> _$MapEkAlanlarToJson(MapEkAlanlar instance) =>
    <String, dynamic>{
      if (instance.caption case final value?) 'caption': value,
      if (instance.fieldName case final value?) 'fieldName': value,
      if (instance.veriTipi case final value?) '-veriTipi': value,
    };

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

Map<String, dynamic> _$MapCariKullSahalarToJson(MapCariKullSahalar instance) =>
    <String, dynamic>{
      if (instance.the1S case final value?) '1S': value,
      if (instance.the2S case final value?) '2S': value,
      if (instance.the3S case final value?) '3S': value,
      if (instance.the4S case final value?) '4S': value,
      if (instance.the5S case final value?) '5S': value,
      if (instance.the6S case final value?) '6S': value,
      if (instance.the7S case final value?) '7S': value,
      if (instance.the8S case final value?) '8S': value,
      if (instance.the1N case final value?) '1N': value,
      if (instance.the2N case final value?) '2N': value,
      if (instance.the3N case final value?) '3N': value,
      if (instance.the4N case final value?) '4N': value,
      if (instance.the5N case final value?) '5N': value,
      if (instance.the6N case final value?) '6N': value,
      if (instance.the7N case final value?) '7N': value,
      if (instance.the8N case final value?) '8N': value,
    };

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
        MapKdvSifirBelgeTipiOzelKod2 instance) =>
    <String, dynamic>{
      if (instance.dc case final value?) 'DC': value,
      if (instance.ac case final value?) 'AC': value,
      if (instance.ms case final value?) 'MS': value,
      if (instance.si case final value?) 'SI': value,
      if (instance.sf case final value?) 'SF': value,
      if (instance.stek case final value?) 'STEK': value,
    };

MapStokGrupAdlari _$MapStokGrupAdlariFromJson(Map<String, dynamic> json) =>
    MapStokGrupAdlari()
      ..grupKodu = json['GrupKodu'] as String?
      ..kod1 = json['Kod1']
      ..kod2 = json['Kod2']
      ..kod3 = json['Kod3']
      ..kod4 = json['Kod4']
      ..kod5 = json['Kod5'];

Map<String, dynamic> _$MapStokGrupAdlariToJson(MapStokGrupAdlari instance) =>
    <String, dynamic>{
      if (instance.grupKodu case final value?) 'GrupKodu': value,
      if (instance.kod1 case final value?) 'Kod1': value,
      if (instance.kod2 case final value?) 'Kod2': value,
      if (instance.kod3 case final value?) 'Kod3': value,
      if (instance.kod4 case final value?) 'Kod4': value,
      if (instance.kod5 case final value?) 'Kod5': value,
    };

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

Map<String, dynamic> _$MapStokKullSahalarToJson(MapStokKullSahalar instance) =>
    <String, dynamic>{
      if (instance.the1S case final value?) '1S': value,
      if (instance.the2S case final value?) '2S': value,
      if (instance.the3S case final value?) '3S': value,
      if (instance.the4S case final value?) '4S': value,
      if (instance.the5S case final value?) '5S': value,
      if (instance.the6S case final value?) '6S': value,
      if (instance.the7S case final value?) '7S': value,
      if (instance.the8S case final value?) '8S': value,
      if (instance.the1N case final value?) '1N': value,
      if (instance.the2N case final value?) '2N': value,
      if (instance.the3N case final value?) '3N': value,
      if (instance.the4N case final value?) '4N': value,
      if (instance.the5N case final value?) '5N': value,
      if (instance.the6N case final value?) '6N': value,
      if (instance.the7N case final value?) '7N': value,
      if (instance.the8N case final value?) '8N': value,
    };

MustahsilParam _$MustahsilParamFromJson(Map<String, dynamic> json) =>
    MustahsilParam()
      ..stopajOrani = (json['STOPAJ_ORANI'] as num?)?.toDouble()
      ..fonOrani = (json['FON_ORANI'] as num?)?.toDouble()
      ..borsaOrani = (json['BORSA_ORANI'] as num?)?.toDouble()
      ..bagkurOrani = (json['BAGKUR_ORANI'] as num?)?.toInt()
      ..bagkurYb = json['BAGKUR_YB'] as String?
      ..meraOrani = (json['MERA_ORANI'] as num?)?.toDouble()
      ..borsaUcretDuzenlemesi = json['BORSA_UCRET_DUZENLEMESI'] as String?;

Map<String, dynamic> _$MustahsilParamToJson(MustahsilParam instance) =>
    <String, dynamic>{
      if (instance.stopajOrani case final value?) 'STOPAJ_ORANI': value,
      if (instance.fonOrani case final value?) 'FON_ORANI': value,
      if (instance.borsaOrani case final value?) 'BORSA_ORANI': value,
      if (instance.bagkurOrani case final value?) 'BAGKUR_ORANI': value,
      if (instance.bagkurYb case final value?) 'BAGKUR_YB': value,
      if (instance.meraOrani case final value?) 'MERA_ORANI': value,
      if (instance.borsaUcretDuzenlemesi case final value?)
        'BORSA_UCRET_DUZENLEMESI': value,
    };

NetFectDizaynList _$NetFectDizaynListFromJson(Map<String, dynamic> json) =>
    NetFectDizaynList()
      ..id = (json['ID'] as num?)?.toInt()
      ..dizaynYeri = json['DIZAYN_YERI'] as String?
      ..dizaynYolu = json['DIZAYN_YOLU'] as String?
      ..dizaynAdi = json['DIZAYN_ADI'] as String?
      ..ozelKod = json['OZEL_KOD'] as String?
      ..kopyaSayisi = (json['KOPYA_SAYISI'] as num?)?.toInt()
      ..sablonVar = json['SABLON_VAR'] as String?
      ..aktif = json['AKTIF'] as String?
      ..dosyaAdi = json['DOSYA_ADI'] as String?
      ..parametreler = json['PARAMETRELER'] as String?
      ..varsayilanMi = json['VARSAYILAN_MI'] as bool?
      ..detayKod = json['DETAY_KOD'] as String?;

Map<String, dynamic> _$NetFectDizaynListToJson(NetFectDizaynList instance) =>
    <String, dynamic>{
      if (instance.id case final value?) 'ID': value,
      if (instance.dizaynYeri case final value?) 'DIZAYN_YERI': value,
      if (instance.dizaynYolu case final value?) 'DIZAYN_YOLU': value,
      if (instance.dizaynAdi case final value?) 'DIZAYN_ADI': value,
      if (instance.ozelKod case final value?) 'OZEL_KOD': value,
      if (instance.kopyaSayisi case final value?) 'KOPYA_SAYISI': value,
      if (instance.sablonVar case final value?) 'SABLON_VAR': value,
      if (instance.aktif case final value?) 'AKTIF': value,
      if (instance.dosyaAdi case final value?) 'DOSYA_ADI': value,
      if (instance.parametreler case final value?) 'PARAMETRELER': value,
      if (instance.varsayilanMi case final value?) 'VARSAYILAN_MI': value,
      if (instance.detayKod case final value?) 'DETAY_KOD': value,
    };

NetsisOndalikResponseModel _$NetsisOndalikResponseModelFromJson(
        Map<String, dynamic> json) =>
    NetsisOndalikResponseModel()
      ..modul = json['MODUL'] as String?
      ..miktar = (json['MIKTAR'] as num?)?.toInt()
      ..fiyat = (json['FIYAT'] as num?)?.toInt()
      ..tutar = (json['TUTAR'] as num?)?.toInt()
      ..kur = (json['KUR'] as num?)?.toInt()
      ..doviz = (json['DOVIZ'] as num?)?.toInt()
      ..dovizFiyati = (json['DOVIZ_FIYATI'] as num?)?.toInt()
      ..oran = (json['ORAN'] as num?)?.toInt();

Map<String, dynamic> _$NetsisOndalikResponseModelToJson(
        NetsisOndalikResponseModel instance) =>
    <String, dynamic>{
      if (instance.modul case final value?) 'MODUL': value,
      if (instance.miktar case final value?) 'MIKTAR': value,
      if (instance.fiyat case final value?) 'FIYAT': value,
      if (instance.tutar case final value?) 'TUTAR': value,
      if (instance.kur case final value?) 'KUR': value,
      if (instance.doviz case final value?) 'DOVIZ': value,
      if (instance.dovizFiyati case final value?) 'DOVIZ_FIYATI': value,
      if (instance.oran case final value?) 'ORAN': value,
    };

PlasiyerList _$PlasiyerListFromJson(Map<String, dynamic> json) => PlasiyerList(
      plasiyerKodu: json['PLASIYER_KODU'] as String?,
      plasiyerAciklama: json['PLASIYER_ACIKLAMA'] as String?,
    );

Map<String, dynamic> _$PlasiyerListToJson(PlasiyerList instance) =>
    <String, dynamic>{
      if (instance.plasiyerKodu case final value?) 'PLASIYER_KODU': value,
      if (instance.plasiyerAciklama case final value?)
        'PLASIYER_ACIKLAMA': value,
    };

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

Map<String, dynamic> _$SatirAcikBaslikListToJson(
        SatirAcikBaslikList instance) =>
    <String, dynamic>{
      if (instance.belgeKodu case final value?) 'BELGE_KODU': value,
      if (instance.aciklama1 case final value?) 'ACIKLAMA1': value,
      if (instance.aciklama2 case final value?) 'ACIKLAMA2': value,
      if (instance.aciklama3 case final value?) 'ACIKLAMA3': value,
      if (instance.aciklama4 case final value?) 'ACIKLAMA4': value,
      if (instance.aciklama5 case final value?) 'ACIKLAMA5': value,
      if (instance.aciklama6 case final value?) 'ACIKLAMA6': value,
      if (instance.aciklama7 case final value?) 'ACIKLAMA7': value,
      if (instance.aciklama8 case final value?) 'ACIKLAMA8': value,
      if (instance.aciklama9 case final value?) 'ACIKLAMA9': value,
      if (instance.aciklama10 case final value?) 'ACIKLAMA10': value,
    };

StokDetayliAramaAlanlar _$StokDetayliAramaAlanlarFromJson(
        Map<String, dynamic> json) =>
    StokDetayliAramaAlanlar(
      searchField: json['SearchField'] as String?,
      name: json['Name'] as String?,
      searchCriter: json['SearchCriter'] as String?,
      searchText: json['SearchText'] as String?,
    );

Map<String, dynamic> _$StokDetayliAramaAlanlarToJson(
        StokDetayliAramaAlanlar instance) =>
    <String, dynamic>{
      if (instance.searchField case final value?) 'SearchField': value,
      if (instance.name case final value?) 'Name': value,
      if (instance.searchCriter case final value?) 'SearchCriter': value,
      if (instance.searchText case final value?) 'SearchText': value,
    };

SubeList _$SubeListFromJson(Map<String, dynamic> json) => SubeList()
  ..sirket = json['SIRKET'] as String?
  ..isletmeKodu = (json['ISLETME_KODU'] as num?)?.toInt()
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
  ..subeKodu = (json['SUBE_KODU'] as num?)?.toInt()
  ..cariKodu = json['CARI_KODU'] as String?
  ..cariAdi = json['CARI_ADI'] as String?;

Map<String, dynamic> _$SubeListToJson(SubeList instance) => <String, dynamic>{
      if (instance.sirket case final value?) 'SIRKET': value,
      if (instance.isletmeKodu case final value?) 'ISLETME_KODU': value,
      if (instance.subeAdi case final value?) 'SUBE_ADI': value,
      if (instance.isletmeAdi case final value?) 'ISLETME_ADI': value,
      if (instance.lokalDepoAktif case final value?) 'LOKAL_DEPO_AKTIF': value,
      if (instance.merkezmi case final value?) 'MERKEZMI': value,
      if (instance.adres case final value?) 'ADRES': value,
      if (instance.telefon case final value?) 'TELEFON': value,
      if (instance.faks case final value?) 'FAKS': value,
      if (instance.email case final value?) 'EMAIL': value,
      if (instance.ilAdi case final value?) 'IL_ADI': value,
      if (instance.ilce case final value?) 'ILCE': value,
      if (instance.vergiNumarasi case final value?) 'VERGI_NUMARASI': value,
      if (instance.vergiDairesi case final value?) 'VERGI_DAIRESI': value,
      if (instance.paraBirimi case final value?) 'PARA_BIRIMI': value,
      if (instance.paraBirimiKusurat case final value?)
        'PARA_BIRIMI_KUSURAT': value,
      if (instance.subeKodu case final value?) 'SUBE_KODU': value,
      if (instance.cariKodu case final value?) 'CARI_KODU': value,
      if (instance.cariAdi case final value?) 'CARI_ADI': value,
    };

TalTekParam _$TalTekParamFromJson(Map<String, dynamic> json) => TalTekParam()
  ..tip = (json['TIP'] as num?)?.toInt()
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
  ..aciklar3 = json['ACIKLAR3'] as String?
  ..aciklar4 = json['ACIKLAR4'] as String?
  ..aciklar5 = json['ACIKLAR5'] as String?
  ..aciklar6 = json['ACIKLAR6'] as String?
  ..aciklar7 = json['ACIKLAR7'] as String?
  ..aciklar8 = json['ACIKLAR8'] as String?
  ..aciklar9 = json['ACIKLAR9'] as String?
  ..aciklar10 = json['ACIKLAR10'] as String?
  ..aciklar11 = json['ACIKLAR11'] as String?
  ..aciklar12 = json['ACIKLAR12'] as String?
  ..aciklar13 = json['ACIKLAR13'] as String?
  ..aciklar14 = json['ACIKLAR14'] as String?
  ..aciklar15 = json['ACIKLAR15'] as String?
  ..aciklar16 = json['ACIKLAR16'] as String?
  ..satirdaKdvSor = json['SATIRDA_KDV_SOR'] as String?
  ..satirTeslimTarSor = json['SATIR_TESLIM_TAR_SOR'] as String?
  ..dovizTakipHangisi = (json['DOVIZ_TAKIP_HANGISI'] as num?)?.toInt()
  ..satirEkalan2Kullan = json['SATIR_EKALAN2_KULLAN'] as String?
  ..hizmetUygulamasi = json['HIZMET_UYGULAMASI'] as String?
  ..hizmetDepoKodu = (json['HIZMET_DEPO_KODU'] as num?)?.toInt()
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

Map<String, dynamic> _$TalTekParamToJson(TalTekParam instance) =>
    <String, dynamic>{
      if (instance.tip case final value?) 'TIP': value,
      if (instance.belgeTipi case final value?) 'BELGE_TIPI': value,
      if (instance.dovizTakip case final value?) 'DOVIZ_TAKIP': value,
      if (instance.satirIskontoSayisi case final value?)
        'SATIR_ISKONTO_SAYISI': value,
      if (instance.farkliBirimlerdenIslem case final value?)
        'FARKLI_BIRIMLERDEN_ISLEM': value,
      if (instance.farkliTeslimYeri case final value?)
        'FARKLI_TESLIM_YERI': value,
      if (instance.depoStokKartindanGelsin case final value?)
        'DEPO_STOK_KARTINDAN_GELSIN': value,
      if (instance.ekaciklamalarAktif case final value?)
        'EKACIKLAMALAR_AKTIF': value,
      if (instance.ozelKod1Aktif case final value?) 'OZEL_KOD1_AKTIF': value,
      if (instance.ozelKod1Secim11 case final value?)
        'OZEL_KOD1_SECIM11': value,
      if (instance.ozelKod1Secim21 case final value?)
        'OZEL_KOD1_SECIM21': value,
      if (instance.ozelKod1Secim31 case final value?)
        'OZEL_KOD1_SECIM31': value,
      if (instance.ozelKod1Secim41 case final value?)
        'OZEL_KOD1_SECIM41': value,
      if (instance.ozelKod2Aktif case final value?) 'OZEL_KOD2_AKTIF': value,
      if (instance.aciklar1 case final value?) 'ACIKLAR1': value,
      if (instance.aciklar2 case final value?) 'ACIKLAR2': value,
      if (instance.aciklar3 case final value?) 'ACIKLAR3': value,
      if (instance.aciklar4 case final value?) 'ACIKLAR4': value,
      if (instance.aciklar5 case final value?) 'ACIKLAR5': value,
      if (instance.aciklar6 case final value?) 'ACIKLAR6': value,
      if (instance.aciklar7 case final value?) 'ACIKLAR7': value,
      if (instance.aciklar8 case final value?) 'ACIKLAR8': value,
      if (instance.aciklar9 case final value?) 'ACIKLAR9': value,
      if (instance.aciklar10 case final value?) 'ACIKLAR10': value,
      if (instance.aciklar11 case final value?) 'ACIKLAR11': value,
      if (instance.aciklar12 case final value?) 'ACIKLAR12': value,
      if (instance.aciklar13 case final value?) 'ACIKLAR13': value,
      if (instance.aciklar14 case final value?) 'ACIKLAR14': value,
      if (instance.aciklar15 case final value?) 'ACIKLAR15': value,
      if (instance.aciklar16 case final value?) 'ACIKLAR16': value,
      if (instance.satirdaKdvSor case final value?) 'SATIRDA_KDV_SOR': value,
      if (instance.satirTeslimTarSor case final value?)
        'SATIR_TESLIM_TAR_SOR': value,
      if (instance.dovizTakipHangisi case final value?)
        'DOVIZ_TAKIP_HANGISI': value,
      if (instance.satirEkalan2Kullan case final value?)
        'SATIR_EKALAN2_KULLAN': value,
      if (instance.hizmetUygulamasi case final value?)
        'HIZMET_UYGULAMASI': value,
      if (instance.hizmetDepoKodu case final value?) 'HIZMET_DEPO_KODU': value,
      if (instance.kalemlerdeAciklamaAktif case final value?)
        'KALEMLERDE_ACIKLAMA_AKTIF': value,
      if (instance.onaySistemiKullan case final value?)
        'ONAY_SISTEMI_KULLAN': value,
      if (instance.kdvHaric case final value?) 'KDV_HARIC': value,
      if (instance.kdvDahilHaricSor case final value?)
        'KDV_DAHIL_HARIC_SOR': value,
      if (instance.ozelKod2Tablodan case final value?)
        'OZEL_KOD2_TABLODAN': value,
      if (instance.muhrefkodSorulsun case final value?)
        'MUHREFKOD_SORULSUN': value,
      if (instance.topluDepoKullan case final value?)
        'TOPLU_DEPO_KULLAN': value,
      if (instance.kosulAktif case final value?) 'KOSUL_AKTIF': value,
      if (instance.satirIskontosu case final value?) 'SATIR_ISKONTOSU': value,
      if (instance.yuzdeSorulsun case final value?) 'YUZDE_SORULSUN': value,
      if (instance.malFazlasiIskonto case final value?)
        'MAL_FAZLASI_ISKONTO': value,
      if (instance.genIsk1Aktif case final value?) 'GEN_ISK1_AKTIF': value,
      if (instance.genIsk1Adi case final value?) 'GEN_ISK1_ADI': value,
      if (instance.genIsk2Aktif case final value?) 'GEN_ISK2_AKTIF': value,
      if (instance.genIsk2Adi case final value?) 'GEN_ISK2_ADI': value,
      if (instance.genIsk3Aktif case final value?) 'GEN_ISK3_AKTIF': value,
      if (instance.genIsk3Adi case final value?) 'GEN_ISK3_ADI': value,
      if (instance.ozelKod1Tablodan case final value?)
        'OZEL_KOD1_TABLODAN': value,
      if (instance.aciklamaAktif case final value?) 'ACIKLAMA_AKTIF': value,
      if (instance.miktar2Sor case final value?) 'MIKTAR2_SOR': value,
      if (instance.miktarBirGelsin case final value?)
        'MIKTAR_BIR_GELSIN': value,
      if (instance.varsayilanMuhrefkod case final value?)
        'VARSAYILAN_MUHREFKOD': value,
      if (instance.tutardanBirimFiata case final value?)
        'TUTARDAN_BIRIM_FIATA': value,
      if (instance.cariIskSatiraUygula case final value?)
        'CARI_ISK_SATIRA_UYGULA': value,
      if (instance.miktarSifirOlamaz case final value?)
        'MIKTAR_SIFIR_OLAMAZ': value,
      if (instance.fatAltm1Varmi case final value?) 'FAT_ALTM1_VARMI': value,
      if (instance.fatAltm2Varmi case final value?) 'FAT_ALTM2_VARMI': value,
      if (instance.fatAltm1Tanim case final value?) 'FAT_ALTM1_TANIM': value,
      if (instance.fatAltm2Tanim case final value?) 'FAT_ALTM2_TANIM': value,
      if (instance.kdvSifirlanacakOzelkod2 case final value?)
        'KDV_SIFIRLANACAK_OZELKOD2': value,
      if (instance.kosulSatirdaAktif case final value?)
        'KOSUL_SATIRDA_AKTIF': value,
    };

YaziciList _$YaziciListFromJson(Map<String, dynamic> json) => YaziciList()
  ..yaziciAdi = json['YAZICI_ADI'] as String?
  ..yaziciTipi = json['YAZICI_TIPI'] as String?
  ..aciklama = json['ACIKLAMA'] as String?;

Map<String, dynamic> _$YaziciListToJson(YaziciList instance) =>
    <String, dynamic>{
      if (instance.yaziciAdi case final value?) 'YAZICI_ADI': value,
      if (instance.yaziciTipi case final value?) 'YAZICI_TIPI': value,
      if (instance.aciklama case final value?) 'ACIKLAMA': value,
    };
