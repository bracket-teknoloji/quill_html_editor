// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profil_yetki_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProfilYetkiModel _$ProfilYetkiModelFromJson(Map<String, dynamic> json) =>
    ProfilYetkiModel()
      ..yazdirmaSatisIrsYazicilari =
          (json['yazdirma_SatisIrs_Yazicilari'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList()
      ..yazdirmaDizaynSatisIrs =
          (json['yazdirma_Dizayn_SatisIrs'] as List<dynamic>?)
              ?.map((e) => e as int)
              .toList()
      ..yazdirmaSatisTalebi = json['yazdirma_SatisTalebi'] as bool?
      ..yazdirmaSatisTalebiYazicilari =
          (json['yazdirma_SatisTalebi_Yazicilari'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList()
      ..yazdirmaDizaynSatisTalebi =
          (json['yazdirma_Dizayn_SatisTalebi'] as List<dynamic>?)
              ?.map((e) => e as int)
              .toList()
      ..yazdirmaSatisTeklifi = json['yazdirma_SatisTeklifi'] as bool?
      ..yazdirmaDizaynSatisTeklifi =
          (json['yazdirma_Dizayn_SatisTeklifi'] as List<dynamic>?)
              ?.map((e) => e as int)
              .toList()
      ..yazdirmaSayim = json['yazdirma_Sayim'] as bool?
      ..yazdirmaSayimYazicilari =
          (json['yazdirma_Sayim_Yazicilari'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList()
      ..yazdirmaDizaynSayim = (json['yazdirma_Dizayn_Sayim'] as List<dynamic>?)
          ?.map((e) => e as int)
          .toList()
      ..yazdirmaSevkiyatEtiketi = json['yazdirma_Sevkiyat_Etiketi'] as bool?
      ..yazdirmaSevkiyatEtiketiYazicilari =
          (json['yazdirma_Sevkiyat_Etiketi_Yazicilari'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList()
      ..yazdirmaDizaynSevkiyatEtiketi =
          (json['yazdirma_Dizayn_SevkiyatEtiketi'] as List<dynamic>?)
              ?.map((e) => e as int)
              .toList()
      ..yazdirmaSevkiyatEtiketiKopyaSayisiGizle =
          json['yazdirma_Sevkiyat_Etiketi_KopyaSayisiGizle'] as bool?
      ..yazdirmaSerbest = json['yazdirma_Serbest'] as bool?
      ..yazdirmaSerbestYazicilari =
          json['yazdirma_Serbest_Yazicilari'] as List<dynamic>?
      ..yazdirmaDizaynSerbest =
          (json['yazdirma_Dizayn_Serbest'] as List<dynamic>?)
              ?.map((e) => e as int)
              .toList()
      ..yazdirmaSeriEtiketi = json['yazdirma_SeriEtiketi'] as bool?
      ..yazdirmaSeriEtiketiYazicilari =
          (json['yazdirma_Seri_Etiketi_Yazicilari'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList()
      ..yazdirmaDizaynSeriEtiketi =
          (json['yazdirma_Dizayn_SeriEtiketi'] as List<dynamic>?)
              ?.map((e) => e as int)
              .toList()
      ..yazdirmaStokEtiketi = json['yazdirma_Stok_Etiketi'] as bool?
      ..yazdirmaStokEtiketiYazicilari =
          (json['yazdirma_Stok_Etiketi_Yazicilari'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList()
      ..yazdirmaDizaynStokEtiketi =
          (json['yazdirma_Dizayn_StokEtiketi'] as List<dynamic>?)
              ?.map((e) => e as int)
              .toList()
      ..yazdirmaTahsilatMakbuzu = json['yazdirma_TahsilatMakbuzu'] as bool?
      ..yazdirmaDizaynTahsilatMakbuzu =
          (json['yazdirma_Dizayn_TahsilatMakbuzu'] as List<dynamic>?)
              ?.map((e) => e as int)
              .toList()
      ..yazdirmaUSK = json['yazdirma_USK'] as bool?
      ..yazdirmaUSKYazicilari =
          (json['yazdirma_USK_Yazicilari'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList()
      ..yazdirmaDizaynUSK = (json['yazdirma_Dizayn_USK'] as List<dynamic>?)
          ?.map((e) => e as int)
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
      ..sirketRehberdeCariKodGizle =
          json['sirket_RehberdeCariKodGizle'] as bool?
      ..sirketRehberdeStokKodGizle =
          json['sirket_RehberdeStokKodGizle'] as bool?
      ..sirketRaporlardaFiyatGizle =
          json['sirket_RaporlardaFiyatGizle'] as bool?
      ..sirketTarihDegismesin = json['sirket_TarihDegismesin'] as bool?
      ..sirketDevirSirketineGiris =
          json['sirket_DevirSirketineGiris'] as String?
      ..sirketKontrolluAktarBelgeTipleri =
          (json['sirket_KontrolluAktar_BelgeTipleri'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList()
      ..sirketKontrolluAktarBelgeNoGoster =
          json['sirket_KontrolluAktar_BelgeNoGoster'] as List<dynamic>?
      ..sirketKontrolAciklamasiBelgeTipleri =
          json['sirket_KontrolAciklamasi_BelgeTipleri'] as List<dynamic>?
      ..sirketTLFiyatGelsinBelgeTipleri =
          json['sirket_TLFiyatGelsin_BelgeTipleri'] as List<dynamic>?
      ..sirketKalemKayitKontrolBelgeTipleri =
          json['sirket_KalemKayitKontrol_BelgeTipleri'] as List<dynamic>?
      ..sirketAktifDepolar = (json['sirket_aktifDepolar'] as List<dynamic>?)
          ?.map((e) => e as int)
          .toList()
      ..sirketSatisDepo = json['sirket_satisDepo'] as int?
      ..sirketSatisDepoOzellestir = json['sirket_satisDepo_Ozellestir'] as bool?
      ..sirketSatisDepoMusSip = json['sirket_satisDepo_MusSip'] as int?
      ..sirketSatisDepoSatisFat = json['sirket_satisDepo_SatisFat'] as int?
      ..sirketSatisDepoSatisIrs = json['sirket_satisDepo_SatisIrs'] as int?
      ..sirketAlisDepo = json['sirket_alisDepo'] as int?
      ..sirketIadeDepo = json['sirket_iadeDepo'] as int?
      ..sirketProjeKodu = json['sirket_projeKodu'] as String?
      ..sirketAktifProjeler = (json['sirket_aktifProjeler'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList()
      ..ayarlarFirmaAyarlari = json['ayarlar_FirmaAyarlari'] as bool?
      ..ayarlarOturumlar = json['ayarlar_Oturumlar'] as bool?
      ..sirketSifreHatirlamaDurumu =
          json['sirket_SifreHatirlamaDurumu'] as String?
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
              ?.map((e) => e as int)
              .toList()
      ..malKabulAlisIrsGizlenecekAlanlar =
          json['malKabul_AlisIrs_GizlenecekAlanlar'] as List<dynamic>?
      ..malKabulAlisIrsAciklamaAlanlari =
          (json['malKabul_AlisIrs_AciklamaAlanlari'] as List<dynamic>?)
              ?.map((e) => e as int)
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
          json['malKabul_AlisIrs_SipBag_EslesmeDurumu'] as int?
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
      ..malKabulAlisIrsKalemRaporu =
          json['malKabul_AlisIrs_KalemRaporu'] as bool?
      ..malKabulAlisIrsOtoBasimYap =
          json['malKabul_AlisIrs_OtoBasimYap'] as bool?
      ..malKabulAlisIrsKacGunlukKayitlarListelensin =
          json['malKabul_AlisIrs_KacGunlukKayitlarListelensin'] as int?
      ..malKabulAlisIrsFiyatSirasi =
          json['malKabul_AlisIrs_FiyatSirasi'] as int?
      ..malKabulAlisIrsBirim1denKaydet =
          json['malKabul_AlisIrs_Birim1denKaydet'] as bool?
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
              ?.map((e) => e as int)
              .toList()
      ..malKabulAlisFaturasi = json['malKabul_AlisFaturasi'] as bool?
      ..malKabulAlisFaturasiKaydet =
          json['malKabul_AlisFaturasi_Kaydet'] as bool?
      ..malKabulAlisFaturasiDuzelt =
          json['malKabul_AlisFaturasi_Duzelt'] as bool?
      ..malKabulAlisFaturasiSil = json['malKabul_AlisFaturasi_Sil'] as bool?
      ..malKabulAlisFatDigerSekmesiGoster =
          json['malKabul_AlisFat_DigerSekmesiGoster'] as bool?
      ..malKabulAlisFatKacGunlukKayitlarListelensin =
          json['malKabul_AlisFat_KacGunlukKayitlarListelensin'] as int?
      ..malKabulAlisFatFiyatSirasi =
          json['malKabul_AlisFat_FiyatSirasi'] as int?
      ..malKabulAlisFatBirim1denKaydet =
          json['malKabul_AlisFat_Birim1denKaydet'] as bool?
      ..malKabulAlisFatAciklamalarYetkiTuru =
          json['malKabul_AlisFat_Aciklamalar_YetkiTuru'] as String?
      ..malKabulAlisFatAciklamaAlanlari =
          (json['malKabul_AlisFat_AciklamaAlanlari'] as List<dynamic>?)
              ?.map((e) => e as int)
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
          json['malKabul_AlisFat_SipBag_EslesmeDurumu'] as int?
      ..malKabulAlisFatRaporlar = json['malKabul_AlisFat_Raporlar'] as bool?
      ..malKabulAlisFatKalemRaporu =
          json['malKabul_AlisFat_KalemRaporu'] as bool?
      ..malKabulMustahsil = json['malKabul_Mustahsil'] as bool?
      ..malKabulMustahsilEkle = json['malKabul_Mustahsil_Ekle'] as bool?
      ..malKabulMustahsilDuzelt = json['malKabul_Mustahsil_Duzelt'] as bool?
      ..malKabulMustahsilSil = json['malKabul_Mustahsil_Sil'] as bool?
      ..transferDAT = json['transfer_DAT'] as bool?
      ..transferDATKaydet = json['transfer_DAT_Kaydet'] as bool?
      ..transferDATDuzelt = json['transfer_DAT_Duzelt'] as bool?
      ..transferDATSil = json['transfer_DAT_Sil'] as bool?
      ..transferDATFiyatGor = json['transfer_DAT_FiyatGor'] as bool?
      ..transferDATOtoEtiketBas = json['transfer_DAT_OtoEtiketBas'] as bool?
      ..transferDATVarsayilanCikisDepo =
          json['transfer_DAT_VarsayilanCikisDepo'] as int?
      ..transferDATVarsayilanGirisDepo =
          json['transfer_DAT_VarsayilanGirisDepo'] as int?
      ..transferDATEIrsIsaretleyemesin =
          json['transfer_DAT_eIrsIsaretleyemesin'] as bool?
      ..transferDATDigerSekmesiGoster =
          json['transfer_DAT_DigerSekmesiGoster'] as bool?
      ..transferDATBarkodluGiris = json['transfer_DAT_BarkodluGiris'] as bool?
      ..transferDATMiktarOtomatikGelsin =
          json['transfer_DAT_MiktarOtomatikGelsin'] as bool?
      ..transferDATKalemDetaySorulmasin =
          json['transfer_DAT_KalemDetaySorulmasin'] as bool?
      ..transferDATStokRehberiAcilmasin =
          json['transfer_DAT_StokRehberiAcilmasin'] as bool?
      ..transferDATKalemDuzeltilemesin =
          json['transfer_DAT_KalemDuzeltilemesin'] as bool?
      ..transferDATKlavyeEngelle = json['transfer_DAT_KlavyeEngelle'] as bool?
      ..transferDATMiktar1Gelsin = json['transfer_DAT_Miktar1Gelsin'] as bool?
      ..transferDATKalemlerBirlestirilsin =
          json['transfer_DAT_KalemlerBirlestirilsin'] as bool?
      ..transferDATKacGunlukKayitlarListelensin =
          json['transfer_DAT_KacGunlukKayitlarListelensin'] as int?
      ..transferDATOnayIslemleri = json['transfer_DAT_OnayIslemleri'] as bool?
      ..transferDATOnayIslemleriDepolar =
          json['transfer_DAT_OnayIslemleri_Depolar'] as List<dynamic>?
      ..transferDATEkAlan2Hatirla = json['transfer_DAT_EkAlan2Hatirla'] as bool?
      ..transferDATEkAlan2Tablodan =
          json['transfer_DAT_EkAlan2Tablodan'] as bool?
      ..transferDATLokalDATSeciliGelmesin =
          json['transfer_DAT_LokalDATSeciliGelmesin'] as bool?
      ..transferDATSeriGirisHarYapabilsin =
          json['transfer_DAT_SeriGirisHarYapabilsin'] as bool?
      ..transferDATBirim1denKaydet =
          json['transfer_DAT_Birim1denKaydet'] as bool?
      ..transferDATBarkod2Sor = json['transfer_DAT_Barkod2Sor'] as bool?
      ..transferDATBosGecilmeyecekAlanlar =
          json['transfer_DAT_BosGecilmeyecekAlanlar'] as List<dynamic>?
      ..transferDATGizlenecekAlanlar =
          json['transfer_DAT_GizlenecekAlanlar'] as List<dynamic>?
      ..transferDATDegismeyecekAlanlar =
          json['transfer_DAT_DegismeyecekAlanlar'] as List<dynamic>?
      ..transferDATAciklamaAlanlari =
          json['transfer_DAT_AciklamaAlanlari'] as List<dynamic>?
      ..transferDATSipBagSecenegi =
          json['transfer_DAT_SipBagSecenegi'] as String?
      ..transferDATReferansStokUygulamasi =
          json['transfer_DAT_ReferansStokUygulamasi'] as bool?
      ..transferDATSipBagSipHariciKalemEklenebilir =
          json['transfer_DAT_SipBag_SipHariciKalemEklenebilir'] as bool?
      ..transferDATSipBagFazlaTeslimatYapilabilir =
          json['transfer_DAT_SipBag_FazlaTeslimatYapilabilir'] as bool?
      ..transferDATSipBagSipOkutulsun =
          json['transfer_DAT_SipBag_SipOkutulsun'] as bool?
      ..transferDATSipBagSipOkutulsunMiktar2BazAl =
          json['transfer_DAT_SipBag_SipOkutulsun_Miktar2BazAl'] as bool?
      ..transferDATSipBagSipOkutulsunKalanMiktarGelsin =
          json['transfer_DAT_SipBag_SipOkutulsun_KalanMiktarGelsin'] as String?
      ..transferDATSipBagCokluSecim =
          json['transfer_DAT_SipBag_CokluSecim'] as bool?
      ..transferDATSipBagTumKalemlerSecilsin =
          json['transfer_DAT_SipBag_TumKalemlerSecilsin'] as bool?
      ..transferDATSipBagEslesmeDurumu =
          json['transfer_DAT_SipBag_EslesmeDurumu'] as int?
      ..transferDATSipBagMalToplananlarGelsin =
          json['transfer_DAT_SipBag_MalToplananlarGelsin'] as bool?
      ..transferDATSipBagSevkOnayliSiparislerGelsin =
          json['transfer_DAT_SipBag_SevkOnayliSiparislerGelsin'] as bool?
      ..transferAG = json['transfer_AG'] as bool?
      ..transferAGKaydet = json['transfer_AG_Kaydet'] as bool?
      ..transferAGDuzelt = json['transfer_AG_Duzelt'] as bool?
      ..transferAGSil = json['transfer_AG_Sil'] as bool?
      ..transferAGFiyatGor = json['transfer_AG_FiyatGor'] as bool?
      ..transferAGKacGunlukKayitlarListelensin =
          json['transfer_AG_KacGunlukKayitlarListelensin'] as int?
      ..transferAGVarsayilanDepo = json['transfer_AG_VarsayilanDepo'] as int?
      ..transferAGDigerSekmesiGoster =
          json['transfer_AG_DigerSekmesiGoster'] as bool?
      ..transferAGBelgeKopyala = json['transfer_AG_BelgeKopyala'] as bool?
      ..transferAGBirim1denKaydet = json['transfer_AG_Birim1denKaydet'] as bool?
      ..transferAGOtoBasimYap = json['transfer_AG_OtoBasimYap'] as bool?
      ..transferAGSeriGirisHarYapabilsin =
          json['transfer_AG_SeriGirisHarYapabilsin'] as bool?
      ..transferAGBarkodluGiris = json['transfer_AG_BarkodluGiris'] as bool?
      ..transferAGMiktarOtomatikGelsin =
          json['transfer_AG_MiktarOtomatikGelsin'] as bool?
      ..transferAGKalemDetaySorulmasin =
          json['transfer_AG_KalemDetaySorulmasin'] as bool?
      ..transferAGStokRehberiAcilmasin =
          json['transfer_AG_StokRehberiAcilmasin'] as bool?
      ..transferAGKalemDuzeltilemesin =
          json['transfer_AG_KalemDuzeltilemesin'] as bool?
      ..transferAGKlavyeEngelle = json['transfer_AG_KlavyeEngelle'] as bool?
      ..transferAGMiktar1Gelsin = json['transfer_AG_Miktar1Gelsin'] as bool?
      ..transferAGReferansStokUygulamasi =
          json['transfer_AG_ReferansStokUygulamasi'] as bool?
      ..transferAGSipBagSipHariciKalemEklenebilir =
          json['transfer_AG_SipBag_SipHariciKalemEklenebilir'] as bool?
      ..transferAGSipBagFazlaTeslimatYapilabilir =
          json['transfer_AG_SipBag_FazlaTeslimatYapilabilir'] as bool?
      ..transferAGSipBagSipOkutulsun =
          json['transfer_AG_SipBag_SipOkutulsun'] as bool?
      ..transferAGSipBagSipOkutulsunMiktar2BazAl =
          json['transfer_AG_SipBag_SipOkutulsun_Miktar2BazAl'] as bool?
      ..transferAGSipBagCokluSecim =
          json['transfer_AG_SipBag_CokluSecim'] as bool?
      ..transferAGSipBagTumKalemlerSecilsin =
          json['transfer_AG_SipBag_TumKalemlerSecilsin'] as bool?
      ..transferAGSipBagEslesmeDurumu =
          json['transfer_AG_SipBag_EslesmeDurumu'] as int?
      ..transferAGSipBagMalToplananlarGelsin =
          json['transfer_AG_SipBag_MalToplananlarGelsin'] as bool?
      ..transferAGSipBagSevkOnayliSiparislerGelsin =
          json['transfer_AG_SipBag_SevkOnayliSiparislerGelsin'] as bool?
      ..transferAC = json['transfer_AC'] as bool?
      ..transferACKaydet = json['transfer_AC_Kaydet'] as bool?
      ..transferACDuzelt = json['transfer_AC_Duzelt'] as bool?
      ..transferACSil = json['transfer_AC_Sil'] as bool?
      ..transferACFiyatGor = json['transfer_AC_FiyatGor'] as bool?
      ..transferACKacGunlukKayitlarListelensin =
          json['transfer_AC_KacGunlukKayitlarListelensin'] as int?
      ..transferACVarsayilanDepo = json['transfer_AC_VarsayilanDepo'] as int?
      ..transferACEIrsIsaretleyemesin =
          json['transfer_AC_eIrsIsaretleyemesin'] as bool?
      ..transferACDigerSekmesiGoster =
          json['transfer_AC_DigerSekmesiGoster'] as bool?
      ..transferACBelgeKopyala = json['transfer_AC_BelgeKopyala'] as bool?
      ..transferACBirim1denKaydet = json['transfer_AC_Birim1denKaydet'] as bool?
      ..transferACOtoBasimYap = json['transfer_AC_OtoBasimYap'] as bool?
      ..transferACSeriGirisHarYapabilsin =
          json['transfer_AC_SeriGirisHarYapabilsin'] as bool?
      ..transferACEkAlan2Tablodan = json['transfer_AC_EkAlan2Tablodan'] as bool?
      ..transferACEkAlan2Hatirla = json['transfer_AC_EkAlan2Hatirla'] as bool?
      ..transferACMinStokMikGoster =
          json['transfer_AC_MinStokMikGoster'] as String?
      ..transferACBosGecilmeyecekAlanlar =
          json['transfer_AC_BosGecilmeyecekAlanlar'] as List<dynamic>?
      ..transferACBarkodluGiris = json['transfer_AC_BarkodluGiris'] as bool?
      ..transferACMiktarOtomatikGelsin =
          json['transfer_AC_MiktarOtomatikGelsin'] as bool?
      ..transferACKalemDetaySorulmasin =
          json['transfer_AC_KalemDetaySorulmasin'] as bool?
      ..transferACStokRehberiAcilmasin =
          json['transfer_AC_StokRehberiAcilmasin'] as bool?
      ..transferACKalemDuzeltilemesin =
          json['transfer_AC_KalemDuzeltilemesin'] as bool?
      ..transferACKlavyeEngelle = json['transfer_AC_KlavyeEngelle'] as bool?
      ..transferACMiktar1Gelsin = json['transfer_AC_Miktar1Gelsin'] as bool?
      ..transferACReferansStokUygulamasi =
          json['transfer_AC_ReferansStokUygulamasi'] as bool?
      ..transferACSipBagSipHariciKalemEklenebilir =
          json['transfer_AC_SipBag_SipHariciKalemEklenebilir'] as bool?
      ..transferACSipBagFazlaTeslimatYapilabilir =
          json['transfer_AC_SipBag_FazlaTeslimatYapilabilir'] as bool?
      ..transferACSipBagSipOkutulsun =
          json['transfer_AC_SipBag_SipOkutulsun'] as bool?
      ..transferACSipBagSipOkutulsunMiktar2BazAl =
          json['transfer_AC_SipBag_SipOkutulsun_Miktar2BazAl'] as bool?
      ..transferACSipBagCokluSecim =
          json['transfer_AC_SipBag_CokluSecim'] as bool?
      ..transferACSipBagTumKalemlerSecilsin =
          json['transfer_AC_SipBag_TumKalemlerSecilsin'] as bool?
      ..transferACSipBagEslesmeDurumu =
          json['transfer_AC_SipBag_EslesmeDurumu'] as int?
      ..transferACSipBagMalToplananlarGelsin =
          json['transfer_AC_SipBag_MalToplananlarGelsin'] as bool?
      ..transferACSipBagSevkOnayliSiparislerGelsin =
          json['transfer_AC_SipBag_SevkOnayliSiparislerGelsin'] as bool?
      ..transferDepoTalebi = json['transfer_DepoTalebi'] as bool?
      ..transferDepoTalebiSil = json['transfer_DepoTalebi_Sil'] as bool?
      ..transferDepoTalebiMalTop = json['transfer_DepoTalebi_MalTop'] as bool?
      ..transferDepoTalebiMalTopFazlaTeslimat =
          json['transfer_DepoTalebi_MalTop_FazlaTeslimat'] as String?
      ..hucreGiristeHucreYerlestir =
          json['hucre_GiristeHucreYerlestir'] as bool?
      ..hucreCikistaHucreYerlestir =
          json['hucre_CikistaHucreYerlestir'] as bool?
      ..hucreYerlestir = json['hucre_Yerlestir'] as bool?
      ..hucreYerlestirBelgesiz = json['hucre_YerlestirBelgesiz'] as bool?
      ..hucreYerlestirKlavyeEngelle =
          json['hucre_Yerlestir_KlavyeEngelle'] as bool?
      ..hucreYerlestirRehberdenStokSecilmesin =
          json['hucre_Yerlestir_RehberdenStokSecilmesin'] as bool?
      ..hucreYerlestirHangiHucrede =
          json['hucre_Yerlestir_HangiHucrede'] as bool?
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
      ..hucreTransferKlavyeEngelle =
          json['hucre_Transfer_KlavyeEngelle'] as bool?
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
          json['sevkiyat_SatisIrsaliyesi_BelgeTipleri'] as List<dynamic>?
      ..sevkiyatSatisIrsaliyesiGizlenecekAlanlar =
          json['sevkiyat_SatisIrsaliyesi_GizlenecekAlanlar'] as List<dynamic>?
      ..sevkiyatSatisIrsaliyesiDegismeyecekAlanlar =
          json['sevkiyat_SatisIrsaliyesi_DegismeyecekAlanlar'] as List<dynamic>?
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
          json['sevkiyat_SatisIrs_SipBag_SipOkutulsun_KalanMiktarGelsin']
              as String?
      ..sevkiyatSatisIrsSipBagCokluSecim =
          json['sevkiyat_SatisIrs_SipBag_CokluSecim'] as bool?
      ..sevkiyatSatisIrsSipBagTumKalemlerSecilsin =
          json['sevkiyat_SatisIrs_SipBag_TumKalemlerSecilsin'] as bool?
      ..sevkiyatSatisIrsSipBagEslesmeDurumu =
          json['sevkiyat_SatisIrs_SipBag_EslesmeDurumu'] as int?
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
      ..sevkiyatSatisIrsOtoBasimYap =
          json['sevkiyat_SatisIrs_OtoBasimYap'] as bool?
      ..sevkiyatSatisIrsKacGunlukKayitlarListelensin =
          json['sevkiyat_SatisIrs_KacGunlukKayitlarListelensin'] as int?
      ..sevkiyatSatisIrsFiyatSirasi =
          json['sevkiyat_SatisIrs_FiyatSirasi'] as int?
      ..sevkiyatSatisIrsKDVSifirGelsin =
          json['sevkiyat_SatisIrs_KDVSifirGelsin'] as bool?
      ..sevkiyatSatisIrsSeriGirisHarYapabilsin =
          json['sevkiyat_SatisIrs_SeriGirisHarYapabilsin'] as bool?
      ..sevkiyatSatisIrsBirim1denKaydet =
          json['sevkiyat_SatisIrs_Birim1denKaydet'] as bool?
      ..sevkiyatSatisIrsEkAlan2Tablodan =
          json['sevkiyat_SatisIrs_EkAlan2Tablodan'] as bool?
      ..sevkiyatSatisIrsEkAlan2Hatirla =
          json['sevkiyat_SatisIrs_EkAlan2Hatirla'] as bool?
      ..sevkiyatSatisIrsOlcuBirimi =
          json['sevkiyat_SatisIrs_OlcuBirimi'] as int?
      ..sevkiyatSatisIrsCariKoduDegistir =
          json['sevkiyat_SatisIrs_CariKoduDegistir'] as bool?
      ..sevkiyatSatisIrsMaxIskUygulamasi =
          json['sevkiyat_SatisIrs_MaxIskUygulamasi'] as bool?
      ..sevkiyatSatisIrsMaxSatIsk1 =
          (json['sevkiyat_SatisIrs_MaxSatIsk1'] as num?)?.toDouble()
      ..sevkiyatSatisIrsMaxSatIsk2 =
          (json['sevkiyat_SatisIrs_MaxSatIsk2'] as num?)?.toDouble()
      ..sevkiyatSatisIrsMaxSatIsk3 =
          (json['sevkiyat_SatisIrs_MaxSatIsk3'] as num?)?.toDouble()
      ..sevkiyatSatisIrsMaxSatIsk4 =
          (json['sevkiyat_SatisIrs_MaxSatIsk4'] as num?)?.toDouble()
      ..sevkiyatSatisIrsMaxSatIsk5 =
          (json['sevkiyat_SatisIrs_MaxSatIsk5'] as num?)?.toDouble()
      ..sevkiyatSatisIrsMaxSatIsk6 =
          (json['sevkiyat_SatisIrs_MaxSatIsk6'] as num?)?.toDouble()
      ..sevkiyatSatisIrsMaxGenIsk1 =
          (json['sevkiyat_SatisIrs_MaxGenIsk1'] as num?)?.toDouble()
      ..sevkiyatSatisIrsMaxGenIsk2 =
          (json['sevkiyat_SatisIrs_MaxGenIsk2'] as num?)?.toDouble()
      ..sevkiyatSatisIrsMaxGenIsk3 =
          (json['sevkiyat_SatisIrs_MaxGenIsk3'] as num?)?.toDouble()
      ..sevkiyatSatisIrsDipFiyatUygulamasi =
          json['sevkiyat_SatisIrs_DipFiyatUygulamasi'] as bool?
      ..sevkiyatSatisIrsDipFiyatSaha =
          json['sevkiyat_SatisIrs_DipFiyatSaha'] as String?
      ..sevkiyatSatisIrsDipFiyatEylem =
          json['sevkiyat_SatisIrs_DipFiyatEylem'] as String?
      ..sevkiyatSatisIrsDipFiyatKDVDurumu =
          json['sevkiyat_SatisIrs_DipFiyatKDVDurumu'] as String?
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
      ..sevkiyatSatisIrsKalemRaporu =
          json['sevkiyat_SatisIrs_KalemRaporu'] as bool?
      ..sevkiyatSatisFatBelgeTipleri =
          json['sevkiyat_SatisFat_BelgeTipleri'] as List<dynamic>?
      ..sevkiyatSatisFatVarsayilanBelgeTipi =
          json['sevkiyat_SatisFat_VarsayilanBelgeTipi'] as int?
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
          json['sevkiyat_SatisFat_KacGunlukKayitlarListelensin'] as int?
      ..sevkiyatSatisFatFiyatSirasi =
          json['sevkiyat_SatisFat_FiyatSirasi'] as int?
      ..sevkiyatSatisFatKalemlerBirlestirilsin =
          json['sevkiyat_SatisFat_KalemlerBirlestirilsin'] as bool?
      ..sevkiyatSatisFatBirim1denKaydet =
          json['sevkiyat_SatisFat_Birim1denKaydet'] as bool?
      ..sevkiyatSatisFatEkAlan2Tablodan =
          json['sevkiyat_SatisFat_EkAlan2Tablodan'] as bool?
      ..sevkiyatSatisFatEkAlan2Hatirla =
          json['sevkiyat_SatisFat_EkAlan2Hatirla'] as bool?
      ..sevkiyatSatisFatFiltre = json['sevkiyat_SatisFat_Filtre'] as String?
      ..sevkiyatSatisFatFiltreSQL =
          json['sevkiyat_SatisFat_FiltreSQL'] as String?
      ..sevkiyatSatisFatOlcuBirimi =
          json['sevkiyat_SatisFat_OlcuBirimi'] as int?
      ..sevkiyatSatisFatAciklamaAlanlari =
          (json['sevkiyat_SatisFat_AciklamaAlanlari'] as List<dynamic>?)
              ?.map((e) => e as int)
              .toList()
      ..sevkiyatSatisFatBosGecilmeyecekAlanlar =
          json['sevkiyat_SatisFat_BosGecilmeyecekAlanlar'] as List<dynamic>?
      ..sevkiyatSatisFatGizlenecekAlanlar =
          json['sevkiyat_SatisFat_GizlenecekAlanlar'] as List<dynamic>?
      ..sevkiyatSatisFatDegismeyecekAlanlar =
          json['sevkiyat_SatisFat_DegismeyecekAlanlar'] as List<dynamic>?
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
          json['sevkiyat_SatisFat_SipBag_EslesmeDurumu'] as int?
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
      ..sevkiyatSatisFatKalemRaporu =
          json['sevkiyat_SatisFat_KalemRaporu'] as bool?
      ..sevkiyatSatisFatKarlilikRaporu =
          json['sevkiyat_SatisFat_KarlilikRaporu'] as bool?
      ..sevkiyatSatisFatMaxIskUygulamasi =
          json['sevkiyat_SatisFat_MaxIskUygulamasi'] as bool?
      ..sevkiyatSatisFatMaxSatIsk1 =
          (json['sevkiyat_SatisFat_MaxSatIsk1'] as num?)?.toDouble()
      ..sevkiyatSatisFatMaxSatIsk2 =
          (json['sevkiyat_SatisFat_MaxSatIsk2'] as num?)?.toDouble()
      ..sevkiyatSatisFatMaxSatIsk3 =
          (json['sevkiyat_SatisFat_MaxSatIsk3'] as num?)?.toDouble()
      ..sevkiyatSatisFatMaxSatIsk4 =
          (json['sevkiyat_SatisFat_MaxSatIsk4'] as num?)?.toDouble()
      ..sevkiyatSatisFatMaxSatIsk5 =
          (json['sevkiyat_SatisFat_MaxSatIsk5'] as num?)?.toDouble()
      ..sevkiyatSatisFatMaxSatIsk6 =
          (json['sevkiyat_SatisFat_MaxSatIsk6'] as num?)?.toDouble()
      ..sevkiyatSatisFatMaxGenIsk1 =
          (json['sevkiyat_SatisFat_MaxGenIsk1'] as num?)?.toDouble()
      ..sevkiyatSatisFatMaxGenIsk2 =
          (json['sevkiyat_SatisFat_MaxGenIsk2'] as num?)?.toDouble()
      ..sevkiyatSatisFatMaxGenIsk3 =
          (json['sevkiyat_SatisFat_MaxGenIsk3'] as num?)?.toDouble()
      ..sevkiyatSatisFatDipFiyatUygulamasi =
          json['sevkiyat_SatisFat_DipFiyatUygulamasi'] as bool?
      ..sevkiyatSatisFatDipFiyatSaha =
          json['sevkiyat_SatisFat_DipFiyatSaha'] as String?
      ..sevkiyatSatisFatDipFiyatEylem =
          json['sevkiyat_SatisFat_DipFiyatEylem'] as String?
      ..sevkiyatSatisFatDipFiyatKDVDurumu =
          json['sevkiyat_SatisFat_DipFiyatKDVDurumu'] as String?
      ..sevkiyatSatisIrsaliyesiSiparissiz =
          json['sevkiyat_SatisIrsaliyesiSiparissiz'] as bool?
      ..sevkiyatSatisIrsaliyesiSiparissizFiyatGor =
          json['sevkiyat_SatisIrsaliyesiSiparissizFiyatGor'] as bool?
      ..sevkiyatSatisIrsaliyesiIade =
          json['sevkiyat_SatisIrsaliyesiIade'] as bool?
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
          json['sevkiyat_SiptenMalTop_KacGunlukKayitlarListelensin'] as int?
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
          json['sevkemri_MalToplama_DegistirilemeyecekAlanlar']
              as List<dynamic>?
      ..sevkemriMalToplamaGizlenecekAlanlar =
          json['sevkemri_MalToplama_GizlenecekAlanlar'] as List<dynamic>?
      ..sevkemriMalToplamaMiktarBarkoddan =
          json['sevkemri_MalToplama_MiktarBarkoddan'] as bool?
      ..sevkemriMalToplamaKalemDetayiSorulmasin =
          json['sevkemri_MalToplama_KalemDetayiSorulmasin'] as bool?
      ..sevkemriMalToplamaKalemDetayaUlasamasin =
          json['sevkemri_MalToplama_KalemDetayaUlasamasin'] as bool?
      ..sevkemriMalToplamaFazlaTeslimat =
          json['sevkemri_MalToplama_FazlaTeslimat'] as String?
      ..sevkemriMalToplamaVarsayilanOlcuBirimi =
          json['sevkemri_MalToplama_VarsayilanOlcuBirimi'] as int?
      ..sevkemriMalToplamaSiralamaTipi =
          json['sevkemri_MalToplama_SiralamaTipi'] as String?
      ..sevkemriMalKontrol = json['sevkemri_MalKontrol'] as bool?
      ..sevkemriMalKontrolKlavyeEngelle =
          json['sevkemri_MalKontrol_KlavyeEngelle'] as bool?
      ..sevkemriMalKontrolTipi = json['sevkemri_MalKontrolTipi'] == null
          ? null
          : SevkemriMalKontrolTipi.fromJson(
              json['sevkemri_MalKontrolTipi'] as Map<String, dynamic>)
      ..sevkemriMalKontrolKullanicilar =
          (json['sevkemri_MalKontrolKullanicilar'] as List<dynamic>?)
              ?.map((e) => e as int)
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
      ..sayimKontrolMiktari = json['sayim_Kontrol_Miktari'] as int?
      ..sayimMiktarBarkoddanGelsin =
          json['sayim_MiktarBarkoddanGelsin'] as bool?
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
      ..sayimBelgeBaglantisiniKopar =
          json['sayim_BelgeBaglantisiniKopar'] as bool?
      ..sayimBelgeOlusturabilir =
          (json['sayim_BelgeOlusturabilir'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList()
      ..sayimEkAlanlar = json['sayim_EkAlanlar'] as List<dynamic>?
      ..sayimDegismeyecekAlanlar =
          json['sayim_DegismeyecekAlanlar'] as List<dynamic>?
      ..sayimGizlenecekAlanlar =
          json['sayim_GizlenecekAlanlar'] as List<dynamic>?
      ..sayimVarsayilanOlcuBirimi = json['sayim_VarsayilanOlcuBirimi'] as int?
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
          json['siparis_MusteriSiparisi_FiyatSirasi'] as int?
      ..siparisMusSipBirim1denKaydet =
          json['siparis_MusSip_Birim1denKaydet'] as bool?
      ..siparisMusteriSiparisiKapatmaIslemi =
          json['siparis_MusteriSiparisi_KapatmaIslemi'] as bool?
      ..siparisMusSipOnayIslemleri =
          json['siparis_MusSip_OnayIslemleri'] as bool?
      ..siparisMusSipStokIhtiyacRaporu =
          json['siparis_MusSip_StokIhtiyacRaporu'] as bool?
      ..siparisMusteriSiparisiSonFiyatGoster =
          json['siparis_MusteriSiparisi_SonFiyatGoster'] as bool?
      ..siparisMusSipDigerSekmesiGoster =
          json['siparis_MusSip_DigerSekmesiGoster'] as bool?
      ..siparisMusSipEkAlan2Tablodan =
          json['siparis_MusSip_EkAlan2Tablodan'] as bool?
      ..siparisMusSipEkAlan2Hatirla =
          json['siparis_MusSip_EkAlan2Hatirla'] as bool?
      ..siparisMusSipMiktar1Gelsin =
          json['siparis_MusSip_Miktar1Gelsin'] as bool?
      ..siparisMusSipBosGecilmeyecekAlanlar =
          (json['siparis_MusSip_BosGecilmeyecekAlanlar'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList()
      ..siparisMusSipOtoPdfGor = json['siparis_MusSip_OtoPdfGor'] as bool?
      ..siparisMusSipCariKoduDegistir =
          json['siparis_MusSip_CariKoduDegistir'] as bool?
      ..siparisMusteriSiparisiAciklamaAlanlari =
          (json['siparis_MusteriSiparisi_AciklamaAlanlari'] as List<dynamic>?)
              ?.map((e) => e as int)
              .toList()
      ..siparisMusteriSiparisiGizlenecekAlanlar =
          json['siparis_MusteriSiparisi_GizlenecekAlanlar'] as List<dynamic>?
      ..siparisMusteriSiparisiDegismeyecekAlanlar =
          json['siparis_MusteriSiparisi_DegismeyecekAlanlar'] as List<dynamic>?
      ..siparisMusSipEkstraAlanlar =
          (json['siparis_MusSip_EkstraAlanlar'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList()
      ..siparisMusteriSiparisiSatirAciklamaAlanlari =
          (json['siparis_MusteriSiparisi_SatirAciklamaAlanlari']
                  as List<dynamic>?)
              ?.map((e) => e as int)
              .toList()
      ..siparisMusSipOlcuBirimi = json['siparis_MusSip_OlcuBirimi'] as int?
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
      ..siparisMusteriSiparisiDipFiyatKDVDurumu =
          json['siparis_MusteriSiparisi_DipFiyatKDVDurumu'] as String?
      ..siparisMusSipMaxIskUygulamasi =
          json['siparis_MusSip_MaxIskUygulamasi'] as bool?
      ..siparisMusSipMaxSatIsk1 =
          (json['siparis_MusSip_MaxSatIsk1'] as num?)?.toDouble()
      ..siparisMusSipMaxSatIsk2 =
          (json['siparis_MusSip_MaxSatIsk2'] as num?)?.toDouble()
      ..siparisMusSipMaxSatIsk3 =
          (json['siparis_MusSip_MaxSatIsk3'] as num?)?.toDouble()
      ..siparisMusSipMaxSatIsk4 =
          (json['siparis_MusSip_MaxSatIsk4'] as num?)?.toDouble()
      ..siparisMusSipMaxSatIsk5 =
          (json['siparis_MusSip_MaxSatIsk5'] as num?)?.toDouble()
      ..siparisMusSipMaxSatIsk6 =
          (json['siparis_MusSip_MaxSatIsk6'] as num?)?.toDouble()
      ..siparisMusSipMaxGenIsk1 =
          (json['siparis_MusSip_MaxGenIsk1'] as num?)?.toDouble()
      ..siparisMusSipMaxGenIsk2 =
          (json['siparis_MusSip_MaxGenIsk2'] as num?)?.toDouble()
      ..siparisMusSipMaxGenIsk3 =
          (json['siparis_MusSip_MaxGenIsk3'] as num?)?.toDouble()
      ..siparisMusteriSiparisiRaporlar =
          json['siparis_MusteriSiparisi_Raporlar'] as bool?
      ..siparisMusteriSiparisiDurumRaporu =
          json['siparis_MusteriSiparisi_DurumRaporu'] as bool?
      ..siparisMusteriSiparisiDurumRaporuFiyatGor =
          json['siparis_MusteriSiparisi_DurumRaporuFiyatGor'] as bool?
      ..siparisMusSipKarlilikRaporu =
          json['siparis_MusSip_KarlilikRaporu'] as bool?
      ..siparisMusSipTeslimRaporu = json['siparis_MusSip_TeslimRaporu'] as bool?
      ..siparisSaticiSiparisi = json['siparis_SaticiSiparisi'] as bool?
      ..siparisSaticiSiparisiKaydet =
          json['siparis_SaticiSiparisi_Kaydet'] as bool?
      ..siparisSaticiSiparisiDuzelt =
          json['siparis_SaticiSiparisi_Duzelt'] as bool?
      ..siparisSaticiSiparisiSil = json['siparis_SaticiSiparisi_Sil'] as bool?
      ..siparisSaticiSiparisiKapalilarListelenmesin =
          json['siparis_SaticiSiparisi_KapalilarListelenmesin'] as bool?
      ..siparisSaticiSiparisiFiyatDegistirilmesin =
          json['siparis_SaticiSiparisi_FiyatDegistirilmesin'] as bool?
      ..siparisSaticiSiparisiFiyatSirasi =
          json['siparis_SaticiSiparisi_FiyatSirasi'] as int?
      ..siparisSaticiSipBirim1denKaydet =
          json['siparis_SaticiSip_Birim1denKaydet'] as bool?
      ..siparisSaticiSiparisiKapatmaIslemi =
          json['siparis_SaticiSiparisi_KapatmaIslemi'] as bool?
      ..siparisSaticiSipOnayIslemleri =
          json['siparis_SaticiSip_OnayIslemleri'] as bool?
      ..siparisSaticiSipDigerSekmesiGoster =
          json['siparis_SaticiSip_DigerSekmesiGoster'] as bool?
      ..siparisSaticiSipOlcuBirimi =
          json['siparis_SaticiSip_OlcuBirimi'] as int?
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
      ..stokFiltreSQLTipi = json['stok_FiltreSQLTipi'] as String?
      ..stokResimGoster = json['stok_ResimGoster'] as bool?
      ..stokResimGosterEkle = json['stok_ResimGoster_Ekle'] as bool?
      ..stokResimGosterSil = json['stok_ResimGoster_Sil'] as bool?
      ..stokFiyatOzeti = json['stok_FiyatOzeti'] as bool?
      ..stokHareketDetayiniGizle = json['stok_HareketDetayiniGizle'] as bool?
      ..stokGirisHareketleriniGizle =
          json['stok_GirisHareketleriniGizle'] as bool?
      ..stokCikisHareketleriniGizle =
          json['stok_CikisHareketleriniGizle'] as bool?
      ..stokBakiyeGosterimTipi = json['stok_BakiyeGosterimTipi'] as String?
      ..stokBarkodKontrol = json['stok_BarkodKontrol'] as bool?
      ..stokDepoBakiyeDurumu = json['stok_DepoBakiyeDurumu'] as String?
      ..stokBarkodTanimlama = json['stok_BarkodTanimlama'] as bool?
      ..stokBarkodTanimlamaGorunecekAlanlar =
          (json['stok_BarkodTanimlama_GorunecekAlanlar'] as List<dynamic>?)
              ?.map((e) => e as String)
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
      ..stokFiyatGorEkraniGunlukKurdanTLGoster =
          json['stok_FiyatGorEkrani_GunlukKurdanTLGoster'] as bool?
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
      ..stokPaketlemeOnaySormasin =
          json['stok_Paketleme_OnaySormasin'] as String?
      ..stokPaketlemeDigerKulKayitGorebilir =
          json['stok_Paketleme_DigerKulKayitGorebilir'] as String?
      ..stokPaketlemeSorulacakBelgeTipleri =
          (json['stok_Paketleme_SorulacakBelgeTipleri'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList()
      ..stokRaporlar = json['stok_Raporlar'] as bool?
      ..stokRapAmbarMaliyet = json['stok_Rap_AmbarMaliyet'] as bool?
      ..stokRapLokalDepoBakiye = json['stok_Rap_LokalDepoBakiye'] as bool?
      ..stokRapUrunGrubunaGoreSatis =
          json['stok_Rap_UrunGrubunaGoreSatis'] as bool?
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
          json['cari_CariKarti_GizlenecekAlanlar'] as List<dynamic>?
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
      ..cariAktiviteBitirmeyiGeriAl =
          json['cari_Aktivite_BitirmeyiGeriAl'] as bool?
      ..cariOzelHesapKapatma = json['cari_OzelHesapKapatma'] as bool?
      ..cariOzelHesapKapatmaSil = json['cari_OzelHesapKapatma_Sil'] as bool?
      ..cariVadeKontrolu = json['cari_VadeKontrolu'] as bool?
      ..cariVadeKontroluGun = json['cari_VadeKontrolu_Gun'] as int?
      ..cariVadeKontroluBelgeTipleri =
          (json['cari_VadeKontrolu_BelgeTipleri'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList()
      ..cariFiltre = json['cari_Filtre'] as String?
      ..cariFiltreSQL = json['cari_FiltreSQL'] as String?
      ..cariFiltreSQLTipi = json['cari_FiltreSQLTipi'] as String?
      ..cariVirman = json['cari_Virman'] as bool?
      ..cariVirmanKaydet = json['cari_Virman_Kaydet'] as bool?
      ..cariHarita = json['cari_Harita'] as bool?
      ..cariTeslimCariRehberSadeceSecsin =
          json['cari_TeslimCari_RehberSadeceSecsin'] as String?
      ..cariTeslimCariSatisBaglanmisCarilerSecilsin =
          json['cari_TeslimCari_SatisBaglanmisCarilerSecilsin'] as String?
      ..cariRaporlar = json['cari_Raporlar'] as bool?
      ..cariRapEkstre = json['cari_Rap_Ekstre'] as bool?
      ..cariRapStokEkstre = json['cari_Rap_StokEkstre'] as bool?
      ..cariRapYaslandirma = json['cari_Rap_Yaslandirma'] as bool?
      ..cariRapHarDetayliYaslandir =
          json['cari_Rap_HarDetayliYaslandir'] as bool?
      ..cariRapHareket = json['cari_Rap_Hareket'] as bool?
      ..cariRapDovizBakiye = json['cari_Rap_DovizBakiye'] as bool?
      ..cariRapStokSatisOzeti = json['cari_Rap_StokSatisOzeti'] as bool?
      ..cariRapDovizliEkstre = json['cari_Rap_DovizliEkstre'] as bool?
      ..tahsilatTahsilatlar = json['tahsilat_Tahsilatlar'] as bool?
      ..tahsilatNakitTahsilat = json['tahsilat_NakitTahsilat'] as bool?
      ..tahsilatNakitTahsilatKaydet =
          json['tahsilat_NakitTahsilat_Kaydet'] as bool?
      ..tahsilatKKartiTahsilat = json['tahsilat_KKartiTahsilat'] as bool?
      ..tahsilatKKartiTahsilatKaydet =
          json['tahsilat_KKartiTahsilat_Kaydet'] as bool?
      ..tahsilatNakitOdeme = json['tahsilat_NakitOdeme'] as bool?
      ..tahsilatNakitOdemeKaydet = json['tahsilat_NakitOdeme_Kaydet'] as bool?
      ..tahsilatSenetTahsilat = json['tahsilat_SenetTahsilat'] as bool?
      ..tahsilatSenetTahsilatKaydet =
          json['tahsilat_SenetTahsilat_Kaydet'] as bool?
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
      ..yoneticiBankaIslemleriSil =
          json['yonetici_Banka_Islemleri_Sil'] as bool?
      ..yoneticiBankaIslemHesapEFT =
          json['yonetici_Banka_Islem_HesapEFT'] as bool?
      ..yoneticiBankaIslemHesapVirman =
          json['yonetici_Banka_Islem_HesapVirman'] as bool?
      ..yoneticiBankaIslemCariEFT =
          json['yonetici_Banka_Islem_CariEFT'] as bool?
      ..finansBankaKasaTransferi = json['finans_Banka_Kasa_Transferi'] as bool?
      ..finansKasaListesi = json['finans_Kasa_Listesi'] as bool?
      ..finansKasaIslemleri = json['finans_Kasa_Islemleri'] as bool?
      ..finansKasaIslemleriSil = json['finans_Kasa_Islemleri_Sil'] as bool?
      ..finansKasalarArasiTransfer =
          json['finans_KasalarArasiTransfer'] as bool?
      ..finansKasaNakitTahsilat = json['finans_Kasa_NakitTahsilat'] as bool?
      ..finansKasaNakitOdeme = json['finans_Kasa_NakitOdeme'] as bool?
      ..finansKasaMuhtelifTahsilat =
          json['finans_Kasa_MuhtelifTahsilat'] as bool?
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
          json['finans_Cek_GizlenecekAlanlar'] as List<dynamic>?
      ..finansCekMusteri = json['finans_Cek_Musteri'] as bool?
      ..finansMCEKEkle = json['finans_MCEK_Ekle'] as bool?
      ..finansMCEKSil = json['finans_MCEK_Sil'] as bool?
      ..finansMCEKBelgeDetayi = json['finans_MCEK_BelgeDetayi'] as bool?
      ..finansMCEKHareketler = json['finans_MCEK_Hareketler'] as bool?
      ..finansMCEKEvraklar = json['finans_MCEK_Evraklar'] as bool?
      ..finansMCEKCariyeCiro = json['finans_MCEK_CariyeCiro'] as bool?
      ..finansMCEKTahsileCiro = json['finans_MCEK_TahsileCiro'] as bool?
      ..finansMCEKTahsilDekontu = json['finans_MCEK_TahsilDekontu'] as bool?
      ..finansCekBorc = json['finans_Cek_Borc'] as bool?
      ..finansBorcCekiEkle = json['finans_BorcCeki_Ekle'] as bool?
      ..finansBorcCekiSil = json['finans_BorcCeki_Sil'] as bool?
      ..finansBCEKBelgeDetayi = json['finans_BCEK_BelgeDetayi'] as bool?
      ..finansBCEKHareketler = json['finans_BCEK_Hareketler'] as bool?
      ..finansBCEKEvraklar = json['finans_BCEK_Evraklar'] as bool?
      ..finansBCEKOdemeDekontu = json['finans_BCEK_OdemeDekontu'] as bool?
      ..finansSenetMusteri = json['finans_Senet_Musteri'] as bool?
      ..finansMSENEkle = json['finans_MSEN_Ekle'] as bool?
      ..finansMSENSil = json['finans_MSEN_Sil'] as bool?
      ..finansMSENBelgeDetayi = json['finans_MSEN_BelgeDetayi'] as bool?
      ..finansMSENHareketler = json['finans_MSEN_Hareketler'] as bool?
      ..finansMSENEvraklar = json['finans_MSEN_Evraklar'] as bool?
      ..finansMSENCariyeCiro = json['finans_MSEN_CariyeCiro'] as bool?
      ..finansMSENTahsileCiro = json['finans_MSEN_TahsileCiro'] as bool?
      ..finansMSENTahsilDekontu = json['finans_MSEN_TahsilDekontu'] as bool?
      ..finansSenetBorc = json['finans_Senet_Borc'] as bool?
      ..finansBSENEkle = json['finans_BSEN_Ekle'] as bool?
      ..finansBSENSil = json['finans_BSEN_Sil'] as bool?
      ..finansBSENBelgeDetayi = json['finans_BSEN_BelgeDetayi'] as bool?
      ..finansBSENHareketler = json['finans_BSEN_Hareketler'] as bool?
      ..finansBSENEvraklar = json['finans_BSEN_Evraklar'] as bool?
      ..finansBSENOdemeDekontu = json['finans_BSEN_OdemeDekontu'] as bool?
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
      ..finansRaporlarFinansalDurum =
          json['finans_Raporlar_FinansalDurum'] as bool?
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
      ..yazdirmaDAT = json['yazdirma_DAT'] as bool?
      ..yazdirmaDATYazicilari =
          (json['yazdirma_DAT_Yazicilari'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList()
      ..yazdirmaDizaynDAT = (json['yazdirma_Dizayn_DAT'] as List<dynamic>?)
          ?.map((e) => e as int)
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
              ?.map((e) => e as int)
              .toList()
      ..yazdirmaSatisIrs = json['yazdirma_SatisIrs'] as bool?
      ..yazdirmaSatisFat = json['yazdirma_SatisFat'] as bool?
      ..yazdirmaSatisFatYazicilari =
          (json['yazdirma_SatisFat_Yazicilari'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList()
      ..yazdirmaDizaynSatisFat =
          (json['yazdirma_Dizayn_SatisFat'] as List<dynamic>?)
              ?.map((e) => e as int)
              .toList()
      ..yazdirmaAlisFat = json['yazdirma_AlisFat'] as bool?
      ..yazdirmaDizaynAlisFat =
          json['yazdirma_Dizayn_AlisFat'] as List<dynamic>?
      ..yazdirmaMustahsil = json['yazdirma_Mustahsil'] as bool?
      ..yazdirmaMusSip = json['yazdirma_MusSip'] as bool?
      ..yazdirmaMusSipYazicilari =
          json['yazdirma_MusSip_Yazicilari'] as List<dynamic>?
      ..yazdirmaDizaynMusSip =
          (json['yazdirma_Dizayn_MusSip'] as List<dynamic>?)
              ?.map((e) => e as int)
              .toList()
      ..yazdirmaSaticiSip = json['yazdirma_SaticiSip'] as bool?
      ..yazdirmaDizaynSaticiSip =
          (json['yazdirma_Dizayn_SaticiSip'] as List<dynamic>?)
              ?.map((e) => e as int)
              .toList()
      ..yazdirmaATAL = json['yazdirma_ATAL'] as bool?
      ..yazdirmaATALYazicilari =
          (json['yazdirma_ATAL_Yazicilari'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList()
      ..yazdirmaDizaynATAL = (json['yazdirma_Dizayn_ATAL'] as List<dynamic>?)
          ?.map((e) => e as int)
          .toList()
      ..yazdirmaOdemeMakbuzu = json['yazdirma_OdemeMakbuzu'] as bool?
      ..yazdirmaOdemeMakbuzuYazicilari =
          json['yazdirma_OdemeMakbuzu_Yazicilari'] as List<dynamic>?
      ..yazdirmaDizaynOdemeMakbuzu =
          (json['yazdirma_Dizayn_OdemeMakbuzu'] as List<dynamic>?)
              ?.map((e) => e as int)
              .toList()
      ..yazdirmaAlisIrs = json['yazdirma_AlisIrs'] as bool?
      ..yazdirmaAlisIrsYazicilari =
          (json['yazdirma_AlisIrs_Yazicilari'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList()
      ..yazdirmaDizaynAlisIrs =
          (json['yazdirma_Dizayn_AlisIrs'] as List<dynamic>?)
              ?.map((e) => e as int)
              .toList()
      ..yazdirmaIsEmri = json['yazdirma_IsEmri'] as bool?
      ..yazdirmaAmbarCikis = json['yazdirma_AmbarCikis'] as bool?
      ..yazdirmaAmbarGiris = json['yazdirma_AmbarGiris'] as bool?
      ..yazdirmaCariHareket = json['yazdirma_CariHareket'] as bool?
      ..uretimFiyatGorebilir = json['uretim_FiyatGorebilir'] as bool?
      ..uretimUSK = json['uretim_USK'] as bool?
      ..uretimUSKKaydet = json['uretim_USK_Kaydet'] as bool?
      ..uretimUSKDuzelt = json['uretim_USK_Duzelt'] as bool?
      ..uretimUSKSil = json['uretim_USK_Sil'] as bool?
      ..uretimUSKKacGunlukKayitlarListelensin =
          json['uretim_USK_KacGunlukKayitlarListelensin'] as int?
      ..uretimUSKMiktarBarkoddan = json['uretim_USK_MiktarBarkoddan'] as bool?
      ..uretimUSKMiktar1Gelsin = json['uretim_USK_Miktar1Gelsin'] as bool?
      ..sirketDepoUretimGiris = json['sirket_Depo_Uretim_Giris'] as int?
      ..sirketDepoUretimCikis = json['sirket_Depo_Uretim_Cikis'] as int?
      ..uretimUSKIsEmriOtoGelsin = json['uretim_USK_IsEmriOtoGelsin'] as bool?
      ..uretimUSKSoruSorulmasin = json['uretim_USK_SoruSorulmasin'] as bool?
      ..uretimUSKStokRehberiAcilmasin =
          json['uretim_USK_StokRehberiAcilmasin'] as bool?
      ..uretimUSKKlavyeEngelle = json['uretim_USK_KlavyeEngelle'] as bool?
      ..uretimUSKDepoOnceligi = json['uretim_USK_DepoOnceligi'] as String?
      ..uretimUSKFisiErpUretsin = json['uretim_USK_FisiErpUretsin'] as bool?
      ..uretimUSKGizlenecekAlanlar =
          json['uretim_USK_GizlenecekAlanlar'] as List<dynamic>?
      ..uretimUSKBosGecilmeyecekAlanlar =
          json['uretim_USK_BosGecilmeyecekAlanlar'] as List<dynamic>?
      ..uretimUSKDegismeyecekAlanlar =
          json['uretim_USK_DegismeyecekAlanlar'] as List<dynamic>?
      ..uretimUSKOlcuBirimi = json['uretim_USK_OlcuBirimi'] as int?
      ..uretimUSKOtoYazdir = json['uretim_USK_OtoYazdir'] as String?
      ..uretimUSKKalemliYapi = json['uretim_USK_KalemliYapi'] as bool?
      ..uretimUSKKalemliYapiStokMevcutaEklensin =
          json['uretim_USK_KalemliYapi_StokMevcutaEklensin'] as bool?
      ..uretimUSKKalemliYapiOtoEtiketYazdir =
          json['uretim_USK_KalemliYapi_OtoEtiketYazdir'] as bool?
      ..uretimUSKKalemliYapiAyniBarkodOkutulamaz =
          json['uretim_USK_KalemliYapi_AyniBarkodOkutulamaz'] as bool?
      ..uretimUSKKalemliYapiOkutulanEnUsteEklensin =
          json['uretim_USK_KalemliYapi_OkutulanEnUsteEklensin'] as bool?
      ..uretimUSKKalemliYapiKalemDuzeltilemesin =
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
      ..uretimIsEmriEkle = json['uretim_IsEmri_Ekle'] as bool?
      ..uretimIsEmriDuzelt = json['uretim_IsEmri_Duzelt'] as bool?
      ..uretimIsEmriSil = json['uretim_IsEmri_Sil'] as bool?
      ..taltekSTEK = json['taltek_STEK'] as bool?
      ..taltekSTEKKaydet = json['taltek_STEK_Kaydet'] as bool?
      ..taltekSTEKDuzelt = json['taltek_STEK_Duzelt'] as bool?
      ..taltekSTEKSil = json['taltek_STEK_Sil'] as bool?
      ..taltekSTEKKapalilarListenlenmesin =
          json['taltek_STEK_KapalilarListenlenmesin'] as bool?
      ..taltekSTEKOnayIslemleri = json['taltek_STEK_OnayIslemleri'] as bool?
      ..taltekSTEKCariKoduDegistir =
          json['taltek_STEK_CariKoduDegistir'] as bool?
      ..taltekSTEKFiyatDegistirilmesin =
          json['taltek_STEK_FiyatDegistirilmesin'] as bool?
      ..taltekSTEKAciklamalarYetkiTuru =
          json['taltek_STEK_Aciklamalar_YetkiTuru'] as String?
      ..taltekSTEKGizlenecekAlanlar =
          json['taltek_STEK_GizlenecekAlanlar'] as List<dynamic>?
      ..taltekSTEKDegismeyecekAlanlar =
          json['taltek_STEK_DegismeyecekAlanlar'] as List<dynamic>?
      ..taltekSTEKBosGecilmeyecekAlanlar =
          json['taltek_STEK_BosGecilmeyecekAlanlar'] as List<dynamic>?
      ..taltekSTEKAciklamaAlanlari =
          (json['taltek_STEK_AciklamaAlanlari'] as List<dynamic>?)
              ?.map((e) => e as int)
              .toList()
      ..taltekSTEKOzelKod1Degeri = json['taltek_STEK_OzelKod1Degeri'] as String?
      ..taltekSTEKDipFiyatUygulamasi =
          json['taltek_STEK_DipFiyatUygulamasi'] as bool?
      ..taltekSTEKDipFiyatSaha = json['taltek_STEK_DipFiyatSaha'] as String?
      ..taltekSTEKDipFiyatEylem = json['taltek_STEK_DipFiyatEylem'] as String?
      ..taltekATAL = json['taltek_ATAL'] as bool?
      ..taltekATALKaydet = json['taltek_ATAL_Kaydet'] as bool?
      ..taltekATALDuzelt = json['taltek_ATAL_Duzelt'] as bool?
      ..taltekATALSil = json['taltek_ATAL_Sil'] as bool?
      ..taltekATALCariEMailAlani = json['taltek_ATAL_CariEMailAlani'] as String?
      ..taltekATALOnayIslemleri = json['taltek_ATAL_OnayIslemleri'] as bool?
      ..taltekATALCariKoduDegistir =
          json['taltek_ATAL_CariKoduDegistir'] as bool?
      ..taltekATALAciklamalarYetkiTuru =
          json['taltek_ATAL_Aciklamalar_YetkiTuru'] as String?
      ..taltekATALGizlenecekAlanlar =
          (json['taltek_ATAL_GizlenecekAlanlar'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList()
      ..taltekATALAciklamaAlanlari =
          (json['taltek_ATAL_AciklamaAlanlari'] as List<dynamic>?)
              ?.map((e) => e as int)
              .toList()
      ..taltekATALBelgeKopyala = json['taltek_ATAL_BelgeKopyala'] as bool?
      ..taltekSTAL = json['taltek_STAL'] as bool?
      ..taltekSTALKaydet = json['taltek_STAL_Kaydet'] as bool?
      ..taltekSTALDuzelt = json['taltek_STAL_Duzelt'] as bool?
      ..taltekSTALSil = json['taltek_STAL_Sil'] as bool?
      ..taltekSTALKapalilarListenlenmesin =
          json['taltek_STAL_KapalilarListenlenmesin'] as bool?
      ..taltekSTALOnayIslemleri = json['taltek_STAL_OnayIslemleri'] as bool?
      ..taltekSTALCariKoduDegistir =
          json['taltek_STAL_CariKoduDegistir'] as bool?
      ..taltekSTALFiyatDegistirilmesin =
          json['taltek_STAL_FiyatDegistirilmesin'] as bool?
      ..taltekSTALGizlenecekAlanlar =
          (json['taltek_STAL_GizlenecekAlanlar'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList()
      ..taltekSTALDipFiyatUygulamasi =
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
      ..ebelgeEFatDizayn = json['ebelge_EFat_Dizayn'] as int?
      ..ebelgeEArsiv = json['ebelge_EArsiv'] as bool?
      ..ebelgeEArsivTaslakOlustur = json['ebelge_EArsivTaslakOlustur'] as bool?
      ..ebelgeEArsivTaslakSil = json['ebelge_EArsivTaslakSil'] as bool?
      ..ebelgeEArsivTaslakBasim = json['ebelge_EArsivTaslakBasim'] as bool?
      ..ebelgeEArsivGoruntule = json['ebelge_EArsivGoruntule'] as bool?
      ..ebelgeEArsivSorgula = json['ebelge_EArsivSorgula'] as bool?
      ..ebelgeEArsivGonder = json['ebelge_EArsivGonder'] as bool?
      ..ebelgeEArsivDizayn = json['ebelge_EArsiv_Dizayn'] as int?
      ..ebelgeEIrsaliye = json['ebelge_EIrsaliye'] as bool?
      ..ebelgeEIrsaliyeGidenKutusu =
          json['ebelge_EIrsaliyeGidenKutusu'] as bool?
      ..ebelgeEIrsaliyeGelenKutusu =
          json['ebelge_EIrsaliyeGelenKutusu'] as bool?
      ..ebelgeEIrsaliyeTaslakOlustur =
          json['ebelge_EIrsaliyeTaslakOlustur'] as bool?
      ..ebelgeEIrsaliyeTaslakSil = json['ebelge_EIrsaliyeTaslakSil'] as bool?
      ..ebelgeEIrsaliyeTaslakBasim =
          json['ebelge_EIrsaliyeTaslakBasim'] as bool?
      ..ebelgeEIrsaliyeGonder = json['ebelge_EIrsaliyeGonder'] as bool?
      ..ebelgeEIrsaliyeGoruntule = json['ebelge_EIrsaliyeGoruntule'] as bool?
      ..ebelgeEIrsaliyeDizayn = json['ebelge_EIrsaliye_Dizayn'] as int?
      ..entegrasyonUETDSESYA = json['entegrasyon_UETDSESYA'] as bool?
      ..entegrasyonUETDSESYAIptal =
          json['entegrasyon_UETDSESYA_Iptal'] as bool?;

Map<String, dynamic> _$ProfilYetkiModelToJson(ProfilYetkiModel instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'yazdirma_SatisIrs_Yazicilari', instance.yazdirmaSatisIrsYazicilari);
  writeNotNull('yazdirma_Dizayn_SatisIrs', instance.yazdirmaDizaynSatisIrs);
  writeNotNull('yazdirma_SatisTalebi', instance.yazdirmaSatisTalebi);
  writeNotNull('yazdirma_SatisTalebi_Yazicilari',
      instance.yazdirmaSatisTalebiYazicilari);
  writeNotNull(
      'yazdirma_Dizayn_SatisTalebi', instance.yazdirmaDizaynSatisTalebi);
  writeNotNull('yazdirma_SatisTeklifi', instance.yazdirmaSatisTeklifi);
  writeNotNull(
      'yazdirma_Dizayn_SatisTeklifi', instance.yazdirmaDizaynSatisTeklifi);
  writeNotNull('yazdirma_Sayim', instance.yazdirmaSayim);
  writeNotNull('yazdirma_Sayim_Yazicilari', instance.yazdirmaSayimYazicilari);
  writeNotNull('yazdirma_Dizayn_Sayim', instance.yazdirmaDizaynSayim);
  writeNotNull('yazdirma_Sevkiyat_Etiketi', instance.yazdirmaSevkiyatEtiketi);
  writeNotNull('yazdirma_Sevkiyat_Etiketi_Yazicilari',
      instance.yazdirmaSevkiyatEtiketiYazicilari);
  writeNotNull('yazdirma_Dizayn_SevkiyatEtiketi',
      instance.yazdirmaDizaynSevkiyatEtiketi);
  writeNotNull('yazdirma_Sevkiyat_Etiketi_KopyaSayisiGizle',
      instance.yazdirmaSevkiyatEtiketiKopyaSayisiGizle);
  writeNotNull('yazdirma_Serbest', instance.yazdirmaSerbest);
  writeNotNull(
      'yazdirma_Serbest_Yazicilari', instance.yazdirmaSerbestYazicilari);
  writeNotNull('yazdirma_Dizayn_Serbest', instance.yazdirmaDizaynSerbest);
  writeNotNull('yazdirma_SeriEtiketi', instance.yazdirmaSeriEtiketi);
  writeNotNull('yazdirma_Seri_Etiketi_Yazicilari',
      instance.yazdirmaSeriEtiketiYazicilari);
  writeNotNull(
      'yazdirma_Dizayn_SeriEtiketi', instance.yazdirmaDizaynSeriEtiketi);
  writeNotNull('yazdirma_Stok_Etiketi', instance.yazdirmaStokEtiketi);
  writeNotNull('yazdirma_Stok_Etiketi_Yazicilari',
      instance.yazdirmaStokEtiketiYazicilari);
  writeNotNull(
      'yazdirma_Dizayn_StokEtiketi', instance.yazdirmaDizaynStokEtiketi);
  writeNotNull('yazdirma_TahsilatMakbuzu', instance.yazdirmaTahsilatMakbuzu);
  writeNotNull('yazdirma_Dizayn_TahsilatMakbuzu',
      instance.yazdirmaDizaynTahsilatMakbuzu);
  writeNotNull('yazdirma_USK', instance.yazdirmaUSK);
  writeNotNull('yazdirma_USK_Yazicilari', instance.yazdirmaUSKYazicilari);
  writeNotNull('yazdirma_Dizayn_USK', instance.yazdirmaDizaynUSK);
  writeNotNull('yazdirma_UretMalTop', instance.yazdirmaUretMalTop);
  writeNotNull(
      'yazdirma_UretMalTop_Yazicilari', instance.yazdirmaUretMalTopYazicilari);
  writeNotNull('yazdirma_Dizayn_UretMalTop', instance.yazdirmaDizaynUretMalTop);
  writeNotNull('kullanicilar', instance.kullanicilar);
  writeNotNull('sirket_TamEkranAcilsin', instance.sirketTamEkranAcilsin);
  writeNotNull(
      'sirket_RehberdeCariKodGizle', instance.sirketRehberdeCariKodGizle);
  writeNotNull(
      'sirket_RehberdeStokKodGizle', instance.sirketRehberdeStokKodGizle);
  writeNotNull(
      'sirket_RaporlardaFiyatGizle', instance.sirketRaporlardaFiyatGizle);
  writeNotNull('sirket_TarihDegismesin', instance.sirketTarihDegismesin);
  writeNotNull(
      'sirket_DevirSirketineGiris', instance.sirketDevirSirketineGiris);
  writeNotNull('sirket_KontrolluAktar_BelgeTipleri',
      instance.sirketKontrolluAktarBelgeTipleri);
  writeNotNull('sirket_KontrolluAktar_BelgeNoGoster',
      instance.sirketKontrolluAktarBelgeNoGoster);
  writeNotNull('sirket_KontrolAciklamasi_BelgeTipleri',
      instance.sirketKontrolAciklamasiBelgeTipleri);
  writeNotNull('sirket_TLFiyatGelsin_BelgeTipleri',
      instance.sirketTLFiyatGelsinBelgeTipleri);
  writeNotNull('sirket_KalemKayitKontrol_BelgeTipleri',
      instance.sirketKalemKayitKontrolBelgeTipleri);
  writeNotNull('sirket_aktifDepolar', instance.sirketAktifDepolar);
  writeNotNull('sirket_satisDepo', instance.sirketSatisDepo);
  writeNotNull(
      'sirket_satisDepo_Ozellestir', instance.sirketSatisDepoOzellestir);
  writeNotNull('sirket_satisDepo_MusSip', instance.sirketSatisDepoMusSip);
  writeNotNull('sirket_satisDepo_SatisFat', instance.sirketSatisDepoSatisFat);
  writeNotNull('sirket_satisDepo_SatisIrs', instance.sirketSatisDepoSatisIrs);
  writeNotNull('sirket_alisDepo', instance.sirketAlisDepo);
  writeNotNull('sirket_iadeDepo', instance.sirketIadeDepo);
  writeNotNull('sirket_projeKodu', instance.sirketProjeKodu);
  writeNotNull('sirket_aktifProjeler', instance.sirketAktifProjeler);
  writeNotNull('ayarlar_FirmaAyarlari', instance.ayarlarFirmaAyarlari);
  writeNotNull('ayarlar_Oturumlar', instance.ayarlarOturumlar);
  writeNotNull(
      'sirket_SifreHatirlamaDurumu', instance.sirketSifreHatirlamaDurumu);
  writeNotNull('genel_DovizKurlari', instance.genelDovizKurlari);
  writeNotNull('genel_DovizKurlari_Ekle', instance.genelDovizKurlariEkle);
  writeNotNull('genel_DovizKurlari_Duzelt', instance.genelDovizKurlariDuzelt);
  writeNotNull('genel_DovizKurlari_Sil', instance.genelDovizKurlariSil);
  writeNotNull('genel_BelgeKontrol', instance.genelBelgeKontrol);
  writeNotNull('genel_BelgeKontrol_Ekle', instance.genelBelgeKontrolEkle);
  writeNotNull('genel_BelgeKontrol_Sil', instance.genelBelgeKontrolSil);
  writeNotNull('genel_BelgeKontrol_BelgeTipleri',
      instance.genelBelgeKontrolBelgeTipleri);
  writeNotNull('genel_BelgeKontrol_BarkodOkutsun',
      instance.genelBelgeKontrolBarkodOkutsun);
  writeNotNull('genel_BelgeKontrol_MiktarOtomatikGelsin',
      instance.genelBelgeKontrolMiktarOtomatikGelsin);
  writeNotNull('genel_BelgeKontrol_KalemDetaySorulmasin',
      instance.genelBelgeKontrolKalemDetaySorulmasin);
  writeNotNull('genel_BelgeKontrol_BelgeOnaySormasin',
      instance.genelBelgeKontrolBelgeOnaySormasin);
  writeNotNull(
      'malKabul_FiyatDegistirilmesin', instance.malKabulFiyatDegistirilmesin);
  writeNotNull(
      'malKabul_AlisIrs_BelgeTipleri', instance.malKabulAlisIrsBelgeTipleri);
  writeNotNull('malKabul_AlisIrs_GizlenecekAlanlar',
      instance.malKabulAlisIrsGizlenecekAlanlar);
  writeNotNull('malKabul_AlisIrs_AciklamaAlanlari',
      instance.malKabulAlisIrsAciklamaAlanlari);
  writeNotNull('malKabul_SatinAlma', instance.malKabulSatinAlma);
  writeNotNull('malKabul_SatinAlma_Kaydet', instance.malKabulSatinAlmaKaydet);
  writeNotNull('malKabul_SatinAlma_Duzelt', instance.malKabulSatinAlmaDuzelt);
  writeNotNull('malKabul_SatinAlma_Sil', instance.malKabulSatinAlmaSil);
  writeNotNull('malKabul_AlisIrsaliyesiFiyatGor',
      instance.malKabulAlisIrsaliyesiFiyatGor);
  writeNotNull('malKabul_AlisIrs_DigerSekmesiGoster',
      instance.malKabulAlisIrsDigerSekmesiGoster);
  writeNotNull('malKabul_AlisIrs_SipBagSecenegi',
      instance.malKabulAlisIrsSipBagSecenegi);
  writeNotNull('malKabul_AlisIrs_ReferansStokUygulamasi',
      instance.malKabulAlisIrsReferansStokUygulamasi);
  writeNotNull('malKabul_AlisIrs_SipBag_SipHariciKalemEklenebilir',
      instance.malKabulAlisIrsSipBagSipHariciKalemEklenebilir);
  writeNotNull('malKabul_AlisIrs_SipBag_FazlaTeslimatYapilabilir',
      instance.malKabulAlisIrsSipBagFazlaTeslimatYapilabilir);
  writeNotNull('malKabul_AlisIrs_SipBag_SipOkutulsun',
      instance.malKabulAlisIrsSipBagSipOkutulsun);
  writeNotNull('malKabul_AlisIrs_SipBag_CokluSecim',
      instance.malKabulAlisIrsSipBagCokluSecim);
  writeNotNull('malKabul_AlisIrs_SipBag_TumKalemlerSecilsin',
      instance.malKabulAlisIrsSipBagTumKalemlerSecilsin);
  writeNotNull('malKabul_AlisIrs_SipBag_EslesmeDurumu',
      instance.malKabulAlisIrsSipBagEslesmeDurumu);
  writeNotNull(
      'malKabul_AlisIrs_BarkodluGiris', instance.malKabulAlisIrsBarkodluGiris);
  writeNotNull('malKabul_AlisIrs_MiktarOtomatikGelsin',
      instance.malKabulAlisIrsMiktarOtomatikGelsin);
  writeNotNull('malKabul_AlisIrs_KalemDetaySorulmasin',
      instance.malKabulAlisIrsKalemDetaySorulmasin);
  writeNotNull('malKabul_AlisIrs_KalemlerBirlestirilsin',
      instance.malKabulAlisIrsKalemlerBirlestirilsin);
  writeNotNull('malKabul_AlisIrs_StokRehberiAcilmasin',
      instance.malKabulAlisIrsStokRehberiAcilmasin);
  writeNotNull('malKabul_AlisIrs_KalemDuzeltilemesin',
      instance.malKabulAlisIrsKalemDuzeltilemesin);
  writeNotNull('malKabul_AlisIrs_TekrarEdenBarkod',
      instance.malKabulAlisIrsTekrarEdenBarkod);
  writeNotNull(
      'malKabul_AlisIrs_KlavyeEngelle', instance.malKabulAlisIrsKlavyeEngelle);
  writeNotNull(
      'malKabul_AlisIrs_Miktar1Gelsin', instance.malKabulAlisIrsMiktar1Gelsin);
  writeNotNull('malKabul_AlisIrs_Raporlar', instance.malKabulAlisIrsRaporlar);
  writeNotNull(
      'malKabul_AlisIrs_KalemRaporu', instance.malKabulAlisIrsKalemRaporu);
  writeNotNull(
      'malKabul_AlisIrs_OtoBasimYap', instance.malKabulAlisIrsOtoBasimYap);
  writeNotNull('malKabul_AlisIrs_KacGunlukKayitlarListelensin',
      instance.malKabulAlisIrsKacGunlukKayitlarListelensin);
  writeNotNull(
      'malKabul_AlisIrs_FiyatSirasi', instance.malKabulAlisIrsFiyatSirasi);
  writeNotNull('malKabul_AlisIrs_Birim1denKaydet',
      instance.malKabulAlisIrsBirim1denKaydet);
  writeNotNull('malKabul_AlisIrs_CariKoduDegistir',
      instance.malKabulAlisIrsCariKoduDegistir);
  writeNotNull('malKabul_AlisIrs_CariRehPlaEslesmesin',
      instance.malKabulAlisIrsCariRehPlaEslesmesin);
  writeNotNull('malKabul_Iade', instance.malKabulIade);
  writeNotNull('malKabul_Iade_Kaydet', instance.malKabulIadeKaydet);
  writeNotNull('malKabul_Iade_Duzelt', instance.malKabulIadeDuzelt);
  writeNotNull('malKabul_Iade_Sil', instance.malKabulIadeSil);
  writeNotNull('malKabul_AlisFaturasi_BelgeTipleri',
      instance.malKabulAlisFaturasiBelgeTipleri);
  writeNotNull('malKabul_AlisFaturasi', instance.malKabulAlisFaturasi);
  writeNotNull(
      'malKabul_AlisFaturasi_Kaydet', instance.malKabulAlisFaturasiKaydet);
  writeNotNull(
      'malKabul_AlisFaturasi_Duzelt', instance.malKabulAlisFaturasiDuzelt);
  writeNotNull('malKabul_AlisFaturasi_Sil', instance.malKabulAlisFaturasiSil);
  writeNotNull('malKabul_AlisFat_DigerSekmesiGoster',
      instance.malKabulAlisFatDigerSekmesiGoster);
  writeNotNull('malKabul_AlisFat_KacGunlukKayitlarListelensin',
      instance.malKabulAlisFatKacGunlukKayitlarListelensin);
  writeNotNull(
      'malKabul_AlisFat_FiyatSirasi', instance.malKabulAlisFatFiyatSirasi);
  writeNotNull('malKabul_AlisFat_Birim1denKaydet',
      instance.malKabulAlisFatBirim1denKaydet);
  writeNotNull('malKabul_AlisFat_Aciklamalar_YetkiTuru',
      instance.malKabulAlisFatAciklamalarYetkiTuru);
  writeNotNull('malKabul_AlisFat_AciklamaAlanlari',
      instance.malKabulAlisFatAciklamaAlanlari);
  writeNotNull('malKabul_AlisFat_CariKoduDegistir',
      instance.malKabulAlisFatCariKoduDegistir);
  writeNotNull(
      'malKabul_AlisFat_BarkodluGiris', instance.malKabulAlisFatBarkodluGiris);
  writeNotNull('malKabul_AlisFat_MiktarOtomatikGelsin',
      instance.malKabulAlisFatMiktarOtomatikGelsin);
  writeNotNull('malKabul_AlisFat_KalemDetaySorulmasin',
      instance.malKabulAlisFatKalemDetaySorulmasin);
  writeNotNull('malKabul_AlisFat_StokRehberiAcilmasin',
      instance.malKabulAlisFatStokRehberiAcilmasin);
  writeNotNull('malKabul_AlisFat_KalemDuzeltilemesin',
      instance.malKabulAlisFatKalemDuzeltilemesin);
  writeNotNull(
      'malKabul_AlisFat_KlavyeEngelle', instance.malKabulAlisFatKlavyeEngelle);
  writeNotNull(
      'malKabul_AlisFat_Miktar1Gelsin', instance.malKabulAlisFatMiktar1Gelsin);
  writeNotNull('malKabul_AlisFat_ReferansStokUygulamasi',
      instance.malKabulAlisFatReferansStokUygulamasi);
  writeNotNull('malKabul_AlisFat_SipBag_SipHariciKalemEklenebilir',
      instance.malKabulAlisFatSipBagSipHariciKalemEklenebilir);
  writeNotNull('malKabul_AlisFat_SipBag_FazlaTeslimatYapilabilir',
      instance.malKabulAlisFatSipBagFazlaTeslimatYapilabilir);
  writeNotNull('malKabul_AlisFat_SipBag_SipOkutulsun',
      instance.malKabulAlisFatSipBagSipOkutulsun);
  writeNotNull('malKabul_AlisFat_SipBag_CokluSecim',
      instance.malKabulAlisFatSipBagCokluSecim);
  writeNotNull('malKabul_AlisFat_SipBag_TumKalemlerSecilsin',
      instance.malKabulAlisFatSipBagTumKalemlerSecilsin);
  writeNotNull('malKabul_AlisFat_SipBag_EslesmeDurumu',
      instance.malKabulAlisFatSipBagEslesmeDurumu);
  writeNotNull('malKabul_AlisFat_Raporlar', instance.malKabulAlisFatRaporlar);
  writeNotNull(
      'malKabul_AlisFat_KalemRaporu', instance.malKabulAlisFatKalemRaporu);
  writeNotNull('malKabul_Mustahsil', instance.malKabulMustahsil);
  writeNotNull('malKabul_Mustahsil_Ekle', instance.malKabulMustahsilEkle);
  writeNotNull('malKabul_Mustahsil_Duzelt', instance.malKabulMustahsilDuzelt);
  writeNotNull('malKabul_Mustahsil_Sil', instance.malKabulMustahsilSil);
  writeNotNull('transfer_DAT', instance.transferDAT);
  writeNotNull('transfer_DAT_Kaydet', instance.transferDATKaydet);
  writeNotNull('transfer_DAT_Duzelt', instance.transferDATDuzelt);
  writeNotNull('transfer_DAT_Sil', instance.transferDATSil);
  writeNotNull('transfer_DAT_FiyatGor', instance.transferDATFiyatGor);
  writeNotNull('transfer_DAT_OtoEtiketBas', instance.transferDATOtoEtiketBas);
  writeNotNull('transfer_DAT_VarsayilanCikisDepo',
      instance.transferDATVarsayilanCikisDepo);
  writeNotNull('transfer_DAT_VarsayilanGirisDepo',
      instance.transferDATVarsayilanGirisDepo);
  writeNotNull('transfer_DAT_eIrsIsaretleyemesin',
      instance.transferDATEIrsIsaretleyemesin);
  writeNotNull('transfer_DAT_DigerSekmesiGoster',
      instance.transferDATDigerSekmesiGoster);
  writeNotNull('transfer_DAT_BarkodluGiris', instance.transferDATBarkodluGiris);
  writeNotNull('transfer_DAT_MiktarOtomatikGelsin',
      instance.transferDATMiktarOtomatikGelsin);
  writeNotNull('transfer_DAT_KalemDetaySorulmasin',
      instance.transferDATKalemDetaySorulmasin);
  writeNotNull('transfer_DAT_StokRehberiAcilmasin',
      instance.transferDATStokRehberiAcilmasin);
  writeNotNull('transfer_DAT_KalemDuzeltilemesin',
      instance.transferDATKalemDuzeltilemesin);
  writeNotNull('transfer_DAT_KlavyeEngelle', instance.transferDATKlavyeEngelle);
  writeNotNull('transfer_DAT_Miktar1Gelsin', instance.transferDATMiktar1Gelsin);
  writeNotNull('transfer_DAT_KalemlerBirlestirilsin',
      instance.transferDATKalemlerBirlestirilsin);
  writeNotNull('transfer_DAT_KacGunlukKayitlarListelensin',
      instance.transferDATKacGunlukKayitlarListelensin);
  writeNotNull('transfer_DAT_OnayIslemleri', instance.transferDATOnayIslemleri);
  writeNotNull('transfer_DAT_OnayIslemleri_Depolar',
      instance.transferDATOnayIslemleriDepolar);
  writeNotNull(
      'transfer_DAT_EkAlan2Hatirla', instance.transferDATEkAlan2Hatirla);
  writeNotNull(
      'transfer_DAT_EkAlan2Tablodan', instance.transferDATEkAlan2Tablodan);
  writeNotNull('transfer_DAT_LokalDATSeciliGelmesin',
      instance.transferDATLokalDATSeciliGelmesin);
  writeNotNull('transfer_DAT_SeriGirisHarYapabilsin',
      instance.transferDATSeriGirisHarYapabilsin);
  writeNotNull(
      'transfer_DAT_Birim1denKaydet', instance.transferDATBirim1denKaydet);
  writeNotNull('transfer_DAT_Barkod2Sor', instance.transferDATBarkod2Sor);
  writeNotNull('transfer_DAT_BosGecilmeyecekAlanlar',
      instance.transferDATBosGecilmeyecekAlanlar);
  writeNotNull(
      'transfer_DAT_GizlenecekAlanlar', instance.transferDATGizlenecekAlanlar);
  writeNotNull('transfer_DAT_DegismeyecekAlanlar',
      instance.transferDATDegismeyecekAlanlar);
  writeNotNull(
      'transfer_DAT_AciklamaAlanlari', instance.transferDATAciklamaAlanlari);
  writeNotNull(
      'transfer_DAT_SipBagSecenegi', instance.transferDATSipBagSecenegi);
  writeNotNull('transfer_DAT_ReferansStokUygulamasi',
      instance.transferDATReferansStokUygulamasi);
  writeNotNull('transfer_DAT_SipBag_SipHariciKalemEklenebilir',
      instance.transferDATSipBagSipHariciKalemEklenebilir);
  writeNotNull('transfer_DAT_SipBag_FazlaTeslimatYapilabilir',
      instance.transferDATSipBagFazlaTeslimatYapilabilir);
  writeNotNull('transfer_DAT_SipBag_SipOkutulsun',
      instance.transferDATSipBagSipOkutulsun);
  writeNotNull('transfer_DAT_SipBag_SipOkutulsun_Miktar2BazAl',
      instance.transferDATSipBagSipOkutulsunMiktar2BazAl);
  writeNotNull('transfer_DAT_SipBag_SipOkutulsun_KalanMiktarGelsin',
      instance.transferDATSipBagSipOkutulsunKalanMiktarGelsin);
  writeNotNull(
      'transfer_DAT_SipBag_CokluSecim', instance.transferDATSipBagCokluSecim);
  writeNotNull('transfer_DAT_SipBag_TumKalemlerSecilsin',
      instance.transferDATSipBagTumKalemlerSecilsin);
  writeNotNull('transfer_DAT_SipBag_EslesmeDurumu',
      instance.transferDATSipBagEslesmeDurumu);
  writeNotNull('transfer_DAT_SipBag_MalToplananlarGelsin',
      instance.transferDATSipBagMalToplananlarGelsin);
  writeNotNull('transfer_DAT_SipBag_SevkOnayliSiparislerGelsin',
      instance.transferDATSipBagSevkOnayliSiparislerGelsin);
  writeNotNull('transfer_AG', instance.transferAG);
  writeNotNull('transfer_AG_Kaydet', instance.transferAGKaydet);
  writeNotNull('transfer_AG_Duzelt', instance.transferAGDuzelt);
  writeNotNull('transfer_AG_Sil', instance.transferAGSil);
  writeNotNull('transfer_AG_FiyatGor', instance.transferAGFiyatGor);
  writeNotNull('transfer_AG_KacGunlukKayitlarListelensin',
      instance.transferAGKacGunlukKayitlarListelensin);
  writeNotNull('transfer_AG_VarsayilanDepo', instance.transferAGVarsayilanDepo);
  writeNotNull(
      'transfer_AG_DigerSekmesiGoster', instance.transferAGDigerSekmesiGoster);
  writeNotNull('transfer_AG_BelgeKopyala', instance.transferAGBelgeKopyala);
  writeNotNull(
      'transfer_AG_Birim1denKaydet', instance.transferAGBirim1denKaydet);
  writeNotNull('transfer_AG_OtoBasimYap', instance.transferAGOtoBasimYap);
  writeNotNull('transfer_AG_SeriGirisHarYapabilsin',
      instance.transferAGSeriGirisHarYapabilsin);
  writeNotNull('transfer_AG_BarkodluGiris', instance.transferAGBarkodluGiris);
  writeNotNull('transfer_AG_MiktarOtomatikGelsin',
      instance.transferAGMiktarOtomatikGelsin);
  writeNotNull('transfer_AG_KalemDetaySorulmasin',
      instance.transferAGKalemDetaySorulmasin);
  writeNotNull('transfer_AG_StokRehberiAcilmasin',
      instance.transferAGStokRehberiAcilmasin);
  writeNotNull('transfer_AG_KalemDuzeltilemesin',
      instance.transferAGKalemDuzeltilemesin);
  writeNotNull('transfer_AG_KlavyeEngelle', instance.transferAGKlavyeEngelle);
  writeNotNull('transfer_AG_Miktar1Gelsin', instance.transferAGMiktar1Gelsin);
  writeNotNull('transfer_AG_ReferansStokUygulamasi',
      instance.transferAGReferansStokUygulamasi);
  writeNotNull('transfer_AG_SipBag_SipHariciKalemEklenebilir',
      instance.transferAGSipBagSipHariciKalemEklenebilir);
  writeNotNull('transfer_AG_SipBag_FazlaTeslimatYapilabilir',
      instance.transferAGSipBagFazlaTeslimatYapilabilir);
  writeNotNull(
      'transfer_AG_SipBag_SipOkutulsun', instance.transferAGSipBagSipOkutulsun);
  writeNotNull('transfer_AG_SipBag_SipOkutulsun_Miktar2BazAl',
      instance.transferAGSipBagSipOkutulsunMiktar2BazAl);
  writeNotNull(
      'transfer_AG_SipBag_CokluSecim', instance.transferAGSipBagCokluSecim);
  writeNotNull('transfer_AG_SipBag_TumKalemlerSecilsin',
      instance.transferAGSipBagTumKalemlerSecilsin);
  writeNotNull('transfer_AG_SipBag_EslesmeDurumu',
      instance.transferAGSipBagEslesmeDurumu);
  writeNotNull('transfer_AG_SipBag_MalToplananlarGelsin',
      instance.transferAGSipBagMalToplananlarGelsin);
  writeNotNull('transfer_AG_SipBag_SevkOnayliSiparislerGelsin',
      instance.transferAGSipBagSevkOnayliSiparislerGelsin);
  writeNotNull('transfer_AC', instance.transferAC);
  writeNotNull('transfer_AC_Kaydet', instance.transferACKaydet);
  writeNotNull('transfer_AC_Duzelt', instance.transferACDuzelt);
  writeNotNull('transfer_AC_Sil', instance.transferACSil);
  writeNotNull('transfer_AC_FiyatGor', instance.transferACFiyatGor);
  writeNotNull('transfer_AC_KacGunlukKayitlarListelensin',
      instance.transferACKacGunlukKayitlarListelensin);
  writeNotNull('transfer_AC_VarsayilanDepo', instance.transferACVarsayilanDepo);
  writeNotNull('transfer_AC_eIrsIsaretleyemesin',
      instance.transferACEIrsIsaretleyemesin);
  writeNotNull(
      'transfer_AC_DigerSekmesiGoster', instance.transferACDigerSekmesiGoster);
  writeNotNull('transfer_AC_BelgeKopyala', instance.transferACBelgeKopyala);
  writeNotNull(
      'transfer_AC_Birim1denKaydet', instance.transferACBirim1denKaydet);
  writeNotNull('transfer_AC_OtoBasimYap', instance.transferACOtoBasimYap);
  writeNotNull('transfer_AC_SeriGirisHarYapabilsin',
      instance.transferACSeriGirisHarYapabilsin);
  writeNotNull(
      'transfer_AC_EkAlan2Tablodan', instance.transferACEkAlan2Tablodan);
  writeNotNull('transfer_AC_EkAlan2Hatirla', instance.transferACEkAlan2Hatirla);
  writeNotNull(
      'transfer_AC_MinStokMikGoster', instance.transferACMinStokMikGoster);
  writeNotNull('transfer_AC_BosGecilmeyecekAlanlar',
      instance.transferACBosGecilmeyecekAlanlar);
  writeNotNull('transfer_AC_BarkodluGiris', instance.transferACBarkodluGiris);
  writeNotNull('transfer_AC_MiktarOtomatikGelsin',
      instance.transferACMiktarOtomatikGelsin);
  writeNotNull('transfer_AC_KalemDetaySorulmasin',
      instance.transferACKalemDetaySorulmasin);
  writeNotNull('transfer_AC_StokRehberiAcilmasin',
      instance.transferACStokRehberiAcilmasin);
  writeNotNull('transfer_AC_KalemDuzeltilemesin',
      instance.transferACKalemDuzeltilemesin);
  writeNotNull('transfer_AC_KlavyeEngelle', instance.transferACKlavyeEngelle);
  writeNotNull('transfer_AC_Miktar1Gelsin', instance.transferACMiktar1Gelsin);
  writeNotNull('transfer_AC_ReferansStokUygulamasi',
      instance.transferACReferansStokUygulamasi);
  writeNotNull('transfer_AC_SipBag_SipHariciKalemEklenebilir',
      instance.transferACSipBagSipHariciKalemEklenebilir);
  writeNotNull('transfer_AC_SipBag_FazlaTeslimatYapilabilir',
      instance.transferACSipBagFazlaTeslimatYapilabilir);
  writeNotNull(
      'transfer_AC_SipBag_SipOkutulsun', instance.transferACSipBagSipOkutulsun);
  writeNotNull('transfer_AC_SipBag_SipOkutulsun_Miktar2BazAl',
      instance.transferACSipBagSipOkutulsunMiktar2BazAl);
  writeNotNull(
      'transfer_AC_SipBag_CokluSecim', instance.transferACSipBagCokluSecim);
  writeNotNull('transfer_AC_SipBag_TumKalemlerSecilsin',
      instance.transferACSipBagTumKalemlerSecilsin);
  writeNotNull('transfer_AC_SipBag_EslesmeDurumu',
      instance.transferACSipBagEslesmeDurumu);
  writeNotNull('transfer_AC_SipBag_MalToplananlarGelsin',
      instance.transferACSipBagMalToplananlarGelsin);
  writeNotNull('transfer_AC_SipBag_SevkOnayliSiparislerGelsin',
      instance.transferACSipBagSevkOnayliSiparislerGelsin);
  writeNotNull('transfer_DepoTalebi', instance.transferDepoTalebi);
  writeNotNull('transfer_DepoTalebi_Sil', instance.transferDepoTalebiSil);
  writeNotNull('transfer_DepoTalebi_MalTop', instance.transferDepoTalebiMalTop);
  writeNotNull('transfer_DepoTalebi_MalTop_FazlaTeslimat',
      instance.transferDepoTalebiMalTopFazlaTeslimat);
  writeNotNull(
      'hucre_GiristeHucreYerlestir', instance.hucreGiristeHucreYerlestir);
  writeNotNull(
      'hucre_CikistaHucreYerlestir', instance.hucreCikistaHucreYerlestir);
  writeNotNull('hucre_Yerlestir', instance.hucreYerlestir);
  writeNotNull('hucre_YerlestirBelgesiz', instance.hucreYerlestirBelgesiz);
  writeNotNull(
      'hucre_Yerlestir_KlavyeEngelle', instance.hucreYerlestirKlavyeEngelle);
  writeNotNull('hucre_Yerlestir_RehberdenStokSecilmesin',
      instance.hucreYerlestirRehberdenStokSecilmesin);
  writeNotNull(
      'hucre_Yerlestir_HangiHucrede', instance.hucreYerlestirHangiHucrede);
  writeNotNull(
      'hucre_Yerlestir_BelgeTipleri', instance.hucreYerlestirBelgeTipleri);
  writeNotNull('hucre_Bosalt', instance.hucreBosalt);
  writeNotNull('hucre_BosaltBelgesiz', instance.hucreBosaltBelgesiz);
  writeNotNull('hucre_Bosalt_KlavyeEngelle', instance.hucreBosaltKlavyeEngelle);
  writeNotNull('hucre_Bosalt_RehberdenStokSecilmesin',
      instance.hucreBosaltRehberdenStokSecilmesin);
  writeNotNull('hucre_Bosalt_HangiHucrede', instance.hucreBosaltHangiHucrede);
  writeNotNull('hucre_Bosalt_BelgeTipleri', instance.hucreBosaltBelgeTipleri);
  writeNotNull('hucre_Arama', instance.hucreArama);
  writeNotNull('hucre_AramaTumDepolar', instance.hucreAramaTumDepolar);
  writeNotNull('hucre_AramaOzelFonksiyon', instance.hucreAramaOzelFonksiyon);
  writeNotNull('hucre_Transfer', instance.hucreTransfer);
  writeNotNull(
      'hucre_Transfer_KlavyeEngelle', instance.hucreTransferKlavyeEngelle);
  writeNotNull('hucre_Transfer_RehberdenStokSecilmesin',
      instance.hucreTransferRehberdenStokSecilmesin);
  writeNotNull(
      'hucre_Transfer_BelgeTipleri', instance.hucreTransferBelgeTipleri);
  writeNotNull('hucre_Listesi', instance.hucreListesi);
  writeNotNull('hucre_Bosalt_OtomatikStokEtiketiYazdir',
      instance.hucreBosaltOtomatikStokEtiketiYazdir);
  writeNotNull('hucre_BakiyeDurumu', instance.hucreBakiyeDurumu);
  writeNotNull('hucre_Hareketleri', instance.hucreHareketleri);
  writeNotNull('hucre_Hareketleri_Sil', instance.hucreHareketleriSil);
  writeNotNull('sevkiyat_SatisIrsaliyesi_BelgeTipleri',
      instance.sevkiyatSatisIrsaliyesiBelgeTipleri);
  writeNotNull('sevkiyat_SatisIrsaliyesi_GizlenecekAlanlar',
      instance.sevkiyatSatisIrsaliyesiGizlenecekAlanlar);
  writeNotNull('sevkiyat_SatisIrsaliyesi_DegismeyecekAlanlar',
      instance.sevkiyatSatisIrsaliyesiDegismeyecekAlanlar);
  writeNotNull('sevkiyat_SatisIrsaliyesi', instance.sevkiyatSatisIrsaliyesi);
  writeNotNull(
      'sevkiyat_SatisIrsaliyesiKayit', instance.sevkiyatSatisIrsaliyesiKayit);
  writeNotNull('sevkiyat_SatisIrsaliyesiDuzeltme',
      instance.sevkiyatSatisIrsaliyesiDuzeltme);
  writeNotNull(
      'sevkiyat_SatisIrsaliyesiSilme', instance.sevkiyatSatisIrsaliyesiSilme);
  writeNotNull('sevkiyat_SatisIrsaliyesiFiyatGor',
      instance.sevkiyatSatisIrsaliyesiFiyatGor);
  writeNotNull('sevkiyat_SatisIrs_DigerSekmesiGoster',
      instance.sevkiyatSatisIrsDigerSekmesiGoster);
  writeNotNull('sevkiyat_SatisIrsaliyesi_SipBagSecenegi',
      instance.sevkiyatSatisIrsaliyesiSipBagSecenegi);
  writeNotNull('sevkiyat_SatisIrs_ReferansStokUygulamasi',
      instance.sevkiyatSatisIrsReferansStokUygulamasi);
  writeNotNull('sevkiyat_SatisIrs_SipBag_SipHariciKalemEklenebilir',
      instance.sevkiyatSatisIrsSipBagSipHariciKalemEklenebilir);
  writeNotNull('sevkiyat_SatisIrs_SipBag_FazlaTeslimatYapilabilir',
      instance.sevkiyatSatisIrsSipBagFazlaTeslimatYapilabilir);
  writeNotNull('sevkiyat_SatisIrs_SipBag_SipOkutulsun',
      instance.sevkiyatSatisIrsSipBagSipOkutulsun);
  writeNotNull('sevkiyat_SatisIrs_SipBag_SipOkutulsun_Miktar2BazAl',
      instance.sevkiyatSatisIrsSipBagSipOkutulsunMiktar2BazAl);
  writeNotNull('sevkiyat_SatisIrs_SipBag_SipOkutulsun_KalanMiktarGelsin',
      instance.sevkiyatSatisIrsSipBagSipOkutulsunKalanMiktarGelsin);
  writeNotNull('sevkiyat_SatisIrs_SipBag_CokluSecim',
      instance.sevkiyatSatisIrsSipBagCokluSecim);
  writeNotNull('sevkiyat_SatisIrs_SipBag_TumKalemlerSecilsin',
      instance.sevkiyatSatisIrsSipBagTumKalemlerSecilsin);
  writeNotNull('sevkiyat_SatisIrs_SipBag_EslesmeDurumu',
      instance.sevkiyatSatisIrsSipBagEslesmeDurumu);
  writeNotNull('sevkiyat_SatisIrs_SipBag_MalToplananlarGelsin',
      instance.sevkiyatSatisIrsSipBagMalToplananlarGelsin);
  writeNotNull('sevkiyat_SatisIrs_SipBag_SevkOnayliSiparislerGelsin',
      instance.sevkiyatSatisIrsSipBagSevkOnayliSiparislerGelsin);
  writeNotNull(
      'sevkiyat_FiyatDegistirilmesin', instance.sevkiyatFiyatDegistirilmesin);
  writeNotNull('sevkiyat_SatisIrsaliyesi_EIrsaliyeDuzenleyemesin',
      instance.sevkiyatSatisIrsaliyesiEIrsaliyeDuzenleyemesin);
  writeNotNull('sevkiyat_SatisIrs_KalemlerBirlestirilsin',
      instance.sevkiyatSatisIrsKalemlerBirlestirilsin);
  writeNotNull(
      'sevkiyat_SatisIrs_OtoBasimYap', instance.sevkiyatSatisIrsOtoBasimYap);
  writeNotNull('sevkiyat_SatisIrs_KacGunlukKayitlarListelensin',
      instance.sevkiyatSatisIrsKacGunlukKayitlarListelensin);
  writeNotNull(
      'sevkiyat_SatisIrs_FiyatSirasi', instance.sevkiyatSatisIrsFiyatSirasi);
  writeNotNull('sevkiyat_SatisIrs_KDVSifirGelsin',
      instance.sevkiyatSatisIrsKDVSifirGelsin);
  writeNotNull('sevkiyat_SatisIrs_SeriGirisHarYapabilsin',
      instance.sevkiyatSatisIrsSeriGirisHarYapabilsin);
  writeNotNull('sevkiyat_SatisIrs_Birim1denKaydet',
      instance.sevkiyatSatisIrsBirim1denKaydet);
  writeNotNull('sevkiyat_SatisIrs_EkAlan2Tablodan',
      instance.sevkiyatSatisIrsEkAlan2Tablodan);
  writeNotNull('sevkiyat_SatisIrs_EkAlan2Hatirla',
      instance.sevkiyatSatisIrsEkAlan2Hatirla);
  writeNotNull(
      'sevkiyat_SatisIrs_OlcuBirimi', instance.sevkiyatSatisIrsOlcuBirimi);
  writeNotNull('sevkiyat_SatisIrs_CariKoduDegistir',
      instance.sevkiyatSatisIrsCariKoduDegistir);
  writeNotNull('sevkiyat_SatisIrs_MaxIskUygulamasi',
      instance.sevkiyatSatisIrsMaxIskUygulamasi);
  writeNotNull(
      'sevkiyat_SatisIrs_MaxSatIsk1', instance.sevkiyatSatisIrsMaxSatIsk1);
  writeNotNull(
      'sevkiyat_SatisIrs_MaxSatIsk2', instance.sevkiyatSatisIrsMaxSatIsk2);
  writeNotNull(
      'sevkiyat_SatisIrs_MaxSatIsk3', instance.sevkiyatSatisIrsMaxSatIsk3);
  writeNotNull(
      'sevkiyat_SatisIrs_MaxSatIsk4', instance.sevkiyatSatisIrsMaxSatIsk4);
  writeNotNull(
      'sevkiyat_SatisIrs_MaxSatIsk5', instance.sevkiyatSatisIrsMaxSatIsk5);
  writeNotNull(
      'sevkiyat_SatisIrs_MaxSatIsk6', instance.sevkiyatSatisIrsMaxSatIsk6);
  writeNotNull(
      'sevkiyat_SatisIrs_MaxGenIsk1', instance.sevkiyatSatisIrsMaxGenIsk1);
  writeNotNull(
      'sevkiyat_SatisIrs_MaxGenIsk2', instance.sevkiyatSatisIrsMaxGenIsk2);
  writeNotNull(
      'sevkiyat_SatisIrs_MaxGenIsk3', instance.sevkiyatSatisIrsMaxGenIsk3);
  writeNotNull('sevkiyat_SatisIrs_DipFiyatUygulamasi',
      instance.sevkiyatSatisIrsDipFiyatUygulamasi);
  writeNotNull(
      'sevkiyat_SatisIrs_DipFiyatSaha', instance.sevkiyatSatisIrsDipFiyatSaha);
  writeNotNull('sevkiyat_SatisIrs_DipFiyatEylem',
      instance.sevkiyatSatisIrsDipFiyatEylem);
  writeNotNull('sevkiyat_SatisIrs_DipFiyatKDVDurumu',
      instance.sevkiyatSatisIrsDipFiyatKDVDurumu);
  writeNotNull('sevkiyat_SatisIrs_BarkodluGiris',
      instance.sevkiyatSatisIrsBarkodluGiris);
  writeNotNull('sevkiyat_SatisIrs_MiktarOtomatikGelsin',
      instance.sevkiyatSatisIrsMiktarOtomatikGelsin);
  writeNotNull('sevkiyat_SatisIrs_KalemDetaySorulmasin',
      instance.sevkiyatSatisIrsKalemDetaySorulmasin);
  writeNotNull('sevkiyat_SatisIrs_StokRehberiAcilmasin',
      instance.sevkiyatSatisIrsStokRehberiAcilmasin);
  writeNotNull('sevkiyat_SatisIrs_KalemDuzeltilemesin',
      instance.sevkiyatSatisIrsKalemDuzeltilemesin);
  writeNotNull('sevkiyat_SatisIrs_KlavyeEngelle',
      instance.sevkiyatSatisIrsKlavyeEngelle);
  writeNotNull('sevkiyat_SatisIrs_Miktar1Gelsin',
      instance.sevkiyatSatisIrsMiktar1Gelsin);
  writeNotNull('sevkiyat_SatisIrs_BakiyesizStokSecilmesin',
      instance.sevkiyatSatisIrsBakiyesizStokSecilmesin);
  writeNotNull('sevkiyat_SatisIrs_Raporlar', instance.sevkiyatSatisIrsRaporlar);
  writeNotNull(
      'sevkiyat_SatisIrs_KalemRaporu', instance.sevkiyatSatisIrsKalemRaporu);
  writeNotNull(
      'sevkiyat_SatisFat_BelgeTipleri', instance.sevkiyatSatisFatBelgeTipleri);
  writeNotNull('sevkiyat_SatisFat_VarsayilanBelgeTipi',
      instance.sevkiyatSatisFatVarsayilanBelgeTipi);
  writeNotNull('sevkiyat_SatisFat', instance.sevkiyatSatisFat);
  writeNotNull('sevkiyat_SatisFat_Kaydet', instance.sevkiyatSatisFatKaydet);
  writeNotNull('sevkiyat_SatisFat_Duzelt', instance.sevkiyatSatisFatDuzelt);
  writeNotNull('sevkiyat_SatisFat_Sil', instance.sevkiyatSatisFatSil);
  writeNotNull('sevkiyat_SatisFat_ToplamlarCariTahsilatIslemleri',
      instance.sevkiyatSatisFatToplamlarCariTahsilatIslemleri);
  writeNotNull('sevkiyat_SatisFat_KayittanSonraTaslakOlustur',
      instance.sevkiyatSatisFatKayittanSonraTaslakOlustur);
  writeNotNull('sevkiyat_SatisFat_OtomatikBasimYap',
      instance.sevkiyatSatisFatOtomatikBasimYap);
  writeNotNull('sevkiyat_SatisFat_DigerSekmesiGoster',
      instance.sevkiyatSatisFatDigerSekmesiGoster);
  writeNotNull('sevkiyat_SatisFat_FiyatDegistirilmesin',
      instance.sevkiyatSatisFatFiyatDegistirilmesin);
  writeNotNull('sevkiyat_SatisFat_KacGunlukKayitlarListelensin',
      instance.sevkiyatSatisFatKacGunlukKayitlarListelensin);
  writeNotNull(
      'sevkiyat_SatisFat_FiyatSirasi', instance.sevkiyatSatisFatFiyatSirasi);
  writeNotNull('sevkiyat_SatisFat_KalemlerBirlestirilsin',
      instance.sevkiyatSatisFatKalemlerBirlestirilsin);
  writeNotNull('sevkiyat_SatisFat_Birim1denKaydet',
      instance.sevkiyatSatisFatBirim1denKaydet);
  writeNotNull('sevkiyat_SatisFat_EkAlan2Tablodan',
      instance.sevkiyatSatisFatEkAlan2Tablodan);
  writeNotNull('sevkiyat_SatisFat_EkAlan2Hatirla',
      instance.sevkiyatSatisFatEkAlan2Hatirla);
  writeNotNull('sevkiyat_SatisFat_Filtre', instance.sevkiyatSatisFatFiltre);
  writeNotNull(
      'sevkiyat_SatisFat_FiltreSQL', instance.sevkiyatSatisFatFiltreSQL);
  writeNotNull(
      'sevkiyat_SatisFat_OlcuBirimi', instance.sevkiyatSatisFatOlcuBirimi);
  writeNotNull('sevkiyat_SatisFat_AciklamaAlanlari',
      instance.sevkiyatSatisFatAciklamaAlanlari);
  writeNotNull('sevkiyat_SatisFat_BosGecilmeyecekAlanlar',
      instance.sevkiyatSatisFatBosGecilmeyecekAlanlar);
  writeNotNull('sevkiyat_SatisFat_GizlenecekAlanlar',
      instance.sevkiyatSatisFatGizlenecekAlanlar);
  writeNotNull('sevkiyat_SatisFat_DegismeyecekAlanlar',
      instance.sevkiyatSatisFatDegismeyecekAlanlar);
  writeNotNull('sevkiyat_SatisFat_SeriGirisHarYapabilsin',
      instance.sevkiyatSatisFatSeriGirisHarYapabilsin);
  writeNotNull('sevkiyat_SatisFat_CariKoduDegistir',
      instance.sevkiyatSatisFatCariKoduDegistir);
  writeNotNull('sevkiyat_SatisFaturasi_SipBagSecenegi',
      instance.sevkiyatSatisFaturasiSipBagSecenegi);
  writeNotNull('sevkiyat_SatisFat_ReferansStokUygulamasi',
      instance.sevkiyatSatisFatReferansStokUygulamasi);
  writeNotNull('sevkiyat_SatisFat_SipBag_SipHariciKalemEklenebilir',
      instance.sevkiyatSatisFatSipBagSipHariciKalemEklenebilir);
  writeNotNull('sevkiyat_SatisFat_SipBag_FazlaTeslimatYapilabilir',
      instance.sevkiyatSatisFatSipBagFazlaTeslimatYapilabilir);
  writeNotNull('sevkiyat_SatisFat_SipBag_SipOkutulsun',
      instance.sevkiyatSatisFatSipBagSipOkutulsun);
  writeNotNull('sevkiyat_SatisFat_SipBag_SipOkutulsun_Miktar2BazAl',
      instance.sevkiyatSatisFatSipBagSipOkutulsunMiktar2BazAl);
  writeNotNull('sevkiyat_SatisFat_SipBag_CokluSecim',
      instance.sevkiyatSatisFatSipBagCokluSecim);
  writeNotNull('sevkiyat_SatisFat_SipBag_TumKalemlerSecilsin',
      instance.sevkiyatSatisFatSipBagTumKalemlerSecilsin);
  writeNotNull('sevkiyat_SatisFat_SipBag_EslesmeDurumu',
      instance.sevkiyatSatisFatSipBagEslesmeDurumu);
  writeNotNull('sevkiyat_SatisFat_SipBag_SevkOnayliSiparislerGelsin',
      instance.sevkiyatSatisFatSipBagSevkOnayliSiparislerGelsin);
  writeNotNull('sevkiyat_SatisFat_BarkodluGiris',
      instance.sevkiyatSatisFatBarkodluGiris);
  writeNotNull('sevkiyat_SatisFaturasi_MiktarOtomatikGelsin',
      instance.sevkiyatSatisFaturasiMiktarOtomatikGelsin);
  writeNotNull('sevkiyat_SatisFaturasi_KalemDetaySorulmasin',
      instance.sevkiyatSatisFaturasiKalemDetaySorulmasin);
  writeNotNull('sevkiyat_SatisFat_BarkodSayisiSaklanacakAlan',
      instance.sevkiyatSatisFatBarkodSayisiSaklanacakAlan);
  writeNotNull('sevkiyat_SatisFat_StokRehberiAcilmasin',
      instance.sevkiyatSatisFatStokRehberiAcilmasin);
  writeNotNull('sevkiyat_SatisFat_KalemDuzeltilemesin',
      instance.sevkiyatSatisFatKalemDuzeltilemesin);
  writeNotNull('sevkiyat_SatisFat_KlavyeEngelle',
      instance.sevkiyatSatisFatKlavyeEngelle);
  writeNotNull('sevkiyat_SatisFat_Miktar1Gelsin',
      instance.sevkiyatSatisFatMiktar1Gelsin);
  writeNotNull('sevkiyat_SatisFat_BakiyesizStokSecilmesin',
      instance.sevkiyatSatisFatBakiyesizStokSecilmesin);
  writeNotNull('sevkiyat_SatisFat_Raporlar', instance.sevkiyatSatisFatRaporlar);
  writeNotNull(
      'sevkiyat_SatisFat_KalemRaporu', instance.sevkiyatSatisFatKalemRaporu);
  writeNotNull('sevkiyat_SatisFat_KarlilikRaporu',
      instance.sevkiyatSatisFatKarlilikRaporu);
  writeNotNull('sevkiyat_SatisFat_MaxIskUygulamasi',
      instance.sevkiyatSatisFatMaxIskUygulamasi);
  writeNotNull(
      'sevkiyat_SatisFat_MaxSatIsk1', instance.sevkiyatSatisFatMaxSatIsk1);
  writeNotNull(
      'sevkiyat_SatisFat_MaxSatIsk2', instance.sevkiyatSatisFatMaxSatIsk2);
  writeNotNull(
      'sevkiyat_SatisFat_MaxSatIsk3', instance.sevkiyatSatisFatMaxSatIsk3);
  writeNotNull(
      'sevkiyat_SatisFat_MaxSatIsk4', instance.sevkiyatSatisFatMaxSatIsk4);
  writeNotNull(
      'sevkiyat_SatisFat_MaxSatIsk5', instance.sevkiyatSatisFatMaxSatIsk5);
  writeNotNull(
      'sevkiyat_SatisFat_MaxSatIsk6', instance.sevkiyatSatisFatMaxSatIsk6);
  writeNotNull(
      'sevkiyat_SatisFat_MaxGenIsk1', instance.sevkiyatSatisFatMaxGenIsk1);
  writeNotNull(
      'sevkiyat_SatisFat_MaxGenIsk2', instance.sevkiyatSatisFatMaxGenIsk2);
  writeNotNull(
      'sevkiyat_SatisFat_MaxGenIsk3', instance.sevkiyatSatisFatMaxGenIsk3);
  writeNotNull('sevkiyat_SatisFat_DipFiyatUygulamasi',
      instance.sevkiyatSatisFatDipFiyatUygulamasi);
  writeNotNull(
      'sevkiyat_SatisFat_DipFiyatSaha', instance.sevkiyatSatisFatDipFiyatSaha);
  writeNotNull('sevkiyat_SatisFat_DipFiyatEylem',
      instance.sevkiyatSatisFatDipFiyatEylem);
  writeNotNull('sevkiyat_SatisFat_DipFiyatKDVDurumu',
      instance.sevkiyatSatisFatDipFiyatKDVDurumu);
  writeNotNull('sevkiyat_SatisIrsaliyesiSiparissiz',
      instance.sevkiyatSatisIrsaliyesiSiparissiz);
  writeNotNull('sevkiyat_SatisIrsaliyesiSiparissizFiyatGor',
      instance.sevkiyatSatisIrsaliyesiSiparissizFiyatGor);
  writeNotNull(
      'sevkiyat_SatisIrsaliyesiIade', instance.sevkiyatSatisIrsaliyesiIade);
  writeNotNull('sevkiyat_SiptenMalTop', instance.sevkiyatSiptenMalTop);
  writeNotNull('sevkiyat_SiptenMalTop_MiktarBarkoddanGelsin',
      instance.sevkiyatSiptenMalTopMiktarBarkoddanGelsin);
  writeNotNull('sevkiyat_SiptenMalTop_RehberdenStokSecilmesin',
      instance.sevkiyatSiptenMalTopRehberdenStokSecilmesin);
  writeNotNull('sevkiyat_SiptenMalTop_KlavyedenBarkodGirilmesin',
      instance.sevkiyatSiptenMalTopKlavyedenBarkodGirilmesin);
  writeNotNull('sevkiyat_SiptenMalTop_SevkOnayliSiparislerGelsin',
      instance.sevkiyatSiptenMalTopSevkOnayliSiparislerGelsin);
  writeNotNull('sevkiyat_SiptenMalTop_KacGunlukKayitlarListelensin',
      instance.sevkiyatSiptenMalTopKacGunlukKayitlarListelensin);
  writeNotNull('sevkemri_MalToplama', instance.sevkemriMalToplama);
  writeNotNull(
      'sevkemri_MalToplamaAtanabilir', instance.sevkemriMalToplamaAtanabilir);
  writeNotNull(
      'sevkemri_MalToplamaAtayabilir', instance.sevkemriMalToplamaAtayabilir);
  writeNotNull('sevkemri_UrunDegistir', instance.sevkemriUrunDegistir);
  writeNotNull('sevkemri_MiktarDegistir', instance.sevkemriMiktarDegistir);
  writeNotNull('sevkemri_MuadilUrun', instance.sevkemriMuadilUrun);
  writeNotNull('sevkemri_malToplama_BarkodsuzUrunListedenSecilsin',
      instance.sevkemriMalToplamaBarkodsuzUrunListedenSecilsin);
  writeNotNull('sevkemri_MalToplama_OtoStokEtiketiYazdir',
      instance.sevkemriMalToplamaOtoStokEtiketiYazdir);
  writeNotNull('sevkemri_MalToplama_OtoStokEtiketiYazdirSor',
      instance.sevkemriMalToplamaOtoStokEtiketiYazdirSor);
  writeNotNull('sevkemri_MalToplama_KlavyedenGirisiEngelle',
      instance.sevkemriMalToplamaKlavyedenGirisiEngelle);
  writeNotNull(
      'sevkemri_MalToplama_Barkod2Sor', instance.sevkemriMalToplamaBarkod2Sor);
  writeNotNull('sevkemri_MalToplama_Barkod2_YildizliGorunsun',
      instance.sevkemriMalToplamaBarkod2YildizliGorunsun);
  writeNotNull('sevkemri_MalToplama_Barkod2KalemEkranindaSor',
      instance.sevkemriMalToplamaBarkod2KalemEkranindaSor);
  writeNotNull('sevkemri_MalToplama_TumuToplanmadanTamamlanmasin',
      instance.sevkemriMalToplamaTumuToplanmadanTamamlanmasin);
  writeNotNull('sevkemri_MalToplama_HangiHucredeGoster',
      instance.sevkemriMalToplamaHangiHucredeGoster);
  writeNotNull('sevkemri_MalToplama_KalemDetayIslemOnaySormasin',
      instance.sevkemriMalToplamaKalemDetayIslemOnaySormasin);
  writeNotNull('sevkemri_MalToplama_GosterilecekEkBilgiler',
      instance.sevkemriMalToplamaGosterilecekEkBilgiler);
  writeNotNull('sevkemri_MalToplama_DegistirilemeyecekAlanlar',
      instance.sevkemriMalToplamaDegistirilemeyecekAlanlar);
  writeNotNull('sevkemri_MalToplama_GizlenecekAlanlar',
      instance.sevkemriMalToplamaGizlenecekAlanlar);
  writeNotNull('sevkemri_MalToplama_MiktarBarkoddan',
      instance.sevkemriMalToplamaMiktarBarkoddan);
  writeNotNull('sevkemri_MalToplama_KalemDetayiSorulmasin',
      instance.sevkemriMalToplamaKalemDetayiSorulmasin);
  writeNotNull('sevkemri_MalToplama_KalemDetayaUlasamasin',
      instance.sevkemriMalToplamaKalemDetayaUlasamasin);
  writeNotNull('sevkemri_MalToplama_FazlaTeslimat',
      instance.sevkemriMalToplamaFazlaTeslimat);
  writeNotNull('sevkemri_MalToplama_VarsayilanOlcuBirimi',
      instance.sevkemriMalToplamaVarsayilanOlcuBirimi);
  writeNotNull('sevkemri_MalToplama_SiralamaTipi',
      instance.sevkemriMalToplamaSiralamaTipi);
  writeNotNull('sevkemri_MalKontrol', instance.sevkemriMalKontrol);
  writeNotNull('sevkemri_MalKontrol_KlavyeEngelle',
      instance.sevkemriMalKontrolKlavyeEngelle);
  writeNotNull(
      'sevkemri_MalKontrolTipi', instance.sevkemriMalKontrolTipi?.toJson());
  writeNotNull('sevkemri_MalKontrolKullanicilar',
      instance.sevkemriMalKontrolKullanicilar);
  writeNotNull('sevkemri_Paketleme', instance.sevkemriPaketleme);
  writeNotNull('sevkemri_Paketleme_KlavyeEngelle',
      instance.sevkemriPaketlemeKlavyeEngelle);
  writeNotNull('sevkemri_Paketleme_BarkodOkutmayaZorla',
      instance.sevkemriPaketlemeBarkodOkutmayaZorla);
  writeNotNull('sevkemri_Paketleme_BarkodsuzUrunListedenSecilsin',
      instance.sevkemriPaketlemeBarkodsuzUrunListedenSecilsin);
  writeNotNull('sevkemri_AracYukleme', instance.sevkemriAracYukleme);
  writeNotNull('sevkemri_AracYukleme_KlavyeEngelle',
      instance.sevkemriAracYuklemeKlavyeEngelle);
  writeNotNull('sevkemri_AracBosaltma', instance.sevkemriAracBosaltma);
  writeNotNull('sevkemri_AracBosaltma_KlavyeEngelle',
      instance.sevkemriAracBosaltmaKlavyeEngelle);
  writeNotNull('sevkemri_DepodanTeslimat', instance.sevkemriDepodanTeslimat);
  writeNotNull('sevkemri_DepodanTeslimat_KlavyeEngelle',
      instance.sevkemriDepodanTeslimatKlavyeEngelle);
  writeNotNull('sayim_sayim', instance.sayimSayim);
  writeNotNull('sayim_Kontrol_Miktari', instance.sayimKontrolMiktari);
  writeNotNull(
      'sayim_MiktarBarkoddanGelsin', instance.sayimMiktarBarkoddanGelsin);
  writeNotNull('sayim_AyniStokDurumu', instance.sayimAyniStokDurumu);
  writeNotNull('sayim_Miktar1Gelsin', instance.sayimMiktar1Gelsin);
  writeNotNull('sayim_HemenKaydet', instance.sayimHemenKaydet);
  writeNotNull('sayim_CarpanAktif', instance.sayimCarpanAktif);
  writeNotNull('sayim_SeriMikGirilenMikKabulEdilsin',
      instance.sayimSeriMikGirilenMikKabulEdilsin);
  writeNotNull(
      'sayim_DigerKulSayimHarGorsun', instance.sayimDigerKulSayimHarGorsun);
  writeNotNull(
      'sayim_DigerKulSayimFisGorsun', instance.sayimDigerKulSayimFisGorsun);
  writeNotNull('sayim_Serbest', instance.sayimSerbest);
  writeNotNull('sayim_Serbest_Sil', instance.sayimSerbestSil);
  writeNotNull('sayim_DepoFarkRaporu', instance.sayimDepoFarkRaporu);
  writeNotNull(
      'sayim_BelgeBaglantisiniKopar', instance.sayimBelgeBaglantisiniKopar);
  writeNotNull('sayim_BelgeOlusturabilir', instance.sayimBelgeOlusturabilir);
  writeNotNull('sayim_EkAlanlar', instance.sayimEkAlanlar);
  writeNotNull('sayim_DegismeyecekAlanlar', instance.sayimDegismeyecekAlanlar);
  writeNotNull('sayim_GizlenecekAlanlar', instance.sayimGizlenecekAlanlar);
  writeNotNull(
      'sayim_VarsayilanOlcuBirimi', instance.sayimVarsayilanOlcuBirimi);
  writeNotNull('sayim_Raporu', instance.sayimRaporu);
  writeNotNull('paket_Olustur', instance.paketOlustur);
  writeNotNull('paket_CokluOlustur', instance.paketCokluOlustur);
  writeNotNull('paket_Kontrol', instance.paketKontrol);
  writeNotNull('paket_MalzemeCikisi', instance.paketMalzemeCikisi);
  writeNotNull('paket_ReceteyiFiltrele', instance.paketReceteyiFiltrele);
  writeNotNull('islemler_HucreEtiket', instance.islemlerHucreEtiket);
  writeNotNull('islemler_StokEtiket', instance.islemlerStokEtiket);
  writeNotNull('islemler_BarkodTanimlama', instance.islemlerBarkodTanimlama);
  writeNotNull('siparis_MusteriSiparisi', instance.siparisMusteriSiparisi);
  writeNotNull(
      'siparis_MusteriSiparisi_Kaydet', instance.siparisMusteriSiparisiKaydet);
  writeNotNull(
      'siparis_MusteriSiparisi_Duzelt', instance.siparisMusteriSiparisiDuzelt);
  writeNotNull(
      'siparis_MusteriSiparisi_Sil', instance.siparisMusteriSiparisiSil);
  writeNotNull('siparis_MusteriSiparisi_KapalilarListelenmesin',
      instance.siparisMusteriSiparisiKapalilarListelenmesin);
  writeNotNull('siparis_MusteriSiparisi_FiyatDegistirilmesin',
      instance.siparisMusteriSiparisiFiyatDegistirilmesin);
  writeNotNull('siparis_MusteriSiparisi_FiyatSirasi',
      instance.siparisMusteriSiparisiFiyatSirasi);
  writeNotNull(
      'siparis_MusSip_Birim1denKaydet', instance.siparisMusSipBirim1denKaydet);
  writeNotNull('siparis_MusteriSiparisi_KapatmaIslemi',
      instance.siparisMusteriSiparisiKapatmaIslemi);
  writeNotNull(
      'siparis_MusSip_OnayIslemleri', instance.siparisMusSipOnayIslemleri);
  writeNotNull('siparis_MusSip_StokIhtiyacRaporu',
      instance.siparisMusSipStokIhtiyacRaporu);
  writeNotNull('siparis_MusteriSiparisi_SonFiyatGoster',
      instance.siparisMusteriSiparisiSonFiyatGoster);
  writeNotNull('siparis_MusSip_DigerSekmesiGoster',
      instance.siparisMusSipDigerSekmesiGoster);
  writeNotNull(
      'siparis_MusSip_EkAlan2Tablodan', instance.siparisMusSipEkAlan2Tablodan);
  writeNotNull(
      'siparis_MusSip_EkAlan2Hatirla', instance.siparisMusSipEkAlan2Hatirla);
  writeNotNull(
      'siparis_MusSip_Miktar1Gelsin', instance.siparisMusSipMiktar1Gelsin);
  writeNotNull('siparis_MusSip_BosGecilmeyecekAlanlar',
      instance.siparisMusSipBosGecilmeyecekAlanlar);
  writeNotNull('siparis_MusSip_OtoPdfGor', instance.siparisMusSipOtoPdfGor);
  writeNotNull('siparis_MusSip_CariKoduDegistir',
      instance.siparisMusSipCariKoduDegistir);
  writeNotNull('siparis_MusteriSiparisi_AciklamaAlanlari',
      instance.siparisMusteriSiparisiAciklamaAlanlari);
  writeNotNull('siparis_MusteriSiparisi_GizlenecekAlanlar',
      instance.siparisMusteriSiparisiGizlenecekAlanlar);
  writeNotNull('siparis_MusteriSiparisi_DegismeyecekAlanlar',
      instance.siparisMusteriSiparisiDegismeyecekAlanlar);
  writeNotNull(
      'siparis_MusSip_EkstraAlanlar', instance.siparisMusSipEkstraAlanlar);
  writeNotNull('siparis_MusteriSiparisi_SatirAciklamaAlanlari',
      instance.siparisMusteriSiparisiSatirAciklamaAlanlari);
  writeNotNull('siparis_MusSip_OlcuBirimi', instance.siparisMusSipOlcuBirimi);
  writeNotNull('siparis_MusSip_BakiyesizStokSecilmesin',
      instance.siparisMusSipBakiyesizStokSecilmesin);
  writeNotNull('siparis_MusSip_HizliUrunGirisi_Miktar2Kullanilsin',
      instance.siparisMusSipHizliUrunGirisiMiktar2Kullanilsin);
  writeNotNull('siparis_MusteriSiparisi_DipFiyatUygulamasi',
      instance.siparisMusteriSiparisiDipFiyatUygulamasi);
  writeNotNull('siparis_MusteriSiparisi_DipFiyatSaha',
      instance.siparisMusteriSiparisiDipFiyatSaha);
  writeNotNull('siparis_MusteriSiparisi_DipFiyatEylem',
      instance.siparisMusteriSiparisiDipFiyatEylem);
  writeNotNull('siparis_MusteriSiparisi_DipFiyatKDVDurumu',
      instance.siparisMusteriSiparisiDipFiyatKDVDurumu);
  writeNotNull('siparis_MusSip_MaxIskUygulamasi',
      instance.siparisMusSipMaxIskUygulamasi);
  writeNotNull('siparis_MusSip_MaxSatIsk1', instance.siparisMusSipMaxSatIsk1);
  writeNotNull('siparis_MusSip_MaxSatIsk2', instance.siparisMusSipMaxSatIsk2);
  writeNotNull('siparis_MusSip_MaxSatIsk3', instance.siparisMusSipMaxSatIsk3);
  writeNotNull('siparis_MusSip_MaxSatIsk4', instance.siparisMusSipMaxSatIsk4);
  writeNotNull('siparis_MusSip_MaxSatIsk5', instance.siparisMusSipMaxSatIsk5);
  writeNotNull('siparis_MusSip_MaxSatIsk6', instance.siparisMusSipMaxSatIsk6);
  writeNotNull('siparis_MusSip_MaxGenIsk1', instance.siparisMusSipMaxGenIsk1);
  writeNotNull('siparis_MusSip_MaxGenIsk2', instance.siparisMusSipMaxGenIsk2);
  writeNotNull('siparis_MusSip_MaxGenIsk3', instance.siparisMusSipMaxGenIsk3);
  writeNotNull('siparis_MusteriSiparisi_Raporlar',
      instance.siparisMusteriSiparisiRaporlar);
  writeNotNull('siparis_MusteriSiparisi_DurumRaporu',
      instance.siparisMusteriSiparisiDurumRaporu);
  writeNotNull('siparis_MusteriSiparisi_DurumRaporuFiyatGor',
      instance.siparisMusteriSiparisiDurumRaporuFiyatGor);
  writeNotNull(
      'siparis_MusSip_KarlilikRaporu', instance.siparisMusSipKarlilikRaporu);
  writeNotNull(
      'siparis_MusSip_TeslimRaporu', instance.siparisMusSipTeslimRaporu);
  writeNotNull('siparis_SaticiSiparisi', instance.siparisSaticiSiparisi);
  writeNotNull(
      'siparis_SaticiSiparisi_Kaydet', instance.siparisSaticiSiparisiKaydet);
  writeNotNull(
      'siparis_SaticiSiparisi_Duzelt', instance.siparisSaticiSiparisiDuzelt);
  writeNotNull('siparis_SaticiSiparisi_Sil', instance.siparisSaticiSiparisiSil);
  writeNotNull('siparis_SaticiSiparisi_KapalilarListelenmesin',
      instance.siparisSaticiSiparisiKapalilarListelenmesin);
  writeNotNull('siparis_SaticiSiparisi_FiyatDegistirilmesin',
      instance.siparisSaticiSiparisiFiyatDegistirilmesin);
  writeNotNull('siparis_SaticiSiparisi_FiyatSirasi',
      instance.siparisSaticiSiparisiFiyatSirasi);
  writeNotNull('siparis_SaticiSip_Birim1denKaydet',
      instance.siparisSaticiSipBirim1denKaydet);
  writeNotNull('siparis_SaticiSiparisi_KapatmaIslemi',
      instance.siparisSaticiSiparisiKapatmaIslemi);
  writeNotNull('siparis_SaticiSip_OnayIslemleri',
      instance.siparisSaticiSipOnayIslemleri);
  writeNotNull('siparis_SaticiSip_DigerSekmesiGoster',
      instance.siparisSaticiSipDigerSekmesiGoster);
  writeNotNull(
      'siparis_SaticiSip_OlcuBirimi', instance.siparisSaticiSipOlcuBirimi);
  writeNotNull('siparis_SaticiSip_CariKoduDegistir',
      instance.siparisSaticiSipCariKoduDegistir);
  writeNotNull('siparis_SaticiSiparisi_Raporlar',
      instance.siparisSaticiSiparisiRaporlar);
  writeNotNull('siparis_SaticiSiparisi_DurumRaporu',
      instance.siparisSaticiSiparisiDurumRaporu);
  writeNotNull('siparis_SaticiSiparisi_DurumRaporuFiyatGor',
      instance.siparisSaticiSiparisiDurumRaporuFiyatGor);
  writeNotNull(
      'siparis_SaticiSip_TeslimRaporu', instance.siparisSaticiSipTeslimRaporu);
  writeNotNull('stok_StokListesi', instance.stokStokListesi);
  writeNotNull(
      'stok_StokListesi_ExtraAlanlar', instance.stokStokListesiExtraAlanlar);
  writeNotNull('stok_StokKarti', instance.stokStokKarti);
  writeNotNull('stok_StokKarti_Kaydet', instance.stokStokKartiKaydet);
  writeNotNull('stok_StokKarti_Duzelt', instance.stokStokKartiDuzelt);
  writeNotNull('stok_StokKarti_Sil', instance.stokStokKartiSil);
  writeNotNull(
      'stok_StokKarti_AlisFiyatiGizle', instance.stokStokKartiAlisFiyatiGizle);
  writeNotNull('stok_StokKarti_SatisFiyatiGizle',
      instance.stokStokKartiSatisFiyatiGizle);
  writeNotNull('stok_StokHareketleri', instance.stokStokHareketleri);
  writeNotNull('stok_StokHar_Kaydet', instance.stokStokHarKaydet);
  writeNotNull('stok_StokHar_Duzelt', instance.stokStokHarDuzelt);
  writeNotNull('stok_StokHar_Sil', instance.stokStokHarSil);
  writeNotNull('stok_StokHar_PlasiyerKendiniGorsun',
      instance.stokStokHarPlasiyerKendiniGorsun);
  writeNotNull('stok_FiltreSQLTipi', instance.stokFiltreSQLTipi);
  writeNotNull('stok_ResimGoster', instance.stokResimGoster);
  writeNotNull('stok_ResimGoster_Ekle', instance.stokResimGosterEkle);
  writeNotNull('stok_ResimGoster_Sil', instance.stokResimGosterSil);
  writeNotNull('stok_FiyatOzeti', instance.stokFiyatOzeti);
  writeNotNull('stok_HareketDetayiniGizle', instance.stokHareketDetayiniGizle);
  writeNotNull(
      'stok_GirisHareketleriniGizle', instance.stokGirisHareketleriniGizle);
  writeNotNull(
      'stok_CikisHareketleriniGizle', instance.stokCikisHareketleriniGizle);
  writeNotNull('stok_BakiyeGosterimTipi', instance.stokBakiyeGosterimTipi);
  writeNotNull('stok_BarkodKontrol', instance.stokBarkodKontrol);
  writeNotNull('stok_DepoBakiyeDurumu', instance.stokDepoBakiyeDurumu);
  writeNotNull('stok_BarkodTanimlama', instance.stokBarkodTanimlama);
  writeNotNull('stok_BarkodTanimlama_GorunecekAlanlar',
      instance.stokBarkodTanimlamaGorunecekAlanlar);
  writeNotNull('stok_BarkodKayitlari', instance.stokBarkodKayitlari);
  writeNotNull('stok_BarkodKayitlari_Ekle', instance.stokBarkodKayitlariEkle);
  writeNotNull(
      'stok_BarkodKayitlari_Duzelt', instance.stokBarkodKayitlariDuzelt);
  writeNotNull('stok_BarkodKayitlari_Sil', instance.stokBarkodKayitlariSil);
  writeNotNull('stok_KanbanBarkodEsle', instance.stokKanbanBarkodEsle);
  writeNotNull('stok_KanbanBarkodEsle_Sil', instance.stokKanbanBarkodEsleSil);
  writeNotNull('stok_KanbanBarkodEsleFarkliStokOkutulmasin',
      instance.stokKanbanBarkodEsleFarkliStokOkutulmasin);
  writeNotNull('stok_FiyatGorEkrani', instance.stokFiyatGorEkrani);
  writeNotNull('stok_FiyatGorEkrani_GunlukKurdanTLGoster',
      instance.stokFiyatGorEkraniGunlukKurdanTLGoster);
  writeNotNull('stok_FiyatGorEkraniGorunecekAlanlar',
      instance.stokFiyatGorEkraniGorunecekAlanlar);
  writeNotNull('stok_FiyatGecmisi', instance.stokFiyatGecmisi);
  writeNotNull('stok_FiyatGecmisiSil', instance.stokFiyatGecmisiSil);
  writeNotNull(
      'stok_FiyatGecmisiFiyatTipleri', instance.stokFiyatGecmisiFiyatTipleri);
  writeNotNull('stok_SeriHar', instance.stokSeriHar);
  writeNotNull('stok_SeriHar_Ekle', instance.stokSeriHarEkle);
  writeNotNull('stok_SeriHar_Duzelt', instance.stokSeriHarDuzelt);
  writeNotNull('stok_SeriHar_Sil', instance.stokSeriHarSil);
  writeNotNull('stok_SeriParcala', instance.stokSeriParcala);
  writeNotNull('stok_SeriParcala_Ekle', instance.stokSeriParcalaEkle);
  writeNotNull('stok_SeriParcala_Duzelt', instance.stokSeriParcalaDuzelt);
  writeNotNull('stok_SeriParcala_Sil', instance.stokSeriParcalaSil);
  writeNotNull('stok_SeriBirlestir', instance.stokSeriBirlestir);
  writeNotNull('stok_SeriBirlestir_Ekle', instance.stokSeriBirlestirEkle);
  writeNotNull('stok_SeriBirlestir_Duzelt', instance.stokSeriBirlestirDuzelt);
  writeNotNull('stok_SeriBirlestir_Sil', instance.stokSeriBirlestirSil);
  writeNotNull('stok_Paketleme', instance.stokPaketleme);
  writeNotNull('stok_Paketleme_Ekle', instance.stokPaketlemeEkle);
  writeNotNull('stok_Paketleme_Sil', instance.stokPaketlemeSil);
  writeNotNull(
      'stok_Paketleme_OnaySormasin', instance.stokPaketlemeOnaySormasin);
  writeNotNull('stok_Paketleme_DigerKulKayitGorebilir',
      instance.stokPaketlemeDigerKulKayitGorebilir);
  writeNotNull('stok_Paketleme_SorulacakBelgeTipleri',
      instance.stokPaketlemeSorulacakBelgeTipleri);
  writeNotNull('stok_Raporlar', instance.stokRaporlar);
  writeNotNull('stok_Rap_AmbarMaliyet', instance.stokRapAmbarMaliyet);
  writeNotNull('stok_Rap_LokalDepoBakiye', instance.stokRapLokalDepoBakiye);
  writeNotNull(
      'stok_Rap_UrunGrubunaGoreSatis', instance.stokRapUrunGrubunaGoreSatis);
  writeNotNull('cari_CariListesi', instance.cariCariListesi);
  writeNotNull(
      'cari_CariListesi_RiskGorebilir', instance.cariCariListesiRiskGorebilir);
  writeNotNull('cari_RiskGirisi', instance.cariRiskGirisi);
  writeNotNull('cari_CariKarti', instance.cariCariKarti);
  writeNotNull('cari_CariKarti_Kaydet', instance.cariCariKartiKaydet);
  writeNotNull('cari_CariKarti_Duzelt', instance.cariCariKartiDuzelt);
  writeNotNull('cari_CariKarti_Sil', instance.cariCariKartiSil);
  writeNotNull('cari_CariKarti_EIslemler', instance.cariCariKartiEIslemler);
  writeNotNull('cari_CariKarti_DegismeyecekAlanlar',
      instance.cariCariKartiDegismeyecekAlanlar);
  writeNotNull('cari_CariKarti_GizlenecekAlanlar',
      instance.cariCariKartiGizlenecekAlanlar);
  writeNotNull('cari_CariHareketleri', instance.cariCariHareketleri);
  writeNotNull('cari_CariHar_Kaydet', instance.cariCariHarKaydet);
  writeNotNull('cari_CariHar_Duzelt', instance.cariCariHarDuzelt);
  writeNotNull('cari_CariHar_Sil', instance.cariCariHarSil);
  writeNotNull('cari_CariHareketleri_HarDetayGorsun',
      instance.cariCariHareketleriHarDetayGorsun);
  writeNotNull('stok_CariHar_PlasiyerKendiniGorsun',
      instance.stokCariHarPlasiyerKendiniGorsun);
  writeNotNull('cari_Aktivite', instance.cariAktivite);
  writeNotNull('cari_Aktivite_Ekle', instance.cariAktiviteEkle);
  writeNotNull('cari_Aktivite_Duzelt', instance.cariAktiviteDuzelt);
  writeNotNull('cari_Aktivite_Sil', instance.cariAktiviteSil);
  writeNotNull('cari_Aktivite_Atayabilir', instance.cariAktiviteAtayabilir);
  writeNotNull(
      'cari_Aktivite_BitirmeyiGeriAl', instance.cariAktiviteBitirmeyiGeriAl);
  writeNotNull('cari_OzelHesapKapatma', instance.cariOzelHesapKapatma);
  writeNotNull('cari_OzelHesapKapatma_Sil', instance.cariOzelHesapKapatmaSil);
  writeNotNull('cari_VadeKontrolu', instance.cariVadeKontrolu);
  writeNotNull('cari_VadeKontrolu_Gun', instance.cariVadeKontroluGun);
  writeNotNull(
      'cari_VadeKontrolu_BelgeTipleri', instance.cariVadeKontroluBelgeTipleri);
  writeNotNull('cari_Filtre', instance.cariFiltre);
  writeNotNull('cari_FiltreSQL', instance.cariFiltreSQL);
  writeNotNull('cari_FiltreSQLTipi', instance.cariFiltreSQLTipi);
  writeNotNull('cari_Virman', instance.cariVirman);
  writeNotNull('cari_Virman_Kaydet', instance.cariVirmanKaydet);
  writeNotNull('cari_Harita', instance.cariHarita);
  writeNotNull('cari_TeslimCari_RehberSadeceSecsin',
      instance.cariTeslimCariRehberSadeceSecsin);
  writeNotNull('cari_TeslimCari_SatisBaglanmisCarilerSecilsin',
      instance.cariTeslimCariSatisBaglanmisCarilerSecilsin);
  writeNotNull('cari_Raporlar', instance.cariRaporlar);
  writeNotNull('cari_Rap_Ekstre', instance.cariRapEkstre);
  writeNotNull('cari_Rap_StokEkstre', instance.cariRapStokEkstre);
  writeNotNull('cari_Rap_Yaslandirma', instance.cariRapYaslandirma);
  writeNotNull(
      'cari_Rap_HarDetayliYaslandir', instance.cariRapHarDetayliYaslandir);
  writeNotNull('cari_Rap_Hareket', instance.cariRapHareket);
  writeNotNull('cari_Rap_DovizBakiye', instance.cariRapDovizBakiye);
  writeNotNull('cari_Rap_StokSatisOzeti', instance.cariRapStokSatisOzeti);
  writeNotNull('cari_Rap_DovizliEkstre', instance.cariRapDovizliEkstre);
  writeNotNull('tahsilat_Tahsilatlar', instance.tahsilatTahsilatlar);
  writeNotNull('tahsilat_NakitTahsilat', instance.tahsilatNakitTahsilat);
  writeNotNull(
      'tahsilat_NakitTahsilat_Kaydet', instance.tahsilatNakitTahsilatKaydet);
  writeNotNull('tahsilat_KKartiTahsilat', instance.tahsilatKKartiTahsilat);
  writeNotNull(
      'tahsilat_KKartiTahsilat_Kaydet', instance.tahsilatKKartiTahsilatKaydet);
  writeNotNull('tahsilat_NakitOdeme', instance.tahsilatNakitOdeme);
  writeNotNull('tahsilat_NakitOdeme_Kaydet', instance.tahsilatNakitOdemeKaydet);
  writeNotNull('tahsilat_SenetTahsilat', instance.tahsilatSenetTahsilat);
  writeNotNull(
      'tahsilat_SenetTahsilat_Kaydet', instance.tahsilatSenetTahsilatKaydet);
  writeNotNull('tahsilat_CekTahsilat', instance.tahsilatCekTahsilat);
  writeNotNull(
      'tahsilat_CekTahsilat_Kaydet', instance.tahsilatCekTahsilatKaydet);
  writeNotNull('tahsilat_MuhtelifTahsilat', instance.tahsilatMuhtelifTahsilat);
  writeNotNull('tahsilat_MuhtelifOdeme', instance.tahsilatMuhtelifOdeme);
  writeNotNull('tahsilat_MuhtelifTahsilatFiltre',
      instance.tahsilatMuhtelifTahsilatFiltre);
  writeNotNull('tahsilat_MuhtelifTahsilatFiltreSQL',
      instance.tahsilatMuhtelifTahsilatFiltreSQL);
  writeNotNull(
      'tahsilat_MuhtelifOdemeFiltre', instance.tahsilatMuhtelifOdemeFiltre);
  writeNotNull('tahsilat_MuhtelifOdemeFiltreSQL',
      instance.tahsilatMuhtelifOdemeFiltreSQL);
  writeNotNull(
      'yonetici_Banka_Banka_Litesi', instance.yoneticiBankaBankaLitesi);
  writeNotNull('yonetici_Banka_Islemleri', instance.yoneticiBankaIslemleri);
  writeNotNull(
      'yonetici_Banka_Islemleri_Sil', instance.yoneticiBankaIslemleriSil);
  writeNotNull(
      'yonetici_Banka_Islem_HesapEFT', instance.yoneticiBankaIslemHesapEFT);
  writeNotNull('yonetici_Banka_Islem_HesapVirman',
      instance.yoneticiBankaIslemHesapVirman);
  writeNotNull(
      'yonetici_Banka_Islem_CariEFT', instance.yoneticiBankaIslemCariEFT);
  writeNotNull(
      'finans_Banka_Kasa_Transferi', instance.finansBankaKasaTransferi);
  writeNotNull('finans_Kasa_Listesi', instance.finansKasaListesi);
  writeNotNull('finans_Kasa_Islemleri', instance.finansKasaIslemleri);
  writeNotNull('finans_Kasa_Islemleri_Sil', instance.finansKasaIslemleriSil);
  writeNotNull(
      'finans_KasalarArasiTransfer', instance.finansKasalarArasiTransfer);
  writeNotNull('finans_Kasa_NakitTahsilat', instance.finansKasaNakitTahsilat);
  writeNotNull('finans_Kasa_NakitOdeme', instance.finansKasaNakitOdeme);
  writeNotNull(
      'finans_Kasa_MuhtelifTahsilat', instance.finansKasaMuhtelifTahsilat);
  writeNotNull('finans_Kasa_MuhtelifOdeme', instance.finansKasaMuhtelifOdeme);
  writeNotNull('finans_Kasa_SenetTahsilati', instance.finansKasaSenetTahsilati);
  writeNotNull('finans_Kasa_SenetOdemesi', instance.finansKasaSenetOdemesi);
  writeNotNull('finans_Kasa_CekTahsilati', instance.finansKasaCekTahsilati);
  writeNotNull('finans_Kasa_CekOdemesi', instance.finansKasaCekOdemesi);
  writeNotNull('dekont_Listesi', instance.dekontListesi);
  writeNotNull('dekont_Kaydet', instance.dekontKaydet);
  writeNotNull('dekont_Duzelt', instance.dekontDuzelt);
  writeNotNull('dekont_Sil', instance.dekontSil);
  writeNotNull(
      'finans_Cek_GizlenecekAlanlar', instance.finansCekGizlenecekAlanlar);
  writeNotNull('finans_Cek_Musteri', instance.finansCekMusteri);
  writeNotNull('finans_MCEK_Ekle', instance.finansMCEKEkle);
  writeNotNull('finans_MCEK_Sil', instance.finansMCEKSil);
  writeNotNull('finans_MCEK_BelgeDetayi', instance.finansMCEKBelgeDetayi);
  writeNotNull('finans_MCEK_Hareketler', instance.finansMCEKHareketler);
  writeNotNull('finans_MCEK_Evraklar', instance.finansMCEKEvraklar);
  writeNotNull('finans_MCEK_CariyeCiro', instance.finansMCEKCariyeCiro);
  writeNotNull('finans_MCEK_TahsileCiro', instance.finansMCEKTahsileCiro);
  writeNotNull('finans_MCEK_TahsilDekontu', instance.finansMCEKTahsilDekontu);
  writeNotNull('finans_Cek_Borc', instance.finansCekBorc);
  writeNotNull('finans_BorcCeki_Ekle', instance.finansBorcCekiEkle);
  writeNotNull('finans_BorcCeki_Sil', instance.finansBorcCekiSil);
  writeNotNull('finans_BCEK_BelgeDetayi', instance.finansBCEKBelgeDetayi);
  writeNotNull('finans_BCEK_Hareketler', instance.finansBCEKHareketler);
  writeNotNull('finans_BCEK_Evraklar', instance.finansBCEKEvraklar);
  writeNotNull('finans_BCEK_OdemeDekontu', instance.finansBCEKOdemeDekontu);
  writeNotNull('finans_Senet_Musteri', instance.finansSenetMusteri);
  writeNotNull('finans_MSEN_Ekle', instance.finansMSENEkle);
  writeNotNull('finans_MSEN_Sil', instance.finansMSENSil);
  writeNotNull('finans_MSEN_BelgeDetayi', instance.finansMSENBelgeDetayi);
  writeNotNull('finans_MSEN_Hareketler', instance.finansMSENHareketler);
  writeNotNull('finans_MSEN_Evraklar', instance.finansMSENEvraklar);
  writeNotNull('finans_MSEN_CariyeCiro', instance.finansMSENCariyeCiro);
  writeNotNull('finans_MSEN_TahsileCiro', instance.finansMSENTahsileCiro);
  writeNotNull('finans_MSEN_TahsilDekontu', instance.finansMSENTahsilDekontu);
  writeNotNull('finans_Senet_Borc', instance.finansSenetBorc);
  writeNotNull('finans_BSEN_Ekle', instance.finansBSENEkle);
  writeNotNull('finans_BSEN_Sil', instance.finansBSENSil);
  writeNotNull('finans_BSEN_BelgeDetayi', instance.finansBSENBelgeDetayi);
  writeNotNull('finans_BSEN_Hareketler', instance.finansBSENHareketler);
  writeNotNull('finans_BSEN_Evraklar', instance.finansBSENEvraklar);
  writeNotNull('finans_BSEN_OdemeDekontu', instance.finansBSENOdemeDekontu);
  writeNotNull('finans_KKartiTahsilati', instance.finansKKartiTahsilati);
  writeNotNull('finans_MuhtelifTahsilat', instance.finansMuhtelifTahsilat);
  writeNotNull('finans_MuhtelifOdeme', instance.finansMuhtelifOdeme);
  writeNotNull('finans_TahsilatKayitlari', instance.finansTahsilatKayitlari);
  writeNotNull(
      'finans_HizliTahsilatKayitlari', instance.finansHizliTahsilatKayitlari);
  writeNotNull('finans_HizliTahsilatKayitlari_Sil',
      instance.finansHizliTahsilatKayitlariSil);
  writeNotNull('finans_OrtalamaVadeTarihiHesaplama',
      instance.finansOrtalamaVadeTarihiHesaplama);
  writeNotNull('finans_OzetRapor', instance.finansOzetRapor);
  writeNotNull(
      'finans_Raporlar_FinansalDurum', instance.finansRaporlarFinansalDurum);
  writeNotNull('finans_Raporlar_AylikMizan', instance.finansRaporlarAylikMizan);
  writeNotNull('temsilci_Profil', instance.temsilciProfil);
  writeNotNull('temsilci_Profil_KdvDahil', instance.temsilciProfilKdvDahil);
  writeNotNull('temsilci_Profil_SatisPerformansiniGizle',
      instance.temsilciProfilSatisPerformansiniGizle);
  writeNotNull('temsilci_Profil_AylaraGoreSatisiGizle',
      instance.temsilciProfilAylaraGoreSatisiGizle);
  writeNotNull('temsilci_Profil_AylaraGoreTahsilatiGizle',
      instance.temsilciProfilAylaraGoreTahsilatiGizle);
  writeNotNull('yazdirma_BluetoothYaziciKullanabilir',
      instance.yazdirmaBluetoothYaziciKullanabilir);
  writeNotNull('yazdirma_Hucre_Etiketi', instance.yazdirmaHucreEtiketi);
  writeNotNull('yazdirma_Hucre_Etiketi_Yazicilari',
      instance.yazdirmaHucreEtiketiYazicilari);
  writeNotNull(
      'yazdirma_Dizayn_HucreEtiketi', instance.yazdirmaDizaynHucreEtiketi);
  writeNotNull(
      'yazdirma_MalToplama_Etiketi', instance.yazdirmaMalToplamaEtiketi);
  writeNotNull(
      'yazdirma_Mal_Toplama_Yazicilari', instance.yazdirmaMalToplamaYazicilari);
  writeNotNull('yazdirma_Dizayn_MalToplama', instance.yazdirmaDizaynMalToplama);
  writeNotNull(
      'yazdirma_MalKontrol_Etiketi', instance.yazdirmaMalKontrolEtiketi);
  writeNotNull(
      'yazdirma_Mal_Kontrol_Yazicilari', instance.yazdirmaMalKontrolYazicilari);
  writeNotNull('yazdirma_Dizayn_MalKontrol', instance.yazdirmaDizaynMalKontrol);
  writeNotNull('yazdirma_DAT', instance.yazdirmaDAT);
  writeNotNull('yazdirma_DAT_Yazicilari', instance.yazdirmaDATYazicilari);
  writeNotNull('yazdirma_Dizayn_DAT', instance.yazdirmaDizaynDAT);
  writeNotNull('yazdirma_Paketleme_Etiketi', instance.yazdirmaPaketlemeEtiketi);
  writeNotNull('yazdirma_Paketleme_KopyaSayisiGizle',
      instance.yazdirmaPaketlemeKopyaSayisiGizle);
  writeNotNull(
      'yazdirma_Paketleme_Yazicilari', instance.yazdirmaPaketlemeYazicilari);
  writeNotNull('yazdirma_Dizayn_Paketleme', instance.yazdirmaDizaynPaketleme);
  writeNotNull('yazdirma_SatisIrs', instance.yazdirmaSatisIrs);
  writeNotNull('yazdirma_SatisFat', instance.yazdirmaSatisFat);
  writeNotNull(
      'yazdirma_SatisFat_Yazicilari', instance.yazdirmaSatisFatYazicilari);
  writeNotNull('yazdirma_Dizayn_SatisFat', instance.yazdirmaDizaynSatisFat);
  writeNotNull('yazdirma_AlisFat', instance.yazdirmaAlisFat);
  writeNotNull('yazdirma_Dizayn_AlisFat', instance.yazdirmaDizaynAlisFat);
  writeNotNull('yazdirma_Mustahsil', instance.yazdirmaMustahsil);
  writeNotNull('yazdirma_MusSip', instance.yazdirmaMusSip);
  writeNotNull('yazdirma_MusSip_Yazicilari', instance.yazdirmaMusSipYazicilari);
  writeNotNull('yazdirma_Dizayn_MusSip', instance.yazdirmaDizaynMusSip);
  writeNotNull('yazdirma_SaticiSip', instance.yazdirmaSaticiSip);
  writeNotNull('yazdirma_Dizayn_SaticiSip', instance.yazdirmaDizaynSaticiSip);
  writeNotNull('yazdirma_ATAL', instance.yazdirmaATAL);
  writeNotNull('yazdirma_ATAL_Yazicilari', instance.yazdirmaATALYazicilari);
  writeNotNull('yazdirma_Dizayn_ATAL', instance.yazdirmaDizaynATAL);
  writeNotNull('yazdirma_OdemeMakbuzu', instance.yazdirmaOdemeMakbuzu);
  writeNotNull('yazdirma_OdemeMakbuzu_Yazicilari',
      instance.yazdirmaOdemeMakbuzuYazicilari);
  writeNotNull(
      'yazdirma_Dizayn_OdemeMakbuzu', instance.yazdirmaDizaynOdemeMakbuzu);
  writeNotNull('yazdirma_AlisIrs', instance.yazdirmaAlisIrs);
  writeNotNull(
      'yazdirma_AlisIrs_Yazicilari', instance.yazdirmaAlisIrsYazicilari);
  writeNotNull('yazdirma_Dizayn_AlisIrs', instance.yazdirmaDizaynAlisIrs);
  writeNotNull('yazdirma_IsEmri', instance.yazdirmaIsEmri);
  writeNotNull('yazdirma_AmbarCikis', instance.yazdirmaAmbarCikis);
  writeNotNull('yazdirma_AmbarGiris', instance.yazdirmaAmbarGiris);
  writeNotNull('yazdirma_CariHareket', instance.yazdirmaCariHareket);
  writeNotNull('uretim_FiyatGorebilir', instance.uretimFiyatGorebilir);
  writeNotNull('uretim_USK', instance.uretimUSK);
  writeNotNull('uretim_USK_Kaydet', instance.uretimUSKKaydet);
  writeNotNull('uretim_USK_Duzelt', instance.uretimUSKDuzelt);
  writeNotNull('uretim_USK_Sil', instance.uretimUSKSil);
  writeNotNull('uretim_USK_KacGunlukKayitlarListelensin',
      instance.uretimUSKKacGunlukKayitlarListelensin);
  writeNotNull('uretim_USK_MiktarBarkoddan', instance.uretimUSKMiktarBarkoddan);
  writeNotNull('uretim_USK_Miktar1Gelsin', instance.uretimUSKMiktar1Gelsin);
  writeNotNull('sirket_Depo_Uretim_Giris', instance.sirketDepoUretimGiris);
  writeNotNull('sirket_Depo_Uretim_Cikis', instance.sirketDepoUretimCikis);
  writeNotNull('uretim_USK_IsEmriOtoGelsin', instance.uretimUSKIsEmriOtoGelsin);
  writeNotNull('uretim_USK_SoruSorulmasin', instance.uretimUSKSoruSorulmasin);
  writeNotNull('uretim_USK_StokRehberiAcilmasin',
      instance.uretimUSKStokRehberiAcilmasin);
  writeNotNull('uretim_USK_KlavyeEngelle', instance.uretimUSKKlavyeEngelle);
  writeNotNull('uretim_USK_DepoOnceligi', instance.uretimUSKDepoOnceligi);
  writeNotNull('uretim_USK_FisiErpUretsin', instance.uretimUSKFisiErpUretsin);
  writeNotNull(
      'uretim_USK_GizlenecekAlanlar', instance.uretimUSKGizlenecekAlanlar);
  writeNotNull('uretim_USK_BosGecilmeyecekAlanlar',
      instance.uretimUSKBosGecilmeyecekAlanlar);
  writeNotNull(
      'uretim_USK_DegismeyecekAlanlar', instance.uretimUSKDegismeyecekAlanlar);
  writeNotNull('uretim_USK_OlcuBirimi', instance.uretimUSKOlcuBirimi);
  writeNotNull('uretim_USK_OtoYazdir', instance.uretimUSKOtoYazdir);
  writeNotNull('uretim_USK_KalemliYapi', instance.uretimUSKKalemliYapi);
  writeNotNull('uretim_USK_KalemliYapi_StokMevcutaEklensin',
      instance.uretimUSKKalemliYapiStokMevcutaEklensin);
  writeNotNull('uretim_USK_KalemliYapi_OtoEtiketYazdir',
      instance.uretimUSKKalemliYapiOtoEtiketYazdir);
  writeNotNull('uretim_USK_KalemliYapi_AyniBarkodOkutulamaz',
      instance.uretimUSKKalemliYapiAyniBarkodOkutulamaz);
  writeNotNull('uretim_USK_KalemliYapi_OkutulanEnUsteEklensin',
      instance.uretimUSKKalemliYapiOkutulanEnUsteEklensin);
  writeNotNull('uretim_USK_KalemliYapi_KalemDuzeltilemesin',
      instance.uretimUSKKalemliYapiKalemDuzeltilemesin);
  writeNotNull('uretim_ReceteIzleme', instance.uretimReceteIzleme);
  writeNotNull('uretim_MalToplama', instance.uretimMalToplama);
  writeNotNull('uretim_MalToplama_Ekle', instance.uretimMalToplamaEkle);
  writeNotNull('uretim_MalToplama_Sil', instance.uretimMalToplamaSil);
  writeNotNull('uretim_MalToplama_KlavyeEngelle',
      instance.uretimMalToplamaKlavyeEngelle);
  writeNotNull('uretim_MalToplama_BarkodOkutsun',
      instance.uretimMalToplamaBarkodOkutsun);
  writeNotNull(
      'uretim_MalToplama_BelgeTipleri', instance.uretimMalToplamaBelgeTipleri);
  writeNotNull('uretim_MalToplama_ReceteFiltresi',
      instance.uretimMalToplamaReceteFiltresi);
  writeNotNull('uretim_MalToplama_ReceteFiltresiSQL',
      instance.uretimMalToplamaReceteFiltresiSQL);
  writeNotNull('uretim_IsEmri', instance.uretimIsEmri);
  writeNotNull('uretim_IsEmri_Ekle', instance.uretimIsEmriEkle);
  writeNotNull('uretim_IsEmri_Duzelt', instance.uretimIsEmriDuzelt);
  writeNotNull('uretim_IsEmri_Sil', instance.uretimIsEmriSil);
  writeNotNull('taltek_STEK', instance.taltekSTEK);
  writeNotNull('taltek_STEK_Kaydet', instance.taltekSTEKKaydet);
  writeNotNull('taltek_STEK_Duzelt', instance.taltekSTEKDuzelt);
  writeNotNull('taltek_STEK_Sil', instance.taltekSTEKSil);
  writeNotNull('taltek_STEK_KapalilarListenlenmesin',
      instance.taltekSTEKKapalilarListenlenmesin);
  writeNotNull('taltek_STEK_OnayIslemleri', instance.taltekSTEKOnayIslemleri);
  writeNotNull(
      'taltek_STEK_CariKoduDegistir', instance.taltekSTEKCariKoduDegistir);
  writeNotNull('taltek_STEK_FiyatDegistirilmesin',
      instance.taltekSTEKFiyatDegistirilmesin);
  writeNotNull('taltek_STEK_Aciklamalar_YetkiTuru',
      instance.taltekSTEKAciklamalarYetkiTuru);
  writeNotNull(
      'taltek_STEK_GizlenecekAlanlar', instance.taltekSTEKGizlenecekAlanlar);
  writeNotNull('taltek_STEK_DegismeyecekAlanlar',
      instance.taltekSTEKDegismeyecekAlanlar);
  writeNotNull('taltek_STEK_BosGecilmeyecekAlanlar',
      instance.taltekSTEKBosGecilmeyecekAlanlar);
  writeNotNull(
      'taltek_STEK_AciklamaAlanlari', instance.taltekSTEKAciklamaAlanlari);
  writeNotNull('taltek_STEK_OzelKod1Degeri', instance.taltekSTEKOzelKod1Degeri);
  writeNotNull(
      'taltek_STEK_DipFiyatUygulamasi', instance.taltekSTEKDipFiyatUygulamasi);
  writeNotNull('taltek_STEK_DipFiyatSaha', instance.taltekSTEKDipFiyatSaha);
  writeNotNull('taltek_STEK_DipFiyatEylem', instance.taltekSTEKDipFiyatEylem);
  writeNotNull('taltek_ATAL', instance.taltekATAL);
  writeNotNull('taltek_ATAL_Kaydet', instance.taltekATALKaydet);
  writeNotNull('taltek_ATAL_Duzelt', instance.taltekATALDuzelt);
  writeNotNull('taltek_ATAL_Sil', instance.taltekATALSil);
  writeNotNull('taltek_ATAL_CariEMailAlani', instance.taltekATALCariEMailAlani);
  writeNotNull('taltek_ATAL_OnayIslemleri', instance.taltekATALOnayIslemleri);
  writeNotNull(
      'taltek_ATAL_CariKoduDegistir', instance.taltekATALCariKoduDegistir);
  writeNotNull('taltek_ATAL_Aciklamalar_YetkiTuru',
      instance.taltekATALAciklamalarYetkiTuru);
  writeNotNull(
      'taltek_ATAL_GizlenecekAlanlar', instance.taltekATALGizlenecekAlanlar);
  writeNotNull(
      'taltek_ATAL_AciklamaAlanlari', instance.taltekATALAciklamaAlanlari);
  writeNotNull('taltek_ATAL_BelgeKopyala', instance.taltekATALBelgeKopyala);
  writeNotNull('taltek_STAL', instance.taltekSTAL);
  writeNotNull('taltek_STAL_Kaydet', instance.taltekSTALKaydet);
  writeNotNull('taltek_STAL_Duzelt', instance.taltekSTALDuzelt);
  writeNotNull('taltek_STAL_Sil', instance.taltekSTALSil);
  writeNotNull('taltek_STAL_KapalilarListenlenmesin',
      instance.taltekSTALKapalilarListenlenmesin);
  writeNotNull('taltek_STAL_OnayIslemleri', instance.taltekSTALOnayIslemleri);
  writeNotNull(
      'taltek_STAL_CariKoduDegistir', instance.taltekSTALCariKoduDegistir);
  writeNotNull('taltek_STAL_FiyatDegistirilmesin',
      instance.taltekSTALFiyatDegistirilmesin);
  writeNotNull(
      'taltek_STAL_GizlenecekAlanlar', instance.taltekSTALGizlenecekAlanlar);
  writeNotNull(
      'taltek_STAL_DipFiyatUygulamasi', instance.taltekSTALDipFiyatUygulamasi);
  writeNotNull('ebelge_EFat', instance.ebelgeEFat);
  writeNotNull('ebelge_EFatCariGuncelle', instance.ebelgeEFatCariGuncelle);
  writeNotNull('ebelge_EFatSorgula', instance.ebelgeEFatSorgula);
  writeNotNull('ebelge_EFatGelenKutusu', instance.ebelgeEFatGelenKutusu);
  writeNotNull('ebelge_EFatTaslakOlustur', instance.ebelgeEFatTaslakOlustur);
  writeNotNull('ebelge_EFatTaslakSil', instance.ebelgeEFatTaslakSil);
  writeNotNull('ebelge_EFatTaslakBasim', instance.ebelgeEFatTaslakBasim);
  writeNotNull('ebelge_EFatGoruntule', instance.ebelgeEFatGoruntule);
  writeNotNull('ebelge_EFatAlisFatOlustur', instance.ebelgeEFatAlisFatOlustur);
  writeNotNull('ebelge_EFatGonder', instance.ebelgeEFatGonder);
  writeNotNull('ebelge_EFat_Dizayn', instance.ebelgeEFatDizayn);
  writeNotNull('ebelge_EArsiv', instance.ebelgeEArsiv);
  writeNotNull(
      'ebelge_EArsivTaslakOlustur', instance.ebelgeEArsivTaslakOlustur);
  writeNotNull('ebelge_EArsivTaslakSil', instance.ebelgeEArsivTaslakSil);
  writeNotNull('ebelge_EArsivTaslakBasim', instance.ebelgeEArsivTaslakBasim);
  writeNotNull('ebelge_EArsivGoruntule', instance.ebelgeEArsivGoruntule);
  writeNotNull('ebelge_EArsivSorgula', instance.ebelgeEArsivSorgula);
  writeNotNull('ebelge_EArsivGonder', instance.ebelgeEArsivGonder);
  writeNotNull('ebelge_EArsiv_Dizayn', instance.ebelgeEArsivDizayn);
  writeNotNull('ebelge_EIrsaliye', instance.ebelgeEIrsaliye);
  writeNotNull(
      'ebelge_EIrsaliyeGidenKutusu', instance.ebelgeEIrsaliyeGidenKutusu);
  writeNotNull(
      'ebelge_EIrsaliyeGelenKutusu', instance.ebelgeEIrsaliyeGelenKutusu);
  writeNotNull(
      'ebelge_EIrsaliyeTaslakOlustur', instance.ebelgeEIrsaliyeTaslakOlustur);
  writeNotNull('ebelge_EIrsaliyeTaslakSil', instance.ebelgeEIrsaliyeTaslakSil);
  writeNotNull(
      'ebelge_EIrsaliyeTaslakBasim', instance.ebelgeEIrsaliyeTaslakBasim);
  writeNotNull('ebelge_EIrsaliyeGonder', instance.ebelgeEIrsaliyeGonder);
  writeNotNull('ebelge_EIrsaliyeGoruntule', instance.ebelgeEIrsaliyeGoruntule);
  writeNotNull('ebelge_EIrsaliye_Dizayn', instance.ebelgeEIrsaliyeDizayn);
  writeNotNull('entegrasyon_UETDSESYA', instance.entegrasyonUETDSESYA);
  writeNotNull(
      'entegrasyon_UETDSESYA_Iptal', instance.entegrasyonUETDSESYAIptal);
  return val;
}

SevkemriMalKontrolTipi _$SevkemriMalKontrolTipiFromJson(
        Map<String, dynamic> json) =>
    SevkemriMalKontrolTipi()
      ..kod = json['Kod'] as int?
      ..tanim = json['Tanim'] as String?;

Map<String, dynamic> _$SevkemriMalKontrolTipiToJson(
    SevkemriMalKontrolTipi instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Kod', instance.kod);
  writeNotNull('Tanim', instance.tanim);
  return val;
}
