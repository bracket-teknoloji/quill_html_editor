// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profil_yetki_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProfilYetkiModel _$ProfilYetkiModelFromJson(
  Map<String, dynamic> json,
) => ProfilYetkiModel()
  ..yazdirmaSatisIrsYazicilari =
      (json['yazdirma_SatisIrs_Yazicilari'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList()
  ..yazdirmaDizaynSatisIrs =
      (json['yazdirma_Dizayn_SatisIrs'] as List<dynamic>?)
          ?.map((e) => (e as num).toInt())
          .toList()
  ..yazdirmaSatisTalebi = json['yazdirma_SatisTalebi'] as bool?
  ..yazdirmaSatisTalebiYazicilari =
      (json['yazdirma_SatisTalebi_Yazicilari'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList()
  ..yazdirmaDizaynSatisTalebi =
      (json['yazdirma_Dizayn_SatisTalebi'] as List<dynamic>?)
          ?.map((e) => (e as num).toInt())
          .toList()
  ..yazdirmaSatisTeklifi = json['yazdirma_SatisTeklifi'] as bool?
  ..yazdirmaDizaynSatisTeklifi =
      (json['yazdirma_Dizayn_SatisTeklifi'] as List<dynamic>?)
          ?.map((e) => (e as num).toInt())
          .toList()
  ..yazdirmaSayim = json['yazdirma_Sayim'] as bool?
  ..yazdirmaSayimYazicilari =
      (json['yazdirma_Sayim_Yazicilari'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList()
  ..yazdirmaDizaynSayim = (json['yazdirma_Dizayn_Sayim'] as List<dynamic>?)
      ?.map((e) => (e as num).toInt())
      .toList()
  ..yazdirmaSevkiyatEtiketi = json['yazdirma_Sevkiyat_Etiketi'] as bool?
  ..yazdirmaSevkiyatEtiketiYazicilari =
      (json['yazdirma_Sevkiyat_Etiketi_Yazicilari'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList()
  ..yazdirmaDizaynSevkiyatEtiketi =
      (json['yazdirma_Dizayn_SevkiyatEtiketi'] as List<dynamic>?)
          ?.map((e) => (e as num).toInt())
          .toList()
  ..yazdirmaSevkiyatEtiketiKopyaSayisiGizle =
      json['yazdirma_Sevkiyat_Etiketi_KopyaSayisiGizle'] as bool?
  ..yazdirmaSerbest = json['yazdirma_Serbest'] as bool?
  ..yazdirmaSerbestYazicilari =
      json['yazdirma_Serbest_Yazicilari'] as List<dynamic>?
  ..yazdirmaDizaynSerbest = (json['yazdirma_Dizayn_Serbest'] as List<dynamic>?)
      ?.map((e) => (e as num).toInt())
      .toList()
  ..yazdirmaSeriEtiketi = json['yazdirma_SeriEtiketi'] as bool?
  ..yazdirmaSeriEtiketiYazicilari =
      (json['yazdirma_Seri_Etiketi_Yazicilari'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList()
  ..yazdirmaDizaynSeriEtiketi =
      (json['yazdirma_Dizayn_SeriEtiketi'] as List<dynamic>?)
          ?.map((e) => (e as num).toInt())
          .toList()
  ..yazdirmaStokEtiketi = json['yazdirma_Stok_Etiketi'] as bool?
  ..yazdirmaStokEtiketiYazicilari =
      (json['yazdirma_Stok_Etiketi_Yazicilari'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList()
  ..yazdirmaDizaynStokEtiketi =
      (json['yazdirma_Dizayn_StokEtiketi'] as List<dynamic>?)
          ?.map((e) => (e as num).toInt())
          .toList()
  ..yazdirmaTahsilatMakbuzu = json['yazdirma_TahsilatMakbuzu'] as bool?
  ..yazdirmaDizaynTahsilatMakbuzu =
      (json['yazdirma_Dizayn_TahsilatMakbuzu'] as List<dynamic>?)
          ?.map((e) => (e as num).toInt())
          .toList()
  ..yazdirmaUsk = json['yazdirma_USK'] as bool?
  ..yazdirmaUskYazicilari = (json['yazdirma_USK_Yazicilari'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList()
  ..yazdirmaDizaynUSK = (json['yazdirma_Dizayn_USK'] as List<dynamic>?)
      ?.map((e) => (e as num).toInt())
      .toList()
  ..yazdirmaUretMalTop = json['yazdirma_UretMalTop'] as bool?
  ..yazdirmaUretMalTopYazicilari =
      json['yazdirma_UretMalTop_Yazicilari'] as List<dynamic>?
  ..yazdirmaDizaynUretMalTop =
      json['yazdirma_Dizayn_UretMalTop'] as List<dynamic>?
  ..kullanicilar = (json['kullanicilar'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList()
  ..sirketTamEkranAcilsin = json['sirket_TamEkranAcilsin'] as bool?
  ..sirketRehberdeCariKodGizle = json['sirket_RehberdeCariKodGizle'] as bool?
  ..sirketRehberdeStokKodGizle = json['sirket_RehberdeStokKodGizle'] as bool?
  ..sirketRaporlardaFiyatGizle = json['sirket_RaporlardaFiyatGizle'] as bool?
  ..sirketTarihDegismesin = json['sirket_TarihDegismesin'] as bool?
  ..sirketDevirSirketineGiris = json['sirket_DevirSirketineGiris'] as String?
  ..sirketKontrolluAktarBelgeTipleri =
      (json['sirket_KontrolluAktar_BelgeTipleri'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList()
  ..sirketKontrolluAktarBelgeNoGoster =
      json['sirket_KontrolluAktar_BelgeNoGoster'] as List<dynamic>?
  ..sirketKontrolAciklamasiBelgeTipleri =
      (json['sirket_KontrolAciklamasi_BelgeTipleri'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList()
  ..sirketTLFiyatGelsinBelgeTipleri =
      json['sirket_TLFiyatGelsin_BelgeTipleri'] as List<dynamic>?
  ..sirketKalemKayitKontrolBelgeTipleri =
      json['sirket_KalemKayitKontrol_BelgeTipleri'] as List<dynamic>?
  ..sirketAktifDepolar = (json['sirket_aktifDepolar'] as List<dynamic>?)
      ?.map((e) => (e as num).toInt())
      .toList()
  ..sirketSatisDepo = (json['sirket_satisDepo'] as num?)?.toInt()
  ..sirketSatisDepoOzellestir = json['sirket_satisDepo_Ozellestir'] as bool?
  ..sirketSatisDepoMusSip = (json['sirket_satisDepo_MusSip'] as num?)?.toInt()
  ..sirketSatisDepoSatisFat = (json['sirket_satisDepo_SatisFat'] as num?)
      ?.toInt()
  ..sirketSatisDepoSatisIrs = (json['sirket_satisDepo_SatisIrs'] as num?)
      ?.toInt()
  ..sirketAlisDepo = (json['sirket_alisDepo'] as num?)?.toInt()
  ..sirketIadeDepo = (json['sirket_iadeDepo'] as num?)?.toInt()
  ..sirketProjeKodu = json['sirket_projeKodu'] as String?
  ..sirketAktifProjeler = (json['sirket_aktifProjeler'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList()
  ..ayarlarFirmaAyarlari = json['ayarlar_FirmaAyarlari'] as bool?
  ..ayarlarOturumlar = json['ayarlar_Oturumlar'] as bool?
  ..sirketSifreHatirlamaDurumu = json['sirket_SifreHatirlamaDurumu'] as String?
  ..genelDovizKurlari = json['genel_DovizKurlari'] as bool?
  ..genelDovizKurlariEkle = json['genel_DovizKurlari_Ekle'] as bool?
  ..genelDovizKurlariDuzelt = json['genel_DovizKurlari_Duzelt'] as bool?
  ..genelDovizKurlariSil = json['genel_DovizKurlari_Sil'] as bool?
  ..genelBelgeKontrol = json['genel_BelgeKontrol'] as bool?
  ..genelBelgeKontrolEkle = json['genel_BelgeKontrol_Ekle'] as bool?
  ..genelBelgeKontrolSil = json['genel_BelgeKontrol_Sil'] as bool?
  ..genelBelgeKontrolBelgeTipleri =
      (json['genel_BelgeKontrol_BelgeTipleri'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList()
  ..genelBelgeKontrolBarkodOkutsun =
      json['genel_BelgeKontrol_BarkodOkutsun'] as String?
  ..genelBelgeKontrolMiktarOtomatikGelsin =
      json['genel_BelgeKontrol_MiktarOtomatikGelsin'] as String?
  ..genelBelgeKontrolKalemDetaySorulmasin =
      json['genel_BelgeKontrol_KalemDetaySorulmasin'] as String?
  ..genelBelgeKontrolBelgeOnaySormasin =
      json['genel_BelgeKontrol_BelgeOnaySormasin'] as String?
  ..malKabulFiyatDegistirilmesin =
      json['malKabul_FiyatDegistirilmesin'] as bool?
  ..malKabulAlisIrsBelgeTipleri =
      (json['malKabul_AlisIrs_BelgeTipleri'] as List<dynamic>?)
          ?.map((e) => (e as num).toInt())
          .toList()
  ..malKabulAlisIrsGizlenecekAlanlar =
      (json['malKabul_AlisIrs_GizlenecekAlanlar'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList()
  ..malKabulAlisFatGizlenecekAlanlar =
      (json['malKabul_AlisFat_GizlenecekAlanlar'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList()
  ..malKabulAlisIrsAciklamaAlanlari =
      (json['malKabul_AlisIrs_AciklamaAlanlari'] as List<dynamic>?)
          ?.map((e) => (e as num).toInt())
          .toList()
  ..malKabulSatinAlma = json['malKabul_SatinAlma'] as bool?
  ..malKabulSatinAlmaKaydet = json['malKabul_SatinAlma_Kaydet'] as bool?
  ..malKabulSatinAlmaDuzelt = json['malKabul_SatinAlma_Duzelt'] as bool?
  ..malKabulSatinAlmaSil = json['malKabul_SatinAlma_Sil'] as bool?
  ..malKabulAlisIrsaliyesiFiyatGor =
      json['malKabul_AlisIrsaliyesiFiyatGor'] as bool?
  ..malKabulAlisIrsDigerSekmesiGoster =
      json['malKabul_AlisIrs_DigerSekmesiGoster'] as bool?
  ..malKabulAlisIrsSipBagSecenegi =
      json['malKabul_AlisIrs_SipBagSecenegi'] as String?
  ..malKabulAlisIrsReferansStokUygulamasi =
      json['malKabul_AlisIrs_ReferansStokUygulamasi'] as bool?
  ..malKabulAlisIrsSipBagSipHariciKalemEklenebilir =
      json['malKabul_AlisIrs_SipBag_SipHariciKalemEklenebilir'] as bool?
  ..malKabulAlisIrsSipBagFazlaTeslimatYapilabilir =
      json['malKabul_AlisIrs_SipBag_FazlaTeslimatYapilabilir'] as bool?
  ..malKabulAlisIrsSipBagSipOkutulsun =
      json['malKabul_AlisIrs_SipBag_SipOkutulsun'] as bool?
  ..malKabulAlisIrsSipBagCokluSecim =
      json['malKabul_AlisIrs_SipBag_CokluSecim'] as bool?
  ..malKabulAlisIrsSipBagTumKalemlerSecilsin =
      json['malKabul_AlisIrs_SipBag_TumKalemlerSecilsin'] as bool?
  ..malKabulAlisIrsSipBagEslesmeDurumu =
      (json['malKabul_AlisIrs_SipBag_EslesmeDurumu'] as num?)?.toInt()
  ..malKabulAlisIrsBarkodluGiris =
      json['malKabul_AlisIrs_BarkodluGiris'] as bool?
  ..malKabulAlisIrsMiktarOtomatikGelsin =
      json['malKabul_AlisIrs_MiktarOtomatikGelsin'] as bool?
  ..malKabulAlisIrsKalemDetaySorulmasin =
      json['malKabul_AlisIrs_KalemDetaySorulmasin'] as bool?
  ..malKabulAlisIrsKalemlerBirlestirilsin =
      json['malKabul_AlisIrs_KalemlerBirlestirilsin'] as bool?
  ..malKabulAlisIrsStokRehberiAcilmasin =
      json['malKabul_AlisIrs_StokRehberiAcilmasin'] as bool?
  ..malKabulAlisIrsKalemDuzeltilemesin =
      json['malKabul_AlisIrs_KalemDuzeltilemesin'] as bool?
  ..malKabulAlisIrsTekrarEdenBarkod =
      json['malKabul_AlisIrs_TekrarEdenBarkod'] as String?
  ..malKabulAlisIrsKlavyeEngelle =
      json['malKabul_AlisIrs_KlavyeEngelle'] as bool?
  ..malKabulAlisIrsMiktar1Gelsin =
      json['malKabul_AlisIrs_Miktar1Gelsin'] as bool?
  ..malKabulAlisIrsRaporlar = json['malKabul_AlisIrs_Raporlar'] as bool?
  ..malKabulAlisIrsKalemRaporu = json['malKabul_AlisIrs_KalemRaporu'] as bool?
  ..malKabulAlisIrsOtoBasimYap = json['malKabul_AlisIrs_OtoBasimYap'] as bool?
  ..malKabulAlisIrsKacGunlukKayitlarListelensin =
      (json['malKabul_AlisIrs_KacGunlukKayitlarListelensin'] as num?)?.toInt()
  ..malKabulAlisIrsFiyatSirasi = (json['malKabul_AlisIrs_FiyatSirasi'] as num?)
      ?.toInt()
  ..malKabulAlisIrsCariKoduDegistir =
      json['malKabul_AlisIrs_CariKoduDegistir'] as bool?
  ..malKabulAlisIrsCariRehPlaEslesmesin =
      json['malKabul_AlisIrs_CariRehPlaEslesmesin'] as bool?
  ..malKabulIade = json['malKabul_Iade'] as bool?
  ..malKabulIadeKaydet = json['malKabul_Iade_Kaydet'] as bool?
  ..malKabulIadeDuzelt = json['malKabul_Iade_Duzelt'] as bool?
  ..malKabulIadeSil = json['malKabul_Iade_Sil'] as bool?
  ..malKabulAlisFaturasiBelgeTipleri =
      (json['malKabul_AlisFaturasi_BelgeTipleri'] as List<dynamic>?)
          ?.map((e) => (e as num).toInt())
          .toList()
  ..malKabulAlisFaturasi = json['malKabul_AlisFaturasi'] as bool?
  ..malKabulAlisFaturasiKaydet = json['malKabul_AlisFaturasi_Kaydet'] as bool?
  ..malKabulAlisFaturasiDuzelt = json['malKabul_AlisFaturasi_Duzelt'] as bool?
  ..malKabulAlisFaturasiSil = json['malKabul_AlisFaturasi_Sil'] as bool?
  ..malKabulAlisFatDigerSekmesiGoster =
      json['malKabul_AlisFat_DigerSekmesiGoster'] as bool?
  ..malKabulAlisFatKacGunlukKayitlarListelensin =
      (json['malKabul_AlisFat_KacGunlukKayitlarListelensin'] as num?)?.toInt()
  ..malKabulAlisFatFiyatSirasi = (json['malKabul_AlisFat_FiyatSirasi'] as num?)
      ?.toInt()
  ..malKabulAlisFatAciklamalarYetkiTuru =
      json['malKabul_AlisFat_Aciklamalar_YetkiTuru'] as String?
  ..malKabulAlisFatAciklamaAlanlari =
      (json['malKabul_AlisFat_AciklamaAlanlari'] as List<dynamic>?)
          ?.map((e) => (e as num).toInt())
          .toList()
  ..malKabulAlisFatCariKoduDegistir =
      json['malKabul_AlisFat_CariKoduDegistir'] as bool?
  ..malKabulAlisFatBarkodluGiris =
      json['malKabul_AlisFat_BarkodluGiris'] as bool?
  ..malKabulAlisFatMiktarOtomatikGelsin =
      json['malKabul_AlisFat_MiktarOtomatikGelsin'] as bool?
  ..malKabulAlisFatKalemDetaySorulmasin =
      json['malKabul_AlisFat_KalemDetaySorulmasin'] as bool?
  ..malKabulAlisFatStokRehberiAcilmasin =
      json['malKabul_AlisFat_StokRehberiAcilmasin'] as bool?
  ..malKabulAlisFatKalemDuzeltilemesin =
      json['malKabul_AlisFat_KalemDuzeltilemesin'] as bool?
  ..malKabulAlisFatKlavyeEngelle =
      json['malKabul_AlisFat_KlavyeEngelle'] as bool?
  ..malKabulAlisFatMiktar1Gelsin =
      json['malKabul_AlisFat_Miktar1Gelsin'] as bool?
  ..malKabulAlisFatReferansStokUygulamasi =
      json['malKabul_AlisFat_ReferansStokUygulamasi'] as bool?
  ..malKabulAlisFatSipBagSipHariciKalemEklenebilir =
      json['malKabul_AlisFat_SipBag_SipHariciKalemEklenebilir'] as bool?
  ..malKabulAlisFatSipBagFazlaTeslimatYapilabilir =
      json['malKabul_AlisFat_SipBag_FazlaTeslimatYapilabilir'] as bool?
  ..malKabulAlisFatSipBagSipOkutulsun =
      json['malKabul_AlisFat_SipBag_SipOkutulsun'] as bool?
  ..malKabulAlisFatSipBagCokluSecim =
      json['malKabul_AlisFat_SipBag_CokluSecim'] as bool?
  ..malKabulAlisFatSipBagTumKalemlerSecilsin =
      json['malKabul_AlisFat_SipBag_TumKalemlerSecilsin'] as bool?
  ..malKabulAlisFatSipBagEslesmeDurumu =
      (json['malKabul_AlisFat_SipBag_EslesmeDurumu'] as num?)?.toInt()
  ..malKabulAlisFatRaporlar = json['malKabul_AlisFat_Raporlar'] as bool?
  ..malKabulAlisFatKalemRaporu = json['malKabul_AlisFat_KalemRaporu'] as bool?
  ..malKabulMustahsil = json['malKabul_Mustahsil'] as bool?
  ..malKabulMustahsilEkle = json['malKabul_Mustahsil_Ekle'] as bool?
  ..malKabulMustahsilDuzelt = json['malKabul_Mustahsil_Duzelt'] as bool?
  ..malKabulMustahsilSil = json['malKabul_Mustahsil_Sil'] as bool?
  ..transferDat = json['transfer_DAT'] as bool?
  ..transferDatKaydet = json['transfer_DAT_Kaydet'] as bool?
  ..transferDatDuzelt = json['transfer_DAT_Duzelt'] as bool?
  ..transferDatSil = json['transfer_DAT_Sil'] as bool?
  ..transferDatFiyatGor = json['transfer_DAT_FiyatGor'] as bool?
  ..transferDatOtoEtiketBas = json['transfer_DAT_OtoEtiketBas'] as bool?
  ..transferDatVarsayilanCikisDepo =
      (json['transfer_DAT_VarsayilanCikisDepo'] as num?)?.toInt()
  ..transferDatVarsayilanGirisDepo =
      (json['transfer_DAT_VarsayilanGirisDepo'] as num?)?.toInt()
  ..transferDatEIrsIsaretleyemesin =
      json['transfer_DAT_eIrsIsaretleyemesin'] as bool?
  ..transferDatDigerSekmesiGoster =
      json['transfer_DAT_DigerSekmesiGoster'] as bool?
  ..transferDatBarkodluGiris = json['transfer_DAT_BarkodluGiris'] as bool?
  ..transferDatMiktarOtomatikGelsin =
      json['transfer_DAT_MiktarOtomatikGelsin'] as bool?
  ..transferDatKalemDetaySorulmasin =
      json['transfer_DAT_KalemDetaySorulmasin'] as bool?
  ..transferDatStokRehberiAcilmasin =
      json['transfer_DAT_StokRehberiAcilmasin'] as bool?
  ..transferDatKalemDuzeltilemesin =
      json['transfer_DAT_KalemDuzeltilemesin'] as bool?
  ..transferDatKlavyeEngelle = json['transfer_DAT_KlavyeEngelle'] as bool?
  ..transferDatMiktar1Gelsin = json['transfer_DAT_Miktar1Gelsin'] as bool?
  ..transferDatKalemlerBirlestirilsin =
      json['transfer_DAT_KalemlerBirlestirilsin'] as bool?
  ..transferDatKacGunlukKayitlarListelensin =
      (json['transfer_DAT_KacGunlukKayitlarListelensin'] as num?)?.toInt()
  ..transferDatOnayIslemleri = json['transfer_DAT_OnayIslemleri'] as bool?
  ..transferDatOnayIslemleriDepolar =
      (json['transfer_DAT_OnayIslemleri_Depolar'] as List<dynamic>?)
          ?.map((e) => (e as num).toInt())
          .toList()
  ..transferDatEkAlan2Hatirla = json['transfer_DAT_EkAlan2Hatirla'] as bool?
  ..transferDatEkAlan2Tablodan = json['transfer_DAT_EkAlan2Tablodan'] as bool?
  ..transferDatSeriGirisHarYapabilsin =
      json['transfer_DAT_SeriGirisHarYapabilsin'] as bool?
  ..transferDatBirim1DenKaydet = json['transfer_DAT_Birim1denKaydet'] as bool?
  ..transferDatBarkod2Sor = json['transfer_DAT_Barkod2Sor'] as bool?
  ..transferDatBosGecilmeyecekAlanlar =
      (json['transfer_DAT_BosGecilmeyecekAlanlar'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList()
  ..transferDatGizlenecekAlanlar =
      (json['transfer_DAT_GizlenecekAlanlar'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList()
  ..transferDatDegismeyecekAlanlar =
      (json['transfer_DAT_DegismeyecekAlanlar'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList()
  ..transferDatAciklamaAlanlari =
      json['transfer_DAT_AciklamaAlanlari'] as List<dynamic>?
  ..transferDatSipBagSecenegi = json['transfer_DAT_SipBagSecenegi'] as String?
  ..transferDatReferansStokUygulamasi =
      json['transfer_DAT_ReferansStokUygulamasi'] as bool?
  ..transferDatSipBagSipHariciKalemEklenebilir =
      json['transfer_DAT_SipBag_SipHariciKalemEklenebilir'] as bool?
  ..transferDatSipBagFazlaTeslimatYapilabilir =
      json['transfer_DAT_SipBag_FazlaTeslimatYapilabilir'] as bool?
  ..transferDatSipBagSipOkutulsun =
      json['transfer_DAT_SipBag_SipOkutulsun'] as bool?
  ..transferDatSipBagSipOkutulsunMiktar2BazAl =
      json['transfer_DAT_SipBag_SipOkutulsun_Miktar2BazAl'] as bool?
  ..transferDatSipBagSipOkutulsunKalanMiktarGelsin =
      json['transfer_DAT_SipBag_SipOkutulsun_KalanMiktarGelsin'] as String?
  ..transferDatSipBagCokluSecim =
      json['transfer_DAT_SipBag_CokluSecim'] as bool?
  ..transferDatSipBagTumKalemlerSecilsin =
      json['transfer_DAT_SipBag_TumKalemlerSecilsin'] as bool?
  ..transferDatSipBagEslesmeDurumu =
      (json['transfer_DAT_SipBag_EslesmeDurumu'] as num?)?.toInt()
  ..transferDatSipBagMalToplananlarGelsin =
      json['transfer_DAT_SipBag_MalToplananlarGelsin'] as bool?
  ..transferDatSipBagSevkOnayliSiparislerGelsin =
      json['transfer_DAT_SipBag_SevkOnayliSiparislerGelsin'] as bool?
  ..transferAg = json['transfer_AG'] as bool?
  ..transferAgKaydet = json['transfer_AG_Kaydet'] as bool?
  ..transferAgDuzelt = json['transfer_AG_Duzelt'] as bool?
  ..transferAgSil = json['transfer_AG_Sil'] as bool?
  ..transferAgFiyatGor = json['transfer_AG_FiyatGor'] as bool?
  ..transferAgKacGunlukKayitlarListelensin =
      (json['transfer_AG_KacGunlukKayitlarListelensin'] as num?)?.toInt()
  ..transferAgVarsayilanDepo = (json['transfer_AG_VarsayilanDepo'] as num?)
      ?.toInt()
  ..transferAgDigerSekmesiGoster =
      json['transfer_AG_DigerSekmesiGoster'] as bool?
  ..transferAgBelgeKopyala = json['transfer_AG_BelgeKopyala'] as bool?
  ..transferAgOtoBasimYap = json['transfer_AG_OtoBasimYap'] as bool?
  ..transferAgSeriGirisHarYapabilsin =
      json['transfer_AG_SeriGirisHarYapabilsin'] as bool?
  ..transferAgBarkodluGiris = json['transfer_AG_BarkodluGiris'] as bool?
  ..transferAgMiktarOtomatikGelsin =
      json['transfer_AG_MiktarOtomatikGelsin'] as bool?
  ..transferAgKalemDetaySorulmasin =
      json['transfer_AG_KalemDetaySorulmasin'] as bool?
  ..transferAgStokRehberiAcilmasin =
      json['transfer_AG_StokRehberiAcilmasin'] as bool?
  ..transferAgKalemDuzeltilemesin =
      json['transfer_AG_KalemDuzeltilemesin'] as bool?
  ..transferAgKlavyeEngelle = json['transfer_AG_KlavyeEngelle'] as bool?
  ..transferAgMiktar1Gelsin = json['transfer_AG_Miktar1Gelsin'] as bool?
  ..transferAgReferansStokUygulamasi =
      json['transfer_AG_ReferansStokUygulamasi'] as bool?
  ..transferAgSipBagSipHariciKalemEklenebilir =
      json['transfer_AG_SipBag_SipHariciKalemEklenebilir'] as bool?
  ..transferAgSipBagFazlaTeslimatYapilabilir =
      json['transfer_AG_SipBag_FazlaTeslimatYapilabilir'] as bool?
  ..transferAgSipBagSipOkutulsun =
      json['transfer_AG_SipBag_SipOkutulsun'] as bool?
  ..transferAgSipBagSipOkutulsunMiktar2BazAl =
      json['transfer_AG_SipBag_SipOkutulsun_Miktar2BazAl'] as bool?
  ..transferAgSipBagCokluSecim = json['transfer_AG_SipBag_CokluSecim'] as bool?
  ..transferAgSipBagTumKalemlerSecilsin =
      json['transfer_AG_SipBag_TumKalemlerSecilsin'] as bool?
  ..transferAgSipBagEslesmeDurumu =
      (json['transfer_AG_SipBag_EslesmeDurumu'] as num?)?.toInt()
  ..transferAgSipBagMalToplananlarGelsin =
      json['transfer_AG_SipBag_MalToplananlarGelsin'] as bool?
  ..transferAgSipBagSevkOnayliSiparislerGelsin =
      json['transfer_AG_SipBag_SevkOnayliSiparislerGelsin'] as bool?
  ..transferAc = json['transfer_AC'] as bool?
  ..transferAcKaydet = json['transfer_AC_Kaydet'] as bool?
  ..transferAcDuzelt = json['transfer_AC_Duzelt'] as bool?
  ..transferAcSil = json['transfer_AC_Sil'] as bool?
  ..transferAcFiyatGor = json['transfer_AC_FiyatGor'] as bool?
  ..transferAcKacGunlukKayitlarListelensin =
      (json['transfer_AC_KacGunlukKayitlarListelensin'] as num?)?.toInt()
  ..transferAcVarsayilanDepo = (json['transfer_AC_VarsayilanDepo'] as num?)
      ?.toInt()
  ..transferAcEIrsIsaretleyemesin =
      json['transfer_AC_eIrsIsaretleyemesin'] as bool?
  ..transferAcDigerSekmesiGoster =
      json['transfer_AC_DigerSekmesiGoster'] as bool?
  ..transferAcBelgeKopyala = json['transfer_AC_BelgeKopyala'] as bool?
  ..transferAcOtoBasimYap = json['transfer_AC_OtoBasimYap'] as bool?
  ..transferAcSeriGirisHarYapabilsin =
      json['transfer_AC_SeriGirisHarYapabilsin'] as bool?
  ..transferAcEkAlan2Tablodan = json['transfer_AC_EkAlan2Tablodan'] as bool?
  ..transferAcEkAlan2Hatirla = json['transfer_AC_EkAlan2Hatirla'] as bool?
  ..transferAcMinStokMikGoster = json['transfer_AC_MinStokMikGoster'] as String?
  ..transferAcBosGecilmeyecekAlanlar =
      (json['transfer_AC_BosGecilmeyecekAlanlar'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList()
  ..transferAcBarkodluGiris = json['transfer_AC_BarkodluGiris'] as bool?
  ..transferAcMiktarOtomatikGelsin =
      json['transfer_AC_MiktarOtomatikGelsin'] as bool?
  ..transferAcKalemDetaySorulmasin =
      json['transfer_AC_KalemDetaySorulmasin'] as bool?
  ..transferAcStokRehberiAcilmasin =
      json['transfer_AC_StokRehberiAcilmasin'] as bool?
  ..transferAcKalemDuzeltilemesin =
      json['transfer_AC_KalemDuzeltilemesin'] as bool?
  ..transferAcKlavyeEngelle = json['transfer_AC_KlavyeEngelle'] as bool?
  ..transferAcMiktar1Gelsin = json['transfer_AC_Miktar1Gelsin'] as bool?
  ..transferAcReferansStokUygulamasi =
      json['transfer_AC_ReferansStokUygulamasi'] as bool?
  ..transferAcSipBagSipHariciKalemEklenebilir =
      json['transfer_AC_SipBag_SipHariciKalemEklenebilir'] as bool?
  ..transferAcSipBagFazlaTeslimatYapilabilir =
      json['transfer_AC_SipBag_FazlaTeslimatYapilabilir'] as bool?
  ..transferAcSipBagSipOkutulsun =
      json['transfer_AC_SipBag_SipOkutulsun'] as bool?
  ..transferAcSipBagSipOkutulsunMiktar2BazAl =
      json['transfer_AC_SipBag_SipOkutulsun_Miktar2BazAl'] as bool?
  ..transferAcSipBagCokluSecim = json['transfer_AC_SipBag_CokluSecim'] as bool?
  ..transferAcSipBagTumKalemlerSecilsin =
      json['transfer_AC_SipBag_TumKalemlerSecilsin'] as bool?
  ..transferAcSipBagEslesmeDurumu =
      (json['transfer_AC_SipBag_EslesmeDurumu'] as num?)?.toInt()
  ..transferAcSipBagMalToplananlarGelsin =
      json['transfer_AC_SipBag_MalToplananlarGelsin'] as bool?
  ..transferAcSipBagSevkOnayliSiparislerGelsin =
      json['transfer_AC_SipBag_SevkOnayliSiparislerGelsin'] as bool?
  ..transferAcGizlenecekAlanlar =
      (json['transfer_AC_GizlenecekAlanlar'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList()
  ..transferAcDegismeyecekAlanlar =
      (json['transfer_AC_DegismeyecekAlanlar'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList()
  ..transferDepoTalebi = json['transfer_DepoTalebi'] as bool?
  ..transferDepoTalebiSil = json['transfer_DepoTalebi_Sil'] as bool?
  ..transferDepoTalebiMalTop = json['transfer_DepoTalebi_MalTop'] as bool?
  ..transferDepoTalebiMalTopFazlaTeslimat =
      json['transfer_DepoTalebi_MalTop_FazlaTeslimat'] as String?
  ..hucreGiristeHucreYerlestir = json['hucre_GiristeHucreYerlestir'] as bool?
  ..hucreCikistaHucreYerlestir = json['hucre_CikistaHucreYerlestir'] as bool?
  ..hucreYerlestir = json['hucre_Yerlestir'] as bool?
  ..hucreYerlestirBelgesiz = json['hucre_YerlestirBelgesiz'] as bool?
  ..hucreYerlestirKlavyeEngelle = json['hucre_Yerlestir_KlavyeEngelle'] as bool?
  ..hucreYerlestirRehberdenStokSecilmesin =
      json['hucre_Yerlestir_RehberdenStokSecilmesin'] as bool?
  ..hucreYerlestirHangiHucrede = json['hucre_Yerlestir_HangiHucrede'] as bool?
  ..hucreYerlestirBelgeTipleri =
      (json['hucre_Yerlestir_BelgeTipleri'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList()
  ..hucreBosalt = json['hucre_Bosalt'] as bool?
  ..hucreBosaltBelgesiz = json['hucre_BosaltBelgesiz'] as bool?
  ..hucreBosaltKlavyeEngelle = json['hucre_Bosalt_KlavyeEngelle'] as bool?
  ..hucreBosaltRehberdenStokSecilmesin =
      json['hucre_Bosalt_RehberdenStokSecilmesin'] as bool?
  ..hucreBosaltHangiHucrede = json['hucre_Bosalt_HangiHucrede'] as bool?
  ..hucreBosaltBelgeTipleri =
      (json['hucre_Bosalt_BelgeTipleri'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList()
  ..hucreArama = json['hucre_Arama'] as bool?
  ..hucreAramaTumDepolar = json['hucre_AramaTumDepolar'] as bool?
  ..hucreAramaOzelFonksiyon = json['hucre_AramaOzelFonksiyon'] as String?
  ..hucreTransfer = json['hucre_Transfer'] as bool?
  ..hucreTransferKlavyeEngelle = json['hucre_Transfer_KlavyeEngelle'] as bool?
  ..hucreTransferRehberdenStokSecilmesin =
      json['hucre_Transfer_RehberdenStokSecilmesin'] as bool?
  ..hucreTransferBelgeTipleri =
      (json['hucre_Transfer_BelgeTipleri'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList()
  ..hucreListesi = json['hucre_Listesi'] as bool?
  ..hucreBosaltOtomatikStokEtiketiYazdir =
      json['hucre_Bosalt_OtomatikStokEtiketiYazdir'] as bool?
  ..hucreBakiyeDurumu = json['hucre_BakiyeDurumu'] as bool?
  ..hucreHareketleri = json['hucre_Hareketleri'] as bool?
  ..hucreHareketleriSil = json['hucre_Hareketleri_Sil'] as bool?
  ..sevkiyatSatisIrsaliyesiBelgeTipleri =
      (json['sevkiyat_SatisIrsaliyesi_BelgeTipleri'] as List<dynamic>?)
          ?.map((e) => (e as num).toInt())
          .toList()
  ..sevkiyatSatisIrsaliyesiGizlenecekAlanlar =
      (json['sevkiyat_SatisIrsaliyesi_GizlenecekAlanlar'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList()
  ..sevkiyatSatisIrsaliyesiDegismeyecekAlanlar =
      (json['sevkiyat_SatisIrsaliyesi_DegismeyecekAlanlar'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList()
  ..sevkiyatSatisIrsaliyesi = json['sevkiyat_SatisIrsaliyesi'] as bool?
  ..sevkiyatSatisIrsaliyesiKayit =
      json['sevkiyat_SatisIrsaliyesiKayit'] as bool?
  ..sevkiyatSatisIrsaliyesiDuzeltme =
      json['sevkiyat_SatisIrsaliyesiDuzeltme'] as bool?
  ..sevkiyatSatisIrsaliyesiSilme =
      json['sevkiyat_SatisIrsaliyesiSilme'] as bool?
  ..sevkiyatSatisIrsaliyesiFiyatGor =
      json['sevkiyat_SatisIrsaliyesiFiyatGor'] as bool?
  ..sevkiyatSatisIrsDigerSekmesiGoster =
      json['sevkiyat_SatisIrs_DigerSekmesiGoster'] as bool?
  ..sevkiyatSatisIrsaliyesiSipBagSecenegi =
      json['sevkiyat_SatisIrsaliyesi_SipBagSecenegi'] as String?
  ..sevkiyatSatisIrsReferansStokUygulamasi =
      json['sevkiyat_SatisIrs_ReferansStokUygulamasi'] as bool?
  ..sevkiyatSatisIrsSipBagSipHariciKalemEklenebilir =
      json['sevkiyat_SatisIrs_SipBag_SipHariciKalemEklenebilir'] as bool?
  ..sevkiyatSatisIrsSipBagFazlaTeslimatYapilabilir =
      json['sevkiyat_SatisIrs_SipBag_FazlaTeslimatYapilabilir'] as bool?
  ..sevkiyatSatisIrsSipBagSipOkutulsun =
      json['sevkiyat_SatisIrs_SipBag_SipOkutulsun'] as bool?
  ..sevkiyatSatisIrsSipBagSipOkutulsunMiktar2BazAl =
      json['sevkiyat_SatisIrs_SipBag_SipOkutulsun_Miktar2BazAl'] as bool?
  ..sevkiyatSatisIrsSipBagSipOkutulsunKalanMiktarGelsin =
      json['sevkiyat_SatisIrs_SipBag_SipOkutulsun_KalanMiktarGelsin'] as String?
  ..sevkiyatSatisIrsSipBagCokluSecim =
      json['sevkiyat_SatisIrs_SipBag_CokluSecim'] as bool?
  ..sevkiyatSatisIrsSipBagTumKalemlerSecilsin =
      json['sevkiyat_SatisIrs_SipBag_TumKalemlerSecilsin'] as bool?
  ..sevkiyatSatisIrsSipBagEslesmeDurumu =
      (json['sevkiyat_SatisIrs_SipBag_EslesmeDurumu'] as num?)?.toInt()
  ..sevkiyatSatisIrsSipBagMalToplananlarGelsin =
      json['sevkiyat_SatisIrs_SipBag_MalToplananlarGelsin'] as bool?
  ..sevkiyatSatisIrsSipBagSevkOnayliSiparislerGelsin =
      json['sevkiyat_SatisIrs_SipBag_SevkOnayliSiparislerGelsin'] as bool?
  ..sevkiyatFiyatDegistirilmesin =
      json['sevkiyat_FiyatDegistirilmesin'] as bool?
  ..sevkiyatSatisIrsaliyesiEIrsaliyeDuzenleyemesin =
      json['sevkiyat_SatisIrsaliyesi_EIrsaliyeDuzenleyemesin'] as bool?
  ..sevkiyatSatisIrsKalemlerBirlestirilsin =
      json['sevkiyat_SatisIrs_KalemlerBirlestirilsin'] as bool?
  ..sevkiyatSatisIrsOtoBasimYap = json['sevkiyat_SatisIrs_OtoBasimYap'] as bool?
  ..sevkiyatSatisIrsKacGunlukKayitlarListelensin =
      (json['sevkiyat_SatisIrs_KacGunlukKayitlarListelensin'] as num?)?.toInt()
  ..sevkiyatSatisIrsFiyatSirasi =
      (json['sevkiyat_SatisIrs_FiyatSirasi'] as num?)?.toInt()
  ..sevkiyatSatisIrsSeriGirisHarYapabilsin =
      json['sevkiyat_SatisIrs_SeriGirisHarYapabilsin'] as bool?
  ..sevkiyatSatisIrsEkAlan2Tablodan =
      json['sevkiyat_SatisIrs_EkAlan2Tablodan'] as bool?
  ..sevkiyatSatisIrsEkAlan2Hatirla =
      json['sevkiyat_SatisIrs_EkAlan2Hatirla'] as bool?
  ..sevkiyatSatisIrsOlcuBirimi = (json['sevkiyat_SatisIrs_OlcuBirimi'] as num?)
      ?.toInt()
  ..sevkiyatSatisIrsCariKoduDegistir =
      json['sevkiyat_SatisIrs_CariKoduDegistir'] as bool?
  ..sevkiyatSatisIrsMaxIskUygulamasi =
      json['sevkiyat_SatisIrs_MaxIskUygulamasi'] as bool?
  ..sevkiyatSatisIrsMaxSatIsk1 = (json['sevkiyat_SatisIrs_MaxSatIsk1'] as num?)
      ?.toDouble()
  ..sevkiyatSatisIrsMaxSatIsk2 = (json['sevkiyat_SatisIrs_MaxSatIsk2'] as num?)
      ?.toDouble()
  ..sevkiyatSatisIrsMaxSatIsk3 = (json['sevkiyat_SatisIrs_MaxSatIsk3'] as num?)
      ?.toDouble()
  ..sevkiyatSatisIrsMaxSatIsk4 = (json['sevkiyat_SatisIrs_MaxSatIsk4'] as num?)
      ?.toDouble()
  ..sevkiyatSatisIrsMaxSatIsk5 = (json['sevkiyat_SatisIrs_MaxSatIsk5'] as num?)
      ?.toDouble()
  ..sevkiyatSatisIrsMaxSatIsk6 = (json['sevkiyat_SatisIrs_MaxSatIsk6'] as num?)
      ?.toDouble()
  ..sevkiyatSatisIrsMaxGenIsk1 = (json['sevkiyat_SatisIrs_MaxGenIsk1'] as num?)
      ?.toDouble()
  ..sevkiyatSatisIrsMaxGenIsk2 = (json['sevkiyat_SatisIrs_MaxGenIsk2'] as num?)
      ?.toDouble()
  ..sevkiyatSatisIrsMaxGenIsk3 = (json['sevkiyat_SatisIrs_MaxGenIsk3'] as num?)
      ?.toDouble()
  ..sevkiyatSatisIrsDipFiyatUygulamasi =
      json['sevkiyat_SatisIrs_DipFiyatUygulamasi'] as bool?
  ..sevkiyatSatisIrsDipFiyatSaha =
      json['sevkiyat_SatisIrs_DipFiyatSaha'] as String?
  ..sevkiyatSatisIrsDipFiyatEylem =
      json['sevkiyat_SatisIrs_DipFiyatEylem'] as String?
  ..sevkiyatSatisIrsBarkodluGiris =
      json['sevkiyat_SatisIrs_BarkodluGiris'] as bool?
  ..sevkiyatSatisIrsMiktarOtomatikGelsin =
      json['sevkiyat_SatisIrs_MiktarOtomatikGelsin'] as bool?
  ..sevkiyatSatisIrsKalemDetaySorulmasin =
      json['sevkiyat_SatisIrs_KalemDetaySorulmasin'] as bool?
  ..sevkiyatSatisIrsStokRehberiAcilmasin =
      json['sevkiyat_SatisIrs_StokRehberiAcilmasin'] as bool?
  ..sevkiyatSatisIrsKalemDuzeltilemesin =
      json['sevkiyat_SatisIrs_KalemDuzeltilemesin'] as bool?
  ..sevkiyatSatisIrsKlavyeEngelle =
      json['sevkiyat_SatisIrs_KlavyeEngelle'] as bool?
  ..sevkiyatSatisIrsMiktar1Gelsin =
      json['sevkiyat_SatisIrs_Miktar1Gelsin'] as bool?
  ..sevkiyatSatisIrsBakiyesizStokSecilmesin =
      json['sevkiyat_SatisIrs_BakiyesizStokSecilmesin'] as bool?
  ..sevkiyatSatisIrsRaporlar = json['sevkiyat_SatisIrs_Raporlar'] as bool?
  ..sevkiyatSatisIrsKalemRaporu = json['sevkiyat_SatisIrs_KalemRaporu'] as bool?
  ..sevkiyatSatisFatBelgeTipleri =
      (json['sevkiyat_SatisFat_BelgeTipleri'] as List<dynamic>?)
          ?.map((e) => (e as num).toInt())
          .toList()
  ..sevkiyatSatisFatVarsayilanBelgeTipi =
      (json['sevkiyat_SatisFat_VarsayilanBelgeTipi'] as num?)?.toInt()
  ..sevkiyatSatisFat = json['sevkiyat_SatisFat'] as bool?
  ..sevkiyatSatisFatKaydet = json['sevkiyat_SatisFat_Kaydet'] as bool?
  ..sevkiyatSatisFatDuzelt = json['sevkiyat_SatisFat_Duzelt'] as bool?
  ..sevkiyatSatisFatSil = json['sevkiyat_SatisFat_Sil'] as bool?
  ..sevkiyatSatisFatToplamlarCariTahsilatIslemleri =
      json['sevkiyat_SatisFat_ToplamlarCariTahsilatIslemleri'] as bool?
  ..sevkiyatSatisFatKayittanSonraTaslakOlustur =
      json['sevkiyat_SatisFat_KayittanSonraTaslakOlustur'] as bool?
  ..sevkiyatSatisFatOtomatikBasimYap =
      json['sevkiyat_SatisFat_OtomatikBasimYap'] as bool?
  ..sevkiyatSatisFatDigerSekmesiGoster =
      json['sevkiyat_SatisFat_DigerSekmesiGoster'] as bool?
  ..sevkiyatSatisFatFiyatDegistirilmesin =
      json['sevkiyat_SatisFat_FiyatDegistirilmesin'] as bool?
  ..sevkiyatSatisFatKacGunlukKayitlarListelensin =
      (json['sevkiyat_SatisFat_KacGunlukKayitlarListelensin'] as num?)?.toInt()
  ..sevkiyatSatisFatFiyatSirasi =
      (json['sevkiyat_SatisFat_FiyatSirasi'] as num?)?.toInt()
  ..sevkiyatSatisFatKalemlerBirlestirilsin =
      json['sevkiyat_SatisFat_KalemlerBirlestirilsin'] as bool?
  ..sevkiyatSatisFatEkAlan2Tablodan =
      json['sevkiyat_SatisFat_EkAlan2Tablodan'] as bool?
  ..sevkiyatSatisFatEkAlan2Hatirla =
      json['sevkiyat_SatisFat_EkAlan2Hatirla'] as bool?
  ..sevkiyatSatisFatFiltre = json['sevkiyat_SatisFat_Filtre'] as String?
  ..sevkiyatSatisFatFiltreSQL = json['sevkiyat_SatisFat_FiltreSQL'] as String?
  ..sevkiyatSatisFatOlcuBirimi = (json['sevkiyat_SatisFat_OlcuBirimi'] as num?)
      ?.toInt()
  ..sevkiyatSatisFatAciklamaAlanlari =
      (json['sevkiyat_SatisFat_AciklamaAlanlari'] as List<dynamic>?)
          ?.map((e) => (e as num).toInt())
          .toList()
  ..sevkiyatSatisIrsAciklamaAlanlari =
      (json['sevkiyat_SatisIrs_AciklamaAlanlari'] as List<dynamic>?)
          ?.map((e) => (e as num).toInt())
          .toList()
  ..sevkiyatSatisFatBosGecilmeyecekAlanlar =
      (json['sevkiyat_SatisFat_BosGecilmeyecekAlanlar'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList()
  ..sevkiyatSatisIrsBosGecilmeyecekAlanlar =
      (json['sevkiyat_SatisIrs_BosGecilmeyecekAlanlar'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList()
  ..malKabulAlisFatBosGecilmeyecekAlanlar =
      (json['malKabul_AlisFat_BosGecilmeyecekAlanlar'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList()
  ..malKabulAlisIrsBosGecilmeyecekAlanlar =
      (json['malKabul_AlisIrs_BosGecilmeyecekAlanlar'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList()
  ..sevkiyatSatisFatGizlenecekAlanlar =
      (json['sevkiyat_SatisFat_GizlenecekAlanlar'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList()
  ..sevkiyatSatisFatDegismeyecekAlanlar =
      (json['sevkiyat_SatisFat_DegismeyecekAlanlar'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList()
  ..sevkiyatSatisFatSeriGirisHarYapabilsin =
      json['sevkiyat_SatisFat_SeriGirisHarYapabilsin'] as bool?
  ..sevkiyatSatisFatCariKoduDegistir =
      json['sevkiyat_SatisFat_CariKoduDegistir'] as bool?
  ..sevkiyatSatisFaturasiSipBagSecenegi =
      json['sevkiyat_SatisFaturasi_SipBagSecenegi'] as String?
  ..sevkiyatSatisFatReferansStokUygulamasi =
      json['sevkiyat_SatisFat_ReferansStokUygulamasi'] as bool?
  ..sevkiyatSatisFatSipBagSipHariciKalemEklenebilir =
      json['sevkiyat_SatisFat_SipBag_SipHariciKalemEklenebilir'] as bool?
  ..sevkiyatSatisFatSipBagFazlaTeslimatYapilabilir =
      json['sevkiyat_SatisFat_SipBag_FazlaTeslimatYapilabilir'] as bool?
  ..sevkiyatSatisFatSipBagSipOkutulsun =
      json['sevkiyat_SatisFat_SipBag_SipOkutulsun'] as bool?
  ..sevkiyatSatisFatSipBagSipOkutulsunMiktar2BazAl =
      json['sevkiyat_SatisFat_SipBag_SipOkutulsun_Miktar2BazAl'] as bool?
  ..sevkiyatSatisFatSipBagCokluSecim =
      json['sevkiyat_SatisFat_SipBag_CokluSecim'] as bool?
  ..sevkiyatSatisFatSipBagTumKalemlerSecilsin =
      json['sevkiyat_SatisFat_SipBag_TumKalemlerSecilsin'] as bool?
  ..sevkiyatSatisFatSipBagEslesmeDurumu =
      (json['sevkiyat_SatisFat_SipBag_EslesmeDurumu'] as num?)?.toInt()
  ..sevkiyatSatisFatSipBagSevkOnayliSiparislerGelsin =
      json['sevkiyat_SatisFat_SipBag_SevkOnayliSiparislerGelsin'] as bool?
  ..sevkiyatSatisFatBarkodluGiris =
      json['sevkiyat_SatisFat_BarkodluGiris'] as bool?
  ..sevkiyatSatisFaturasiMiktarOtomatikGelsin =
      json['sevkiyat_SatisFaturasi_MiktarOtomatikGelsin'] as bool?
  ..sevkiyatSatisFaturasiKalemDetaySorulmasin =
      json['sevkiyat_SatisFaturasi_KalemDetaySorulmasin'] as bool?
  ..sevkiyatSatisFatBarkodSayisiSaklanacakAlan =
      json['sevkiyat_SatisFat_BarkodSayisiSaklanacakAlan'] as String?
  ..sevkiyatSatisFatStokRehberiAcilmasin =
      json['sevkiyat_SatisFat_StokRehberiAcilmasin'] as bool?
  ..sevkiyatSatisFatKalemDuzeltilemesin =
      json['sevkiyat_SatisFat_KalemDuzeltilemesin'] as bool?
  ..sevkiyatSatisFatKlavyeEngelle =
      json['sevkiyat_SatisFat_KlavyeEngelle'] as bool?
  ..sevkiyatSatisFatMiktar1Gelsin =
      json['sevkiyat_SatisFat_Miktar1Gelsin'] as bool?
  ..sevkiyatSatisFatBakiyesizStokSecilmesin =
      json['sevkiyat_SatisFat_BakiyesizStokSecilmesin'] as bool?
  ..sevkiyatSatisFatRaporlar = json['sevkiyat_SatisFat_Raporlar'] as bool?
  ..sevkiyatSatisFatKalemRaporu = json['sevkiyat_SatisFat_KalemRaporu'] as bool?
  ..sevkiyatSatisFatKarlilikRaporu =
      json['sevkiyat_SatisFat_KarlilikRaporu'] as bool?
  ..sevkiyatSatisFatMaxIskUygulamasi =
      json['sevkiyat_SatisFat_MaxIskUygulamasi'] as bool?
  ..sevkiyatSatisFatMaxSatIsk1 = (json['sevkiyat_SatisFat_MaxSatIsk1'] as num?)
      ?.toDouble()
  ..sevkiyatSatisFatMaxSatIsk2 = (json['sevkiyat_SatisFat_MaxSatIsk2'] as num?)
      ?.toDouble()
  ..sevkiyatSatisFatMaxSatIsk3 = (json['sevkiyat_SatisFat_MaxSatIsk3'] as num?)
      ?.toDouble()
  ..sevkiyatSatisFatMaxSatIsk4 = (json['sevkiyat_SatisFat_MaxSatIsk4'] as num?)
      ?.toDouble()
  ..sevkiyatSatisFatMaxSatIsk5 = (json['sevkiyat_SatisFat_MaxSatIsk5'] as num?)
      ?.toDouble()
  ..sevkiyatSatisFatMaxSatIsk6 = (json['sevkiyat_SatisFat_MaxSatIsk6'] as num?)
      ?.toDouble()
  ..sevkiyatSatisFatMaxGenIsk1 = (json['sevkiyat_SatisFat_MaxGenIsk1'] as num?)
      ?.toDouble()
  ..sevkiyatSatisFatMaxGenIsk2 = (json['sevkiyat_SatisFat_MaxGenIsk2'] as num?)
      ?.toDouble()
  ..sevkiyatSatisFatMaxGenIsk3 = (json['sevkiyat_SatisFat_MaxGenIsk3'] as num?)
      ?.toDouble()
  ..sevkiyatSatisFatDipFiyatUygulamasi =
      json['sevkiyat_SatisFat_DipFiyatUygulamasi'] as bool?
  ..sevkiyatSatisFatDipFiyatSaha =
      json['sevkiyat_SatisFat_DipFiyatSaha'] as String?
  ..sevkiyatSatisFatDipFiyatEylem =
      json['sevkiyat_SatisFat_DipFiyatEylem'] as String?
  ..sevkiyatSatisFatDipFiyatKdvDurumu =
      json['sevkiyat_SatisFat_DipFiyatKDVDurumu'] as String?
  ..sevkiyatSatisIrsaliyesiSiparissiz =
      json['sevkiyat_SatisIrsaliyesiSiparissiz'] as bool?
  ..sevkiyatSatisIrsaliyesiSiparissizFiyatGor =
      json['sevkiyat_SatisIrsaliyesiSiparissizFiyatGor'] as bool?
  ..sevkiyatSatisIrsaliyesiIade = json['sevkiyat_SatisIrsaliyesiIade'] as bool?
  ..sevkiyatSiptenMalTop = json['sevkiyat_SiptenMalTop'] as bool?
  ..sevkiyatSiptenMalTopMiktarBarkoddanGelsin =
      json['sevkiyat_SiptenMalTop_MiktarBarkoddanGelsin'] as bool?
  ..sevkiyatSiptenMalTopRehberdenStokSecilmesin =
      json['sevkiyat_SiptenMalTop_RehberdenStokSecilmesin'] as bool?
  ..sevkiyatSiptenMalTopKlavyedenBarkodGirilmesin =
      json['sevkiyat_SiptenMalTop_KlavyedenBarkodGirilmesin'] as bool?
  ..sevkiyatSiptenMalTopSevkOnayliSiparislerGelsin =
      json['sevkiyat_SiptenMalTop_SevkOnayliSiparislerGelsin'] as bool?
  ..sevkiyatSiptenMalTopKacGunlukKayitlarListelensin =
      (json['sevkiyat_SiptenMalTop_KacGunlukKayitlarListelensin'] as num?)
          ?.toInt()
  ..sevkemriMalToplama = json['sevkemri_MalToplama'] as bool?
  ..sevkemriMalToplamaAtanabilir =
      json['sevkemri_MalToplamaAtanabilir'] as bool?
  ..sevkemriMalToplamaAtayabilir =
      json['sevkemri_MalToplamaAtayabilir'] as bool?
  ..sevkemriUrunDegistir = json['sevkemri_UrunDegistir'] as bool?
  ..sevkemriMiktarDegistir = json['sevkemri_MiktarDegistir'] as bool?
  ..sevkemriMuadilUrun = json['sevkemri_MuadilUrun'] as bool?
  ..sevkemriMalToplamaBarkodsuzUrunListedenSecilsin =
      json['sevkemri_malToplama_BarkodsuzUrunListedenSecilsin'] as bool?
  ..sevkemriMalToplamaOtoStokEtiketiYazdir =
      json['sevkemri_MalToplama_OtoStokEtiketiYazdir'] as bool?
  ..sevkemriMalToplamaOtoStokEtiketiYazdirSor =
      json['sevkemri_MalToplama_OtoStokEtiketiYazdirSor'] as bool?
  ..sevkemriMalToplamaKlavyedenGirisiEngelle =
      json['sevkemri_MalToplama_KlavyedenGirisiEngelle'] as bool?
  ..sevkemriMalToplamaBarkod2Sor =
      json['sevkemri_MalToplama_Barkod2Sor'] as bool?
  ..sevkemriMalToplamaBarkod2YildizliGorunsun =
      json['sevkemri_MalToplama_Barkod2_YildizliGorunsun'] as bool?
  ..sevkemriMalToplamaBarkod2KalemEkranindaSor =
      json['sevkemri_MalToplama_Barkod2KalemEkranindaSor'] as bool?
  ..sevkemriMalToplamaTumuToplanmadanTamamlanmasin =
      json['sevkemri_MalToplama_TumuToplanmadanTamamlanmasin'] as bool?
  ..sevkemriMalToplamaHangiHucredeGoster =
      json['sevkemri_MalToplama_HangiHucredeGoster'] as bool?
  ..sevkemriMalToplamaKalemDetayIslemOnaySormasin =
      json['sevkemri_MalToplama_KalemDetayIslemOnaySormasin'] as bool?
  ..sevkemriMalToplamaGosterilecekEkBilgiler =
      (json['sevkemri_MalToplama_GosterilecekEkBilgiler'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList()
  ..sevkemriMalToplamaDegistirilemeyecekAlanlar =
      (json['sevkemri_MalToplama_DegistirilemeyecekAlanlar'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList()
  ..sevkemriMalToplamaGizlenecekAlanlar =
      (json['sevkemri_MalToplama_GizlenecekAlanlar'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList()
  ..sevkemriMalToplamaMiktarBarkoddan =
      json['sevkemri_MalToplama_MiktarBarkoddan'] as bool?
  ..sevkemriMalToplamaKalemDetayiSorulmasin =
      json['sevkemri_MalToplama_KalemDetayiSorulmasin'] as bool?
  ..sevkemriMalToplamaKalemDetayaUlasamasin =
      json['sevkemri_MalToplama_KalemDetayaUlasamasin'] as bool?
  ..sevkemriMalToplamaFazlaTeslimat =
      json['sevkemri_MalToplama_FazlaTeslimat'] as String?
  ..sevkemriMalToplamaVarsayilanOlcuBirimi =
      (json['sevkemri_MalToplama_VarsayilanOlcuBirimi'] as num?)?.toInt()
  ..sevkemriMalToplamaSiralamaTipi =
      json['sevkemri_MalToplama_SiralamaTipi'] as String?
  ..sevkemriMalKontrol = json['sevkemri_MalKontrol'] as bool?
  ..sevkemriMalKontrolKlavyeEngelle =
      json['sevkemri_MalKontrol_KlavyeEngelle'] as bool?
  ..sevkemriMalKontrolTipi = json['sevkemri_MalKontrolTipi'] == null
      ? null
      : SevkemriMalKontrolTipi.fromJson(
          json['sevkemri_MalKontrolTipi'] as Map<String, dynamic>,
        )
  ..sevkemriMalKontrolKullanicilar =
      (json['sevkemri_MalKontrolKullanicilar'] as List<dynamic>?)
          ?.map((e) => (e as num).toInt())
          .toList()
  ..sevkemriPaketleme = json['sevkemri_Paketleme'] as bool?
  ..sevkemriPaketlemeKlavyeEngelle =
      json['sevkemri_Paketleme_KlavyeEngelle'] as bool?
  ..sevkemriPaketlemeBarkodOkutmayaZorla =
      json['sevkemri_Paketleme_BarkodOkutmayaZorla'] as bool?
  ..sevkemriPaketlemeBarkodsuzUrunListedenSecilsin =
      json['sevkemri_Paketleme_BarkodsuzUrunListedenSecilsin'] as bool?
  ..sevkemriAracYukleme = json['sevkemri_AracYukleme'] as bool?
  ..sevkemriAracYuklemeKlavyeEngelle =
      json['sevkemri_AracYukleme_KlavyeEngelle'] as bool?
  ..sevkemriAracBosaltma = json['sevkemri_AracBosaltma'] as bool?
  ..sevkemriAracBosaltmaKlavyeEngelle =
      json['sevkemri_AracBosaltma_KlavyeEngelle'] as bool?
  ..sevkemriDepodanTeslimat = json['sevkemri_DepodanTeslimat'] as bool?
  ..sevkemriDepodanTeslimatKlavyeEngelle =
      json['sevkemri_DepodanTeslimat_KlavyeEngelle'] as bool?
  ..sayimSayim = json['sayim_sayim'] as bool?
  ..sayimKontrolMiktari = (json['sayim_Kontrol_Miktari'] as num?)?.toDouble()
  ..sayimMiktarBarkoddanGelsin = json['sayim_MiktarBarkoddanGelsin'] as bool?
  ..sayimAyniStokDurumu = json['sayim_AyniStokDurumu'] as String?
  ..sayimMiktar1Gelsin = json['sayim_Miktar1Gelsin'] as bool?
  ..sayimHemenKaydet = json['sayim_HemenKaydet'] as bool?
  ..sayimCarpanAktif = json['sayim_CarpanAktif'] as bool?
  ..sayimSeriMikGirilenMikKabulEdilsin =
      json['sayim_SeriMikGirilenMikKabulEdilsin'] as bool?
  ..sayimDigerKulSayimHarGorsun =
      json['sayim_DigerKulSayimHarGorsun'] as String?
  ..sayimDigerKulSayimFisGorsun =
      json['sayim_DigerKulSayimFisGorsun'] as String?
  ..sayimSerbest = json['sayim_Serbest'] as bool?
  ..sayimSerbestSil = json['sayim_Serbest_Sil'] as bool?
  ..sayimDepoFarkRaporu = json['sayim_DepoFarkRaporu'] as bool?
  ..sayimBelgeBaglantisiniKopar = json['sayim_BelgeBaglantisiniKopar'] as bool?
  ..sayimBelgeOlusturabilir =
      (json['sayim_BelgeOlusturabilir'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList()
  ..sayimEkAlanlar = (json['sayim_EkAlanlar'] as List<dynamic>?)
      ?.map((e) => (e as num).toInt())
      .toList()
  ..sayimDegismeyecekAlanlar =
      (json['sayim_DegismeyecekAlanlar'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList()
  ..sayimGizlenecekAlanlar = (json['sayim_GizlenecekAlanlar'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList()
  ..sayimVarsayilanOlcuBirimi = (json['sayim_VarsayilanOlcuBirimi'] as num?)
      ?.toInt()
  ..sayimRaporu = json['sayim_Raporu'] as bool?
  ..paketOlustur = json['paket_Olustur'] as bool?
  ..paketCokluOlustur = json['paket_CokluOlustur'] as bool?
  ..paketKontrol = json['paket_Kontrol'] as bool?
  ..paketMalzemeCikisi = json['paket_MalzemeCikisi'] as bool?
  ..paketReceteyiFiltrele = json['paket_ReceteyiFiltrele'] as bool?
  ..islemlerHucreEtiket = json['islemler_HucreEtiket'] as bool?
  ..islemlerStokEtiket = json['islemler_StokEtiket'] as bool?
  ..islemlerBarkodTanimlama = json['islemler_BarkodTanimlama'] as bool?
  ..siparisMusteriSiparisi = json['siparis_MusteriSiparisi'] as bool?
  ..siparisMusteriSiparisiKaydet =
      json['siparis_MusteriSiparisi_Kaydet'] as bool?
  ..siparisMusteriSiparisiDuzelt =
      json['siparis_MusteriSiparisi_Duzelt'] as bool?
  ..siparisMusteriSiparisiSil = json['siparis_MusteriSiparisi_Sil'] as bool?
  ..siparisMusteriSiparisiKapalilarListelenmesin =
      json['siparis_MusteriSiparisi_KapalilarListelenmesin'] as bool?
  ..siparisMusteriSiparisiFiyatDegistirilmesin =
      json['siparis_MusteriSiparisi_FiyatDegistirilmesin'] as bool?
  ..siparisMusteriSiparisiFiyatSirasi =
      (json['siparis_MusteriSiparisi_FiyatSirasi'] as num?)?.toInt()
  ..siparisMusSipBirim1DenKaydet =
      json['siparis_MusSip_Birim1denKaydet'] as bool?
  ..siparisMusteriSiparisiKapatmaIslemi =
      json['siparis_MusteriSiparisi_KapatmaIslemi'] as bool?
  ..siparisMusSipOnayIslemleri = json['siparis_MusSip_OnayIslemleri'] as bool?
  ..siparisMusSipStokIhtiyacRaporu =
      json['siparis_MusSip_StokIhtiyacRaporu'] as bool?
  ..siparisMusteriSiparisiSonFiyatGoster =
      json['siparis_MusteriSiparisi_SonFiyatGoster'] as bool?
  ..siparisMusSipDigerSekmesiGoster =
      json['siparis_MusSip_DigerSekmesiGoster'] as bool?
  ..siparisMusSipEkAlan2Tablodan =
      json['siparis_MusSip_EkAlan2Tablodan'] as bool?
  ..siparisMusSipEkAlan2Hatirla = json['siparis_MusSip_EkAlan2Hatirla'] as bool?
  ..siparisMusSipMiktar1Gelsin = json['siparis_MusSip_Miktar1Gelsin'] as bool?
  ..siparisMusSipBosGecilmeyecekAlanlar =
      (json['siparis_MusSip_BosGecilmeyecekAlanlar'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList()
  ..siparisSaticiSipBosGecilmeyecekAlanlar =
      (json['siparis_SaticiSip_BosGecilmeyecekAlanlar'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList()
  ..siparisMusSipOtoPdfGor = json['siparis_MusSip_OtoPdfGor'] as bool?
  ..siparisMusSipCariKoduDegistir =
      json['siparis_MusSip_CariKoduDegistir'] as bool?
  ..siparisMusteriSiparisiAciklamaAlanlari =
      (json['siparis_MusteriSiparisi_AciklamaAlanlari'] as List<dynamic>?)
          ?.map((e) => (e as num).toInt())
          .toList()
  ..siparisMusteriSiparisiGizlenecekAlanlar =
      (json['siparis_MusteriSiparisi_GizlenecekAlanlar'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList()
  ..siparisMusteriSiparisiDegismeyecekAlanlar =
      (json['siparis_MusteriSiparisi_DegismeyecekAlanlar'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList()
  ..siparisSaticiSiparisiDegismeyecekAlanlar =
      (json['siparis_SaticiSiparisi_DegismeyecekAlanlar'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList()
  ..siparisMusSipEkstraAlanlar =
      (json['siparis_MusSip_EkstraAlanlar'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList()
  ..siparisMusteriSiparisiSatirAciklamaAlanlari =
      (json['siparis_MusteriSiparisi_SatirAciklamaAlanlari'] as List<dynamic>?)
          ?.map((e) => (e as num).toInt())
          .toList()
  ..siparisMusSipOlcuBirimi = (json['siparis_MusSip_OlcuBirimi'] as num?)
      ?.toInt()
  ..siparisMusSipBakiyesizStokSecilmesin =
      json['siparis_MusSip_BakiyesizStokSecilmesin'] as bool?
  ..siparisMusSipHizliUrunGirisiMiktar2Kullanilsin =
      json['siparis_MusSip_HizliUrunGirisi_Miktar2Kullanilsin'] as String?
  ..siparisMusteriSiparisiDipFiyatUygulamasi =
      json['siparis_MusteriSiparisi_DipFiyatUygulamasi'] as bool?
  ..siparisMusteriSiparisiDipFiyatSaha =
      json['siparis_MusteriSiparisi_DipFiyatSaha'] as String?
  ..siparisMusteriSiparisiDipFiyatEylem =
      json['siparis_MusteriSiparisi_DipFiyatEylem'] as String?
  ..siparisMusSipMaxIskUygulamasi =
      json['siparis_MusSip_MaxIskUygulamasi'] as bool?
  ..siparisMusSipMaxSatIsk1 = (json['siparis_MusSip_MaxSatIsk1'] as num?)
      ?.toDouble()
  ..siparisMusSipMaxSatIsk2 = (json['siparis_MusSip_MaxSatIsk2'] as num?)
      ?.toDouble()
  ..siparisMusSipMaxSatIsk3 = (json['siparis_MusSip_MaxSatIsk3'] as num?)
      ?.toDouble()
  ..siparisMusSipMaxSatIsk4 = (json['siparis_MusSip_MaxSatIsk4'] as num?)
      ?.toDouble()
  ..siparisMusSipMaxSatIsk5 = (json['siparis_MusSip_MaxSatIsk5'] as num?)
      ?.toDouble()
  ..siparisMusSipMaxSatIsk6 = (json['siparis_MusSip_MaxSatIsk6'] as num?)
      ?.toDouble()
  ..siparisMusSipMaxGenIsk1 = (json['siparis_MusSip_MaxGenIsk1'] as num?)
      ?.toDouble()
  ..siparisMusSipMaxGenIsk2 = (json['siparis_MusSip_MaxGenIsk2'] as num?)
      ?.toDouble()
  ..siparisMusSipMaxGenIsk3 = (json['siparis_MusSip_MaxGenIsk3'] as num?)
      ?.toDouble()
  ..siparisMusteriSiparisiRaporlar =
      json['siparis_MusteriSiparisi_Raporlar'] as bool?
  ..siparisMusteriSiparisiDurumRaporu =
      json['siparis_MusteriSiparisi_DurumRaporu'] as bool?
  ..siparisMusteriSiparisiDurumRaporuFiyatGor =
      json['siparis_MusteriSiparisi_DurumRaporuFiyatGor'] as bool?
  ..siparisMusSipKarlilikRaporu = json['siparis_MusSip_KarlilikRaporu'] as bool?
  ..siparisMusSipTeslimRaporu = json['siparis_MusSip_TeslimRaporu'] as bool?
  ..siparisSaticiSiparisi = json['siparis_SaticiSiparisi'] as bool?
  ..siparisSaticiSiparisiKaydet = json['siparis_SaticiSiparisi_Kaydet'] as bool?
  ..siparisSaticiSiparisiDuzelt = json['siparis_SaticiSiparisi_Duzelt'] as bool?
  ..siparisSaticiSiparisiSil = json['siparis_SaticiSiparisi_Sil'] as bool?
  ..siparisSaticiSiparisiKapalilarListelenmesin =
      json['siparis_SaticiSiparisi_KapalilarListelenmesin'] as bool?
  ..siparisSaticiSiparisiFiyatDegistirilmesin =
      json['siparis_SaticiSiparisi_FiyatDegistirilmesin'] as bool?
  ..siparisSaticiSiparisiFiyatSirasi =
      (json['siparis_SaticiSiparisi_FiyatSirasi'] as num?)?.toInt()
  ..siparisSaticiSipBirim1DenKaydet =
      json['siparis_SaticiSip_Birim1denKaydet'] as bool?
  ..siparisSaticiSiparisiKapatmaIslemi =
      json['siparis_SaticiSiparisi_KapatmaIslemi'] as bool?
  ..siparisSaticiSipOnayIslemleri =
      json['siparis_SaticiSip_OnayIslemleri'] as bool?
  ..siparisSaticiSipDigerSekmesiGoster =
      json['siparis_SaticiSip_DigerSekmesiGoster'] as bool?
  ..siparisSaticiSipOlcuBirimi = (json['siparis_SaticiSip_OlcuBirimi'] as num?)
      ?.toInt()
  ..siparisSaticiSipCariKoduDegistir =
      json['siparis_SaticiSip_CariKoduDegistir'] as bool?
  ..siparisSaticiSiparisiRaporlar =
      json['siparis_SaticiSiparisi_Raporlar'] as bool?
  ..siparisSaticiSiparisiDurumRaporu =
      json['siparis_SaticiSiparisi_DurumRaporu'] as bool?
  ..siparisSaticiSiparisiDurumRaporuFiyatGor =
      json['siparis_SaticiSiparisi_DurumRaporuFiyatGor'] as bool?
  ..siparisSaticiSipTeslimRaporu =
      json['siparis_SaticiSip_TeslimRaporu'] as bool?
  ..stokStokListesi = json['stok_StokListesi'] as bool?
  ..stokStokListesiExtraAlanlar =
      (json['stok_StokListesi_ExtraAlanlar'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList()
  ..stokStokKarti = json['stok_StokKarti'] as bool?
  ..stokStokKartiKaydet = json['stok_StokKarti_Kaydet'] as bool?
  ..stokStokKartiDuzelt = json['stok_StokKarti_Duzelt'] as bool?
  ..stokStokKartiSil = json['stok_StokKarti_Sil'] as bool?
  ..stokStokKartiAlisFiyatiGizle =
      json['stok_StokKarti_AlisFiyatiGizle'] as bool?
  ..stokStokKartiSatisFiyatiGizle =
      json['stok_StokKarti_SatisFiyatiGizle'] as bool?
  ..stokStokHareketleri = json['stok_StokHareketleri'] as bool?
  ..stokStokHarKaydet = json['stok_StokHar_Kaydet'] as bool?
  ..stokStokHarDuzelt = json['stok_StokHar_Duzelt'] as bool?
  ..stokStokHarSil = json['stok_StokHar_Sil'] as bool?
  ..stokStokHarPlasiyerKendiniGorsun =
      json['stok_StokHar_PlasiyerKendiniGorsun'] as bool?
  ..stokResimGoster = json['stok_ResimGoster'] as bool?
  ..stokResimGosterEkle = json['stok_ResimGoster_Ekle'] as bool?
  ..stokResimGosterSil = json['stok_ResimGoster_Sil'] as bool?
  ..stokFiyatOzeti = json['stok_FiyatOzeti'] as bool?
  ..stokHareketDetayiniGizle = json['stok_HareketDetayiniGizle'] as bool?
  ..stokGirisHareketleriniGizle = json['stok_GirisHareketleriniGizle'] as bool?
  ..stokCikisHareketleriniGizle = json['stok_CikisHareketleriniGizle'] as bool?
  ..stokBakiyeGosterimTipi = json['stok_BakiyeGosterimTipi'] as String?
  ..stokBarkodKontrol = json['stok_BarkodKontrol'] as bool?
  ..stokDepoBakiyeDurumu = json['stok_DepoBakiyeDurumu'] as String?
  ..stokBarkodTanimlama = json['stok_BarkodTanimlama'] as bool?
  ..stokBarkodTanimlamaGorunecekAlanlar =
      (json['stok_BarkodTanimlama_GorunecekAlanlar'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList()
  ..stokBarkodKayitlariGecerliBarkodTipleri =
      (json['stok_BarkodKayitlari_GecerliBarkodTipleri'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList()
  ..stokBarkodKayitlariGecerliOlcuBirimleri =
      (json['stok_BarkodKayitlari_GecerliOlcuBirimleri'] as List<dynamic>?)
          ?.map((e) => (e as num).toInt())
          .toList()
  ..stokBarkodKayitlari = json['stok_BarkodKayitlari'] as bool?
  ..stokBarkodKayitlariEkle = json['stok_BarkodKayitlari_Ekle'] as bool?
  ..stokBarkodKayitlariDuzelt = json['stok_BarkodKayitlari_Duzelt'] as bool?
  ..stokBarkodKayitlariSil = json['stok_BarkodKayitlari_Sil'] as bool?
  ..stokKanbanBarkodEsle = json['stok_KanbanBarkodEsle'] as bool?
  ..stokKanbanBarkodEsleSil = json['stok_KanbanBarkodEsle_Sil'] as bool?
  ..stokKanbanBarkodEsleFarkliStokOkutulmasin =
      json['stok_KanbanBarkodEsleFarkliStokOkutulmasin'] as bool?
  ..stokFiyatGorEkrani = json['stok_FiyatGorEkrani'] as bool?
  ..stokFiyatGorEkraniGorunecekAlanlar =
      (json['stok_FiyatGorEkraniGorunecekAlanlar'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList()
  ..stokFiyatGecmisi = json['stok_FiyatGecmisi'] as bool?
  ..stokFiyatGecmisiSil = json['stok_FiyatGecmisiSil'] as bool?
  ..stokFiyatGecmisiFiyatTipleri =
      (json['stok_FiyatGecmisiFiyatTipleri'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList()
  ..stokSeriHar = json['stok_SeriHar'] as bool?
  ..stokSeriHarEkle = json['stok_SeriHar_Ekle'] as bool?
  ..stokSeriHarDuzelt = json['stok_SeriHar_Duzelt'] as bool?
  ..stokSeriHarSil = json['stok_SeriHar_Sil'] as bool?
  ..stokSeriParcala = json['stok_SeriParcala'] as bool?
  ..stokSeriParcalaEkle = json['stok_SeriParcala_Ekle'] as bool?
  ..stokSeriParcalaDuzelt = json['stok_SeriParcala_Duzelt'] as bool?
  ..stokSeriParcalaSil = json['stok_SeriParcala_Sil'] as bool?
  ..stokSeriBirlestir = json['stok_SeriBirlestir'] as bool?
  ..stokSeriBirlestirEkle = json['stok_SeriBirlestir_Ekle'] as bool?
  ..stokSeriBirlestirDuzelt = json['stok_SeriBirlestir_Duzelt'] as bool?
  ..stokSeriBirlestirSil = json['stok_SeriBirlestir_Sil'] as bool?
  ..stokPaketleme = json['stok_Paketleme'] as bool?
  ..stokPaketlemeEkle = json['stok_Paketleme_Ekle'] as bool?
  ..stokPaketlemeSil = json['stok_Paketleme_Sil'] as bool?
  ..stokPaketlemeOnaySormasin = json['stok_Paketleme_OnaySormasin'] as String?
  ..stokPaketlemeDigerKulKayitGorebilir =
      json['stok_Paketleme_DigerKulKayitGorebilir'] as String?
  ..stokPaketlemeSorulacakBelgeTipleri =
      (json['stok_Paketleme_SorulacakBelgeTipleri'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList()
  ..stokRaporlar = json['stok_Raporlar'] as bool?
  ..stokRapAmbarMaliyet = json['stok_Rap_AmbarMaliyet'] as bool?
  ..stokRapLokalDepoBakiye = json['stok_Rap_LokalDepoBakiye'] as bool?
  ..stokRapUrunGrubunaGoreSatis = json['stok_Rap_UrunGrubunaGoreSatis'] as bool?
  ..cariCariListesi = json['cari_CariListesi'] as bool?
  ..cariCariListesiRiskGorebilir =
      json['cari_CariListesi_RiskGorebilir'] as bool?
  ..cariRiskGirisi = json['cari_RiskGirisi'] as bool?
  ..cariCariKarti = json['cari_CariKarti'] as bool?
  ..cariCariKartiKaydet = json['cari_CariKarti_Kaydet'] as bool?
  ..cariCariKartiDuzelt = json['cari_CariKarti_Duzelt'] as bool?
  ..cariCariKartiSil = json['cari_CariKarti_Sil'] as bool?
  ..cariCariKartiEIslemler = json['cari_CariKarti_EIslemler'] as bool?
  ..cariCariKartiDegismeyecekAlanlar =
      (json['cari_CariKarti_DegismeyecekAlanlar'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList()
  ..cariCariKartiGizlenecekAlanlar =
      (json['cari_CariKarti_GizlenecekAlanlar'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList()
  ..cariCariHareketleri = json['cari_CariHareketleri'] as bool?
  ..cariCariHarKaydet = json['cari_CariHar_Kaydet'] as bool?
  ..cariCariHarDuzelt = json['cari_CariHar_Duzelt'] as bool?
  ..cariCariHarSil = json['cari_CariHar_Sil'] as bool?
  ..cariCariHareketleriHarDetayGorsun =
      json['cari_CariHareketleri_HarDetayGorsun'] as bool?
  ..stokCariHarPlasiyerKendiniGorsun =
      json['stok_CariHar_PlasiyerKendiniGorsun'] as bool?
  ..cariAktivite = json['cari_Aktivite'] as bool?
  ..cariAktiviteEkle = json['cari_Aktivite_Ekle'] as bool?
  ..cariAktiviteDuzelt = json['cari_Aktivite_Duzelt'] as bool?
  ..cariAktiviteSil = json['cari_Aktivite_Sil'] as bool?
  ..cariAktiviteAtayabilir = json['cari_Aktivite_Atayabilir'] as bool?
  ..cariAktiviteBitirmeyiGeriAl = json['cari_Aktivite_BitirmeyiGeriAl'] as bool?
  ..cariOzelHesapKapatma = json['cari_OzelHesapKapatma'] as bool?
  ..cariOzelHesapKapatmaSil = json['cari_OzelHesapKapatma_Sil'] as bool?
  ..cariVadeKontrolu = json['cari_VadeKontrolu'] as bool?
  ..cariVadeKontroluGun = (json['cari_VadeKontrolu_Gun'] as num?)?.toInt()
  ..cariVadeKontroluBelgeTipleri =
      (json['cari_VadeKontrolu_BelgeTipleri'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList()
  ..cariFiltre = json['cari_Filtre'] as String?
  ..cariFiltreSql = json['cari_FiltreSQL'] as String?
  ..cariVirman = json['cari_Virman'] as bool?
  ..cariVirmanKaydet = json['cari_Virman_Kaydet'] as bool?
  ..cariHarita = json['cari_Harita'] as bool?
  ..cariTeslimCariRehberSadeceSecsin =
      json['cari_TeslimCari_RehberSadeceSecsin'] as String?
  ..cariTeslimCariSatisBaglanmisCarilerSecilsin =
      json['cari_TeslimCari_SatisBaglanmisCarilerSecilsin'] as String?
  ..cariTeslimCariAlisBaglanmisCarilerSecilsin =
      json['cari_TeslimCari_AlisBaglanmisCarilerSecilsin'] as String?
  ..cariRaporlar = json['cari_Raporlar'] as bool?
  ..cariRapEkstre = json['cari_Rap_Ekstre'] as bool?
  ..cariRapStokEkstre = json['cari_Rap_StokEkstre'] as bool?
  ..cariRapYaslandirma = json['cari_Rap_Yaslandirma'] as bool?
  ..cariRapHarDetayliYaslandir = json['cari_Rap_HarDetayliYaslandir'] as bool?
  ..cariRapHareket = json['cari_Rap_Hareket'] as bool?
  ..cariRapDovizBakiye = json['cari_Rap_DovizBakiye'] as bool?
  ..cariRapStokSatisOzeti = json['cari_Rap_StokSatisOzeti'] as bool?
  ..cariRapDovizliEkstre = json['cari_Rap_DovizliEkstre'] as bool?
  ..tahsilatTahsilatlar = json['tahsilat_Tahsilatlar'] as bool?
  ..tahsilatPayker = json['tahsilat_Payker'] as bool?
  ..tahsilatNakitTahsilat = json['tahsilat_NakitTahsilat'] as bool?
  ..tahsilatNakitTahsilatKaydet = json['tahsilat_NakitTahsilat_Kaydet'] as bool?
  ..tahsilatKKartiTahsilat = json['tahsilat_KKartiTahsilat'] as bool?
  ..tahsilatKKartiTahsilatKaydet =
      json['tahsilat_KKartiTahsilat_Kaydet'] as bool?
  ..tahsilatNakitOdeme = json['tahsilat_NakitOdeme'] as bool?
  ..tahsilatNakitOdemeKaydet = json['tahsilat_NakitOdeme_Kaydet'] as bool?
  ..tahsilatSenetTahsilat = json['tahsilat_SenetTahsilat'] as bool?
  ..tahsilatSenetTahsilatKaydet = json['tahsilat_SenetTahsilat_Kaydet'] as bool?
  ..tahsilatCekTahsilat = json['tahsilat_CekTahsilat'] as bool?
  ..tahsilatCekTahsilatKaydet = json['tahsilat_CekTahsilat_Kaydet'] as bool?
  ..tahsilatMuhtelifTahsilat = json['tahsilat_MuhtelifTahsilat'] as bool?
  ..tahsilatMuhtelifOdeme = json['tahsilat_MuhtelifOdeme'] as bool?
  ..tahsilatMuhtelifTahsilatFiltre =
      json['tahsilat_MuhtelifTahsilatFiltre'] as String?
  ..tahsilatMuhtelifTahsilatFiltreSQL =
      json['tahsilat_MuhtelifTahsilatFiltreSQL'] as String?
  ..tahsilatMuhtelifOdemeFiltre =
      json['tahsilat_MuhtelifOdemeFiltre'] as String?
  ..tahsilatMuhtelifOdemeFiltreSQL =
      json['tahsilat_MuhtelifOdemeFiltreSQL'] as String?
  ..yoneticiBankaBankaLitesi = json['yonetici_Banka_Banka_Litesi'] as bool?
  ..yoneticiBankaIslemleri = json['yonetici_Banka_Islemleri'] as bool?
  ..yoneticiBankaIslemleriSil = json['yonetici_Banka_Islemleri_Sil'] as bool?
  ..yoneticiBankaIslemHesapEft = json['yonetici_Banka_Islem_HesapEFT'] as bool?
  ..yoneticiBankaIslemHesapVirman =
      json['yonetici_Banka_Islem_HesapVirman'] as bool?
  ..yoneticiBankaIslemCariEft = json['yonetici_Banka_Islem_CariEFT'] as bool?
  ..finansBankaKasaTransferi = json['finans_Banka_Kasa_Transferi'] as bool?
  ..finansKasaListesi = json['finans_Kasa_Listesi'] as bool?
  ..finansKasaIslemleri = json['finans_Kasa_Islemleri'] as bool?
  ..finansKasaIslemleriSil = json['finans_Kasa_Islemleri_Sil'] as bool?
  ..finansKasalarArasiTransfer = json['finans_KasalarArasiTransfer'] as bool?
  ..finansKasaNakitTahsilat = json['finans_Kasa_NakitTahsilat'] as bool?
  ..finansKasaNakitOdeme = json['finans_Kasa_NakitOdeme'] as bool?
  ..finansKasaMuhtelifTahsilat = json['finans_Kasa_MuhtelifTahsilat'] as bool?
  ..finansKasaMuhtelifOdeme = json['finans_Kasa_MuhtelifOdeme'] as bool?
  ..finansKasaSenetTahsilati = json['finans_Kasa_SenetTahsilati'] as bool?
  ..finansKasaSenetOdemesi = json['finans_Kasa_SenetOdemesi'] as bool?
  ..finansKasaCekTahsilati = json['finans_Kasa_CekTahsilati'] as bool?
  ..finansKasaCekOdemesi = json['finans_Kasa_CekOdemesi'] as bool?
  ..dekontListesi = json['dekont_Listesi'] as bool?
  ..dekontKaydet = json['dekont_Kaydet'] as bool?
  ..dekontDuzelt = json['dekont_Duzelt'] as bool?
  ..dekontSil = json['dekont_Sil'] as bool?
  ..finansCekGizlenecekAlanlar =
      (json['finans_Cek_GizlenecekAlanlar'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList()
  ..finansCekMusteri = json['finans_Cek_Musteri'] as bool?
  ..finansMcekEkle = json['finans_MCEK_Ekle'] as bool?
  ..finansMcekSil = json['finans_MCEK_Sil'] as bool?
  ..finansMcekBelgeDetayi = json['finans_MCEK_BelgeDetayi'] as bool?
  ..finansMcekHareketler = json['finans_MCEK_Hareketler'] as bool?
  ..finansMcekEvraklar = json['finans_MCEK_Evraklar'] as bool?
  ..finansMcekCariyeCiro = json['finans_MCEK_CariyeCiro'] as bool?
  ..finansMcekTahsileCiro = json['finans_MCEK_TahsileCiro'] as bool?
  ..finansMcekTahsilDekontu = json['finans_MCEK_TahsilDekontu'] as bool?
  ..finansCekBorc = json['finans_Cek_Borc'] as bool?
  ..finansBorcCekiEkle = json['finans_BorcCeki_Ekle'] as bool?
  ..finansBorcCekiSil = json['finans_BorcCeki_Sil'] as bool?
  ..finansBcekEkle = json['finans_BCEK_Ekle'] as bool?
  ..finansBcekSil = json['finans_BCEK_Sil'] as bool?
  ..finansBcekBelgeDetayi = json['finans_BCEK_BelgeDetayi'] as bool?
  ..finansBcekHareketler = json['finans_BCEK_Hareketler'] as bool?
  ..finansBcekEvraklar = json['finans_BCEK_Evraklar'] as bool?
  ..finansBcekOdemeDekontu = json['finans_BCEK_OdemeDekontu'] as bool?
  ..finansSenetMusteri = json['finans_Senet_Musteri'] as bool?
  ..finansMsenEkle = json['finans_MSEN_Ekle'] as bool?
  ..finansMsenSil = json['finans_MSEN_Sil'] as bool?
  ..finansMsenBelgeDetayi = json['finans_MSEN_BelgeDetayi'] as bool?
  ..finansMsenHareketler = json['finans_MSEN_Hareketler'] as bool?
  ..finansMsenEvraklar = json['finans_MSEN_Evraklar'] as bool?
  ..finansMsenCariyeCiro = json['finans_MSEN_CariyeCiro'] as bool?
  ..finansMsenTahsileCiro = json['finans_MSEN_TahsileCiro'] as bool?
  ..finansMsenTahsilDekontu = json['finans_MSEN_TahsilDekontu'] as bool?
  ..finansSenetBorc = json['finans_Senet_Borc'] as bool?
  ..finansBsenEkle = json['finans_BSEN_Ekle'] as bool?
  ..finansBsenSil = json['finans_BSEN_Sil'] as bool?
  ..finansBsenBelgeDetayi = json['finans_BSEN_BelgeDetayi'] as bool?
  ..finansBsenHareketler = json['finans_BSEN_Hareketler'] as bool?
  ..finansBsenEvraklar = json['finans_BSEN_Evraklar'] as bool?
  ..finansBsenOdemeDekontu = json['finans_BSEN_OdemeDekontu'] as bool?
  ..finansKKartiTahsilati = json['finans_KKartiTahsilati'] as bool?
  ..finansMuhtelifTahsilat = json['finans_MuhtelifTahsilat'] as bool?
  ..finansMuhtelifOdeme = json['finans_MuhtelifOdeme'] as bool?
  ..finansTahsilatKayitlari = json['finans_TahsilatKayitlari'] as bool?
  ..finansHizliTahsilatKayitlari =
      json['finans_HizliTahsilatKayitlari'] as bool?
  ..finansHizliTahsilatKayitlariSil =
      json['finans_HizliTahsilatKayitlari_Sil'] as bool?
  ..finansOrtalamaVadeTarihiHesaplama =
      json['finans_OrtalamaVadeTarihiHesaplama'] as bool?
  ..finansOzetRapor = json['finans_OzetRapor'] as bool?
  ..finansRaporlarFinansalDurum = json['finans_Raporlar_FinansalDurum'] as bool?
  ..finansRaporlarAylikMizan = json['finans_Raporlar_AylikMizan'] as bool?
  ..temsilciProfil = json['temsilci_Profil'] as bool?
  ..temsilciProfilKdvDahil = json['temsilci_Profil_KdvDahil'] as bool?
  ..temsilciProfilSatisPerformansiniGizle =
      json['temsilci_Profil_SatisPerformansiniGizle'] as bool?
  ..temsilciProfilAylaraGoreSatisiGizle =
      json['temsilci_Profil_AylaraGoreSatisiGizle'] as bool?
  ..temsilciProfilAylaraGoreTahsilatiGizle =
      json['temsilci_Profil_AylaraGoreTahsilatiGizle'] as bool?
  ..yazdirmaBluetoothYaziciKullanabilir =
      json['yazdirma_BluetoothYaziciKullanabilir'] as bool?
  ..yazdirmaHucreEtiketi = json['yazdirma_Hucre_Etiketi'] as bool?
  ..yazdirmaHucreEtiketiYazicilari =
      (json['yazdirma_Hucre_Etiketi_Yazicilari'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList()
  ..yazdirmaDizaynHucreEtiketi =
      json['yazdirma_Dizayn_HucreEtiketi'] as List<dynamic>?
  ..yazdirmaMalToplamaEtiketi = json['yazdirma_MalToplama_Etiketi'] as bool?
  ..yazdirmaMalToplamaYazicilari =
      (json['yazdirma_Mal_Toplama_Yazicilari'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList()
  ..yazdirmaDizaynMalToplama =
      json['yazdirma_Dizayn_MalToplama'] as List<dynamic>?
  ..yazdirmaMalKontrolEtiketi = json['yazdirma_MalKontrol_Etiketi'] as bool?
  ..yazdirmaMalKontrolYazicilari =
      (json['yazdirma_Mal_Kontrol_Yazicilari'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList()
  ..yazdirmaDizaynMalKontrol =
      json['yazdirma_Dizayn_MalKontrol'] as List<dynamic>?
  ..yazdirmaDat = json['yazdirma_DAT'] as bool?
  ..yazdirmaDatYazicilari = (json['yazdirma_DAT_Yazicilari'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList()
  ..yazdirmaDizaynDAT = (json['yazdirma_Dizayn_DAT'] as List<dynamic>?)
      ?.map((e) => (e as num).toInt())
      .toList()
  ..yazdirmaPaketlemeEtiketi = json['yazdirma_Paketleme_Etiketi'] as bool?
  ..yazdirmaPaketlemeKopyaSayisiGizle =
      json['yazdirma_Paketleme_KopyaSayisiGizle'] as bool?
  ..yazdirmaPaketlemeYazicilari =
      (json['yazdirma_Paketleme_Yazicilari'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList()
  ..yazdirmaDizaynPaketleme =
      (json['yazdirma_Dizayn_Paketleme'] as List<dynamic>?)
          ?.map((e) => (e as num).toInt())
          .toList()
  ..yazdirmaSatisIrs = json['yazdirma_SatisIrs'] as bool?
  ..yazdirmaSatisFat = json['yazdirma_SatisFat'] as bool?
  ..yazdirmaSatisFatYazicilari =
      (json['yazdirma_SatisFat_Yazicilari'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList()
  ..yazdirmaDizaynSatisFat =
      (json['yazdirma_Dizayn_SatisFat'] as List<dynamic>?)
          ?.map((e) => (e as num).toInt())
          .toList()
  ..yazdirmaAlisFat = json['yazdirma_AlisFat'] as bool?
  ..yazdirmaDizaynAlisFat = json['yazdirma_Dizayn_AlisFat'] as List<dynamic>?
  ..yazdirmaMustahsil = json['yazdirma_Mustahsil'] as bool?
  ..yazdirmaMusSip = json['yazdirma_MusSip'] as bool?
  ..yazdirmaMusSipYazicilari =
      json['yazdirma_MusSip_Yazicilari'] as List<dynamic>?
  ..yazdirmaDizaynMusSip = (json['yazdirma_Dizayn_MusSip'] as List<dynamic>?)
      ?.map((e) => (e as num).toInt())
      .toList()
  ..yazdirmaSaticiSip = json['yazdirma_SaticiSip'] as bool?
  ..yazdirmaDizaynSaticiSip =
      (json['yazdirma_Dizayn_SaticiSip'] as List<dynamic>?)
          ?.map((e) => (e as num).toInt())
          .toList()
  ..yazdirmaAtal = json['yazdirma_ATAL'] as bool?
  ..yazdirmaAtalYazicilari =
      (json['yazdirma_ATAL_Yazicilari'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList()
  ..yazdirmaDizaynATAL = (json['yazdirma_Dizayn_ATAL'] as List<dynamic>?)
      ?.map((e) => (e as num).toInt())
      .toList()
  ..yazdirmaOdemeMakbuzu = json['yazdirma_OdemeMakbuzu'] as bool?
  ..yazdirmaOdemeMakbuzuYazicilari =
      json['yazdirma_OdemeMakbuzu_Yazicilari'] as List<dynamic>?
  ..yazdirmaDizaynOdemeMakbuzu =
      (json['yazdirma_Dizayn_OdemeMakbuzu'] as List<dynamic>?)
          ?.map((e) => (e as num).toInt())
          .toList()
  ..yazdirmaAlisIrs = json['yazdirma_AlisIrs'] as bool?
  ..yazdirmaAlisIrsYazicilari =
      (json['yazdirma_AlisIrs_Yazicilari'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList()
  ..yazdirmaDizaynAlisIrs = (json['yazdirma_Dizayn_AlisIrs'] as List<dynamic>?)
      ?.map((e) => (e as num).toInt())
      .toList()
  ..yazdirmaIsEmri = json['yazdirma_IsEmri'] as bool?
  ..yazdirmaAmbarCikis = json['yazdirma_AmbarCikis'] as bool?
  ..yazdirmaAmbarGiris = json['yazdirma_AmbarGiris'] as bool?
  ..yazdirmaCariHareket = json['yazdirma_CariHareket'] as bool?
  ..uretimFiyatGorebilir = json['uretim_FiyatGorebilir'] as bool?
  ..uretimUskKaydet = json['uretim_USK_Kaydet'] as bool?
  ..uretimUskDuzelt = json['uretim_USK_Duzelt'] as bool?
  ..uretimUskSil = json['uretim_USK_Sil'] as bool?
  ..uretimUskKacGunlukKayitlarListelensin =
      (json['uretim_USK_KacGunlukKayitlarListelensin'] as num?)?.toInt()
  ..uretimUskMiktarBarkoddan = json['uretim_USK_MiktarBarkoddan'] as bool?
  ..uretimUskMiktar1Gelsin = json['uretim_USK_Miktar1Gelsin'] as bool?
  ..sirketDepoUretimGiris = (json['sirket_Depo_Uretim_Giris'] as num?)?.toInt()
  ..sirketDepoUretimCikis = (json['sirket_Depo_Uretim_Cikis'] as num?)?.toInt()
  ..uretimUskIsEmriOtoGelsin = json['uretim_USK_IsEmriOtoGelsin'] as bool?
  ..uretimUskSoruSorulmasin = json['uretim_USK_SoruSorulmasin'] as bool?
  ..uretimUskStokRehberiAcilmasin =
      json['uretim_USK_StokRehberiAcilmasin'] as bool?
  ..uretimUskKlavyeEngelle = json['uretim_USK_KlavyeEngelle'] as bool?
  ..uretimUskDepoOnceligi = json['uretim_USK_DepoOnceligi'] as String?
  ..uretimUskFisiErpUretsin = json['uretim_USK_FisiErpUretsin'] as bool?
  ..uretimUskGizlenecekAlanlar =
      (json['uretim_USK_GizlenecekAlanlar'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList()
  ..uretimUskBosGecilmeyecekAlanlar =
      (json['uretim_USK_BosGecilmeyecekAlanlar'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList()
  ..uretimUskDegismeyecekAlanlar =
      (json['uretim_USK_DegismeyecekAlanlar'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList()
  ..uretimUskOlcuBirimi = (json['uretim_USK_OlcuBirimi'] as num?)?.toInt()
  ..uretimUskOtoYazdir = json['uretim_USK_OtoYazdir'] as String?
  ..uretimUskKalemliYapi = json['uretim_USK_KalemliYapi'] as bool?
  ..uretimUskKalemliYapiStokMevcutaEklensin =
      json['uretim_USK_KalemliYapi_StokMevcutaEklensin'] as bool?
  ..uretimUskKalemliYapiOtoEtiketYazdir =
      json['uretim_USK_KalemliYapi_OtoEtiketYazdir'] as bool?
  ..uretimUskKalemliYapiAyniBarkodOkutulamaz =
      json['uretim_USK_KalemliYapi_AyniBarkodOkutulamaz'] as bool?
  ..uretimUskKalemliYapiOkutulanEnUsteEklensin =
      json['uretim_USK_KalemliYapi_OkutulanEnUsteEklensin'] as bool?
  ..uretimUskKalemliYapiKalemDuzeltilemesin =
      json['uretim_USK_KalemliYapi_KalemDuzeltilemesin'] as bool?
  ..uretimReceteIzleme = json['uretim_ReceteIzleme'] as bool?
  ..uretimMalToplama = json['uretim_MalToplama'] as bool?
  ..uretimMalToplamaEkle = json['uretim_MalToplama_Ekle'] as bool?
  ..uretimMalToplamaSil = json['uretim_MalToplama_Sil'] as bool?
  ..uretimMalToplamaKlavyeEngelle =
      json['uretim_MalToplama_KlavyeEngelle'] as bool?
  ..uretimMalToplamaBarkodOkutsun =
      json['uretim_MalToplama_BarkodOkutsun'] as bool?
  ..uretimMalToplamaBelgeTipleri =
      (json['uretim_MalToplama_BelgeTipleri'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList()
  ..uretimMalToplamaReceteFiltresi =
      json['uretim_MalToplama_ReceteFiltresi'] as String?
  ..uretimMalToplamaReceteFiltresiSQL =
      json['uretim_MalToplama_ReceteFiltresiSQL'] as String?
  ..uretimIsEmri = json['uretim_IsEmri'] as bool?
  ..uretimIsemriHammaddeTakip = json['uretim_Isemri_HammaddeTakip'] as bool?
  ..uretimIsEmriEkle = json['uretim_IsEmri_Ekle'] as bool?
  ..uretimIsEmriDuzelt = json['uretim_IsEmri_Duzelt'] as bool?
  ..uretimIsEmriSil = json['uretim_IsEmri_Sil'] as bool?
  ..taltekStek = json['taltek_STEK'] as bool?
  ..taltekStekKaydet = json['taltek_STEK_Kaydet'] as bool?
  ..taltekStekDuzelt = json['taltek_STEK_Duzelt'] as bool?
  ..taltekStekSil = json['taltek_STEK_Sil'] as bool?
  ..taltekStekKapalilarListenlenmesin =
      json['taltek_STEK_KapalilarListenlenmesin'] as bool?
  ..taltekStekOnayIslemleri = json['taltek_STEK_OnayIslemleri'] as bool?
  ..taltekStekCariKoduDegistir = json['taltek_STEK_CariKoduDegistir'] as bool?
  ..taltekStekFiyatDegistirilmesin =
      json['taltek_STEK_FiyatDegistirilmesin'] as bool?
  ..taltekStekAciklamalarYetkiTuru =
      json['taltek_STEK_Aciklamalar_YetkiTuru'] as String?
  ..taltekStekGizlenecekAlanlar =
      (json['taltek_STEK_GizlenecekAlanlar'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList()
  ..taltekStekDegismeyecekAlanlar =
      (json['taltek_STEK_DegismeyecekAlanlar'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList()
  ..taltekAtalDegismeyecekAlanlar =
      (json['taltek_ATAL_DegismeyecekAlanlar'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList()
  ..taltekStalDegismeyecekAlanlar =
      (json['taltek_STAL_DegismeyecekAlanlar'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList()
  ..taltekStekBosGecilmeyecekAlanlar =
      (json['taltek_STEK_BosGecilmeyecekAlanlar'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList()
  ..taltekStalBosGecilmeyecekAlanlar =
      (json['taltek_STAL_BosGecilmeyecekAlanlar'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList()
  ..taltekAtalBosGecilmeyecekAlanlar =
      (json['taltek_ATAL_BosGecilmeyecekAlanlar'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList()
  ..taltekStekAciklamaAlanlari =
      (json['taltek_STEK_AciklamaAlanlari'] as List<dynamic>?)
          ?.map((e) => (e as num).toInt())
          .toList()
  ..taltekStekOzelKod1degeri = json['taltek_STEK_OzelKod1degeri'] as String?
  ..taltekStekDipFiyatUygulamasi =
      json['taltek_STEK_DipFiyatUygulamasi'] as bool?
  ..taltekStekDipFiyatSaha = json['taltek_STEK_DipFiyatSaha'] as String?
  ..taltekStekDipFiyatEylem = json['taltek_STEK_DipFiyatEylem'] as String?
  ..taltekAtal = json['taltek_ATAL'] as bool?
  ..taltekAtalKaydet = json['taltek_ATAL_Kaydet'] as bool?
  ..taltekAtalDuzelt = json['taltek_ATAL_Duzelt'] as bool?
  ..taltekAtalSil = json['taltek_ATAL_Sil'] as bool?
  ..taltekAtalCariEMailAlani = json['taltek_ATAL_CariEMailAlani'] as String?
  ..taltekAtalOnayIslemleri = json['taltek_ATAL_OnayIslemleri'] as bool?
  ..taltekAtalCariKoduDegistir = json['taltek_ATAL_CariKoduDegistir'] as bool?
  ..taltekAtalAciklamalarYetkiTuru =
      json['taltek_ATAL_Aciklamalar_YetkiTuru'] as String?
  ..taltekAtalGizlenecekAlanlar =
      (json['taltek_ATAL_GizlenecekAlanlar'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList()
  ..taltekAtalAciklamaAlanlari =
      (json['taltek_ATAL_AciklamaAlanlari'] as List<dynamic>?)
          ?.map((e) => (e as num).toInt())
          .toList()
  ..taltekAtalBelgeKopyala = json['taltek_ATAL_BelgeKopyala'] as bool?
  ..taltekStekBelgeKopyala = json['taltek_STEK_BelgeKopyala'] as bool?
  ..taltekStal = json['taltek_STAL'] as bool?
  ..taltekStalKaydet = json['taltek_STAL_Kaydet'] as bool?
  ..taltekStalDuzelt = json['taltek_STAL_Duzelt'] as bool?
  ..taltekStalSil = json['taltek_STAL_Sil'] as bool?
  ..taltekStalKapalilarListenlenmesin =
      json['taltek_STAL_KapalilarListenlenmesin'] as bool?
  ..taltekStalOnayIslemleri = json['taltek_STAL_OnayIslemleri'] as bool?
  ..taltekStalCariKoduDegistir = json['taltek_STAL_CariKoduDegistir'] as bool?
  ..taltekStalFiyatDegistirilmesin =
      json['taltek_STAL_FiyatDegistirilmesin'] as bool?
  ..taltekStalGizlenecekAlanlar =
      (json['taltek_STAL_GizlenecekAlanlar'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList()
  ..taltekStalDipFiyatUygulamasi =
      json['taltek_STAL_DipFiyatUygulamasi'] as bool?
  ..ebelgeEFat = json['ebelge_EFat'] as bool?
  ..ebelgeEFatCariGuncelle = json['ebelge_EFatCariGuncelle'] as bool?
  ..ebelgeEFatSorgula = json['ebelge_EFatSorgula'] as bool?
  ..ebelgeEFatGelenKutusu = json['ebelge_EFatGelenKutusu'] as bool?
  ..ebelgeEFatTaslakOlustur = json['ebelge_EFatTaslakOlustur'] as bool?
  ..ebelgeEFatTaslakSil = json['ebelge_EFatTaslakSil'] as bool?
  ..ebelgeEFatTaslakBasim = json['ebelge_EFatTaslakBasim'] as bool?
  ..ebelgeEFatGoruntule = json['ebelge_EFatGoruntule'] as bool?
  ..ebelgeEFatAlisFatOlustur = json['ebelge_EFatAlisFatOlustur'] as bool?
  ..ebelgeEFatGonder = json['ebelge_EFatGonder'] as bool?
  ..ebelgeEFatDizayn = (json['ebelge_EFat_Dizayn'] as num?)?.toInt()
  ..ebelgeEArsiv = json['ebelge_EArsiv'] as bool?
  ..ebelgeEArsivTaslakOlustur = json['ebelge_EArsivTaslakOlustur'] as bool?
  ..ebelgeEArsivTaslakSil = json['ebelge_EArsivTaslakSil'] as bool?
  ..ebelgeEArsivTaslakBasim = json['ebelge_EArsivTaslakBasim'] as bool?
  ..ebelgeEArsivGoruntule = json['ebelge_EArsivGoruntule'] as bool?
  ..ebelgeEArsivSorgula = json['ebelge_EArsivSorgula'] as bool?
  ..ebelgeEArsivGonder = json['ebelge_EArsivGonder'] as bool?
  ..ebelgeEArsivDizayn = (json['ebelge_EArsiv_Dizayn'] as num?)?.toInt()
  ..ebelgeEIrsaliye = json['ebelge_EIrsaliye'] as bool?
  ..ebelgeEFaturaGidenKutusu = json['ebelge_EFatGidenKutusu'] as bool?
  ..ebelgeEIrsaliyeGidenKutusu = json['ebelge_EIrsaliyeGidenKutusu'] as bool?
  ..ebelgeEIrsaliyeGelenKutusu = json['ebelge_EIrsaliyeGelenKutusu'] as bool?
  ..ebelgeEIrsaliyeTaslakOlustur =
      json['ebelge_EIrsaliyeTaslakOlustur'] as bool?
  ..ebelgeEIrsaliyeTaslakSil = json['ebelge_EIrsaliyeTaslakSil'] as bool?
  ..ebelgeEIrsaliyeTaslakBasim = json['ebelge_EIrsaliyeTaslakBasim'] as bool?
  ..ebelgeEIrsaliyeGonder = json['ebelge_EIrsaliyeGonder'] as bool?
  ..ebelgeEIrsaliyeGoruntule = json['ebelge_EIrsaliyeGoruntule'] as bool?
  ..ebelgeEIrsaliyeDizayn = (json['ebelge_EIrsaliye_Dizayn'] as num?)?.toInt()
  ..entegrasyonUetdsesya = json['entegrasyon_UETDSESYA'] as bool?
  ..entegrasyonUetdsesyaIptal = json['entegrasyon_UETDSESYA_Iptal'] as bool?
  ..transferDatTekrarEdenBarkod =
      json['transfer_DAT_TekrarEdenBarkod'] as String?
  ..transferDatAciklamaDuzenle = json['transfer_DAT_AciklamaDuzenle'] as bool?
  ..transferDatLokalDatSeciliGelmesin =
      json['transfer_DAT_LokalDATSeciliGelmesin'] as bool?
  ..transferDatVarsayilanHarTuruDegistiremesin =
      json['transfer_DAT_VarsayilanHarTuruDegistiremesin'] as bool?
  ..transferDatDepoCaridenGelsin =
      json['transfer_DAT_DepoCaridenGelsin'] as bool?
  ..transferAgSipBagSecenegi = json['transfer_AG_SipBagSecenegi'] as String?
  ..transferAgTekrarEdenBarkod = json['transfer_AG_TekrarEdenBarkod'] as String?
  ..transferAgAciklamaDuzenle = json['transfer_AG_AciklamaDuzenle'] as bool?
  ..transferAcSipBagSecenegi = json['transfer_AC_SipBagSecenegi'] as String?
  ..transferAcTekrarEdenBarkod = json['transfer_AC_TekrarEdenBarkod'] as String?
  ..transferAcAciklamaDuzenle = json['transfer_AC_AciklamaDuzenle'] as bool?
  ..transferDepoTalebiBildirim = json['transfer_DepoTalebi_Bildirim'] as bool?
  ..uretimUsk = json['uretim_USK'] as bool?
  ..malKabulAlisIrsDegismeyecekAlanlar =
      (json['malKabul_AlisIrs_DegismeyecekAlanlar'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList()
  ..malKabulAlisIrsAciklamaDuzenle =
      json['malKabul_AlisIrs_AciklamaDuzenle'] as bool?
  ..malKabulAlisFatDegismeyecekAlanlar =
      (json['malKabul_AlisFat_DegismeyecekAlanlar'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList()
  ..malKabulAlisFatAciklamaDuzenle =
      json['malKabul_AlisFat_AciklamaDuzenle'] as bool?
  ..malKabulAlisFatTekrarEdenBarkod =
      json['malKabul_AlisFat_TekrarEdenBarkod'] as String?
  ..malKabulAlisFaturasiSipBagSecenegi =
      json['malKabul_AlisFaturasi_SipBagSecenegi'] as String?
  ..sevkiyatSatisIrsVarsayilanBelgeTipi =
      (json['sevkiyat_SatisIrs_VarsayilanBelgeTipi'] as num?)?.toInt()
  ..sevkiyatSatisIrsaliyesiAciklamaAlanlari =
      (json['sevkiyat_SatisIrsaliyesi_AciklamaAlanlari'] as List<dynamic>?)
          ?.map((e) => (e as num).toInt())
          .toList()
  ..sevkiyatSatisIrsaliyesiAciklamaDuzenle =
      json['sevkiyat_SatisIrsaliyesi_AciklamaDuzenle'] as bool?
  ..sevkiyatSatisIrsKayittanSonraTaslakOlustur =
      json['sevkiyat_SatisIrs_KayittanSonraTaslakOlustur'] as bool?
  ..sevkiyatSatisIrsIadeMiktariGirebilir =
      json['sevkiyat_SatisIrs_IadeMiktariGirebilir'] as bool?
  ..sevkiyatSatisIrsIadeMiktariGirebilirFarkliDepo =
      json['sevkiyat_SatisIrs_IadeMiktariGirebilirFarkliDepo'] as bool?
  ..sevkiyatSatisIrsTekrarEdenBarkod =
      json['sevkiyat_SatisIrs_TekrarEdenBarkod'] as String?
  ..sevkiyatSatisFatAciklamaDuzenle =
      json['sevkiyat_SatisFat_AciklamaDuzenle'] as bool?
  ..sevkiyatSatisFatIadeMiktariGirebilir =
      json['sevkiyat_SatisFat_IadeMiktariGirebilir'] as bool?
  ..sevkiyatSatisFatIadeMiktariGirebilirFarkliDepo =
      json['sevkiyat_SatisFat_IadeMiktariGirebilirFarkliDepo'] as bool?
  ..sevkiyatSatisFaturasiTekrarEdenBarkod =
      json['sevkiyat_SatisFaturasi_TekrarEdenBarkod'] as String?
  ..sevkemriMalToplamaYontemi = json['sevkemri_MalToplama_Yontemi'] as String?
  ..sayimSerbestSayimFiltreIslem =
      json['sayim_SerbestSayimFiltreIslem'] as String?
  ..siparisMusSipBelgeKopyala = json['siparis_MusSip_BelgeKopyala'] as bool?
  ..siparisMusSipTekrarEdenBarkod =
      json['siparis_MusSip_TekrarEdenBarkod'] as String?
  ..siparisMusSipKacGunlukKayitlarListelensin =
      (json['siparis_MusSip_KacGunlukKayitlarListelensin'] as num?)?.toInt()
  ..siparisMusteriSiparisiAciklamaDuzenle =
      json['siparis_MusteriSiparisi_AciklamaDuzenle'] as bool?
  ..stokFiltreSqlTipi = json['stok_FiltreSQLTipi'] as String?
  ..stokFiyatGorEkraniGunlukKurdanTlGoster =
      json['stok_FiyatGorEkrani_GunlukKurdanTLGoster'] as bool?
  ..stokPaketlemeCoklu = json['stok_Paketleme_Coklu'] as bool?
  ..stokRehberBakiyesindeDigerOlcuBirimleriGorunsun =
      json['stok_RehberBakiyesindeDigerOlcuBirimleriGorunsun'] as bool?
  ..stokYazdirPdfGoruntule = json['stok_YazdirPdfGoruntule'] as bool?
  ..cariToplamGorunmesin = json['cari_ToplamGorunmesin'] as bool?
  ..cariBakiyeGosterim = json['cari_BakiyeGosterim'] as String?
  ..cariFiltreSqlTipi = json['cari_FiltreSQLTipi'] as String?
  ..tahsilatDovizKuruDegeri = json['tahsilat_DovizKuru_Degeri'] as String?
  ..tahsilatDovizKuruYetki = json['tahsilat_DovizKuru_Yetki'] as String?
  ..tahsilatDovizKuruTolerans = (json['tahsilat_DovizKuru_Tolerans'] as num?)
      ?.toDouble()
  ..finansRaporlarKasaEkstre = json['finans_Raporlar_KasaEkstre'] as bool?
  ..finansKasaGizlenecekAlanlar =
      (json['finans_Kasa_GizlenecekAlanlar'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList()
  ..finansKasaDegistirilemeyecekAlanlar =
      (json['finans_Kasa_DegistirilemeyecekAlanlar'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList()
  ..finansKasaBosGecilemeyecekAlanlar =
      (json['finans_Kasa_BosGecilemeyecekAlanlar'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList()
  ..taltekStekAciklamaDuzenle = json['taltek_STEK_AciklamaDuzenle'] as bool?
  ..taltekStekDipFiyatKdvDurumu =
      json['taltek_STEK_DipFiyatKDVDurumu'] as String?
  ..taltekStalAciklamaDuzenle = json['taltek_STAL_AciklamaDuzenle'] as bool?
  ..taltekStalDipFiyatSaha = json['taltek_STAL_DipFiyatSaha'] as String?
  ..taltekStalDipFiyatEylem = json['taltek_STAL_DipFiyatEylem'] as String?
  ..taltekStalDipFiyatKdvDurumu =
      json['taltek_STAL_DipFiyatKDVDurumu'] as String?
  ..malKabulAlisIrsBirim1DenKaydet =
      json['malKabul_AlisIrs_Birim1denKaydet'] as bool?
  ..malKabulAlisFatBirim1DenKaydet =
      json['malKabul_AlisFat_Birim1denKaydet'] as bool?
  ..transferAgBirim1DenKaydet = json['transfer_AG_Birim1denKaydet'] as bool?
  ..transferAcBirim1DenKaydet = json['transfer_AC_Birim1denKaydet'] as bool?
  ..sevkiyatSatisIrsKdvSifirGelsin =
      json['sevkiyat_SatisIrs_KDVSifirGelsin'] as bool?
  ..sevkiyatSatisIrsBirim1DenKaydet =
      json['sevkiyat_SatisIrs_Birim1denKaydet'] as bool?
  ..sevkiyatSatisIrsDipFiyatKdvDurumu =
      json['sevkiyat_SatisIrs_DipFiyatKDVDurumu'] as String?
  ..sevkiyatSatisFatBirim1DenKaydet =
      json['sevkiyat_SatisFat_Birim1denKaydet'] as bool?
  ..siparisMusteriSiparisiDipFiyatKdvDurumu =
      json['siparis_MusteriSiparisi_DipFiyatKDVDurumu'] as String?
  ..siparisSatSipTekrarEdenBarkod =
      json['siparis_SatSip_TekrarEdenBarkod'] as String?
  ..siparisSatSipKacGunlukKayitlarListelensin =
      (json['siparis_SatSip_KacGunlukKayitlarListelensin'] as num?)?.toInt()
  ..cariRapBorcAlacakDokumu = json['cari_Rap_BorcAlacakDokumu'] as bool?
  ..sirketProjeYetkiTuru = json['sirket_Proje_YetkiTuru'] as String?
  ..transferDatVarsayilanHarTuru =
      json['transfer_DAT_VarsayilanHarTuru'] as String?
  ..siparisMusSipKdvDurumu = json['siparis_MusSip_KdvDurumu'] as String?
  ..siparisSaticiSiparisiAciklamaDuzenle =
      json['siparis_SaticiSiparisi_AciklamaDuzenle'] as bool?
  ..taltekStekKdvDurumu = json['taltek_STEK_KdvDurumu'] as String?
  ..taltekStalKdvDurumu = json['taltek_STAL_KdvDurumu'] as String?
  ..transferAgBosGecilmeyecekAlanlar =
      (json['transfer_AG_BosGecilmeyecekAlanlar'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList()
  ..transferAgGizlenecekAlanlar =
      (json['transfer_AG_GizlenecekAlanlar'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList()
  ..transferAgDegismeyecekAlanlar =
      (json['transfer_AG_DegismeyecekAlanlar'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList()
  ..transferAgAciklamaAlanlari =
      (json['transfer_AG_AciklamaAlanlari'] as List<dynamic>?)
          ?.map((e) => (e as num).toInt())
          .toList()
  ..transferAcAciklamaAlanlari =
      (json['transfer_AC_AciklamaAlanlari'] as List<dynamic>?)
          ?.map((e) => (e as num).toInt())
          .toList()
  ..sevkiyatSatisFatKdvDurumu = json['sevkiyat_SatisFat_KdvDurumu'] as String?
  ..sigmaOlcumGir = json['sigma_OlcumGir'] as bool?
  ..sigmaOlcumGirKaydet = json['sigma_OlcumGir_Kaydet'] as bool?
  ..sigmaOlcumGirDuzelt = json['sigma_OlcumGir_Duzelt'] as bool?
  ..sigmaOlcumGirSil = json['sigma_OlcumGir_Sil'] as bool?
  ..sigmaTeknikResim = json['sigma_TeknikResim'] as bool?
  ..sigmaKontrolPlani = json['sigma_KontrolPlani'] as bool?
  ..transferDatEIrsaliyeIsaretDurum =
      json['transfer_DAT_EIrsaliyeIsaretDurum'] as String?
  ..transferAcEIrsaliyeIsaretDurum =
      json['transfer_AC_EIrsaliyeIsaretDurum'] as String?
  ..sevkiyatSatisIrsaliyesiEIrsaliyeIsaretDurum =
      json['sevkiyat_SatisIrsaliyesi_EIrsaliyeIsaretDurum'] as String?
  ..sayimAyniBarkodEngelle = json['sayim_AyniBarkodEngelle'] as bool?
  ..siparisMusSipBildirim = json['siparis_MusSip_Bildirim'] as bool?
  ..siparisSatSipBildirim = json['siparis_SatSip_Bildirim'] as bool?
  ..stokStokKartiFiyatlariGizle = json['stok_StokKarti_FiyatlariGizle'] as bool?
  ..stokBarkodTanimlamaZorunluBarkodTipi =
      json['stok_BarkodTanimlama_ZorunluBarkodTipi'] as String?
  ..stokCariStokFiltresiUygulansin =
      json['stok_CariStokFiltresiUygulansin'] as bool?
  ..cariKodDegistir = json['cari_KodDegistir'] as bool?
  ..cariRapDovizliBorcAlacakDokumu =
      json['cari_Rap_DovizliBorcAlacakDokumu'] as bool?
  ..cariRapUrunGrubunaGoreSatis = json['cari_Rap_UrunGrubunaGoreSatis'] as bool?
  ..finansKasaNakitTahsilatKasaBakGizle =
      json['finans_Kasa_NakitTahsilat_KasaBakGizle'] as bool?
  ..finansKasaNakitOdemeKasaBakGizle =
      json['finans_Kasa_NakitOdeme_KasaBakGizle'] as bool?
  ..finansKasaKacGunlukKayitlarListelensin =
      (json['finans_Kasa_KacGunlukKayitlarListelensin'] as num?)?.toInt()
  ..yazdirmaMustahsilYazicilari =
      json['yazdirma_Mustahsil_Yazicilari'] as List<dynamic>?
  ..yazdirmaDizaynMustahsil =
      (json['yazdirma_Dizayn_Mustahsil'] as List<dynamic>?)
          ?.map((e) => (e as num).toInt())
          .toList()
  ..yazdirmaSaticiSipYazicilari =
      json['yazdirma_SaticiSip_Yazicilari'] as List<dynamic>?
  ..yazdirmaSatisTeklifiYazicilari =
      json['yazdirma_SatisTeklifi_Yazicilari'] as List<dynamic>?
  ..yazdirmaTahsilatMakbuzuYazicilari =
      json['yazdirma_TahsilatMakbuzu_Yazicilari'] as List<dynamic>?
  ..sirketDepoYetkiTuru = json['sirket_Depo_YetkiTuru'] as String?
  ..siparisMusSipOzelKod1Degeri =
      json['siparis_MusSip_OzelKod1Degeri'] as String?
  ..siparisSaticiSiparisiSatirAciklamaAlanlari =
      (json['siparis_SaticiSiparisi_SatirAciklamaAlanlari'] as List<dynamic>?)
          ?.map((e) => (e as num).toInt())
          .toList()
  ..transferAgOtoPdfGor = json['transfer_AG_OtoPdfGor'] as bool?
  ..transferAgBildirim = json['transfer_AG_Bildirim'] as bool?
  ..transferAgEMailGonder = json['transfer_AG_EMailGonder'] as bool?
  ..transferAgEMailGonderBaslik =
      json['transfer_AG_EMailGonder_Baslik'] as String?
  ..transferAgEMailGonderDizayn =
      (json['transfer_AG_EMailGonder_Dizayn'] as num?)?.toInt()
  ..transferAcOtoPdfGor = json['transfer_AC_OtoPdfGor'] as bool?
  ..transferAcBildirim = json['transfer_AC_Bildirim'] as bool?
  ..transferAcEMailGonder = json['transfer_AC_EMailGonder'] as bool?
  ..transferAcEMailGonderBaslik =
      json['transfer_AC_EMailGonder_Baslik'] as String?
  ..transferAcEMailGonderDizayn =
      (json['transfer_AC_EMailGonder_Dizayn'] as num?)?.toInt()
  ..malKabulAlisIrsOtoPdfGor = json['malKabul_AlisIrs_OtoPdfGor'] as bool?
  ..malKabulAlisIrsBildirim = json['malKabul_AlisIrs_Bildirim'] as bool?
  ..malKabulAlisIrsEMailGonder = json['malKabul_AlisIrs_EMailGonder'] as bool?
  ..malKabulAlisIrsEMailGonderBaslik =
      json['malKabul_AlisIrs_EMailGonder_Baslik'] as String?
  ..malKabulAlisIrsEMailGonderDizayn =
      (json['malKabul_AlisIrs_EMailGonder_Dizayn'] as num?)?.toInt()
  ..malKabulAlisFatBildirim = json['malKabul_AlisFat_Bildirim'] as bool?
  ..malKabulAlisFatEMailGonder = json['malKabul_AlisFat_EMailGonder'] as bool?
  ..malKabulAlisFatEMailGonderBaslik =
      json['malKabul_AlisFat_EMailGonder_Baslik'] as String?
  ..malKabulAlisFatEMailGonderDizayn =
      (json['malKabul_AlisFat_EMailGonder_Dizayn'] as num?)?.toInt()
  ..transferDatOtoPdfGor = json['transfer_DAT_OtoPdfGor'] as bool?
  ..transferDatBildirim = json['transfer_DAT_Bildirim'] as bool?
  ..transferDatEMailGonder = json['transfer_DAT_EMailGonder'] as bool?
  ..transferDatEMailGonderBaslik =
      json['transfer_DAT_EMailGonder_Baslik'] as String?
  ..transferDatEMailGonderDizayn =
      (json['transfer_DAT_EMailGonder_Dizayn'] as num?)?.toInt()
  ..sevkiyatSatisIrsOtoPdfGor = json['sevkiyat_SatisIrs_OtoPdfGor'] as bool?
  ..sevkiyatSatisIrsBildirim = json['sevkiyat_SatisIrs_Bildirim'] as bool?
  ..sevkiyatSatisIrsEMailGonder = json['sevkiyat_SatisIrs_EMailGonder'] as bool?
  ..sevkiyatSatisIrsEMailGonderBaslik =
      json['sevkiyat_SatisIrs_EMailGonder_Baslik'] as String?
  ..sevkiyatSatisIrsEMailGonderDizayn =
      (json['sevkiyat_SatisIrs_EMailGonder_Dizayn'] as num?)?.toInt()
  ..sevkiyatSatisFatOtoPdfGor = json['sevkiyat_SatisFat_OtoPdfGor'] as bool?
  ..sevkiyatSatisFatOzelKod1Degeri =
      json['sevkiyat_SatisFat_OzelKod1Degeri'] as String?
  ..sevkiyatSatisFatOzelKod2Degeri =
      json['sevkiyat_SatisFat_OzelKod2Degeri'] as String?
  ..sevkiyatSatisFatBildirim = json['sevkiyat_SatisFat_Bildirim'] as bool?
  ..sevkiyatSatisFatEMailGonder = json['sevkiyat_SatisFat_EMailGonder'] as bool?
  ..sevkiyatSatisFatEMailGonderBaslik =
      json['sevkiyat_SatisFat_EMailGonder_Baslik'] as String?
  ..sevkiyatSatisFatEMailGonderDizayn =
      (json['sevkiyat_SatisFat_EMailGonder_Dizayn'] as num?)?.toInt()
  ..sayimEkAlan1 = json['sayim_EkAlan1'] as bool?
  ..sayimEkAlan1Zorunlu = json['sayim_EkAlan1_Zorunlu'] as bool?
  ..sayimEkAlan2 = json['sayim_EkAlan2'] as bool?
  ..sayimEkAlan2Zorunlu = json['sayim_EkAlan2_Zorunlu'] as bool?
  ..sayimEkAlan3 = json['sayim_EkAlan3'] as bool?
  ..sayimEkAlan3Zorunlu = json['sayim_EkAlan3_Zorunlu'] as bool?
  ..sayimEkAlan4 = json['sayim_EkAlan4'] as bool?
  ..sayimEkAlan4Zorunlu = json['sayim_EkAlan4_Zorunlu'] as bool?
  ..sayimEkAlan5 = json['sayim_EkAlan5'] as bool?
  ..sayimEkAlan5Zorunlu = json['sayim_EkAlan5_Zorunlu'] as bool?
  ..siparisMusSipEMailGonder = json['siparis_MusSip_EMailGonder'] as bool?
  ..siparisMusSipEMailGonderBaslik =
      json['siparis_MusSip_EMailGonder_Baslik'] as String?
  ..siparisMusSipEMailGonderDizayn =
      (json['siparis_MusSip_EMailGonder_Dizayn'] as num?)?.toInt()
  ..siparisSaticiSipOtoPdfGor = json['siparis_SaticiSip_OtoPdfGor'] as bool?
  ..siparisSatSipEMailGonder = json['siparis_SatSip_EMailGonder'] as bool?
  ..siparisSatSipEMailGonderBaslik =
      json['siparis_SatSip_EMailGonder_Baslik'] as String?
  ..siparisSatSipEMailGonderDizayn =
      (json['siparis_SatSip_EMailGonder_Dizayn'] as num?)?.toInt()
  ..taltekStekBildirim = json['taltek_STEK_Bildirim'] as bool?
  ..taltekStekEMailGonder = json['taltek_STEK_EMailGonder'] as bool?
  ..taltekStekEMailGonderBaslik =
      json['taltek_STEK_EMailGonder_Baslik'] as String?
  ..taltekStekEMailGonderDizayn =
      (json['taltek_STEK_EMailGonder_Dizayn'] as num?)?.toInt()
  ..taltekAtalBildirim = json['taltek_ATAL_Bildirim'] as bool?
  ..taltekAtalEMailGonder = json['taltek_ATAL_EMailGonder'] as bool?
  ..taltekAtalEMailGonderBaslik =
      json['taltek_ATAL_EMailGonder_Baslik'] as String?
  ..taltekAtalEMailGonderDizayn =
      (json['taltek_ATAL_EMailGonder_Dizayn'] as num?)?.toInt()
  ..taltekStalBildirim = json['taltek_STAL_Bildirim'] as bool?
  ..taltekStalEMailGonder = json['taltek_STAL_EMailGonder'] as bool?
  ..taltekStalEMailGonderBaslik =
      json['taltek_STAL_EMailGonder_Baslik'] as String?
  ..taltekStalEMailGonderDizayn =
      (json['taltek_STAL_EMailGonder_Dizayn'] as num?)?.toInt()
  ..ebelgeEFatSatirdaIskDikkateAlma =
      json['ebelge_EFat_SatirdaIskDikkateAlma'] as String?
  ..ebelgeEArsivSatirdaIskDikkateAlma =
      json['ebelge_EArsiv_SatirdaIskDikkateAlma'] as String?
  ..transferAgOzelKod1Degeri = json['transfer_AG_OzelKod1Degeri'] as String?
  ..transferAgOzelKod2Degeri = json['transfer_AG_OzelKod2Degeri'] as String?
  ..transferAgVarsayilanMasrafKodu =
      json['transfer_AG_VarsayilanMasrafKodu'] as String?
  ..transferAcVarsayilanMasrafKodu =
      json['transfer_AC_VarsayilanMasrafKodu'] as String?
  ..transferAcOzelKod1Degeri = json['transfer_AC_OzelKod1Degeri'] as String?
  ..transferAcOzelKod2Degeri = json['transfer_AC_OzelKod2Degeri'] as String?
  ..malKabulAlisIrsOzelKod1Degeri =
      json['malKabul_AlisIrs_OzelKod1Degeri'] as String?
  ..malKabulAlisIrsOzelKod2Degeri =
      json['malKabul_AlisIrs_OzelKod2Degeri'] as String?
  ..sevkiyatSatisIrsOzelKod1Degeri =
      json['sevkiyat_SatisIrs_OzelKod1Degeri'] as String?
  ..sevkiyatSatisIrsOzelKod2Degeri =
      json['sevkiyat_SatisIrs_OzelKod2Degeri'] as String?
  ..siparisMusSipOzelKod2Degeri =
      json['siparis_MusSip_OzelKod2Degeri'] as String?
  ..taltekStekOzelKod1Degeri = json['taltek_STEK_OzelKod1Degeri'] as String?
  ..taltekStekOzelKod2Degeri = json['taltek_STEK_OzelKod2Degeri'] as String?
  ..taltekStalOzelKod1Degeri = json['taltek_STAL_OzelKod1Degeri'] as String?
  ..taltekStalOzelKod2Degeri = json['taltek_STAL_OzelKod2Degeri'] as String?
  ..sevkiyatSatisFatAciklamalarYetkiTuru =
      json['sevkiyat_SatisFat_Aciklamalar_YetkiTuru'] as String?
  ..taltekStalAciklamalarYetkiTuru =
      json['taltek_STAL_Aciklamalar_YetkiTuru'] as String?
  ..taltekStalAciklamaAlanlari =
      (json['taltek_STAL_AciklamaAlanlari'] as List<dynamic>?)
          ?.map((e) => (e as num).toInt())
          .toList()
  ..uretimUskBarkodSayisiSaklanacakAlan =
      json['uretim_USK_BarkodSayisiSaklanacakAlan'] == null
      ? null
      : BarkodSayisiSaklanacakAlan.fromJson(
          json['uretim_USK_BarkodSayisiSaklanacakAlan'] as String,
        )
  ..malKabulAlisIrsBarkodSayisiSaklanacakAlan =
      json['malKabul_AlisIrs_BarkodSayisiSaklanacakAlan'] == null
      ? null
      : BarkodSayisiSaklanacakAlan.fromJson(
          json['malKabul_AlisIrs_BarkodSayisiSaklanacakAlan'] as String,
        )
  ..malKabulAlisFatBarkodSayisiSaklanacakAlan =
      json['malKabul_AlisFat_BarkodSayisiSaklanacakAlan'] == null
      ? null
      : BarkodSayisiSaklanacakAlan.fromJson(
          json['malKabul_AlisFat_BarkodSayisiSaklanacakAlan'] as String,
        )
  ..transferDatBarkodSayisiSaklanacakAlan =
      json['transfer_DAT_BarkodSayisiSaklanacakAlan'] == null
      ? null
      : BarkodSayisiSaklanacakAlan.fromJson(
          json['transfer_DAT_BarkodSayisiSaklanacakAlan'] as String,
        )
  ..sevkiyatSatisIrsBarkodSayisiSaklanacakAlan =
      json['sevkiyat_SatisIrs_BarkodSayisiSaklanacakAlan'] == null
      ? null
      : BarkodSayisiSaklanacakAlan.fromJson(
          json['sevkiyat_SatisIrs_BarkodSayisiSaklanacakAlan'] as String,
        )
  ..sevkiyatSatisFatSipBagSipOkutulsunKalanMiktarGelsin =
      json['sevkiyat_SatisFat_SipBag_SipOkutulsun_KalanMiktarGelsin'] as String?
  ..transferAcVarsayilanHarTuru =
      json['transfer_AC_VarsayilanHarTuru'] as String?
  ..transferAcVarsayilanCikisYeri =
      json['transfer_AC_VarsayilanCikisYeri'] as String?
  ..transferDepoTalebiRehberdenStokSecilmesin =
      json['transfer_DepoTalebi_RehberdenStokSecilmesin'] as String?
  ..stokCariHarGizlenecekAlanlar =
      (json['stok_CariHar_GizlenecekAlanlar'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList()
  ..transferDatOzelKod1Degeri = json['transfer_DAT_OzelKod1Degeri'] as String?
  ..transferDatOzelKod2Degeri = json['transfer_DAT_OzelKod2Degeri'] as String?
  ..transferDepoTalebiBildirimKullanicilar =
      (json['transfer_DepoTalebi_BildirimKullanicilar'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList()
  ..uretimIsemriFireDusmeYontemi =
      json['URETIM_ISEMRI_FIRE_DUSME_YONTEMI'] as String?
  ..yazdirmaAlisFatYazicilari =
      (json['YAZDIRMA_ALIS_FAT_YAZICILARI'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList()
  ..yazdirmaAmbarCikisYazicilari =
      (json['YAZDIRMA_AMBAR_CIKIS_YAZICILARI'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList()
  ..yazdirmaDizaynAmbarCikis =
      (json['YAZDIRMA_DIZAYN_AMBAR_CIKIS'] as List<dynamic>?)
          ?.map((e) => (e as num).toInt())
          .toList()
  ..yazdirmaAmbarGirisYazicilari =
      (json['YAZDIRMA_AMBAR_GIRIS_YAZICILARI'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList()
  ..yazdirmaDizaynDat = (json['YAZDIRMA_DIZAYN_DAT'] as List<dynamic>?)
      ?.map((e) => (e as num).toInt())
      .toList()
  ..malKabulAlisIrsBildirimKullanicilar =
      (json['malKabul_AlisIrs_BildirimKullanicilar'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList()
  ..transferAgFiltre = json['transfer_AG_Filtre'] as String?
  ..transferAgFiltreSql = json['transfer_AG_FiltreSQL'] as String?
  ..sevkiyatSatisFatEMailGonderKullanicilar =
      json['sevkiyat_SatisFat_EMailGonder_Kullanicilar'] as String?
  ..sevkemriMalToplamaBarkodKosullu =
      json['sevkemri_MalToplama_BarkodKosullu'] as bool?
  ..siparisMusSipBildirimKullanicilar =
      (json['siparis_MusSip_BildirimKullanicilar'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList()
  ..siparisMusSipEMailGonderKullanicilar =
      json['siparis_MusSip_EMailGonder_Kullanicilar'] as String?
  ..stokFiltre = json['stok_Filtre'] as String?
  ..stokFiltreSql = json['stok_FiltreSQL'] as String?
  ..cariDovizliCarilerdeTlBakiyeGosterme =
      json['cari_DovizliCarilerdeTLBakiyeGosterme'] as bool?
  ..taltekStekSatirAciklamaAlanlari =
      (json['taltek_STEK_SatirAciklamaAlanlari'] as List<dynamic>?)
          ?.map((e) => (e as num).toInt())
          .toList()
  ..taltekStalSatirAciklamaAlanlari =
      (json['taltek_STAL_SatirAciklamaAlanlari'] as List<dynamic>?)
          ?.map((e) => (e as num).toInt())
          .toList()
  ..taltekAtalSatirAciklamaAlanlari =
      (json['taltek_ATAL_SatirAciklamaAlanlari'] as List<dynamic>?)
          ?.map((e) => (e as num).toInt())
          .toList();

Map<String, dynamic> _$ProfilYetkiModelToJson(
  ProfilYetkiModel instance,
) => <String, dynamic>{
  'yazdirma_SatisIrs_Yazicilari': ?instance.yazdirmaSatisIrsYazicilari,
  'yazdirma_Dizayn_SatisIrs': ?instance.yazdirmaDizaynSatisIrs,
  'yazdirma_SatisTalebi': ?instance.yazdirmaSatisTalebi,
  'yazdirma_SatisTalebi_Yazicilari': ?instance.yazdirmaSatisTalebiYazicilari,
  'yazdirma_Dizayn_SatisTalebi': ?instance.yazdirmaDizaynSatisTalebi,
  'yazdirma_SatisTeklifi': ?instance.yazdirmaSatisTeklifi,
  'yazdirma_Dizayn_SatisTeklifi': ?instance.yazdirmaDizaynSatisTeklifi,
  'yazdirma_Sayim': ?instance.yazdirmaSayim,
  'yazdirma_Sayim_Yazicilari': ?instance.yazdirmaSayimYazicilari,
  'yazdirma_Dizayn_Sayim': ?instance.yazdirmaDizaynSayim,
  'yazdirma_Sevkiyat_Etiketi': ?instance.yazdirmaSevkiyatEtiketi,
  'yazdirma_Sevkiyat_Etiketi_Yazicilari':
      ?instance.yazdirmaSevkiyatEtiketiYazicilari,
  'yazdirma_Dizayn_SevkiyatEtiketi': ?instance.yazdirmaDizaynSevkiyatEtiketi,
  'yazdirma_Sevkiyat_Etiketi_KopyaSayisiGizle':
      ?instance.yazdirmaSevkiyatEtiketiKopyaSayisiGizle,
  'yazdirma_Serbest': ?instance.yazdirmaSerbest,
  'yazdirma_Serbest_Yazicilari': ?instance.yazdirmaSerbestYazicilari,
  'yazdirma_Dizayn_Serbest': ?instance.yazdirmaDizaynSerbest,
  'yazdirma_SeriEtiketi': ?instance.yazdirmaSeriEtiketi,
  'yazdirma_Seri_Etiketi_Yazicilari': ?instance.yazdirmaSeriEtiketiYazicilari,
  'yazdirma_Dizayn_SeriEtiketi': ?instance.yazdirmaDizaynSeriEtiketi,
  'yazdirma_Stok_Etiketi': ?instance.yazdirmaStokEtiketi,
  'yazdirma_Stok_Etiketi_Yazicilari': ?instance.yazdirmaStokEtiketiYazicilari,
  'yazdirma_Dizayn_StokEtiketi': ?instance.yazdirmaDizaynStokEtiketi,
  'yazdirma_TahsilatMakbuzu': ?instance.yazdirmaTahsilatMakbuzu,
  'yazdirma_Dizayn_TahsilatMakbuzu': ?instance.yazdirmaDizaynTahsilatMakbuzu,
  'yazdirma_USK': ?instance.yazdirmaUsk,
  'yazdirma_USK_Yazicilari': ?instance.yazdirmaUskYazicilari,
  'yazdirma_Dizayn_USK': ?instance.yazdirmaDizaynUSK,
  'yazdirma_UretMalTop': ?instance.yazdirmaUretMalTop,
  'yazdirma_UretMalTop_Yazicilari': ?instance.yazdirmaUretMalTopYazicilari,
  'yazdirma_Dizayn_UretMalTop': ?instance.yazdirmaDizaynUretMalTop,
  'kullanicilar': ?instance.kullanicilar,
  'sirket_TamEkranAcilsin': ?instance.sirketTamEkranAcilsin,
  'sirket_RehberdeCariKodGizle': ?instance.sirketRehberdeCariKodGizle,
  'sirket_RehberdeStokKodGizle': ?instance.sirketRehberdeStokKodGizle,
  'sirket_RaporlardaFiyatGizle': ?instance.sirketRaporlardaFiyatGizle,
  'sirket_TarihDegismesin': ?instance.sirketTarihDegismesin,
  'sirket_DevirSirketineGiris': ?instance.sirketDevirSirketineGiris,
  'sirket_KontrolluAktar_BelgeTipleri':
      ?instance.sirketKontrolluAktarBelgeTipleri,
  'sirket_KontrolluAktar_BelgeNoGoster':
      ?instance.sirketKontrolluAktarBelgeNoGoster,
  'sirket_KontrolAciklamasi_BelgeTipleri':
      ?instance.sirketKontrolAciklamasiBelgeTipleri,
  'sirket_TLFiyatGelsin_BelgeTipleri':
      ?instance.sirketTLFiyatGelsinBelgeTipleri,
  'sirket_KalemKayitKontrol_BelgeTipleri':
      ?instance.sirketKalemKayitKontrolBelgeTipleri,
  'sirket_aktifDepolar': ?instance.sirketAktifDepolar,
  'sirket_satisDepo': ?instance.sirketSatisDepo,
  'sirket_satisDepo_Ozellestir': ?instance.sirketSatisDepoOzellestir,
  'sirket_satisDepo_MusSip': ?instance.sirketSatisDepoMusSip,
  'sirket_satisDepo_SatisFat': ?instance.sirketSatisDepoSatisFat,
  'sirket_satisDepo_SatisIrs': ?instance.sirketSatisDepoSatisIrs,
  'sirket_alisDepo': ?instance.sirketAlisDepo,
  'sirket_iadeDepo': ?instance.sirketIadeDepo,
  'sirket_projeKodu': ?instance.sirketProjeKodu,
  'sirket_aktifProjeler': ?instance.sirketAktifProjeler,
  'ayarlar_FirmaAyarlari': ?instance.ayarlarFirmaAyarlari,
  'ayarlar_Oturumlar': ?instance.ayarlarOturumlar,
  'sirket_SifreHatirlamaDurumu': ?instance.sirketSifreHatirlamaDurumu,
  'genel_DovizKurlari': ?instance.genelDovizKurlari,
  'genel_DovizKurlari_Ekle': ?instance.genelDovizKurlariEkle,
  'genel_DovizKurlari_Duzelt': ?instance.genelDovizKurlariDuzelt,
  'genel_DovizKurlari_Sil': ?instance.genelDovizKurlariSil,
  'genel_BelgeKontrol': ?instance.genelBelgeKontrol,
  'genel_BelgeKontrol_Ekle': ?instance.genelBelgeKontrolEkle,
  'genel_BelgeKontrol_Sil': ?instance.genelBelgeKontrolSil,
  'genel_BelgeKontrol_BelgeTipleri': ?instance.genelBelgeKontrolBelgeTipleri,
  'genel_BelgeKontrol_BarkodOkutsun': ?instance.genelBelgeKontrolBarkodOkutsun,
  'genel_BelgeKontrol_MiktarOtomatikGelsin':
      ?instance.genelBelgeKontrolMiktarOtomatikGelsin,
  'genel_BelgeKontrol_KalemDetaySorulmasin':
      ?instance.genelBelgeKontrolKalemDetaySorulmasin,
  'genel_BelgeKontrol_BelgeOnaySormasin':
      ?instance.genelBelgeKontrolBelgeOnaySormasin,
  'malKabul_FiyatDegistirilmesin': ?instance.malKabulFiyatDegistirilmesin,
  'malKabul_AlisIrs_BelgeTipleri': ?instance.malKabulAlisIrsBelgeTipleri,
  'malKabul_AlisIrs_GizlenecekAlanlar':
      ?instance.malKabulAlisIrsGizlenecekAlanlar,
  'malKabul_AlisFat_GizlenecekAlanlar':
      ?instance.malKabulAlisFatGizlenecekAlanlar,
  'malKabul_AlisIrs_AciklamaAlanlari':
      ?instance.malKabulAlisIrsAciklamaAlanlari,
  'malKabul_SatinAlma': ?instance.malKabulSatinAlma,
  'malKabul_SatinAlma_Kaydet': ?instance.malKabulSatinAlmaKaydet,
  'malKabul_SatinAlma_Duzelt': ?instance.malKabulSatinAlmaDuzelt,
  'malKabul_SatinAlma_Sil': ?instance.malKabulSatinAlmaSil,
  'malKabul_AlisIrsaliyesiFiyatGor': ?instance.malKabulAlisIrsaliyesiFiyatGor,
  'malKabul_AlisIrs_DigerSekmesiGoster':
      ?instance.malKabulAlisIrsDigerSekmesiGoster,
  'malKabul_AlisIrs_SipBagSecenegi': ?instance.malKabulAlisIrsSipBagSecenegi,
  'malKabul_AlisIrs_ReferansStokUygulamasi':
      ?instance.malKabulAlisIrsReferansStokUygulamasi,
  'malKabul_AlisIrs_SipBag_SipHariciKalemEklenebilir':
      ?instance.malKabulAlisIrsSipBagSipHariciKalemEklenebilir,
  'malKabul_AlisIrs_SipBag_FazlaTeslimatYapilabilir':
      ?instance.malKabulAlisIrsSipBagFazlaTeslimatYapilabilir,
  'malKabul_AlisIrs_SipBag_SipOkutulsun':
      ?instance.malKabulAlisIrsSipBagSipOkutulsun,
  'malKabul_AlisIrs_SipBag_CokluSecim':
      ?instance.malKabulAlisIrsSipBagCokluSecim,
  'malKabul_AlisIrs_SipBag_TumKalemlerSecilsin':
      ?instance.malKabulAlisIrsSipBagTumKalemlerSecilsin,
  'malKabul_AlisIrs_SipBag_EslesmeDurumu':
      ?instance.malKabulAlisIrsSipBagEslesmeDurumu,
  'malKabul_AlisIrs_BarkodluGiris': ?instance.malKabulAlisIrsBarkodluGiris,
  'malKabul_AlisIrs_MiktarOtomatikGelsin':
      ?instance.malKabulAlisIrsMiktarOtomatikGelsin,
  'malKabul_AlisIrs_KalemDetaySorulmasin':
      ?instance.malKabulAlisIrsKalemDetaySorulmasin,
  'malKabul_AlisIrs_KalemlerBirlestirilsin':
      ?instance.malKabulAlisIrsKalemlerBirlestirilsin,
  'malKabul_AlisIrs_StokRehberiAcilmasin':
      ?instance.malKabulAlisIrsStokRehberiAcilmasin,
  'malKabul_AlisIrs_KalemDuzeltilemesin':
      ?instance.malKabulAlisIrsKalemDuzeltilemesin,
  'malKabul_AlisIrs_TekrarEdenBarkod':
      ?instance.malKabulAlisIrsTekrarEdenBarkod,
  'malKabul_AlisIrs_KlavyeEngelle': ?instance.malKabulAlisIrsKlavyeEngelle,
  'malKabul_AlisIrs_Miktar1Gelsin': ?instance.malKabulAlisIrsMiktar1Gelsin,
  'malKabul_AlisIrs_Raporlar': ?instance.malKabulAlisIrsRaporlar,
  'malKabul_AlisIrs_KalemRaporu': ?instance.malKabulAlisIrsKalemRaporu,
  'malKabul_AlisIrs_OtoBasimYap': ?instance.malKabulAlisIrsOtoBasimYap,
  'malKabul_AlisIrs_KacGunlukKayitlarListelensin':
      ?instance.malKabulAlisIrsKacGunlukKayitlarListelensin,
  'malKabul_AlisIrs_FiyatSirasi': ?instance.malKabulAlisIrsFiyatSirasi,
  'malKabul_AlisIrs_CariKoduDegistir':
      ?instance.malKabulAlisIrsCariKoduDegistir,
  'malKabul_AlisIrs_CariRehPlaEslesmesin':
      ?instance.malKabulAlisIrsCariRehPlaEslesmesin,
  'malKabul_Iade': ?instance.malKabulIade,
  'malKabul_Iade_Kaydet': ?instance.malKabulIadeKaydet,
  'malKabul_Iade_Duzelt': ?instance.malKabulIadeDuzelt,
  'malKabul_Iade_Sil': ?instance.malKabulIadeSil,
  'malKabul_AlisFaturasi_BelgeTipleri':
      ?instance.malKabulAlisFaturasiBelgeTipleri,
  'malKabul_AlisFaturasi': ?instance.malKabulAlisFaturasi,
  'malKabul_AlisFaturasi_Kaydet': ?instance.malKabulAlisFaturasiKaydet,
  'malKabul_AlisFaturasi_Duzelt': ?instance.malKabulAlisFaturasiDuzelt,
  'malKabul_AlisFaturasi_Sil': ?instance.malKabulAlisFaturasiSil,
  'malKabul_AlisFat_DigerSekmesiGoster':
      ?instance.malKabulAlisFatDigerSekmesiGoster,
  'malKabul_AlisFat_KacGunlukKayitlarListelensin':
      ?instance.malKabulAlisFatKacGunlukKayitlarListelensin,
  'malKabul_AlisFat_FiyatSirasi': ?instance.malKabulAlisFatFiyatSirasi,
  'malKabul_AlisFat_Aciklamalar_YetkiTuru':
      ?instance.malKabulAlisFatAciklamalarYetkiTuru,
  'malKabul_AlisFat_AciklamaAlanlari':
      ?instance.malKabulAlisFatAciklamaAlanlari,
  'malKabul_AlisFat_CariKoduDegistir':
      ?instance.malKabulAlisFatCariKoduDegistir,
  'malKabul_AlisFat_BarkodluGiris': ?instance.malKabulAlisFatBarkodluGiris,
  'malKabul_AlisFat_MiktarOtomatikGelsin':
      ?instance.malKabulAlisFatMiktarOtomatikGelsin,
  'malKabul_AlisFat_KalemDetaySorulmasin':
      ?instance.malKabulAlisFatKalemDetaySorulmasin,
  'malKabul_AlisFat_StokRehberiAcilmasin':
      ?instance.malKabulAlisFatStokRehberiAcilmasin,
  'malKabul_AlisFat_KalemDuzeltilemesin':
      ?instance.malKabulAlisFatKalemDuzeltilemesin,
  'malKabul_AlisFat_KlavyeEngelle': ?instance.malKabulAlisFatKlavyeEngelle,
  'malKabul_AlisFat_Miktar1Gelsin': ?instance.malKabulAlisFatMiktar1Gelsin,
  'malKabul_AlisFat_ReferansStokUygulamasi':
      ?instance.malKabulAlisFatReferansStokUygulamasi,
  'malKabul_AlisFat_SipBag_SipHariciKalemEklenebilir':
      ?instance.malKabulAlisFatSipBagSipHariciKalemEklenebilir,
  'malKabul_AlisFat_SipBag_FazlaTeslimatYapilabilir':
      ?instance.malKabulAlisFatSipBagFazlaTeslimatYapilabilir,
  'malKabul_AlisFat_SipBag_SipOkutulsun':
      ?instance.malKabulAlisFatSipBagSipOkutulsun,
  'malKabul_AlisFat_SipBag_CokluSecim':
      ?instance.malKabulAlisFatSipBagCokluSecim,
  'malKabul_AlisFat_SipBag_TumKalemlerSecilsin':
      ?instance.malKabulAlisFatSipBagTumKalemlerSecilsin,
  'malKabul_AlisFat_SipBag_EslesmeDurumu':
      ?instance.malKabulAlisFatSipBagEslesmeDurumu,
  'malKabul_AlisFat_Raporlar': ?instance.malKabulAlisFatRaporlar,
  'malKabul_AlisFat_KalemRaporu': ?instance.malKabulAlisFatKalemRaporu,
  'malKabul_Mustahsil': ?instance.malKabulMustahsil,
  'malKabul_Mustahsil_Ekle': ?instance.malKabulMustahsilEkle,
  'malKabul_Mustahsil_Duzelt': ?instance.malKabulMustahsilDuzelt,
  'malKabul_Mustahsil_Sil': ?instance.malKabulMustahsilSil,
  'transfer_DAT': ?instance.transferDat,
  'transfer_DAT_Kaydet': ?instance.transferDatKaydet,
  'transfer_DAT_Duzelt': ?instance.transferDatDuzelt,
  'transfer_DAT_Sil': ?instance.transferDatSil,
  'transfer_DAT_FiyatGor': ?instance.transferDatFiyatGor,
  'transfer_DAT_OtoEtiketBas': ?instance.transferDatOtoEtiketBas,
  'transfer_DAT_VarsayilanCikisDepo': ?instance.transferDatVarsayilanCikisDepo,
  'transfer_DAT_VarsayilanGirisDepo': ?instance.transferDatVarsayilanGirisDepo,
  'transfer_DAT_eIrsIsaretleyemesin': ?instance.transferDatEIrsIsaretleyemesin,
  'transfer_DAT_DigerSekmesiGoster': ?instance.transferDatDigerSekmesiGoster,
  'transfer_DAT_BarkodluGiris': ?instance.transferDatBarkodluGiris,
  'transfer_DAT_MiktarOtomatikGelsin':
      ?instance.transferDatMiktarOtomatikGelsin,
  'transfer_DAT_KalemDetaySorulmasin':
      ?instance.transferDatKalemDetaySorulmasin,
  'transfer_DAT_StokRehberiAcilmasin':
      ?instance.transferDatStokRehberiAcilmasin,
  'transfer_DAT_KalemDuzeltilemesin': ?instance.transferDatKalemDuzeltilemesin,
  'transfer_DAT_KlavyeEngelle': ?instance.transferDatKlavyeEngelle,
  'transfer_DAT_Miktar1Gelsin': ?instance.transferDatMiktar1Gelsin,
  'transfer_DAT_KalemlerBirlestirilsin':
      ?instance.transferDatKalemlerBirlestirilsin,
  'transfer_DAT_KacGunlukKayitlarListelensin':
      ?instance.transferDatKacGunlukKayitlarListelensin,
  'transfer_DAT_OnayIslemleri': ?instance.transferDatOnayIslemleri,
  'transfer_DAT_OnayIslemleri_Depolar':
      ?instance.transferDatOnayIslemleriDepolar,
  'transfer_DAT_EkAlan2Hatirla': ?instance.transferDatEkAlan2Hatirla,
  'transfer_DAT_EkAlan2Tablodan': ?instance.transferDatEkAlan2Tablodan,
  'transfer_DAT_SeriGirisHarYapabilsin':
      ?instance.transferDatSeriGirisHarYapabilsin,
  'transfer_DAT_Birim1denKaydet': ?instance.transferDatBirim1DenKaydet,
  'transfer_DAT_Barkod2Sor': ?instance.transferDatBarkod2Sor,
  'transfer_DAT_BosGecilmeyecekAlanlar':
      ?instance.transferDatBosGecilmeyecekAlanlar,
  'transfer_DAT_GizlenecekAlanlar': ?instance.transferDatGizlenecekAlanlar,
  'transfer_DAT_DegismeyecekAlanlar': ?instance.transferDatDegismeyecekAlanlar,
  'transfer_DAT_AciklamaAlanlari': ?instance.transferDatAciklamaAlanlari,
  'transfer_DAT_SipBagSecenegi': ?instance.transferDatSipBagSecenegi,
  'transfer_DAT_ReferansStokUygulamasi':
      ?instance.transferDatReferansStokUygulamasi,
  'transfer_DAT_SipBag_SipHariciKalemEklenebilir':
      ?instance.transferDatSipBagSipHariciKalemEklenebilir,
  'transfer_DAT_SipBag_FazlaTeslimatYapilabilir':
      ?instance.transferDatSipBagFazlaTeslimatYapilabilir,
  'transfer_DAT_SipBag_SipOkutulsun': ?instance.transferDatSipBagSipOkutulsun,
  'transfer_DAT_SipBag_SipOkutulsun_Miktar2BazAl':
      ?instance.transferDatSipBagSipOkutulsunMiktar2BazAl,
  'transfer_DAT_SipBag_SipOkutulsun_KalanMiktarGelsin':
      ?instance.transferDatSipBagSipOkutulsunKalanMiktarGelsin,
  'transfer_DAT_SipBag_CokluSecim': ?instance.transferDatSipBagCokluSecim,
  'transfer_DAT_SipBag_TumKalemlerSecilsin':
      ?instance.transferDatSipBagTumKalemlerSecilsin,
  'transfer_DAT_SipBag_EslesmeDurumu': ?instance.transferDatSipBagEslesmeDurumu,
  'transfer_DAT_SipBag_MalToplananlarGelsin':
      ?instance.transferDatSipBagMalToplananlarGelsin,
  'transfer_DAT_SipBag_SevkOnayliSiparislerGelsin':
      ?instance.transferDatSipBagSevkOnayliSiparislerGelsin,
  'transfer_AG': ?instance.transferAg,
  'transfer_AG_Kaydet': ?instance.transferAgKaydet,
  'transfer_AG_Duzelt': ?instance.transferAgDuzelt,
  'transfer_AG_Sil': ?instance.transferAgSil,
  'transfer_AG_FiyatGor': ?instance.transferAgFiyatGor,
  'transfer_AG_KacGunlukKayitlarListelensin':
      ?instance.transferAgKacGunlukKayitlarListelensin,
  'transfer_AG_VarsayilanDepo': ?instance.transferAgVarsayilanDepo,
  'transfer_AG_DigerSekmesiGoster': ?instance.transferAgDigerSekmesiGoster,
  'transfer_AG_BelgeKopyala': ?instance.transferAgBelgeKopyala,
  'transfer_AG_OtoBasimYap': ?instance.transferAgOtoBasimYap,
  'transfer_AG_SeriGirisHarYapabilsin':
      ?instance.transferAgSeriGirisHarYapabilsin,
  'transfer_AG_BarkodluGiris': ?instance.transferAgBarkodluGiris,
  'transfer_AG_MiktarOtomatikGelsin': ?instance.transferAgMiktarOtomatikGelsin,
  'transfer_AG_KalemDetaySorulmasin': ?instance.transferAgKalemDetaySorulmasin,
  'transfer_AG_StokRehberiAcilmasin': ?instance.transferAgStokRehberiAcilmasin,
  'transfer_AG_KalemDuzeltilemesin': ?instance.transferAgKalemDuzeltilemesin,
  'transfer_AG_KlavyeEngelle': ?instance.transferAgKlavyeEngelle,
  'transfer_AG_Miktar1Gelsin': ?instance.transferAgMiktar1Gelsin,
  'transfer_AG_ReferansStokUygulamasi':
      ?instance.transferAgReferansStokUygulamasi,
  'transfer_AG_SipBag_SipHariciKalemEklenebilir':
      ?instance.transferAgSipBagSipHariciKalemEklenebilir,
  'transfer_AG_SipBag_FazlaTeslimatYapilabilir':
      ?instance.transferAgSipBagFazlaTeslimatYapilabilir,
  'transfer_AG_SipBag_SipOkutulsun': ?instance.transferAgSipBagSipOkutulsun,
  'transfer_AG_SipBag_SipOkutulsun_Miktar2BazAl':
      ?instance.transferAgSipBagSipOkutulsunMiktar2BazAl,
  'transfer_AG_SipBag_CokluSecim': ?instance.transferAgSipBagCokluSecim,
  'transfer_AG_SipBag_TumKalemlerSecilsin':
      ?instance.transferAgSipBagTumKalemlerSecilsin,
  'transfer_AG_SipBag_EslesmeDurumu': ?instance.transferAgSipBagEslesmeDurumu,
  'transfer_AG_SipBag_MalToplananlarGelsin':
      ?instance.transferAgSipBagMalToplananlarGelsin,
  'transfer_AG_SipBag_SevkOnayliSiparislerGelsin':
      ?instance.transferAgSipBagSevkOnayliSiparislerGelsin,
  'transfer_AC': ?instance.transferAc,
  'transfer_AC_Kaydet': ?instance.transferAcKaydet,
  'transfer_AC_Duzelt': ?instance.transferAcDuzelt,
  'transfer_AC_Sil': ?instance.transferAcSil,
  'transfer_AC_FiyatGor': ?instance.transferAcFiyatGor,
  'transfer_AC_KacGunlukKayitlarListelensin':
      ?instance.transferAcKacGunlukKayitlarListelensin,
  'transfer_AC_VarsayilanDepo': ?instance.transferAcVarsayilanDepo,
  'transfer_AC_eIrsIsaretleyemesin': ?instance.transferAcEIrsIsaretleyemesin,
  'transfer_AC_DigerSekmesiGoster': ?instance.transferAcDigerSekmesiGoster,
  'transfer_AC_BelgeKopyala': ?instance.transferAcBelgeKopyala,
  'transfer_AC_OtoBasimYap': ?instance.transferAcOtoBasimYap,
  'transfer_AC_SeriGirisHarYapabilsin':
      ?instance.transferAcSeriGirisHarYapabilsin,
  'transfer_AC_EkAlan2Tablodan': ?instance.transferAcEkAlan2Tablodan,
  'transfer_AC_EkAlan2Hatirla': ?instance.transferAcEkAlan2Hatirla,
  'transfer_AC_MinStokMikGoster': ?instance.transferAcMinStokMikGoster,
  'transfer_AC_BosGecilmeyecekAlanlar':
      ?instance.transferAcBosGecilmeyecekAlanlar,
  'transfer_AC_BarkodluGiris': ?instance.transferAcBarkodluGiris,
  'transfer_AC_MiktarOtomatikGelsin': ?instance.transferAcMiktarOtomatikGelsin,
  'transfer_AC_KalemDetaySorulmasin': ?instance.transferAcKalemDetaySorulmasin,
  'transfer_AC_StokRehberiAcilmasin': ?instance.transferAcStokRehberiAcilmasin,
  'transfer_AC_KalemDuzeltilemesin': ?instance.transferAcKalemDuzeltilemesin,
  'transfer_AC_KlavyeEngelle': ?instance.transferAcKlavyeEngelle,
  'transfer_AC_Miktar1Gelsin': ?instance.transferAcMiktar1Gelsin,
  'transfer_AC_ReferansStokUygulamasi':
      ?instance.transferAcReferansStokUygulamasi,
  'transfer_AC_SipBag_SipHariciKalemEklenebilir':
      ?instance.transferAcSipBagSipHariciKalemEklenebilir,
  'transfer_AC_SipBag_FazlaTeslimatYapilabilir':
      ?instance.transferAcSipBagFazlaTeslimatYapilabilir,
  'transfer_AC_SipBag_SipOkutulsun': ?instance.transferAcSipBagSipOkutulsun,
  'transfer_AC_SipBag_SipOkutulsun_Miktar2BazAl':
      ?instance.transferAcSipBagSipOkutulsunMiktar2BazAl,
  'transfer_AC_SipBag_CokluSecim': ?instance.transferAcSipBagCokluSecim,
  'transfer_AC_SipBag_TumKalemlerSecilsin':
      ?instance.transferAcSipBagTumKalemlerSecilsin,
  'transfer_AC_SipBag_EslesmeDurumu': ?instance.transferAcSipBagEslesmeDurumu,
  'transfer_AC_SipBag_MalToplananlarGelsin':
      ?instance.transferAcSipBagMalToplananlarGelsin,
  'transfer_AC_SipBag_SevkOnayliSiparislerGelsin':
      ?instance.transferAcSipBagSevkOnayliSiparislerGelsin,
  'transfer_AC_GizlenecekAlanlar': ?instance.transferAcGizlenecekAlanlar,
  'transfer_AC_DegismeyecekAlanlar': ?instance.transferAcDegismeyecekAlanlar,
  'transfer_DepoTalebi': ?instance.transferDepoTalebi,
  'transfer_DepoTalebi_Sil': ?instance.transferDepoTalebiSil,
  'transfer_DepoTalebi_MalTop': ?instance.transferDepoTalebiMalTop,
  'transfer_DepoTalebi_MalTop_FazlaTeslimat':
      ?instance.transferDepoTalebiMalTopFazlaTeslimat,
  'hucre_GiristeHucreYerlestir': ?instance.hucreGiristeHucreYerlestir,
  'hucre_CikistaHucreYerlestir': ?instance.hucreCikistaHucreYerlestir,
  'hucre_Yerlestir': ?instance.hucreYerlestir,
  'hucre_YerlestirBelgesiz': ?instance.hucreYerlestirBelgesiz,
  'hucre_Yerlestir_KlavyeEngelle': ?instance.hucreYerlestirKlavyeEngelle,
  'hucre_Yerlestir_RehberdenStokSecilmesin':
      ?instance.hucreYerlestirRehberdenStokSecilmesin,
  'hucre_Yerlestir_HangiHucrede': ?instance.hucreYerlestirHangiHucrede,
  'hucre_Yerlestir_BelgeTipleri': ?instance.hucreYerlestirBelgeTipleri,
  'hucre_Bosalt': ?instance.hucreBosalt,
  'hucre_BosaltBelgesiz': ?instance.hucreBosaltBelgesiz,
  'hucre_Bosalt_KlavyeEngelle': ?instance.hucreBosaltKlavyeEngelle,
  'hucre_Bosalt_RehberdenStokSecilmesin':
      ?instance.hucreBosaltRehberdenStokSecilmesin,
  'hucre_Bosalt_HangiHucrede': ?instance.hucreBosaltHangiHucrede,
  'hucre_Bosalt_BelgeTipleri': ?instance.hucreBosaltBelgeTipleri,
  'hucre_Arama': ?instance.hucreArama,
  'hucre_AramaTumDepolar': ?instance.hucreAramaTumDepolar,
  'hucre_AramaOzelFonksiyon': ?instance.hucreAramaOzelFonksiyon,
  'hucre_Transfer': ?instance.hucreTransfer,
  'hucre_Transfer_KlavyeEngelle': ?instance.hucreTransferKlavyeEngelle,
  'hucre_Transfer_RehberdenStokSecilmesin':
      ?instance.hucreTransferRehberdenStokSecilmesin,
  'hucre_Transfer_BelgeTipleri': ?instance.hucreTransferBelgeTipleri,
  'hucre_Listesi': ?instance.hucreListesi,
  'hucre_Bosalt_OtomatikStokEtiketiYazdir':
      ?instance.hucreBosaltOtomatikStokEtiketiYazdir,
  'hucre_BakiyeDurumu': ?instance.hucreBakiyeDurumu,
  'hucre_Hareketleri': ?instance.hucreHareketleri,
  'hucre_Hareketleri_Sil': ?instance.hucreHareketleriSil,
  'sevkiyat_SatisIrsaliyesi_BelgeTipleri':
      ?instance.sevkiyatSatisIrsaliyesiBelgeTipleri,
  'sevkiyat_SatisIrsaliyesi_GizlenecekAlanlar':
      ?instance.sevkiyatSatisIrsaliyesiGizlenecekAlanlar,
  'sevkiyat_SatisIrsaliyesi_DegismeyecekAlanlar':
      ?instance.sevkiyatSatisIrsaliyesiDegismeyecekAlanlar,
  'sevkiyat_SatisIrsaliyesi': ?instance.sevkiyatSatisIrsaliyesi,
  'sevkiyat_SatisIrsaliyesiKayit': ?instance.sevkiyatSatisIrsaliyesiKayit,
  'sevkiyat_SatisIrsaliyesiDuzeltme': ?instance.sevkiyatSatisIrsaliyesiDuzeltme,
  'sevkiyat_SatisIrsaliyesiSilme': ?instance.sevkiyatSatisIrsaliyesiSilme,
  'sevkiyat_SatisIrsaliyesiFiyatGor': ?instance.sevkiyatSatisIrsaliyesiFiyatGor,
  'sevkiyat_SatisIrs_DigerSekmesiGoster':
      ?instance.sevkiyatSatisIrsDigerSekmesiGoster,
  'sevkiyat_SatisIrsaliyesi_SipBagSecenegi':
      ?instance.sevkiyatSatisIrsaliyesiSipBagSecenegi,
  'sevkiyat_SatisIrs_ReferansStokUygulamasi':
      ?instance.sevkiyatSatisIrsReferansStokUygulamasi,
  'sevkiyat_SatisIrs_SipBag_SipHariciKalemEklenebilir':
      ?instance.sevkiyatSatisIrsSipBagSipHariciKalemEklenebilir,
  'sevkiyat_SatisIrs_SipBag_FazlaTeslimatYapilabilir':
      ?instance.sevkiyatSatisIrsSipBagFazlaTeslimatYapilabilir,
  'sevkiyat_SatisIrs_SipBag_SipOkutulsun':
      ?instance.sevkiyatSatisIrsSipBagSipOkutulsun,
  'sevkiyat_SatisIrs_SipBag_SipOkutulsun_Miktar2BazAl':
      ?instance.sevkiyatSatisIrsSipBagSipOkutulsunMiktar2BazAl,
  'sevkiyat_SatisIrs_SipBag_SipOkutulsun_KalanMiktarGelsin':
      ?instance.sevkiyatSatisIrsSipBagSipOkutulsunKalanMiktarGelsin,
  'sevkiyat_SatisIrs_SipBag_CokluSecim':
      ?instance.sevkiyatSatisIrsSipBagCokluSecim,
  'sevkiyat_SatisIrs_SipBag_TumKalemlerSecilsin':
      ?instance.sevkiyatSatisIrsSipBagTumKalemlerSecilsin,
  'sevkiyat_SatisIrs_SipBag_EslesmeDurumu':
      ?instance.sevkiyatSatisIrsSipBagEslesmeDurumu,
  'sevkiyat_SatisIrs_SipBag_MalToplananlarGelsin':
      ?instance.sevkiyatSatisIrsSipBagMalToplananlarGelsin,
  'sevkiyat_SatisIrs_SipBag_SevkOnayliSiparislerGelsin':
      ?instance.sevkiyatSatisIrsSipBagSevkOnayliSiparislerGelsin,
  'sevkiyat_FiyatDegistirilmesin': ?instance.sevkiyatFiyatDegistirilmesin,
  'sevkiyat_SatisIrsaliyesi_EIrsaliyeDuzenleyemesin':
      ?instance.sevkiyatSatisIrsaliyesiEIrsaliyeDuzenleyemesin,
  'sevkiyat_SatisIrs_KalemlerBirlestirilsin':
      ?instance.sevkiyatSatisIrsKalemlerBirlestirilsin,
  'sevkiyat_SatisIrs_OtoBasimYap': ?instance.sevkiyatSatisIrsOtoBasimYap,
  'sevkiyat_SatisIrs_KacGunlukKayitlarListelensin':
      ?instance.sevkiyatSatisIrsKacGunlukKayitlarListelensin,
  'sevkiyat_SatisIrs_FiyatSirasi': ?instance.sevkiyatSatisIrsFiyatSirasi,
  'sevkiyat_SatisIrs_SeriGirisHarYapabilsin':
      ?instance.sevkiyatSatisIrsSeriGirisHarYapabilsin,
  'sevkiyat_SatisIrs_EkAlan2Tablodan':
      ?instance.sevkiyatSatisIrsEkAlan2Tablodan,
  'sevkiyat_SatisIrs_EkAlan2Hatirla': ?instance.sevkiyatSatisIrsEkAlan2Hatirla,
  'sevkiyat_SatisIrs_OlcuBirimi': ?instance.sevkiyatSatisIrsOlcuBirimi,
  'sevkiyat_SatisIrs_CariKoduDegistir':
      ?instance.sevkiyatSatisIrsCariKoduDegistir,
  'sevkiyat_SatisIrs_MaxIskUygulamasi':
      ?instance.sevkiyatSatisIrsMaxIskUygulamasi,
  'sevkiyat_SatisIrs_MaxSatIsk1': ?instance.sevkiyatSatisIrsMaxSatIsk1,
  'sevkiyat_SatisIrs_MaxSatIsk2': ?instance.sevkiyatSatisIrsMaxSatIsk2,
  'sevkiyat_SatisIrs_MaxSatIsk3': ?instance.sevkiyatSatisIrsMaxSatIsk3,
  'sevkiyat_SatisIrs_MaxSatIsk4': ?instance.sevkiyatSatisIrsMaxSatIsk4,
  'sevkiyat_SatisIrs_MaxSatIsk5': ?instance.sevkiyatSatisIrsMaxSatIsk5,
  'sevkiyat_SatisIrs_MaxSatIsk6': ?instance.sevkiyatSatisIrsMaxSatIsk6,
  'sevkiyat_SatisIrs_MaxGenIsk1': ?instance.sevkiyatSatisIrsMaxGenIsk1,
  'sevkiyat_SatisIrs_MaxGenIsk2': ?instance.sevkiyatSatisIrsMaxGenIsk2,
  'sevkiyat_SatisIrs_MaxGenIsk3': ?instance.sevkiyatSatisIrsMaxGenIsk3,
  'sevkiyat_SatisIrs_DipFiyatUygulamasi':
      ?instance.sevkiyatSatisIrsDipFiyatUygulamasi,
  'sevkiyat_SatisIrs_DipFiyatSaha': ?instance.sevkiyatSatisIrsDipFiyatSaha,
  'sevkiyat_SatisIrs_DipFiyatEylem': ?instance.sevkiyatSatisIrsDipFiyatEylem,
  'sevkiyat_SatisIrs_BarkodluGiris': ?instance.sevkiyatSatisIrsBarkodluGiris,
  'sevkiyat_SatisIrs_MiktarOtomatikGelsin':
      ?instance.sevkiyatSatisIrsMiktarOtomatikGelsin,
  'sevkiyat_SatisIrs_KalemDetaySorulmasin':
      ?instance.sevkiyatSatisIrsKalemDetaySorulmasin,
  'sevkiyat_SatisIrs_StokRehberiAcilmasin':
      ?instance.sevkiyatSatisIrsStokRehberiAcilmasin,
  'sevkiyat_SatisIrs_KalemDuzeltilemesin':
      ?instance.sevkiyatSatisIrsKalemDuzeltilemesin,
  'sevkiyat_SatisIrs_KlavyeEngelle': ?instance.sevkiyatSatisIrsKlavyeEngelle,
  'sevkiyat_SatisIrs_Miktar1Gelsin': ?instance.sevkiyatSatisIrsMiktar1Gelsin,
  'sevkiyat_SatisIrs_BakiyesizStokSecilmesin':
      ?instance.sevkiyatSatisIrsBakiyesizStokSecilmesin,
  'sevkiyat_SatisIrs_Raporlar': ?instance.sevkiyatSatisIrsRaporlar,
  'sevkiyat_SatisIrs_KalemRaporu': ?instance.sevkiyatSatisIrsKalemRaporu,
  'sevkiyat_SatisFat_BelgeTipleri': ?instance.sevkiyatSatisFatBelgeTipleri,
  'sevkiyat_SatisFat_VarsayilanBelgeTipi':
      ?instance.sevkiyatSatisFatVarsayilanBelgeTipi,
  'sevkiyat_SatisFat': ?instance.sevkiyatSatisFat,
  'sevkiyat_SatisFat_Kaydet': ?instance.sevkiyatSatisFatKaydet,
  'sevkiyat_SatisFat_Duzelt': ?instance.sevkiyatSatisFatDuzelt,
  'sevkiyat_SatisFat_Sil': ?instance.sevkiyatSatisFatSil,
  'sevkiyat_SatisFat_ToplamlarCariTahsilatIslemleri':
      ?instance.sevkiyatSatisFatToplamlarCariTahsilatIslemleri,
  'sevkiyat_SatisFat_KayittanSonraTaslakOlustur':
      ?instance.sevkiyatSatisFatKayittanSonraTaslakOlustur,
  'sevkiyat_SatisFat_OtomatikBasimYap':
      ?instance.sevkiyatSatisFatOtomatikBasimYap,
  'sevkiyat_SatisFat_DigerSekmesiGoster':
      ?instance.sevkiyatSatisFatDigerSekmesiGoster,
  'sevkiyat_SatisFat_FiyatDegistirilmesin':
      ?instance.sevkiyatSatisFatFiyatDegistirilmesin,
  'sevkiyat_SatisFat_KacGunlukKayitlarListelensin':
      ?instance.sevkiyatSatisFatKacGunlukKayitlarListelensin,
  'sevkiyat_SatisFat_FiyatSirasi': ?instance.sevkiyatSatisFatFiyatSirasi,
  'sevkiyat_SatisFat_KalemlerBirlestirilsin':
      ?instance.sevkiyatSatisFatKalemlerBirlestirilsin,
  'sevkiyat_SatisFat_EkAlan2Tablodan':
      ?instance.sevkiyatSatisFatEkAlan2Tablodan,
  'sevkiyat_SatisFat_EkAlan2Hatirla': ?instance.sevkiyatSatisFatEkAlan2Hatirla,
  'sevkiyat_SatisFat_Filtre': ?instance.sevkiyatSatisFatFiltre,
  'sevkiyat_SatisFat_FiltreSQL': ?instance.sevkiyatSatisFatFiltreSQL,
  'sevkiyat_SatisFat_OlcuBirimi': ?instance.sevkiyatSatisFatOlcuBirimi,
  'sevkiyat_SatisFat_AciklamaAlanlari':
      ?instance.sevkiyatSatisFatAciklamaAlanlari,
  'sevkiyat_SatisIrs_AciklamaAlanlari':
      ?instance.sevkiyatSatisIrsAciklamaAlanlari,
  'sevkiyat_SatisFat_BosGecilmeyecekAlanlar':
      ?instance.sevkiyatSatisFatBosGecilmeyecekAlanlar,
  'sevkiyat_SatisIrs_BosGecilmeyecekAlanlar':
      ?instance.sevkiyatSatisIrsBosGecilmeyecekAlanlar,
  'malKabul_AlisFat_BosGecilmeyecekAlanlar':
      ?instance.malKabulAlisFatBosGecilmeyecekAlanlar,
  'malKabul_AlisIrs_BosGecilmeyecekAlanlar':
      ?instance.malKabulAlisIrsBosGecilmeyecekAlanlar,
  'sevkiyat_SatisFat_GizlenecekAlanlar':
      ?instance.sevkiyatSatisFatGizlenecekAlanlar,
  'sevkiyat_SatisFat_DegismeyecekAlanlar':
      ?instance.sevkiyatSatisFatDegismeyecekAlanlar,
  'sevkiyat_SatisFat_SeriGirisHarYapabilsin':
      ?instance.sevkiyatSatisFatSeriGirisHarYapabilsin,
  'sevkiyat_SatisFat_CariKoduDegistir':
      ?instance.sevkiyatSatisFatCariKoduDegistir,
  'sevkiyat_SatisFaturasi_SipBagSecenegi':
      ?instance.sevkiyatSatisFaturasiSipBagSecenegi,
  'sevkiyat_SatisFat_ReferansStokUygulamasi':
      ?instance.sevkiyatSatisFatReferansStokUygulamasi,
  'sevkiyat_SatisFat_SipBag_SipHariciKalemEklenebilir':
      ?instance.sevkiyatSatisFatSipBagSipHariciKalemEklenebilir,
  'sevkiyat_SatisFat_SipBag_FazlaTeslimatYapilabilir':
      ?instance.sevkiyatSatisFatSipBagFazlaTeslimatYapilabilir,
  'sevkiyat_SatisFat_SipBag_SipOkutulsun':
      ?instance.sevkiyatSatisFatSipBagSipOkutulsun,
  'sevkiyat_SatisFat_SipBag_SipOkutulsun_Miktar2BazAl':
      ?instance.sevkiyatSatisFatSipBagSipOkutulsunMiktar2BazAl,
  'sevkiyat_SatisFat_SipBag_CokluSecim':
      ?instance.sevkiyatSatisFatSipBagCokluSecim,
  'sevkiyat_SatisFat_SipBag_TumKalemlerSecilsin':
      ?instance.sevkiyatSatisFatSipBagTumKalemlerSecilsin,
  'sevkiyat_SatisFat_SipBag_EslesmeDurumu':
      ?instance.sevkiyatSatisFatSipBagEslesmeDurumu,
  'sevkiyat_SatisFat_SipBag_SevkOnayliSiparislerGelsin':
      ?instance.sevkiyatSatisFatSipBagSevkOnayliSiparislerGelsin,
  'sevkiyat_SatisFat_BarkodluGiris': ?instance.sevkiyatSatisFatBarkodluGiris,
  'sevkiyat_SatisFaturasi_MiktarOtomatikGelsin':
      ?instance.sevkiyatSatisFaturasiMiktarOtomatikGelsin,
  'sevkiyat_SatisFaturasi_KalemDetaySorulmasin':
      ?instance.sevkiyatSatisFaturasiKalemDetaySorulmasin,
  'sevkiyat_SatisFat_BarkodSayisiSaklanacakAlan':
      ?instance.sevkiyatSatisFatBarkodSayisiSaklanacakAlan,
  'sevkiyat_SatisFat_StokRehberiAcilmasin':
      ?instance.sevkiyatSatisFatStokRehberiAcilmasin,
  'sevkiyat_SatisFat_KalemDuzeltilemesin':
      ?instance.sevkiyatSatisFatKalemDuzeltilemesin,
  'sevkiyat_SatisFat_KlavyeEngelle': ?instance.sevkiyatSatisFatKlavyeEngelle,
  'sevkiyat_SatisFat_Miktar1Gelsin': ?instance.sevkiyatSatisFatMiktar1Gelsin,
  'sevkiyat_SatisFat_BakiyesizStokSecilmesin':
      ?instance.sevkiyatSatisFatBakiyesizStokSecilmesin,
  'sevkiyat_SatisFat_Raporlar': ?instance.sevkiyatSatisFatRaporlar,
  'sevkiyat_SatisFat_KalemRaporu': ?instance.sevkiyatSatisFatKalemRaporu,
  'sevkiyat_SatisFat_KarlilikRaporu': ?instance.sevkiyatSatisFatKarlilikRaporu,
  'sevkiyat_SatisFat_MaxIskUygulamasi':
      ?instance.sevkiyatSatisFatMaxIskUygulamasi,
  'sevkiyat_SatisFat_MaxSatIsk1': ?instance.sevkiyatSatisFatMaxSatIsk1,
  'sevkiyat_SatisFat_MaxSatIsk2': ?instance.sevkiyatSatisFatMaxSatIsk2,
  'sevkiyat_SatisFat_MaxSatIsk3': ?instance.sevkiyatSatisFatMaxSatIsk3,
  'sevkiyat_SatisFat_MaxSatIsk4': ?instance.sevkiyatSatisFatMaxSatIsk4,
  'sevkiyat_SatisFat_MaxSatIsk5': ?instance.sevkiyatSatisFatMaxSatIsk5,
  'sevkiyat_SatisFat_MaxSatIsk6': ?instance.sevkiyatSatisFatMaxSatIsk6,
  'sevkiyat_SatisFat_MaxGenIsk1': ?instance.sevkiyatSatisFatMaxGenIsk1,
  'sevkiyat_SatisFat_MaxGenIsk2': ?instance.sevkiyatSatisFatMaxGenIsk2,
  'sevkiyat_SatisFat_MaxGenIsk3': ?instance.sevkiyatSatisFatMaxGenIsk3,
  'sevkiyat_SatisFat_DipFiyatUygulamasi':
      ?instance.sevkiyatSatisFatDipFiyatUygulamasi,
  'sevkiyat_SatisFat_DipFiyatSaha': ?instance.sevkiyatSatisFatDipFiyatSaha,
  'sevkiyat_SatisFat_DipFiyatEylem': ?instance.sevkiyatSatisFatDipFiyatEylem,
  'sevkiyat_SatisFat_DipFiyatKDVDurumu':
      ?instance.sevkiyatSatisFatDipFiyatKdvDurumu,
  'sevkiyat_SatisIrsaliyesiSiparissiz':
      ?instance.sevkiyatSatisIrsaliyesiSiparissiz,
  'sevkiyat_SatisIrsaliyesiSiparissizFiyatGor':
      ?instance.sevkiyatSatisIrsaliyesiSiparissizFiyatGor,
  'sevkiyat_SatisIrsaliyesiIade': ?instance.sevkiyatSatisIrsaliyesiIade,
  'sevkiyat_SiptenMalTop': ?instance.sevkiyatSiptenMalTop,
  'sevkiyat_SiptenMalTop_MiktarBarkoddanGelsin':
      ?instance.sevkiyatSiptenMalTopMiktarBarkoddanGelsin,
  'sevkiyat_SiptenMalTop_RehberdenStokSecilmesin':
      ?instance.sevkiyatSiptenMalTopRehberdenStokSecilmesin,
  'sevkiyat_SiptenMalTop_KlavyedenBarkodGirilmesin':
      ?instance.sevkiyatSiptenMalTopKlavyedenBarkodGirilmesin,
  'sevkiyat_SiptenMalTop_SevkOnayliSiparislerGelsin':
      ?instance.sevkiyatSiptenMalTopSevkOnayliSiparislerGelsin,
  'sevkiyat_SiptenMalTop_KacGunlukKayitlarListelensin':
      ?instance.sevkiyatSiptenMalTopKacGunlukKayitlarListelensin,
  'sevkemri_MalToplama': ?instance.sevkemriMalToplama,
  'sevkemri_MalToplamaAtanabilir': ?instance.sevkemriMalToplamaAtanabilir,
  'sevkemri_MalToplamaAtayabilir': ?instance.sevkemriMalToplamaAtayabilir,
  'sevkemri_UrunDegistir': ?instance.sevkemriUrunDegistir,
  'sevkemri_MiktarDegistir': ?instance.sevkemriMiktarDegistir,
  'sevkemri_MuadilUrun': ?instance.sevkemriMuadilUrun,
  'sevkemri_malToplama_BarkodsuzUrunListedenSecilsin':
      ?instance.sevkemriMalToplamaBarkodsuzUrunListedenSecilsin,
  'sevkemri_MalToplama_OtoStokEtiketiYazdir':
      ?instance.sevkemriMalToplamaOtoStokEtiketiYazdir,
  'sevkemri_MalToplama_OtoStokEtiketiYazdirSor':
      ?instance.sevkemriMalToplamaOtoStokEtiketiYazdirSor,
  'sevkemri_MalToplama_KlavyedenGirisiEngelle':
      ?instance.sevkemriMalToplamaKlavyedenGirisiEngelle,
  'sevkemri_MalToplama_Barkod2Sor': ?instance.sevkemriMalToplamaBarkod2Sor,
  'sevkemri_MalToplama_Barkod2_YildizliGorunsun':
      ?instance.sevkemriMalToplamaBarkod2YildizliGorunsun,
  'sevkemri_MalToplama_Barkod2KalemEkranindaSor':
      ?instance.sevkemriMalToplamaBarkod2KalemEkranindaSor,
  'sevkemri_MalToplama_TumuToplanmadanTamamlanmasin':
      ?instance.sevkemriMalToplamaTumuToplanmadanTamamlanmasin,
  'sevkemri_MalToplama_HangiHucredeGoster':
      ?instance.sevkemriMalToplamaHangiHucredeGoster,
  'sevkemri_MalToplama_KalemDetayIslemOnaySormasin':
      ?instance.sevkemriMalToplamaKalemDetayIslemOnaySormasin,
  'sevkemri_MalToplama_GosterilecekEkBilgiler':
      ?instance.sevkemriMalToplamaGosterilecekEkBilgiler,
  'sevkemri_MalToplama_DegistirilemeyecekAlanlar':
      ?instance.sevkemriMalToplamaDegistirilemeyecekAlanlar,
  'sevkemri_MalToplama_GizlenecekAlanlar':
      ?instance.sevkemriMalToplamaGizlenecekAlanlar,
  'sevkemri_MalToplama_MiktarBarkoddan':
      ?instance.sevkemriMalToplamaMiktarBarkoddan,
  'sevkemri_MalToplama_KalemDetayiSorulmasin':
      ?instance.sevkemriMalToplamaKalemDetayiSorulmasin,
  'sevkemri_MalToplama_KalemDetayaUlasamasin':
      ?instance.sevkemriMalToplamaKalemDetayaUlasamasin,
  'sevkemri_MalToplama_FazlaTeslimat':
      ?instance.sevkemriMalToplamaFazlaTeslimat,
  'sevkemri_MalToplama_VarsayilanOlcuBirimi':
      ?instance.sevkemriMalToplamaVarsayilanOlcuBirimi,
  'sevkemri_MalToplama_SiralamaTipi': ?instance.sevkemriMalToplamaSiralamaTipi,
  'sevkemri_MalKontrol': ?instance.sevkemriMalKontrol,
  'sevkemri_MalKontrol_KlavyeEngelle':
      ?instance.sevkemriMalKontrolKlavyeEngelle,
  'sevkemri_MalKontrolTipi': ?instance.sevkemriMalKontrolTipi?.toJson(),
  'sevkemri_MalKontrolKullanicilar': ?instance.sevkemriMalKontrolKullanicilar,
  'sevkemri_Paketleme': ?instance.sevkemriPaketleme,
  'sevkemri_Paketleme_KlavyeEngelle': ?instance.sevkemriPaketlemeKlavyeEngelle,
  'sevkemri_Paketleme_BarkodOkutmayaZorla':
      ?instance.sevkemriPaketlemeBarkodOkutmayaZorla,
  'sevkemri_Paketleme_BarkodsuzUrunListedenSecilsin':
      ?instance.sevkemriPaketlemeBarkodsuzUrunListedenSecilsin,
  'sevkemri_AracYukleme': ?instance.sevkemriAracYukleme,
  'sevkemri_AracYukleme_KlavyeEngelle':
      ?instance.sevkemriAracYuklemeKlavyeEngelle,
  'sevkemri_AracBosaltma': ?instance.sevkemriAracBosaltma,
  'sevkemri_AracBosaltma_KlavyeEngelle':
      ?instance.sevkemriAracBosaltmaKlavyeEngelle,
  'sevkemri_DepodanTeslimat': ?instance.sevkemriDepodanTeslimat,
  'sevkemri_DepodanTeslimat_KlavyeEngelle':
      ?instance.sevkemriDepodanTeslimatKlavyeEngelle,
  'sayim_sayim': ?instance.sayimSayim,
  'sayim_Kontrol_Miktari': ?instance.sayimKontrolMiktari,
  'sayim_MiktarBarkoddanGelsin': ?instance.sayimMiktarBarkoddanGelsin,
  'sayim_AyniStokDurumu': ?instance.sayimAyniStokDurumu,
  'sayim_Miktar1Gelsin': ?instance.sayimMiktar1Gelsin,
  'sayim_HemenKaydet': ?instance.sayimHemenKaydet,
  'sayim_CarpanAktif': ?instance.sayimCarpanAktif,
  'sayim_SeriMikGirilenMikKabulEdilsin':
      ?instance.sayimSeriMikGirilenMikKabulEdilsin,
  'sayim_DigerKulSayimHarGorsun': ?instance.sayimDigerKulSayimHarGorsun,
  'sayim_DigerKulSayimFisGorsun': ?instance.sayimDigerKulSayimFisGorsun,
  'sayim_Serbest': ?instance.sayimSerbest,
  'sayim_Serbest_Sil': ?instance.sayimSerbestSil,
  'sayim_DepoFarkRaporu': ?instance.sayimDepoFarkRaporu,
  'sayim_BelgeBaglantisiniKopar': ?instance.sayimBelgeBaglantisiniKopar,
  'sayim_BelgeOlusturabilir': ?instance.sayimBelgeOlusturabilir,
  'sayim_EkAlanlar': ?instance.sayimEkAlanlar,
  'sayim_DegismeyecekAlanlar': ?instance.sayimDegismeyecekAlanlar,
  'sayim_GizlenecekAlanlar': ?instance.sayimGizlenecekAlanlar,
  'sayim_VarsayilanOlcuBirimi': ?instance.sayimVarsayilanOlcuBirimi,
  'sayim_Raporu': ?instance.sayimRaporu,
  'paket_Olustur': ?instance.paketOlustur,
  'paket_CokluOlustur': ?instance.paketCokluOlustur,
  'paket_Kontrol': ?instance.paketKontrol,
  'paket_MalzemeCikisi': ?instance.paketMalzemeCikisi,
  'paket_ReceteyiFiltrele': ?instance.paketReceteyiFiltrele,
  'islemler_HucreEtiket': ?instance.islemlerHucreEtiket,
  'islemler_StokEtiket': ?instance.islemlerStokEtiket,
  'islemler_BarkodTanimlama': ?instance.islemlerBarkodTanimlama,
  'siparis_MusteriSiparisi': ?instance.siparisMusteriSiparisi,
  'siparis_MusteriSiparisi_Kaydet': ?instance.siparisMusteriSiparisiKaydet,
  'siparis_MusteriSiparisi_Duzelt': ?instance.siparisMusteriSiparisiDuzelt,
  'siparis_MusteriSiparisi_Sil': ?instance.siparisMusteriSiparisiSil,
  'siparis_MusteriSiparisi_KapalilarListelenmesin':
      ?instance.siparisMusteriSiparisiKapalilarListelenmesin,
  'siparis_MusteriSiparisi_FiyatDegistirilmesin':
      ?instance.siparisMusteriSiparisiFiyatDegistirilmesin,
  'siparis_MusteriSiparisi_FiyatSirasi':
      ?instance.siparisMusteriSiparisiFiyatSirasi,
  'siparis_MusSip_Birim1denKaydet': ?instance.siparisMusSipBirim1DenKaydet,
  'siparis_MusteriSiparisi_KapatmaIslemi':
      ?instance.siparisMusteriSiparisiKapatmaIslemi,
  'siparis_MusSip_OnayIslemleri': ?instance.siparisMusSipOnayIslemleri,
  'siparis_MusSip_StokIhtiyacRaporu': ?instance.siparisMusSipStokIhtiyacRaporu,
  'siparis_MusteriSiparisi_SonFiyatGoster':
      ?instance.siparisMusteriSiparisiSonFiyatGoster,
  'siparis_MusSip_DigerSekmesiGoster':
      ?instance.siparisMusSipDigerSekmesiGoster,
  'siparis_MusSip_EkAlan2Tablodan': ?instance.siparisMusSipEkAlan2Tablodan,
  'siparis_MusSip_EkAlan2Hatirla': ?instance.siparisMusSipEkAlan2Hatirla,
  'siparis_MusSip_Miktar1Gelsin': ?instance.siparisMusSipMiktar1Gelsin,
  'siparis_MusSip_BosGecilmeyecekAlanlar':
      ?instance.siparisMusSipBosGecilmeyecekAlanlar,
  'siparis_SaticiSip_BosGecilmeyecekAlanlar':
      ?instance.siparisSaticiSipBosGecilmeyecekAlanlar,
  'siparis_MusSip_OtoPdfGor': ?instance.siparisMusSipOtoPdfGor,
  'siparis_MusSip_CariKoduDegistir': ?instance.siparisMusSipCariKoduDegistir,
  'siparis_MusteriSiparisi_AciklamaAlanlari':
      ?instance.siparisMusteriSiparisiAciklamaAlanlari,
  'siparis_MusteriSiparisi_GizlenecekAlanlar':
      ?instance.siparisMusteriSiparisiGizlenecekAlanlar,
  'siparis_MusteriSiparisi_DegismeyecekAlanlar':
      ?instance.siparisMusteriSiparisiDegismeyecekAlanlar,
  'siparis_SaticiSiparisi_DegismeyecekAlanlar':
      ?instance.siparisSaticiSiparisiDegismeyecekAlanlar,
  'siparis_MusSip_EkstraAlanlar': ?instance.siparisMusSipEkstraAlanlar,
  'siparis_MusteriSiparisi_SatirAciklamaAlanlari':
      ?instance.siparisMusteriSiparisiSatirAciklamaAlanlari,
  'siparis_MusSip_OlcuBirimi': ?instance.siparisMusSipOlcuBirimi,
  'siparis_MusSip_BakiyesizStokSecilmesin':
      ?instance.siparisMusSipBakiyesizStokSecilmesin,
  'siparis_MusSip_HizliUrunGirisi_Miktar2Kullanilsin':
      ?instance.siparisMusSipHizliUrunGirisiMiktar2Kullanilsin,
  'siparis_MusteriSiparisi_DipFiyatUygulamasi':
      ?instance.siparisMusteriSiparisiDipFiyatUygulamasi,
  'siparis_MusteriSiparisi_DipFiyatSaha':
      ?instance.siparisMusteriSiparisiDipFiyatSaha,
  'siparis_MusteriSiparisi_DipFiyatEylem':
      ?instance.siparisMusteriSiparisiDipFiyatEylem,
  'siparis_MusSip_MaxIskUygulamasi': ?instance.siparisMusSipMaxIskUygulamasi,
  'siparis_MusSip_MaxSatIsk1': ?instance.siparisMusSipMaxSatIsk1,
  'siparis_MusSip_MaxSatIsk2': ?instance.siparisMusSipMaxSatIsk2,
  'siparis_MusSip_MaxSatIsk3': ?instance.siparisMusSipMaxSatIsk3,
  'siparis_MusSip_MaxSatIsk4': ?instance.siparisMusSipMaxSatIsk4,
  'siparis_MusSip_MaxSatIsk5': ?instance.siparisMusSipMaxSatIsk5,
  'siparis_MusSip_MaxSatIsk6': ?instance.siparisMusSipMaxSatIsk6,
  'siparis_MusSip_MaxGenIsk1': ?instance.siparisMusSipMaxGenIsk1,
  'siparis_MusSip_MaxGenIsk2': ?instance.siparisMusSipMaxGenIsk2,
  'siparis_MusSip_MaxGenIsk3': ?instance.siparisMusSipMaxGenIsk3,
  'siparis_MusteriSiparisi_Raporlar': ?instance.siparisMusteriSiparisiRaporlar,
  'siparis_MusteriSiparisi_DurumRaporu':
      ?instance.siparisMusteriSiparisiDurumRaporu,
  'siparis_MusteriSiparisi_DurumRaporuFiyatGor':
      ?instance.siparisMusteriSiparisiDurumRaporuFiyatGor,
  'siparis_MusSip_KarlilikRaporu': ?instance.siparisMusSipKarlilikRaporu,
  'siparis_MusSip_TeslimRaporu': ?instance.siparisMusSipTeslimRaporu,
  'siparis_SaticiSiparisi': ?instance.siparisSaticiSiparisi,
  'siparis_SaticiSiparisi_Kaydet': ?instance.siparisSaticiSiparisiKaydet,
  'siparis_SaticiSiparisi_Duzelt': ?instance.siparisSaticiSiparisiDuzelt,
  'siparis_SaticiSiparisi_Sil': ?instance.siparisSaticiSiparisiSil,
  'siparis_SaticiSiparisi_KapalilarListelenmesin':
      ?instance.siparisSaticiSiparisiKapalilarListelenmesin,
  'siparis_SaticiSiparisi_FiyatDegistirilmesin':
      ?instance.siparisSaticiSiparisiFiyatDegistirilmesin,
  'siparis_SaticiSiparisi_FiyatSirasi':
      ?instance.siparisSaticiSiparisiFiyatSirasi,
  'siparis_SaticiSip_Birim1denKaydet':
      ?instance.siparisSaticiSipBirim1DenKaydet,
  'siparis_SaticiSiparisi_KapatmaIslemi':
      ?instance.siparisSaticiSiparisiKapatmaIslemi,
  'siparis_SaticiSip_OnayIslemleri': ?instance.siparisSaticiSipOnayIslemleri,
  'siparis_SaticiSip_DigerSekmesiGoster':
      ?instance.siparisSaticiSipDigerSekmesiGoster,
  'siparis_SaticiSip_OlcuBirimi': ?instance.siparisSaticiSipOlcuBirimi,
  'siparis_SaticiSip_CariKoduDegistir':
      ?instance.siparisSaticiSipCariKoduDegistir,
  'siparis_SaticiSiparisi_Raporlar': ?instance.siparisSaticiSiparisiRaporlar,
  'siparis_SaticiSiparisi_DurumRaporu':
      ?instance.siparisSaticiSiparisiDurumRaporu,
  'siparis_SaticiSiparisi_DurumRaporuFiyatGor':
      ?instance.siparisSaticiSiparisiDurumRaporuFiyatGor,
  'siparis_SaticiSip_TeslimRaporu': ?instance.siparisSaticiSipTeslimRaporu,
  'stok_StokListesi': ?instance.stokStokListesi,
  'stok_StokListesi_ExtraAlanlar': ?instance.stokStokListesiExtraAlanlar,
  'stok_StokKarti': ?instance.stokStokKarti,
  'stok_StokKarti_Kaydet': ?instance.stokStokKartiKaydet,
  'stok_StokKarti_Duzelt': ?instance.stokStokKartiDuzelt,
  'stok_StokKarti_Sil': ?instance.stokStokKartiSil,
  'stok_StokKarti_AlisFiyatiGizle': ?instance.stokStokKartiAlisFiyatiGizle,
  'stok_StokKarti_SatisFiyatiGizle': ?instance.stokStokKartiSatisFiyatiGizle,
  'stok_StokHareketleri': ?instance.stokStokHareketleri,
  'stok_StokHar_Kaydet': ?instance.stokStokHarKaydet,
  'stok_StokHar_Duzelt': ?instance.stokStokHarDuzelt,
  'stok_StokHar_Sil': ?instance.stokStokHarSil,
  'stok_StokHar_PlasiyerKendiniGorsun':
      ?instance.stokStokHarPlasiyerKendiniGorsun,
  'stok_ResimGoster': ?instance.stokResimGoster,
  'stok_ResimGoster_Ekle': ?instance.stokResimGosterEkle,
  'stok_ResimGoster_Sil': ?instance.stokResimGosterSil,
  'stok_FiyatOzeti': ?instance.stokFiyatOzeti,
  'stok_HareketDetayiniGizle': ?instance.stokHareketDetayiniGizle,
  'stok_GirisHareketleriniGizle': ?instance.stokGirisHareketleriniGizle,
  'stok_CikisHareketleriniGizle': ?instance.stokCikisHareketleriniGizle,
  'stok_BakiyeGosterimTipi': ?instance.stokBakiyeGosterimTipi,
  'stok_BarkodKontrol': ?instance.stokBarkodKontrol,
  'stok_DepoBakiyeDurumu': ?instance.stokDepoBakiyeDurumu,
  'stok_BarkodTanimlama': ?instance.stokBarkodTanimlama,
  'stok_BarkodTanimlama_GorunecekAlanlar':
      ?instance.stokBarkodTanimlamaGorunecekAlanlar,
  'stok_BarkodKayitlari_GecerliBarkodTipleri':
      ?instance.stokBarkodKayitlariGecerliBarkodTipleri,
  'stok_BarkodKayitlari_GecerliOlcuBirimleri':
      ?instance.stokBarkodKayitlariGecerliOlcuBirimleri,
  'stok_BarkodKayitlari': ?instance.stokBarkodKayitlari,
  'stok_BarkodKayitlari_Ekle': ?instance.stokBarkodKayitlariEkle,
  'stok_BarkodKayitlari_Duzelt': ?instance.stokBarkodKayitlariDuzelt,
  'stok_BarkodKayitlari_Sil': ?instance.stokBarkodKayitlariSil,
  'stok_KanbanBarkodEsle': ?instance.stokKanbanBarkodEsle,
  'stok_KanbanBarkodEsle_Sil': ?instance.stokKanbanBarkodEsleSil,
  'stok_KanbanBarkodEsleFarkliStokOkutulmasin':
      ?instance.stokKanbanBarkodEsleFarkliStokOkutulmasin,
  'stok_FiyatGorEkrani': ?instance.stokFiyatGorEkrani,
  'stok_FiyatGorEkraniGorunecekAlanlar':
      ?instance.stokFiyatGorEkraniGorunecekAlanlar,
  'stok_FiyatGecmisi': ?instance.stokFiyatGecmisi,
  'stok_FiyatGecmisiSil': ?instance.stokFiyatGecmisiSil,
  'stok_FiyatGecmisiFiyatTipleri': ?instance.stokFiyatGecmisiFiyatTipleri,
  'stok_SeriHar': ?instance.stokSeriHar,
  'stok_SeriHar_Ekle': ?instance.stokSeriHarEkle,
  'stok_SeriHar_Duzelt': ?instance.stokSeriHarDuzelt,
  'stok_SeriHar_Sil': ?instance.stokSeriHarSil,
  'stok_SeriParcala': ?instance.stokSeriParcala,
  'stok_SeriParcala_Ekle': ?instance.stokSeriParcalaEkle,
  'stok_SeriParcala_Duzelt': ?instance.stokSeriParcalaDuzelt,
  'stok_SeriParcala_Sil': ?instance.stokSeriParcalaSil,
  'stok_SeriBirlestir': ?instance.stokSeriBirlestir,
  'stok_SeriBirlestir_Ekle': ?instance.stokSeriBirlestirEkle,
  'stok_SeriBirlestir_Duzelt': ?instance.stokSeriBirlestirDuzelt,
  'stok_SeriBirlestir_Sil': ?instance.stokSeriBirlestirSil,
  'stok_Paketleme': ?instance.stokPaketleme,
  'stok_Paketleme_Ekle': ?instance.stokPaketlemeEkle,
  'stok_Paketleme_Sil': ?instance.stokPaketlemeSil,
  'stok_Paketleme_OnaySormasin': ?instance.stokPaketlemeOnaySormasin,
  'stok_Paketleme_DigerKulKayitGorebilir':
      ?instance.stokPaketlemeDigerKulKayitGorebilir,
  'stok_Paketleme_SorulacakBelgeTipleri':
      ?instance.stokPaketlemeSorulacakBelgeTipleri,
  'stok_Raporlar': ?instance.stokRaporlar,
  'stok_Rap_AmbarMaliyet': ?instance.stokRapAmbarMaliyet,
  'stok_Rap_LokalDepoBakiye': ?instance.stokRapLokalDepoBakiye,
  'stok_Rap_UrunGrubunaGoreSatis': ?instance.stokRapUrunGrubunaGoreSatis,
  'cari_CariListesi': ?instance.cariCariListesi,
  'cari_CariListesi_RiskGorebilir': ?instance.cariCariListesiRiskGorebilir,
  'cari_RiskGirisi': ?instance.cariRiskGirisi,
  'cari_CariKarti': ?instance.cariCariKarti,
  'cari_CariKarti_Kaydet': ?instance.cariCariKartiKaydet,
  'cari_CariKarti_Duzelt': ?instance.cariCariKartiDuzelt,
  'cari_CariKarti_Sil': ?instance.cariCariKartiSil,
  'cari_CariKarti_EIslemler': ?instance.cariCariKartiEIslemler,
  'cari_CariKarti_DegismeyecekAlanlar':
      ?instance.cariCariKartiDegismeyecekAlanlar,
  'cari_CariKarti_GizlenecekAlanlar': ?instance.cariCariKartiGizlenecekAlanlar,
  'cari_CariHareketleri': ?instance.cariCariHareketleri,
  'cari_CariHar_Kaydet': ?instance.cariCariHarKaydet,
  'cari_CariHar_Duzelt': ?instance.cariCariHarDuzelt,
  'cari_CariHar_Sil': ?instance.cariCariHarSil,
  'cari_CariHareketleri_HarDetayGorsun':
      ?instance.cariCariHareketleriHarDetayGorsun,
  'stok_CariHar_PlasiyerKendiniGorsun':
      ?instance.stokCariHarPlasiyerKendiniGorsun,
  'cari_Aktivite': ?instance.cariAktivite,
  'cari_Aktivite_Ekle': ?instance.cariAktiviteEkle,
  'cari_Aktivite_Duzelt': ?instance.cariAktiviteDuzelt,
  'cari_Aktivite_Sil': ?instance.cariAktiviteSil,
  'cari_Aktivite_Atayabilir': ?instance.cariAktiviteAtayabilir,
  'cari_Aktivite_BitirmeyiGeriAl': ?instance.cariAktiviteBitirmeyiGeriAl,
  'cari_OzelHesapKapatma': ?instance.cariOzelHesapKapatma,
  'cari_OzelHesapKapatma_Sil': ?instance.cariOzelHesapKapatmaSil,
  'cari_VadeKontrolu': ?instance.cariVadeKontrolu,
  'cari_VadeKontrolu_Gun': ?instance.cariVadeKontroluGun,
  'cari_VadeKontrolu_BelgeTipleri': ?instance.cariVadeKontroluBelgeTipleri,
  'cari_Filtre': ?instance.cariFiltre,
  'cari_FiltreSQL': ?instance.cariFiltreSql,
  'cari_Virman': ?instance.cariVirman,
  'cari_Virman_Kaydet': ?instance.cariVirmanKaydet,
  'cari_Harita': ?instance.cariHarita,
  'cari_TeslimCari_RehberSadeceSecsin':
      ?instance.cariTeslimCariRehberSadeceSecsin,
  'cari_TeslimCari_SatisBaglanmisCarilerSecilsin':
      ?instance.cariTeslimCariSatisBaglanmisCarilerSecilsin,
  'cari_TeslimCari_AlisBaglanmisCarilerSecilsin':
      ?instance.cariTeslimCariAlisBaglanmisCarilerSecilsin,
  'cari_Raporlar': ?instance.cariRaporlar,
  'cari_Rap_Ekstre': ?instance.cariRapEkstre,
  'cari_Rap_StokEkstre': ?instance.cariRapStokEkstre,
  'cari_Rap_Yaslandirma': ?instance.cariRapYaslandirma,
  'cari_Rap_HarDetayliYaslandir': ?instance.cariRapHarDetayliYaslandir,
  'cari_Rap_Hareket': ?instance.cariRapHareket,
  'cari_Rap_DovizBakiye': ?instance.cariRapDovizBakiye,
  'cari_Rap_StokSatisOzeti': ?instance.cariRapStokSatisOzeti,
  'cari_Rap_DovizliEkstre': ?instance.cariRapDovizliEkstre,
  'tahsilat_Tahsilatlar': ?instance.tahsilatTahsilatlar,
  'tahsilat_Payker': ?instance.tahsilatPayker,
  'tahsilat_NakitTahsilat': ?instance.tahsilatNakitTahsilat,
  'tahsilat_NakitTahsilat_Kaydet': ?instance.tahsilatNakitTahsilatKaydet,
  'tahsilat_KKartiTahsilat': ?instance.tahsilatKKartiTahsilat,
  'tahsilat_KKartiTahsilat_Kaydet': ?instance.tahsilatKKartiTahsilatKaydet,
  'tahsilat_NakitOdeme': ?instance.tahsilatNakitOdeme,
  'tahsilat_NakitOdeme_Kaydet': ?instance.tahsilatNakitOdemeKaydet,
  'tahsilat_SenetTahsilat': ?instance.tahsilatSenetTahsilat,
  'tahsilat_SenetTahsilat_Kaydet': ?instance.tahsilatSenetTahsilatKaydet,
  'tahsilat_CekTahsilat': ?instance.tahsilatCekTahsilat,
  'tahsilat_CekTahsilat_Kaydet': ?instance.tahsilatCekTahsilatKaydet,
  'tahsilat_MuhtelifTahsilat': ?instance.tahsilatMuhtelifTahsilat,
  'tahsilat_MuhtelifOdeme': ?instance.tahsilatMuhtelifOdeme,
  'tahsilat_MuhtelifTahsilatFiltre': ?instance.tahsilatMuhtelifTahsilatFiltre,
  'tahsilat_MuhtelifTahsilatFiltreSQL':
      ?instance.tahsilatMuhtelifTahsilatFiltreSQL,
  'tahsilat_MuhtelifOdemeFiltre': ?instance.tahsilatMuhtelifOdemeFiltre,
  'tahsilat_MuhtelifOdemeFiltreSQL': ?instance.tahsilatMuhtelifOdemeFiltreSQL,
  'yonetici_Banka_Banka_Litesi': ?instance.yoneticiBankaBankaLitesi,
  'yonetici_Banka_Islemleri': ?instance.yoneticiBankaIslemleri,
  'yonetici_Banka_Islemleri_Sil': ?instance.yoneticiBankaIslemleriSil,
  'yonetici_Banka_Islem_HesapEFT': ?instance.yoneticiBankaIslemHesapEft,
  'yonetici_Banka_Islem_HesapVirman': ?instance.yoneticiBankaIslemHesapVirman,
  'yonetici_Banka_Islem_CariEFT': ?instance.yoneticiBankaIslemCariEft,
  'finans_Banka_Kasa_Transferi': ?instance.finansBankaKasaTransferi,
  'finans_Kasa_Listesi': ?instance.finansKasaListesi,
  'finans_Kasa_Islemleri': ?instance.finansKasaIslemleri,
  'finans_Kasa_Islemleri_Sil': ?instance.finansKasaIslemleriSil,
  'finans_KasalarArasiTransfer': ?instance.finansKasalarArasiTransfer,
  'finans_Kasa_NakitTahsilat': ?instance.finansKasaNakitTahsilat,
  'finans_Kasa_NakitOdeme': ?instance.finansKasaNakitOdeme,
  'finans_Kasa_MuhtelifTahsilat': ?instance.finansKasaMuhtelifTahsilat,
  'finans_Kasa_MuhtelifOdeme': ?instance.finansKasaMuhtelifOdeme,
  'finans_Kasa_SenetTahsilati': ?instance.finansKasaSenetTahsilati,
  'finans_Kasa_SenetOdemesi': ?instance.finansKasaSenetOdemesi,
  'finans_Kasa_CekTahsilati': ?instance.finansKasaCekTahsilati,
  'finans_Kasa_CekOdemesi': ?instance.finansKasaCekOdemesi,
  'dekont_Listesi': ?instance.dekontListesi,
  'dekont_Kaydet': ?instance.dekontKaydet,
  'dekont_Duzelt': ?instance.dekontDuzelt,
  'dekont_Sil': ?instance.dekontSil,
  'finans_Cek_GizlenecekAlanlar': ?instance.finansCekGizlenecekAlanlar,
  'finans_Cek_Musteri': ?instance.finansCekMusteri,
  'finans_MCEK_Ekle': ?instance.finansMcekEkle,
  'finans_MCEK_Sil': ?instance.finansMcekSil,
  'finans_MCEK_BelgeDetayi': ?instance.finansMcekBelgeDetayi,
  'finans_MCEK_Hareketler': ?instance.finansMcekHareketler,
  'finans_MCEK_Evraklar': ?instance.finansMcekEvraklar,
  'finans_MCEK_CariyeCiro': ?instance.finansMcekCariyeCiro,
  'finans_MCEK_TahsileCiro': ?instance.finansMcekTahsileCiro,
  'finans_MCEK_TahsilDekontu': ?instance.finansMcekTahsilDekontu,
  'finans_Cek_Borc': ?instance.finansCekBorc,
  'finans_BorcCeki_Ekle': ?instance.finansBorcCekiEkle,
  'finans_BorcCeki_Sil': ?instance.finansBorcCekiSil,
  'finans_BCEK_Ekle': ?instance.finansBcekEkle,
  'finans_BCEK_Sil': ?instance.finansBcekSil,
  'finans_BCEK_BelgeDetayi': ?instance.finansBcekBelgeDetayi,
  'finans_BCEK_Hareketler': ?instance.finansBcekHareketler,
  'finans_BCEK_Evraklar': ?instance.finansBcekEvraklar,
  'finans_BCEK_OdemeDekontu': ?instance.finansBcekOdemeDekontu,
  'finans_Senet_Musteri': ?instance.finansSenetMusteri,
  'finans_MSEN_Ekle': ?instance.finansMsenEkle,
  'finans_MSEN_Sil': ?instance.finansMsenSil,
  'finans_MSEN_BelgeDetayi': ?instance.finansMsenBelgeDetayi,
  'finans_MSEN_Hareketler': ?instance.finansMsenHareketler,
  'finans_MSEN_Evraklar': ?instance.finansMsenEvraklar,
  'finans_MSEN_CariyeCiro': ?instance.finansMsenCariyeCiro,
  'finans_MSEN_TahsileCiro': ?instance.finansMsenTahsileCiro,
  'finans_MSEN_TahsilDekontu': ?instance.finansMsenTahsilDekontu,
  'finans_Senet_Borc': ?instance.finansSenetBorc,
  'finans_BSEN_Ekle': ?instance.finansBsenEkle,
  'finans_BSEN_Sil': ?instance.finansBsenSil,
  'finans_BSEN_BelgeDetayi': ?instance.finansBsenBelgeDetayi,
  'finans_BSEN_Hareketler': ?instance.finansBsenHareketler,
  'finans_BSEN_Evraklar': ?instance.finansBsenEvraklar,
  'finans_BSEN_OdemeDekontu': ?instance.finansBsenOdemeDekontu,
  'finans_KKartiTahsilati': ?instance.finansKKartiTahsilati,
  'finans_MuhtelifTahsilat': ?instance.finansMuhtelifTahsilat,
  'finans_MuhtelifOdeme': ?instance.finansMuhtelifOdeme,
  'finans_TahsilatKayitlari': ?instance.finansTahsilatKayitlari,
  'finans_HizliTahsilatKayitlari': ?instance.finansHizliTahsilatKayitlari,
  'finans_HizliTahsilatKayitlari_Sil':
      ?instance.finansHizliTahsilatKayitlariSil,
  'finans_OrtalamaVadeTarihiHesaplama':
      ?instance.finansOrtalamaVadeTarihiHesaplama,
  'finans_OzetRapor': ?instance.finansOzetRapor,
  'finans_Raporlar_FinansalDurum': ?instance.finansRaporlarFinansalDurum,
  'finans_Raporlar_AylikMizan': ?instance.finansRaporlarAylikMizan,
  'temsilci_Profil': ?instance.temsilciProfil,
  'temsilci_Profil_KdvDahil': ?instance.temsilciProfilKdvDahil,
  'temsilci_Profil_SatisPerformansiniGizle':
      ?instance.temsilciProfilSatisPerformansiniGizle,
  'temsilci_Profil_AylaraGoreSatisiGizle':
      ?instance.temsilciProfilAylaraGoreSatisiGizle,
  'temsilci_Profil_AylaraGoreTahsilatiGizle':
      ?instance.temsilciProfilAylaraGoreTahsilatiGizle,
  'yazdirma_BluetoothYaziciKullanabilir':
      ?instance.yazdirmaBluetoothYaziciKullanabilir,
  'yazdirma_Hucre_Etiketi': ?instance.yazdirmaHucreEtiketi,
  'yazdirma_Hucre_Etiketi_Yazicilari': ?instance.yazdirmaHucreEtiketiYazicilari,
  'yazdirma_Dizayn_HucreEtiketi': ?instance.yazdirmaDizaynHucreEtiketi,
  'yazdirma_MalToplama_Etiketi': ?instance.yazdirmaMalToplamaEtiketi,
  'yazdirma_Mal_Toplama_Yazicilari': ?instance.yazdirmaMalToplamaYazicilari,
  'yazdirma_Dizayn_MalToplama': ?instance.yazdirmaDizaynMalToplama,
  'yazdirma_MalKontrol_Etiketi': ?instance.yazdirmaMalKontrolEtiketi,
  'yazdirma_Mal_Kontrol_Yazicilari': ?instance.yazdirmaMalKontrolYazicilari,
  'yazdirma_Dizayn_MalKontrol': ?instance.yazdirmaDizaynMalKontrol,
  'yazdirma_DAT': ?instance.yazdirmaDat,
  'yazdirma_DAT_Yazicilari': ?instance.yazdirmaDatYazicilari,
  'yazdirma_Dizayn_DAT': ?instance.yazdirmaDizaynDAT,
  'yazdirma_Paketleme_Etiketi': ?instance.yazdirmaPaketlemeEtiketi,
  'yazdirma_Paketleme_KopyaSayisiGizle':
      ?instance.yazdirmaPaketlemeKopyaSayisiGizle,
  'yazdirma_Paketleme_Yazicilari': ?instance.yazdirmaPaketlemeYazicilari,
  'yazdirma_Dizayn_Paketleme': ?instance.yazdirmaDizaynPaketleme,
  'yazdirma_SatisIrs': ?instance.yazdirmaSatisIrs,
  'yazdirma_SatisFat': ?instance.yazdirmaSatisFat,
  'yazdirma_SatisFat_Yazicilari': ?instance.yazdirmaSatisFatYazicilari,
  'yazdirma_Dizayn_SatisFat': ?instance.yazdirmaDizaynSatisFat,
  'yazdirma_AlisFat': ?instance.yazdirmaAlisFat,
  'yazdirma_Dizayn_AlisFat': ?instance.yazdirmaDizaynAlisFat,
  'yazdirma_Mustahsil': ?instance.yazdirmaMustahsil,
  'yazdirma_MusSip': ?instance.yazdirmaMusSip,
  'yazdirma_MusSip_Yazicilari': ?instance.yazdirmaMusSipYazicilari,
  'yazdirma_Dizayn_MusSip': ?instance.yazdirmaDizaynMusSip,
  'yazdirma_SaticiSip': ?instance.yazdirmaSaticiSip,
  'yazdirma_Dizayn_SaticiSip': ?instance.yazdirmaDizaynSaticiSip,
  'yazdirma_ATAL': ?instance.yazdirmaAtal,
  'yazdirma_ATAL_Yazicilari': ?instance.yazdirmaAtalYazicilari,
  'yazdirma_Dizayn_ATAL': ?instance.yazdirmaDizaynATAL,
  'yazdirma_OdemeMakbuzu': ?instance.yazdirmaOdemeMakbuzu,
  'yazdirma_OdemeMakbuzu_Yazicilari': ?instance.yazdirmaOdemeMakbuzuYazicilari,
  'yazdirma_Dizayn_OdemeMakbuzu': ?instance.yazdirmaDizaynOdemeMakbuzu,
  'yazdirma_AlisIrs': ?instance.yazdirmaAlisIrs,
  'yazdirma_AlisIrs_Yazicilari': ?instance.yazdirmaAlisIrsYazicilari,
  'yazdirma_Dizayn_AlisIrs': ?instance.yazdirmaDizaynAlisIrs,
  'yazdirma_IsEmri': ?instance.yazdirmaIsEmri,
  'yazdirma_AmbarCikis': ?instance.yazdirmaAmbarCikis,
  'yazdirma_AmbarGiris': ?instance.yazdirmaAmbarGiris,
  'yazdirma_CariHareket': ?instance.yazdirmaCariHareket,
  'uretim_FiyatGorebilir': ?instance.uretimFiyatGorebilir,
  'uretim_USK_Kaydet': ?instance.uretimUskKaydet,
  'uretim_USK_Duzelt': ?instance.uretimUskDuzelt,
  'uretim_USK_Sil': ?instance.uretimUskSil,
  'uretim_USK_KacGunlukKayitlarListelensin':
      ?instance.uretimUskKacGunlukKayitlarListelensin,
  'uretim_USK_MiktarBarkoddan': ?instance.uretimUskMiktarBarkoddan,
  'uretim_USK_Miktar1Gelsin': ?instance.uretimUskMiktar1Gelsin,
  'sirket_Depo_Uretim_Giris': ?instance.sirketDepoUretimGiris,
  'sirket_Depo_Uretim_Cikis': ?instance.sirketDepoUretimCikis,
  'uretim_USK_IsEmriOtoGelsin': ?instance.uretimUskIsEmriOtoGelsin,
  'uretim_USK_SoruSorulmasin': ?instance.uretimUskSoruSorulmasin,
  'uretim_USK_StokRehberiAcilmasin': ?instance.uretimUskStokRehberiAcilmasin,
  'uretim_USK_KlavyeEngelle': ?instance.uretimUskKlavyeEngelle,
  'uretim_USK_DepoOnceligi': ?instance.uretimUskDepoOnceligi,
  'uretim_USK_FisiErpUretsin': ?instance.uretimUskFisiErpUretsin,
  'uretim_USK_GizlenecekAlanlar': ?instance.uretimUskGizlenecekAlanlar,
  'uretim_USK_BosGecilmeyecekAlanlar':
      ?instance.uretimUskBosGecilmeyecekAlanlar,
  'uretim_USK_DegismeyecekAlanlar': ?instance.uretimUskDegismeyecekAlanlar,
  'uretim_USK_OlcuBirimi': ?instance.uretimUskOlcuBirimi,
  'uretim_USK_OtoYazdir': ?instance.uretimUskOtoYazdir,
  'uretim_USK_KalemliYapi': ?instance.uretimUskKalemliYapi,
  'uretim_USK_KalemliYapi_StokMevcutaEklensin':
      ?instance.uretimUskKalemliYapiStokMevcutaEklensin,
  'uretim_USK_KalemliYapi_OtoEtiketYazdir':
      ?instance.uretimUskKalemliYapiOtoEtiketYazdir,
  'uretim_USK_KalemliYapi_AyniBarkodOkutulamaz':
      ?instance.uretimUskKalemliYapiAyniBarkodOkutulamaz,
  'uretim_USK_KalemliYapi_OkutulanEnUsteEklensin':
      ?instance.uretimUskKalemliYapiOkutulanEnUsteEklensin,
  'uretim_USK_KalemliYapi_KalemDuzeltilemesin':
      ?instance.uretimUskKalemliYapiKalemDuzeltilemesin,
  'uretim_ReceteIzleme': ?instance.uretimReceteIzleme,
  'uretim_MalToplama': ?instance.uretimMalToplama,
  'uretim_MalToplama_Ekle': ?instance.uretimMalToplamaEkle,
  'uretim_MalToplama_Sil': ?instance.uretimMalToplamaSil,
  'uretim_MalToplama_KlavyeEngelle': ?instance.uretimMalToplamaKlavyeEngelle,
  'uretim_MalToplama_BarkodOkutsun': ?instance.uretimMalToplamaBarkodOkutsun,
  'uretim_MalToplama_BelgeTipleri': ?instance.uretimMalToplamaBelgeTipleri,
  'uretim_MalToplama_ReceteFiltresi': ?instance.uretimMalToplamaReceteFiltresi,
  'uretim_MalToplama_ReceteFiltresiSQL':
      ?instance.uretimMalToplamaReceteFiltresiSQL,
  'uretim_IsEmri': ?instance.uretimIsEmri,
  'uretim_Isemri_HammaddeTakip': ?instance.uretimIsemriHammaddeTakip,
  'uretim_IsEmri_Ekle': ?instance.uretimIsEmriEkle,
  'uretim_IsEmri_Duzelt': ?instance.uretimIsEmriDuzelt,
  'uretim_IsEmri_Sil': ?instance.uretimIsEmriSil,
  'taltek_STEK': ?instance.taltekStek,
  'taltek_STEK_Kaydet': ?instance.taltekStekKaydet,
  'taltek_STEK_Duzelt': ?instance.taltekStekDuzelt,
  'taltek_STEK_Sil': ?instance.taltekStekSil,
  'taltek_STEK_KapalilarListenlenmesin':
      ?instance.taltekStekKapalilarListenlenmesin,
  'taltek_STEK_OnayIslemleri': ?instance.taltekStekOnayIslemleri,
  'taltek_STEK_CariKoduDegistir': ?instance.taltekStekCariKoduDegistir,
  'taltek_STEK_FiyatDegistirilmesin': ?instance.taltekStekFiyatDegistirilmesin,
  'taltek_STEK_Aciklamalar_YetkiTuru': ?instance.taltekStekAciklamalarYetkiTuru,
  'taltek_STEK_GizlenecekAlanlar': ?instance.taltekStekGizlenecekAlanlar,
  'taltek_STEK_DegismeyecekAlanlar': ?instance.taltekStekDegismeyecekAlanlar,
  'taltek_ATAL_DegismeyecekAlanlar': ?instance.taltekAtalDegismeyecekAlanlar,
  'taltek_STAL_DegismeyecekAlanlar': ?instance.taltekStalDegismeyecekAlanlar,
  'taltek_STEK_BosGecilmeyecekAlanlar':
      ?instance.taltekStekBosGecilmeyecekAlanlar,
  'taltek_STAL_BosGecilmeyecekAlanlar':
      ?instance.taltekStalBosGecilmeyecekAlanlar,
  'taltek_ATAL_BosGecilmeyecekAlanlar':
      ?instance.taltekAtalBosGecilmeyecekAlanlar,
  'taltek_STEK_AciklamaAlanlari': ?instance.taltekStekAciklamaAlanlari,
  'taltek_STEK_OzelKod1degeri': ?instance.taltekStekOzelKod1degeri,
  'taltek_STEK_DipFiyatUygulamasi': ?instance.taltekStekDipFiyatUygulamasi,
  'taltek_STEK_DipFiyatSaha': ?instance.taltekStekDipFiyatSaha,
  'taltek_STEK_DipFiyatEylem': ?instance.taltekStekDipFiyatEylem,
  'taltek_ATAL': ?instance.taltekAtal,
  'taltek_ATAL_Kaydet': ?instance.taltekAtalKaydet,
  'taltek_ATAL_Duzelt': ?instance.taltekAtalDuzelt,
  'taltek_ATAL_Sil': ?instance.taltekAtalSil,
  'taltek_ATAL_CariEMailAlani': ?instance.taltekAtalCariEMailAlani,
  'taltek_ATAL_OnayIslemleri': ?instance.taltekAtalOnayIslemleri,
  'taltek_ATAL_CariKoduDegistir': ?instance.taltekAtalCariKoduDegistir,
  'taltek_ATAL_Aciklamalar_YetkiTuru': ?instance.taltekAtalAciklamalarYetkiTuru,
  'taltek_ATAL_GizlenecekAlanlar': ?instance.taltekAtalGizlenecekAlanlar,
  'taltek_ATAL_AciklamaAlanlari': ?instance.taltekAtalAciklamaAlanlari,
  'taltek_ATAL_BelgeKopyala': ?instance.taltekAtalBelgeKopyala,
  'taltek_STEK_BelgeKopyala': ?instance.taltekStekBelgeKopyala,
  'taltek_STAL': ?instance.taltekStal,
  'taltek_STAL_Kaydet': ?instance.taltekStalKaydet,
  'taltek_STAL_Duzelt': ?instance.taltekStalDuzelt,
  'taltek_STAL_Sil': ?instance.taltekStalSil,
  'taltek_STAL_KapalilarListenlenmesin':
      ?instance.taltekStalKapalilarListenlenmesin,
  'taltek_STAL_OnayIslemleri': ?instance.taltekStalOnayIslemleri,
  'taltek_STAL_CariKoduDegistir': ?instance.taltekStalCariKoduDegistir,
  'taltek_STAL_FiyatDegistirilmesin': ?instance.taltekStalFiyatDegistirilmesin,
  'taltek_STAL_GizlenecekAlanlar': ?instance.taltekStalGizlenecekAlanlar,
  'taltek_STAL_DipFiyatUygulamasi': ?instance.taltekStalDipFiyatUygulamasi,
  'ebelge_EFat': ?instance.ebelgeEFat,
  'ebelge_EFatCariGuncelle': ?instance.ebelgeEFatCariGuncelle,
  'ebelge_EFatSorgula': ?instance.ebelgeEFatSorgula,
  'ebelge_EFatGelenKutusu': ?instance.ebelgeEFatGelenKutusu,
  'ebelge_EFatTaslakOlustur': ?instance.ebelgeEFatTaslakOlustur,
  'ebelge_EFatTaslakSil': ?instance.ebelgeEFatTaslakSil,
  'ebelge_EFatTaslakBasim': ?instance.ebelgeEFatTaslakBasim,
  'ebelge_EFatGoruntule': ?instance.ebelgeEFatGoruntule,
  'ebelge_EFatAlisFatOlustur': ?instance.ebelgeEFatAlisFatOlustur,
  'ebelge_EFatGonder': ?instance.ebelgeEFatGonder,
  'ebelge_EFat_Dizayn': ?instance.ebelgeEFatDizayn,
  'ebelge_EArsiv': ?instance.ebelgeEArsiv,
  'ebelge_EArsivTaslakOlustur': ?instance.ebelgeEArsivTaslakOlustur,
  'ebelge_EArsivTaslakSil': ?instance.ebelgeEArsivTaslakSil,
  'ebelge_EArsivTaslakBasim': ?instance.ebelgeEArsivTaslakBasim,
  'ebelge_EArsivGoruntule': ?instance.ebelgeEArsivGoruntule,
  'ebelge_EArsivSorgula': ?instance.ebelgeEArsivSorgula,
  'ebelge_EArsivGonder': ?instance.ebelgeEArsivGonder,
  'ebelge_EArsiv_Dizayn': ?instance.ebelgeEArsivDizayn,
  'ebelge_EIrsaliye': ?instance.ebelgeEIrsaliye,
  'ebelge_EFatGidenKutusu': ?instance.ebelgeEFaturaGidenKutusu,
  'ebelge_EIrsaliyeGidenKutusu': ?instance.ebelgeEIrsaliyeGidenKutusu,
  'ebelge_EIrsaliyeGelenKutusu': ?instance.ebelgeEIrsaliyeGelenKutusu,
  'ebelge_EIrsaliyeTaslakOlustur': ?instance.ebelgeEIrsaliyeTaslakOlustur,
  'ebelge_EIrsaliyeTaslakSil': ?instance.ebelgeEIrsaliyeTaslakSil,
  'ebelge_EIrsaliyeTaslakBasim': ?instance.ebelgeEIrsaliyeTaslakBasim,
  'ebelge_EIrsaliyeGonder': ?instance.ebelgeEIrsaliyeGonder,
  'ebelge_EIrsaliyeGoruntule': ?instance.ebelgeEIrsaliyeGoruntule,
  'ebelge_EIrsaliye_Dizayn': ?instance.ebelgeEIrsaliyeDizayn,
  'entegrasyon_UETDSESYA': ?instance.entegrasyonUetdsesya,
  'entegrasyon_UETDSESYA_Iptal': ?instance.entegrasyonUetdsesyaIptal,
  'transfer_DAT_TekrarEdenBarkod': ?instance.transferDatTekrarEdenBarkod,
  'transfer_DAT_AciklamaDuzenle': ?instance.transferDatAciklamaDuzenle,
  'transfer_DAT_LokalDATSeciliGelmesin':
      ?instance.transferDatLokalDatSeciliGelmesin,
  'transfer_DAT_VarsayilanHarTuruDegistiremesin':
      ?instance.transferDatVarsayilanHarTuruDegistiremesin,
  'transfer_DAT_DepoCaridenGelsin': ?instance.transferDatDepoCaridenGelsin,
  'transfer_AG_SipBagSecenegi': ?instance.transferAgSipBagSecenegi,
  'transfer_AG_TekrarEdenBarkod': ?instance.transferAgTekrarEdenBarkod,
  'transfer_AG_AciklamaDuzenle': ?instance.transferAgAciklamaDuzenle,
  'transfer_AC_SipBagSecenegi': ?instance.transferAcSipBagSecenegi,
  'transfer_AC_TekrarEdenBarkod': ?instance.transferAcTekrarEdenBarkod,
  'transfer_AC_AciklamaDuzenle': ?instance.transferAcAciklamaDuzenle,
  'transfer_DepoTalebi_Bildirim': ?instance.transferDepoTalebiBildirim,
  'uretim_USK': ?instance.uretimUsk,
  'malKabul_AlisIrs_DegismeyecekAlanlar':
      ?instance.malKabulAlisIrsDegismeyecekAlanlar,
  'malKabul_AlisIrs_AciklamaDuzenle': ?instance.malKabulAlisIrsAciklamaDuzenle,
  'malKabul_AlisFat_DegismeyecekAlanlar':
      ?instance.malKabulAlisFatDegismeyecekAlanlar,
  'malKabul_AlisFat_AciklamaDuzenle': ?instance.malKabulAlisFatAciklamaDuzenle,
  'malKabul_AlisFat_TekrarEdenBarkod':
      ?instance.malKabulAlisFatTekrarEdenBarkod,
  'malKabul_AlisFaturasi_SipBagSecenegi':
      ?instance.malKabulAlisFaturasiSipBagSecenegi,
  'sevkiyat_SatisIrs_VarsayilanBelgeTipi':
      ?instance.sevkiyatSatisIrsVarsayilanBelgeTipi,
  'sevkiyat_SatisIrsaliyesi_AciklamaAlanlari':
      ?instance.sevkiyatSatisIrsaliyesiAciklamaAlanlari,
  'sevkiyat_SatisIrsaliyesi_AciklamaDuzenle':
      ?instance.sevkiyatSatisIrsaliyesiAciklamaDuzenle,
  'sevkiyat_SatisIrs_KayittanSonraTaslakOlustur':
      ?instance.sevkiyatSatisIrsKayittanSonraTaslakOlustur,
  'sevkiyat_SatisIrs_IadeMiktariGirebilir':
      ?instance.sevkiyatSatisIrsIadeMiktariGirebilir,
  'sevkiyat_SatisIrs_IadeMiktariGirebilirFarkliDepo':
      ?instance.sevkiyatSatisIrsIadeMiktariGirebilirFarkliDepo,
  'sevkiyat_SatisIrs_TekrarEdenBarkod':
      ?instance.sevkiyatSatisIrsTekrarEdenBarkod,
  'sevkiyat_SatisFat_AciklamaDuzenle':
      ?instance.sevkiyatSatisFatAciklamaDuzenle,
  'sevkiyat_SatisFat_IadeMiktariGirebilir':
      ?instance.sevkiyatSatisFatIadeMiktariGirebilir,
  'sevkiyat_SatisFat_IadeMiktariGirebilirFarkliDepo':
      ?instance.sevkiyatSatisFatIadeMiktariGirebilirFarkliDepo,
  'sevkiyat_SatisFaturasi_TekrarEdenBarkod':
      ?instance.sevkiyatSatisFaturasiTekrarEdenBarkod,
  'sevkemri_MalToplama_Yontemi': ?instance.sevkemriMalToplamaYontemi,
  'sayim_SerbestSayimFiltreIslem': ?instance.sayimSerbestSayimFiltreIslem,
  'siparis_MusSip_BelgeKopyala': ?instance.siparisMusSipBelgeKopyala,
  'siparis_MusSip_TekrarEdenBarkod': ?instance.siparisMusSipTekrarEdenBarkod,
  'siparis_MusSip_KacGunlukKayitlarListelensin':
      ?instance.siparisMusSipKacGunlukKayitlarListelensin,
  'siparis_MusteriSiparisi_AciklamaDuzenle':
      ?instance.siparisMusteriSiparisiAciklamaDuzenle,
  'stok_FiltreSQLTipi': ?instance.stokFiltreSqlTipi,
  'stok_FiyatGorEkrani_GunlukKurdanTLGoster':
      ?instance.stokFiyatGorEkraniGunlukKurdanTlGoster,
  'stok_Paketleme_Coklu': ?instance.stokPaketlemeCoklu,
  'stok_RehberBakiyesindeDigerOlcuBirimleriGorunsun':
      ?instance.stokRehberBakiyesindeDigerOlcuBirimleriGorunsun,
  'stok_YazdirPdfGoruntule': ?instance.stokYazdirPdfGoruntule,
  'cari_ToplamGorunmesin': ?instance.cariToplamGorunmesin,
  'cari_BakiyeGosterim': ?instance.cariBakiyeGosterim,
  'cari_FiltreSQLTipi': ?instance.cariFiltreSqlTipi,
  'tahsilat_DovizKuru_Degeri': ?instance.tahsilatDovizKuruDegeri,
  'tahsilat_DovizKuru_Yetki': ?instance.tahsilatDovizKuruYetki,
  'tahsilat_DovizKuru_Tolerans': ?instance.tahsilatDovizKuruTolerans,
  'finans_Raporlar_KasaEkstre': ?instance.finansRaporlarKasaEkstre,
  'finans_Kasa_GizlenecekAlanlar': ?instance.finansKasaGizlenecekAlanlar,
  'finans_Kasa_DegistirilemeyecekAlanlar':
      ?instance.finansKasaDegistirilemeyecekAlanlar,
  'finans_Kasa_BosGecilemeyecekAlanlar':
      ?instance.finansKasaBosGecilemeyecekAlanlar,
  'taltek_STEK_AciklamaDuzenle': ?instance.taltekStekAciklamaDuzenle,
  'taltek_STEK_DipFiyatKDVDurumu': ?instance.taltekStekDipFiyatKdvDurumu,
  'taltek_STAL_AciklamaDuzenle': ?instance.taltekStalAciklamaDuzenle,
  'taltek_STAL_DipFiyatSaha': ?instance.taltekStalDipFiyatSaha,
  'taltek_STAL_DipFiyatEylem': ?instance.taltekStalDipFiyatEylem,
  'taltek_STAL_DipFiyatKDVDurumu': ?instance.taltekStalDipFiyatKdvDurumu,
  'malKabul_AlisIrs_Birim1denKaydet': ?instance.malKabulAlisIrsBirim1DenKaydet,
  'malKabul_AlisFat_Birim1denKaydet': ?instance.malKabulAlisFatBirim1DenKaydet,
  'transfer_AG_Birim1denKaydet': ?instance.transferAgBirim1DenKaydet,
  'transfer_AC_Birim1denKaydet': ?instance.transferAcBirim1DenKaydet,
  'sevkiyat_SatisIrs_KDVSifirGelsin': ?instance.sevkiyatSatisIrsKdvSifirGelsin,
  'sevkiyat_SatisIrs_Birim1denKaydet':
      ?instance.sevkiyatSatisIrsBirim1DenKaydet,
  'sevkiyat_SatisIrs_DipFiyatKDVDurumu':
      ?instance.sevkiyatSatisIrsDipFiyatKdvDurumu,
  'sevkiyat_SatisFat_Birim1denKaydet':
      ?instance.sevkiyatSatisFatBirim1DenKaydet,
  'siparis_MusteriSiparisi_DipFiyatKDVDurumu':
      ?instance.siparisMusteriSiparisiDipFiyatKdvDurumu,
  'siparis_SatSip_TekrarEdenBarkod': ?instance.siparisSatSipTekrarEdenBarkod,
  'siparis_SatSip_KacGunlukKayitlarListelensin':
      ?instance.siparisSatSipKacGunlukKayitlarListelensin,
  'cari_Rap_BorcAlacakDokumu': ?instance.cariRapBorcAlacakDokumu,
  'sirket_Proje_YetkiTuru': ?instance.sirketProjeYetkiTuru,
  'transfer_DAT_VarsayilanHarTuru': ?instance.transferDatVarsayilanHarTuru,
  'siparis_MusSip_KdvDurumu': ?instance.siparisMusSipKdvDurumu,
  'siparis_SaticiSiparisi_AciklamaDuzenle':
      ?instance.siparisSaticiSiparisiAciklamaDuzenle,
  'taltek_STEK_KdvDurumu': ?instance.taltekStekKdvDurumu,
  'taltek_STAL_KdvDurumu': ?instance.taltekStalKdvDurumu,
  'transfer_AG_BosGecilmeyecekAlanlar':
      ?instance.transferAgBosGecilmeyecekAlanlar,
  'transfer_AG_GizlenecekAlanlar': ?instance.transferAgGizlenecekAlanlar,
  'transfer_AG_DegismeyecekAlanlar': ?instance.transferAgDegismeyecekAlanlar,
  'transfer_AG_AciklamaAlanlari': ?instance.transferAgAciklamaAlanlari,
  'transfer_AC_AciklamaAlanlari': ?instance.transferAcAciklamaAlanlari,
  'sevkiyat_SatisFat_KdvDurumu': ?instance.sevkiyatSatisFatKdvDurumu,
  'sigma_OlcumGir': ?instance.sigmaOlcumGir,
  'sigma_OlcumGir_Kaydet': ?instance.sigmaOlcumGirKaydet,
  'sigma_OlcumGir_Duzelt': ?instance.sigmaOlcumGirDuzelt,
  'sigma_OlcumGir_Sil': ?instance.sigmaOlcumGirSil,
  'sigma_TeknikResim': ?instance.sigmaTeknikResim,
  'sigma_KontrolPlani': ?instance.sigmaKontrolPlani,
  'transfer_DAT_EIrsaliyeIsaretDurum':
      ?instance.transferDatEIrsaliyeIsaretDurum,
  'transfer_AC_EIrsaliyeIsaretDurum': ?instance.transferAcEIrsaliyeIsaretDurum,
  'sevkiyat_SatisIrsaliyesi_EIrsaliyeIsaretDurum':
      ?instance.sevkiyatSatisIrsaliyesiEIrsaliyeIsaretDurum,
  'sayim_AyniBarkodEngelle': ?instance.sayimAyniBarkodEngelle,
  'siparis_MusSip_Bildirim': ?instance.siparisMusSipBildirim,
  'siparis_SatSip_Bildirim': ?instance.siparisSatSipBildirim,
  'stok_StokKarti_FiyatlariGizle': ?instance.stokStokKartiFiyatlariGizle,
  'stok_BarkodTanimlama_ZorunluBarkodTipi':
      ?instance.stokBarkodTanimlamaZorunluBarkodTipi,
  'stok_CariStokFiltresiUygulansin': ?instance.stokCariStokFiltresiUygulansin,
  'cari_KodDegistir': ?instance.cariKodDegistir,
  'cari_Rap_DovizliBorcAlacakDokumu': ?instance.cariRapDovizliBorcAlacakDokumu,
  'cari_Rap_UrunGrubunaGoreSatis': ?instance.cariRapUrunGrubunaGoreSatis,
  'finans_Kasa_NakitTahsilat_KasaBakGizle':
      ?instance.finansKasaNakitTahsilatKasaBakGizle,
  'finans_Kasa_NakitOdeme_KasaBakGizle':
      ?instance.finansKasaNakitOdemeKasaBakGizle,
  'finans_Kasa_KacGunlukKayitlarListelensin':
      ?instance.finansKasaKacGunlukKayitlarListelensin,
  'yazdirma_Mustahsil_Yazicilari': ?instance.yazdirmaMustahsilYazicilari,
  'yazdirma_Dizayn_Mustahsil': ?instance.yazdirmaDizaynMustahsil,
  'yazdirma_SaticiSip_Yazicilari': ?instance.yazdirmaSaticiSipYazicilari,
  'yazdirma_SatisTeklifi_Yazicilari': ?instance.yazdirmaSatisTeklifiYazicilari,
  'yazdirma_TahsilatMakbuzu_Yazicilari':
      ?instance.yazdirmaTahsilatMakbuzuYazicilari,
  'sirket_Depo_YetkiTuru': ?instance.sirketDepoYetkiTuru,
  'siparis_MusSip_OzelKod1Degeri': ?instance.siparisMusSipOzelKod1Degeri,
  'siparis_SaticiSiparisi_SatirAciklamaAlanlari':
      ?instance.siparisSaticiSiparisiSatirAciklamaAlanlari,
  'transfer_AG_OtoPdfGor': ?instance.transferAgOtoPdfGor,
  'transfer_AG_Bildirim': ?instance.transferAgBildirim,
  'transfer_AG_EMailGonder': ?instance.transferAgEMailGonder,
  'transfer_AG_EMailGonder_Baslik': ?instance.transferAgEMailGonderBaslik,
  'transfer_AG_EMailGonder_Dizayn': ?instance.transferAgEMailGonderDizayn,
  'transfer_AC_OtoPdfGor': ?instance.transferAcOtoPdfGor,
  'transfer_AC_Bildirim': ?instance.transferAcBildirim,
  'transfer_AC_EMailGonder': ?instance.transferAcEMailGonder,
  'transfer_AC_EMailGonder_Baslik': ?instance.transferAcEMailGonderBaslik,
  'transfer_AC_EMailGonder_Dizayn': ?instance.transferAcEMailGonderDizayn,
  'malKabul_AlisIrs_OtoPdfGor': ?instance.malKabulAlisIrsOtoPdfGor,
  'malKabul_AlisIrs_Bildirim': ?instance.malKabulAlisIrsBildirim,
  'malKabul_AlisIrs_EMailGonder': ?instance.malKabulAlisIrsEMailGonder,
  'malKabul_AlisIrs_EMailGonder_Baslik':
      ?instance.malKabulAlisIrsEMailGonderBaslik,
  'malKabul_AlisIrs_EMailGonder_Dizayn':
      ?instance.malKabulAlisIrsEMailGonderDizayn,
  'malKabul_AlisFat_Bildirim': ?instance.malKabulAlisFatBildirim,
  'malKabul_AlisFat_EMailGonder': ?instance.malKabulAlisFatEMailGonder,
  'malKabul_AlisFat_EMailGonder_Baslik':
      ?instance.malKabulAlisFatEMailGonderBaslik,
  'malKabul_AlisFat_EMailGonder_Dizayn':
      ?instance.malKabulAlisFatEMailGonderDizayn,
  'transfer_DAT_OtoPdfGor': ?instance.transferDatOtoPdfGor,
  'transfer_DAT_Bildirim': ?instance.transferDatBildirim,
  'transfer_DAT_EMailGonder': ?instance.transferDatEMailGonder,
  'transfer_DAT_EMailGonder_Baslik': ?instance.transferDatEMailGonderBaslik,
  'transfer_DAT_EMailGonder_Dizayn': ?instance.transferDatEMailGonderDizayn,
  'sevkiyat_SatisIrs_OtoPdfGor': ?instance.sevkiyatSatisIrsOtoPdfGor,
  'sevkiyat_SatisIrs_Bildirim': ?instance.sevkiyatSatisIrsBildirim,
  'sevkiyat_SatisIrs_EMailGonder': ?instance.sevkiyatSatisIrsEMailGonder,
  'sevkiyat_SatisIrs_EMailGonder_Baslik':
      ?instance.sevkiyatSatisIrsEMailGonderBaslik,
  'sevkiyat_SatisIrs_EMailGonder_Dizayn':
      ?instance.sevkiyatSatisIrsEMailGonderDizayn,
  'sevkiyat_SatisFat_OtoPdfGor': ?instance.sevkiyatSatisFatOtoPdfGor,
  'sevkiyat_SatisFat_OzelKod1Degeri': ?instance.sevkiyatSatisFatOzelKod1Degeri,
  'sevkiyat_SatisFat_OzelKod2Degeri': ?instance.sevkiyatSatisFatOzelKod2Degeri,
  'sevkiyat_SatisFat_Bildirim': ?instance.sevkiyatSatisFatBildirim,
  'sevkiyat_SatisFat_EMailGonder': ?instance.sevkiyatSatisFatEMailGonder,
  'sevkiyat_SatisFat_EMailGonder_Baslik':
      ?instance.sevkiyatSatisFatEMailGonderBaslik,
  'sevkiyat_SatisFat_EMailGonder_Dizayn':
      ?instance.sevkiyatSatisFatEMailGonderDizayn,
  'sayim_EkAlan1': ?instance.sayimEkAlan1,
  'sayim_EkAlan1_Zorunlu': ?instance.sayimEkAlan1Zorunlu,
  'sayim_EkAlan2': ?instance.sayimEkAlan2,
  'sayim_EkAlan2_Zorunlu': ?instance.sayimEkAlan2Zorunlu,
  'sayim_EkAlan3': ?instance.sayimEkAlan3,
  'sayim_EkAlan3_Zorunlu': ?instance.sayimEkAlan3Zorunlu,
  'sayim_EkAlan4': ?instance.sayimEkAlan4,
  'sayim_EkAlan4_Zorunlu': ?instance.sayimEkAlan4Zorunlu,
  'sayim_EkAlan5': ?instance.sayimEkAlan5,
  'sayim_EkAlan5_Zorunlu': ?instance.sayimEkAlan5Zorunlu,
  'siparis_MusSip_EMailGonder': ?instance.siparisMusSipEMailGonder,
  'siparis_MusSip_EMailGonder_Baslik': ?instance.siparisMusSipEMailGonderBaslik,
  'siparis_MusSip_EMailGonder_Dizayn': ?instance.siparisMusSipEMailGonderDizayn,
  'siparis_SaticiSip_OtoPdfGor': ?instance.siparisSaticiSipOtoPdfGor,
  'siparis_SatSip_EMailGonder': ?instance.siparisSatSipEMailGonder,
  'siparis_SatSip_EMailGonder_Baslik': ?instance.siparisSatSipEMailGonderBaslik,
  'siparis_SatSip_EMailGonder_Dizayn': ?instance.siparisSatSipEMailGonderDizayn,
  'taltek_STEK_Bildirim': ?instance.taltekStekBildirim,
  'taltek_STEK_EMailGonder': ?instance.taltekStekEMailGonder,
  'taltek_STEK_EMailGonder_Baslik': ?instance.taltekStekEMailGonderBaslik,
  'taltek_STEK_EMailGonder_Dizayn': ?instance.taltekStekEMailGonderDizayn,
  'taltek_ATAL_Bildirim': ?instance.taltekAtalBildirim,
  'taltek_ATAL_EMailGonder': ?instance.taltekAtalEMailGonder,
  'taltek_ATAL_EMailGonder_Baslik': ?instance.taltekAtalEMailGonderBaslik,
  'taltek_ATAL_EMailGonder_Dizayn': ?instance.taltekAtalEMailGonderDizayn,
  'taltek_STAL_Bildirim': ?instance.taltekStalBildirim,
  'taltek_STAL_EMailGonder': ?instance.taltekStalEMailGonder,
  'taltek_STAL_EMailGonder_Baslik': ?instance.taltekStalEMailGonderBaslik,
  'taltek_STAL_EMailGonder_Dizayn': ?instance.taltekStalEMailGonderDizayn,
  'ebelge_EFat_SatirdaIskDikkateAlma':
      ?instance.ebelgeEFatSatirdaIskDikkateAlma,
  'ebelge_EArsiv_SatirdaIskDikkateAlma':
      ?instance.ebelgeEArsivSatirdaIskDikkateAlma,
  'transfer_AG_OzelKod1Degeri': ?instance.transferAgOzelKod1Degeri,
  'transfer_AG_OzelKod2Degeri': ?instance.transferAgOzelKod2Degeri,
  'transfer_AG_VarsayilanMasrafKodu': ?instance.transferAgVarsayilanMasrafKodu,
  'transfer_AC_VarsayilanMasrafKodu': ?instance.transferAcVarsayilanMasrafKodu,
  'transfer_AC_OzelKod1Degeri': ?instance.transferAcOzelKod1Degeri,
  'transfer_AC_OzelKod2Degeri': ?instance.transferAcOzelKod2Degeri,
  'malKabul_AlisIrs_OzelKod1Degeri': ?instance.malKabulAlisIrsOzelKod1Degeri,
  'malKabul_AlisIrs_OzelKod2Degeri': ?instance.malKabulAlisIrsOzelKod2Degeri,
  'sevkiyat_SatisIrs_OzelKod1Degeri': ?instance.sevkiyatSatisIrsOzelKod1Degeri,
  'sevkiyat_SatisIrs_OzelKod2Degeri': ?instance.sevkiyatSatisIrsOzelKod2Degeri,
  'siparis_MusSip_OzelKod2Degeri': ?instance.siparisMusSipOzelKod2Degeri,
  'taltek_STEK_OzelKod1Degeri': ?instance.taltekStekOzelKod1Degeri,
  'taltek_STEK_OzelKod2Degeri': ?instance.taltekStekOzelKod2Degeri,
  'taltek_STAL_OzelKod1Degeri': ?instance.taltekStalOzelKod1Degeri,
  'taltek_STAL_OzelKod2Degeri': ?instance.taltekStalOzelKod2Degeri,
  'sevkiyat_SatisFat_Aciklamalar_YetkiTuru':
      ?instance.sevkiyatSatisFatAciklamalarYetkiTuru,
  'taltek_STAL_Aciklamalar_YetkiTuru': ?instance.taltekStalAciklamalarYetkiTuru,
  'taltek_STAL_AciklamaAlanlari': ?instance.taltekStalAciklamaAlanlari,
  'uretim_USK_BarkodSayisiSaklanacakAlan':
      ?_$BarkodSayisiSaklanacakAlanEnumMap[instance
          .uretimUskBarkodSayisiSaklanacakAlan],
  'malKabul_AlisIrs_BarkodSayisiSaklanacakAlan':
      ?_$BarkodSayisiSaklanacakAlanEnumMap[instance
          .malKabulAlisIrsBarkodSayisiSaklanacakAlan],
  'malKabul_AlisFat_BarkodSayisiSaklanacakAlan':
      ?_$BarkodSayisiSaklanacakAlanEnumMap[instance
          .malKabulAlisFatBarkodSayisiSaklanacakAlan],
  'transfer_DAT_BarkodSayisiSaklanacakAlan':
      ?_$BarkodSayisiSaklanacakAlanEnumMap[instance
          .transferDatBarkodSayisiSaklanacakAlan],
  'sevkiyat_SatisIrs_BarkodSayisiSaklanacakAlan':
      ?_$BarkodSayisiSaklanacakAlanEnumMap[instance
          .sevkiyatSatisIrsBarkodSayisiSaklanacakAlan],
  'sevkiyat_SatisFat_SipBag_SipOkutulsun_KalanMiktarGelsin':
      ?instance.sevkiyatSatisFatSipBagSipOkutulsunKalanMiktarGelsin,
  'transfer_AC_VarsayilanHarTuru': ?instance.transferAcVarsayilanHarTuru,
  'transfer_AC_VarsayilanCikisYeri': ?instance.transferAcVarsayilanCikisYeri,
  'transfer_DepoTalebi_RehberdenStokSecilmesin':
      ?instance.transferDepoTalebiRehberdenStokSecilmesin,
  'stok_CariHar_GizlenecekAlanlar': ?instance.stokCariHarGizlenecekAlanlar,
  'transfer_DAT_OzelKod1Degeri': ?instance.transferDatOzelKod1Degeri,
  'transfer_DAT_OzelKod2Degeri': ?instance.transferDatOzelKod2Degeri,
  'transfer_DepoTalebi_BildirimKullanicilar':
      ?instance.transferDepoTalebiBildirimKullanicilar,
  'URETIM_ISEMRI_FIRE_DUSME_YONTEMI': ?instance.uretimIsemriFireDusmeYontemi,
  'YAZDIRMA_ALIS_FAT_YAZICILARI': ?instance.yazdirmaAlisFatYazicilari,
  'YAZDIRMA_AMBAR_CIKIS_YAZICILARI': ?instance.yazdirmaAmbarCikisYazicilari,
  'YAZDIRMA_DIZAYN_AMBAR_CIKIS': ?instance.yazdirmaDizaynAmbarCikis,
  'YAZDIRMA_AMBAR_GIRIS_YAZICILARI': ?instance.yazdirmaAmbarGirisYazicilari,
  'YAZDIRMA_DIZAYN_DAT': ?instance.yazdirmaDizaynDat,
  'malKabul_AlisIrs_BildirimKullanicilar':
      ?instance.malKabulAlisIrsBildirimKullanicilar,
  'transfer_AG_Filtre': ?instance.transferAgFiltre,
  'transfer_AG_FiltreSQL': ?instance.transferAgFiltreSql,
  'sevkiyat_SatisFat_EMailGonder_Kullanicilar':
      ?instance.sevkiyatSatisFatEMailGonderKullanicilar,
  'sevkemri_MalToplama_BarkodKosullu':
      ?instance.sevkemriMalToplamaBarkodKosullu,
  'siparis_MusSip_BildirimKullanicilar':
      ?instance.siparisMusSipBildirimKullanicilar,
  'siparis_MusSip_EMailGonder_Kullanicilar':
      ?instance.siparisMusSipEMailGonderKullanicilar,
  'stok_Filtre': ?instance.stokFiltre,
  'stok_FiltreSQL': ?instance.stokFiltreSql,
  'cari_DovizliCarilerdeTLBakiyeGosterme':
      ?instance.cariDovizliCarilerdeTlBakiyeGosterme,
  'taltek_STEK_SatirAciklamaAlanlari':
      ?instance.taltekStekSatirAciklamaAlanlari,
  'taltek_STAL_SatirAciklamaAlanlari':
      ?instance.taltekStalSatirAciklamaAlanlari,
  'taltek_ATAL_SatirAciklamaAlanlari':
      ?instance.taltekAtalSatirAciklamaAlanlari,
};

const _$BarkodSayisiSaklanacakAlanEnumMap = {
  BarkodSayisiSaklanacakAlan.k1: 'K1',
  BarkodSayisiSaklanacakAlan.k2: 'K2',
  BarkodSayisiSaklanacakAlan.k3: 'K3',
  BarkodSayisiSaklanacakAlan.k4: 'K4',
  BarkodSayisiSaklanacakAlan.k5: 'K5',
  BarkodSayisiSaklanacakAlan.k6: 'K6',
  BarkodSayisiSaklanacakAlan.k7: 'K7',
  BarkodSayisiSaklanacakAlan.k8: 'K8',
  BarkodSayisiSaklanacakAlan.k9: 'K9',
  BarkodSayisiSaklanacakAlan.k10: 'K10',
  BarkodSayisiSaklanacakAlan.miktar2: 'M2',
  BarkodSayisiSaklanacakAlan.e1: 'E1',
  BarkodSayisiSaklanacakAlan.e2: 'E2',
  BarkodSayisiSaklanacakAlan.bos: null,
};

SevkemriMalKontrolTipi _$SevkemriMalKontrolTipiFromJson(
  Map<String, dynamic> json,
) => SevkemriMalKontrolTipi()
  ..kod = (json['Kod'] as num?)?.toInt()
  ..tanim = json['Tanim'] as String?;

Map<String, dynamic> _$SevkemriMalKontrolTipiToJson(
  SevkemriMalKontrolTipi instance,
) => <String, dynamic>{'Kod': ?instance.kod, 'Tanim': ?instance.tanim};
