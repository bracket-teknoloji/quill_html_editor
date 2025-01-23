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
      ..yazdirmaDizaynSerbest =
          (json['yazdirma_Dizayn_Serbest'] as List<dynamic>?)
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
      ..yazdirmaUskYazicilari =
          (json['yazdirma_USK_Yazicilari'] as List<dynamic>?)
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
          ?.map((e) => (e as num).toInt())
          .toList()
      ..sirketSatisDepo = (json['sirket_satisDepo'] as num?)?.toInt()
      ..sirketSatisDepoOzellestir = json['sirket_satisDepo_Ozellestir'] as bool?
      ..sirketSatisDepoMusSip =
          (json['sirket_satisDepo_MusSip'] as num?)?.toInt()
      ..sirketSatisDepoSatisFat =
          (json['sirket_satisDepo_SatisFat'] as num?)?.toInt()
      ..sirketSatisDepoSatisIrs =
          (json['sirket_satisDepo_SatisIrs'] as num?)?.toInt()
      ..sirketAlisDepo = (json['sirket_alisDepo'] as num?)?.toInt()
      ..sirketIadeDepo = (json['sirket_iadeDepo'] as num?)?.toInt()
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
      ..malKabulAlisIrsKalemRaporu =
          json['malKabul_AlisIrs_KalemRaporu'] as bool?
      ..malKabulAlisIrsOtoBasimYap =
          json['malKabul_AlisIrs_OtoBasimYap'] as bool?
      ..malKabulAlisIrsKacGunlukKayitlarListelensin =
          (json['malKabul_AlisIrs_KacGunlukKayitlarListelensin'] as num?)
              ?.toInt()
      ..malKabulAlisIrsFiyatSirasi =
          (json['malKabul_AlisIrs_FiyatSirasi'] as num?)?.toInt()
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
      ..malKabulAlisFaturasiKaydet =
          json['malKabul_AlisFaturasi_Kaydet'] as bool?
      ..malKabulAlisFaturasiDuzelt =
          json['malKabul_AlisFaturasi_Duzelt'] as bool?
      ..malKabulAlisFaturasiSil = json['malKabul_AlisFaturasi_Sil'] as bool?
      ..malKabulAlisFatDigerSekmesiGoster =
          json['malKabul_AlisFat_DigerSekmesiGoster'] as bool?
      ..malKabulAlisFatKacGunlukKayitlarListelensin =
          (json['malKabul_AlisFat_KacGunlukKayitlarListelensin'] as num?)
              ?.toInt()
      ..malKabulAlisFatFiyatSirasi =
          (json['malKabul_AlisFat_FiyatSirasi'] as num?)?.toInt()
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
      ..malKabulAlisFatKalemRaporu =
          json['malKabul_AlisFat_KalemRaporu'] as bool?
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
          json['transfer_DAT_OnayIslemleri_Depolar'] as List<dynamic>?
      ..transferDatEkAlan2Hatirla = json['transfer_DAT_EkAlan2Hatirla'] as bool?
      ..transferDatEkAlan2Tablodan =
          json['transfer_DAT_EkAlan2Tablodan'] as bool?
      ..transferDatSeriGirisHarYapabilsin =
          json['transfer_DAT_SeriGirisHarYapabilsin'] as bool?
      ..transferDatBirim1DenKaydet =
          json['transfer_DAT_Birim1denKaydet'] as bool?
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
      ..transferDatSipBagSecenegi =
          json['transfer_DAT_SipBagSecenegi'] as String?
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
      ..transferAgVarsayilanDepo =
          (json['transfer_AG_VarsayilanDepo'] as num?)?.toInt()
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
      ..transferAgSipBagCokluSecim =
          json['transfer_AG_SipBag_CokluSecim'] as bool?
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
      ..transferAcVarsayilanDepo =
          (json['transfer_AC_VarsayilanDepo'] as num?)?.toInt()
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
      ..transferAcMinStokMikGoster =
          json['transfer_AC_MinStokMikGoster'] as String?
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
      ..transferAcSipBagCokluSecim =
          json['transfer_AC_SipBag_CokluSecim'] as bool?
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
          (json['sevkiyat_SatisIrsaliyesi_BelgeTipleri'] as List<dynamic>?)
              ?.map((e) => (e as num).toInt())
              .toList()
      ..sevkiyatSatisIrsaliyesiGizlenecekAlanlar =
          (json['sevkiyat_SatisIrsaliyesi_GizlenecekAlanlar'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList()
      ..sevkiyatSatisIrsaliyesiDegismeyecekAlanlar =
          (json['sevkiyat_SatisIrsaliyesi_DegismeyecekAlanlar']
                  as List<dynamic>?)
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
          json['sevkiyat_SatisIrs_SipBag_SipOkutulsun_KalanMiktarGelsin']
              as String?
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
      ..sevkiyatSatisIrsOtoBasimYap =
          json['sevkiyat_SatisIrs_OtoBasimYap'] as bool?
      ..sevkiyatSatisIrsKacGunlukKayitlarListelensin =
          (json['sevkiyat_SatisIrs_KacGunlukKayitlarListelensin'] as num?)
              ?.toInt()
      ..sevkiyatSatisIrsFiyatSirasi =
          (json['sevkiyat_SatisIrs_FiyatSirasi'] as num?)?.toInt()
      ..sevkiyatSatisIrsSeriGirisHarYapabilsin =
          json['sevkiyat_SatisIrs_SeriGirisHarYapabilsin'] as bool?
      ..sevkiyatSatisIrsEkAlan2Tablodan =
          json['sevkiyat_SatisIrs_EkAlan2Tablodan'] as bool?
      ..sevkiyatSatisIrsEkAlan2Hatirla =
          json['sevkiyat_SatisIrs_EkAlan2Hatirla'] as bool?
      ..sevkiyatSatisIrsOlcuBirimi =
          (json['sevkiyat_SatisIrs_OlcuBirimi'] as num?)?.toInt()
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
          (json['sevkiyat_SatisFat_KacGunlukKayitlarListelensin'] as num?)
              ?.toInt()
      ..sevkiyatSatisFatFiyatSirasi =
          (json['sevkiyat_SatisFat_FiyatSirasi'] as num?)?.toInt()
      ..sevkiyatSatisFatKalemlerBirlestirilsin =
          json['sevkiyat_SatisFat_KalemlerBirlestirilsin'] as bool?
      ..sevkiyatSatisFatEkAlan2Tablodan =
          json['sevkiyat_SatisFat_EkAlan2Tablodan'] as bool?
      ..sevkiyatSatisFatEkAlan2Hatirla =
          json['sevkiyat_SatisFat_EkAlan2Hatirla'] as bool?
      ..sevkiyatSatisFatFiltre = json['sevkiyat_SatisFat_Filtre'] as String?
      ..sevkiyatSatisFatFiltreSQL =
          json['sevkiyat_SatisFat_FiltreSQL'] as String?
      ..sevkiyatSatisFatOlcuBirimi =
          (json['sevkiyat_SatisFat_OlcuBirimi'] as num?)?.toInt()
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
      ..sevkiyatSatisFatDipFiyatKdvDurumu =
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
          (json['sevkemri_MalToplama_DegistirilemeyecekAlanlar']
                  as List<dynamic>?)
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
              json['sevkemri_MalKontrolTipi'] as Map<String, dynamic>)
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
      ..sayimKontrolMiktari =
          (json['sayim_Kontrol_Miktari'] as num?)?.toDouble()
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
      ..sayimEkAlanlar = (json['sayim_EkAlanlar'] as List<dynamic>?)
          ?.map((e) => (e as num).toInt())
          .toList()
      ..sayimDegismeyecekAlanlar =
          (json['sayim_DegismeyecekAlanlar'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList()
      ..sayimGizlenecekAlanlar =
          (json['sayim_GizlenecekAlanlar'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList()
      ..sayimVarsayilanOlcuBirimi =
          (json['sayim_VarsayilanOlcuBirimi'] as num?)?.toInt()
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
              ?.map((e) => (e as num).toInt())
              .toList()
      ..siparisMusteriSiparisiGizlenecekAlanlar =
          (json['siparis_MusteriSiparisi_GizlenecekAlanlar'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList()
      ..siparisMusteriSiparisiDegismeyecekAlanlar =
          (json['siparis_MusteriSiparisi_DegismeyecekAlanlar']
                  as List<dynamic>?)
              ?.map((e) => e as String)
              .toList()
      ..siparisMusSipEkstraAlanlar =
          (json['siparis_MusSip_EkstraAlanlar'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList()
      ..siparisMusteriSiparisiSatirAciklamaAlanlari =
          (json['siparis_MusteriSiparisi_SatirAciklamaAlanlari']
                  as List<dynamic>?)
              ?.map((e) => (e as num).toInt())
              .toList()
      ..siparisMusSipOlcuBirimi =
          (json['siparis_MusSip_OlcuBirimi'] as num?)?.toInt()
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
          (json['siparis_SaticiSiparisi_FiyatSirasi'] as num?)?.toInt()
      ..siparisSaticiSipBirim1DenKaydet =
          json['siparis_SaticiSip_Birim1denKaydet'] as bool?
      ..siparisSaticiSiparisiKapatmaIslemi =
          json['siparis_SaticiSiparisi_KapatmaIslemi'] as bool?
      ..siparisSaticiSipOnayIslemleri =
          json['siparis_SaticiSip_OnayIslemleri'] as bool?
      ..siparisSaticiSipDigerSekmesiGoster =
          json['siparis_SaticiSip_DigerSekmesiGoster'] as bool?
      ..siparisSaticiSipOlcuBirimi =
          (json['siparis_SaticiSip_OlcuBirimi'] as num?)?.toInt()
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
      ..cariAktiviteBitirmeyiGeriAl =
          json['cari_Aktivite_BitirmeyiGeriAl'] as bool?
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
      ..yoneticiBankaIslemHesapEft =
          json['yonetici_Banka_Islem_HesapEFT'] as bool?
      ..yoneticiBankaIslemHesapVirman =
          json['yonetici_Banka_Islem_HesapVirman'] as bool?
      ..yoneticiBankaIslemCariEft =
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
      ..yazdirmaDat = json['yazdirma_DAT'] as bool?
      ..yazdirmaDatYazicilari =
          (json['yazdirma_DAT_Yazicilari'] as List<dynamic>?)
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
      ..yazdirmaDizaynAlisFat =
          json['yazdirma_Dizayn_AlisFat'] as List<dynamic>?
      ..yazdirmaMustahsil = json['yazdirma_Mustahsil'] as bool?
      ..yazdirmaMusSip = json['yazdirma_MusSip'] as bool?
      ..yazdirmaMusSipYazicilari =
          json['yazdirma_MusSip_Yazicilari'] as List<dynamic>?
      ..yazdirmaDizaynMusSip =
          (json['yazdirma_Dizayn_MusSip'] as List<dynamic>?)
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
      ..yazdirmaDizaynAlisIrs =
          (json['yazdirma_Dizayn_AlisIrs'] as List<dynamic>?)
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
      ..sirketDepoUretimGiris =
          (json['sirket_Depo_Uretim_Giris'] as num?)?.toInt()
      ..sirketDepoUretimCikis =
          (json['sirket_Depo_Uretim_Cikis'] as num?)?.toInt()
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
      ..taltekStekCariKoduDegistir =
          json['taltek_STEK_CariKoduDegistir'] as bool?
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
      ..taltekStekBosGecilmeyecekAlanlar =
          (json['taltek_STEK_BosGecilmeyecekAlanlar'] as List<dynamic>?)
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
      ..taltekAtalCariKoduDegistir =
          json['taltek_ATAL_CariKoduDegistir'] as bool?
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
      ..taltekStal = json['taltek_STAL'] as bool?
      ..taltekStalKaydet = json['taltek_STAL_Kaydet'] as bool?
      ..taltekStalDuzelt = json['taltek_STAL_Duzelt'] as bool?
      ..taltekStalSil = json['taltek_STAL_Sil'] as bool?
      ..taltekStalKapalilarListenlenmesin =
          json['taltek_STAL_KapalilarListenlenmesin'] as bool?
      ..taltekStalOnayIslemleri = json['taltek_STAL_OnayIslemleri'] as bool?
      ..taltekStalCariKoduDegistir =
          json['taltek_STAL_CariKoduDegistir'] as bool?
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
      ..ebelgeEIrsaliyeDizayn =
          (json['ebelge_EIrsaliye_Dizayn'] as num?)?.toInt()
      ..entegrasyonUetdsesya = json['entegrasyon_UETDSESYA'] as bool?
      ..entegrasyonUetdsesyaIptal = json['entegrasyon_UETDSESYA_Iptal'] as bool?
      ..transferDatTekrarEdenBarkod =
          json['transfer_DAT_TekrarEdenBarkod'] as String?
      ..transferDatAciklamaDuzenle =
          json['transfer_DAT_AciklamaDuzenle'] as bool?
      ..transferDatLokalDatSeciliGelmesin =
          json['transfer_DAT_LokalDATSeciliGelmesin'] as bool?
      ..transferDatVarsayilanHarTuruDegistiremesin =
          json['transfer_DAT_VarsayilanHarTuruDegistiremesin'] as bool?
      ..transferDatDepoCaridenGelsin =
          json['transfer_DAT_DepoCaridenGelsin'] as bool?
      ..transferAgSipBagSecenegi = json['transfer_AG_SipBagSecenegi'] as String?
      ..transferAgTekrarEdenBarkod =
          json['transfer_AG_TekrarEdenBarkod'] as String?
      ..transferAgAciklamaDuzenle = json['transfer_AG_AciklamaDuzenle'] as bool?
      ..transferAcSipBagSecenegi = json['transfer_AC_SipBagSecenegi'] as String?
      ..transferAcTekrarEdenBarkod =
          json['transfer_AC_TekrarEdenBarkod'] as String?
      ..transferAcAciklamaDuzenle = json['transfer_AC_AciklamaDuzenle'] as bool?
      ..transferDepoTalebiBildirim =
          json['transfer_DepoTalebi_Bildirim'] as bool?
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
      ..sevkemriMalToplamaYontemi =
          json['sevkemri_MalToplama_Yontemi'] as String?
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
      ..tahsilatDovizKuruTolerans =
          (json['tahsilat_DovizKuru_Tolerans'] as num?)?.toDouble()
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
      ..sevkiyatSatisFatKdvDurumu =
          json['sevkiyat_SatisFat_KdvDurumu'] as String?
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
      ..stokStokKartiFiyatlariGizle =
          json['stok_StokKarti_FiyatlariGizle'] as bool?
      ..stokBarkodTanimlamaZorunluBarkodTipi =
          json['stok_BarkodTanimlama_ZorunluBarkodTipi'] as String?
      ..stokCariStokFiltresiUygulansin =
          json['stok_CariStokFiltresiUygulansin'] as bool?
      ..cariKodDegistir = json['cari_KodDegistir'] as bool?
      ..cariRapDovizliBorcAlacakDokumu =
          json['cari_Rap_DovizliBorcAlacakDokumu'] as bool?
      ..cariRapUrunGrubunaGoreSatis =
          json['cari_Rap_UrunGrubunaGoreSatis'] as bool?
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
          (json['siparis_SaticiSiparisi_SatirAciklamaAlanlari']
                  as List<dynamic>?)
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
      ..malKabulAlisIrsEMailGonder =
          json['malKabul_AlisIrs_EMailGonder'] as bool?
      ..malKabulAlisIrsEMailGonderBaslik =
          json['malKabul_AlisIrs_EMailGonder_Baslik'] as String?
      ..malKabulAlisIrsEMailGonderDizayn =
          (json['malKabul_AlisIrs_EMailGonder_Dizayn'] as num?)?.toInt()
      ..malKabulAlisFatBildirim = json['malKabul_AlisFat_Bildirim'] as bool?
      ..malKabulAlisFatEMailGonder =
          json['malKabul_AlisFat_EMailGonder'] as bool?
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
      ..sevkiyatSatisIrsEMailGonder =
          json['sevkiyat_SatisIrs_EMailGonder'] as bool?
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
      ..sevkiyatSatisFatEMailGonder =
          json['sevkiyat_SatisFat_EMailGonder'] as bool?
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
                  json['uretim_USK_BarkodSayisiSaklanacakAlan'] as String)
      ..malKabulAlisIrsBarkodSayisiSaklanacakAlan =
          json['malKabul_AlisIrs_BarkodSayisiSaklanacakAlan'] == null
              ? null
              : BarkodSayisiSaklanacakAlan.fromJson(
                  json['malKabul_AlisIrs_BarkodSayisiSaklanacakAlan'] as String)
      ..malKabulAlisFatBarkodSayisiSaklanacakAlan =
          json['malKabul_AlisFat_BarkodSayisiSaklanacakAlan'] == null
              ? null
              : BarkodSayisiSaklanacakAlan.fromJson(
                  json['malKabul_AlisFat_BarkodSayisiSaklanacakAlan'] as String)
      ..transferDatBarkodSayisiSaklanacakAlan =
          json['transfer_DAT_BarkodSayisiSaklanacakAlan'] == null
              ? null
              : BarkodSayisiSaklanacakAlan.fromJson(
                  json['transfer_DAT_BarkodSayisiSaklanacakAlan'] as String)
      ..sevkiyatSatisIrsBarkodSayisiSaklanacakAlan =
          json['sevkiyat_SatisIrs_BarkodSayisiSaklanacakAlan'] == null
              ? null
              : BarkodSayisiSaklanacakAlan.fromJson(
                  json['sevkiyat_SatisIrs_BarkodSayisiSaklanacakAlan']
                      as String)
      ..sevkiyatSatisFatSipBagSipOkutulsunKalanMiktarGelsin =
          json['sevkiyat_SatisFat_SipBag_SipOkutulsun_KalanMiktarGelsin']
              as String?
      ..transferAcVarsayilanHarTuru =
          json['transfer_AC_VarsayilanHarTuru'] as String?
      ..transferAcVarsayilanCikisYeri =
          json['transfer_AC_VarsayilanCikisYeri'] as String?
      ..transferDepoTalebiRehberdenStokSecilmesin =
          json['transfer_DepoTalebi_RehberdenStokSecilmesin'] as String?
      ..stokCariHarGizlenecekAlanlar =
          (json['stok_CariHar_GizlenecekAlanlar'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList();

Map<String, dynamic> _$ProfilYetkiModelToJson(ProfilYetkiModel instance) =>
    <String, dynamic>{
      if (instance.yazdirmaSatisIrsYazicilari case final value?)
        'yazdirma_SatisIrs_Yazicilari': value,
      if (instance.yazdirmaDizaynSatisIrs case final value?)
        'yazdirma_Dizayn_SatisIrs': value,
      if (instance.yazdirmaSatisTalebi case final value?)
        'yazdirma_SatisTalebi': value,
      if (instance.yazdirmaSatisTalebiYazicilari case final value?)
        'yazdirma_SatisTalebi_Yazicilari': value,
      if (instance.yazdirmaDizaynSatisTalebi case final value?)
        'yazdirma_Dizayn_SatisTalebi': value,
      if (instance.yazdirmaSatisTeklifi case final value?)
        'yazdirma_SatisTeklifi': value,
      if (instance.yazdirmaDizaynSatisTeklifi case final value?)
        'yazdirma_Dizayn_SatisTeklifi': value,
      if (instance.yazdirmaSayim case final value?) 'yazdirma_Sayim': value,
      if (instance.yazdirmaSayimYazicilari case final value?)
        'yazdirma_Sayim_Yazicilari': value,
      if (instance.yazdirmaDizaynSayim case final value?)
        'yazdirma_Dizayn_Sayim': value,
      if (instance.yazdirmaSevkiyatEtiketi case final value?)
        'yazdirma_Sevkiyat_Etiketi': value,
      if (instance.yazdirmaSevkiyatEtiketiYazicilari case final value?)
        'yazdirma_Sevkiyat_Etiketi_Yazicilari': value,
      if (instance.yazdirmaDizaynSevkiyatEtiketi case final value?)
        'yazdirma_Dizayn_SevkiyatEtiketi': value,
      if (instance.yazdirmaSevkiyatEtiketiKopyaSayisiGizle case final value?)
        'yazdirma_Sevkiyat_Etiketi_KopyaSayisiGizle': value,
      if (instance.yazdirmaSerbest case final value?) 'yazdirma_Serbest': value,
      if (instance.yazdirmaSerbestYazicilari case final value?)
        'yazdirma_Serbest_Yazicilari': value,
      if (instance.yazdirmaDizaynSerbest case final value?)
        'yazdirma_Dizayn_Serbest': value,
      if (instance.yazdirmaSeriEtiketi case final value?)
        'yazdirma_SeriEtiketi': value,
      if (instance.yazdirmaSeriEtiketiYazicilari case final value?)
        'yazdirma_Seri_Etiketi_Yazicilari': value,
      if (instance.yazdirmaDizaynSeriEtiketi case final value?)
        'yazdirma_Dizayn_SeriEtiketi': value,
      if (instance.yazdirmaStokEtiketi case final value?)
        'yazdirma_Stok_Etiketi': value,
      if (instance.yazdirmaStokEtiketiYazicilari case final value?)
        'yazdirma_Stok_Etiketi_Yazicilari': value,
      if (instance.yazdirmaDizaynStokEtiketi case final value?)
        'yazdirma_Dizayn_StokEtiketi': value,
      if (instance.yazdirmaTahsilatMakbuzu case final value?)
        'yazdirma_TahsilatMakbuzu': value,
      if (instance.yazdirmaDizaynTahsilatMakbuzu case final value?)
        'yazdirma_Dizayn_TahsilatMakbuzu': value,
      if (instance.yazdirmaUsk case final value?) 'yazdirma_USK': value,
      if (instance.yazdirmaUskYazicilari case final value?)
        'yazdirma_USK_Yazicilari': value,
      if (instance.yazdirmaDizaynUSK case final value?)
        'yazdirma_Dizayn_USK': value,
      if (instance.yazdirmaUretMalTop case final value?)
        'yazdirma_UretMalTop': value,
      if (instance.yazdirmaUretMalTopYazicilari case final value?)
        'yazdirma_UretMalTop_Yazicilari': value,
      if (instance.yazdirmaDizaynUretMalTop case final value?)
        'yazdirma_Dizayn_UretMalTop': value,
      if (instance.kullanicilar case final value?) 'kullanicilar': value,
      if (instance.sirketTamEkranAcilsin case final value?)
        'sirket_TamEkranAcilsin': value,
      if (instance.sirketRehberdeCariKodGizle case final value?)
        'sirket_RehberdeCariKodGizle': value,
      if (instance.sirketRehberdeStokKodGizle case final value?)
        'sirket_RehberdeStokKodGizle': value,
      if (instance.sirketRaporlardaFiyatGizle case final value?)
        'sirket_RaporlardaFiyatGizle': value,
      if (instance.sirketTarihDegismesin case final value?)
        'sirket_TarihDegismesin': value,
      if (instance.sirketDevirSirketineGiris case final value?)
        'sirket_DevirSirketineGiris': value,
      if (instance.sirketKontrolluAktarBelgeTipleri case final value?)
        'sirket_KontrolluAktar_BelgeTipleri': value,
      if (instance.sirketKontrolluAktarBelgeNoGoster case final value?)
        'sirket_KontrolluAktar_BelgeNoGoster': value,
      if (instance.sirketKontrolAciklamasiBelgeTipleri case final value?)
        'sirket_KontrolAciklamasi_BelgeTipleri': value,
      if (instance.sirketTLFiyatGelsinBelgeTipleri case final value?)
        'sirket_TLFiyatGelsin_BelgeTipleri': value,
      if (instance.sirketKalemKayitKontrolBelgeTipleri case final value?)
        'sirket_KalemKayitKontrol_BelgeTipleri': value,
      if (instance.sirketAktifDepolar case final value?)
        'sirket_aktifDepolar': value,
      if (instance.sirketSatisDepo case final value?) 'sirket_satisDepo': value,
      if (instance.sirketSatisDepoOzellestir case final value?)
        'sirket_satisDepo_Ozellestir': value,
      if (instance.sirketSatisDepoMusSip case final value?)
        'sirket_satisDepo_MusSip': value,
      if (instance.sirketSatisDepoSatisFat case final value?)
        'sirket_satisDepo_SatisFat': value,
      if (instance.sirketSatisDepoSatisIrs case final value?)
        'sirket_satisDepo_SatisIrs': value,
      if (instance.sirketAlisDepo case final value?) 'sirket_alisDepo': value,
      if (instance.sirketIadeDepo case final value?) 'sirket_iadeDepo': value,
      if (instance.sirketProjeKodu case final value?) 'sirket_projeKodu': value,
      if (instance.sirketAktifProjeler case final value?)
        'sirket_aktifProjeler': value,
      if (instance.ayarlarFirmaAyarlari case final value?)
        'ayarlar_FirmaAyarlari': value,
      if (instance.ayarlarOturumlar case final value?)
        'ayarlar_Oturumlar': value,
      if (instance.sirketSifreHatirlamaDurumu case final value?)
        'sirket_SifreHatirlamaDurumu': value,
      if (instance.genelDovizKurlari case final value?)
        'genel_DovizKurlari': value,
      if (instance.genelDovizKurlariEkle case final value?)
        'genel_DovizKurlari_Ekle': value,
      if (instance.genelDovizKurlariDuzelt case final value?)
        'genel_DovizKurlari_Duzelt': value,
      if (instance.genelDovizKurlariSil case final value?)
        'genel_DovizKurlari_Sil': value,
      if (instance.genelBelgeKontrol case final value?)
        'genel_BelgeKontrol': value,
      if (instance.genelBelgeKontrolEkle case final value?)
        'genel_BelgeKontrol_Ekle': value,
      if (instance.genelBelgeKontrolSil case final value?)
        'genel_BelgeKontrol_Sil': value,
      if (instance.genelBelgeKontrolBelgeTipleri case final value?)
        'genel_BelgeKontrol_BelgeTipleri': value,
      if (instance.genelBelgeKontrolBarkodOkutsun case final value?)
        'genel_BelgeKontrol_BarkodOkutsun': value,
      if (instance.genelBelgeKontrolMiktarOtomatikGelsin case final value?)
        'genel_BelgeKontrol_MiktarOtomatikGelsin': value,
      if (instance.genelBelgeKontrolKalemDetaySorulmasin case final value?)
        'genel_BelgeKontrol_KalemDetaySorulmasin': value,
      if (instance.genelBelgeKontrolBelgeOnaySormasin case final value?)
        'genel_BelgeKontrol_BelgeOnaySormasin': value,
      if (instance.malKabulFiyatDegistirilmesin case final value?)
        'malKabul_FiyatDegistirilmesin': value,
      if (instance.malKabulAlisIrsBelgeTipleri case final value?)
        'malKabul_AlisIrs_BelgeTipleri': value,
      if (instance.malKabulAlisIrsGizlenecekAlanlar case final value?)
        'malKabul_AlisIrs_GizlenecekAlanlar': value,
      if (instance.malKabulAlisFatGizlenecekAlanlar case final value?)
        'malKabul_AlisFat_GizlenecekAlanlar': value,
      if (instance.malKabulAlisIrsAciklamaAlanlari case final value?)
        'malKabul_AlisIrs_AciklamaAlanlari': value,
      if (instance.malKabulSatinAlma case final value?)
        'malKabul_SatinAlma': value,
      if (instance.malKabulSatinAlmaKaydet case final value?)
        'malKabul_SatinAlma_Kaydet': value,
      if (instance.malKabulSatinAlmaDuzelt case final value?)
        'malKabul_SatinAlma_Duzelt': value,
      if (instance.malKabulSatinAlmaSil case final value?)
        'malKabul_SatinAlma_Sil': value,
      if (instance.malKabulAlisIrsaliyesiFiyatGor case final value?)
        'malKabul_AlisIrsaliyesiFiyatGor': value,
      if (instance.malKabulAlisIrsDigerSekmesiGoster case final value?)
        'malKabul_AlisIrs_DigerSekmesiGoster': value,
      if (instance.malKabulAlisIrsSipBagSecenegi case final value?)
        'malKabul_AlisIrs_SipBagSecenegi': value,
      if (instance.malKabulAlisIrsReferansStokUygulamasi case final value?)
        'malKabul_AlisIrs_ReferansStokUygulamasi': value,
      if (instance.malKabulAlisIrsSipBagSipHariciKalemEklenebilir
          case final value?)
        'malKabul_AlisIrs_SipBag_SipHariciKalemEklenebilir': value,
      if (instance.malKabulAlisIrsSipBagFazlaTeslimatYapilabilir
          case final value?)
        'malKabul_AlisIrs_SipBag_FazlaTeslimatYapilabilir': value,
      if (instance.malKabulAlisIrsSipBagSipOkutulsun case final value?)
        'malKabul_AlisIrs_SipBag_SipOkutulsun': value,
      if (instance.malKabulAlisIrsSipBagCokluSecim case final value?)
        'malKabul_AlisIrs_SipBag_CokluSecim': value,
      if (instance.malKabulAlisIrsSipBagTumKalemlerSecilsin case final value?)
        'malKabul_AlisIrs_SipBag_TumKalemlerSecilsin': value,
      if (instance.malKabulAlisIrsSipBagEslesmeDurumu case final value?)
        'malKabul_AlisIrs_SipBag_EslesmeDurumu': value,
      if (instance.malKabulAlisIrsBarkodluGiris case final value?)
        'malKabul_AlisIrs_BarkodluGiris': value,
      if (instance.malKabulAlisIrsMiktarOtomatikGelsin case final value?)
        'malKabul_AlisIrs_MiktarOtomatikGelsin': value,
      if (instance.malKabulAlisIrsKalemDetaySorulmasin case final value?)
        'malKabul_AlisIrs_KalemDetaySorulmasin': value,
      if (instance.malKabulAlisIrsKalemlerBirlestirilsin case final value?)
        'malKabul_AlisIrs_KalemlerBirlestirilsin': value,
      if (instance.malKabulAlisIrsStokRehberiAcilmasin case final value?)
        'malKabul_AlisIrs_StokRehberiAcilmasin': value,
      if (instance.malKabulAlisIrsKalemDuzeltilemesin case final value?)
        'malKabul_AlisIrs_KalemDuzeltilemesin': value,
      if (instance.malKabulAlisIrsTekrarEdenBarkod case final value?)
        'malKabul_AlisIrs_TekrarEdenBarkod': value,
      if (instance.malKabulAlisIrsKlavyeEngelle case final value?)
        'malKabul_AlisIrs_KlavyeEngelle': value,
      if (instance.malKabulAlisIrsMiktar1Gelsin case final value?)
        'malKabul_AlisIrs_Miktar1Gelsin': value,
      if (instance.malKabulAlisIrsRaporlar case final value?)
        'malKabul_AlisIrs_Raporlar': value,
      if (instance.malKabulAlisIrsKalemRaporu case final value?)
        'malKabul_AlisIrs_KalemRaporu': value,
      if (instance.malKabulAlisIrsOtoBasimYap case final value?)
        'malKabul_AlisIrs_OtoBasimYap': value,
      if (instance.malKabulAlisIrsKacGunlukKayitlarListelensin
          case final value?)
        'malKabul_AlisIrs_KacGunlukKayitlarListelensin': value,
      if (instance.malKabulAlisIrsFiyatSirasi case final value?)
        'malKabul_AlisIrs_FiyatSirasi': value,
      if (instance.malKabulAlisIrsCariKoduDegistir case final value?)
        'malKabul_AlisIrs_CariKoduDegistir': value,
      if (instance.malKabulAlisIrsCariRehPlaEslesmesin case final value?)
        'malKabul_AlisIrs_CariRehPlaEslesmesin': value,
      if (instance.malKabulIade case final value?) 'malKabul_Iade': value,
      if (instance.malKabulIadeKaydet case final value?)
        'malKabul_Iade_Kaydet': value,
      if (instance.malKabulIadeDuzelt case final value?)
        'malKabul_Iade_Duzelt': value,
      if (instance.malKabulIadeSil case final value?)
        'malKabul_Iade_Sil': value,
      if (instance.malKabulAlisFaturasiBelgeTipleri case final value?)
        'malKabul_AlisFaturasi_BelgeTipleri': value,
      if (instance.malKabulAlisFaturasi case final value?)
        'malKabul_AlisFaturasi': value,
      if (instance.malKabulAlisFaturasiKaydet case final value?)
        'malKabul_AlisFaturasi_Kaydet': value,
      if (instance.malKabulAlisFaturasiDuzelt case final value?)
        'malKabul_AlisFaturasi_Duzelt': value,
      if (instance.malKabulAlisFaturasiSil case final value?)
        'malKabul_AlisFaturasi_Sil': value,
      if (instance.malKabulAlisFatDigerSekmesiGoster case final value?)
        'malKabul_AlisFat_DigerSekmesiGoster': value,
      if (instance.malKabulAlisFatKacGunlukKayitlarListelensin
          case final value?)
        'malKabul_AlisFat_KacGunlukKayitlarListelensin': value,
      if (instance.malKabulAlisFatFiyatSirasi case final value?)
        'malKabul_AlisFat_FiyatSirasi': value,
      if (instance.malKabulAlisFatAciklamalarYetkiTuru case final value?)
        'malKabul_AlisFat_Aciklamalar_YetkiTuru': value,
      if (instance.malKabulAlisFatAciklamaAlanlari case final value?)
        'malKabul_AlisFat_AciklamaAlanlari': value,
      if (instance.malKabulAlisFatCariKoduDegistir case final value?)
        'malKabul_AlisFat_CariKoduDegistir': value,
      if (instance.malKabulAlisFatBarkodluGiris case final value?)
        'malKabul_AlisFat_BarkodluGiris': value,
      if (instance.malKabulAlisFatMiktarOtomatikGelsin case final value?)
        'malKabul_AlisFat_MiktarOtomatikGelsin': value,
      if (instance.malKabulAlisFatKalemDetaySorulmasin case final value?)
        'malKabul_AlisFat_KalemDetaySorulmasin': value,
      if (instance.malKabulAlisFatStokRehberiAcilmasin case final value?)
        'malKabul_AlisFat_StokRehberiAcilmasin': value,
      if (instance.malKabulAlisFatKalemDuzeltilemesin case final value?)
        'malKabul_AlisFat_KalemDuzeltilemesin': value,
      if (instance.malKabulAlisFatKlavyeEngelle case final value?)
        'malKabul_AlisFat_KlavyeEngelle': value,
      if (instance.malKabulAlisFatMiktar1Gelsin case final value?)
        'malKabul_AlisFat_Miktar1Gelsin': value,
      if (instance.malKabulAlisFatReferansStokUygulamasi case final value?)
        'malKabul_AlisFat_ReferansStokUygulamasi': value,
      if (instance.malKabulAlisFatSipBagSipHariciKalemEklenebilir
          case final value?)
        'malKabul_AlisFat_SipBag_SipHariciKalemEklenebilir': value,
      if (instance.malKabulAlisFatSipBagFazlaTeslimatYapilabilir
          case final value?)
        'malKabul_AlisFat_SipBag_FazlaTeslimatYapilabilir': value,
      if (instance.malKabulAlisFatSipBagSipOkutulsun case final value?)
        'malKabul_AlisFat_SipBag_SipOkutulsun': value,
      if (instance.malKabulAlisFatSipBagCokluSecim case final value?)
        'malKabul_AlisFat_SipBag_CokluSecim': value,
      if (instance.malKabulAlisFatSipBagTumKalemlerSecilsin case final value?)
        'malKabul_AlisFat_SipBag_TumKalemlerSecilsin': value,
      if (instance.malKabulAlisFatSipBagEslesmeDurumu case final value?)
        'malKabul_AlisFat_SipBag_EslesmeDurumu': value,
      if (instance.malKabulAlisFatRaporlar case final value?)
        'malKabul_AlisFat_Raporlar': value,
      if (instance.malKabulAlisFatKalemRaporu case final value?)
        'malKabul_AlisFat_KalemRaporu': value,
      if (instance.malKabulMustahsil case final value?)
        'malKabul_Mustahsil': value,
      if (instance.malKabulMustahsilEkle case final value?)
        'malKabul_Mustahsil_Ekle': value,
      if (instance.malKabulMustahsilDuzelt case final value?)
        'malKabul_Mustahsil_Duzelt': value,
      if (instance.malKabulMustahsilSil case final value?)
        'malKabul_Mustahsil_Sil': value,
      if (instance.transferDat case final value?) 'transfer_DAT': value,
      if (instance.transferDatKaydet case final value?)
        'transfer_DAT_Kaydet': value,
      if (instance.transferDatDuzelt case final value?)
        'transfer_DAT_Duzelt': value,
      if (instance.transferDatSil case final value?) 'transfer_DAT_Sil': value,
      if (instance.transferDatFiyatGor case final value?)
        'transfer_DAT_FiyatGor': value,
      if (instance.transferDatOtoEtiketBas case final value?)
        'transfer_DAT_OtoEtiketBas': value,
      if (instance.transferDatVarsayilanCikisDepo case final value?)
        'transfer_DAT_VarsayilanCikisDepo': value,
      if (instance.transferDatVarsayilanGirisDepo case final value?)
        'transfer_DAT_VarsayilanGirisDepo': value,
      if (instance.transferDatEIrsIsaretleyemesin case final value?)
        'transfer_DAT_eIrsIsaretleyemesin': value,
      if (instance.transferDatDigerSekmesiGoster case final value?)
        'transfer_DAT_DigerSekmesiGoster': value,
      if (instance.transferDatBarkodluGiris case final value?)
        'transfer_DAT_BarkodluGiris': value,
      if (instance.transferDatMiktarOtomatikGelsin case final value?)
        'transfer_DAT_MiktarOtomatikGelsin': value,
      if (instance.transferDatKalemDetaySorulmasin case final value?)
        'transfer_DAT_KalemDetaySorulmasin': value,
      if (instance.transferDatStokRehberiAcilmasin case final value?)
        'transfer_DAT_StokRehberiAcilmasin': value,
      if (instance.transferDatKalemDuzeltilemesin case final value?)
        'transfer_DAT_KalemDuzeltilemesin': value,
      if (instance.transferDatKlavyeEngelle case final value?)
        'transfer_DAT_KlavyeEngelle': value,
      if (instance.transferDatMiktar1Gelsin case final value?)
        'transfer_DAT_Miktar1Gelsin': value,
      if (instance.transferDatKalemlerBirlestirilsin case final value?)
        'transfer_DAT_KalemlerBirlestirilsin': value,
      if (instance.transferDatKacGunlukKayitlarListelensin case final value?)
        'transfer_DAT_KacGunlukKayitlarListelensin': value,
      if (instance.transferDatOnayIslemleri case final value?)
        'transfer_DAT_OnayIslemleri': value,
      if (instance.transferDatOnayIslemleriDepolar case final value?)
        'transfer_DAT_OnayIslemleri_Depolar': value,
      if (instance.transferDatEkAlan2Hatirla case final value?)
        'transfer_DAT_EkAlan2Hatirla': value,
      if (instance.transferDatEkAlan2Tablodan case final value?)
        'transfer_DAT_EkAlan2Tablodan': value,
      if (instance.transferDatSeriGirisHarYapabilsin case final value?)
        'transfer_DAT_SeriGirisHarYapabilsin': value,
      if (instance.transferDatBirim1DenKaydet case final value?)
        'transfer_DAT_Birim1denKaydet': value,
      if (instance.transferDatBarkod2Sor case final value?)
        'transfer_DAT_Barkod2Sor': value,
      if (instance.transferDatBosGecilmeyecekAlanlar case final value?)
        'transfer_DAT_BosGecilmeyecekAlanlar': value,
      if (instance.transferDatGizlenecekAlanlar case final value?)
        'transfer_DAT_GizlenecekAlanlar': value,
      if (instance.transferDatDegismeyecekAlanlar case final value?)
        'transfer_DAT_DegismeyecekAlanlar': value,
      if (instance.transferDatAciklamaAlanlari case final value?)
        'transfer_DAT_AciklamaAlanlari': value,
      if (instance.transferDatSipBagSecenegi case final value?)
        'transfer_DAT_SipBagSecenegi': value,
      if (instance.transferDatReferansStokUygulamasi case final value?)
        'transfer_DAT_ReferansStokUygulamasi': value,
      if (instance.transferDatSipBagSipHariciKalemEklenebilir case final value?)
        'transfer_DAT_SipBag_SipHariciKalemEklenebilir': value,
      if (instance.transferDatSipBagFazlaTeslimatYapilabilir case final value?)
        'transfer_DAT_SipBag_FazlaTeslimatYapilabilir': value,
      if (instance.transferDatSipBagSipOkutulsun case final value?)
        'transfer_DAT_SipBag_SipOkutulsun': value,
      if (instance.transferDatSipBagSipOkutulsunMiktar2BazAl case final value?)
        'transfer_DAT_SipBag_SipOkutulsun_Miktar2BazAl': value,
      if (instance.transferDatSipBagSipOkutulsunKalanMiktarGelsin
          case final value?)
        'transfer_DAT_SipBag_SipOkutulsun_KalanMiktarGelsin': value,
      if (instance.transferDatSipBagCokluSecim case final value?)
        'transfer_DAT_SipBag_CokluSecim': value,
      if (instance.transferDatSipBagTumKalemlerSecilsin case final value?)
        'transfer_DAT_SipBag_TumKalemlerSecilsin': value,
      if (instance.transferDatSipBagEslesmeDurumu case final value?)
        'transfer_DAT_SipBag_EslesmeDurumu': value,
      if (instance.transferDatSipBagMalToplananlarGelsin case final value?)
        'transfer_DAT_SipBag_MalToplananlarGelsin': value,
      if (instance.transferDatSipBagSevkOnayliSiparislerGelsin
          case final value?)
        'transfer_DAT_SipBag_SevkOnayliSiparislerGelsin': value,
      if (instance.transferAg case final value?) 'transfer_AG': value,
      if (instance.transferAgKaydet case final value?)
        'transfer_AG_Kaydet': value,
      if (instance.transferAgDuzelt case final value?)
        'transfer_AG_Duzelt': value,
      if (instance.transferAgSil case final value?) 'transfer_AG_Sil': value,
      if (instance.transferAgFiyatGor case final value?)
        'transfer_AG_FiyatGor': value,
      if (instance.transferAgKacGunlukKayitlarListelensin case final value?)
        'transfer_AG_KacGunlukKayitlarListelensin': value,
      if (instance.transferAgVarsayilanDepo case final value?)
        'transfer_AG_VarsayilanDepo': value,
      if (instance.transferAgDigerSekmesiGoster case final value?)
        'transfer_AG_DigerSekmesiGoster': value,
      if (instance.transferAgBelgeKopyala case final value?)
        'transfer_AG_BelgeKopyala': value,
      if (instance.transferAgOtoBasimYap case final value?)
        'transfer_AG_OtoBasimYap': value,
      if (instance.transferAgSeriGirisHarYapabilsin case final value?)
        'transfer_AG_SeriGirisHarYapabilsin': value,
      if (instance.transferAgBarkodluGiris case final value?)
        'transfer_AG_BarkodluGiris': value,
      if (instance.transferAgMiktarOtomatikGelsin case final value?)
        'transfer_AG_MiktarOtomatikGelsin': value,
      if (instance.transferAgKalemDetaySorulmasin case final value?)
        'transfer_AG_KalemDetaySorulmasin': value,
      if (instance.transferAgStokRehberiAcilmasin case final value?)
        'transfer_AG_StokRehberiAcilmasin': value,
      if (instance.transferAgKalemDuzeltilemesin case final value?)
        'transfer_AG_KalemDuzeltilemesin': value,
      if (instance.transferAgKlavyeEngelle case final value?)
        'transfer_AG_KlavyeEngelle': value,
      if (instance.transferAgMiktar1Gelsin case final value?)
        'transfer_AG_Miktar1Gelsin': value,
      if (instance.transferAgReferansStokUygulamasi case final value?)
        'transfer_AG_ReferansStokUygulamasi': value,
      if (instance.transferAgSipBagSipHariciKalemEklenebilir case final value?)
        'transfer_AG_SipBag_SipHariciKalemEklenebilir': value,
      if (instance.transferAgSipBagFazlaTeslimatYapilabilir case final value?)
        'transfer_AG_SipBag_FazlaTeslimatYapilabilir': value,
      if (instance.transferAgSipBagSipOkutulsun case final value?)
        'transfer_AG_SipBag_SipOkutulsun': value,
      if (instance.transferAgSipBagSipOkutulsunMiktar2BazAl case final value?)
        'transfer_AG_SipBag_SipOkutulsun_Miktar2BazAl': value,
      if (instance.transferAgSipBagCokluSecim case final value?)
        'transfer_AG_SipBag_CokluSecim': value,
      if (instance.transferAgSipBagTumKalemlerSecilsin case final value?)
        'transfer_AG_SipBag_TumKalemlerSecilsin': value,
      if (instance.transferAgSipBagEslesmeDurumu case final value?)
        'transfer_AG_SipBag_EslesmeDurumu': value,
      if (instance.transferAgSipBagMalToplananlarGelsin case final value?)
        'transfer_AG_SipBag_MalToplananlarGelsin': value,
      if (instance.transferAgSipBagSevkOnayliSiparislerGelsin case final value?)
        'transfer_AG_SipBag_SevkOnayliSiparislerGelsin': value,
      if (instance.transferAc case final value?) 'transfer_AC': value,
      if (instance.transferAcKaydet case final value?)
        'transfer_AC_Kaydet': value,
      if (instance.transferAcDuzelt case final value?)
        'transfer_AC_Duzelt': value,
      if (instance.transferAcSil case final value?) 'transfer_AC_Sil': value,
      if (instance.transferAcFiyatGor case final value?)
        'transfer_AC_FiyatGor': value,
      if (instance.transferAcKacGunlukKayitlarListelensin case final value?)
        'transfer_AC_KacGunlukKayitlarListelensin': value,
      if (instance.transferAcVarsayilanDepo case final value?)
        'transfer_AC_VarsayilanDepo': value,
      if (instance.transferAcEIrsIsaretleyemesin case final value?)
        'transfer_AC_eIrsIsaretleyemesin': value,
      if (instance.transferAcDigerSekmesiGoster case final value?)
        'transfer_AC_DigerSekmesiGoster': value,
      if (instance.transferAcBelgeKopyala case final value?)
        'transfer_AC_BelgeKopyala': value,
      if (instance.transferAcOtoBasimYap case final value?)
        'transfer_AC_OtoBasimYap': value,
      if (instance.transferAcSeriGirisHarYapabilsin case final value?)
        'transfer_AC_SeriGirisHarYapabilsin': value,
      if (instance.transferAcEkAlan2Tablodan case final value?)
        'transfer_AC_EkAlan2Tablodan': value,
      if (instance.transferAcEkAlan2Hatirla case final value?)
        'transfer_AC_EkAlan2Hatirla': value,
      if (instance.transferAcMinStokMikGoster case final value?)
        'transfer_AC_MinStokMikGoster': value,
      if (instance.transferAcBosGecilmeyecekAlanlar case final value?)
        'transfer_AC_BosGecilmeyecekAlanlar': value,
      if (instance.transferAcBarkodluGiris case final value?)
        'transfer_AC_BarkodluGiris': value,
      if (instance.transferAcMiktarOtomatikGelsin case final value?)
        'transfer_AC_MiktarOtomatikGelsin': value,
      if (instance.transferAcKalemDetaySorulmasin case final value?)
        'transfer_AC_KalemDetaySorulmasin': value,
      if (instance.transferAcStokRehberiAcilmasin case final value?)
        'transfer_AC_StokRehberiAcilmasin': value,
      if (instance.transferAcKalemDuzeltilemesin case final value?)
        'transfer_AC_KalemDuzeltilemesin': value,
      if (instance.transferAcKlavyeEngelle case final value?)
        'transfer_AC_KlavyeEngelle': value,
      if (instance.transferAcMiktar1Gelsin case final value?)
        'transfer_AC_Miktar1Gelsin': value,
      if (instance.transferAcReferansStokUygulamasi case final value?)
        'transfer_AC_ReferansStokUygulamasi': value,
      if (instance.transferAcSipBagSipHariciKalemEklenebilir case final value?)
        'transfer_AC_SipBag_SipHariciKalemEklenebilir': value,
      if (instance.transferAcSipBagFazlaTeslimatYapilabilir case final value?)
        'transfer_AC_SipBag_FazlaTeslimatYapilabilir': value,
      if (instance.transferAcSipBagSipOkutulsun case final value?)
        'transfer_AC_SipBag_SipOkutulsun': value,
      if (instance.transferAcSipBagSipOkutulsunMiktar2BazAl case final value?)
        'transfer_AC_SipBag_SipOkutulsun_Miktar2BazAl': value,
      if (instance.transferAcSipBagCokluSecim case final value?)
        'transfer_AC_SipBag_CokluSecim': value,
      if (instance.transferAcSipBagTumKalemlerSecilsin case final value?)
        'transfer_AC_SipBag_TumKalemlerSecilsin': value,
      if (instance.transferAcSipBagEslesmeDurumu case final value?)
        'transfer_AC_SipBag_EslesmeDurumu': value,
      if (instance.transferAcSipBagMalToplananlarGelsin case final value?)
        'transfer_AC_SipBag_MalToplananlarGelsin': value,
      if (instance.transferAcSipBagSevkOnayliSiparislerGelsin case final value?)
        'transfer_AC_SipBag_SevkOnayliSiparislerGelsin': value,
      if (instance.transferAcGizlenecekAlanlar case final value?)
        'transfer_AC_GizlenecekAlanlar': value,
      if (instance.transferAcDegismeyecekAlanlar case final value?)
        'transfer_AC_DegismeyecekAlanlar': value,
      if (instance.transferDepoTalebi case final value?)
        'transfer_DepoTalebi': value,
      if (instance.transferDepoTalebiSil case final value?)
        'transfer_DepoTalebi_Sil': value,
      if (instance.transferDepoTalebiMalTop case final value?)
        'transfer_DepoTalebi_MalTop': value,
      if (instance.transferDepoTalebiMalTopFazlaTeslimat case final value?)
        'transfer_DepoTalebi_MalTop_FazlaTeslimat': value,
      if (instance.hucreGiristeHucreYerlestir case final value?)
        'hucre_GiristeHucreYerlestir': value,
      if (instance.hucreCikistaHucreYerlestir case final value?)
        'hucre_CikistaHucreYerlestir': value,
      if (instance.hucreYerlestir case final value?) 'hucre_Yerlestir': value,
      if (instance.hucreYerlestirBelgesiz case final value?)
        'hucre_YerlestirBelgesiz': value,
      if (instance.hucreYerlestirKlavyeEngelle case final value?)
        'hucre_Yerlestir_KlavyeEngelle': value,
      if (instance.hucreYerlestirRehberdenStokSecilmesin case final value?)
        'hucre_Yerlestir_RehberdenStokSecilmesin': value,
      if (instance.hucreYerlestirHangiHucrede case final value?)
        'hucre_Yerlestir_HangiHucrede': value,
      if (instance.hucreYerlestirBelgeTipleri case final value?)
        'hucre_Yerlestir_BelgeTipleri': value,
      if (instance.hucreBosalt case final value?) 'hucre_Bosalt': value,
      if (instance.hucreBosaltBelgesiz case final value?)
        'hucre_BosaltBelgesiz': value,
      if (instance.hucreBosaltKlavyeEngelle case final value?)
        'hucre_Bosalt_KlavyeEngelle': value,
      if (instance.hucreBosaltRehberdenStokSecilmesin case final value?)
        'hucre_Bosalt_RehberdenStokSecilmesin': value,
      if (instance.hucreBosaltHangiHucrede case final value?)
        'hucre_Bosalt_HangiHucrede': value,
      if (instance.hucreBosaltBelgeTipleri case final value?)
        'hucre_Bosalt_BelgeTipleri': value,
      if (instance.hucreArama case final value?) 'hucre_Arama': value,
      if (instance.hucreAramaTumDepolar case final value?)
        'hucre_AramaTumDepolar': value,
      if (instance.hucreAramaOzelFonksiyon case final value?)
        'hucre_AramaOzelFonksiyon': value,
      if (instance.hucreTransfer case final value?) 'hucre_Transfer': value,
      if (instance.hucreTransferKlavyeEngelle case final value?)
        'hucre_Transfer_KlavyeEngelle': value,
      if (instance.hucreTransferRehberdenStokSecilmesin case final value?)
        'hucre_Transfer_RehberdenStokSecilmesin': value,
      if (instance.hucreTransferBelgeTipleri case final value?)
        'hucre_Transfer_BelgeTipleri': value,
      if (instance.hucreListesi case final value?) 'hucre_Listesi': value,
      if (instance.hucreBosaltOtomatikStokEtiketiYazdir case final value?)
        'hucre_Bosalt_OtomatikStokEtiketiYazdir': value,
      if (instance.hucreBakiyeDurumu case final value?)
        'hucre_BakiyeDurumu': value,
      if (instance.hucreHareketleri case final value?)
        'hucre_Hareketleri': value,
      if (instance.hucreHareketleriSil case final value?)
        'hucre_Hareketleri_Sil': value,
      if (instance.sevkiyatSatisIrsaliyesiBelgeTipleri case final value?)
        'sevkiyat_SatisIrsaliyesi_BelgeTipleri': value,
      if (instance.sevkiyatSatisIrsaliyesiGizlenecekAlanlar case final value?)
        'sevkiyat_SatisIrsaliyesi_GizlenecekAlanlar': value,
      if (instance.sevkiyatSatisIrsaliyesiDegismeyecekAlanlar case final value?)
        'sevkiyat_SatisIrsaliyesi_DegismeyecekAlanlar': value,
      if (instance.sevkiyatSatisIrsaliyesi case final value?)
        'sevkiyat_SatisIrsaliyesi': value,
      if (instance.sevkiyatSatisIrsaliyesiKayit case final value?)
        'sevkiyat_SatisIrsaliyesiKayit': value,
      if (instance.sevkiyatSatisIrsaliyesiDuzeltme case final value?)
        'sevkiyat_SatisIrsaliyesiDuzeltme': value,
      if (instance.sevkiyatSatisIrsaliyesiSilme case final value?)
        'sevkiyat_SatisIrsaliyesiSilme': value,
      if (instance.sevkiyatSatisIrsaliyesiFiyatGor case final value?)
        'sevkiyat_SatisIrsaliyesiFiyatGor': value,
      if (instance.sevkiyatSatisIrsDigerSekmesiGoster case final value?)
        'sevkiyat_SatisIrs_DigerSekmesiGoster': value,
      if (instance.sevkiyatSatisIrsaliyesiSipBagSecenegi case final value?)
        'sevkiyat_SatisIrsaliyesi_SipBagSecenegi': value,
      if (instance.sevkiyatSatisIrsReferansStokUygulamasi case final value?)
        'sevkiyat_SatisIrs_ReferansStokUygulamasi': value,
      if (instance.sevkiyatSatisIrsSipBagSipHariciKalemEklenebilir
          case final value?)
        'sevkiyat_SatisIrs_SipBag_SipHariciKalemEklenebilir': value,
      if (instance.sevkiyatSatisIrsSipBagFazlaTeslimatYapilabilir
          case final value?)
        'sevkiyat_SatisIrs_SipBag_FazlaTeslimatYapilabilir': value,
      if (instance.sevkiyatSatisIrsSipBagSipOkutulsun case final value?)
        'sevkiyat_SatisIrs_SipBag_SipOkutulsun': value,
      if (instance.sevkiyatSatisIrsSipBagSipOkutulsunMiktar2BazAl
          case final value?)
        'sevkiyat_SatisIrs_SipBag_SipOkutulsun_Miktar2BazAl': value,
      if (instance.sevkiyatSatisIrsSipBagSipOkutulsunKalanMiktarGelsin
          case final value?)
        'sevkiyat_SatisIrs_SipBag_SipOkutulsun_KalanMiktarGelsin': value,
      if (instance.sevkiyatSatisIrsSipBagCokluSecim case final value?)
        'sevkiyat_SatisIrs_SipBag_CokluSecim': value,
      if (instance.sevkiyatSatisIrsSipBagTumKalemlerSecilsin case final value?)
        'sevkiyat_SatisIrs_SipBag_TumKalemlerSecilsin': value,
      if (instance.sevkiyatSatisIrsSipBagEslesmeDurumu case final value?)
        'sevkiyat_SatisIrs_SipBag_EslesmeDurumu': value,
      if (instance.sevkiyatSatisIrsSipBagMalToplananlarGelsin case final value?)
        'sevkiyat_SatisIrs_SipBag_MalToplananlarGelsin': value,
      if (instance.sevkiyatSatisIrsSipBagSevkOnayliSiparislerGelsin
          case final value?)
        'sevkiyat_SatisIrs_SipBag_SevkOnayliSiparislerGelsin': value,
      if (instance.sevkiyatFiyatDegistirilmesin case final value?)
        'sevkiyat_FiyatDegistirilmesin': value,
      if (instance.sevkiyatSatisIrsaliyesiEIrsaliyeDuzenleyemesin
          case final value?)
        'sevkiyat_SatisIrsaliyesi_EIrsaliyeDuzenleyemesin': value,
      if (instance.sevkiyatSatisIrsKalemlerBirlestirilsin case final value?)
        'sevkiyat_SatisIrs_KalemlerBirlestirilsin': value,
      if (instance.sevkiyatSatisIrsOtoBasimYap case final value?)
        'sevkiyat_SatisIrs_OtoBasimYap': value,
      if (instance.sevkiyatSatisIrsKacGunlukKayitlarListelensin
          case final value?)
        'sevkiyat_SatisIrs_KacGunlukKayitlarListelensin': value,
      if (instance.sevkiyatSatisIrsFiyatSirasi case final value?)
        'sevkiyat_SatisIrs_FiyatSirasi': value,
      if (instance.sevkiyatSatisIrsSeriGirisHarYapabilsin case final value?)
        'sevkiyat_SatisIrs_SeriGirisHarYapabilsin': value,
      if (instance.sevkiyatSatisIrsEkAlan2Tablodan case final value?)
        'sevkiyat_SatisIrs_EkAlan2Tablodan': value,
      if (instance.sevkiyatSatisIrsEkAlan2Hatirla case final value?)
        'sevkiyat_SatisIrs_EkAlan2Hatirla': value,
      if (instance.sevkiyatSatisIrsOlcuBirimi case final value?)
        'sevkiyat_SatisIrs_OlcuBirimi': value,
      if (instance.sevkiyatSatisIrsCariKoduDegistir case final value?)
        'sevkiyat_SatisIrs_CariKoduDegistir': value,
      if (instance.sevkiyatSatisIrsMaxIskUygulamasi case final value?)
        'sevkiyat_SatisIrs_MaxIskUygulamasi': value,
      if (instance.sevkiyatSatisIrsMaxSatIsk1 case final value?)
        'sevkiyat_SatisIrs_MaxSatIsk1': value,
      if (instance.sevkiyatSatisIrsMaxSatIsk2 case final value?)
        'sevkiyat_SatisIrs_MaxSatIsk2': value,
      if (instance.sevkiyatSatisIrsMaxSatIsk3 case final value?)
        'sevkiyat_SatisIrs_MaxSatIsk3': value,
      if (instance.sevkiyatSatisIrsMaxSatIsk4 case final value?)
        'sevkiyat_SatisIrs_MaxSatIsk4': value,
      if (instance.sevkiyatSatisIrsMaxSatIsk5 case final value?)
        'sevkiyat_SatisIrs_MaxSatIsk5': value,
      if (instance.sevkiyatSatisIrsMaxSatIsk6 case final value?)
        'sevkiyat_SatisIrs_MaxSatIsk6': value,
      if (instance.sevkiyatSatisIrsMaxGenIsk1 case final value?)
        'sevkiyat_SatisIrs_MaxGenIsk1': value,
      if (instance.sevkiyatSatisIrsMaxGenIsk2 case final value?)
        'sevkiyat_SatisIrs_MaxGenIsk2': value,
      if (instance.sevkiyatSatisIrsMaxGenIsk3 case final value?)
        'sevkiyat_SatisIrs_MaxGenIsk3': value,
      if (instance.sevkiyatSatisIrsDipFiyatUygulamasi case final value?)
        'sevkiyat_SatisIrs_DipFiyatUygulamasi': value,
      if (instance.sevkiyatSatisIrsDipFiyatSaha case final value?)
        'sevkiyat_SatisIrs_DipFiyatSaha': value,
      if (instance.sevkiyatSatisIrsDipFiyatEylem case final value?)
        'sevkiyat_SatisIrs_DipFiyatEylem': value,
      if (instance.sevkiyatSatisIrsBarkodluGiris case final value?)
        'sevkiyat_SatisIrs_BarkodluGiris': value,
      if (instance.sevkiyatSatisIrsMiktarOtomatikGelsin case final value?)
        'sevkiyat_SatisIrs_MiktarOtomatikGelsin': value,
      if (instance.sevkiyatSatisIrsKalemDetaySorulmasin case final value?)
        'sevkiyat_SatisIrs_KalemDetaySorulmasin': value,
      if (instance.sevkiyatSatisIrsStokRehberiAcilmasin case final value?)
        'sevkiyat_SatisIrs_StokRehberiAcilmasin': value,
      if (instance.sevkiyatSatisIrsKalemDuzeltilemesin case final value?)
        'sevkiyat_SatisIrs_KalemDuzeltilemesin': value,
      if (instance.sevkiyatSatisIrsKlavyeEngelle case final value?)
        'sevkiyat_SatisIrs_KlavyeEngelle': value,
      if (instance.sevkiyatSatisIrsMiktar1Gelsin case final value?)
        'sevkiyat_SatisIrs_Miktar1Gelsin': value,
      if (instance.sevkiyatSatisIrsBakiyesizStokSecilmesin case final value?)
        'sevkiyat_SatisIrs_BakiyesizStokSecilmesin': value,
      if (instance.sevkiyatSatisIrsRaporlar case final value?)
        'sevkiyat_SatisIrs_Raporlar': value,
      if (instance.sevkiyatSatisIrsKalemRaporu case final value?)
        'sevkiyat_SatisIrs_KalemRaporu': value,
      if (instance.sevkiyatSatisFatBelgeTipleri case final value?)
        'sevkiyat_SatisFat_BelgeTipleri': value,
      if (instance.sevkiyatSatisFatVarsayilanBelgeTipi case final value?)
        'sevkiyat_SatisFat_VarsayilanBelgeTipi': value,
      if (instance.sevkiyatSatisFat case final value?)
        'sevkiyat_SatisFat': value,
      if (instance.sevkiyatSatisFatKaydet case final value?)
        'sevkiyat_SatisFat_Kaydet': value,
      if (instance.sevkiyatSatisFatDuzelt case final value?)
        'sevkiyat_SatisFat_Duzelt': value,
      if (instance.sevkiyatSatisFatSil case final value?)
        'sevkiyat_SatisFat_Sil': value,
      if (instance.sevkiyatSatisFatToplamlarCariTahsilatIslemleri
          case final value?)
        'sevkiyat_SatisFat_ToplamlarCariTahsilatIslemleri': value,
      if (instance.sevkiyatSatisFatKayittanSonraTaslakOlustur case final value?)
        'sevkiyat_SatisFat_KayittanSonraTaslakOlustur': value,
      if (instance.sevkiyatSatisFatOtomatikBasimYap case final value?)
        'sevkiyat_SatisFat_OtomatikBasimYap': value,
      if (instance.sevkiyatSatisFatDigerSekmesiGoster case final value?)
        'sevkiyat_SatisFat_DigerSekmesiGoster': value,
      if (instance.sevkiyatSatisFatFiyatDegistirilmesin case final value?)
        'sevkiyat_SatisFat_FiyatDegistirilmesin': value,
      if (instance.sevkiyatSatisFatKacGunlukKayitlarListelensin
          case final value?)
        'sevkiyat_SatisFat_KacGunlukKayitlarListelensin': value,
      if (instance.sevkiyatSatisFatFiyatSirasi case final value?)
        'sevkiyat_SatisFat_FiyatSirasi': value,
      if (instance.sevkiyatSatisFatKalemlerBirlestirilsin case final value?)
        'sevkiyat_SatisFat_KalemlerBirlestirilsin': value,
      if (instance.sevkiyatSatisFatEkAlan2Tablodan case final value?)
        'sevkiyat_SatisFat_EkAlan2Tablodan': value,
      if (instance.sevkiyatSatisFatEkAlan2Hatirla case final value?)
        'sevkiyat_SatisFat_EkAlan2Hatirla': value,
      if (instance.sevkiyatSatisFatFiltre case final value?)
        'sevkiyat_SatisFat_Filtre': value,
      if (instance.sevkiyatSatisFatFiltreSQL case final value?)
        'sevkiyat_SatisFat_FiltreSQL': value,
      if (instance.sevkiyatSatisFatOlcuBirimi case final value?)
        'sevkiyat_SatisFat_OlcuBirimi': value,
      if (instance.sevkiyatSatisFatAciklamaAlanlari case final value?)
        'sevkiyat_SatisFat_AciklamaAlanlari': value,
      if (instance.sevkiyatSatisIrsAciklamaAlanlari case final value?)
        'sevkiyat_SatisIrs_AciklamaAlanlari': value,
      if (instance.sevkiyatSatisFatBosGecilmeyecekAlanlar case final value?)
        'sevkiyat_SatisFat_BosGecilmeyecekAlanlar': value,
      if (instance.sevkiyatSatisIrsBosGecilmeyecekAlanlar case final value?)
        'sevkiyat_SatisIrs_BosGecilmeyecekAlanlar': value,
      if (instance.malKabulAlisFatBosGecilmeyecekAlanlar case final value?)
        'malKabul_AlisFat_BosGecilmeyecekAlanlar': value,
      if (instance.malKabulAlisIrsBosGecilmeyecekAlanlar case final value?)
        'malKabul_AlisIrs_BosGecilmeyecekAlanlar': value,
      if (instance.sevkiyatSatisFatGizlenecekAlanlar case final value?)
        'sevkiyat_SatisFat_GizlenecekAlanlar': value,
      if (instance.sevkiyatSatisFatDegismeyecekAlanlar case final value?)
        'sevkiyat_SatisFat_DegismeyecekAlanlar': value,
      if (instance.sevkiyatSatisFatSeriGirisHarYapabilsin case final value?)
        'sevkiyat_SatisFat_SeriGirisHarYapabilsin': value,
      if (instance.sevkiyatSatisFatCariKoduDegistir case final value?)
        'sevkiyat_SatisFat_CariKoduDegistir': value,
      if (instance.sevkiyatSatisFaturasiSipBagSecenegi case final value?)
        'sevkiyat_SatisFaturasi_SipBagSecenegi': value,
      if (instance.sevkiyatSatisFatReferansStokUygulamasi case final value?)
        'sevkiyat_SatisFat_ReferansStokUygulamasi': value,
      if (instance.sevkiyatSatisFatSipBagSipHariciKalemEklenebilir
          case final value?)
        'sevkiyat_SatisFat_SipBag_SipHariciKalemEklenebilir': value,
      if (instance.sevkiyatSatisFatSipBagFazlaTeslimatYapilabilir
          case final value?)
        'sevkiyat_SatisFat_SipBag_FazlaTeslimatYapilabilir': value,
      if (instance.sevkiyatSatisFatSipBagSipOkutulsun case final value?)
        'sevkiyat_SatisFat_SipBag_SipOkutulsun': value,
      if (instance.sevkiyatSatisFatSipBagSipOkutulsunMiktar2BazAl
          case final value?)
        'sevkiyat_SatisFat_SipBag_SipOkutulsun_Miktar2BazAl': value,
      if (instance.sevkiyatSatisFatSipBagCokluSecim case final value?)
        'sevkiyat_SatisFat_SipBag_CokluSecim': value,
      if (instance.sevkiyatSatisFatSipBagTumKalemlerSecilsin case final value?)
        'sevkiyat_SatisFat_SipBag_TumKalemlerSecilsin': value,
      if (instance.sevkiyatSatisFatSipBagEslesmeDurumu case final value?)
        'sevkiyat_SatisFat_SipBag_EslesmeDurumu': value,
      if (instance.sevkiyatSatisFatSipBagSevkOnayliSiparislerGelsin
          case final value?)
        'sevkiyat_SatisFat_SipBag_SevkOnayliSiparislerGelsin': value,
      if (instance.sevkiyatSatisFatBarkodluGiris case final value?)
        'sevkiyat_SatisFat_BarkodluGiris': value,
      if (instance.sevkiyatSatisFaturasiMiktarOtomatikGelsin case final value?)
        'sevkiyat_SatisFaturasi_MiktarOtomatikGelsin': value,
      if (instance.sevkiyatSatisFaturasiKalemDetaySorulmasin case final value?)
        'sevkiyat_SatisFaturasi_KalemDetaySorulmasin': value,
      if (instance.sevkiyatSatisFatBarkodSayisiSaklanacakAlan case final value?)
        'sevkiyat_SatisFat_BarkodSayisiSaklanacakAlan': value,
      if (instance.sevkiyatSatisFatStokRehberiAcilmasin case final value?)
        'sevkiyat_SatisFat_StokRehberiAcilmasin': value,
      if (instance.sevkiyatSatisFatKalemDuzeltilemesin case final value?)
        'sevkiyat_SatisFat_KalemDuzeltilemesin': value,
      if (instance.sevkiyatSatisFatKlavyeEngelle case final value?)
        'sevkiyat_SatisFat_KlavyeEngelle': value,
      if (instance.sevkiyatSatisFatMiktar1Gelsin case final value?)
        'sevkiyat_SatisFat_Miktar1Gelsin': value,
      if (instance.sevkiyatSatisFatBakiyesizStokSecilmesin case final value?)
        'sevkiyat_SatisFat_BakiyesizStokSecilmesin': value,
      if (instance.sevkiyatSatisFatRaporlar case final value?)
        'sevkiyat_SatisFat_Raporlar': value,
      if (instance.sevkiyatSatisFatKalemRaporu case final value?)
        'sevkiyat_SatisFat_KalemRaporu': value,
      if (instance.sevkiyatSatisFatKarlilikRaporu case final value?)
        'sevkiyat_SatisFat_KarlilikRaporu': value,
      if (instance.sevkiyatSatisFatMaxIskUygulamasi case final value?)
        'sevkiyat_SatisFat_MaxIskUygulamasi': value,
      if (instance.sevkiyatSatisFatMaxSatIsk1 case final value?)
        'sevkiyat_SatisFat_MaxSatIsk1': value,
      if (instance.sevkiyatSatisFatMaxSatIsk2 case final value?)
        'sevkiyat_SatisFat_MaxSatIsk2': value,
      if (instance.sevkiyatSatisFatMaxSatIsk3 case final value?)
        'sevkiyat_SatisFat_MaxSatIsk3': value,
      if (instance.sevkiyatSatisFatMaxSatIsk4 case final value?)
        'sevkiyat_SatisFat_MaxSatIsk4': value,
      if (instance.sevkiyatSatisFatMaxSatIsk5 case final value?)
        'sevkiyat_SatisFat_MaxSatIsk5': value,
      if (instance.sevkiyatSatisFatMaxSatIsk6 case final value?)
        'sevkiyat_SatisFat_MaxSatIsk6': value,
      if (instance.sevkiyatSatisFatMaxGenIsk1 case final value?)
        'sevkiyat_SatisFat_MaxGenIsk1': value,
      if (instance.sevkiyatSatisFatMaxGenIsk2 case final value?)
        'sevkiyat_SatisFat_MaxGenIsk2': value,
      if (instance.sevkiyatSatisFatMaxGenIsk3 case final value?)
        'sevkiyat_SatisFat_MaxGenIsk3': value,
      if (instance.sevkiyatSatisFatDipFiyatUygulamasi case final value?)
        'sevkiyat_SatisFat_DipFiyatUygulamasi': value,
      if (instance.sevkiyatSatisFatDipFiyatSaha case final value?)
        'sevkiyat_SatisFat_DipFiyatSaha': value,
      if (instance.sevkiyatSatisFatDipFiyatEylem case final value?)
        'sevkiyat_SatisFat_DipFiyatEylem': value,
      if (instance.sevkiyatSatisFatDipFiyatKdvDurumu case final value?)
        'sevkiyat_SatisFat_DipFiyatKDVDurumu': value,
      if (instance.sevkiyatSatisIrsaliyesiSiparissiz case final value?)
        'sevkiyat_SatisIrsaliyesiSiparissiz': value,
      if (instance.sevkiyatSatisIrsaliyesiSiparissizFiyatGor case final value?)
        'sevkiyat_SatisIrsaliyesiSiparissizFiyatGor': value,
      if (instance.sevkiyatSatisIrsaliyesiIade case final value?)
        'sevkiyat_SatisIrsaliyesiIade': value,
      if (instance.sevkiyatSiptenMalTop case final value?)
        'sevkiyat_SiptenMalTop': value,
      if (instance.sevkiyatSiptenMalTopMiktarBarkoddanGelsin case final value?)
        'sevkiyat_SiptenMalTop_MiktarBarkoddanGelsin': value,
      if (instance.sevkiyatSiptenMalTopRehberdenStokSecilmesin
          case final value?)
        'sevkiyat_SiptenMalTop_RehberdenStokSecilmesin': value,
      if (instance.sevkiyatSiptenMalTopKlavyedenBarkodGirilmesin
          case final value?)
        'sevkiyat_SiptenMalTop_KlavyedenBarkodGirilmesin': value,
      if (instance.sevkiyatSiptenMalTopSevkOnayliSiparislerGelsin
          case final value?)
        'sevkiyat_SiptenMalTop_SevkOnayliSiparislerGelsin': value,
      if (instance.sevkiyatSiptenMalTopKacGunlukKayitlarListelensin
          case final value?)
        'sevkiyat_SiptenMalTop_KacGunlukKayitlarListelensin': value,
      if (instance.sevkemriMalToplama case final value?)
        'sevkemri_MalToplama': value,
      if (instance.sevkemriMalToplamaAtanabilir case final value?)
        'sevkemri_MalToplamaAtanabilir': value,
      if (instance.sevkemriMalToplamaAtayabilir case final value?)
        'sevkemri_MalToplamaAtayabilir': value,
      if (instance.sevkemriUrunDegistir case final value?)
        'sevkemri_UrunDegistir': value,
      if (instance.sevkemriMiktarDegistir case final value?)
        'sevkemri_MiktarDegistir': value,
      if (instance.sevkemriMuadilUrun case final value?)
        'sevkemri_MuadilUrun': value,
      if (instance.sevkemriMalToplamaBarkodsuzUrunListedenSecilsin
          case final value?)
        'sevkemri_malToplama_BarkodsuzUrunListedenSecilsin': value,
      if (instance.sevkemriMalToplamaOtoStokEtiketiYazdir case final value?)
        'sevkemri_MalToplama_OtoStokEtiketiYazdir': value,
      if (instance.sevkemriMalToplamaOtoStokEtiketiYazdirSor case final value?)
        'sevkemri_MalToplama_OtoStokEtiketiYazdirSor': value,
      if (instance.sevkemriMalToplamaKlavyedenGirisiEngelle case final value?)
        'sevkemri_MalToplama_KlavyedenGirisiEngelle': value,
      if (instance.sevkemriMalToplamaBarkod2Sor case final value?)
        'sevkemri_MalToplama_Barkod2Sor': value,
      if (instance.sevkemriMalToplamaBarkod2YildizliGorunsun case final value?)
        'sevkemri_MalToplama_Barkod2_YildizliGorunsun': value,
      if (instance.sevkemriMalToplamaBarkod2KalemEkranindaSor case final value?)
        'sevkemri_MalToplama_Barkod2KalemEkranindaSor': value,
      if (instance.sevkemriMalToplamaTumuToplanmadanTamamlanmasin
          case final value?)
        'sevkemri_MalToplama_TumuToplanmadanTamamlanmasin': value,
      if (instance.sevkemriMalToplamaHangiHucredeGoster case final value?)
        'sevkemri_MalToplama_HangiHucredeGoster': value,
      if (instance.sevkemriMalToplamaKalemDetayIslemOnaySormasin
          case final value?)
        'sevkemri_MalToplama_KalemDetayIslemOnaySormasin': value,
      if (instance.sevkemriMalToplamaGosterilecekEkBilgiler case final value?)
        'sevkemri_MalToplama_GosterilecekEkBilgiler': value,
      if (instance.sevkemriMalToplamaDegistirilemeyecekAlanlar
          case final value?)
        'sevkemri_MalToplama_DegistirilemeyecekAlanlar': value,
      if (instance.sevkemriMalToplamaGizlenecekAlanlar case final value?)
        'sevkemri_MalToplama_GizlenecekAlanlar': value,
      if (instance.sevkemriMalToplamaMiktarBarkoddan case final value?)
        'sevkemri_MalToplama_MiktarBarkoddan': value,
      if (instance.sevkemriMalToplamaKalemDetayiSorulmasin case final value?)
        'sevkemri_MalToplama_KalemDetayiSorulmasin': value,
      if (instance.sevkemriMalToplamaKalemDetayaUlasamasin case final value?)
        'sevkemri_MalToplama_KalemDetayaUlasamasin': value,
      if (instance.sevkemriMalToplamaFazlaTeslimat case final value?)
        'sevkemri_MalToplama_FazlaTeslimat': value,
      if (instance.sevkemriMalToplamaVarsayilanOlcuBirimi case final value?)
        'sevkemri_MalToplama_VarsayilanOlcuBirimi': value,
      if (instance.sevkemriMalToplamaSiralamaTipi case final value?)
        'sevkemri_MalToplama_SiralamaTipi': value,
      if (instance.sevkemriMalKontrol case final value?)
        'sevkemri_MalKontrol': value,
      if (instance.sevkemriMalKontrolKlavyeEngelle case final value?)
        'sevkemri_MalKontrol_KlavyeEngelle': value,
      if (instance.sevkemriMalKontrolTipi?.toJson() case final value?)
        'sevkemri_MalKontrolTipi': value,
      if (instance.sevkemriMalKontrolKullanicilar case final value?)
        'sevkemri_MalKontrolKullanicilar': value,
      if (instance.sevkemriPaketleme case final value?)
        'sevkemri_Paketleme': value,
      if (instance.sevkemriPaketlemeKlavyeEngelle case final value?)
        'sevkemri_Paketleme_KlavyeEngelle': value,
      if (instance.sevkemriPaketlemeBarkodOkutmayaZorla case final value?)
        'sevkemri_Paketleme_BarkodOkutmayaZorla': value,
      if (instance.sevkemriPaketlemeBarkodsuzUrunListedenSecilsin
          case final value?)
        'sevkemri_Paketleme_BarkodsuzUrunListedenSecilsin': value,
      if (instance.sevkemriAracYukleme case final value?)
        'sevkemri_AracYukleme': value,
      if (instance.sevkemriAracYuklemeKlavyeEngelle case final value?)
        'sevkemri_AracYukleme_KlavyeEngelle': value,
      if (instance.sevkemriAracBosaltma case final value?)
        'sevkemri_AracBosaltma': value,
      if (instance.sevkemriAracBosaltmaKlavyeEngelle case final value?)
        'sevkemri_AracBosaltma_KlavyeEngelle': value,
      if (instance.sevkemriDepodanTeslimat case final value?)
        'sevkemri_DepodanTeslimat': value,
      if (instance.sevkemriDepodanTeslimatKlavyeEngelle case final value?)
        'sevkemri_DepodanTeslimat_KlavyeEngelle': value,
      if (instance.sayimSayim case final value?) 'sayim_sayim': value,
      if (instance.sayimKontrolMiktari case final value?)
        'sayim_Kontrol_Miktari': value,
      if (instance.sayimMiktarBarkoddanGelsin case final value?)
        'sayim_MiktarBarkoddanGelsin': value,
      if (instance.sayimAyniStokDurumu case final value?)
        'sayim_AyniStokDurumu': value,
      if (instance.sayimMiktar1Gelsin case final value?)
        'sayim_Miktar1Gelsin': value,
      if (instance.sayimHemenKaydet case final value?)
        'sayim_HemenKaydet': value,
      if (instance.sayimCarpanAktif case final value?)
        'sayim_CarpanAktif': value,
      if (instance.sayimSeriMikGirilenMikKabulEdilsin case final value?)
        'sayim_SeriMikGirilenMikKabulEdilsin': value,
      if (instance.sayimDigerKulSayimHarGorsun case final value?)
        'sayim_DigerKulSayimHarGorsun': value,
      if (instance.sayimDigerKulSayimFisGorsun case final value?)
        'sayim_DigerKulSayimFisGorsun': value,
      if (instance.sayimSerbest case final value?) 'sayim_Serbest': value,
      if (instance.sayimSerbestSil case final value?)
        'sayim_Serbest_Sil': value,
      if (instance.sayimDepoFarkRaporu case final value?)
        'sayim_DepoFarkRaporu': value,
      if (instance.sayimBelgeBaglantisiniKopar case final value?)
        'sayim_BelgeBaglantisiniKopar': value,
      if (instance.sayimBelgeOlusturabilir case final value?)
        'sayim_BelgeOlusturabilir': value,
      if (instance.sayimEkAlanlar case final value?) 'sayim_EkAlanlar': value,
      if (instance.sayimDegismeyecekAlanlar case final value?)
        'sayim_DegismeyecekAlanlar': value,
      if (instance.sayimGizlenecekAlanlar case final value?)
        'sayim_GizlenecekAlanlar': value,
      if (instance.sayimVarsayilanOlcuBirimi case final value?)
        'sayim_VarsayilanOlcuBirimi': value,
      if (instance.sayimRaporu case final value?) 'sayim_Raporu': value,
      if (instance.paketOlustur case final value?) 'paket_Olustur': value,
      if (instance.paketCokluOlustur case final value?)
        'paket_CokluOlustur': value,
      if (instance.paketKontrol case final value?) 'paket_Kontrol': value,
      if (instance.paketMalzemeCikisi case final value?)
        'paket_MalzemeCikisi': value,
      if (instance.paketReceteyiFiltrele case final value?)
        'paket_ReceteyiFiltrele': value,
      if (instance.islemlerHucreEtiket case final value?)
        'islemler_HucreEtiket': value,
      if (instance.islemlerStokEtiket case final value?)
        'islemler_StokEtiket': value,
      if (instance.islemlerBarkodTanimlama case final value?)
        'islemler_BarkodTanimlama': value,
      if (instance.siparisMusteriSiparisi case final value?)
        'siparis_MusteriSiparisi': value,
      if (instance.siparisMusteriSiparisiKaydet case final value?)
        'siparis_MusteriSiparisi_Kaydet': value,
      if (instance.siparisMusteriSiparisiDuzelt case final value?)
        'siparis_MusteriSiparisi_Duzelt': value,
      if (instance.siparisMusteriSiparisiSil case final value?)
        'siparis_MusteriSiparisi_Sil': value,
      if (instance.siparisMusteriSiparisiKapalilarListelenmesin
          case final value?)
        'siparis_MusteriSiparisi_KapalilarListelenmesin': value,
      if (instance.siparisMusteriSiparisiFiyatDegistirilmesin case final value?)
        'siparis_MusteriSiparisi_FiyatDegistirilmesin': value,
      if (instance.siparisMusteriSiparisiFiyatSirasi case final value?)
        'siparis_MusteriSiparisi_FiyatSirasi': value,
      if (instance.siparisMusSipBirim1DenKaydet case final value?)
        'siparis_MusSip_Birim1denKaydet': value,
      if (instance.siparisMusteriSiparisiKapatmaIslemi case final value?)
        'siparis_MusteriSiparisi_KapatmaIslemi': value,
      if (instance.siparisMusSipOnayIslemleri case final value?)
        'siparis_MusSip_OnayIslemleri': value,
      if (instance.siparisMusSipStokIhtiyacRaporu case final value?)
        'siparis_MusSip_StokIhtiyacRaporu': value,
      if (instance.siparisMusteriSiparisiSonFiyatGoster case final value?)
        'siparis_MusteriSiparisi_SonFiyatGoster': value,
      if (instance.siparisMusSipDigerSekmesiGoster case final value?)
        'siparis_MusSip_DigerSekmesiGoster': value,
      if (instance.siparisMusSipEkAlan2Tablodan case final value?)
        'siparis_MusSip_EkAlan2Tablodan': value,
      if (instance.siparisMusSipEkAlan2Hatirla case final value?)
        'siparis_MusSip_EkAlan2Hatirla': value,
      if (instance.siparisMusSipMiktar1Gelsin case final value?)
        'siparis_MusSip_Miktar1Gelsin': value,
      if (instance.siparisMusSipBosGecilmeyecekAlanlar case final value?)
        'siparis_MusSip_BosGecilmeyecekAlanlar': value,
      if (instance.siparisMusSipOtoPdfGor case final value?)
        'siparis_MusSip_OtoPdfGor': value,
      if (instance.siparisMusSipCariKoduDegistir case final value?)
        'siparis_MusSip_CariKoduDegistir': value,
      if (instance.siparisMusteriSiparisiAciklamaAlanlari case final value?)
        'siparis_MusteriSiparisi_AciklamaAlanlari': value,
      if (instance.siparisMusteriSiparisiGizlenecekAlanlar case final value?)
        'siparis_MusteriSiparisi_GizlenecekAlanlar': value,
      if (instance.siparisMusteriSiparisiDegismeyecekAlanlar case final value?)
        'siparis_MusteriSiparisi_DegismeyecekAlanlar': value,
      if (instance.siparisMusSipEkstraAlanlar case final value?)
        'siparis_MusSip_EkstraAlanlar': value,
      if (instance.siparisMusteriSiparisiSatirAciklamaAlanlari
          case final value?)
        'siparis_MusteriSiparisi_SatirAciklamaAlanlari': value,
      if (instance.siparisMusSipOlcuBirimi case final value?)
        'siparis_MusSip_OlcuBirimi': value,
      if (instance.siparisMusSipBakiyesizStokSecilmesin case final value?)
        'siparis_MusSip_BakiyesizStokSecilmesin': value,
      if (instance.siparisMusSipHizliUrunGirisiMiktar2Kullanilsin
          case final value?)
        'siparis_MusSip_HizliUrunGirisi_Miktar2Kullanilsin': value,
      if (instance.siparisMusteriSiparisiDipFiyatUygulamasi case final value?)
        'siparis_MusteriSiparisi_DipFiyatUygulamasi': value,
      if (instance.siparisMusteriSiparisiDipFiyatSaha case final value?)
        'siparis_MusteriSiparisi_DipFiyatSaha': value,
      if (instance.siparisMusteriSiparisiDipFiyatEylem case final value?)
        'siparis_MusteriSiparisi_DipFiyatEylem': value,
      if (instance.siparisMusSipMaxIskUygulamasi case final value?)
        'siparis_MusSip_MaxIskUygulamasi': value,
      if (instance.siparisMusSipMaxSatIsk1 case final value?)
        'siparis_MusSip_MaxSatIsk1': value,
      if (instance.siparisMusSipMaxSatIsk2 case final value?)
        'siparis_MusSip_MaxSatIsk2': value,
      if (instance.siparisMusSipMaxSatIsk3 case final value?)
        'siparis_MusSip_MaxSatIsk3': value,
      if (instance.siparisMusSipMaxSatIsk4 case final value?)
        'siparis_MusSip_MaxSatIsk4': value,
      if (instance.siparisMusSipMaxSatIsk5 case final value?)
        'siparis_MusSip_MaxSatIsk5': value,
      if (instance.siparisMusSipMaxSatIsk6 case final value?)
        'siparis_MusSip_MaxSatIsk6': value,
      if (instance.siparisMusSipMaxGenIsk1 case final value?)
        'siparis_MusSip_MaxGenIsk1': value,
      if (instance.siparisMusSipMaxGenIsk2 case final value?)
        'siparis_MusSip_MaxGenIsk2': value,
      if (instance.siparisMusSipMaxGenIsk3 case final value?)
        'siparis_MusSip_MaxGenIsk3': value,
      if (instance.siparisMusteriSiparisiRaporlar case final value?)
        'siparis_MusteriSiparisi_Raporlar': value,
      if (instance.siparisMusteriSiparisiDurumRaporu case final value?)
        'siparis_MusteriSiparisi_DurumRaporu': value,
      if (instance.siparisMusteriSiparisiDurumRaporuFiyatGor case final value?)
        'siparis_MusteriSiparisi_DurumRaporuFiyatGor': value,
      if (instance.siparisMusSipKarlilikRaporu case final value?)
        'siparis_MusSip_KarlilikRaporu': value,
      if (instance.siparisMusSipTeslimRaporu case final value?)
        'siparis_MusSip_TeslimRaporu': value,
      if (instance.siparisSaticiSiparisi case final value?)
        'siparis_SaticiSiparisi': value,
      if (instance.siparisSaticiSiparisiKaydet case final value?)
        'siparis_SaticiSiparisi_Kaydet': value,
      if (instance.siparisSaticiSiparisiDuzelt case final value?)
        'siparis_SaticiSiparisi_Duzelt': value,
      if (instance.siparisSaticiSiparisiSil case final value?)
        'siparis_SaticiSiparisi_Sil': value,
      if (instance.siparisSaticiSiparisiKapalilarListelenmesin
          case final value?)
        'siparis_SaticiSiparisi_KapalilarListelenmesin': value,
      if (instance.siparisSaticiSiparisiFiyatDegistirilmesin case final value?)
        'siparis_SaticiSiparisi_FiyatDegistirilmesin': value,
      if (instance.siparisSaticiSiparisiFiyatSirasi case final value?)
        'siparis_SaticiSiparisi_FiyatSirasi': value,
      if (instance.siparisSaticiSipBirim1DenKaydet case final value?)
        'siparis_SaticiSip_Birim1denKaydet': value,
      if (instance.siparisSaticiSiparisiKapatmaIslemi case final value?)
        'siparis_SaticiSiparisi_KapatmaIslemi': value,
      if (instance.siparisSaticiSipOnayIslemleri case final value?)
        'siparis_SaticiSip_OnayIslemleri': value,
      if (instance.siparisSaticiSipDigerSekmesiGoster case final value?)
        'siparis_SaticiSip_DigerSekmesiGoster': value,
      if (instance.siparisSaticiSipOlcuBirimi case final value?)
        'siparis_SaticiSip_OlcuBirimi': value,
      if (instance.siparisSaticiSipCariKoduDegistir case final value?)
        'siparis_SaticiSip_CariKoduDegistir': value,
      if (instance.siparisSaticiSiparisiRaporlar case final value?)
        'siparis_SaticiSiparisi_Raporlar': value,
      if (instance.siparisSaticiSiparisiDurumRaporu case final value?)
        'siparis_SaticiSiparisi_DurumRaporu': value,
      if (instance.siparisSaticiSiparisiDurumRaporuFiyatGor case final value?)
        'siparis_SaticiSiparisi_DurumRaporuFiyatGor': value,
      if (instance.siparisSaticiSipTeslimRaporu case final value?)
        'siparis_SaticiSip_TeslimRaporu': value,
      if (instance.stokStokListesi case final value?) 'stok_StokListesi': value,
      if (instance.stokStokListesiExtraAlanlar case final value?)
        'stok_StokListesi_ExtraAlanlar': value,
      if (instance.stokStokKarti case final value?) 'stok_StokKarti': value,
      if (instance.stokStokKartiKaydet case final value?)
        'stok_StokKarti_Kaydet': value,
      if (instance.stokStokKartiDuzelt case final value?)
        'stok_StokKarti_Duzelt': value,
      if (instance.stokStokKartiSil case final value?)
        'stok_StokKarti_Sil': value,
      if (instance.stokStokKartiAlisFiyatiGizle case final value?)
        'stok_StokKarti_AlisFiyatiGizle': value,
      if (instance.stokStokKartiSatisFiyatiGizle case final value?)
        'stok_StokKarti_SatisFiyatiGizle': value,
      if (instance.stokStokHareketleri case final value?)
        'stok_StokHareketleri': value,
      if (instance.stokStokHarKaydet case final value?)
        'stok_StokHar_Kaydet': value,
      if (instance.stokStokHarDuzelt case final value?)
        'stok_StokHar_Duzelt': value,
      if (instance.stokStokHarSil case final value?) 'stok_StokHar_Sil': value,
      if (instance.stokStokHarPlasiyerKendiniGorsun case final value?)
        'stok_StokHar_PlasiyerKendiniGorsun': value,
      if (instance.stokResimGoster case final value?) 'stok_ResimGoster': value,
      if (instance.stokResimGosterEkle case final value?)
        'stok_ResimGoster_Ekle': value,
      if (instance.stokResimGosterSil case final value?)
        'stok_ResimGoster_Sil': value,
      if (instance.stokFiyatOzeti case final value?) 'stok_FiyatOzeti': value,
      if (instance.stokHareketDetayiniGizle case final value?)
        'stok_HareketDetayiniGizle': value,
      if (instance.stokGirisHareketleriniGizle case final value?)
        'stok_GirisHareketleriniGizle': value,
      if (instance.stokCikisHareketleriniGizle case final value?)
        'stok_CikisHareketleriniGizle': value,
      if (instance.stokBakiyeGosterimTipi case final value?)
        'stok_BakiyeGosterimTipi': value,
      if (instance.stokBarkodKontrol case final value?)
        'stok_BarkodKontrol': value,
      if (instance.stokDepoBakiyeDurumu case final value?)
        'stok_DepoBakiyeDurumu': value,
      if (instance.stokBarkodTanimlama case final value?)
        'stok_BarkodTanimlama': value,
      if (instance.stokBarkodTanimlamaGorunecekAlanlar case final value?)
        'stok_BarkodTanimlama_GorunecekAlanlar': value,
      if (instance.stokBarkodKayitlariGecerliBarkodTipleri case final value?)
        'stok_BarkodKayitlari_GecerliBarkodTipleri': value,
      if (instance.stokBarkodKayitlariGecerliOlcuBirimleri case final value?)
        'stok_BarkodKayitlari_GecerliOlcuBirimleri': value,
      if (instance.stokBarkodKayitlari case final value?)
        'stok_BarkodKayitlari': value,
      if (instance.stokBarkodKayitlariEkle case final value?)
        'stok_BarkodKayitlari_Ekle': value,
      if (instance.stokBarkodKayitlariDuzelt case final value?)
        'stok_BarkodKayitlari_Duzelt': value,
      if (instance.stokBarkodKayitlariSil case final value?)
        'stok_BarkodKayitlari_Sil': value,
      if (instance.stokKanbanBarkodEsle case final value?)
        'stok_KanbanBarkodEsle': value,
      if (instance.stokKanbanBarkodEsleSil case final value?)
        'stok_KanbanBarkodEsle_Sil': value,
      if (instance.stokKanbanBarkodEsleFarkliStokOkutulmasin case final value?)
        'stok_KanbanBarkodEsleFarkliStokOkutulmasin': value,
      if (instance.stokFiyatGorEkrani case final value?)
        'stok_FiyatGorEkrani': value,
      if (instance.stokFiyatGorEkraniGorunecekAlanlar case final value?)
        'stok_FiyatGorEkraniGorunecekAlanlar': value,
      if (instance.stokFiyatGecmisi case final value?)
        'stok_FiyatGecmisi': value,
      if (instance.stokFiyatGecmisiSil case final value?)
        'stok_FiyatGecmisiSil': value,
      if (instance.stokFiyatGecmisiFiyatTipleri case final value?)
        'stok_FiyatGecmisiFiyatTipleri': value,
      if (instance.stokSeriHar case final value?) 'stok_SeriHar': value,
      if (instance.stokSeriHarEkle case final value?)
        'stok_SeriHar_Ekle': value,
      if (instance.stokSeriHarDuzelt case final value?)
        'stok_SeriHar_Duzelt': value,
      if (instance.stokSeriHarSil case final value?) 'stok_SeriHar_Sil': value,
      if (instance.stokSeriParcala case final value?) 'stok_SeriParcala': value,
      if (instance.stokSeriParcalaEkle case final value?)
        'stok_SeriParcala_Ekle': value,
      if (instance.stokSeriParcalaDuzelt case final value?)
        'stok_SeriParcala_Duzelt': value,
      if (instance.stokSeriParcalaSil case final value?)
        'stok_SeriParcala_Sil': value,
      if (instance.stokSeriBirlestir case final value?)
        'stok_SeriBirlestir': value,
      if (instance.stokSeriBirlestirEkle case final value?)
        'stok_SeriBirlestir_Ekle': value,
      if (instance.stokSeriBirlestirDuzelt case final value?)
        'stok_SeriBirlestir_Duzelt': value,
      if (instance.stokSeriBirlestirSil case final value?)
        'stok_SeriBirlestir_Sil': value,
      if (instance.stokPaketleme case final value?) 'stok_Paketleme': value,
      if (instance.stokPaketlemeEkle case final value?)
        'stok_Paketleme_Ekle': value,
      if (instance.stokPaketlemeSil case final value?)
        'stok_Paketleme_Sil': value,
      if (instance.stokPaketlemeOnaySormasin case final value?)
        'stok_Paketleme_OnaySormasin': value,
      if (instance.stokPaketlemeDigerKulKayitGorebilir case final value?)
        'stok_Paketleme_DigerKulKayitGorebilir': value,
      if (instance.stokPaketlemeSorulacakBelgeTipleri case final value?)
        'stok_Paketleme_SorulacakBelgeTipleri': value,
      if (instance.stokRaporlar case final value?) 'stok_Raporlar': value,
      if (instance.stokRapAmbarMaliyet case final value?)
        'stok_Rap_AmbarMaliyet': value,
      if (instance.stokRapLokalDepoBakiye case final value?)
        'stok_Rap_LokalDepoBakiye': value,
      if (instance.stokRapUrunGrubunaGoreSatis case final value?)
        'stok_Rap_UrunGrubunaGoreSatis': value,
      if (instance.cariCariListesi case final value?) 'cari_CariListesi': value,
      if (instance.cariCariListesiRiskGorebilir case final value?)
        'cari_CariListesi_RiskGorebilir': value,
      if (instance.cariRiskGirisi case final value?) 'cari_RiskGirisi': value,
      if (instance.cariCariKarti case final value?) 'cari_CariKarti': value,
      if (instance.cariCariKartiKaydet case final value?)
        'cari_CariKarti_Kaydet': value,
      if (instance.cariCariKartiDuzelt case final value?)
        'cari_CariKarti_Duzelt': value,
      if (instance.cariCariKartiSil case final value?)
        'cari_CariKarti_Sil': value,
      if (instance.cariCariKartiEIslemler case final value?)
        'cari_CariKarti_EIslemler': value,
      if (instance.cariCariKartiDegismeyecekAlanlar case final value?)
        'cari_CariKarti_DegismeyecekAlanlar': value,
      if (instance.cariCariKartiGizlenecekAlanlar case final value?)
        'cari_CariKarti_GizlenecekAlanlar': value,
      if (instance.cariCariHareketleri case final value?)
        'cari_CariHareketleri': value,
      if (instance.cariCariHarKaydet case final value?)
        'cari_CariHar_Kaydet': value,
      if (instance.cariCariHarDuzelt case final value?)
        'cari_CariHar_Duzelt': value,
      if (instance.cariCariHarSil case final value?) 'cari_CariHar_Sil': value,
      if (instance.cariCariHareketleriHarDetayGorsun case final value?)
        'cari_CariHareketleri_HarDetayGorsun': value,
      if (instance.stokCariHarPlasiyerKendiniGorsun case final value?)
        'stok_CariHar_PlasiyerKendiniGorsun': value,
      if (instance.cariAktivite case final value?) 'cari_Aktivite': value,
      if (instance.cariAktiviteEkle case final value?)
        'cari_Aktivite_Ekle': value,
      if (instance.cariAktiviteDuzelt case final value?)
        'cari_Aktivite_Duzelt': value,
      if (instance.cariAktiviteSil case final value?)
        'cari_Aktivite_Sil': value,
      if (instance.cariAktiviteAtayabilir case final value?)
        'cari_Aktivite_Atayabilir': value,
      if (instance.cariAktiviteBitirmeyiGeriAl case final value?)
        'cari_Aktivite_BitirmeyiGeriAl': value,
      if (instance.cariOzelHesapKapatma case final value?)
        'cari_OzelHesapKapatma': value,
      if (instance.cariOzelHesapKapatmaSil case final value?)
        'cari_OzelHesapKapatma_Sil': value,
      if (instance.cariVadeKontrolu case final value?)
        'cari_VadeKontrolu': value,
      if (instance.cariVadeKontroluGun case final value?)
        'cari_VadeKontrolu_Gun': value,
      if (instance.cariVadeKontroluBelgeTipleri case final value?)
        'cari_VadeKontrolu_BelgeTipleri': value,
      if (instance.cariFiltre case final value?) 'cari_Filtre': value,
      if (instance.cariFiltreSql case final value?) 'cari_FiltreSQL': value,
      if (instance.cariVirman case final value?) 'cari_Virman': value,
      if (instance.cariVirmanKaydet case final value?)
        'cari_Virman_Kaydet': value,
      if (instance.cariHarita case final value?) 'cari_Harita': value,
      if (instance.cariTeslimCariRehberSadeceSecsin case final value?)
        'cari_TeslimCari_RehberSadeceSecsin': value,
      if (instance.cariTeslimCariSatisBaglanmisCarilerSecilsin
          case final value?)
        'cari_TeslimCari_SatisBaglanmisCarilerSecilsin': value,
      if (instance.cariRaporlar case final value?) 'cari_Raporlar': value,
      if (instance.cariRapEkstre case final value?) 'cari_Rap_Ekstre': value,
      if (instance.cariRapStokEkstre case final value?)
        'cari_Rap_StokEkstre': value,
      if (instance.cariRapYaslandirma case final value?)
        'cari_Rap_Yaslandirma': value,
      if (instance.cariRapHarDetayliYaslandir case final value?)
        'cari_Rap_HarDetayliYaslandir': value,
      if (instance.cariRapHareket case final value?) 'cari_Rap_Hareket': value,
      if (instance.cariRapDovizBakiye case final value?)
        'cari_Rap_DovizBakiye': value,
      if (instance.cariRapStokSatisOzeti case final value?)
        'cari_Rap_StokSatisOzeti': value,
      if (instance.cariRapDovizliEkstre case final value?)
        'cari_Rap_DovizliEkstre': value,
      if (instance.tahsilatTahsilatlar case final value?)
        'tahsilat_Tahsilatlar': value,
      if (instance.tahsilatNakitTahsilat case final value?)
        'tahsilat_NakitTahsilat': value,
      if (instance.tahsilatNakitTahsilatKaydet case final value?)
        'tahsilat_NakitTahsilat_Kaydet': value,
      if (instance.tahsilatKKartiTahsilat case final value?)
        'tahsilat_KKartiTahsilat': value,
      if (instance.tahsilatKKartiTahsilatKaydet case final value?)
        'tahsilat_KKartiTahsilat_Kaydet': value,
      if (instance.tahsilatNakitOdeme case final value?)
        'tahsilat_NakitOdeme': value,
      if (instance.tahsilatNakitOdemeKaydet case final value?)
        'tahsilat_NakitOdeme_Kaydet': value,
      if (instance.tahsilatSenetTahsilat case final value?)
        'tahsilat_SenetTahsilat': value,
      if (instance.tahsilatSenetTahsilatKaydet case final value?)
        'tahsilat_SenetTahsilat_Kaydet': value,
      if (instance.tahsilatCekTahsilat case final value?)
        'tahsilat_CekTahsilat': value,
      if (instance.tahsilatCekTahsilatKaydet case final value?)
        'tahsilat_CekTahsilat_Kaydet': value,
      if (instance.tahsilatMuhtelifTahsilat case final value?)
        'tahsilat_MuhtelifTahsilat': value,
      if (instance.tahsilatMuhtelifOdeme case final value?)
        'tahsilat_MuhtelifOdeme': value,
      if (instance.tahsilatMuhtelifTahsilatFiltre case final value?)
        'tahsilat_MuhtelifTahsilatFiltre': value,
      if (instance.tahsilatMuhtelifTahsilatFiltreSQL case final value?)
        'tahsilat_MuhtelifTahsilatFiltreSQL': value,
      if (instance.tahsilatMuhtelifOdemeFiltre case final value?)
        'tahsilat_MuhtelifOdemeFiltre': value,
      if (instance.tahsilatMuhtelifOdemeFiltreSQL case final value?)
        'tahsilat_MuhtelifOdemeFiltreSQL': value,
      if (instance.yoneticiBankaBankaLitesi case final value?)
        'yonetici_Banka_Banka_Litesi': value,
      if (instance.yoneticiBankaIslemleri case final value?)
        'yonetici_Banka_Islemleri': value,
      if (instance.yoneticiBankaIslemleriSil case final value?)
        'yonetici_Banka_Islemleri_Sil': value,
      if (instance.yoneticiBankaIslemHesapEft case final value?)
        'yonetici_Banka_Islem_HesapEFT': value,
      if (instance.yoneticiBankaIslemHesapVirman case final value?)
        'yonetici_Banka_Islem_HesapVirman': value,
      if (instance.yoneticiBankaIslemCariEft case final value?)
        'yonetici_Banka_Islem_CariEFT': value,
      if (instance.finansBankaKasaTransferi case final value?)
        'finans_Banka_Kasa_Transferi': value,
      if (instance.finansKasaListesi case final value?)
        'finans_Kasa_Listesi': value,
      if (instance.finansKasaIslemleri case final value?)
        'finans_Kasa_Islemleri': value,
      if (instance.finansKasaIslemleriSil case final value?)
        'finans_Kasa_Islemleri_Sil': value,
      if (instance.finansKasalarArasiTransfer case final value?)
        'finans_KasalarArasiTransfer': value,
      if (instance.finansKasaNakitTahsilat case final value?)
        'finans_Kasa_NakitTahsilat': value,
      if (instance.finansKasaNakitOdeme case final value?)
        'finans_Kasa_NakitOdeme': value,
      if (instance.finansKasaMuhtelifTahsilat case final value?)
        'finans_Kasa_MuhtelifTahsilat': value,
      if (instance.finansKasaMuhtelifOdeme case final value?)
        'finans_Kasa_MuhtelifOdeme': value,
      if (instance.finansKasaSenetTahsilati case final value?)
        'finans_Kasa_SenetTahsilati': value,
      if (instance.finansKasaSenetOdemesi case final value?)
        'finans_Kasa_SenetOdemesi': value,
      if (instance.finansKasaCekTahsilati case final value?)
        'finans_Kasa_CekTahsilati': value,
      if (instance.finansKasaCekOdemesi case final value?)
        'finans_Kasa_CekOdemesi': value,
      if (instance.dekontListesi case final value?) 'dekont_Listesi': value,
      if (instance.dekontKaydet case final value?) 'dekont_Kaydet': value,
      if (instance.dekontDuzelt case final value?) 'dekont_Duzelt': value,
      if (instance.dekontSil case final value?) 'dekont_Sil': value,
      if (instance.finansCekGizlenecekAlanlar case final value?)
        'finans_Cek_GizlenecekAlanlar': value,
      if (instance.finansCekMusteri case final value?)
        'finans_Cek_Musteri': value,
      if (instance.finansMcekEkle case final value?) 'finans_MCEK_Ekle': value,
      if (instance.finansMcekSil case final value?) 'finans_MCEK_Sil': value,
      if (instance.finansMcekBelgeDetayi case final value?)
        'finans_MCEK_BelgeDetayi': value,
      if (instance.finansMcekHareketler case final value?)
        'finans_MCEK_Hareketler': value,
      if (instance.finansMcekEvraklar case final value?)
        'finans_MCEK_Evraklar': value,
      if (instance.finansMcekCariyeCiro case final value?)
        'finans_MCEK_CariyeCiro': value,
      if (instance.finansMcekTahsileCiro case final value?)
        'finans_MCEK_TahsileCiro': value,
      if (instance.finansMcekTahsilDekontu case final value?)
        'finans_MCEK_TahsilDekontu': value,
      if (instance.finansCekBorc case final value?) 'finans_Cek_Borc': value,
      if (instance.finansBorcCekiEkle case final value?)
        'finans_BorcCeki_Ekle': value,
      if (instance.finansBorcCekiSil case final value?)
        'finans_BorcCeki_Sil': value,
      if (instance.finansBcekEkle case final value?) 'finans_BCEK_Ekle': value,
      if (instance.finansBcekSil case final value?) 'finans_BCEK_Sil': value,
      if (instance.finansBcekBelgeDetayi case final value?)
        'finans_BCEK_BelgeDetayi': value,
      if (instance.finansBcekHareketler case final value?)
        'finans_BCEK_Hareketler': value,
      if (instance.finansBcekEvraklar case final value?)
        'finans_BCEK_Evraklar': value,
      if (instance.finansBcekOdemeDekontu case final value?)
        'finans_BCEK_OdemeDekontu': value,
      if (instance.finansSenetMusteri case final value?)
        'finans_Senet_Musteri': value,
      if (instance.finansMsenEkle case final value?) 'finans_MSEN_Ekle': value,
      if (instance.finansMsenSil case final value?) 'finans_MSEN_Sil': value,
      if (instance.finansMsenBelgeDetayi case final value?)
        'finans_MSEN_BelgeDetayi': value,
      if (instance.finansMsenHareketler case final value?)
        'finans_MSEN_Hareketler': value,
      if (instance.finansMsenEvraklar case final value?)
        'finans_MSEN_Evraklar': value,
      if (instance.finansMsenCariyeCiro case final value?)
        'finans_MSEN_CariyeCiro': value,
      if (instance.finansMsenTahsileCiro case final value?)
        'finans_MSEN_TahsileCiro': value,
      if (instance.finansMsenTahsilDekontu case final value?)
        'finans_MSEN_TahsilDekontu': value,
      if (instance.finansSenetBorc case final value?)
        'finans_Senet_Borc': value,
      if (instance.finansBsenEkle case final value?) 'finans_BSEN_Ekle': value,
      if (instance.finansBsenSil case final value?) 'finans_BSEN_Sil': value,
      if (instance.finansBsenBelgeDetayi case final value?)
        'finans_BSEN_BelgeDetayi': value,
      if (instance.finansBsenHareketler case final value?)
        'finans_BSEN_Hareketler': value,
      if (instance.finansBsenEvraklar case final value?)
        'finans_BSEN_Evraklar': value,
      if (instance.finansBsenOdemeDekontu case final value?)
        'finans_BSEN_OdemeDekontu': value,
      if (instance.finansKKartiTahsilati case final value?)
        'finans_KKartiTahsilati': value,
      if (instance.finansMuhtelifTahsilat case final value?)
        'finans_MuhtelifTahsilat': value,
      if (instance.finansMuhtelifOdeme case final value?)
        'finans_MuhtelifOdeme': value,
      if (instance.finansTahsilatKayitlari case final value?)
        'finans_TahsilatKayitlari': value,
      if (instance.finansHizliTahsilatKayitlari case final value?)
        'finans_HizliTahsilatKayitlari': value,
      if (instance.finansHizliTahsilatKayitlariSil case final value?)
        'finans_HizliTahsilatKayitlari_Sil': value,
      if (instance.finansOrtalamaVadeTarihiHesaplama case final value?)
        'finans_OrtalamaVadeTarihiHesaplama': value,
      if (instance.finansOzetRapor case final value?) 'finans_OzetRapor': value,
      if (instance.finansRaporlarFinansalDurum case final value?)
        'finans_Raporlar_FinansalDurum': value,
      if (instance.finansRaporlarAylikMizan case final value?)
        'finans_Raporlar_AylikMizan': value,
      if (instance.temsilciProfil case final value?) 'temsilci_Profil': value,
      if (instance.temsilciProfilKdvDahil case final value?)
        'temsilci_Profil_KdvDahil': value,
      if (instance.temsilciProfilSatisPerformansiniGizle case final value?)
        'temsilci_Profil_SatisPerformansiniGizle': value,
      if (instance.temsilciProfilAylaraGoreSatisiGizle case final value?)
        'temsilci_Profil_AylaraGoreSatisiGizle': value,
      if (instance.temsilciProfilAylaraGoreTahsilatiGizle case final value?)
        'temsilci_Profil_AylaraGoreTahsilatiGizle': value,
      if (instance.yazdirmaBluetoothYaziciKullanabilir case final value?)
        'yazdirma_BluetoothYaziciKullanabilir': value,
      if (instance.yazdirmaHucreEtiketi case final value?)
        'yazdirma_Hucre_Etiketi': value,
      if (instance.yazdirmaHucreEtiketiYazicilari case final value?)
        'yazdirma_Hucre_Etiketi_Yazicilari': value,
      if (instance.yazdirmaDizaynHucreEtiketi case final value?)
        'yazdirma_Dizayn_HucreEtiketi': value,
      if (instance.yazdirmaMalToplamaEtiketi case final value?)
        'yazdirma_MalToplama_Etiketi': value,
      if (instance.yazdirmaMalToplamaYazicilari case final value?)
        'yazdirma_Mal_Toplama_Yazicilari': value,
      if (instance.yazdirmaDizaynMalToplama case final value?)
        'yazdirma_Dizayn_MalToplama': value,
      if (instance.yazdirmaMalKontrolEtiketi case final value?)
        'yazdirma_MalKontrol_Etiketi': value,
      if (instance.yazdirmaMalKontrolYazicilari case final value?)
        'yazdirma_Mal_Kontrol_Yazicilari': value,
      if (instance.yazdirmaDizaynMalKontrol case final value?)
        'yazdirma_Dizayn_MalKontrol': value,
      if (instance.yazdirmaDat case final value?) 'yazdirma_DAT': value,
      if (instance.yazdirmaDatYazicilari case final value?)
        'yazdirma_DAT_Yazicilari': value,
      if (instance.yazdirmaDizaynDAT case final value?)
        'yazdirma_Dizayn_DAT': value,
      if (instance.yazdirmaPaketlemeEtiketi case final value?)
        'yazdirma_Paketleme_Etiketi': value,
      if (instance.yazdirmaPaketlemeKopyaSayisiGizle case final value?)
        'yazdirma_Paketleme_KopyaSayisiGizle': value,
      if (instance.yazdirmaPaketlemeYazicilari case final value?)
        'yazdirma_Paketleme_Yazicilari': value,
      if (instance.yazdirmaDizaynPaketleme case final value?)
        'yazdirma_Dizayn_Paketleme': value,
      if (instance.yazdirmaSatisIrs case final value?)
        'yazdirma_SatisIrs': value,
      if (instance.yazdirmaSatisFat case final value?)
        'yazdirma_SatisFat': value,
      if (instance.yazdirmaSatisFatYazicilari case final value?)
        'yazdirma_SatisFat_Yazicilari': value,
      if (instance.yazdirmaDizaynSatisFat case final value?)
        'yazdirma_Dizayn_SatisFat': value,
      if (instance.yazdirmaAlisFat case final value?) 'yazdirma_AlisFat': value,
      if (instance.yazdirmaDizaynAlisFat case final value?)
        'yazdirma_Dizayn_AlisFat': value,
      if (instance.yazdirmaMustahsil case final value?)
        'yazdirma_Mustahsil': value,
      if (instance.yazdirmaMusSip case final value?) 'yazdirma_MusSip': value,
      if (instance.yazdirmaMusSipYazicilari case final value?)
        'yazdirma_MusSip_Yazicilari': value,
      if (instance.yazdirmaDizaynMusSip case final value?)
        'yazdirma_Dizayn_MusSip': value,
      if (instance.yazdirmaSaticiSip case final value?)
        'yazdirma_SaticiSip': value,
      if (instance.yazdirmaDizaynSaticiSip case final value?)
        'yazdirma_Dizayn_SaticiSip': value,
      if (instance.yazdirmaAtal case final value?) 'yazdirma_ATAL': value,
      if (instance.yazdirmaAtalYazicilari case final value?)
        'yazdirma_ATAL_Yazicilari': value,
      if (instance.yazdirmaDizaynATAL case final value?)
        'yazdirma_Dizayn_ATAL': value,
      if (instance.yazdirmaOdemeMakbuzu case final value?)
        'yazdirma_OdemeMakbuzu': value,
      if (instance.yazdirmaOdemeMakbuzuYazicilari case final value?)
        'yazdirma_OdemeMakbuzu_Yazicilari': value,
      if (instance.yazdirmaDizaynOdemeMakbuzu case final value?)
        'yazdirma_Dizayn_OdemeMakbuzu': value,
      if (instance.yazdirmaAlisIrs case final value?) 'yazdirma_AlisIrs': value,
      if (instance.yazdirmaAlisIrsYazicilari case final value?)
        'yazdirma_AlisIrs_Yazicilari': value,
      if (instance.yazdirmaDizaynAlisIrs case final value?)
        'yazdirma_Dizayn_AlisIrs': value,
      if (instance.yazdirmaIsEmri case final value?) 'yazdirma_IsEmri': value,
      if (instance.yazdirmaAmbarCikis case final value?)
        'yazdirma_AmbarCikis': value,
      if (instance.yazdirmaAmbarGiris case final value?)
        'yazdirma_AmbarGiris': value,
      if (instance.yazdirmaCariHareket case final value?)
        'yazdirma_CariHareket': value,
      if (instance.uretimFiyatGorebilir case final value?)
        'uretim_FiyatGorebilir': value,
      if (instance.uretimUskKaydet case final value?)
        'uretim_USK_Kaydet': value,
      if (instance.uretimUskDuzelt case final value?)
        'uretim_USK_Duzelt': value,
      if (instance.uretimUskSil case final value?) 'uretim_USK_Sil': value,
      if (instance.uretimUskKacGunlukKayitlarListelensin case final value?)
        'uretim_USK_KacGunlukKayitlarListelensin': value,
      if (instance.uretimUskMiktarBarkoddan case final value?)
        'uretim_USK_MiktarBarkoddan': value,
      if (instance.uretimUskMiktar1Gelsin case final value?)
        'uretim_USK_Miktar1Gelsin': value,
      if (instance.sirketDepoUretimGiris case final value?)
        'sirket_Depo_Uretim_Giris': value,
      if (instance.sirketDepoUretimCikis case final value?)
        'sirket_Depo_Uretim_Cikis': value,
      if (instance.uretimUskIsEmriOtoGelsin case final value?)
        'uretim_USK_IsEmriOtoGelsin': value,
      if (instance.uretimUskSoruSorulmasin case final value?)
        'uretim_USK_SoruSorulmasin': value,
      if (instance.uretimUskStokRehberiAcilmasin case final value?)
        'uretim_USK_StokRehberiAcilmasin': value,
      if (instance.uretimUskKlavyeEngelle case final value?)
        'uretim_USK_KlavyeEngelle': value,
      if (instance.uretimUskDepoOnceligi case final value?)
        'uretim_USK_DepoOnceligi': value,
      if (instance.uretimUskFisiErpUretsin case final value?)
        'uretim_USK_FisiErpUretsin': value,
      if (instance.uretimUskGizlenecekAlanlar case final value?)
        'uretim_USK_GizlenecekAlanlar': value,
      if (instance.uretimUskBosGecilmeyecekAlanlar case final value?)
        'uretim_USK_BosGecilmeyecekAlanlar': value,
      if (instance.uretimUskDegismeyecekAlanlar case final value?)
        'uretim_USK_DegismeyecekAlanlar': value,
      if (instance.uretimUskOlcuBirimi case final value?)
        'uretim_USK_OlcuBirimi': value,
      if (instance.uretimUskOtoYazdir case final value?)
        'uretim_USK_OtoYazdir': value,
      if (instance.uretimUskKalemliYapi case final value?)
        'uretim_USK_KalemliYapi': value,
      if (instance.uretimUskKalemliYapiStokMevcutaEklensin case final value?)
        'uretim_USK_KalemliYapi_StokMevcutaEklensin': value,
      if (instance.uretimUskKalemliYapiOtoEtiketYazdir case final value?)
        'uretim_USK_KalemliYapi_OtoEtiketYazdir': value,
      if (instance.uretimUskKalemliYapiAyniBarkodOkutulamaz case final value?)
        'uretim_USK_KalemliYapi_AyniBarkodOkutulamaz': value,
      if (instance.uretimUskKalemliYapiOkutulanEnUsteEklensin case final value?)
        'uretim_USK_KalemliYapi_OkutulanEnUsteEklensin': value,
      if (instance.uretimUskKalemliYapiKalemDuzeltilemesin case final value?)
        'uretim_USK_KalemliYapi_KalemDuzeltilemesin': value,
      if (instance.uretimReceteIzleme case final value?)
        'uretim_ReceteIzleme': value,
      if (instance.uretimMalToplama case final value?)
        'uretim_MalToplama': value,
      if (instance.uretimMalToplamaEkle case final value?)
        'uretim_MalToplama_Ekle': value,
      if (instance.uretimMalToplamaSil case final value?)
        'uretim_MalToplama_Sil': value,
      if (instance.uretimMalToplamaKlavyeEngelle case final value?)
        'uretim_MalToplama_KlavyeEngelle': value,
      if (instance.uretimMalToplamaBarkodOkutsun case final value?)
        'uretim_MalToplama_BarkodOkutsun': value,
      if (instance.uretimMalToplamaBelgeTipleri case final value?)
        'uretim_MalToplama_BelgeTipleri': value,
      if (instance.uretimMalToplamaReceteFiltresi case final value?)
        'uretim_MalToplama_ReceteFiltresi': value,
      if (instance.uretimMalToplamaReceteFiltresiSQL case final value?)
        'uretim_MalToplama_ReceteFiltresiSQL': value,
      if (instance.uretimIsEmri case final value?) 'uretim_IsEmri': value,
      if (instance.uretimIsemriHammaddeTakip case final value?)
        'uretim_Isemri_HammaddeTakip': value,
      if (instance.uretimIsEmriEkle case final value?)
        'uretim_IsEmri_Ekle': value,
      if (instance.uretimIsEmriDuzelt case final value?)
        'uretim_IsEmri_Duzelt': value,
      if (instance.uretimIsEmriSil case final value?)
        'uretim_IsEmri_Sil': value,
      if (instance.taltekStek case final value?) 'taltek_STEK': value,
      if (instance.taltekStekKaydet case final value?)
        'taltek_STEK_Kaydet': value,
      if (instance.taltekStekDuzelt case final value?)
        'taltek_STEK_Duzelt': value,
      if (instance.taltekStekSil case final value?) 'taltek_STEK_Sil': value,
      if (instance.taltekStekKapalilarListenlenmesin case final value?)
        'taltek_STEK_KapalilarListenlenmesin': value,
      if (instance.taltekStekOnayIslemleri case final value?)
        'taltek_STEK_OnayIslemleri': value,
      if (instance.taltekStekCariKoduDegistir case final value?)
        'taltek_STEK_CariKoduDegistir': value,
      if (instance.taltekStekFiyatDegistirilmesin case final value?)
        'taltek_STEK_FiyatDegistirilmesin': value,
      if (instance.taltekStekAciklamalarYetkiTuru case final value?)
        'taltek_STEK_Aciklamalar_YetkiTuru': value,
      if (instance.taltekStekGizlenecekAlanlar case final value?)
        'taltek_STEK_GizlenecekAlanlar': value,
      if (instance.taltekStekDegismeyecekAlanlar case final value?)
        'taltek_STEK_DegismeyecekAlanlar': value,
      if (instance.taltekStekBosGecilmeyecekAlanlar case final value?)
        'taltek_STEK_BosGecilmeyecekAlanlar': value,
      if (instance.taltekStekAciklamaAlanlari case final value?)
        'taltek_STEK_AciklamaAlanlari': value,
      if (instance.taltekStekOzelKod1degeri case final value?)
        'taltek_STEK_OzelKod1degeri': value,
      if (instance.taltekStekDipFiyatUygulamasi case final value?)
        'taltek_STEK_DipFiyatUygulamasi': value,
      if (instance.taltekStekDipFiyatSaha case final value?)
        'taltek_STEK_DipFiyatSaha': value,
      if (instance.taltekStekDipFiyatEylem case final value?)
        'taltek_STEK_DipFiyatEylem': value,
      if (instance.taltekAtal case final value?) 'taltek_ATAL': value,
      if (instance.taltekAtalKaydet case final value?)
        'taltek_ATAL_Kaydet': value,
      if (instance.taltekAtalDuzelt case final value?)
        'taltek_ATAL_Duzelt': value,
      if (instance.taltekAtalSil case final value?) 'taltek_ATAL_Sil': value,
      if (instance.taltekAtalCariEMailAlani case final value?)
        'taltek_ATAL_CariEMailAlani': value,
      if (instance.taltekAtalOnayIslemleri case final value?)
        'taltek_ATAL_OnayIslemleri': value,
      if (instance.taltekAtalCariKoduDegistir case final value?)
        'taltek_ATAL_CariKoduDegistir': value,
      if (instance.taltekAtalAciklamalarYetkiTuru case final value?)
        'taltek_ATAL_Aciklamalar_YetkiTuru': value,
      if (instance.taltekAtalGizlenecekAlanlar case final value?)
        'taltek_ATAL_GizlenecekAlanlar': value,
      if (instance.taltekAtalAciklamaAlanlari case final value?)
        'taltek_ATAL_AciklamaAlanlari': value,
      if (instance.taltekAtalBelgeKopyala case final value?)
        'taltek_ATAL_BelgeKopyala': value,
      if (instance.taltekStal case final value?) 'taltek_STAL': value,
      if (instance.taltekStalKaydet case final value?)
        'taltek_STAL_Kaydet': value,
      if (instance.taltekStalDuzelt case final value?)
        'taltek_STAL_Duzelt': value,
      if (instance.taltekStalSil case final value?) 'taltek_STAL_Sil': value,
      if (instance.taltekStalKapalilarListenlenmesin case final value?)
        'taltek_STAL_KapalilarListenlenmesin': value,
      if (instance.taltekStalOnayIslemleri case final value?)
        'taltek_STAL_OnayIslemleri': value,
      if (instance.taltekStalCariKoduDegistir case final value?)
        'taltek_STAL_CariKoduDegistir': value,
      if (instance.taltekStalFiyatDegistirilmesin case final value?)
        'taltek_STAL_FiyatDegistirilmesin': value,
      if (instance.taltekStalGizlenecekAlanlar case final value?)
        'taltek_STAL_GizlenecekAlanlar': value,
      if (instance.taltekStalDipFiyatUygulamasi case final value?)
        'taltek_STAL_DipFiyatUygulamasi': value,
      if (instance.ebelgeEFat case final value?) 'ebelge_EFat': value,
      if (instance.ebelgeEFatCariGuncelle case final value?)
        'ebelge_EFatCariGuncelle': value,
      if (instance.ebelgeEFatSorgula case final value?)
        'ebelge_EFatSorgula': value,
      if (instance.ebelgeEFatGelenKutusu case final value?)
        'ebelge_EFatGelenKutusu': value,
      if (instance.ebelgeEFatTaslakOlustur case final value?)
        'ebelge_EFatTaslakOlustur': value,
      if (instance.ebelgeEFatTaslakSil case final value?)
        'ebelge_EFatTaslakSil': value,
      if (instance.ebelgeEFatTaslakBasim case final value?)
        'ebelge_EFatTaslakBasim': value,
      if (instance.ebelgeEFatGoruntule case final value?)
        'ebelge_EFatGoruntule': value,
      if (instance.ebelgeEFatAlisFatOlustur case final value?)
        'ebelge_EFatAlisFatOlustur': value,
      if (instance.ebelgeEFatGonder case final value?)
        'ebelge_EFatGonder': value,
      if (instance.ebelgeEFatDizayn case final value?)
        'ebelge_EFat_Dizayn': value,
      if (instance.ebelgeEArsiv case final value?) 'ebelge_EArsiv': value,
      if (instance.ebelgeEArsivTaslakOlustur case final value?)
        'ebelge_EArsivTaslakOlustur': value,
      if (instance.ebelgeEArsivTaslakSil case final value?)
        'ebelge_EArsivTaslakSil': value,
      if (instance.ebelgeEArsivTaslakBasim case final value?)
        'ebelge_EArsivTaslakBasim': value,
      if (instance.ebelgeEArsivGoruntule case final value?)
        'ebelge_EArsivGoruntule': value,
      if (instance.ebelgeEArsivSorgula case final value?)
        'ebelge_EArsivSorgula': value,
      if (instance.ebelgeEArsivGonder case final value?)
        'ebelge_EArsivGonder': value,
      if (instance.ebelgeEArsivDizayn case final value?)
        'ebelge_EArsiv_Dizayn': value,
      if (instance.ebelgeEIrsaliye case final value?) 'ebelge_EIrsaliye': value,
      if (instance.ebelgeEFaturaGidenKutusu case final value?)
        'ebelge_EFatGidenKutusu': value,
      if (instance.ebelgeEIrsaliyeGidenKutusu case final value?)
        'ebelge_EIrsaliyeGidenKutusu': value,
      if (instance.ebelgeEIrsaliyeGelenKutusu case final value?)
        'ebelge_EIrsaliyeGelenKutusu': value,
      if (instance.ebelgeEIrsaliyeTaslakOlustur case final value?)
        'ebelge_EIrsaliyeTaslakOlustur': value,
      if (instance.ebelgeEIrsaliyeTaslakSil case final value?)
        'ebelge_EIrsaliyeTaslakSil': value,
      if (instance.ebelgeEIrsaliyeTaslakBasim case final value?)
        'ebelge_EIrsaliyeTaslakBasim': value,
      if (instance.ebelgeEIrsaliyeGonder case final value?)
        'ebelge_EIrsaliyeGonder': value,
      if (instance.ebelgeEIrsaliyeGoruntule case final value?)
        'ebelge_EIrsaliyeGoruntule': value,
      if (instance.ebelgeEIrsaliyeDizayn case final value?)
        'ebelge_EIrsaliye_Dizayn': value,
      if (instance.entegrasyonUetdsesya case final value?)
        'entegrasyon_UETDSESYA': value,
      if (instance.entegrasyonUetdsesyaIptal case final value?)
        'entegrasyon_UETDSESYA_Iptal': value,
      if (instance.transferDatTekrarEdenBarkod case final value?)
        'transfer_DAT_TekrarEdenBarkod': value,
      if (instance.transferDatAciklamaDuzenle case final value?)
        'transfer_DAT_AciklamaDuzenle': value,
      if (instance.transferDatLokalDatSeciliGelmesin case final value?)
        'transfer_DAT_LokalDATSeciliGelmesin': value,
      if (instance.transferDatVarsayilanHarTuruDegistiremesin case final value?)
        'transfer_DAT_VarsayilanHarTuruDegistiremesin': value,
      if (instance.transferDatDepoCaridenGelsin case final value?)
        'transfer_DAT_DepoCaridenGelsin': value,
      if (instance.transferAgSipBagSecenegi case final value?)
        'transfer_AG_SipBagSecenegi': value,
      if (instance.transferAgTekrarEdenBarkod case final value?)
        'transfer_AG_TekrarEdenBarkod': value,
      if (instance.transferAgAciklamaDuzenle case final value?)
        'transfer_AG_AciklamaDuzenle': value,
      if (instance.transferAcSipBagSecenegi case final value?)
        'transfer_AC_SipBagSecenegi': value,
      if (instance.transferAcTekrarEdenBarkod case final value?)
        'transfer_AC_TekrarEdenBarkod': value,
      if (instance.transferAcAciklamaDuzenle case final value?)
        'transfer_AC_AciklamaDuzenle': value,
      if (instance.transferDepoTalebiBildirim case final value?)
        'transfer_DepoTalebi_Bildirim': value,
      if (instance.uretimUsk case final value?) 'uretim_USK': value,
      if (instance.malKabulAlisIrsDegismeyecekAlanlar case final value?)
        'malKabul_AlisIrs_DegismeyecekAlanlar': value,
      if (instance.malKabulAlisIrsAciklamaDuzenle case final value?)
        'malKabul_AlisIrs_AciklamaDuzenle': value,
      if (instance.malKabulAlisFatDegismeyecekAlanlar case final value?)
        'malKabul_AlisFat_DegismeyecekAlanlar': value,
      if (instance.malKabulAlisFatAciklamaDuzenle case final value?)
        'malKabul_AlisFat_AciklamaDuzenle': value,
      if (instance.malKabulAlisFatTekrarEdenBarkod case final value?)
        'malKabul_AlisFat_TekrarEdenBarkod': value,
      if (instance.malKabulAlisFaturasiSipBagSecenegi case final value?)
        'malKabul_AlisFaturasi_SipBagSecenegi': value,
      if (instance.sevkiyatSatisIrsVarsayilanBelgeTipi case final value?)
        'sevkiyat_SatisIrs_VarsayilanBelgeTipi': value,
      if (instance.sevkiyatSatisIrsaliyesiAciklamaAlanlari case final value?)
        'sevkiyat_SatisIrsaliyesi_AciklamaAlanlari': value,
      if (instance.sevkiyatSatisIrsaliyesiAciklamaDuzenle case final value?)
        'sevkiyat_SatisIrsaliyesi_AciklamaDuzenle': value,
      if (instance.sevkiyatSatisIrsKayittanSonraTaslakOlustur case final value?)
        'sevkiyat_SatisIrs_KayittanSonraTaslakOlustur': value,
      if (instance.sevkiyatSatisIrsIadeMiktariGirebilir case final value?)
        'sevkiyat_SatisIrs_IadeMiktariGirebilir': value,
      if (instance.sevkiyatSatisIrsIadeMiktariGirebilirFarkliDepo
          case final value?)
        'sevkiyat_SatisIrs_IadeMiktariGirebilirFarkliDepo': value,
      if (instance.sevkiyatSatisIrsTekrarEdenBarkod case final value?)
        'sevkiyat_SatisIrs_TekrarEdenBarkod': value,
      if (instance.sevkiyatSatisFatAciklamaDuzenle case final value?)
        'sevkiyat_SatisFat_AciklamaDuzenle': value,
      if (instance.sevkiyatSatisFatIadeMiktariGirebilir case final value?)
        'sevkiyat_SatisFat_IadeMiktariGirebilir': value,
      if (instance.sevkiyatSatisFatIadeMiktariGirebilirFarkliDepo
          case final value?)
        'sevkiyat_SatisFat_IadeMiktariGirebilirFarkliDepo': value,
      if (instance.sevkiyatSatisFaturasiTekrarEdenBarkod case final value?)
        'sevkiyat_SatisFaturasi_TekrarEdenBarkod': value,
      if (instance.sevkemriMalToplamaYontemi case final value?)
        'sevkemri_MalToplama_Yontemi': value,
      if (instance.sayimSerbestSayimFiltreIslem case final value?)
        'sayim_SerbestSayimFiltreIslem': value,
      if (instance.siparisMusSipBelgeKopyala case final value?)
        'siparis_MusSip_BelgeKopyala': value,
      if (instance.siparisMusSipTekrarEdenBarkod case final value?)
        'siparis_MusSip_TekrarEdenBarkod': value,
      if (instance.siparisMusSipKacGunlukKayitlarListelensin case final value?)
        'siparis_MusSip_KacGunlukKayitlarListelensin': value,
      if (instance.siparisMusteriSiparisiAciklamaDuzenle case final value?)
        'siparis_MusteriSiparisi_AciklamaDuzenle': value,
      if (instance.stokFiltreSqlTipi case final value?)
        'stok_FiltreSQLTipi': value,
      if (instance.stokFiyatGorEkraniGunlukKurdanTlGoster case final value?)
        'stok_FiyatGorEkrani_GunlukKurdanTLGoster': value,
      if (instance.stokPaketlemeCoklu case final value?)
        'stok_Paketleme_Coklu': value,
      if (instance.stokRehberBakiyesindeDigerOlcuBirimleriGorunsun
          case final value?)
        'stok_RehberBakiyesindeDigerOlcuBirimleriGorunsun': value,
      if (instance.stokYazdirPdfGoruntule case final value?)
        'stok_YazdirPdfGoruntule': value,
      if (instance.cariToplamGorunmesin case final value?)
        'cari_ToplamGorunmesin': value,
      if (instance.cariBakiyeGosterim case final value?)
        'cari_BakiyeGosterim': value,
      if (instance.cariFiltreSqlTipi case final value?)
        'cari_FiltreSQLTipi': value,
      if (instance.tahsilatDovizKuruDegeri case final value?)
        'tahsilat_DovizKuru_Degeri': value,
      if (instance.tahsilatDovizKuruYetki case final value?)
        'tahsilat_DovizKuru_Yetki': value,
      if (instance.tahsilatDovizKuruTolerans case final value?)
        'tahsilat_DovizKuru_Tolerans': value,
      if (instance.finansRaporlarKasaEkstre case final value?)
        'finans_Raporlar_KasaEkstre': value,
      if (instance.finansKasaGizlenecekAlanlar case final value?)
        'finans_Kasa_GizlenecekAlanlar': value,
      if (instance.finansKasaDegistirilemeyecekAlanlar case final value?)
        'finans_Kasa_DegistirilemeyecekAlanlar': value,
      if (instance.finansKasaBosGecilemeyecekAlanlar case final value?)
        'finans_Kasa_BosGecilemeyecekAlanlar': value,
      if (instance.taltekStekAciklamaDuzenle case final value?)
        'taltek_STEK_AciklamaDuzenle': value,
      if (instance.taltekStekDipFiyatKdvDurumu case final value?)
        'taltek_STEK_DipFiyatKDVDurumu': value,
      if (instance.taltekStalAciklamaDuzenle case final value?)
        'taltek_STAL_AciklamaDuzenle': value,
      if (instance.taltekStalDipFiyatSaha case final value?)
        'taltek_STAL_DipFiyatSaha': value,
      if (instance.taltekStalDipFiyatEylem case final value?)
        'taltek_STAL_DipFiyatEylem': value,
      if (instance.taltekStalDipFiyatKdvDurumu case final value?)
        'taltek_STAL_DipFiyatKDVDurumu': value,
      if (instance.malKabulAlisIrsBirim1DenKaydet case final value?)
        'malKabul_AlisIrs_Birim1denKaydet': value,
      if (instance.malKabulAlisFatBirim1DenKaydet case final value?)
        'malKabul_AlisFat_Birim1denKaydet': value,
      if (instance.transferAgBirim1DenKaydet case final value?)
        'transfer_AG_Birim1denKaydet': value,
      if (instance.transferAcBirim1DenKaydet case final value?)
        'transfer_AC_Birim1denKaydet': value,
      if (instance.sevkiyatSatisIrsKdvSifirGelsin case final value?)
        'sevkiyat_SatisIrs_KDVSifirGelsin': value,
      if (instance.sevkiyatSatisIrsBirim1DenKaydet case final value?)
        'sevkiyat_SatisIrs_Birim1denKaydet': value,
      if (instance.sevkiyatSatisIrsDipFiyatKdvDurumu case final value?)
        'sevkiyat_SatisIrs_DipFiyatKDVDurumu': value,
      if (instance.sevkiyatSatisFatBirim1DenKaydet case final value?)
        'sevkiyat_SatisFat_Birim1denKaydet': value,
      if (instance.siparisMusteriSiparisiDipFiyatKdvDurumu case final value?)
        'siparis_MusteriSiparisi_DipFiyatKDVDurumu': value,
      if (instance.siparisSatSipTekrarEdenBarkod case final value?)
        'siparis_SatSip_TekrarEdenBarkod': value,
      if (instance.siparisSatSipKacGunlukKayitlarListelensin case final value?)
        'siparis_SatSip_KacGunlukKayitlarListelensin': value,
      if (instance.cariRapBorcAlacakDokumu case final value?)
        'cari_Rap_BorcAlacakDokumu': value,
      if (instance.sirketProjeYetkiTuru case final value?)
        'sirket_Proje_YetkiTuru': value,
      if (instance.transferDatVarsayilanHarTuru case final value?)
        'transfer_DAT_VarsayilanHarTuru': value,
      if (instance.siparisMusSipKdvDurumu case final value?)
        'siparis_MusSip_KdvDurumu': value,
      if (instance.siparisSaticiSiparisiAciklamaDuzenle case final value?)
        'siparis_SaticiSiparisi_AciklamaDuzenle': value,
      if (instance.taltekStekKdvDurumu case final value?)
        'taltek_STEK_KdvDurumu': value,
      if (instance.taltekStalKdvDurumu case final value?)
        'taltek_STAL_KdvDurumu': value,
      if (instance.transferAgBosGecilmeyecekAlanlar case final value?)
        'transfer_AG_BosGecilmeyecekAlanlar': value,
      if (instance.transferAgGizlenecekAlanlar case final value?)
        'transfer_AG_GizlenecekAlanlar': value,
      if (instance.transferAgDegismeyecekAlanlar case final value?)
        'transfer_AG_DegismeyecekAlanlar': value,
      if (instance.transferAgAciklamaAlanlari case final value?)
        'transfer_AG_AciklamaAlanlari': value,
      if (instance.transferAcAciklamaAlanlari case final value?)
        'transfer_AC_AciklamaAlanlari': value,
      if (instance.sevkiyatSatisFatKdvDurumu case final value?)
        'sevkiyat_SatisFat_KdvDurumu': value,
      if (instance.sigmaOlcumGir case final value?) 'sigma_OlcumGir': value,
      if (instance.sigmaOlcumGirKaydet case final value?)
        'sigma_OlcumGir_Kaydet': value,
      if (instance.sigmaOlcumGirDuzelt case final value?)
        'sigma_OlcumGir_Duzelt': value,
      if (instance.sigmaOlcumGirSil case final value?)
        'sigma_OlcumGir_Sil': value,
      if (instance.sigmaTeknikResim case final value?)
        'sigma_TeknikResim': value,
      if (instance.sigmaKontrolPlani case final value?)
        'sigma_KontrolPlani': value,
      if (instance.transferDatEIrsaliyeIsaretDurum case final value?)
        'transfer_DAT_EIrsaliyeIsaretDurum': value,
      if (instance.transferAcEIrsaliyeIsaretDurum case final value?)
        'transfer_AC_EIrsaliyeIsaretDurum': value,
      if (instance.sevkiyatSatisIrsaliyesiEIrsaliyeIsaretDurum
          case final value?)
        'sevkiyat_SatisIrsaliyesi_EIrsaliyeIsaretDurum': value,
      if (instance.sayimAyniBarkodEngelle case final value?)
        'sayim_AyniBarkodEngelle': value,
      if (instance.siparisMusSipBildirim case final value?)
        'siparis_MusSip_Bildirim': value,
      if (instance.siparisSatSipBildirim case final value?)
        'siparis_SatSip_Bildirim': value,
      if (instance.stokStokKartiFiyatlariGizle case final value?)
        'stok_StokKarti_FiyatlariGizle': value,
      if (instance.stokBarkodTanimlamaZorunluBarkodTipi case final value?)
        'stok_BarkodTanimlama_ZorunluBarkodTipi': value,
      if (instance.stokCariStokFiltresiUygulansin case final value?)
        'stok_CariStokFiltresiUygulansin': value,
      if (instance.cariKodDegistir case final value?) 'cari_KodDegistir': value,
      if (instance.cariRapDovizliBorcAlacakDokumu case final value?)
        'cari_Rap_DovizliBorcAlacakDokumu': value,
      if (instance.cariRapUrunGrubunaGoreSatis case final value?)
        'cari_Rap_UrunGrubunaGoreSatis': value,
      if (instance.finansKasaNakitTahsilatKasaBakGizle case final value?)
        'finans_Kasa_NakitTahsilat_KasaBakGizle': value,
      if (instance.finansKasaNakitOdemeKasaBakGizle case final value?)
        'finans_Kasa_NakitOdeme_KasaBakGizle': value,
      if (instance.finansKasaKacGunlukKayitlarListelensin case final value?)
        'finans_Kasa_KacGunlukKayitlarListelensin': value,
      if (instance.yazdirmaMustahsilYazicilari case final value?)
        'yazdirma_Mustahsil_Yazicilari': value,
      if (instance.yazdirmaDizaynMustahsil case final value?)
        'yazdirma_Dizayn_Mustahsil': value,
      if (instance.yazdirmaSaticiSipYazicilari case final value?)
        'yazdirma_SaticiSip_Yazicilari': value,
      if (instance.yazdirmaSatisTeklifiYazicilari case final value?)
        'yazdirma_SatisTeklifi_Yazicilari': value,
      if (instance.yazdirmaTahsilatMakbuzuYazicilari case final value?)
        'yazdirma_TahsilatMakbuzu_Yazicilari': value,
      if (instance.sirketDepoYetkiTuru case final value?)
        'sirket_Depo_YetkiTuru': value,
      if (instance.siparisMusSipOzelKod1Degeri case final value?)
        'siparis_MusSip_OzelKod1Degeri': value,
      if (instance.siparisSaticiSiparisiSatirAciklamaAlanlari case final value?)
        'siparis_SaticiSiparisi_SatirAciklamaAlanlari': value,
      if (instance.transferAgOtoPdfGor case final value?)
        'transfer_AG_OtoPdfGor': value,
      if (instance.transferAgBildirim case final value?)
        'transfer_AG_Bildirim': value,
      if (instance.transferAgEMailGonder case final value?)
        'transfer_AG_EMailGonder': value,
      if (instance.transferAgEMailGonderBaslik case final value?)
        'transfer_AG_EMailGonder_Baslik': value,
      if (instance.transferAgEMailGonderDizayn case final value?)
        'transfer_AG_EMailGonder_Dizayn': value,
      if (instance.transferAcOtoPdfGor case final value?)
        'transfer_AC_OtoPdfGor': value,
      if (instance.transferAcBildirim case final value?)
        'transfer_AC_Bildirim': value,
      if (instance.transferAcEMailGonder case final value?)
        'transfer_AC_EMailGonder': value,
      if (instance.transferAcEMailGonderBaslik case final value?)
        'transfer_AC_EMailGonder_Baslik': value,
      if (instance.transferAcEMailGonderDizayn case final value?)
        'transfer_AC_EMailGonder_Dizayn': value,
      if (instance.malKabulAlisIrsOtoPdfGor case final value?)
        'malKabul_AlisIrs_OtoPdfGor': value,
      if (instance.malKabulAlisIrsBildirim case final value?)
        'malKabul_AlisIrs_Bildirim': value,
      if (instance.malKabulAlisIrsEMailGonder case final value?)
        'malKabul_AlisIrs_EMailGonder': value,
      if (instance.malKabulAlisIrsEMailGonderBaslik case final value?)
        'malKabul_AlisIrs_EMailGonder_Baslik': value,
      if (instance.malKabulAlisIrsEMailGonderDizayn case final value?)
        'malKabul_AlisIrs_EMailGonder_Dizayn': value,
      if (instance.malKabulAlisFatBildirim case final value?)
        'malKabul_AlisFat_Bildirim': value,
      if (instance.malKabulAlisFatEMailGonder case final value?)
        'malKabul_AlisFat_EMailGonder': value,
      if (instance.malKabulAlisFatEMailGonderBaslik case final value?)
        'malKabul_AlisFat_EMailGonder_Baslik': value,
      if (instance.malKabulAlisFatEMailGonderDizayn case final value?)
        'malKabul_AlisFat_EMailGonder_Dizayn': value,
      if (instance.transferDatOtoPdfGor case final value?)
        'transfer_DAT_OtoPdfGor': value,
      if (instance.transferDatBildirim case final value?)
        'transfer_DAT_Bildirim': value,
      if (instance.transferDatEMailGonder case final value?)
        'transfer_DAT_EMailGonder': value,
      if (instance.transferDatEMailGonderBaslik case final value?)
        'transfer_DAT_EMailGonder_Baslik': value,
      if (instance.transferDatEMailGonderDizayn case final value?)
        'transfer_DAT_EMailGonder_Dizayn': value,
      if (instance.sevkiyatSatisIrsOtoPdfGor case final value?)
        'sevkiyat_SatisIrs_OtoPdfGor': value,
      if (instance.sevkiyatSatisIrsBildirim case final value?)
        'sevkiyat_SatisIrs_Bildirim': value,
      if (instance.sevkiyatSatisIrsEMailGonder case final value?)
        'sevkiyat_SatisIrs_EMailGonder': value,
      if (instance.sevkiyatSatisIrsEMailGonderBaslik case final value?)
        'sevkiyat_SatisIrs_EMailGonder_Baslik': value,
      if (instance.sevkiyatSatisIrsEMailGonderDizayn case final value?)
        'sevkiyat_SatisIrs_EMailGonder_Dizayn': value,
      if (instance.sevkiyatSatisFatOtoPdfGor case final value?)
        'sevkiyat_SatisFat_OtoPdfGor': value,
      if (instance.sevkiyatSatisFatOzelKod1Degeri case final value?)
        'sevkiyat_SatisFat_OzelKod1Degeri': value,
      if (instance.sevkiyatSatisFatOzelKod2Degeri case final value?)
        'sevkiyat_SatisFat_OzelKod2Degeri': value,
      if (instance.sevkiyatSatisFatBildirim case final value?)
        'sevkiyat_SatisFat_Bildirim': value,
      if (instance.sevkiyatSatisFatEMailGonder case final value?)
        'sevkiyat_SatisFat_EMailGonder': value,
      if (instance.sevkiyatSatisFatEMailGonderBaslik case final value?)
        'sevkiyat_SatisFat_EMailGonder_Baslik': value,
      if (instance.sevkiyatSatisFatEMailGonderDizayn case final value?)
        'sevkiyat_SatisFat_EMailGonder_Dizayn': value,
      if (instance.sayimEkAlan1 case final value?) 'sayim_EkAlan1': value,
      if (instance.sayimEkAlan1Zorunlu case final value?)
        'sayim_EkAlan1_Zorunlu': value,
      if (instance.sayimEkAlan2 case final value?) 'sayim_EkAlan2': value,
      if (instance.sayimEkAlan2Zorunlu case final value?)
        'sayim_EkAlan2_Zorunlu': value,
      if (instance.sayimEkAlan3 case final value?) 'sayim_EkAlan3': value,
      if (instance.sayimEkAlan3Zorunlu case final value?)
        'sayim_EkAlan3_Zorunlu': value,
      if (instance.sayimEkAlan4 case final value?) 'sayim_EkAlan4': value,
      if (instance.sayimEkAlan4Zorunlu case final value?)
        'sayim_EkAlan4_Zorunlu': value,
      if (instance.sayimEkAlan5 case final value?) 'sayim_EkAlan5': value,
      if (instance.sayimEkAlan5Zorunlu case final value?)
        'sayim_EkAlan5_Zorunlu': value,
      if (instance.siparisMusSipEMailGonder case final value?)
        'siparis_MusSip_EMailGonder': value,
      if (instance.siparisMusSipEMailGonderBaslik case final value?)
        'siparis_MusSip_EMailGonder_Baslik': value,
      if (instance.siparisMusSipEMailGonderDizayn case final value?)
        'siparis_MusSip_EMailGonder_Dizayn': value,
      if (instance.siparisSaticiSipOtoPdfGor case final value?)
        'siparis_SaticiSip_OtoPdfGor': value,
      if (instance.siparisSatSipEMailGonder case final value?)
        'siparis_SatSip_EMailGonder': value,
      if (instance.siparisSatSipEMailGonderBaslik case final value?)
        'siparis_SatSip_EMailGonder_Baslik': value,
      if (instance.siparisSatSipEMailGonderDizayn case final value?)
        'siparis_SatSip_EMailGonder_Dizayn': value,
      if (instance.taltekStekBildirim case final value?)
        'taltek_STEK_Bildirim': value,
      if (instance.taltekStekEMailGonder case final value?)
        'taltek_STEK_EMailGonder': value,
      if (instance.taltekStekEMailGonderBaslik case final value?)
        'taltek_STEK_EMailGonder_Baslik': value,
      if (instance.taltekStekEMailGonderDizayn case final value?)
        'taltek_STEK_EMailGonder_Dizayn': value,
      if (instance.taltekAtalBildirim case final value?)
        'taltek_ATAL_Bildirim': value,
      if (instance.taltekAtalEMailGonder case final value?)
        'taltek_ATAL_EMailGonder': value,
      if (instance.taltekAtalEMailGonderBaslik case final value?)
        'taltek_ATAL_EMailGonder_Baslik': value,
      if (instance.taltekAtalEMailGonderDizayn case final value?)
        'taltek_ATAL_EMailGonder_Dizayn': value,
      if (instance.taltekStalBildirim case final value?)
        'taltek_STAL_Bildirim': value,
      if (instance.taltekStalEMailGonder case final value?)
        'taltek_STAL_EMailGonder': value,
      if (instance.taltekStalEMailGonderBaslik case final value?)
        'taltek_STAL_EMailGonder_Baslik': value,
      if (instance.taltekStalEMailGonderDizayn case final value?)
        'taltek_STAL_EMailGonder_Dizayn': value,
      if (instance.ebelgeEFatSatirdaIskDikkateAlma case final value?)
        'ebelge_EFat_SatirdaIskDikkateAlma': value,
      if (instance.ebelgeEArsivSatirdaIskDikkateAlma case final value?)
        'ebelge_EArsiv_SatirdaIskDikkateAlma': value,
      if (instance.transferAgOzelKod1Degeri case final value?)
        'transfer_AG_OzelKod1Degeri': value,
      if (instance.transferAgOzelKod2Degeri case final value?)
        'transfer_AG_OzelKod2Degeri': value,
      if (instance.transferAgVarsayilanMasrafKodu case final value?)
        'transfer_AG_VarsayilanMasrafKodu': value,
      if (instance.transferAcVarsayilanMasrafKodu case final value?)
        'transfer_AC_VarsayilanMasrafKodu': value,
      if (instance.transferAcOzelKod1Degeri case final value?)
        'transfer_AC_OzelKod1Degeri': value,
      if (instance.transferAcOzelKod2Degeri case final value?)
        'transfer_AC_OzelKod2Degeri': value,
      if (instance.malKabulAlisIrsOzelKod1Degeri case final value?)
        'malKabul_AlisIrs_OzelKod1Degeri': value,
      if (instance.malKabulAlisIrsOzelKod2Degeri case final value?)
        'malKabul_AlisIrs_OzelKod2Degeri': value,
      if (instance.sevkiyatSatisIrsOzelKod1Degeri case final value?)
        'sevkiyat_SatisIrs_OzelKod1Degeri': value,
      if (instance.sevkiyatSatisIrsOzelKod2Degeri case final value?)
        'sevkiyat_SatisIrs_OzelKod2Degeri': value,
      if (instance.siparisMusSipOzelKod2Degeri case final value?)
        'siparis_MusSip_OzelKod2Degeri': value,
      if (instance.taltekStekOzelKod1Degeri case final value?)
        'taltek_STEK_OzelKod1Degeri': value,
      if (instance.taltekStekOzelKod2Degeri case final value?)
        'taltek_STEK_OzelKod2Degeri': value,
      if (instance.taltekStalOzelKod1Degeri case final value?)
        'taltek_STAL_OzelKod1Degeri': value,
      if (instance.taltekStalOzelKod2Degeri case final value?)
        'taltek_STAL_OzelKod2Degeri': value,
      if (instance.sevkiyatSatisFatAciklamalarYetkiTuru case final value?)
        'sevkiyat_SatisFat_Aciklamalar_YetkiTuru': value,
      if (instance.taltekStalAciklamalarYetkiTuru case final value?)
        'taltek_STAL_Aciklamalar_YetkiTuru': value,
      if (instance.taltekStalAciklamaAlanlari case final value?)
        'taltek_STAL_AciklamaAlanlari': value,
      if (_$BarkodSayisiSaklanacakAlanEnumMap[
              instance.uretimUskBarkodSayisiSaklanacakAlan]
          case final value?)
        'uretim_USK_BarkodSayisiSaklanacakAlan': value,
      if (_$BarkodSayisiSaklanacakAlanEnumMap[
              instance.malKabulAlisIrsBarkodSayisiSaklanacakAlan]
          case final value?)
        'malKabul_AlisIrs_BarkodSayisiSaklanacakAlan': value,
      if (_$BarkodSayisiSaklanacakAlanEnumMap[
              instance.malKabulAlisFatBarkodSayisiSaklanacakAlan]
          case final value?)
        'malKabul_AlisFat_BarkodSayisiSaklanacakAlan': value,
      if (_$BarkodSayisiSaklanacakAlanEnumMap[
              instance.transferDatBarkodSayisiSaklanacakAlan]
          case final value?)
        'transfer_DAT_BarkodSayisiSaklanacakAlan': value,
      if (_$BarkodSayisiSaklanacakAlanEnumMap[
              instance.sevkiyatSatisIrsBarkodSayisiSaklanacakAlan]
          case final value?)
        'sevkiyat_SatisIrs_BarkodSayisiSaklanacakAlan': value,
      if (instance.sevkiyatSatisFatSipBagSipOkutulsunKalanMiktarGelsin
          case final value?)
        'sevkiyat_SatisFat_SipBag_SipOkutulsun_KalanMiktarGelsin': value,
      if (instance.transferAcVarsayilanHarTuru case final value?)
        'transfer_AC_VarsayilanHarTuru': value,
      if (instance.transferAcVarsayilanCikisYeri case final value?)
        'transfer_AC_VarsayilanCikisYeri': value,
      if (instance.transferDepoTalebiRehberdenStokSecilmesin case final value?)
        'transfer_DepoTalebi_RehberdenStokSecilmesin': value,
      if (instance.stokCariHarGizlenecekAlanlar case final value?)
        'stok_CariHar_GizlenecekAlanlar': value,
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
  BarkodSayisiSaklanacakAlan.miktar2: 'miktar2',
  BarkodSayisiSaklanacakAlan.e1: 'E1',
  BarkodSayisiSaklanacakAlan.e2: 'E2',
};

SevkemriMalKontrolTipi _$SevkemriMalKontrolTipiFromJson(
        Map<String, dynamic> json) =>
    SevkemriMalKontrolTipi()
      ..kod = (json['Kod'] as num?)?.toInt()
      ..tanim = json['Tanim'] as String?;

Map<String, dynamic> _$SevkemriMalKontrolTipiToJson(
        SevkemriMalKontrolTipi instance) =>
    <String, dynamic>{
      if (instance.kod case final value?) 'Kod': value,
      if (instance.tanim case final value?) 'Tanim': value,
    };
