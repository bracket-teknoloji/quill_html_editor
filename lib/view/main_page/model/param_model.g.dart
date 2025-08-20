// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'param_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DepoListAdapter extends TypeAdapter<DepoList> {
  @override
  final typeId = 3;

  @override
  DepoList read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DepoList()
      ..depoKodu = (fields[0] as num?)?.toInt()
      ..depoTanimi = fields[1] as String?
      ..bakiyeTakibi = fields[2] as String?
      .._hucreTakibi = fields[3] as String?
      ..subeKodu = (fields[4] as num?)?.toInt();
  }

  @override
  void write(BinaryWriter writer, DepoList obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.depoKodu)
      ..writeByte(1)
      ..write(obj.depoTanimi)
      ..writeByte(2)
      ..write(obj.bakiyeTakibi)
      ..writeByte(3)
      ..write(obj._hucreTakibi)
      ..writeByte(4)
      ..write(obj.subeKodu);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DepoListAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class NetFectDizaynListAdapter extends TypeAdapter<NetFectDizaynList> {
  @override
  final typeId = 47;

  @override
  NetFectDizaynList read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return NetFectDizaynList()
      ..id = (fields[0] as num?)?.toInt()
      ..dizaynYeri = fields[1] as String?
      ..dizaynYolu = fields[2] as String?
      ..dizaynAdi = fields[3] as String?
      ..ozelKod = fields[4] as String?
      ..kopyaSayisi = (fields[5] as num?)?.toInt()
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
  final typeId = 48;

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
          json['MapCariKullSahalar'] as Map<String, dynamic>,
        )
  ..mapCariEkAlanlar = (json['MapCariEkAlanlar'] as List<dynamic>?)
      ?.map((e) => MapEkAlanlar.fromJson(e as Map<String, dynamic>))
      .toList()
  ..sabitSayfalamaOgeSayisi =
      (json['sabitSayfalamaOgeSayisi'] as num?)?.toInt() ?? 25
  ..netsisOndalikResponseModel =
      (json['_NetsisOndalikResponseModel'] as List<dynamic>?)
          ?.map(
            (e) =>
                NetsisOndalikResponseModel.fromJson(e as Map<String, dynamic>),
          )
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
          json['MapStokGrupAdlari'] as Map<String, dynamic>,
        )
  ..mustahsilParam = json['MustahsilParam'] == null
      ? null
      : MustahsilParam.fromJson(json['MustahsilParam'] as Map<String, dynamic>)
  ..listFatuEkMaliyet = (json['ListFatuEkMaliyet'] as List<dynamic>?)
      ?.map((e) => ListFatuEkMaliyet.fromJson(e as Map<String, dynamic>))
      .toList()
  ..mapKdvSifirBelgeTipiOzelKod2 = json['MapKdvSifirBelgeTipiOzelKod2'] == null
      ? null
      : MapKdvSifirBelgeTipiOzelKod2.fromJson(
          json['MapKdvSifirBelgeTipiOzelKod2'] as Map<String, dynamic>,
        )
  ..lokalDepoUygulamasiAcik = json['LokalDepoUygulamasiAcik'] as bool?
  ..esnekYapilandir = json['EsnekYapilandir'] as bool?
  ..ozelFiyatSistemi = json['OzelFiyatSistemi'] as bool?
  ..sadeceOzelFiyatSistemi = json['SadeceOzelFiyatSistemi'] as String?
  ..otvliStoklarVar = json['OtvliStoklarVar'] as bool?
  ..mapStokKullSahalar = json['MapStokKullSahalar'] == null
      ? null
      : MapStokKullSahalar.fromJson(
          json['MapStokKullSahalar'] as Map<String, dynamic>,
        )
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
  ..satisOzelKod1Tablodan = json['SatisOzelKod1Tablodan'] as bool?
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
  ..alisDovizTakipHangiDeger = (json['AlisDovizTakipHangiDeger'] as num?)
      ?.toInt()
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
  ..satisDovizTakipHangiDeger = (json['SatisDovizTakipHangiDeger'] as num?)
      ?.toInt()
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
  ..arrEIrsSeri = (json['ArrEIrsSeri'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList()
  ..arrEFatSeri = (json['ArrEFatSeri'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList()
  ..arrEArSeri = (json['ArrEArSeri'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList()
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
  ..stokDetayliAramaAlanlar =
      (json['Stok_DetayliAramaAlanlar'] as List<dynamic>?)
          ?.map(
            (e) => StokDetayliAramaAlanlar.fromJson(e as Map<String, dynamic>),
          )
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
  ..alisEkMaliyet1KdvOrani = (json['AlisEkMaliyet1KdvOrani'] as num?)
      ?.toDouble()
  ..satisAciklamaAlaniGorunsun = json['SatisAciklamaAlaniGorunsun'] as bool?
  ..alisAciklamaAlaniGorunsun = json['AlisAciklamaAlaniGorunsun'] as bool?
  ..satisMusteriSiptenSaticiSipAktif =
      json['SatisMusteriSiptenSaticiSipAktif'] as bool?
  ..satisSipOnayAktif = json['SatisSipOnayAktif'] as bool?
  ..satisMuhRefKodSorulsun = json['SatisMuhRefKodSorulsun'] as bool?
  ..alisMuhRefKodSorulsun = json['AlisMuhRefKodSorulsun'] as bool?
  ..satisEkMaliyet1KdvOrani = (json['SatisEkMaliyet1KdvOrani'] as num?)
      ?.toDouble()
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
  ..cariRotaUygulamasi = json['CariRotaUygulamasi'] as String?
  ..sevkEmriYeniKullaniciSistemi = json['sevkEmriYeniKullaniciSistemi'] as bool?
  ..fatuEkMaliyet3FieldVar = json['fatuEkMaliyet3FieldVar'] as bool?
  ..clientTimeoutSeconds = (json['ClientTimeoutSeconds'] as num?)?.toInt()
  ..alisIhracatMiktarStoklaraGecsin =
      json['AlisIhracatMiktarStoklaraGecsin'] as bool?
  ..satisIhracatMiktarStoklaraGecsin =
      json['SatisIhracatMiktarStoklaraGecsin'] as bool?
  ..seriOpsiyonelSahalar = (json['SeriOpsiyonelSahalar'] as num?)?.toInt()
  ..uretimMiktar2Uyg = json['UretimMiktar2Uyg'] as bool?
  ..uretimFireUyg = json['UretimFireUyg'] as bool?
  ..uretimFireDetayUyg = json['UretimFireDetayUyg'] as bool?
  ..netsisOzelParamFaturaOzelIletisimVergisi =
      json['NetsisOzelParam_FaturaOzelIletisimVergisi'] as bool?
  ..eMailSunucu = json['eMail_Sunucu'] as String?
  ..eMailMailAdresi = json['eMail_MailAdresi'] as String?
  ..eMailParola = json['eMail_Parola'] as String?
  ..eMailPort = (json['eMail_Port'] as num?)?.toInt()
  ..eMailSslKullan = json['eMail_SSLKullan'] as bool?
  ..sevkEmriMalTopFazlaTeslimat = json['SevkEmriMalTopFazlaTeslimat'] as String?
  ..sayKull1S = json['say_Kull1S'] as String?
  ..sayKull2S = json['say_Kull2S'] as String?
  ..sayKull3S = json['say_Kull3S'] as String?
  ..sayKull4S = json['say_Kull4S'] as String?
  ..sayKull5S = json['say_Kull5S'] as String?
  ..alisSatirBazindaVade = json['AlisSatirBazindaVade'] as bool?
  ..satisSatirBazindaVade = json['SatisSatirBazindaVade'] as bool?
  ..netOpenXePosta = json['NetOpenXEPosta'] as String?
  ..netOpenXLog = json['NetOpenXLog'] as String?
  ..sayfalamaKayitSayisi = (json['SayfalamaKayitSayisi'] as num?)?.toInt()
  ..fieldVarSatisIrsaliyeFaturalasmayacak =
      json['FieldVar_SatisIrsaliyeFaturalasmayacak'] as bool?
  ..fieldVarSatisFaturasiIadeFaturaNo =
      json['FieldVar_SatisFaturasiIadeFaturaNo'] as bool?;

Map<String, dynamic> _$ParamModelToJson(
  ParamModel instance,
) => <String, dynamic>{
  'ParamYuklendi': ?instance.paramYuklendi,
  'KULLANICI': ?instance.kullanici,
  'SIRKET': ?instance.sirket,
  'ISLETME_KODU': ?instance.isletmeKodu,
  'MapCariKullSahalar': ?instance.mapCariKullSahalar?.toJson(),
  'MapCariEkAlanlar': ?instance.mapCariEkAlanlar
      ?.map((e) => e.toJson())
      .toList(),
  'sabitSayfalamaOgeSayisi': instance.sabitSayfalamaOgeSayisi,
  '_NetsisOndalikResponseModel': ?instance.netsisOndalikResponseModel
      ?.map((e) => e.toJson())
      .toList(),
  'DepoList': ?instance.depoList?.map((e) => e.toJson()).toList(),
  'DovizList': ?instance.dovizList?.map((e) => e.toJson()).toList(),
  'SatirAcikBaslikList': ?instance.satirAcikBaslikList
      ?.map((e) => e.toJson())
      .toList(),
  'KasaList': ?instance.kasaList?.map((e) => e.toJson()).toList(),
  'PlasiyerList': ?instance.plasiyerList?.map((e) => e.toJson()).toList(),
  'PlasiyerListTumu': ?instance.plasiyerListTumu
      ?.map((e) => e.toJson())
      .toList(),
  'SubeList': ?instance.subeList?.map((e) => e.toJson()).toList(),
  'TalTekParam': ?instance.talTekParam?.map((e) => e.toJson()).toList(),
  'CekSenParam': ?instance.cekSenParam?.map((e) => e.toJson()).toList(),
  'ListOzelKodTum': ?instance.listOzelKodTum?.map((e) => e.toJson()).toList(),
  'ListIskTip': ?instance.listIskTip?.map((e) => e.toJson()).toList(),
  'ListCariOdemeKodu': ?instance.listCariOdemeKodu
      ?.map((e) => e.toJson())
      .toList(),
  'YaziciList': ?instance.yaziciList?.map((e) => e.toJson()).toList(),
  'NetFectDizaynList': ?instance.netFectDizaynList
      ?.map((e) => e.toJson())
      .toList(),
  'MapStokGrupAdlari': ?instance.mapStokGrupAdlari?.toJson(),
  'MustahsilParam': ?instance.mustahsilParam?.toJson(),
  'ListFatuEkMaliyet': ?instance.listFatuEkMaliyet
      ?.map((e) => e.toJson())
      .toList(),
  'MapKdvSifirBelgeTipiOzelKod2': ?instance.mapKdvSifirBelgeTipiOzelKod2
      ?.toJson(),
  'LokalDepoUygulamasiAcik': ?instance.lokalDepoUygulamasiAcik,
  'EsnekYapilandir': ?instance.esnekYapilandir,
  'OzelFiyatSistemi': ?instance.ozelFiyatSistemi,
  'SadeceOzelFiyatSistemi': ?instance.sadeceOzelFiyatSistemi,
  'OtvliStoklarVar': ?instance.otvliStoklarVar,
  'MapStokKullSahalar': ?instance.mapStokKullSahalar?.toJson(),
  'MapStokEkAlanlar': ?instance.mapStokEkAlanlar
      ?.map((e) => e.toJson())
      .toList(),
  'KarmaKoliUyg': ?instance.karmaKoliUyg,
  'AlisEkAciklamalarAktif': ?instance.alisEkAciklamalarAktif,
  'AlisEkAciklamaTanimi1': ?instance.alisEkAciklamaTanimi1,
  'AlisEkAciklamaTanimi2': ?instance.alisEkAciklamaTanimi2,
  'AlisEkAciklamaTanimi3': ?instance.alisEkAciklamaTanimi3,
  'AlisEkAciklamaTanimi4': ?instance.alisEkAciklamaTanimi4,
  'AlisEkAciklamaTanimi5': ?instance.alisEkAciklamaTanimi5,
  'AlisEkAciklamaTanimi6': ?instance.alisEkAciklamaTanimi6,
  'AlisEkAciklamaTanimi7': ?instance.alisEkAciklamaTanimi7,
  'AlisEkAciklamaTanimi8': ?instance.alisEkAciklamaTanimi8,
  'AlisEkAciklamaTanimi9': ?instance.alisEkAciklamaTanimi9,
  'AlisEkAciklamaTanimi10': ?instance.alisEkAciklamaTanimi10,
  'AlisEkAciklamaTanimi11': ?instance.alisEkAciklamaTanimi11,
  'AlisEkAciklamaTanimi12': ?instance.alisEkAciklamaTanimi12,
  'AlisEkAciklamaTanimi13': ?instance.alisEkAciklamaTanimi13,
  'AlisEkAciklamaTanimi14': ?instance.alisEkAciklamaTanimi14,
  'AlisEkAciklamaTanimi15': ?instance.alisEkAciklamaTanimi15,
  'AlisEkAciklamaTanimi16': ?instance.alisEkAciklamaTanimi16,
  'AlisOzelKod1Tablodan': ?instance.alisOzelKod1Tablodan,
  'SatisOzelKod1Tablodan': ?instance.satisOzelKod1Tablodan,
  'AlisKosulAktif': ?instance.alisKosulAktif,
  'AlisFarkliTeslimCariAktif': ?instance.alisFarkliTeslimCariAktif,
  'AlisMalFazMiktarIskontoAcik': ?instance.alisMalFazMiktarIskontoAcik,
  'AlisSatirKademeliIskontoAcik': ?instance.alisSatirKademeliIskontoAcik,
  'AlisSatirKademeliIskontoSayisi': ?instance.alisSatirKademeliIskontoSayisi,
  'AlisGenIsk1Aktif': ?instance.alisGenIsk1Aktif,
  'AlisGenIsk2Aktif': ?instance.alisGenIsk2Aktif,
  'AlisGenIsk3Aktif': ?instance.alisGenIsk3Aktif,
  'AlisTopluDepoAktif': ?instance.alisTopluDepoAktif,
  'AlisStokDepoKarttanGelsin': ?instance.alisStokDepoKarttanGelsin,
  'AlisGenellikleKDVHaric': ?instance.alisGenellikleKdvHaric,
  'AlisFarkliOlcuBirimleriKullan': ?instance.alisFarkliOlcuBirimleriKullan,
  'AlisDovizAktif': ?instance.alisDovizAktif,
  'AlisSatirdaKDVSor': ?instance.alisSatirdaKdvSor,
  'AlisSatirdaAciklamalarAktif': ?instance.alisSatirdaAciklamalarAktif,
  'AlisSatirdaEkAlan2Aktif': ?instance.alisSatirdaEkAlan2Aktif,
  'AlisEkMaliyet2Aktif': ?instance.alisEkMaliyet2Aktif,
  'AlisEkMaliyet2Adi': ?instance.alisEkMaliyet2Adi,
  'AlisTevkifatPay': ?instance.alisTevkifatPay,
  'AlisTevkifatPayda': ?instance.alisTevkifatPayda,
  'AlisFaturaFiyatSifirGecilsin': ?instance.alisFaturaFiyatSifirGecilsin,
  'AlisFazlaTeslimat': ?instance.alisFazlaTeslimat,
  'AlisDovizTakipHangiDeger': ?instance.alisDovizTakipHangiDeger,
  'AlisHizmetAktif': ?instance.alisHizmetAktif,
  'AlisHizmetDepoKodu': ?instance.alisHizmetDepoKodu,
  'AlisMiktar2Sor': ?instance.alisMiktar2Sor,
  'AlisSatirdaTeslimTarihiSor': ?instance.alisSatirdaTeslimTarihiSor,
  'AlisFisSeriTakibiVar': ?instance.alisFisSeriTakibiVar,
  'AlisTutardanFiyataGecilsin': ?instance.alisTutardanFiyataGecilsin,
  'AlisCariIskSatiraUygula': ?instance.alisCariIskSatiraUygula,
  'SeriUygulamasiAcik': ?instance.seriUygulamasiAcik,
  'SirketDovizUygulamasiAcik': ?instance.sirketDovizUygulamasiAcik,
  'SirketDovizUygulamasiDovizKodu': ?instance.sirketDovizUygulamasiDovizKodu,
  'PlasiyerUygulamasi': ?instance.plasiyerUygulamasi,
  'ParaBirimi': ?instance.paraBirimi,
  'BankaEntegre': ?instance.bankaEntegre,
  'BagliCariVar': ?instance.bagliCariVar,
  'ProjeUygulamasiAcik': ?instance.projeUygulamasiAcik,
  'SatisOzelKod1Aktif': ?instance.satisOzelKod1Aktif,
  'SatisOzelKod2Aktif': ?instance.satisOzelKod2Aktif,
  'SatisEkAciklamalarAktif': ?instance.satisEkAciklamalarAktif,
  'SatisEkAciklamaTanimi1': ?instance.satisEkAciklamaTanimi1,
  'SatisEkAciklamaTanimi2': ?instance.satisEkAciklamaTanimi2,
  'SatisEkAciklamaTanimi3': ?instance.satisEkAciklamaTanimi3,
  'SatisEkAciklamaTanimi4': ?instance.satisEkAciklamaTanimi4,
  'SatisEkAciklamaTanimi5': ?instance.satisEkAciklamaTanimi5,
  'SatisEkAciklamaTanimi6': ?instance.satisEkAciklamaTanimi6,
  'SatisEkAciklamaTanimi7': ?instance.satisEkAciklamaTanimi7,
  'SatisEkAciklamaTanimi8': ?instance.satisEkAciklamaTanimi8,
  'SatisEkAciklamaTanimi9': ?instance.satisEkAciklamaTanimi9,
  'SatisEkAciklamaTanimi10': ?instance.satisEkAciklamaTanimi10,
  'SatisEkAciklamaTanimi11': ?instance.satisEkAciklamaTanimi11,
  'SatisEkAciklamaTanimi12': ?instance.satisEkAciklamaTanimi12,
  'SatisEkAciklamaTanimi13': ?instance.satisEkAciklamaTanimi13,
  'SatisEkAciklamaTanimi14': ?instance.satisEkAciklamaTanimi14,
  'SatisEkAciklamaTanimi15': ?instance.satisEkAciklamaTanimi15,
  'SatisEkAciklamaTanimi16': ?instance.satisEkAciklamaTanimi16,
  'SatisSatirIsk1YuzdeSor': ?instance.satisSatirIsk1YuzdeSor,
  'SatisKosulAktif': ?instance.satisKosulAktif,
  'SatisKosulSatirdaSor': ?instance.satisKosulSatirdaSor,
  'SatisFarkliTeslimCariAktif': ?instance.satisFarkliTeslimCariAktif,
  'SatisMalFazMiktarIskontoAcik': ?instance.satisMalFazMiktarIskontoAcik,
  'SatisSatirKademeliIskontoAcik': ?instance.satisSatirKademeliIskontoAcik,
  'SatisSatirKademeliIskontoSayisi': ?instance.satisSatirKademeliIskontoSayisi,
  'SatisSatirdaKDVSor': ?instance.satisSatirdaKdvSor,
  'SatisGenIsk1Aktif': ?instance.satisGenIsk1Aktif,
  'SatisGenIsk2Aktif': ?instance.satisGenIsk2Aktif,
  'SatisGenIsk3Aktif': ?instance.satisGenIsk3Aktif,
  'SatisTopluDepoAktif': ?instance.satisTopluDepoAktif,
  'SatisStokDepoKarttanGelsin': ?instance.satisStokDepoKarttanGelsin,
  'SatisGenellikleKDVHaric': ?instance.satisGenellikleKdvHaric,
  'SatisFarkliOlcuBirimleriKullan': ?instance.satisFarkliOlcuBirimleriKullan,
  'SatisCariRiskTakibi': ?instance.satisCariRiskTakibi,
  'SatisDovizAktif': ?instance.satisDovizAktif,
  'SatisSatirdaAciklamalarAktif': ?instance.satisSatirdaAciklamalarAktif,
  'SatisSatirdaEkAlan2Aktif': ?instance.satisSatirdaEkAlan2Aktif,
  'SatisEkMaliyet2Aktif': ?instance.satisEkMaliyet2Aktif,
  'SatisEkMaliyet2Adi': ?instance.satisEkMaliyet2Adi,
  'SatisTevkifatPay': ?instance.satisTevkifatPay,
  'SatisTevkifatPayda': ?instance.satisTevkifatPayda,
  'SatisFaturaFiyatSifirGecilsin': ?instance.satisFaturaFiyatSifirGecilsin,
  'SatisFazlaTeslimat': ?instance.satisFazlaTeslimat,
  'SatisDovizTakipHangiDeger': ?instance.satisDovizTakipHangiDeger,
  'SatisHizmetAktif': ?instance.satisHizmetAktif,
  'SatisHizmetDepoKodu': ?instance.satisHizmetDepoKodu,
  'SatisMiktar2Sor': ?instance.satisMiktar2Sor,
  'SatisSubeDATOnaylansin': ?instance.satisSubeDatOnaylansin,
  'SatisSatirdaTeslimTarihiSor': ?instance.satisSatirdaTeslimTarihiSor,
  'SatisSatirdaIsEmriSorulsun': ?instance.satisSatirdaIsEmriSorulsun,
  'SatisFisSeriTakibiVar': ?instance.satisFisSeriTakibiVar,
  'SatisIrsCariHesaba': ?instance.satisIrsCariHesaba,
  'SatisEkAlan1Aktif': ?instance.satisEkAlan1Aktif,
  'SatisDATSiparisTakibi': ?instance.satisDatSiparisTakibi,
  'SatisIrsFatuSipVadeDegissin': ?instance.satisIrsFatuSipVadeDegissin,
  'KonsinyeUygulamasi': ?instance.konsinyeUygulamasi,
  'MSenetDovizAktif': ?instance.mSenetDovizAktif,
  'MCekDovizAktif': ?instance.mCekDovizAktif,
  'MCekAciklamaAktif': ?instance.mCekAciklamaAktif,
  'SeriGirislerdeOtomatik': ?instance.seriGirislerdeOtomatik,
  'SerideYilOlsun': ?instance.serideYilOlsun,
  'SerideAyOlsun': ?instance.serideAyOlsun,
  'SerideGunOlsun': ?instance.serideGunOlsun,
  'SeriUzunlugu': ?instance.seriUzunlugu,
  'SeriEkAlanList': ?instance.seriEkAlanList,
  'EFaturaAktif': ?instance.eFaturaAktif,
  'Seri_EFatura': ?instance.seriEFatura,
  'EFaturaSenaryoDegistir': ?instance.eFaturaSenaryoDegistir,
  'EIrsaliyeAktif': ?instance.eIrsaliyeAktif,
  'SeriEIrsaliye': ?instance.seriEIrsaliye,
  'ArrEIrsSeri': ?instance.arrEIrsSeri,
  'ArrEFatSeri': ?instance.arrEFatSeri,
  'ArrEArSeri': ?instance.arrEArSeri,
  'Seri_EArsiv': ?instance.seriEArsiv,
  'UretimEkAlanKullan': ?instance.uretimEkAlanKullan,
  'OzelFaturaIadeMaliyetiZorunlu': ?instance.ozelFaturaIadeMaliyetiZorunlu,
  'bankaKKartiKasayaIsle': ?instance.bankaKKartiKasayaIsle,
  'KayitliBankaHesapTipleri': ?instance.kayitliBankaHesapTipleri,
  'KKNoZorunluDegil': ?instance.kkNoZorunluDegil,
  'FifoLifoYontem': ?instance.fifoLifoYontem,
  'CariAktiviteUygulamasi': ?instance.cariAktiviteUygulamasi,
  'CariAktiviteTipleri': ?instance.cariAktiviteTipleri
      ?.map((e) => e.toJson())
      .toList(),
  'CariAktiviteEkAlanlar': ?instance.cariAktiviteEkAlanlar,
  'SatisCariDovizTipiniKullan': ?instance.satisCariDovizTipiniKullan,
  'AlisCariDovizTipiniKullan': ?instance.alisCariDovizTipiniKullan,
  'Fatu_KontrolAciklamasiAktif': ?instance.fatuKontrolAciklamasiAktif,
  'SatisFiyatGrubuSorulacakAlan': ?instance.satisFiyatGrubuSorulacakAlan,
  'Siparis_FarkliSubeUyg': ?instance.siparisFarkliSubeUyg,
  'SatisIskEkSahadanGelsin': ?instance.satisIskEkSahadanGelsin,
  'SatisIsk1Saha': ?instance.satisIsk1Saha,
  'SatisIsk1Kullanim': ?instance.satisIsk1Kullanim,
  'Uretim_MalTop_HangiHucrede': ?instance.uretimMalTopHangiHucrede,
  'Uretim_MalTop_FazlaTeslimYapilabilir':
      ?instance.uretimMalTopFazlaTeslimYapilabilir,
  'Uretim_USK_SeriGirilsin': ?instance.uretimUskSeriGirilsin,
  'Finans_BankaIslemModulu': ?instance.finansBankaIslemModulu,
  'Finans_BankaTcmbBankaKodu': ?instance.finansBankaTcmbBankaKodu,
  'Finans_BankaTcmbSubeKodu': ?instance.finansBankaTcmbSubeKodu,
  'Finans_CekSenOzelOrtalamaVadeGunuHesapla':
      ?instance.finansCekSenOzelOrtalamaVadeGunuHesapla,
  'Stok_Yap_RehberTipi': ?instance.stokYapRehberTipi,
  'Stok_KanbanBarkodEslemeUyg': ?instance.stokKanbanBarkodEslemeUyg,
  'Stok_SeriParcalamaUyg': ?instance.stokSeriParcalamaUyg,
  'Stok_DetayliAramaAlanlar': ?instance.stokDetayliAramaAlanlar
      ?.map((e) => e.toJson())
      .toList(),
  'Genel_KonumTakibiYapilsin': ?instance.genelKonumTakibiYapilsin,
  'Genel_KonumTakibiDakika': ?instance.genelKonumTakibiDakika,
  'Genel_KonumTakibiMetre': ?instance.genelKonumTakibiMetre,
  'UetdsEsyaAktif': ?instance.uetdsEsyaAktif,
  'SatistaSiparisKullan': ?instance.satistaSiparisKullan,
  'AlistaSiparisKullan': ?instance.alistaSiparisKullan,
  'SipOtoEslestir': ?instance.sipOtoEslestir,
  'SevkEmriTerminalFatura': ?instance.sevkEmriTerminalFatura,
  'SevkEmriTerminalIrsaliye': ?instance.sevkEmriTerminalIrsaliye,
  'SevkEmriTerminalTransfer': ?instance.sevkEmriTerminalTransfer,
  'SevkEmriHucreKontrol': ?instance.sevkEmriHucreKontrol,
  'SevkEmriMalTopGorunecekAlanlar': ?instance.sevkEmriMalTopGorunecekAlanlar,
  'Seri_SevkIrsaliye': ?instance.seriSevkIrsaliye,
  'KontrolluBelgeAktarimAktif': ?instance.kontrolluBelgeAktarimAktif,
  'KontrolluBelgeAktarimBelgeNoGoster':
      ?instance.kontrolluBelgeAktarimBelgeNoGoster,
  'EMustahsilAktif': ?instance.eMustahsilAktif,
  'MuhasebeEntegre': ?instance.muhasebeEntegre,
  'MuhFislerdeRefKodSorulsun': ?instance.muhFislerdeRefKodSorulsun,
  'MuhFislerdeRefKodSorulsun_Aktif': ?instance.muhFislerdeRefKodSorulsunAktif,
  'MuhFislerdeRefKodSorulsun_Pasif': ?instance.muhFislerdeRefKodSorulsunPasif,
  'MuhFislerdeRefKodSorulsun_Gelir': ?instance.muhFislerdeRefKodSorulsunGelir,
  'MuhFislerdeRefKodSorulsun_Gider': ?instance.muhFislerdeRefKodSorulsunGider,
  'MuhFislerdeRefKodSorulsun_Nazim': ?instance.muhFislerdeRefKodSorulsunNazim,
  'AlisOzelKod1Aktif': ?instance.alisOzelKod1Aktif,
  'AlisOzelKod2Aktif': ?instance.alisOzelKod2Aktif,
  'AlisOzelKod2Tablodan': ?instance.alisOzelKod2Tablodan,
  'AlisMiktar1Gelsin': ?instance.alisMiktar1Gelsin,
  'SatisMiktar1Gelsin': ?instance.satisMiktar1Gelsin,
  'SatisOzelKod2Tablodan': ?instance.satisOzelKod2Tablodan,
  'SeriCikislardaOtomatik': ?instance.seriCikislardaOtomatik,
  'SerideSaatOlsun': ?instance.serideSaatOlsun,
  'SeriEIrsaliyeYanit': ?instance.seriEIrsaliyeYanit,
  'DAT_SatirBazindaDepoSorulsun': ?instance.datSatirBazindaDepoSorulsun,
  'StokResimleriKlasorden': ?instance.stokResimleriKlasorden,
  'AlisEkAlan1Aktif': ?instance.alisEkAlan1Aktif,
  'AlisEkMaliyet1KdvOrani': ?instance.alisEkMaliyet1KdvOrani,
  'SatisAciklamaAlaniGorunsun': ?instance.satisAciklamaAlaniGorunsun,
  'AlisAciklamaAlaniGorunsun': ?instance.alisAciklamaAlaniGorunsun,
  'SatisMusteriSiptenSaticiSipAktif':
      ?instance.satisMusteriSiptenSaticiSipAktif,
  'SatisSipOnayAktif': ?instance.satisSipOnayAktif,
  'SatisMuhRefKodSorulsun': ?instance.satisMuhRefKodSorulsun,
  'AlisMuhRefKodSorulsun': ?instance.alisMuhRefKodSorulsun,
  'SatisEkMaliyet1KdvOrani': ?instance.satisEkMaliyet1KdvOrani,
  'FatuSatisTeslimCarideBaglanmisCarilerSecilsin':
      ?instance.fatuSatisTeslimCarideBaglanmisCarilerSecilsin,
  'FatuAlisTeslimCarideBaglanmisCarilerSecilsin':
      ?instance.fatuAlisTeslimCarideBaglanmisCarilerSecilsin,
  'SeriUrunBazindaTekOlsun': ?instance.seriUrunBazindaTekOlsun,
  'EArsivAktif': ?instance.eArsivAktif,
  'SatisTeslimCarideBaglanmisCarilerSecilsin':
      ?instance.satisTeslimCarideBaglanmisCarilerSecilsin,
  'AlisTeslimCarideBaglanmisCarilerSecilsin':
      ?instance.alisTeslimCarideBaglanmisCarilerSecilsin,
  'FaturaSatisIadeUygulamasi': ?instance.faturaSatisIadeUygulamasi,
  'CariRotaUygulamasi': ?instance.cariRotaUygulamasi,
  'sevkEmriYeniKullaniciSistemi': ?instance.sevkEmriYeniKullaniciSistemi,
  'fatuEkMaliyet3FieldVar': ?instance.fatuEkMaliyet3FieldVar,
  'ClientTimeoutSeconds': ?instance.clientTimeoutSeconds,
  'AlisIhracatMiktarStoklaraGecsin': ?instance.alisIhracatMiktarStoklaraGecsin,
  'SatisIhracatMiktarStoklaraGecsin':
      ?instance.satisIhracatMiktarStoklaraGecsin,
  'SeriOpsiyonelSahalar': ?instance.seriOpsiyonelSahalar,
  'UretimMiktar2Uyg': ?instance.uretimMiktar2Uyg,
  'UretimFireUyg': ?instance.uretimFireUyg,
  'UretimFireDetayUyg': ?instance.uretimFireDetayUyg,
  'NetsisOzelParam_FaturaOzelIletisimVergisi':
      ?instance.netsisOzelParamFaturaOzelIletisimVergisi,
  'eMail_Sunucu': ?instance.eMailSunucu,
  'eMail_MailAdresi': ?instance.eMailMailAdresi,
  'eMail_Parola': ?instance.eMailParola,
  'eMail_Port': ?instance.eMailPort,
  'eMail_SSLKullan': ?instance.eMailSslKullan,
  'SevkEmriMalTopFazlaTeslimat': ?instance.sevkEmriMalTopFazlaTeslimat,
  'say_Kull1S': ?instance.sayKull1S,
  'say_Kull2S': ?instance.sayKull2S,
  'say_Kull3S': ?instance.sayKull3S,
  'say_Kull4S': ?instance.sayKull4S,
  'say_Kull5S': ?instance.sayKull5S,
  'AlisSatirBazindaVade': ?instance.alisSatirBazindaVade,
  'SatisSatirBazindaVade': ?instance.satisSatirBazindaVade,
  'NetOpenXEPosta': ?instance.netOpenXePosta,
  'NetOpenXLog': ?instance.netOpenXLog,
  'SayfalamaKayitSayisi': ?instance.sayfalamaKayitSayisi,
  'FieldVar_SatisIrsaliyeFaturalasmayacak':
      ?instance.fieldVarSatisIrsaliyeFaturalasmayacak,
  'FieldVar_SatisFaturasiIadeFaturaNo':
      ?instance.fieldVarSatisFaturasiIadeFaturaNo,
};

CariAktiviteTipleri _$CariAktiviteTipleriFromJson(Map<String, dynamic> json) =>
    CariAktiviteTipleri()
      ..aktiviteTipi = (json['AKTIVITE_TIPI'] as num?)?.toInt()
      ..aktiviteAdi = json['AKTIVITE_ADI'] as String?;

Map<String, dynamic> _$CariAktiviteTipleriToJson(
  CariAktiviteTipleri instance,
) => <String, dynamic>{
  'AKTIVITE_TIPI': ?instance.aktiviteTipi,
  'AKTIVITE_ADI': ?instance.aktiviteAdi,
};

CekSenParam _$CekSenParamFromJson(Map<String, dynamic> json) => CekSenParam()
  ..belgeTipi = json['BELGE_TIPI'] as String?
  ..dovizAktif = json['DOVIZ_AKTIF'] as String?
  ..verilenKoduIstensin = json['VERILEN_KODU_ISTENSIN'] as String?
  ..ekAciklamaKullan = json['EK_ACIKLAMA_KULLAN'] as String?
  ..cikistaBankaKodu = json['CIKISTA_BANKA_KODU'] as String?;

Map<String, dynamic> _$CekSenParamToJson(CekSenParam instance) =>
    <String, dynamic>{
      'BELGE_TIPI': ?instance.belgeTipi,
      'DOVIZ_AKTIF': ?instance.dovizAktif,
      'VERILEN_KODU_ISTENSIN': ?instance.verilenKoduIstensin,
      'EK_ACIKLAMA_KULLAN': ?instance.ekAciklamaKullan,
      'CIKISTA_BANKA_KODU': ?instance.cikistaBankaKodu,
    };

DepoList _$DepoListFromJson(Map<String, dynamic> json) => DepoList()
  ..depoKodu = (json['DEPO_KODU'] as num?)?.toInt()
  ..depoTanimi = json['DEPO_TANIMI'] as String?
  ..bakiyeTakibi = json['BAKIYE_TAKIBI'] as String?
  ..subeKodu = (json['SUBE_KODU'] as num?)?.toInt();

Map<String, dynamic> _$DepoListToJson(DepoList instance) => <String, dynamic>{
  'DEPO_KODU': ?instance.depoKodu,
  'DEPO_TANIMI': ?instance.depoTanimi,
  'BAKIYE_TAKIBI': ?instance.bakiyeTakibi,
  'SUBE_KODU': ?instance.subeKodu,
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
  'DOVIZ_KODU': ?instance.dovizKodu,
  'DOVIZ_TIPI': ?instance.dovizTipi,
  'ISIM': ?instance.isim,
  'ALIS': ?instance.alis,
  'SATIS': ?instance.satis,
  'EF_ALIS': ?instance.efAlis,
  'EF_SATIS': ?instance.efSatis,
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
  'KASA_KODU': ?instance.kasaKodu,
  'KASA_TANIMI': ?instance.kasaTanimi,
  'SUBE_KODU': ?instance.subeKodu,
  'DOVIZLI': ?instance.dovizli,
  'DOVIZ_TIPI': ?instance.dovizTipi,
  'KKART_KASASI': ?instance.kkartKasasi,
  'DEVIR_TUTARI': ?instance.devirTutari,
  'DOVIZ_DEVIR_TUTARI': ?instance.dovizDevirTutari,
  'DOVIZ_ADI': ?instance.dovizAdi,
  'TOPLAM_GIRIS': ?instance.toplamGiris,
  'TOPLAM_CIKIS': ?instance.toplamCikis,
  'BAKIYE': ?instance.bakiye,
  'DEVIRLI_BAKIYE': ?instance.devirliBakiye,
  'DOVIZ_TOPLAM_GIRIS': ?instance.dovizToplamGiris,
  'DOVIZ_TOPLAM_CIKIS': ?instance.dovizToplamCikis,
  'DOVIZ_BAKIYE': ?instance.dovizBakiye,
  'DEVIRLI_DOVIZ_BAKIYE': ?instance.devirliDovizBakiye,
};

ListCariOdemeKodu _$ListCariOdemeKoduFromJson(Map<String, dynamic> json) =>
    ListCariOdemeKodu()
      ..odemeKodu = json['ODEME_KODU'] as String?
      ..aciklama = json['ACIKLAMA'] as String?;

Map<String, dynamic> _$ListCariOdemeKoduToJson(ListCariOdemeKodu instance) =>
    <String, dynamic>{
      'ODEME_KODU': ?instance.odemeKodu,
      'ACIKLAMA': ?instance.aciklama,
    };

ListFatuEkMaliyet _$ListFatuEkMaliyetFromJson(Map<String, dynamic> json) =>
    ListFatuEkMaliyet()
      ..no = (json['NO'] as num?)?.toInt()
      ..belgeTipi = json['BELGE_TIPI'] as String?
      ..adi = json['ADI'] as String?;

Map<String, dynamic> _$ListFatuEkMaliyetToJson(ListFatuEkMaliyet instance) =>
    <String, dynamic>{
      'NO': ?instance.no,
      'BELGE_TIPI': ?instance.belgeTipi,
      'ADI': ?instance.adi,
    };

ListIskTip _$ListIskTipFromJson(Map<String, dynamic> json) => ListIskTip()
  ..iskontoTipi = (json['ISKONTO_TIPI'] as num?)?.toInt()
  ..aciklama = json['ACIKLAMA'] as String?;

Map<String, dynamic> _$ListIskTipToJson(ListIskTip instance) =>
    <String, dynamic>{
      'ISKONTO_TIPI': ?instance.iskontoTipi,
      'ACIKLAMA': ?instance.aciklama,
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
      'KOD_TIPI': ?instance.kodTipi,
      'BELGE_TIPI': ?instance.belgeTipi,
      'KOD': ?instance.kod,
      'ACIKLAMA': ?instance.aciklama,
      'FIYAT_SIRASI': ?instance.fiyatSirasi,
    };

MapEkAlanlar _$MapEkAlanlarFromJson(Map<String, dynamic> json) => MapEkAlanlar()
  ..caption = json['caption'] as String?
  ..fieldName = json['fieldName'] as String?
  ..veriTipi = json['-veriTipi'] as String?;

Map<String, dynamic> _$MapEkAlanlarToJson(MapEkAlanlar instance) =>
    <String, dynamic>{
      'caption': ?instance.caption,
      'fieldName': ?instance.fieldName,
      '-veriTipi': ?instance.veriTipi,
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
      '1S': ?instance.the1S,
      '2S': ?instance.the2S,
      '3S': ?instance.the3S,
      '4S': ?instance.the4S,
      '5S': ?instance.the5S,
      '6S': ?instance.the6S,
      '7S': ?instance.the7S,
      '8S': ?instance.the8S,
      '1N': ?instance.the1N,
      '2N': ?instance.the2N,
      '3N': ?instance.the3N,
      '4N': ?instance.the4N,
      '5N': ?instance.the5N,
      '6N': ?instance.the6N,
      '7N': ?instance.the7N,
      '8N': ?instance.the8N,
    };

MapKdvSifirBelgeTipiOzelKod2 _$MapKdvSifirBelgeTipiOzelKod2FromJson(
  Map<String, dynamic> json,
) => MapKdvSifirBelgeTipiOzelKod2()
  ..dc = json['DC'] as String?
  ..ac = json['AC'] as String?
  ..ms = json['MS'] as String?
  ..si = json['SI'] as String?
  ..sf = json['SF'] as String?
  ..stek = json['STEK'] as String?;

Map<String, dynamic> _$MapKdvSifirBelgeTipiOzelKod2ToJson(
  MapKdvSifirBelgeTipiOzelKod2 instance,
) => <String, dynamic>{
  'DC': ?instance.dc,
  'AC': ?instance.ac,
  'MS': ?instance.ms,
  'SI': ?instance.si,
  'SF': ?instance.sf,
  'STEK': ?instance.stek,
};

MapStokGrupAdlari _$MapStokGrupAdlariFromJson(Map<String, dynamic> json) =>
    MapStokGrupAdlari()
      ..grupKodu = json['GrupKodu'] as String?
      ..kod1 = json['Kod1'] as String?
      ..kod2 = json['Kod2'] as String?
      ..kod3 = json['Kod3'] as String?
      ..kod4 = json['Kod4'] as String?
      ..kod5 = json['Kod5'] as String?;

Map<String, dynamic> _$MapStokGrupAdlariToJson(MapStokGrupAdlari instance) =>
    <String, dynamic>{
      'GrupKodu': ?instance.grupKodu,
      'Kod1': ?instance.kod1,
      'Kod2': ?instance.kod2,
      'Kod3': ?instance.kod3,
      'Kod4': ?instance.kod4,
      'Kod5': ?instance.kod5,
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
      '1S': ?instance.the1S,
      '2S': ?instance.the2S,
      '3S': ?instance.the3S,
      '4S': ?instance.the4S,
      '5S': ?instance.the5S,
      '6S': ?instance.the6S,
      '7S': ?instance.the7S,
      '8S': ?instance.the8S,
      '1N': ?instance.the1N,
      '2N': ?instance.the2N,
      '3N': ?instance.the3N,
      '4N': ?instance.the4N,
      '5N': ?instance.the5N,
      '6N': ?instance.the6N,
      '7N': ?instance.the7N,
      '8N': ?instance.the8N,
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
      'STOPAJ_ORANI': ?instance.stopajOrani,
      'FON_ORANI': ?instance.fonOrani,
      'BORSA_ORANI': ?instance.borsaOrani,
      'BAGKUR_ORANI': ?instance.bagkurOrani,
      'BAGKUR_YB': ?instance.bagkurYb,
      'MERA_ORANI': ?instance.meraOrani,
      'BORSA_UCRET_DUZENLEMESI': ?instance.borsaUcretDuzenlemesi,
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
      'ID': ?instance.id,
      'DIZAYN_YERI': ?instance.dizaynYeri,
      'DIZAYN_YOLU': ?instance.dizaynYolu,
      'DIZAYN_ADI': ?instance.dizaynAdi,
      'OZEL_KOD': ?instance.ozelKod,
      'KOPYA_SAYISI': ?instance.kopyaSayisi,
      'SABLON_VAR': ?instance.sablonVar,
      'AKTIF': ?instance.aktif,
      'DOSYA_ADI': ?instance.dosyaAdi,
      'PARAMETRELER': ?instance.parametreler,
      'VARSAYILAN_MI': ?instance.varsayilanMi,
      'DETAY_KOD': ?instance.detayKod,
    };

NetsisOndalikResponseModel _$NetsisOndalikResponseModelFromJson(
  Map<String, dynamic> json,
) => NetsisOndalikResponseModel()
  ..modul = json['MODUL'] as String?
  ..miktar = (json['MIKTAR'] as num?)?.toInt()
  ..fiyat = (json['FIYAT'] as num?)?.toInt()
  ..tutar = (json['TUTAR'] as num?)?.toInt()
  ..kur = (json['KUR'] as num?)?.toInt()
  ..doviz = (json['DOVIZ'] as num?)?.toInt()
  ..dovizFiyati = (json['DOVIZ_FIYATI'] as num?)?.toInt()
  ..oran = (json['ORAN'] as num?)?.toInt();

Map<String, dynamic> _$NetsisOndalikResponseModelToJson(
  NetsisOndalikResponseModel instance,
) => <String, dynamic>{
  'MODUL': ?instance.modul,
  'MIKTAR': ?instance.miktar,
  'FIYAT': ?instance.fiyat,
  'TUTAR': ?instance.tutar,
  'KUR': ?instance.kur,
  'DOVIZ': ?instance.doviz,
  'DOVIZ_FIYATI': ?instance.dovizFiyati,
  'ORAN': ?instance.oran,
};

PlasiyerList _$PlasiyerListFromJson(Map<String, dynamic> json) => PlasiyerList(
  plasiyerKodu: json['PLASIYER_KODU'] as String?,
  plasiyerAciklama: json['PLASIYER_ACIKLAMA'] as String?,
);

Map<String, dynamic> _$PlasiyerListToJson(PlasiyerList instance) =>
    <String, dynamic>{
      'PLASIYER_KODU': ?instance.plasiyerKodu,
      'PLASIYER_ACIKLAMA': ?instance.plasiyerAciklama,
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
  SatirAcikBaslikList instance,
) => <String, dynamic>{
  'BELGE_KODU': ?instance.belgeKodu,
  'ACIKLAMA1': ?instance.aciklama1,
  'ACIKLAMA2': ?instance.aciklama2,
  'ACIKLAMA3': ?instance.aciklama3,
  'ACIKLAMA4': ?instance.aciklama4,
  'ACIKLAMA5': ?instance.aciklama5,
  'ACIKLAMA6': ?instance.aciklama6,
  'ACIKLAMA7': ?instance.aciklama7,
  'ACIKLAMA8': ?instance.aciklama8,
  'ACIKLAMA9': ?instance.aciklama9,
  'ACIKLAMA10': ?instance.aciklama10,
};

StokDetayliAramaAlanlar _$StokDetayliAramaAlanlarFromJson(
  Map<String, dynamic> json,
) => StokDetayliAramaAlanlar(
  searchField: json['SearchField'] as String?,
  name: json['Name'] as String?,
  searchCriter: json['SearchCriter'] as String?,
  searchText: json['SearchText'] as String?,
);

Map<String, dynamic> _$StokDetayliAramaAlanlarToJson(
  StokDetayliAramaAlanlar instance,
) => <String, dynamic>{
  'SearchField': ?instance.searchField,
  'Name': ?instance.name,
  'SearchCriter': ?instance.searchCriter,
  'SearchText': ?instance.searchText,
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
  'SIRKET': ?instance.sirket,
  'ISLETME_KODU': ?instance.isletmeKodu,
  'SUBE_ADI': ?instance.subeAdi,
  'ISLETME_ADI': ?instance.isletmeAdi,
  'LOKAL_DEPO_AKTIF': ?instance.lokalDepoAktif,
  'MERKEZMI': ?instance.merkezmi,
  'ADRES': ?instance.adres,
  'TELEFON': ?instance.telefon,
  'FAKS': ?instance.faks,
  'EMAIL': ?instance.email,
  'IL_ADI': ?instance.ilAdi,
  'ILCE': ?instance.ilce,
  'VERGI_NUMARASI': ?instance.vergiNumarasi,
  'VERGI_DAIRESI': ?instance.vergiDairesi,
  'PARA_BIRIMI': ?instance.paraBirimi,
  'PARA_BIRIMI_KUSURAT': ?instance.paraBirimiKusurat,
  'SUBE_KODU': ?instance.subeKodu,
  'CARI_KODU': ?instance.cariKodu,
  'CARI_ADI': ?instance.cariAdi,
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
      'TIP': ?instance.tip,
      'BELGE_TIPI': ?instance.belgeTipi,
      'DOVIZ_TAKIP': ?instance.dovizTakip,
      'SATIR_ISKONTO_SAYISI': ?instance.satirIskontoSayisi,
      'FARKLI_BIRIMLERDEN_ISLEM': ?instance.farkliBirimlerdenIslem,
      'FARKLI_TESLIM_YERI': ?instance.farkliTeslimYeri,
      'DEPO_STOK_KARTINDAN_GELSIN': ?instance.depoStokKartindanGelsin,
      'EKACIKLAMALAR_AKTIF': ?instance.ekaciklamalarAktif,
      'OZEL_KOD1_AKTIF': ?instance.ozelKod1Aktif,
      'OZEL_KOD1_SECIM11': ?instance.ozelKod1Secim11,
      'OZEL_KOD1_SECIM21': ?instance.ozelKod1Secim21,
      'OZEL_KOD1_SECIM31': ?instance.ozelKod1Secim31,
      'OZEL_KOD1_SECIM41': ?instance.ozelKod1Secim41,
      'OZEL_KOD2_AKTIF': ?instance.ozelKod2Aktif,
      'ACIKLAR1': ?instance.aciklar1,
      'ACIKLAR2': ?instance.aciklar2,
      'ACIKLAR3': ?instance.aciklar3,
      'ACIKLAR4': ?instance.aciklar4,
      'ACIKLAR5': ?instance.aciklar5,
      'ACIKLAR6': ?instance.aciklar6,
      'ACIKLAR7': ?instance.aciklar7,
      'ACIKLAR8': ?instance.aciklar8,
      'ACIKLAR9': ?instance.aciklar9,
      'ACIKLAR10': ?instance.aciklar10,
      'ACIKLAR11': ?instance.aciklar11,
      'ACIKLAR12': ?instance.aciklar12,
      'ACIKLAR13': ?instance.aciklar13,
      'ACIKLAR14': ?instance.aciklar14,
      'ACIKLAR15': ?instance.aciklar15,
      'ACIKLAR16': ?instance.aciklar16,
      'SATIRDA_KDV_SOR': ?instance.satirdaKdvSor,
      'SATIR_TESLIM_TAR_SOR': ?instance.satirTeslimTarSor,
      'DOVIZ_TAKIP_HANGISI': ?instance.dovizTakipHangisi,
      'SATIR_EKALAN2_KULLAN': ?instance.satirEkalan2Kullan,
      'HIZMET_UYGULAMASI': ?instance.hizmetUygulamasi,
      'HIZMET_DEPO_KODU': ?instance.hizmetDepoKodu,
      'KALEMLERDE_ACIKLAMA_AKTIF': ?instance.kalemlerdeAciklamaAktif,
      'ONAY_SISTEMI_KULLAN': ?instance.onaySistemiKullan,
      'KDV_HARIC': ?instance.kdvHaric,
      'KDV_DAHIL_HARIC_SOR': ?instance.kdvDahilHaricSor,
      'OZEL_KOD2_TABLODAN': ?instance.ozelKod2Tablodan,
      'MUHREFKOD_SORULSUN': ?instance.muhrefkodSorulsun,
      'TOPLU_DEPO_KULLAN': ?instance.topluDepoKullan,
      'KOSUL_AKTIF': ?instance.kosulAktif,
      'SATIR_ISKONTOSU': ?instance.satirIskontosu,
      'YUZDE_SORULSUN': ?instance.yuzdeSorulsun,
      'MAL_FAZLASI_ISKONTO': ?instance.malFazlasiIskonto,
      'GEN_ISK1_AKTIF': ?instance.genIsk1Aktif,
      'GEN_ISK1_ADI': ?instance.genIsk1Adi,
      'GEN_ISK2_AKTIF': ?instance.genIsk2Aktif,
      'GEN_ISK2_ADI': ?instance.genIsk2Adi,
      'GEN_ISK3_AKTIF': ?instance.genIsk3Aktif,
      'GEN_ISK3_ADI': ?instance.genIsk3Adi,
      'OZEL_KOD1_TABLODAN': ?instance.ozelKod1Tablodan,
      'ACIKLAMA_AKTIF': ?instance.aciklamaAktif,
      'MIKTAR2_SOR': ?instance.miktar2Sor,
      'MIKTAR_BIR_GELSIN': ?instance.miktarBirGelsin,
      'VARSAYILAN_MUHREFKOD': ?instance.varsayilanMuhrefkod,
      'TUTARDAN_BIRIM_FIATA': ?instance.tutardanBirimFiata,
      'CARI_ISK_SATIRA_UYGULA': ?instance.cariIskSatiraUygula,
      'MIKTAR_SIFIR_OLAMAZ': ?instance.miktarSifirOlamaz,
      'FAT_ALTM1_VARMI': ?instance.fatAltm1Varmi,
      'FAT_ALTM2_VARMI': ?instance.fatAltm2Varmi,
      'FAT_ALTM1_TANIM': ?instance.fatAltm1Tanim,
      'FAT_ALTM2_TANIM': ?instance.fatAltm2Tanim,
      'KDV_SIFIRLANACAK_OZELKOD2': ?instance.kdvSifirlanacakOzelkod2,
      'KOSUL_SATIRDA_AKTIF': ?instance.kosulSatirdaAktif,
    };

YaziciList _$YaziciListFromJson(Map<String, dynamic> json) => YaziciList()
  ..yaziciAdi = json['YAZICI_ADI'] as String?
  ..yaziciTipi = json['YAZICI_TIPI'] as String?
  ..aciklama = json['ACIKLAMA'] as String?;

Map<String, dynamic> _$YaziciListToJson(YaziciList instance) =>
    <String, dynamic>{
      'YAZICI_ADI': ?instance.yaziciAdi,
      'YAZICI_TIPI': ?instance.yaziciTipi,
      'ACIKLAMA': ?instance.aciklama,
    };
