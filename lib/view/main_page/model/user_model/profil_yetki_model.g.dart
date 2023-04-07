// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: implicit_dynamic_parameter

part of 'profil_yetki_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProfilYetkiModel _$ProfilYetkiModelFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'ProfilYetkiModel',
      json,
      ($checkedConvert) {
        final val = ProfilYetkiModel();
        $checkedConvert(
            'yazdirma_SatisIrs_Yazicilari',
            (v) => val.yazdirmaSatisIrsYazicilari =
                (v as List<dynamic>?)?.map((e) => e as String).toList());
        $checkedConvert(
            'yazdirma_Dizayn_SatisIrs',
            (v) => val.yazdirmaDizaynSatisIrs =
                (v as List<dynamic>?)?.map((e) => e as int).toList());
        $checkedConvert('yazdirma_SatisTalebi',
            (v) => val.yazdirmaSatisTalebi = v as bool?);
        $checkedConvert(
            'yazdirma_SatisTalebi_Yazicilari',
            (v) => val.yazdirmaSatisTalebiYazicilari =
                (v as List<dynamic>?)?.map((e) => e as String).toList());
        $checkedConvert(
            'yazdirma_Dizayn_SatisTalebi',
            (v) => val.yazdirmaDizaynSatisTalebi =
                (v as List<dynamic>?)?.map((e) => e as int).toList());
        $checkedConvert('yazdirma_SatisTeklifi',
            (v) => val.yazdirmaSatisTeklifi = v as bool?);
        $checkedConvert(
            'yazdirma_Dizayn_SatisTeklifi',
            (v) => val.yazdirmaDizaynSatisTeklifi =
                (v as List<dynamic>?)?.map((e) => e as int).toList());
        $checkedConvert(
            'yazdirma_Sayim', (v) => val.yazdirmaSayim = v as bool?);
        $checkedConvert(
            'yazdirma_Sayim_Yazicilari',
            (v) => val.yazdirmaSayimYazicilari =
                (v as List<dynamic>?)?.map((e) => e as String).toList());
        $checkedConvert(
            'yazdirma_Dizayn_Sayim',
            (v) => val.yazdirmaDizaynSayim =
                (v as List<dynamic>?)?.map((e) => e as int).toList());
        $checkedConvert('yazdirma_Sevkiyat_Etiketi',
            (v) => val.yazdirmaSevkiyatEtiketi = v as bool?);
        $checkedConvert(
            'yazdirma_Sevkiyat_Etiketi_Yazicilari',
            (v) => val.yazdirmaSevkiyatEtiketiYazicilari =
                (v as List<dynamic>?)?.map((e) => e as String).toList());
        $checkedConvert(
            'yazdirma_Dizayn_SevkiyatEtiketi',
            (v) => val.yazdirmaDizaynSevkiyatEtiketi =
                (v as List<dynamic>?)?.map((e) => e as int).toList());
        $checkedConvert('yazdirma_Sevkiyat_Etiketi_KopyaSayisiGizle',
            (v) => val.yazdirmaSevkiyatEtiketiKopyaSayisiGizle = v as bool?);
        $checkedConvert(
            'yazdirma_Serbest', (v) => val.yazdirmaSerbest = v as bool?);
        $checkedConvert('yazdirma_Serbest_Yazicilari',
            (v) => val.yazdirmaSerbestYazicilari = v as List<dynamic>?);
        $checkedConvert(
            'yazdirma_Dizayn_Serbest',
            (v) => val.yazdirmaDizaynSerbest =
                (v as List<dynamic>?)?.map((e) => e as int).toList());
        $checkedConvert('yazdirma_SeriEtiketi',
            (v) => val.yazdirmaSeriEtiketi = v as bool?);
        $checkedConvert(
            'yazdirma_Seri_Etiketi_Yazicilari',
            (v) => val.yazdirmaSeriEtiketiYazicilari =
                (v as List<dynamic>?)?.map((e) => e as String).toList());
        $checkedConvert(
            'yazdirma_Dizayn_SeriEtiketi',
            (v) => val.yazdirmaDizaynSeriEtiketi =
                (v as List<dynamic>?)?.map((e) => e as int).toList());
        $checkedConvert('yazdirma_Stok_Etiketi',
            (v) => val.yazdirmaStokEtiketi = v as bool?);
        $checkedConvert(
            'yazdirma_Stok_Etiketi_Yazicilari',
            (v) => val.yazdirmaStokEtiketiYazicilari =
                (v as List<dynamic>?)?.map((e) => e as String).toList());
        $checkedConvert(
            'yazdirma_Dizayn_StokEtiketi',
            (v) => val.yazdirmaDizaynStokEtiketi =
                (v as List<dynamic>?)?.map((e) => e as int).toList());
        $checkedConvert('yazdirma_TahsilatMakbuzu',
            (v) => val.yazdirmaTahsilatMakbuzu = v as bool?);
        $checkedConvert(
            'yazdirma_Dizayn_TahsilatMakbuzu',
            (v) => val.yazdirmaDizaynTahsilatMakbuzu =
                (v as List<dynamic>?)?.map((e) => e as int).toList());
        $checkedConvert('yazdirma_USK', (v) => val.yazdirmaUSK = v as bool?);
        $checkedConvert(
            'yazdirma_USK_Yazicilari',
            (v) => val.yazdirmaUSKYazicilari =
                (v as List<dynamic>?)?.map((e) => e as String).toList());
        $checkedConvert(
            'yazdirma_Dizayn_USK',
            (v) => val.yazdirmaDizaynUSK =
                (v as List<dynamic>?)?.map((e) => e as int).toList());
        $checkedConvert(
            'yazdirma_UretMalTop', (v) => val.yazdirmaUretMalTop = v as bool?);
        $checkedConvert('yazdirma_UretMalTop_Yazicilari',
            (v) => val.yazdirmaUretMalTopYazicilari = v as List<dynamic>?);
        $checkedConvert('yazdirma_Dizayn_UretMalTop',
            (v) => val.yazdirmaDizaynUretMalTop = v as List<dynamic>?);
        $checkedConvert(
            'kullanicilar',
            (v) => val.kullanicilar =
                (v as List<dynamic>?)?.map((e) => e as String).toList());
        $checkedConvert('sirket_TamEkranAcilsin',
            (v) => val.sirketTamEkranAcilsin = v as bool?);
        $checkedConvert('sirket_RehberdeCariKodGizle',
            (v) => val.sirketRehberdeCariKodGizle = v as bool?);
        $checkedConvert('sirket_RehberdeStokKodGizle',
            (v) => val.sirketRehberdeStokKodGizle = v as bool?);
        $checkedConvert('sirket_RaporlardaFiyatGizle',
            (v) => val.sirketRaporlardaFiyatGizle = v as bool?);
        $checkedConvert('sirket_TarihDegismesin',
            (v) => val.sirketTarihDegismesin = v as bool?);
        $checkedConvert('sirket_DevirSirketineGiris',
            (v) => val.sirketDevirSirketineGiris = v as String?);
        $checkedConvert(
            'sirket_KontrolluAktar_BelgeTipleri',
            (v) => val.sirketKontrolluAktarBelgeTipleri =
                (v as List<dynamic>?)?.map((e) => e as String).toList());
        $checkedConvert('sirket_KontrolluAktar_BelgeNoGoster',
            (v) => val.sirketKontrolluAktarBelgeNoGoster = v as List<dynamic>?);
        $checkedConvert(
            'sirket_KontrolAciklamasi_BelgeTipleri',
            (v) =>
                val.sirketKontrolAciklamasiBelgeTipleri = v as List<dynamic>?);
        $checkedConvert('sirket_TLFiyatGelsin_BelgeTipleri',
            (v) => val.sirketTLFiyatGelsinBelgeTipleri = v as List<dynamic>?);
        $checkedConvert(
            'sirket_KalemKayitKontrol_BelgeTipleri',
            (v) =>
                val.sirketKalemKayitKontrolBelgeTipleri = v as List<dynamic>?);
        $checkedConvert('sirket_aktifDepolar',
            (v) => val.sirketAktifDepolar = v as List<dynamic>?);
        $checkedConvert(
            'sirket_satisDepo', (v) => val.sirketSatisDepo = v as int?);
        $checkedConvert('sirket_satisDepo_Ozellestir',
            (v) => val.sirketSatisDepoOzellestir = v as bool?);
        $checkedConvert('sirket_satisDepo_MusSip',
            (v) => val.sirketSatisDepoMusSip = v as int?);
        $checkedConvert('sirket_satisDepo_SatisFat',
            (v) => val.sirketSatisDepoSatisFat = v as int?);
        $checkedConvert('sirket_satisDepo_SatisIrs',
            (v) => val.sirketSatisDepoSatisIrs = v as int?);
        $checkedConvert(
            'sirket_alisDepo', (v) => val.sirketAlisDepo = v as int?);
        $checkedConvert(
            'sirket_iadeDepo', (v) => val.sirketIadeDepo = v as int?);
        $checkedConvert(
            'sirket_projeKodu', (v) => val.sirketProjeKodu = v as String?);
        $checkedConvert(
            'sirket_aktifProjeler',
            (v) => val.sirketAktifProjeler =
                (v as List<dynamic>?)?.map((e) => e as String).toList());
        $checkedConvert('ayarlar_FirmaAyarlari',
            (v) => val.ayarlarFirmaAyarlari = v as bool?);
        $checkedConvert(
            'ayarlar_Oturumlar', (v) => val.ayarlarOturumlar = v as bool?);
        $checkedConvert('sirket_SifreHatirlamaDurumu',
            (v) => val.sirketSifreHatirlamaDurumu = v as String?);
        $checkedConvert(
            'genel_DovizKurlari', (v) => val.genelDovizKurlari = v as bool?);
        $checkedConvert('genel_DovizKurlari_Ekle',
            (v) => val.genelDovizKurlariEkle = v as bool?);
        $checkedConvert('genel_DovizKurlari_Duzelt',
            (v) => val.genelDovizKurlariDuzelt = v as bool?);
        $checkedConvert('genel_DovizKurlari_Sil',
            (v) => val.genelDovizKurlariSil = v as bool?);
        $checkedConvert(
            'genel_BelgeKontrol', (v) => val.genelBelgeKontrol = v as bool?);
        $checkedConvert('genel_BelgeKontrol_Ekle',
            (v) => val.genelBelgeKontrolEkle = v as bool?);
        $checkedConvert('genel_BelgeKontrol_Sil',
            (v) => val.genelBelgeKontrolSil = v as bool?);
        $checkedConvert(
            'genel_BelgeKontrol_BelgeTipleri',
            (v) => val.genelBelgeKontrolBelgeTipleri =
                (v as List<dynamic>?)?.map((e) => e as String).toList());
        $checkedConvert('genel_BelgeKontrol_BarkodOkutsun',
            (v) => val.genelBelgeKontrolBarkodOkutsun = v as String?);
        $checkedConvert('genel_BelgeKontrol_MiktarOtomatikGelsin',
            (v) => val.genelBelgeKontrolMiktarOtomatikGelsin = v as String?);
        $checkedConvert('genel_BelgeKontrol_KalemDetaySorulmasin',
            (v) => val.genelBelgeKontrolKalemDetaySorulmasin = v as String?);
        $checkedConvert('genel_BelgeKontrol_BelgeOnaySormasin',
            (v) => val.genelBelgeKontrolBelgeOnaySormasin = v as String?);
        $checkedConvert('malKabul_FiyatDegistirilmesin',
            (v) => val.malKabulFiyatDegistirilmesin = v as bool?);
        $checkedConvert(
            'malKabul_AlisIrs_BelgeTipleri',
            (v) => val.malKabulAlisIrsBelgeTipleri =
                (v as List<dynamic>?)?.map((e) => e as int).toList());
        $checkedConvert('malKabul_AlisIrs_GizlenecekAlanlar',
            (v) => val.malKabulAlisIrsGizlenecekAlanlar = v as List<dynamic>?);
        $checkedConvert(
            'malKabul_AlisIrs_AciklamaAlanlari',
            (v) => val.malKabulAlisIrsAciklamaAlanlari =
                (v as List<dynamic>?)?.map((e) => e as int).toList());
        $checkedConvert(
            'malKabul_SatinAlma', (v) => val.malKabulSatinAlma = v as bool?);
        $checkedConvert('malKabul_SatinAlma_Kaydet',
            (v) => val.malKabulSatinAlmaKaydet = v as bool?);
        $checkedConvert('malKabul_SatinAlma_Duzelt',
            (v) => val.malKabulSatinAlmaDuzelt = v as bool?);
        $checkedConvert('malKabul_SatinAlma_Sil',
            (v) => val.malKabulSatinAlmaSil = v as bool?);
        $checkedConvert('malKabul_AlisIrsaliyesiFiyatGor',
            (v) => val.malKabulAlisIrsaliyesiFiyatGor = v as bool?);
        $checkedConvert('malKabul_AlisIrs_DigerSekmesiGoster',
            (v) => val.malKabulAlisIrsDigerSekmesiGoster = v as bool?);
        $checkedConvert('malKabul_AlisIrs_SipBagSecenegi',
            (v) => val.malKabulAlisIrsSipBagSecenegi = v as String?);
        $checkedConvert('malKabul_AlisIrs_ReferansStokUygulamasi',
            (v) => val.malKabulAlisIrsReferansStokUygulamasi = v as bool?);
        $checkedConvert(
            'malKabul_AlisIrs_SipBag_SipHariciKalemEklenebilir',
            (v) => val.malKabulAlisIrsSipBagSipHariciKalemEklenebilir =
                v as bool?);
        $checkedConvert(
            'malKabul_AlisIrs_SipBag_FazlaTeslimatYapilabilir',
            (v) =>
                val.malKabulAlisIrsSipBagFazlaTeslimatYapilabilir = v as bool?);
        $checkedConvert('malKabul_AlisIrs_SipBag_SipOkutulsun',
            (v) => val.malKabulAlisIrsSipBagSipOkutulsun = v as bool?);
        $checkedConvert('malKabul_AlisIrs_SipBag_CokluSecim',
            (v) => val.malKabulAlisIrsSipBagCokluSecim = v as bool?);
        $checkedConvert('malKabul_AlisIrs_SipBag_TumKalemlerSecilsin',
            (v) => val.malKabulAlisIrsSipBagTumKalemlerSecilsin = v as bool?);
        $checkedConvert('malKabul_AlisIrs_SipBag_EslesmeDurumu',
            (v) => val.malKabulAlisIrsSipBagEslesmeDurumu = v as int?);
        $checkedConvert('malKabul_AlisIrs_BarkodluGiris',
            (v) => val.malKabulAlisIrsBarkodluGiris = v as bool?);
        $checkedConvert('malKabul_AlisIrs_MiktarOtomatikGelsin',
            (v) => val.malKabulAlisIrsMiktarOtomatikGelsin = v as bool?);
        $checkedConvert('malKabul_AlisIrs_KalemDetaySorulmasin',
            (v) => val.malKabulAlisIrsKalemDetaySorulmasin = v as bool?);
        $checkedConvert('malKabul_AlisIrs_KalemlerBirlestirilsin',
            (v) => val.malKabulAlisIrsKalemlerBirlestirilsin = v as bool?);
        $checkedConvert('malKabul_AlisIrs_StokRehberiAcilmasin',
            (v) => val.malKabulAlisIrsStokRehberiAcilmasin = v as bool?);
        $checkedConvert('malKabul_AlisIrs_KalemDuzeltilemesin',
            (v) => val.malKabulAlisIrsKalemDuzeltilemesin = v as bool?);
        $checkedConvert('malKabul_AlisIrs_TekrarEdenBarkod',
            (v) => val.malKabulAlisIrsTekrarEdenBarkod = v as String?);
        $checkedConvert('malKabul_AlisIrs_KlavyeEngelle',
            (v) => val.malKabulAlisIrsKlavyeEngelle = v as bool?);
        $checkedConvert('malKabul_AlisIrs_Miktar1Gelsin',
            (v) => val.malKabulAlisIrsMiktar1Gelsin = v as bool?);
        $checkedConvert('malKabul_AlisIrs_Raporlar',
            (v) => val.malKabulAlisIrsRaporlar = v as bool?);
        $checkedConvert('malKabul_AlisIrs_KalemRaporu',
            (v) => val.malKabulAlisIrsKalemRaporu = v as bool?);
        $checkedConvert('malKabul_AlisIrs_OtoBasimYap',
            (v) => val.malKabulAlisIrsOtoBasimYap = v as bool?);
        $checkedConvert('malKabul_AlisIrs_KacGunlukKayitlarListelensin',
            (v) => val.malKabulAlisIrsKacGunlukKayitlarListelensin = v as int?);
        $checkedConvert('malKabul_AlisIrs_FiyatSirasi',
            (v) => val.malKabulAlisIrsFiyatSirasi = v as int?);
        $checkedConvert('malKabul_AlisIrs_Birim1denKaydet',
            (v) => val.malKabulAlisIrsBirim1denKaydet = v as bool?);
        $checkedConvert('malKabul_AlisIrs_CariKoduDegistir',
            (v) => val.malKabulAlisIrsCariKoduDegistir = v as bool?);
        $checkedConvert('malKabul_AlisIrs_CariRehPlaEslesmesin',
            (v) => val.malKabulAlisIrsCariRehPlaEslesmesin = v as bool?);
        $checkedConvert('malKabul_Iade', (v) => val.malKabulIade = v as bool?);
        $checkedConvert(
            'malKabul_Iade_Kaydet', (v) => val.malKabulIadeKaydet = v as bool?);
        $checkedConvert(
            'malKabul_Iade_Duzelt', (v) => val.malKabulIadeDuzelt = v as bool?);
        $checkedConvert(
            'malKabul_Iade_Sil', (v) => val.malKabulIadeSil = v as bool?);
        $checkedConvert(
            'malKabul_AlisFaturasi_BelgeTipleri',
            (v) => val.malKabulAlisFaturasiBelgeTipleri =
                (v as List<dynamic>?)?.map((e) => e as int).toList());
        $checkedConvert('malKabul_AlisFaturasi',
            (v) => val.malKabulAlisFaturasi = v as bool?);
        $checkedConvert('malKabul_AlisFaturasi_Kaydet',
            (v) => val.malKabulAlisFaturasiKaydet = v as bool?);
        $checkedConvert('malKabul_AlisFaturasi_Duzelt',
            (v) => val.malKabulAlisFaturasiDuzelt = v as bool?);
        $checkedConvert('malKabul_AlisFaturasi_Sil',
            (v) => val.malKabulAlisFaturasiSil = v as bool?);
        $checkedConvert('malKabul_AlisFat_DigerSekmesiGoster',
            (v) => val.malKabulAlisFatDigerSekmesiGoster = v as bool?);
        $checkedConvert('malKabul_AlisFat_KacGunlukKayitlarListelensin',
            (v) => val.malKabulAlisFatKacGunlukKayitlarListelensin = v as int?);
        $checkedConvert('malKabul_AlisFat_FiyatSirasi',
            (v) => val.malKabulAlisFatFiyatSirasi = v as int?);
        $checkedConvert('malKabul_AlisFat_Birim1denKaydet',
            (v) => val.malKabulAlisFatBirim1denKaydet = v as bool?);
        $checkedConvert('malKabul_AlisFat_Aciklamalar_YetkiTuru',
            (v) => val.malKabulAlisFatAciklamalarYetkiTuru = v as String?);
        $checkedConvert(
            'malKabul_AlisFat_AciklamaAlanlari',
            (v) => val.malKabulAlisFatAciklamaAlanlari =
                (v as List<dynamic>?)?.map((e) => e as int).toList());
        $checkedConvert('malKabul_AlisFat_CariKoduDegistir',
            (v) => val.malKabulAlisFatCariKoduDegistir = v as bool?);
        $checkedConvert('malKabul_AlisFat_BarkodluGiris',
            (v) => val.malKabulAlisFatBarkodluGiris = v as bool?);
        $checkedConvert('malKabul_AlisFat_MiktarOtomatikGelsin',
            (v) => val.malKabulAlisFatMiktarOtomatikGelsin = v as bool?);
        $checkedConvert('malKabul_AlisFat_KalemDetaySorulmasin',
            (v) => val.malKabulAlisFatKalemDetaySorulmasin = v as bool?);
        $checkedConvert('malKabul_AlisFat_StokRehberiAcilmasin',
            (v) => val.malKabulAlisFatStokRehberiAcilmasin = v as bool?);
        $checkedConvert('malKabul_AlisFat_KalemDuzeltilemesin',
            (v) => val.malKabulAlisFatKalemDuzeltilemesin = v as bool?);
        $checkedConvert('malKabul_AlisFat_KlavyeEngelle',
            (v) => val.malKabulAlisFatKlavyeEngelle = v as bool?);
        $checkedConvert('malKabul_AlisFat_Miktar1Gelsin',
            (v) => val.malKabulAlisFatMiktar1Gelsin = v as bool?);
        $checkedConvert('malKabul_AlisFat_ReferansStokUygulamasi',
            (v) => val.malKabulAlisFatReferansStokUygulamasi = v as bool?);
        $checkedConvert(
            'malKabul_AlisFat_SipBag_SipHariciKalemEklenebilir',
            (v) => val.malKabulAlisFatSipBagSipHariciKalemEklenebilir =
                v as bool?);
        $checkedConvert(
            'malKabul_AlisFat_SipBag_FazlaTeslimatYapilabilir',
            (v) =>
                val.malKabulAlisFatSipBagFazlaTeslimatYapilabilir = v as bool?);
        $checkedConvert('malKabul_AlisFat_SipBag_SipOkutulsun',
            (v) => val.malKabulAlisFatSipBagSipOkutulsun = v as bool?);
        $checkedConvert('malKabul_AlisFat_SipBag_CokluSecim',
            (v) => val.malKabulAlisFatSipBagCokluSecim = v as bool?);
        $checkedConvert('malKabul_AlisFat_SipBag_TumKalemlerSecilsin',
            (v) => val.malKabulAlisFatSipBagTumKalemlerSecilsin = v as bool?);
        $checkedConvert('malKabul_AlisFat_SipBag_EslesmeDurumu',
            (v) => val.malKabulAlisFatSipBagEslesmeDurumu = v as int?);
        $checkedConvert('malKabul_AlisFat_Raporlar',
            (v) => val.malKabulAlisFatRaporlar = v as bool?);
        $checkedConvert('malKabul_AlisFat_KalemRaporu',
            (v) => val.malKabulAlisFatKalemRaporu = v as bool?);
        $checkedConvert(
            'malKabul_Mustahsil', (v) => val.malKabulMustahsil = v as bool?);
        $checkedConvert('malKabul_Mustahsil_Ekle',
            (v) => val.malKabulMustahsilEkle = v as bool?);
        $checkedConvert('malKabul_Mustahsil_Duzelt',
            (v) => val.malKabulMustahsilDuzelt = v as bool?);
        $checkedConvert('malKabul_Mustahsil_Sil',
            (v) => val.malKabulMustahsilSil = v as bool?);
        $checkedConvert('transfer_DAT', (v) => val.transferDAT = v as bool?);
        $checkedConvert(
            'transfer_DAT_Kaydet', (v) => val.transferDATKaydet = v as bool?);
        $checkedConvert(
            'transfer_DAT_Duzelt', (v) => val.transferDATDuzelt = v as bool?);
        $checkedConvert(
            'transfer_DAT_Sil', (v) => val.transferDATSil = v as bool?);
        $checkedConvert('transfer_DAT_FiyatGor',
            (v) => val.transferDATFiyatGor = v as bool?);
        $checkedConvert('transfer_DAT_OtoEtiketBas',
            (v) => val.transferDATOtoEtiketBas = v as bool?);
        $checkedConvert('transfer_DAT_VarsayilanCikisDepo',
            (v) => val.transferDATVarsayilanCikisDepo = v as int?);
        $checkedConvert('transfer_DAT_VarsayilanGirisDepo',
            (v) => val.transferDATVarsayilanGirisDepo = v as int?);
        $checkedConvert('transfer_DAT_eIrsIsaretleyemesin',
            (v) => val.transferDATEIrsIsaretleyemesin = v as bool?);
        $checkedConvert('transfer_DAT_DigerSekmesiGoster',
            (v) => val.transferDATDigerSekmesiGoster = v as bool?);
        $checkedConvert('transfer_DAT_BarkodluGiris',
            (v) => val.transferDATBarkodluGiris = v as bool?);
        $checkedConvert('transfer_DAT_MiktarOtomatikGelsin',
            (v) => val.transferDATMiktarOtomatikGelsin = v as bool?);
        $checkedConvert('transfer_DAT_KalemDetaySorulmasin',
            (v) => val.transferDATKalemDetaySorulmasin = v as bool?);
        $checkedConvert('transfer_DAT_StokRehberiAcilmasin',
            (v) => val.transferDATStokRehberiAcilmasin = v as bool?);
        $checkedConvert('transfer_DAT_KalemDuzeltilemesin',
            (v) => val.transferDATKalemDuzeltilemesin = v as bool?);
        $checkedConvert('transfer_DAT_KlavyeEngelle',
            (v) => val.transferDATKlavyeEngelle = v as bool?);
        $checkedConvert('transfer_DAT_Miktar1Gelsin',
            (v) => val.transferDATMiktar1Gelsin = v as bool?);
        $checkedConvert('transfer_DAT_KalemlerBirlestirilsin',
            (v) => val.transferDATKalemlerBirlestirilsin = v as bool?);
        $checkedConvert('transfer_DAT_KacGunlukKayitlarListelensin',
            (v) => val.transferDATKacGunlukKayitlarListelensin = v as int?);
        $checkedConvert('transfer_DAT_OnayIslemleri',
            (v) => val.transferDATOnayIslemleri = v as bool?);
        $checkedConvert('transfer_DAT_OnayIslemleri_Depolar',
            (v) => val.transferDATOnayIslemleriDepolar = v as List<dynamic>?);
        $checkedConvert('transfer_DAT_EkAlan2Hatirla',
            (v) => val.transferDATEkAlan2Hatirla = v as bool?);
        $checkedConvert('transfer_DAT_EkAlan2Tablodan',
            (v) => val.transferDATEkAlan2Tablodan = v as bool?);
        $checkedConvert('transfer_DAT_LokalDATSeciliGelmesin',
            (v) => val.transferDATLokalDATSeciliGelmesin = v as bool?);
        $checkedConvert('transfer_DAT_SeriGirisHarYapabilsin',
            (v) => val.transferDATSeriGirisHarYapabilsin = v as bool?);
        $checkedConvert('transfer_DAT_Birim1denKaydet',
            (v) => val.transferDATBirim1denKaydet = v as bool?);
        $checkedConvert('transfer_DAT_Barkod2Sor',
            (v) => val.transferDATBarkod2Sor = v as bool?);
        $checkedConvert('transfer_DAT_BosGecilmeyecekAlanlar',
            (v) => val.transferDATBosGecilmeyecekAlanlar = v as List<dynamic>?);
        $checkedConvert('transfer_DAT_GizlenecekAlanlar',
            (v) => val.transferDATGizlenecekAlanlar = v as List<dynamic>?);
        $checkedConvert('transfer_DAT_DegismeyecekAlanlar',
            (v) => val.transferDATDegismeyecekAlanlar = v as List<dynamic>?);
        $checkedConvert('transfer_DAT_AciklamaAlanlari',
            (v) => val.transferDATAciklamaAlanlari = v as List<dynamic>?);
        $checkedConvert('transfer_DAT_SipBagSecenegi',
            (v) => val.transferDATSipBagSecenegi = v as String?);
        $checkedConvert('transfer_DAT_ReferansStokUygulamasi',
            (v) => val.transferDATReferansStokUygulamasi = v as bool?);
        $checkedConvert('transfer_DAT_SipBag_SipHariciKalemEklenebilir',
            (v) => val.transferDATSipBagSipHariciKalemEklenebilir = v as bool?);
        $checkedConvert('transfer_DAT_SipBag_FazlaTeslimatYapilabilir',
            (v) => val.transferDATSipBagFazlaTeslimatYapilabilir = v as bool?);
        $checkedConvert('transfer_DAT_SipBag_SipOkutulsun',
            (v) => val.transferDATSipBagSipOkutulsun = v as bool?);
        $checkedConvert('transfer_DAT_SipBag_SipOkutulsun_Miktar2BazAl',
            (v) => val.transferDATSipBagSipOkutulsunMiktar2BazAl = v as bool?);
        $checkedConvert(
            'transfer_DAT_SipBag_SipOkutulsun_KalanMiktarGelsin',
            (v) => val.transferDATSipBagSipOkutulsunKalanMiktarGelsin =
                v as String?);
        $checkedConvert('transfer_DAT_SipBag_CokluSecim',
            (v) => val.transferDATSipBagCokluSecim = v as bool?);
        $checkedConvert('transfer_DAT_SipBag_TumKalemlerSecilsin',
            (v) => val.transferDATSipBagTumKalemlerSecilsin = v as bool?);
        $checkedConvert('transfer_DAT_SipBag_EslesmeDurumu',
            (v) => val.transferDATSipBagEslesmeDurumu = v as int?);
        $checkedConvert('transfer_DAT_SipBag_MalToplananlarGelsin',
            (v) => val.transferDATSipBagMalToplananlarGelsin = v as bool?);
        $checkedConvert(
            'transfer_DAT_SipBag_SevkOnayliSiparislerGelsin',
            (v) =>
                val.transferDATSipBagSevkOnayliSiparislerGelsin = v as bool?);
        $checkedConvert('transfer_AG', (v) => val.transferAG = v as bool?);
        $checkedConvert(
            'transfer_AG_Kaydet', (v) => val.transferAGKaydet = v as bool?);
        $checkedConvert(
            'transfer_AG_Duzelt', (v) => val.transferAGDuzelt = v as bool?);
        $checkedConvert(
            'transfer_AG_Sil', (v) => val.transferAGSil = v as bool?);
        $checkedConvert(
            'transfer_AG_FiyatGor', (v) => val.transferAGFiyatGor = v as bool?);
        $checkedConvert('transfer_AG_KacGunlukKayitlarListelensin',
            (v) => val.transferAGKacGunlukKayitlarListelensin = v as int?);
        $checkedConvert('transfer_AG_VarsayilanDepo',
            (v) => val.transferAGVarsayilanDepo = v as int?);
        $checkedConvert('transfer_AG_DigerSekmesiGoster',
            (v) => val.transferAGDigerSekmesiGoster = v as bool?);
        $checkedConvert('transfer_AG_BelgeKopyala',
            (v) => val.transferAGBelgeKopyala = v as bool?);
        $checkedConvert('transfer_AG_Birim1denKaydet',
            (v) => val.transferAGBirim1denKaydet = v as bool?);
        $checkedConvert('transfer_AG_OtoBasimYap',
            (v) => val.transferAGOtoBasimYap = v as bool?);
        $checkedConvert('transfer_AG_SeriGirisHarYapabilsin',
            (v) => val.transferAGSeriGirisHarYapabilsin = v as bool?);
        $checkedConvert('transfer_AG_BarkodluGiris',
            (v) => val.transferAGBarkodluGiris = v as bool?);
        $checkedConvert('transfer_AG_MiktarOtomatikGelsin',
            (v) => val.transferAGMiktarOtomatikGelsin = v as bool?);
        $checkedConvert('transfer_AG_KalemDetaySorulmasin',
            (v) => val.transferAGKalemDetaySorulmasin = v as bool?);
        $checkedConvert('transfer_AG_StokRehberiAcilmasin',
            (v) => val.transferAGStokRehberiAcilmasin = v as bool?);
        $checkedConvert('transfer_AG_KalemDuzeltilemesin',
            (v) => val.transferAGKalemDuzeltilemesin = v as bool?);
        $checkedConvert('transfer_AG_KlavyeEngelle',
            (v) => val.transferAGKlavyeEngelle = v as bool?);
        $checkedConvert('transfer_AG_Miktar1Gelsin',
            (v) => val.transferAGMiktar1Gelsin = v as bool?);
        $checkedConvert('transfer_AG_ReferansStokUygulamasi',
            (v) => val.transferAGReferansStokUygulamasi = v as bool?);
        $checkedConvert('transfer_AG_SipBag_SipHariciKalemEklenebilir',
            (v) => val.transferAGSipBagSipHariciKalemEklenebilir = v as bool?);
        $checkedConvert('transfer_AG_SipBag_FazlaTeslimatYapilabilir',
            (v) => val.transferAGSipBagFazlaTeslimatYapilabilir = v as bool?);
        $checkedConvert('transfer_AG_SipBag_SipOkutulsun',
            (v) => val.transferAGSipBagSipOkutulsun = v as bool?);
        $checkedConvert('transfer_AG_SipBag_SipOkutulsun_Miktar2BazAl',
            (v) => val.transferAGSipBagSipOkutulsunMiktar2BazAl = v as bool?);
        $checkedConvert('transfer_AG_SipBag_CokluSecim',
            (v) => val.transferAGSipBagCokluSecim = v as bool?);
        $checkedConvert('transfer_AG_SipBag_TumKalemlerSecilsin',
            (v) => val.transferAGSipBagTumKalemlerSecilsin = v as bool?);
        $checkedConvert('transfer_AG_SipBag_EslesmeDurumu',
            (v) => val.transferAGSipBagEslesmeDurumu = v as int?);
        $checkedConvert('transfer_AG_SipBag_MalToplananlarGelsin',
            (v) => val.transferAGSipBagMalToplananlarGelsin = v as bool?);
        $checkedConvert('transfer_AG_SipBag_SevkOnayliSiparislerGelsin',
            (v) => val.transferAGSipBagSevkOnayliSiparislerGelsin = v as bool?);
        $checkedConvert('transfer_AC', (v) => val.transferAC = v as bool?);
        $checkedConvert(
            'transfer_AC_Kaydet', (v) => val.transferACKaydet = v as bool?);
        $checkedConvert(
            'transfer_AC_Duzelt', (v) => val.transferACDuzelt = v as bool?);
        $checkedConvert(
            'transfer_AC_Sil', (v) => val.transferACSil = v as bool?);
        $checkedConvert(
            'transfer_AC_FiyatGor', (v) => val.transferACFiyatGor = v as bool?);
        $checkedConvert('transfer_AC_KacGunlukKayitlarListelensin',
            (v) => val.transferACKacGunlukKayitlarListelensin = v as int?);
        $checkedConvert('transfer_AC_VarsayilanDepo',
            (v) => val.transferACVarsayilanDepo = v as int?);
        $checkedConvert('transfer_AC_eIrsIsaretleyemesin',
            (v) => val.transferACEIrsIsaretleyemesin = v as bool?);
        $checkedConvert('transfer_AC_DigerSekmesiGoster',
            (v) => val.transferACDigerSekmesiGoster = v as bool?);
        $checkedConvert('transfer_AC_BelgeKopyala',
            (v) => val.transferACBelgeKopyala = v as bool?);
        $checkedConvert('transfer_AC_Birim1denKaydet',
            (v) => val.transferACBirim1denKaydet = v as bool?);
        $checkedConvert('transfer_AC_OtoBasimYap',
            (v) => val.transferACOtoBasimYap = v as bool?);
        $checkedConvert('transfer_AC_SeriGirisHarYapabilsin',
            (v) => val.transferACSeriGirisHarYapabilsin = v as bool?);
        $checkedConvert('transfer_AC_EkAlan2Tablodan',
            (v) => val.transferACEkAlan2Tablodan = v as bool?);
        $checkedConvert('transfer_AC_EkAlan2Hatirla',
            (v) => val.transferACEkAlan2Hatirla = v as bool?);
        $checkedConvert('transfer_AC_MinStokMikGoster',
            (v) => val.transferACMinStokMikGoster = v as String?);
        $checkedConvert('transfer_AC_BosGecilmeyecekAlanlar',
            (v) => val.transferACBosGecilmeyecekAlanlar = v as List<dynamic>?);
        $checkedConvert('transfer_AC_BarkodluGiris',
            (v) => val.transferACBarkodluGiris = v as bool?);
        $checkedConvert('transfer_AC_MiktarOtomatikGelsin',
            (v) => val.transferACMiktarOtomatikGelsin = v as bool?);
        $checkedConvert('transfer_AC_KalemDetaySorulmasin',
            (v) => val.transferACKalemDetaySorulmasin = v as bool?);
        $checkedConvert('transfer_AC_StokRehberiAcilmasin',
            (v) => val.transferACStokRehberiAcilmasin = v as bool?);
        $checkedConvert('transfer_AC_KalemDuzeltilemesin',
            (v) => val.transferACKalemDuzeltilemesin = v as bool?);
        $checkedConvert('transfer_AC_KlavyeEngelle',
            (v) => val.transferACKlavyeEngelle = v as bool?);
        $checkedConvert('transfer_AC_Miktar1Gelsin',
            (v) => val.transferACMiktar1Gelsin = v as bool?);
        $checkedConvert('transfer_AC_ReferansStokUygulamasi',
            (v) => val.transferACReferansStokUygulamasi = v as bool?);
        $checkedConvert('transfer_AC_SipBag_SipHariciKalemEklenebilir',
            (v) => val.transferACSipBagSipHariciKalemEklenebilir = v as bool?);
        $checkedConvert('transfer_AC_SipBag_FazlaTeslimatYapilabilir',
            (v) => val.transferACSipBagFazlaTeslimatYapilabilir = v as bool?);
        $checkedConvert('transfer_AC_SipBag_SipOkutulsun',
            (v) => val.transferACSipBagSipOkutulsun = v as bool?);
        $checkedConvert('transfer_AC_SipBag_SipOkutulsun_Miktar2BazAl',
            (v) => val.transferACSipBagSipOkutulsunMiktar2BazAl = v as bool?);
        $checkedConvert('transfer_AC_SipBag_CokluSecim',
            (v) => val.transferACSipBagCokluSecim = v as bool?);
        $checkedConvert('transfer_AC_SipBag_TumKalemlerSecilsin',
            (v) => val.transferACSipBagTumKalemlerSecilsin = v as bool?);
        $checkedConvert('transfer_AC_SipBag_EslesmeDurumu',
            (v) => val.transferACSipBagEslesmeDurumu = v as int?);
        $checkedConvert('transfer_AC_SipBag_MalToplananlarGelsin',
            (v) => val.transferACSipBagMalToplananlarGelsin = v as bool?);
        $checkedConvert('transfer_AC_SipBag_SevkOnayliSiparislerGelsin',
            (v) => val.transferACSipBagSevkOnayliSiparislerGelsin = v as bool?);
        $checkedConvert(
            'transfer_DepoTalebi', (v) => val.transferDepoTalebi = v as bool?);
        $checkedConvert('transfer_DepoTalebi_Sil',
            (v) => val.transferDepoTalebiSil = v as bool?);
        $checkedConvert('transfer_DepoTalebi_MalTop',
            (v) => val.transferDepoTalebiMalTop = v as bool?);
        $checkedConvert('transfer_DepoTalebi_MalTop_FazlaTeslimat',
            (v) => val.transferDepoTalebiMalTopFazlaTeslimat = v as String?);
        $checkedConvert('hucre_GiristeHucreYerlestir',
            (v) => val.hucreGiristeHucreYerlestir = v as bool?);
        $checkedConvert('hucre_CikistaHucreYerlestir',
            (v) => val.hucreCikistaHucreYerlestir = v as bool?);
        $checkedConvert(
            'hucre_Yerlestir', (v) => val.hucreYerlestir = v as bool?);
        $checkedConvert('hucre_YerlestirBelgesiz',
            (v) => val.hucreYerlestirBelgesiz = v as bool?);
        $checkedConvert('hucre_Yerlestir_KlavyeEngelle',
            (v) => val.hucreYerlestirKlavyeEngelle = v as bool?);
        $checkedConvert('hucre_Yerlestir_RehberdenStokSecilmesin',
            (v) => val.hucreYerlestirRehberdenStokSecilmesin = v as bool?);
        $checkedConvert('hucre_Yerlestir_HangiHucrede',
            (v) => val.hucreYerlestirHangiHucrede = v as bool?);
        $checkedConvert(
            'hucre_Yerlestir_BelgeTipleri',
            (v) => val.hucreYerlestirBelgeTipleri =
                (v as List<dynamic>?)?.map((e) => e as String).toList());
        $checkedConvert('hucre_Bosalt', (v) => val.hucreBosalt = v as bool?);
        $checkedConvert('hucre_BosaltBelgesiz',
            (v) => val.hucreBosaltBelgesiz = v as bool?);
        $checkedConvert('hucre_Bosalt_KlavyeEngelle',
            (v) => val.hucreBosaltKlavyeEngelle = v as bool?);
        $checkedConvert('hucre_Bosalt_RehberdenStokSecilmesin',
            (v) => val.hucreBosaltRehberdenStokSecilmesin = v as bool?);
        $checkedConvert('hucre_Bosalt_HangiHucrede',
            (v) => val.hucreBosaltHangiHucrede = v as bool?);
        $checkedConvert(
            'hucre_Bosalt_BelgeTipleri',
            (v) => val.hucreBosaltBelgeTipleri =
                (v as List<dynamic>?)?.map((e) => e as String).toList());
        $checkedConvert('hucre_Arama', (v) => val.hucreArama = v as bool?);
        $checkedConvert('hucre_AramaTumDepolar',
            (v) => val.hucreAramaTumDepolar = v as bool?);
        $checkedConvert('hucre_AramaOzelFonksiyon',
            (v) => val.hucreAramaOzelFonksiyon = v as String?);
        $checkedConvert(
            'hucre_Transfer', (v) => val.hucreTransfer = v as bool?);
        $checkedConvert('hucre_Transfer_KlavyeEngelle',
            (v) => val.hucreTransferKlavyeEngelle = v as bool?);
        $checkedConvert('hucre_Transfer_RehberdenStokSecilmesin',
            (v) => val.hucreTransferRehberdenStokSecilmesin = v as bool?);
        $checkedConvert(
            'hucre_Transfer_BelgeTipleri',
            (v) => val.hucreTransferBelgeTipleri =
                (v as List<dynamic>?)?.map((e) => e as String).toList());
        $checkedConvert('hucre_Listesi', (v) => val.hucreListesi = v as bool?);
        $checkedConvert('hucre_Bosalt_OtomatikStokEtiketiYazdir',
            (v) => val.hucreBosaltOtomatikStokEtiketiYazdir = v as bool?);
        $checkedConvert(
            'hucre_BakiyeDurumu', (v) => val.hucreBakiyeDurumu = v as bool?);
        $checkedConvert(
            'hucre_Hareketleri', (v) => val.hucreHareketleri = v as bool?);
        $checkedConvert('hucre_Hareketleri_Sil',
            (v) => val.hucreHareketleriSil = v as bool?);
        $checkedConvert(
            'sevkiyat_SatisIrsaliyesi_BelgeTipleri',
            (v) =>
                val.sevkiyatSatisIrsaliyesiBelgeTipleri = v as List<dynamic>?);
        $checkedConvert(
            'sevkiyat_SatisIrsaliyesi_GizlenecekAlanlar',
            (v) => val.sevkiyatSatisIrsaliyesiGizlenecekAlanlar =
                v as List<dynamic>?);
        $checkedConvert(
            'sevkiyat_SatisIrsaliyesi_DegismeyecekAlanlar',
            (v) => val.sevkiyatSatisIrsaliyesiDegismeyecekAlanlar =
                v as List<dynamic>?);
        $checkedConvert('sevkiyat_SatisIrsaliyesi',
            (v) => val.sevkiyatSatisIrsaliyesi = v as bool?);
        $checkedConvert('sevkiyat_SatisIrsaliyesiKayit',
            (v) => val.sevkiyatSatisIrsaliyesiKayit = v as bool?);
        $checkedConvert('sevkiyat_SatisIrsaliyesiDuzeltme',
            (v) => val.sevkiyatSatisIrsaliyesiDuzeltme = v as bool?);
        $checkedConvert('sevkiyat_SatisIrsaliyesiSilme',
            (v) => val.sevkiyatSatisIrsaliyesiSilme = v as bool?);
        $checkedConvert('sevkiyat_SatisIrsaliyesiFiyatGor',
            (v) => val.sevkiyatSatisIrsaliyesiFiyatGor = v as bool?);
        $checkedConvert('sevkiyat_SatisIrs_DigerSekmesiGoster',
            (v) => val.sevkiyatSatisIrsDigerSekmesiGoster = v as bool?);
        $checkedConvert('sevkiyat_SatisIrsaliyesi_SipBagSecenegi',
            (v) => val.sevkiyatSatisIrsaliyesiSipBagSecenegi = v as String?);
        $checkedConvert('sevkiyat_SatisIrs_ReferansStokUygulamasi',
            (v) => val.sevkiyatSatisIrsReferansStokUygulamasi = v as bool?);
        $checkedConvert(
            'sevkiyat_SatisIrs_SipBag_SipHariciKalemEklenebilir',
            (v) => val.sevkiyatSatisIrsSipBagSipHariciKalemEklenebilir =
                v as bool?);
        $checkedConvert(
            'sevkiyat_SatisIrs_SipBag_FazlaTeslimatYapilabilir',
            (v) => val.sevkiyatSatisIrsSipBagFazlaTeslimatYapilabilir =
                v as bool?);
        $checkedConvert('sevkiyat_SatisIrs_SipBag_SipOkutulsun',
            (v) => val.sevkiyatSatisIrsSipBagSipOkutulsun = v as bool?);
        $checkedConvert(
            'sevkiyat_SatisIrs_SipBag_SipOkutulsun_Miktar2BazAl',
            (v) => val.sevkiyatSatisIrsSipBagSipOkutulsunMiktar2BazAl =
                v as bool?);
        $checkedConvert(
            'sevkiyat_SatisIrs_SipBag_SipOkutulsun_KalanMiktarGelsin',
            (v) => val.sevkiyatSatisIrsSipBagSipOkutulsunKalanMiktarGelsin =
                v as String?);
        $checkedConvert('sevkiyat_SatisIrs_SipBag_CokluSecim',
            (v) => val.sevkiyatSatisIrsSipBagCokluSecim = v as bool?);
        $checkedConvert('sevkiyat_SatisIrs_SipBag_TumKalemlerSecilsin',
            (v) => val.sevkiyatSatisIrsSipBagTumKalemlerSecilsin = v as bool?);
        $checkedConvert('sevkiyat_SatisIrs_SipBag_EslesmeDurumu',
            (v) => val.sevkiyatSatisIrsSipBagEslesmeDurumu = v as int?);
        $checkedConvert('sevkiyat_SatisIrs_SipBag_MalToplananlarGelsin',
            (v) => val.sevkiyatSatisIrsSipBagMalToplananlarGelsin = v as bool?);
        $checkedConvert(
            'sevkiyat_SatisIrs_SipBag_SevkOnayliSiparislerGelsin',
            (v) => val.sevkiyatSatisIrsSipBagSevkOnayliSiparislerGelsin =
                v as bool?);
        $checkedConvert('sevkiyat_FiyatDegistirilmesin',
            (v) => val.sevkiyatFiyatDegistirilmesin = v as bool?);
        $checkedConvert(
            'sevkiyat_SatisIrsaliyesi_EIrsaliyeDuzenleyemesin',
            (v) => val.sevkiyatSatisIrsaliyesiEIrsaliyeDuzenleyemesin =
                v as bool?);
        $checkedConvert('sevkiyat_SatisIrs_KalemlerBirlestirilsin',
            (v) => val.sevkiyatSatisIrsKalemlerBirlestirilsin = v as bool?);
        $checkedConvert('sevkiyat_SatisIrs_OtoBasimYap',
            (v) => val.sevkiyatSatisIrsOtoBasimYap = v as bool?);
        $checkedConvert(
            'sevkiyat_SatisIrs_KacGunlukKayitlarListelensin',
            (v) =>
                val.sevkiyatSatisIrsKacGunlukKayitlarListelensin = v as int?);
        $checkedConvert('sevkiyat_SatisIrs_FiyatSirasi',
            (v) => val.sevkiyatSatisIrsFiyatSirasi = v as int?);
        $checkedConvert('sevkiyat_SatisIrs_KDVSifirGelsin',
            (v) => val.sevkiyatSatisIrsKDVSifirGelsin = v as bool?);
        $checkedConvert('sevkiyat_SatisIrs_SeriGirisHarYapabilsin',
            (v) => val.sevkiyatSatisIrsSeriGirisHarYapabilsin = v as bool?);
        $checkedConvert('sevkiyat_SatisIrs_Birim1denKaydet',
            (v) => val.sevkiyatSatisIrsBirim1denKaydet = v as bool?);
        $checkedConvert('sevkiyat_SatisIrs_EkAlan2Tablodan',
            (v) => val.sevkiyatSatisIrsEkAlan2Tablodan = v as bool?);
        $checkedConvert('sevkiyat_SatisIrs_EkAlan2Hatirla',
            (v) => val.sevkiyatSatisIrsEkAlan2Hatirla = v as bool?);
        $checkedConvert('sevkiyat_SatisIrs_OlcuBirimi',
            (v) => val.sevkiyatSatisIrsOlcuBirimi = v as int?);
        $checkedConvert('sevkiyat_SatisIrs_CariKoduDegistir',
            (v) => val.sevkiyatSatisIrsCariKoduDegistir = v as bool?);
        $checkedConvert('sevkiyat_SatisIrs_MaxIskUygulamasi',
            (v) => val.sevkiyatSatisIrsMaxIskUygulamasi = v as bool?);
        $checkedConvert('sevkiyat_SatisIrs_MaxSatIsk1',
            (v) => val.sevkiyatSatisIrsMaxSatIsk1 = (v as num?)?.toDouble());
        $checkedConvert('sevkiyat_SatisIrs_MaxSatIsk2',
            (v) => val.sevkiyatSatisIrsMaxSatIsk2 = (v as num?)?.toDouble());
        $checkedConvert('sevkiyat_SatisIrs_MaxSatIsk3',
            (v) => val.sevkiyatSatisIrsMaxSatIsk3 = (v as num?)?.toDouble());
        $checkedConvert('sevkiyat_SatisIrs_MaxSatIsk4',
            (v) => val.sevkiyatSatisIrsMaxSatIsk4 = (v as num?)?.toDouble());
        $checkedConvert('sevkiyat_SatisIrs_MaxSatIsk5',
            (v) => val.sevkiyatSatisIrsMaxSatIsk5 = (v as num?)?.toDouble());
        $checkedConvert('sevkiyat_SatisIrs_MaxSatIsk6',
            (v) => val.sevkiyatSatisIrsMaxSatIsk6 = (v as num?)?.toDouble());
        $checkedConvert('sevkiyat_SatisIrs_MaxGenIsk1',
            (v) => val.sevkiyatSatisIrsMaxGenIsk1 = (v as num?)?.toDouble());
        $checkedConvert('sevkiyat_SatisIrs_MaxGenIsk2',
            (v) => val.sevkiyatSatisIrsMaxGenIsk2 = (v as num?)?.toDouble());
        $checkedConvert('sevkiyat_SatisIrs_MaxGenIsk3',
            (v) => val.sevkiyatSatisIrsMaxGenIsk3 = (v as num?)?.toDouble());
        $checkedConvert('sevkiyat_SatisIrs_DipFiyatUygulamasi',
            (v) => val.sevkiyatSatisIrsDipFiyatUygulamasi = v as bool?);
        $checkedConvert('sevkiyat_SatisIrs_DipFiyatSaha',
            (v) => val.sevkiyatSatisIrsDipFiyatSaha = v as String?);
        $checkedConvert('sevkiyat_SatisIrs_DipFiyatEylem',
            (v) => val.sevkiyatSatisIrsDipFiyatEylem = v as String?);
        $checkedConvert('sevkiyat_SatisIrs_DipFiyatKDVDurumu',
            (v) => val.sevkiyatSatisIrsDipFiyatKDVDurumu = v as String?);
        $checkedConvert('sevkiyat_SatisIrs_BarkodluGiris',
            (v) => val.sevkiyatSatisIrsBarkodluGiris = v as bool?);
        $checkedConvert('sevkiyat_SatisIrs_MiktarOtomatikGelsin',
            (v) => val.sevkiyatSatisIrsMiktarOtomatikGelsin = v as bool?);
        $checkedConvert('sevkiyat_SatisIrs_KalemDetaySorulmasin',
            (v) => val.sevkiyatSatisIrsKalemDetaySorulmasin = v as bool?);
        $checkedConvert('sevkiyat_SatisIrs_StokRehberiAcilmasin',
            (v) => val.sevkiyatSatisIrsStokRehberiAcilmasin = v as bool?);
        $checkedConvert('sevkiyat_SatisIrs_KalemDuzeltilemesin',
            (v) => val.sevkiyatSatisIrsKalemDuzeltilemesin = v as bool?);
        $checkedConvert('sevkiyat_SatisIrs_KlavyeEngelle',
            (v) => val.sevkiyatSatisIrsKlavyeEngelle = v as bool?);
        $checkedConvert('sevkiyat_SatisIrs_Miktar1Gelsin',
            (v) => val.sevkiyatSatisIrsMiktar1Gelsin = v as bool?);
        $checkedConvert('sevkiyat_SatisIrs_BakiyesizStokSecilmesin',
            (v) => val.sevkiyatSatisIrsBakiyesizStokSecilmesin = v as bool?);
        $checkedConvert('sevkiyat_SatisIrs_Raporlar',
            (v) => val.sevkiyatSatisIrsRaporlar = v as bool?);
        $checkedConvert('sevkiyat_SatisIrs_KalemRaporu',
            (v) => val.sevkiyatSatisIrsKalemRaporu = v as bool?);
        $checkedConvert('sevkiyat_SatisFat_BelgeTipleri',
            (v) => val.sevkiyatSatisFatBelgeTipleri = v as List<dynamic>?);
        $checkedConvert('sevkiyat_SatisFat_VarsayilanBelgeTipi',
            (v) => val.sevkiyatSatisFatVarsayilanBelgeTipi = v as int?);
        $checkedConvert(
            'sevkiyat_SatisFat', (v) => val.sevkiyatSatisFat = v as bool?);
        $checkedConvert('sevkiyat_SatisFat_Kaydet',
            (v) => val.sevkiyatSatisFatKaydet = v as bool?);
        $checkedConvert('sevkiyat_SatisFat_Duzelt',
            (v) => val.sevkiyatSatisFatDuzelt = v as bool?);
        $checkedConvert('sevkiyat_SatisFat_Sil',
            (v) => val.sevkiyatSatisFatSil = v as bool?);
        $checkedConvert(
            'sevkiyat_SatisFat_ToplamlarCariTahsilatIslemleri',
            (v) => val.sevkiyatSatisFatToplamlarCariTahsilatIslemleri =
                v as bool?);
        $checkedConvert('sevkiyat_SatisFat_KayittanSonraTaslakOlustur',
            (v) => val.sevkiyatSatisFatKayittanSonraTaslakOlustur = v as bool?);
        $checkedConvert('sevkiyat_SatisFat_OtomatikBasimYap',
            (v) => val.sevkiyatSatisFatOtomatikBasimYap = v as bool?);
        $checkedConvert('sevkiyat_SatisFat_DigerSekmesiGoster',
            (v) => val.sevkiyatSatisFatDigerSekmesiGoster = v as bool?);
        $checkedConvert('sevkiyat_SatisFat_FiyatDegistirilmesin',
            (v) => val.sevkiyatSatisFatFiyatDegistirilmesin = v as bool?);
        $checkedConvert(
            'sevkiyat_SatisFat_KacGunlukKayitlarListelensin',
            (v) =>
                val.sevkiyatSatisFatKacGunlukKayitlarListelensin = v as int?);
        $checkedConvert('sevkiyat_SatisFat_FiyatSirasi',
            (v) => val.sevkiyatSatisFatFiyatSirasi = v as int?);
        $checkedConvert('sevkiyat_SatisFat_KalemlerBirlestirilsin',
            (v) => val.sevkiyatSatisFatKalemlerBirlestirilsin = v as bool?);
        $checkedConvert('sevkiyat_SatisFat_Birim1denKaydet',
            (v) => val.sevkiyatSatisFatBirim1denKaydet = v as bool?);
        $checkedConvert('sevkiyat_SatisFat_EkAlan2Tablodan',
            (v) => val.sevkiyatSatisFatEkAlan2Tablodan = v as bool?);
        $checkedConvert('sevkiyat_SatisFat_EkAlan2Hatirla',
            (v) => val.sevkiyatSatisFatEkAlan2Hatirla = v as bool?);
        $checkedConvert('sevkiyat_SatisFat_Filtre',
            (v) => val.sevkiyatSatisFatFiltre = v as String?);
        $checkedConvert('sevkiyat_SatisFat_FiltreSQL',
            (v) => val.sevkiyatSatisFatFiltreSQL = v as String?);
        $checkedConvert('sevkiyat_SatisFat_OlcuBirimi',
            (v) => val.sevkiyatSatisFatOlcuBirimi = v as int?);
        $checkedConvert(
            'sevkiyat_SatisFat_AciklamaAlanlari',
            (v) => val.sevkiyatSatisFatAciklamaAlanlari =
                (v as List<dynamic>?)?.map((e) => e as int).toList());
        $checkedConvert(
            'sevkiyat_SatisFat_BosGecilmeyecekAlanlar',
            (v) => val.sevkiyatSatisFatBosGecilmeyecekAlanlar =
                v as List<dynamic>?);
        $checkedConvert('sevkiyat_SatisFat_GizlenecekAlanlar',
            (v) => val.sevkiyatSatisFatGizlenecekAlanlar = v as List<dynamic>?);
        $checkedConvert(
            'sevkiyat_SatisFat_DegismeyecekAlanlar',
            (v) =>
                val.sevkiyatSatisFatDegismeyecekAlanlar = v as List<dynamic>?);
        $checkedConvert('sevkiyat_SatisFat_SeriGirisHarYapabilsin',
            (v) => val.sevkiyatSatisFatSeriGirisHarYapabilsin = v as bool?);
        $checkedConvert('sevkiyat_SatisFat_CariKoduDegistir',
            (v) => val.sevkiyatSatisFatCariKoduDegistir = v as bool?);
        $checkedConvert('sevkiyat_SatisFaturasi_SipBagSecenegi',
            (v) => val.sevkiyatSatisFaturasiSipBagSecenegi = v as String?);
        $checkedConvert('sevkiyat_SatisFat_ReferansStokUygulamasi',
            (v) => val.sevkiyatSatisFatReferansStokUygulamasi = v as bool?);
        $checkedConvert(
            'sevkiyat_SatisFat_SipBag_SipHariciKalemEklenebilir',
            (v) => val.sevkiyatSatisFatSipBagSipHariciKalemEklenebilir =
                v as bool?);
        $checkedConvert(
            'sevkiyat_SatisFat_SipBag_FazlaTeslimatYapilabilir',
            (v) => val.sevkiyatSatisFatSipBagFazlaTeslimatYapilabilir =
                v as bool?);
        $checkedConvert('sevkiyat_SatisFat_SipBag_SipOkutulsun',
            (v) => val.sevkiyatSatisFatSipBagSipOkutulsun = v as bool?);
        $checkedConvert(
            'sevkiyat_SatisFat_SipBag_SipOkutulsun_Miktar2BazAl',
            (v) => val.sevkiyatSatisFatSipBagSipOkutulsunMiktar2BazAl =
                v as bool?);
        $checkedConvert('sevkiyat_SatisFat_SipBag_CokluSecim',
            (v) => val.sevkiyatSatisFatSipBagCokluSecim = v as bool?);
        $checkedConvert('sevkiyat_SatisFat_SipBag_TumKalemlerSecilsin',
            (v) => val.sevkiyatSatisFatSipBagTumKalemlerSecilsin = v as bool?);
        $checkedConvert('sevkiyat_SatisFat_SipBag_EslesmeDurumu',
            (v) => val.sevkiyatSatisFatSipBagEslesmeDurumu = v as int?);
        $checkedConvert(
            'sevkiyat_SatisFat_SipBag_SevkOnayliSiparislerGelsin',
            (v) => val.sevkiyatSatisFatSipBagSevkOnayliSiparislerGelsin =
                v as bool?);
        $checkedConvert('sevkiyat_SatisFat_BarkodluGiris',
            (v) => val.sevkiyatSatisFatBarkodluGiris = v as bool?);
        $checkedConvert('sevkiyat_SatisFaturasi_MiktarOtomatikGelsin',
            (v) => val.sevkiyatSatisFaturasiMiktarOtomatikGelsin = v as bool?);
        $checkedConvert('sevkiyat_SatisFaturasi_KalemDetaySorulmasin',
            (v) => val.sevkiyatSatisFaturasiKalemDetaySorulmasin = v as bool?);
        $checkedConvert(
            'sevkiyat_SatisFat_BarkodSayisiSaklanacakAlan',
            (v) =>
                val.sevkiyatSatisFatBarkodSayisiSaklanacakAlan = v as String?);
        $checkedConvert('sevkiyat_SatisFat_StokRehberiAcilmasin',
            (v) => val.sevkiyatSatisFatStokRehberiAcilmasin = v as bool?);
        $checkedConvert('sevkiyat_SatisFat_KalemDuzeltilemesin',
            (v) => val.sevkiyatSatisFatKalemDuzeltilemesin = v as bool?);
        $checkedConvert('sevkiyat_SatisFat_KlavyeEngelle',
            (v) => val.sevkiyatSatisFatKlavyeEngelle = v as bool?);
        $checkedConvert('sevkiyat_SatisFat_Miktar1Gelsin',
            (v) => val.sevkiyatSatisFatMiktar1Gelsin = v as bool?);
        $checkedConvert('sevkiyat_SatisFat_BakiyesizStokSecilmesin',
            (v) => val.sevkiyatSatisFatBakiyesizStokSecilmesin = v as bool?);
        $checkedConvert('sevkiyat_SatisFat_Raporlar',
            (v) => val.sevkiyatSatisFatRaporlar = v as bool?);
        $checkedConvert('sevkiyat_SatisFat_KalemRaporu',
            (v) => val.sevkiyatSatisFatKalemRaporu = v as bool?);
        $checkedConvert('sevkiyat_SatisFat_KarlilikRaporu',
            (v) => val.sevkiyatSatisFatKarlilikRaporu = v as bool?);
        $checkedConvert('sevkiyat_SatisFat_MaxIskUygulamasi',
            (v) => val.sevkiyatSatisFatMaxIskUygulamasi = v as bool?);
        $checkedConvert('sevkiyat_SatisFat_MaxSatIsk1',
            (v) => val.sevkiyatSatisFatMaxSatIsk1 = (v as num?)?.toDouble());
        $checkedConvert('sevkiyat_SatisFat_MaxSatIsk2',
            (v) => val.sevkiyatSatisFatMaxSatIsk2 = (v as num?)?.toDouble());
        $checkedConvert('sevkiyat_SatisFat_MaxSatIsk3',
            (v) => val.sevkiyatSatisFatMaxSatIsk3 = (v as num?)?.toDouble());
        $checkedConvert('sevkiyat_SatisFat_MaxSatIsk4',
            (v) => val.sevkiyatSatisFatMaxSatIsk4 = (v as num?)?.toDouble());
        $checkedConvert('sevkiyat_SatisFat_MaxSatIsk5',
            (v) => val.sevkiyatSatisFatMaxSatIsk5 = (v as num?)?.toDouble());
        $checkedConvert('sevkiyat_SatisFat_MaxSatIsk6',
            (v) => val.sevkiyatSatisFatMaxSatIsk6 = (v as num?)?.toDouble());
        $checkedConvert('sevkiyat_SatisFat_MaxGenIsk1',
            (v) => val.sevkiyatSatisFatMaxGenIsk1 = (v as num?)?.toDouble());
        $checkedConvert('sevkiyat_SatisFat_MaxGenIsk2',
            (v) => val.sevkiyatSatisFatMaxGenIsk2 = (v as num?)?.toDouble());
        $checkedConvert('sevkiyat_SatisFat_MaxGenIsk3',
            (v) => val.sevkiyatSatisFatMaxGenIsk3 = (v as num?)?.toDouble());
        $checkedConvert('sevkiyat_SatisFat_DipFiyatUygulamasi',
            (v) => val.sevkiyatSatisFatDipFiyatUygulamasi = v as bool?);
        $checkedConvert('sevkiyat_SatisFat_DipFiyatSaha',
            (v) => val.sevkiyatSatisFatDipFiyatSaha = v as String?);
        $checkedConvert('sevkiyat_SatisFat_DipFiyatEylem',
            (v) => val.sevkiyatSatisFatDipFiyatEylem = v as String?);
        $checkedConvert('sevkiyat_SatisFat_DipFiyatKDVDurumu',
            (v) => val.sevkiyatSatisFatDipFiyatKDVDurumu = v as String?);
        $checkedConvert('sevkiyat_SatisIrsaliyesiSiparissiz',
            (v) => val.sevkiyatSatisIrsaliyesiSiparissiz = v as bool?);
        $checkedConvert('sevkiyat_SatisIrsaliyesiSiparissizFiyatGor',
            (v) => val.sevkiyatSatisIrsaliyesiSiparissizFiyatGor = v as bool?);
        $checkedConvert('sevkiyat_SatisIrsaliyesiIade',
            (v) => val.sevkiyatSatisIrsaliyesiIade = v as bool?);
        $checkedConvert('sevkiyat_SiptenMalTop',
            (v) => val.sevkiyatSiptenMalTop = v as bool?);
        $checkedConvert('sevkiyat_SiptenMalTop_MiktarBarkoddanGelsin',
            (v) => val.sevkiyatSiptenMalTopMiktarBarkoddanGelsin = v as bool?);
        $checkedConvert(
            'sevkiyat_SiptenMalTop_RehberdenStokSecilmesin',
            (v) =>
                val.sevkiyatSiptenMalTopRehberdenStokSecilmesin = v as bool?);
        $checkedConvert(
            'sevkiyat_SiptenMalTop_KlavyedenBarkodGirilmesin',
            (v) =>
                val.sevkiyatSiptenMalTopKlavyedenBarkodGirilmesin = v as bool?);
        $checkedConvert(
            'sevkiyat_SiptenMalTop_SevkOnayliSiparislerGelsin',
            (v) => val.sevkiyatSiptenMalTopSevkOnayliSiparislerGelsin =
                v as bool?);
        $checkedConvert(
            'sevkiyat_SiptenMalTop_KacGunlukKayitlarListelensin',
            (v) => val.sevkiyatSiptenMalTopKacGunlukKayitlarListelensin =
                v as int?);
        $checkedConvert(
            'sevkemri_MalToplama', (v) => val.sevkemriMalToplama = v as bool?);
        $checkedConvert('sevkemri_MalToplamaAtanabilir',
            (v) => val.sevkemriMalToplamaAtanabilir = v as bool?);
        $checkedConvert('sevkemri_MalToplamaAtayabilir',
            (v) => val.sevkemriMalToplamaAtayabilir = v as bool?);
        $checkedConvert('sevkemri_UrunDegistir',
            (v) => val.sevkemriUrunDegistir = v as bool?);
        $checkedConvert('sevkemri_MiktarDegistir',
            (v) => val.sevkemriMiktarDegistir = v as bool?);
        $checkedConvert(
            'sevkemri_MuadilUrun', (v) => val.sevkemriMuadilUrun = v as bool?);
        $checkedConvert(
            'sevkemri_malToplama_BarkodsuzUrunListedenSecilsin',
            (v) => val.sevkemriMalToplamaBarkodsuzUrunListedenSecilsin =
                v as bool?);
        $checkedConvert('sevkemri_MalToplama_OtoStokEtiketiYazdir',
            (v) => val.sevkemriMalToplamaOtoStokEtiketiYazdir = v as bool?);
        $checkedConvert('sevkemri_MalToplama_OtoStokEtiketiYazdirSor',
            (v) => val.sevkemriMalToplamaOtoStokEtiketiYazdirSor = v as bool?);
        $checkedConvert('sevkemri_MalToplama_KlavyedenGirisiEngelle',
            (v) => val.sevkemriMalToplamaKlavyedenGirisiEngelle = v as bool?);
        $checkedConvert('sevkemri_MalToplama_Barkod2Sor',
            (v) => val.sevkemriMalToplamaBarkod2Sor = v as bool?);
        $checkedConvert('sevkemri_MalToplama_Barkod2_YildizliGorunsun',
            (v) => val.sevkemriMalToplamaBarkod2YildizliGorunsun = v as bool?);
        $checkedConvert('sevkemri_MalToplama_Barkod2KalemEkranindaSor',
            (v) => val.sevkemriMalToplamaBarkod2KalemEkranindaSor = v as bool?);
        $checkedConvert(
            'sevkemri_MalToplama_TumuToplanmadanTamamlanmasin',
            (v) => val.sevkemriMalToplamaTumuToplanmadanTamamlanmasin =
                v as bool?);
        $checkedConvert('sevkemri_MalToplama_HangiHucredeGoster',
            (v) => val.sevkemriMalToplamaHangiHucredeGoster = v as bool?);
        $checkedConvert(
            'sevkemri_MalToplama_KalemDetayIslemOnaySormasin',
            (v) =>
                val.sevkemriMalToplamaKalemDetayIslemOnaySormasin = v as bool?);
        $checkedConvert(
            'sevkemri_MalToplama_GosterilecekEkBilgiler',
            (v) => val.sevkemriMalToplamaGosterilecekEkBilgiler =
                (v as List<dynamic>?)?.map((e) => e as String).toList());
        $checkedConvert(
            'sevkemri_MalToplama_DegistirilemeyecekAlanlar',
            (v) => val.sevkemriMalToplamaDegistirilemeyecekAlanlar =
                v as List<dynamic>?);
        $checkedConvert(
            'sevkemri_MalToplama_GizlenecekAlanlar',
            (v) =>
                val.sevkemriMalToplamaGizlenecekAlanlar = v as List<dynamic>?);
        $checkedConvert('sevkemri_MalToplama_MiktarBarkoddan',
            (v) => val.sevkemriMalToplamaMiktarBarkoddan = v as bool?);
        $checkedConvert('sevkemri_MalToplama_KalemDetayiSorulmasin',
            (v) => val.sevkemriMalToplamaKalemDetayiSorulmasin = v as bool?);
        $checkedConvert('sevkemri_MalToplama_KalemDetayaUlasamasin',
            (v) => val.sevkemriMalToplamaKalemDetayaUlasamasin = v as bool?);
        $checkedConvert('sevkemri_MalToplama_FazlaTeslimat',
            (v) => val.sevkemriMalToplamaFazlaTeslimat = v as String?);
        $checkedConvert('sevkemri_MalToplama_VarsayilanOlcuBirimi',
            (v) => val.sevkemriMalToplamaVarsayilanOlcuBirimi = v as int?);
        $checkedConvert('sevkemri_MalToplama_SiralamaTipi',
            (v) => val.sevkemriMalToplamaSiralamaTipi = v as String?);
        $checkedConvert(
            'sevkemri_MalKontrol', (v) => val.sevkemriMalKontrol = v as bool?);
        $checkedConvert('sevkemri_MalKontrol_KlavyeEngelle',
            (v) => val.sevkemriMalKontrolKlavyeEngelle = v as bool?);
        $checkedConvert(
            'sevkemri_MalKontrolTipi',
            (v) => val.sevkemriMalKontrolTipi = v == null
                ? null
                : SevkemriMalKontrolTipi.fromJson(v as Map<String, dynamic>));
        $checkedConvert(
            'sevkemri_MalKontrolKullanicilar',
            (v) => val.sevkemriMalKontrolKullanicilar =
                (v as List<dynamic>?)?.map((e) => e as int).toList());
        $checkedConvert(
            'sevkemri_Paketleme', (v) => val.sevkemriPaketleme = v as bool?);
        $checkedConvert('sevkemri_Paketleme_KlavyeEngelle',
            (v) => val.sevkemriPaketlemeKlavyeEngelle = v as bool?);
        $checkedConvert('sevkemri_Paketleme_BarkodOkutmayaZorla',
            (v) => val.sevkemriPaketlemeBarkodOkutmayaZorla = v as bool?);
        $checkedConvert(
            'sevkemri_Paketleme_BarkodsuzUrunListedenSecilsin',
            (v) => val.sevkemriPaketlemeBarkodsuzUrunListedenSecilsin =
                v as bool?);
        $checkedConvert('sevkemri_AracYukleme',
            (v) => val.sevkemriAracYukleme = v as bool?);
        $checkedConvert('sevkemri_AracYukleme_KlavyeEngelle',
            (v) => val.sevkemriAracYuklemeKlavyeEngelle = v as bool?);
        $checkedConvert('sevkemri_AracBosaltma',
            (v) => val.sevkemriAracBosaltma = v as bool?);
        $checkedConvert('sevkemri_AracBosaltma_KlavyeEngelle',
            (v) => val.sevkemriAracBosaltmaKlavyeEngelle = v as bool?);
        $checkedConvert('sevkemri_DepodanTeslimat',
            (v) => val.sevkemriDepodanTeslimat = v as bool?);
        $checkedConvert('sevkemri_DepodanTeslimat_KlavyeEngelle',
            (v) => val.sevkemriDepodanTeslimatKlavyeEngelle = v as bool?);
        $checkedConvert('sayim_sayim', (v) => val.sayimSayim = v as bool?);
        $checkedConvert('sayim_Kontrol_Miktari',
            (v) => val.sayimKontrolMiktari = v as int?);
        $checkedConvert('sayim_MiktarBarkoddanGelsin',
            (v) => val.sayimMiktarBarkoddanGelsin = v as bool?);
        $checkedConvert('sayim_AyniStokDurumu',
            (v) => val.sayimAyniStokDurumu = v as String?);
        $checkedConvert(
            'sayim_Miktar1Gelsin', (v) => val.sayimMiktar1Gelsin = v as bool?);
        $checkedConvert(
            'sayim_HemenKaydet', (v) => val.sayimHemenKaydet = v as bool?);
        $checkedConvert(
            'sayim_CarpanAktif', (v) => val.sayimCarpanAktif = v as bool?);
        $checkedConvert('sayim_SeriMikGirilenMikKabulEdilsin',
            (v) => val.sayimSeriMikGirilenMikKabulEdilsin = v as bool?);
        $checkedConvert('sayim_DigerKulSayimHarGorsun',
            (v) => val.sayimDigerKulSayimHarGorsun = v as String?);
        $checkedConvert('sayim_DigerKulSayimFisGorsun',
            (v) => val.sayimDigerKulSayimFisGorsun = v as String?);
        $checkedConvert('sayim_Serbest', (v) => val.sayimSerbest = v as bool?);
        $checkedConvert(
            'sayim_Serbest_Sil', (v) => val.sayimSerbestSil = v as bool?);
        $checkedConvert('sayim_DepoFarkRaporu',
            (v) => val.sayimDepoFarkRaporu = v as bool?);
        $checkedConvert('sayim_BelgeBaglantisiniKopar',
            (v) => val.sayimBelgeBaglantisiniKopar = v as bool?);
        $checkedConvert(
            'sayim_BelgeOlusturabilir',
            (v) => val.sayimBelgeOlusturabilir =
                (v as List<dynamic>?)?.map((e) => e as String).toList());
        $checkedConvert(
            'sayim_EkAlanlar', (v) => val.sayimEkAlanlar = v as List<dynamic>?);
        $checkedConvert('sayim_DegismeyecekAlanlar',
            (v) => val.sayimDegismeyecekAlanlar = v as List<dynamic>?);
        $checkedConvert('sayim_GizlenecekAlanlar',
            (v) => val.sayimGizlenecekAlanlar = v as List<dynamic>?);
        $checkedConvert('sayim_VarsayilanOlcuBirimi',
            (v) => val.sayimVarsayilanOlcuBirimi = v as int?);
        $checkedConvert('sayim_Raporu', (v) => val.sayimRaporu = v as bool?);
        $checkedConvert('paket_Olustur', (v) => val.paketOlustur = v as bool?);
        $checkedConvert(
            'paket_CokluOlustur', (v) => val.paketCokluOlustur = v as bool?);
        $checkedConvert('paket_Kontrol', (v) => val.paketKontrol = v as bool?);
        $checkedConvert(
            'paket_MalzemeCikisi', (v) => val.paketMalzemeCikisi = v as bool?);
        $checkedConvert('paket_ReceteyiFiltrele',
            (v) => val.paketReceteyiFiltrele = v as bool?);
        $checkedConvert('islemler_HucreEtiket',
            (v) => val.islemlerHucreEtiket = v as bool?);
        $checkedConvert(
            'islemler_StokEtiket', (v) => val.islemlerStokEtiket = v as bool?);
        $checkedConvert('islemler_BarkodTanimlama',
            (v) => val.islemlerBarkodTanimlama = v as bool?);
        $checkedConvert('siparis_MusteriSiparisi',
            (v) => val.siparisMusteriSiparisi = v as bool?);
        $checkedConvert('siparis_MusteriSiparisi_Kaydet',
            (v) => val.siparisMusteriSiparisiKaydet = v as bool?);
        $checkedConvert('siparis_MusteriSiparisi_Duzelt',
            (v) => val.siparisMusteriSiparisiDuzelt = v as bool?);
        $checkedConvert('siparis_MusteriSiparisi_Sil',
            (v) => val.siparisMusteriSiparisiSil = v as bool?);
        $checkedConvert(
            'siparis_MusteriSiparisi_KapalilarListelenmesin',
            (v) =>
                val.siparisMusteriSiparisiKapalilarListelenmesin = v as bool?);
        $checkedConvert('siparis_MusteriSiparisi_FiyatDegistirilmesin',
            (v) => val.siparisMusteriSiparisiFiyatDegistirilmesin = v as bool?);
        $checkedConvert('siparis_MusteriSiparisi_FiyatSirasi',
            (v) => val.siparisMusteriSiparisiFiyatSirasi = v as int?);
        $checkedConvert('siparis_MusSip_Birim1denKaydet',
            (v) => val.siparisMusSipBirim1denKaydet = v as bool?);
        $checkedConvert('siparis_MusteriSiparisi_KapatmaIslemi',
            (v) => val.siparisMusteriSiparisiKapatmaIslemi = v as bool?);
        $checkedConvert('siparis_MusSip_OnayIslemleri',
            (v) => val.siparisMusSipOnayIslemleri = v as bool?);
        $checkedConvert('siparis_MusteriSiparisi_SonFiyatGoster',
            (v) => val.siparisMusteriSiparisiSonFiyatGoster = v as bool?);
        $checkedConvert('siparis_MusSip_DigerSekmesiGoster',
            (v) => val.siparisMusSipDigerSekmesiGoster = v as bool?);
        $checkedConvert('siparis_MusSip_EkAlan2Tablodan',
            (v) => val.siparisMusSipEkAlan2Tablodan = v as bool?);
        $checkedConvert('siparis_MusSip_EkAlan2Hatirla',
            (v) => val.siparisMusSipEkAlan2Hatirla = v as bool?);
        $checkedConvert('siparis_MusSip_Miktar1Gelsin',
            (v) => val.siparisMusSipMiktar1Gelsin = v as bool?);
        $checkedConvert(
            'siparis_MusSip_BosGecilmeyecekAlanlar',
            (v) => val.siparisMusSipBosGecilmeyecekAlanlar =
                (v as List<dynamic>?)?.map((e) => e as String).toList());
        $checkedConvert('siparis_MusSip_OtoPdfGor',
            (v) => val.siparisMusSipOtoPdfGor = v as bool?);
        $checkedConvert('siparis_MusSip_CariKoduDegistir',
            (v) => val.siparisMusSipCariKoduDegistir = v as bool?);
        $checkedConvert(
            'siparis_MusteriSiparisi_AciklamaAlanlari',
            (v) => val.siparisMusteriSiparisiAciklamaAlanlari =
                (v as List<dynamic>?)?.map((e) => e as int).toList());
        $checkedConvert(
            'siparis_MusteriSiparisi_GizlenecekAlanlar',
            (v) => val.siparisMusteriSiparisiGizlenecekAlanlar =
                v as List<dynamic>?);
        $checkedConvert(
            'siparis_MusteriSiparisi_DegismeyecekAlanlar',
            (v) => val.siparisMusteriSiparisiDegismeyecekAlanlar =
                v as List<dynamic>?);
        $checkedConvert(
            'siparis_MusSip_EkstraAlanlar',
            (v) => val.siparisMusSipEkstraAlanlar =
                (v as List<dynamic>?)?.map((e) => e as String).toList());
        $checkedConvert(
            'siparis_MusteriSiparisi_SatirAciklamaAlanlari',
            (v) => val.siparisMusteriSiparisiSatirAciklamaAlanlari =
                (v as List<dynamic>?)?.map((e) => e as int).toList());
        $checkedConvert('siparis_MusSip_OlcuBirimi',
            (v) => val.siparisMusSipOlcuBirimi = v as int?);
        $checkedConvert('siparis_MusSip_BakiyesizStokSecilmesin',
            (v) => val.siparisMusSipBakiyesizStokSecilmesin = v as bool?);
        $checkedConvert(
            'siparis_MusSip_HizliUrunGirisi_Miktar2Kullanilsin',
            (v) => val.siparisMusSipHizliUrunGirisiMiktar2Kullanilsin =
                v as String?);
        $checkedConvert('siparis_MusteriSiparisi_DipFiyatUygulamasi',
            (v) => val.siparisMusteriSiparisiDipFiyatUygulamasi = v as bool?);
        $checkedConvert('siparis_MusteriSiparisi_DipFiyatSaha',
            (v) => val.siparisMusteriSiparisiDipFiyatSaha = v as String?);
        $checkedConvert('siparis_MusteriSiparisi_DipFiyatEylem',
            (v) => val.siparisMusteriSiparisiDipFiyatEylem = v as String?);
        $checkedConvert('siparis_MusteriSiparisi_DipFiyatKDVDurumu',
            (v) => val.siparisMusteriSiparisiDipFiyatKDVDurumu = v as String?);
        $checkedConvert('siparis_MusSip_MaxIskUygulamasi',
            (v) => val.siparisMusSipMaxIskUygulamasi = v as bool?);
        $checkedConvert('siparis_MusSip_MaxSatIsk1',
            (v) => val.siparisMusSipMaxSatIsk1 = (v as num?)?.toDouble());
        $checkedConvert('siparis_MusSip_MaxSatIsk2',
            (v) => val.siparisMusSipMaxSatIsk2 = (v as num?)?.toDouble());
        $checkedConvert('siparis_MusSip_MaxSatIsk3',
            (v) => val.siparisMusSipMaxSatIsk3 = (v as num?)?.toDouble());
        $checkedConvert('siparis_MusSip_MaxSatIsk4',
            (v) => val.siparisMusSipMaxSatIsk4 = (v as num?)?.toDouble());
        $checkedConvert('siparis_MusSip_MaxSatIsk5',
            (v) => val.siparisMusSipMaxSatIsk5 = (v as num?)?.toDouble());
        $checkedConvert('siparis_MusSip_MaxSatIsk6',
            (v) => val.siparisMusSipMaxSatIsk6 = (v as num?)?.toDouble());
        $checkedConvert('siparis_MusSip_MaxGenIsk1',
            (v) => val.siparisMusSipMaxGenIsk1 = (v as num?)?.toDouble());
        $checkedConvert('siparis_MusSip_MaxGenIsk2',
            (v) => val.siparisMusSipMaxGenIsk2 = (v as num?)?.toDouble());
        $checkedConvert('siparis_MusSip_MaxGenIsk3',
            (v) => val.siparisMusSipMaxGenIsk3 = (v as num?)?.toDouble());
        $checkedConvert('siparis_MusteriSiparisi_Raporlar',
            (v) => val.siparisMusteriSiparisiRaporlar = v as bool?);
        $checkedConvert('siparis_MusteriSiparisi_DurumRaporu',
            (v) => val.siparisMusteriSiparisiDurumRaporu = v as bool?);
        $checkedConvert('siparis_MusteriSiparisi_DurumRaporuFiyatGor',
            (v) => val.siparisMusteriSiparisiDurumRaporuFiyatGor = v as bool?);
        $checkedConvert('siparis_MusSip_KarlilikRaporu',
            (v) => val.siparisMusSipKarlilikRaporu = v as bool?);
        $checkedConvert('siparis_MusSip_TeslimRaporu',
            (v) => val.siparisMusSipTeslimRaporu = v as bool?);
        $checkedConvert('siparis_SaticiSiparisi',
            (v) => val.siparisSaticiSiparisi = v as bool?);
        $checkedConvert('siparis_SaticiSiparisi_Kaydet',
            (v) => val.siparisSaticiSiparisiKaydet = v as bool?);
        $checkedConvert('siparis_SaticiSiparisi_Duzelt',
            (v) => val.siparisSaticiSiparisiDuzelt = v as bool?);
        $checkedConvert('siparis_SaticiSiparisi_Sil',
            (v) => val.siparisSaticiSiparisiSil = v as bool?);
        $checkedConvert(
            'siparis_SaticiSiparisi_KapalilarListelenmesin',
            (v) =>
                val.siparisSaticiSiparisiKapalilarListelenmesin = v as bool?);
        $checkedConvert('siparis_SaticiSiparisi_FiyatDegistirilmesin',
            (v) => val.siparisSaticiSiparisiFiyatDegistirilmesin = v as bool?);
        $checkedConvert('siparis_SaticiSiparisi_FiyatSirasi',
            (v) => val.siparisSaticiSiparisiFiyatSirasi = v as int?);
        $checkedConvert('siparis_SaticiSip_Birim1denKaydet',
            (v) => val.siparisSaticiSipBirim1denKaydet = v as bool?);
        $checkedConvert('siparis_SaticiSiparisi_KapatmaIslemi',
            (v) => val.siparisSaticiSiparisiKapatmaIslemi = v as bool?);
        $checkedConvert('siparis_SaticiSip_OnayIslemleri',
            (v) => val.siparisSaticiSipOnayIslemleri = v as bool?);
        $checkedConvert('siparis_SaticiSip_DigerSekmesiGoster',
            (v) => val.siparisSaticiSipDigerSekmesiGoster = v as bool?);
        $checkedConvert('siparis_SaticiSip_OlcuBirimi',
            (v) => val.siparisSaticiSipOlcuBirimi = v as int?);
        $checkedConvert('siparis_SaticiSip_CariKoduDegistir',
            (v) => val.siparisSaticiSipCariKoduDegistir = v as bool?);
        $checkedConvert('siparis_SaticiSiparisi_Raporlar',
            (v) => val.siparisSaticiSiparisiRaporlar = v as bool?);
        $checkedConvert('siparis_SaticiSiparisi_DurumRaporu',
            (v) => val.siparisSaticiSiparisiDurumRaporu = v as bool?);
        $checkedConvert('siparis_SaticiSiparisi_DurumRaporuFiyatGor',
            (v) => val.siparisSaticiSiparisiDurumRaporuFiyatGor = v as bool?);
        $checkedConvert('siparis_SaticiSip_TeslimRaporu',
            (v) => val.siparisSaticiSipTeslimRaporu = v as bool?);
        $checkedConvert(
            'stok_StokListesi', (v) => val.stokStokListesi = v as bool?);
        $checkedConvert(
            'stok_StokListesi_ExtraAlanlar',
            (v) => val.stokStokListesiExtraAlanlar =
                (v as List<dynamic>?)?.map((e) => e as String).toList());
        $checkedConvert(
            'stok_StokKarti', (v) => val.stokStokKarti = v as bool?);
        $checkedConvert('stok_StokKarti_Kaydet',
            (v) => val.stokStokKartiKaydet = v as bool?);
        $checkedConvert('stok_StokKarti_Duzelt',
            (v) => val.stokStokKartiDuzelt = v as bool?);
        $checkedConvert(
            'stok_StokKarti_Sil', (v) => val.stokStokKartiSil = v as bool?);
        $checkedConvert('stok_StokKarti_AlisFiyatiGizle',
            (v) => val.stokStokKartiAlisFiyatiGizle = v as bool?);
        $checkedConvert('stok_StokKarti_SatisFiyatiGizle',
            (v) => val.stokStokKartiSatisFiyatiGizle = v as bool?);
        $checkedConvert('stok_StokHareketleri',
            (v) => val.stokStokHareketleri = v as bool?);
        $checkedConvert(
            'stok_StokHar_Kaydet', (v) => val.stokStokHarKaydet = v as bool?);
        $checkedConvert(
            'stok_StokHar_Duzelt', (v) => val.stokStokHarDuzelt = v as bool?);
        $checkedConvert(
            'stok_StokHar_Sil', (v) => val.stokStokHarSil = v as bool?);
        $checkedConvert('stok_StokHar_PlasiyerKendiniGorsun',
            (v) => val.stokStokHarPlasiyerKendiniGorsun = v as bool?);
        $checkedConvert(
            'stok_FiltreSQLTipi', (v) => val.stokFiltreSQLTipi = v as String?);
        $checkedConvert(
            'stok_ResimGoster', (v) => val.stokResimGoster = v as bool?);
        $checkedConvert('stok_ResimGoster_Ekle',
            (v) => val.stokResimGosterEkle = v as bool?);
        $checkedConvert(
            'stok_ResimGoster_Sil', (v) => val.stokResimGosterSil = v as bool?);
        $checkedConvert(
            'stok_FiyatOzeti', (v) => val.stokFiyatOzeti = v as bool?);
        $checkedConvert('stok_HareketDetayiniGizle',
            (v) => val.stokHareketDetayiniGizle = v as bool?);
        $checkedConvert('stok_GirisHareketleriniGizle',
            (v) => val.stokGirisHareketleriniGizle = v as bool?);
        $checkedConvert('stok_CikisHareketleriniGizle',
            (v) => val.stokCikisHareketleriniGizle = v as bool?);
        $checkedConvert('stok_BakiyeGosterimTipi',
            (v) => val.stokBakiyeGosterimTipi = v as String?);
        $checkedConvert(
            'stok_BarkodKontrol', (v) => val.stokBarkodKontrol = v as bool?);
        $checkedConvert('stok_DepoBakiyeDurumu',
            (v) => val.stokDepoBakiyeDurumu = v as String?);
        $checkedConvert('stok_BarkodTanimlama',
            (v) => val.stokBarkodTanimlama = v as bool?);
        $checkedConvert(
            'stok_BarkodTanimlama_GorunecekAlanlar',
            (v) => val.stokBarkodTanimlamaGorunecekAlanlar =
                (v as List<dynamic>?)?.map((e) => e as String).toList());
        $checkedConvert('stok_BarkodKayitlari',
            (v) => val.stokBarkodKayitlari = v as bool?);
        $checkedConvert('stok_BarkodKayitlari_Ekle',
            (v) => val.stokBarkodKayitlariEkle = v as bool?);
        $checkedConvert('stok_BarkodKayitlari_Duzelt',
            (v) => val.stokBarkodKayitlariDuzelt = v as bool?);
        $checkedConvert('stok_BarkodKayitlari_Sil',
            (v) => val.stokBarkodKayitlariSil = v as bool?);
        $checkedConvert('stok_KanbanBarkodEsle',
            (v) => val.stokKanbanBarkodEsle = v as bool?);
        $checkedConvert('stok_KanbanBarkodEsle_Sil',
            (v) => val.stokKanbanBarkodEsleSil = v as bool?);
        $checkedConvert('stok_KanbanBarkodEsleFarkliStokOkutulmasin',
            (v) => val.stokKanbanBarkodEsleFarkliStokOkutulmasin = v as bool?);
        $checkedConvert(
            'stok_FiyatGorEkrani', (v) => val.stokFiyatGorEkrani = v as bool?);
        $checkedConvert('stok_FiyatGorEkrani_GunlukKurdanTLGoster',
            (v) => val.stokFiyatGorEkraniGunlukKurdanTLGoster = v as bool?);
        $checkedConvert(
            'stok_FiyatGorEkraniGorunecekAlanlar',
            (v) => val.stokFiyatGorEkraniGorunecekAlanlar =
                (v as List<dynamic>?)?.map((e) => e as String).toList());
        $checkedConvert(
            'stok_FiyatGecmisi', (v) => val.stokFiyatGecmisi = v as bool?);
        $checkedConvert('stok_FiyatGecmisiSil',
            (v) => val.stokFiyatGecmisiSil = v as bool?);
        $checkedConvert(
            'stok_FiyatGecmisiFiyatTipleri',
            (v) => val.stokFiyatGecmisiFiyatTipleri =
                (v as List<dynamic>?)?.map((e) => e as String).toList());
        $checkedConvert('stok_SeriHar', (v) => val.stokSeriHar = v as bool?);
        $checkedConvert(
            'stok_SeriHar_Ekle', (v) => val.stokSeriHarEkle = v as bool?);
        $checkedConvert(
            'stok_SeriHar_Duzelt', (v) => val.stokSeriHarDuzelt = v as bool?);
        $checkedConvert(
            'stok_SeriHar_Sil', (v) => val.stokSeriHarSil = v as bool?);
        $checkedConvert(
            'stok_SeriParcala', (v) => val.stokSeriParcala = v as bool?);
        $checkedConvert('stok_SeriParcala_Ekle',
            (v) => val.stokSeriParcalaEkle = v as bool?);
        $checkedConvert('stok_SeriParcala_Duzelt',
            (v) => val.stokSeriParcalaDuzelt = v as bool?);
        $checkedConvert(
            'stok_SeriParcala_Sil', (v) => val.stokSeriParcalaSil = v as bool?);
        $checkedConvert(
            'stok_SeriBirlestir', (v) => val.stokSeriBirlestir = v as bool?);
        $checkedConvert('stok_SeriBirlestir_Ekle',
            (v) => val.stokSeriBirlestirEkle = v as bool?);
        $checkedConvert('stok_SeriBirlestir_Duzelt',
            (v) => val.stokSeriBirlestirDuzelt = v as bool?);
        $checkedConvert('stok_SeriBirlestir_Sil',
            (v) => val.stokSeriBirlestirSil = v as bool?);
        $checkedConvert(
            'stok_Paketleme', (v) => val.stokPaketleme = v as bool?);
        $checkedConvert(
            'stok_Paketleme_Ekle', (v) => val.stokPaketlemeEkle = v as bool?);
        $checkedConvert(
            'stok_Paketleme_Sil', (v) => val.stokPaketlemeSil = v as bool?);
        $checkedConvert('stok_Paketleme_OnaySormasin',
            (v) => val.stokPaketlemeOnaySormasin = v as String?);
        $checkedConvert('stok_Paketleme_DigerKulKayitGorebilir',
            (v) => val.stokPaketlemeDigerKulKayitGorebilir = v as String?);
        $checkedConvert(
            'stok_Paketleme_SorulacakBelgeTipleri',
            (v) => val.stokPaketlemeSorulacakBelgeTipleri =
                (v as List<dynamic>?)?.map((e) => e as String).toList());
        $checkedConvert('stok_Raporlar', (v) => val.stokRaporlar = v as bool?);
        $checkedConvert('stok_Rap_AmbarMaliyet',
            (v) => val.stokRapAmbarMaliyet = v as bool?);
        $checkedConvert('stok_Rap_LokalDepoBakiye',
            (v) => val.stokRapLokalDepoBakiye = v as bool?);
        $checkedConvert('stok_Rap_UrunGrubunaGoreSatis',
            (v) => val.stokRapUrunGrubunaGoreSatis = v as bool?);
        $checkedConvert(
            'cari_CariListesi', (v) => val.cariCariListesi = v as bool?);
        $checkedConvert('cari_CariListesi_RiskGorebilir',
            (v) => val.cariCariListesiRiskGorebilir = v as bool?);
        $checkedConvert(
            'cari_RiskGirisi', (v) => val.cariRiskGirisi = v as bool?);
        $checkedConvert(
            'cari_CariKarti', (v) => val.cariCariKarti = v as bool?);
        $checkedConvert('cari_CariKarti_Kaydet',
            (v) => val.cariCariKartiKaydet = v as bool?);
        $checkedConvert('cari_CariKarti_Duzelt',
            (v) => val.cariCariKartiDuzelt = v as bool?);
        $checkedConvert(
            'cari_CariKarti_Sil', (v) => val.cariCariKartiSil = v as bool?);
        $checkedConvert('cari_CariKarti_EIslemler',
            (v) => val.cariCariKartiEIslemler = v as bool?);
        $checkedConvert(
            'cari_CariKarti_DegismeyecekAlanlar',
            (v) => val.cariCariKartiDegismeyecekAlanlar =
                (v as List<dynamic>?)?.map((e) => e as String).toList());
        $checkedConvert('cari_CariKarti_GizlenecekAlanlar',
            (v) => val.cariCariKartiGizlenecekAlanlar = v as List<dynamic>?);
        $checkedConvert('cari_CariHareketleri',
            (v) => val.cariCariHareketleri = v as bool?);
        $checkedConvert(
            'cari_CariHar_Kaydet', (v) => val.cariCariHarKaydet = v as bool?);
        $checkedConvert(
            'cari_CariHar_Duzelt', (v) => val.cariCariHarDuzelt = v as bool?);
        $checkedConvert(
            'cari_CariHar_Sil', (v) => val.cariCariHarSil = v as bool?);
        $checkedConvert('cari_CariHareketleri_HarDetayGorsun',
            (v) => val.cariCariHareketleriHarDetayGorsun = v as bool?);
        $checkedConvert('stok_CariHar_PlasiyerKendiniGorsun',
            (v) => val.stokCariHarPlasiyerKendiniGorsun = v as bool?);
        $checkedConvert('cari_Aktivite', (v) => val.cariAktivite = v as bool?);
        $checkedConvert(
            'cari_Aktivite_Ekle', (v) => val.cariAktiviteEkle = v as bool?);
        $checkedConvert(
            'cari_Aktivite_Duzelt', (v) => val.cariAktiviteDuzelt = v as bool?);
        $checkedConvert(
            'cari_Aktivite_Sil', (v) => val.cariAktiviteSil = v as bool?);
        $checkedConvert('cari_Aktivite_Atayabilir',
            (v) => val.cariAktiviteAtayabilir = v as bool?);
        $checkedConvert('cari_Aktivite_BitirmeyiGeriAl',
            (v) => val.cariAktiviteBitirmeyiGeriAl = v as bool?);
        $checkedConvert('cari_OzelHesapKapatma',
            (v) => val.cariOzelHesapKapatma = v as bool?);
        $checkedConvert('cari_OzelHesapKapatma_Sil',
            (v) => val.cariOzelHesapKapatmaSil = v as bool?);
        $checkedConvert(
            'cari_VadeKontrolu', (v) => val.cariVadeKontrolu = v as bool?);
        $checkedConvert('cari_VadeKontrolu_Gun',
            (v) => val.cariVadeKontroluGun = v as int?);
        $checkedConvert(
            'cari_VadeKontrolu_BelgeTipleri',
            (v) => val.cariVadeKontroluBelgeTipleri =
                (v as List<dynamic>?)?.map((e) => e as String).toList());
        $checkedConvert('cari_Filtre', (v) => val.cariFiltre = v as String?);
        $checkedConvert(
            'cari_FiltreSQL', (v) => val.cariFiltreSQL = v as String?);
        $checkedConvert(
            'cari_FiltreSQLTipi', (v) => val.cariFiltreSQLTipi = v as String?);
        $checkedConvert('cari_Virman', (v) => val.cariVirman = v as bool?);
        $checkedConvert(
            'cari_Virman_Kaydet', (v) => val.cariVirmanKaydet = v as bool?);
        $checkedConvert('cari_Harita', (v) => val.cariHarita = v as bool?);
        $checkedConvert('cari_TeslimCari_RehberSadeceSecsin',
            (v) => val.cariTeslimCariRehberSadeceSecsin = v as String?);
        $checkedConvert(
            'cari_TeslimCari_SatisBaglanmisCarilerSecilsin',
            (v) =>
                val.cariTeslimCariSatisBaglanmisCarilerSecilsin = v as String?);
        $checkedConvert('cari_Raporlar', (v) => val.cariRaporlar = v as bool?);
        $checkedConvert(
            'cari_Rap_Ekstre', (v) => val.cariRapEkstre = v as bool?);
        $checkedConvert(
            'cari_Rap_StokEkstre', (v) => val.cariRapStokEkstre = v as bool?);
        $checkedConvert(
            'cari_Rap_Yaslandirma', (v) => val.cariRapYaslandirma = v as bool?);
        $checkedConvert('cari_Rap_HarDetayliYaslandir',
            (v) => val.cariRapHarDetayliYaslandir = v as bool?);
        $checkedConvert(
            'cari_Rap_DovizBakiye', (v) => val.cariRapDovizBakiye = v as bool?);
        $checkedConvert('cari_Rap_StokSatisOzeti',
            (v) => val.cariRapStokSatisOzeti = v as bool?);
        $checkedConvert('cari_Rap_DovizliEkstre',
            (v) => val.cariRapDovizliEkstre = v as bool?);
        $checkedConvert('tahsilat_Tahsilatlar',
            (v) => val.tahsilatTahsilatlar = v as bool?);
        $checkedConvert('tahsilat_NakitTahsilat',
            (v) => val.tahsilatNakitTahsilat = v as bool?);
        $checkedConvert('tahsilat_NakitTahsilat_Kaydet',
            (v) => val.tahsilatNakitTahsilatKaydet = v as bool?);
        $checkedConvert('tahsilat_KKartiTahsilat',
            (v) => val.tahsilatKKartiTahsilat = v as bool?);
        $checkedConvert('tahsilat_KKartiTahsilat_Kaydet',
            (v) => val.tahsilatKKartiTahsilatKaydet = v as bool?);
        $checkedConvert(
            'tahsilat_NakitOdeme', (v) => val.tahsilatNakitOdeme = v as bool?);
        $checkedConvert('tahsilat_NakitOdeme_Kaydet',
            (v) => val.tahsilatNakitOdemeKaydet = v as bool?);
        $checkedConvert('tahsilat_SenetTahsilat',
            (v) => val.tahsilatSenetTahsilat = v as bool?);
        $checkedConvert('tahsilat_SenetTahsilat_Kaydet',
            (v) => val.tahsilatSenetTahsilatKaydet = v as bool?);
        $checkedConvert('tahsilat_CekTahsilat',
            (v) => val.tahsilatCekTahsilat = v as bool?);
        $checkedConvert('tahsilat_CekTahsilat_Kaydet',
            (v) => val.tahsilatCekTahsilatKaydet = v as bool?);
        $checkedConvert('tahsilat_MuhtelifTahsilat',
            (v) => val.tahsilatMuhtelifTahsilat = v as bool?);
        $checkedConvert('tahsilat_MuhtelifOdeme',
            (v) => val.tahsilatMuhtelifOdeme = v as bool?);
        $checkedConvert('tahsilat_MuhtelifTahsilatFiltre',
            (v) => val.tahsilatMuhtelifTahsilatFiltre = v as String?);
        $checkedConvert('tahsilat_MuhtelifTahsilatFiltreSQL',
            (v) => val.tahsilatMuhtelifTahsilatFiltreSQL = v as String?);
        $checkedConvert('tahsilat_MuhtelifOdemeFiltre',
            (v) => val.tahsilatMuhtelifOdemeFiltre = v as String?);
        $checkedConvert('tahsilat_MuhtelifOdemeFiltreSQL',
            (v) => val.tahsilatMuhtelifOdemeFiltreSQL = v as String?);
        $checkedConvert('yonetici_Banka_Banka_Litesi',
            (v) => val.yoneticiBankaBankaLitesi = v as bool?);
        $checkedConvert('yonetici_Banka_Islemleri',
            (v) => val.yoneticiBankaIslemleri = v as bool?);
        $checkedConvert('yonetici_Banka_Islemleri_Sil',
            (v) => val.yoneticiBankaIslemleriSil = v as bool?);
        $checkedConvert('yonetici_Banka_Islem_HesapEFT',
            (v) => val.yoneticiBankaIslemHesapEFT = v as bool?);
        $checkedConvert('yonetici_Banka_Islem_HesapVirman',
            (v) => val.yoneticiBankaIslemHesapVirman = v as bool?);
        $checkedConvert('yonetici_Banka_Islem_CariEFT',
            (v) => val.yoneticiBankaIslemCariEFT = v as bool?);
        $checkedConvert('finans_Banka_Kasa_Transferi',
            (v) => val.finansBankaKasaTransferi = v as bool?);
        $checkedConvert(
            'finans_Kasa_Listesi', (v) => val.finansKasaListesi = v as bool?);
        $checkedConvert('finans_Kasa_Islemleri',
            (v) => val.finansKasaIslemleri = v as bool?);
        $checkedConvert('finans_Kasa_Islemleri_Sil',
            (v) => val.finansKasaIslemleriSil = v as bool?);
        $checkedConvert('finans_KasalarArasiTransfer',
            (v) => val.finansKasalarArasiTransfer = v as bool?);
        $checkedConvert('finans_Kasa_NakitTahsilat',
            (v) => val.finansKasaNakitTahsilat = v as bool?);
        $checkedConvert('finans_Kasa_NakitOdeme',
            (v) => val.finansKasaNakitOdeme = v as bool?);
        $checkedConvert('finans_Kasa_MuhtelifTahsilat',
            (v) => val.finansKasaMuhtelifTahsilat = v as bool?);
        $checkedConvert('finans_Kasa_MuhtelifOdeme',
            (v) => val.finansKasaMuhtelifOdeme = v as bool?);
        $checkedConvert('finans_Kasa_SenetTahsilati',
            (v) => val.finansKasaSenetTahsilati = v as bool?);
        $checkedConvert('finans_Kasa_SenetOdemesi',
            (v) => val.finansKasaSenetOdemesi = v as bool?);
        $checkedConvert('finans_Kasa_CekTahsilati',
            (v) => val.finansKasaCekTahsilati = v as bool?);
        $checkedConvert('finans_Kasa_CekOdemesi',
            (v) => val.finansKasaCekOdemesi = v as bool?);
        $checkedConvert(
            'dekont_Listesi', (v) => val.dekontListesi = v as bool?);
        $checkedConvert('dekont_Kaydet', (v) => val.dekontKaydet = v as bool?);
        $checkedConvert('dekont_Duzelt', (v) => val.dekontDuzelt = v as bool?);
        $checkedConvert('dekont_Sil', (v) => val.dekontSil = v as bool?);
        $checkedConvert('finans_Cek_GizlenecekAlanlar',
            (v) => val.finansCekGizlenecekAlanlar = v as List<dynamic>?);
        $checkedConvert(
            'finans_Cek_Musteri', (v) => val.finansCekMusteri = v as bool?);
        $checkedConvert(
            'finans_MCEK_Ekle', (v) => val.finansMCEKEkle = v as bool?);
        $checkedConvert(
            'finans_MCEK_Sil', (v) => val.finansMCEKSil = v as bool?);
        $checkedConvert('finans_MCEK_BelgeDetayi',
            (v) => val.finansMCEKBelgeDetayi = v as bool?);
        $checkedConvert('finans_MCEK_Hareketler',
            (v) => val.finansMCEKHareketler = v as bool?);
        $checkedConvert(
            'finans_MCEK_Evraklar', (v) => val.finansMCEKEvraklar = v as bool?);
        $checkedConvert('finans_MCEK_CariyeCiro',
            (v) => val.finansMCEKCariyeCiro = v as bool?);
        $checkedConvert('finans_MCEK_TahsileCiro',
            (v) => val.finansMCEKTahsileCiro = v as bool?);
        $checkedConvert('finans_MCEK_TahsilDekontu',
            (v) => val.finansMCEKTahsilDekontu = v as bool?);
        $checkedConvert(
            'finans_Cek_Borc', (v) => val.finansCekBorc = v as bool?);
        $checkedConvert(
            'finans_BorcCeki_Ekle', (v) => val.finansBorcCekiEkle = v as bool?);
        $checkedConvert(
            'finans_BorcCeki_Sil', (v) => val.finansBorcCekiSil = v as bool?);
        $checkedConvert('finans_BCEK_BelgeDetayi',
            (v) => val.finansBCEKBelgeDetayi = v as bool?);
        $checkedConvert('finans_BCEK_Hareketler',
            (v) => val.finansBCEKHareketler = v as bool?);
        $checkedConvert(
            'finans_BCEK_Evraklar', (v) => val.finansBCEKEvraklar = v as bool?);
        $checkedConvert('finans_BCEK_OdemeDekontu',
            (v) => val.finansBCEKOdemeDekontu = v as bool?);
        $checkedConvert(
            'finans_Senet_Musteri', (v) => val.finansSenetMusteri = v as bool?);
        $checkedConvert(
            'finans_MSEN_Ekle', (v) => val.finansMSENEkle = v as bool?);
        $checkedConvert(
            'finans_MSEN_Sil', (v) => val.finansMSENSil = v as bool?);
        $checkedConvert('finans_MSEN_BelgeDetayi',
            (v) => val.finansMSENBelgeDetayi = v as bool?);
        $checkedConvert('finans_MSEN_Hareketler',
            (v) => val.finansMSENHareketler = v as bool?);
        $checkedConvert(
            'finans_MSEN_Evraklar', (v) => val.finansMSENEvraklar = v as bool?);
        $checkedConvert('finans_MSEN_CariyeCiro',
            (v) => val.finansMSENCariyeCiro = v as bool?);
        $checkedConvert('finans_MSEN_TahsileCiro',
            (v) => val.finansMSENTahsileCiro = v as bool?);
        $checkedConvert('finans_MSEN_TahsilDekontu',
            (v) => val.finansMSENTahsilDekontu = v as bool?);
        $checkedConvert(
            'finans_Senet_Borc', (v) => val.finansSenetBorc = v as bool?);
        $checkedConvert(
            'finans_BSEN_Ekle', (v) => val.finansBSENEkle = v as bool?);
        $checkedConvert(
            'finans_BSEN_Sil', (v) => val.finansBSENSil = v as bool?);
        $checkedConvert('finans_BSEN_BelgeDetayi',
            (v) => val.finansBSENBelgeDetayi = v as bool?);
        $checkedConvert('finans_BSEN_Hareketler',
            (v) => val.finansBSENHareketler = v as bool?);
        $checkedConvert(
            'finans_BSEN_Evraklar', (v) => val.finansBSENEvraklar = v as bool?);
        $checkedConvert('finans_BSEN_OdemeDekontu',
            (v) => val.finansBSENOdemeDekontu = v as bool?);
        $checkedConvert('finans_KKartiTahsilati',
            (v) => val.finansKKartiTahsilati = v as bool?);
        $checkedConvert('finans_MuhtelifTahsilat',
            (v) => val.finansMuhtelifTahsilat = v as bool?);
        $checkedConvert('finans_MuhtelifOdeme',
            (v) => val.finansMuhtelifOdeme = v as bool?);
        $checkedConvert('finans_TahsilatKayitlari',
            (v) => val.finansTahsilatKayitlari = v as bool?);
        $checkedConvert('finans_HizliTahsilatKayitlari',
            (v) => val.finansHizliTahsilatKayitlari = v as bool?);
        $checkedConvert('finans_HizliTahsilatKayitlari_Sil',
            (v) => val.finansHizliTahsilatKayitlariSil = v as bool?);
        $checkedConvert('finans_OrtalamaVadeTarihiHesaplama',
            (v) => val.finansOrtalamaVadeTarihiHesaplama = v as bool?);
        $checkedConvert(
            'finans_OzetRapor', (v) => val.finansOzetRapor = v as bool?);
        $checkedConvert('finans_Raporlar_FinansalDurum',
            (v) => val.finansRaporlarFinansalDurum = v as bool?);
        $checkedConvert('finans_Raporlar_AylikMizan',
            (v) => val.finansRaporlarAylikMizan = v as bool?);
        $checkedConvert(
            'temsilci_Profil', (v) => val.temsilciProfil = v as bool?);
        $checkedConvert('temsilci_Profil_KdvDahil',
            (v) => val.temsilciProfilKdvDahil = v as bool?);
        $checkedConvert('temsilci_Profil_SatisPerformansiniGizle',
            (v) => val.temsilciProfilSatisPerformansiniGizle = v as bool?);
        $checkedConvert('temsilci_Profil_AylaraGoreSatisiGizle',
            (v) => val.temsilciProfilAylaraGoreSatisiGizle = v as bool?);
        $checkedConvert('temsilci_Profil_AylaraGoreTahsilatiGizle',
            (v) => val.temsilciProfilAylaraGoreTahsilatiGizle = v as bool?);
        $checkedConvert('yazdirma_BluetoothYaziciKullanabilir',
            (v) => val.yazdirmaBluetoothYaziciKullanabilir = v as bool?);
        $checkedConvert('yazdirma_Hucre_Etiketi',
            (v) => val.yazdirmaHucreEtiketi = v as bool?);
        $checkedConvert(
            'yazdirma_Hucre_Etiketi_Yazicilari',
            (v) => val.yazdirmaHucreEtiketiYazicilari =
                (v as List<dynamic>?)?.map((e) => e as String).toList());
        $checkedConvert('yazdirma_Dizayn_HucreEtiketi',
            (v) => val.yazdirmaDizaynHucreEtiketi = v as List<dynamic>?);
        $checkedConvert('yazdirma_MalToplama_Etiketi',
            (v) => val.yazdirmaMalToplamaEtiketi = v as bool?);
        $checkedConvert(
            'yazdirma_Mal_Toplama_Yazicilari',
            (v) => val.yazdirmaMalToplamaYazicilari =
                (v as List<dynamic>?)?.map((e) => e as String).toList());
        $checkedConvert('yazdirma_Dizayn_MalToplama',
            (v) => val.yazdirmaDizaynMalToplama = v as List<dynamic>?);
        $checkedConvert('yazdirma_MalKontrol_Etiketi',
            (v) => val.yazdirmaMalKontrolEtiketi = v as bool?);
        $checkedConvert(
            'yazdirma_Mal_Kontrol_Yazicilari',
            (v) => val.yazdirmaMalKontrolYazicilari =
                (v as List<dynamic>?)?.map((e) => e as String).toList());
        $checkedConvert('yazdirma_Dizayn_MalKontrol',
            (v) => val.yazdirmaDizaynMalKontrol = v as List<dynamic>?);
        $checkedConvert('yazdirma_DAT', (v) => val.yazdirmaDAT = v as bool?);
        $checkedConvert(
            'yazdirma_DAT_Yazicilari',
            (v) => val.yazdirmaDATYazicilari =
                (v as List<dynamic>?)?.map((e) => e as String).toList());
        $checkedConvert(
            'yazdirma_Dizayn_DAT',
            (v) => val.yazdirmaDizaynDAT =
                (v as List<dynamic>?)?.map((e) => e as int).toList());
        $checkedConvert('yazdirma_Paketleme_Etiketi',
            (v) => val.yazdirmaPaketlemeEtiketi = v as bool?);
        $checkedConvert('yazdirma_Paketleme_KopyaSayisiGizle',
            (v) => val.yazdirmaPaketlemeKopyaSayisiGizle = v as bool?);
        $checkedConvert(
            'yazdirma_Paketleme_Yazicilari',
            (v) => val.yazdirmaPaketlemeYazicilari =
                (v as List<dynamic>?)?.map((e) => e as String).toList());
        $checkedConvert(
            'yazdirma_Dizayn_Paketleme',
            (v) => val.yazdirmaDizaynPaketleme =
                (v as List<dynamic>?)?.map((e) => e as int).toList());
        $checkedConvert(
            'yazdirma_SatisIrs', (v) => val.yazdirmaSatisIrs = v as bool?);
        $checkedConvert(
            'yazdirma_SatisFat', (v) => val.yazdirmaSatisFat = v as bool?);
        $checkedConvert(
            'yazdirma_SatisFat_Yazicilari',
            (v) => val.yazdirmaSatisFatYazicilari =
                (v as List<dynamic>?)?.map((e) => e as String).toList());
        $checkedConvert(
            'yazdirma_Dizayn_SatisFat',
            (v) => val.yazdirmaDizaynSatisFat =
                (v as List<dynamic>?)?.map((e) => e as int).toList());
        $checkedConvert(
            'yazdirma_AlisFat', (v) => val.yazdirmaAlisFat = v as bool?);
        $checkedConvert('yazdirma_Dizayn_AlisFat',
            (v) => val.yazdirmaDizaynAlisFat = v as List<dynamic>?);
        $checkedConvert(
            'yazdirma_Mustahsil', (v) => val.yazdirmaMustahsil = v as bool?);
        $checkedConvert(
            'yazdirma_MusSip', (v) => val.yazdirmaMusSip = v as bool?);
        $checkedConvert('yazdirma_MusSip_Yazicilari',
            (v) => val.yazdirmaMusSipYazicilari = v as List<dynamic>?);
        $checkedConvert(
            'yazdirma_Dizayn_MusSip',
            (v) => val.yazdirmaDizaynMusSip =
                (v as List<dynamic>?)?.map((e) => e as int).toList());
        $checkedConvert(
            'yazdirma_SaticiSip', (v) => val.yazdirmaSaticiSip = v as bool?);
        $checkedConvert(
            'yazdirma_Dizayn_SaticiSip',
            (v) => val.yazdirmaDizaynSaticiSip =
                (v as List<dynamic>?)?.map((e) => e as int).toList());
        $checkedConvert('yazdirma_ATAL', (v) => val.yazdirmaATAL = v as bool?);
        $checkedConvert(
            'yazdirma_ATAL_Yazicilari',
            (v) => val.yazdirmaATALYazicilari =
                (v as List<dynamic>?)?.map((e) => e as String).toList());
        $checkedConvert(
            'yazdirma_Dizayn_ATAL',
            (v) => val.yazdirmaDizaynATAL =
                (v as List<dynamic>?)?.map((e) => e as int).toList());
        $checkedConvert('yazdirma_OdemeMakbuzu',
            (v) => val.yazdirmaOdemeMakbuzu = v as bool?);
        $checkedConvert('yazdirma_OdemeMakbuzu_Yazicilari',
            (v) => val.yazdirmaOdemeMakbuzuYazicilari = v as List<dynamic>?);
        $checkedConvert(
            'yazdirma_Dizayn_OdemeMakbuzu',
            (v) => val.yazdirmaDizaynOdemeMakbuzu =
                (v as List<dynamic>?)?.map((e) => e as int).toList());
        $checkedConvert(
            'yazdirma_AlisIrs', (v) => val.yazdirmaAlisIrs = v as bool?);
        $checkedConvert(
            'yazdirma_AlisIrs_Yazicilari',
            (v) => val.yazdirmaAlisIrsYazicilari =
                (v as List<dynamic>?)?.map((e) => e as String).toList());
        $checkedConvert(
            'yazdirma_Dizayn_AlisIrs',
            (v) => val.yazdirmaDizaynAlisIrs =
                (v as List<dynamic>?)?.map((e) => e as int).toList());
        $checkedConvert(
            'yazdirma_IsEmri', (v) => val.yazdirmaIsEmri = v as bool?);
        $checkedConvert(
            'yazdirma_AmbarCikis', (v) => val.yazdirmaAmbarCikis = v as bool?);
        $checkedConvert(
            'yazdirma_AmbarGiris', (v) => val.yazdirmaAmbarGiris = v as bool?);
        $checkedConvert('yazdirma_CariHareket',
            (v) => val.yazdirmaCariHareket = v as bool?);
        $checkedConvert('uretim_FiyatGorebilir',
            (v) => val.uretimFiyatGorebilir = v as bool?);
        $checkedConvert('uretim_USK', (v) => val.uretimUSK = v as bool?);
        $checkedConvert(
            'uretim_USK_Kaydet', (v) => val.uretimUSKKaydet = v as bool?);
        $checkedConvert(
            'uretim_USK_Duzelt', (v) => val.uretimUSKDuzelt = v as bool?);
        $checkedConvert('uretim_USK_Sil', (v) => val.uretimUSKSil = v as bool?);
        $checkedConvert('uretim_USK_KacGunlukKayitlarListelensin',
            (v) => val.uretimUSKKacGunlukKayitlarListelensin = v as int?);
        $checkedConvert('uretim_USK_MiktarBarkoddan',
            (v) => val.uretimUSKMiktarBarkoddan = v as bool?);
        $checkedConvert('uretim_USK_Miktar1Gelsin',
            (v) => val.uretimUSKMiktar1Gelsin = v as bool?);
        $checkedConvert('sirket_Depo_Uretim_Giris',
            (v) => val.sirketDepoUretimGiris = v as int?);
        $checkedConvert('sirket_Depo_Uretim_Cikis',
            (v) => val.sirketDepoUretimCikis = v as int?);
        $checkedConvert('uretim_USK_IsEmriOtoGelsin',
            (v) => val.uretimUSKIsEmriOtoGelsin = v as bool?);
        $checkedConvert('uretim_USK_SoruSorulmasin',
            (v) => val.uretimUSKSoruSorulmasin = v as bool?);
        $checkedConvert('uretim_USK_StokRehberiAcilmasin',
            (v) => val.uretimUSKStokRehberiAcilmasin = v as bool?);
        $checkedConvert('uretim_USK_KlavyeEngelle',
            (v) => val.uretimUSKKlavyeEngelle = v as bool?);
        $checkedConvert('uretim_USK_DepoOnceligi',
            (v) => val.uretimUSKDepoOnceligi = v as String?);
        $checkedConvert('uretim_USK_FisiErpUretsin',
            (v) => val.uretimUSKFisiErpUretsin = v as bool?);
        $checkedConvert('uretim_USK_GizlenecekAlanlar',
            (v) => val.uretimUSKGizlenecekAlanlar = v as List<dynamic>?);
        $checkedConvert('uretim_USK_BosGecilmeyecekAlanlar',
            (v) => val.uretimUSKBosGecilmeyecekAlanlar = v as List<dynamic>?);
        $checkedConvert('uretim_USK_DegismeyecekAlanlar',
            (v) => val.uretimUSKDegismeyecekAlanlar = v as List<dynamic>?);
        $checkedConvert('uretim_USK_OlcuBirimi',
            (v) => val.uretimUSKOlcuBirimi = v as int?);
        $checkedConvert('uretim_USK_OtoYazdir',
            (v) => val.uretimUSKOtoYazdir = v as String?);
        $checkedConvert('uretim_USK_KalemliYapi',
            (v) => val.uretimUSKKalemliYapi = v as bool?);
        $checkedConvert('uretim_USK_KalemliYapi_StokMevcutaEklensin',
            (v) => val.uretimUSKKalemliYapiStokMevcutaEklensin = v as bool?);
        $checkedConvert('uretim_USK_KalemliYapi_OtoEtiketYazdir',
            (v) => val.uretimUSKKalemliYapiOtoEtiketYazdir = v as bool?);
        $checkedConvert('uretim_USK_KalemliYapi_AyniBarkodOkutulamaz',
            (v) => val.uretimUSKKalemliYapiAyniBarkodOkutulamaz = v as bool?);
        $checkedConvert('uretim_USK_KalemliYapi_OkutulanEnUsteEklensin',
            (v) => val.uretimUSKKalemliYapiOkutulanEnUsteEklensin = v as bool?);
        $checkedConvert('uretim_USK_KalemliYapi_KalemDuzeltilemesin',
            (v) => val.uretimUSKKalemliYapiKalemDuzeltilemesin = v as bool?);
        $checkedConvert(
            'uretim_ReceteIzleme', (v) => val.uretimReceteIzleme = v as bool?);
        $checkedConvert(
            'uretim_MalToplama', (v) => val.uretimMalToplama = v as bool?);
        $checkedConvert('uretim_MalToplama_Ekle',
            (v) => val.uretimMalToplamaEkle = v as bool?);
        $checkedConvert('uretim_MalToplama_Sil',
            (v) => val.uretimMalToplamaSil = v as bool?);
        $checkedConvert('uretim_MalToplama_KlavyeEngelle',
            (v) => val.uretimMalToplamaKlavyeEngelle = v as bool?);
        $checkedConvert('uretim_MalToplama_BarkodOkutsun',
            (v) => val.uretimMalToplamaBarkodOkutsun = v as bool?);
        $checkedConvert(
            'uretim_MalToplama_BelgeTipleri',
            (v) => val.uretimMalToplamaBelgeTipleri =
                (v as List<dynamic>?)?.map((e) => e as String).toList());
        $checkedConvert('uretim_MalToplama_ReceteFiltresi',
            (v) => val.uretimMalToplamaReceteFiltresi = v as String?);
        $checkedConvert('uretim_MalToplama_ReceteFiltresiSQL',
            (v) => val.uretimMalToplamaReceteFiltresiSQL = v as String?);
        $checkedConvert('uretim_IsEmri', (v) => val.uretimIsEmri = v as bool?);
        $checkedConvert(
            'uretim_IsEmri_Ekle', (v) => val.uretimIsEmriEkle = v as bool?);
        $checkedConvert(
            'uretim_IsEmri_Duzelt', (v) => val.uretimIsEmriDuzelt = v as bool?);
        $checkedConvert(
            'uretim_IsEmri_Sil', (v) => val.uretimIsEmriSil = v as bool?);
        $checkedConvert('taltek_STEK', (v) => val.taltekSTEK = v as bool?);
        $checkedConvert(
            'taltek_STEK_Kaydet', (v) => val.taltekSTEKKaydet = v as bool?);
        $checkedConvert(
            'taltek_STEK_Duzelt', (v) => val.taltekSTEKDuzelt = v as bool?);
        $checkedConvert(
            'taltek_STEK_Sil', (v) => val.taltekSTEKSil = v as bool?);
        $checkedConvert('taltek_STEK_KapalilarListenlenmesin',
            (v) => val.taltekSTEKKapalilarListenlenmesin = v as bool?);
        $checkedConvert('taltek_STEK_OnayIslemleri',
            (v) => val.taltekSTEKOnayIslemleri = v as bool?);
        $checkedConvert('taltek_STEK_CariKoduDegistir',
            (v) => val.taltekSTEKCariKoduDegistir = v as bool?);
        $checkedConvert('taltek_STEK_FiyatDegistirilmesin',
            (v) => val.taltekSTEKFiyatDegistirilmesin = v as bool?);
        $checkedConvert('taltek_STEK_Aciklamalar_YetkiTuru',
            (v) => val.taltekSTEKAciklamalarYetkiTuru = v as String?);
        $checkedConvert('taltek_STEK_GizlenecekAlanlar',
            (v) => val.taltekSTEKGizlenecekAlanlar = v as List<dynamic>?);
        $checkedConvert('taltek_STEK_DegismeyecekAlanlar',
            (v) => val.taltekSTEKDegismeyecekAlanlar = v as List<dynamic>?);
        $checkedConvert('taltek_STEK_BosGecilmeyecekAlanlar',
            (v) => val.taltekSTEKBosGecilmeyecekAlanlar = v as List<dynamic>?);
        $checkedConvert(
            'taltek_STEK_AciklamaAlanlari',
            (v) => val.taltekSTEKAciklamaAlanlari =
                (v as List<dynamic>?)?.map((e) => e as int).toList());
        $checkedConvert('taltek_STEK_OzelKod1Degeri',
            (v) => val.taltekSTEKOzelKod1Degeri = v as String?);
        $checkedConvert('taltek_STEK_DipFiyatUygulamasi',
            (v) => val.taltekSTEKDipFiyatUygulamasi = v as bool?);
        $checkedConvert('taltek_STEK_DipFiyatSaha',
            (v) => val.taltekSTEKDipFiyatSaha = v as String?);
        $checkedConvert('taltek_STEK_DipFiyatEylem',
            (v) => val.taltekSTEKDipFiyatEylem = v as String?);
        $checkedConvert('taltek_ATAL', (v) => val.taltekATAL = v as bool?);
        $checkedConvert(
            'taltek_ATAL_Kaydet', (v) => val.taltekATALKaydet = v as bool?);
        $checkedConvert(
            'taltek_ATAL_Duzelt', (v) => val.taltekATALDuzelt = v as bool?);
        $checkedConvert(
            'taltek_ATAL_Sil', (v) => val.taltekATALSil = v as bool?);
        $checkedConvert('taltek_ATAL_CariEMailAlani',
            (v) => val.taltekATALCariEMailAlani = v as String?);
        $checkedConvert('taltek_ATAL_OnayIslemleri',
            (v) => val.taltekATALOnayIslemleri = v as bool?);
        $checkedConvert('taltek_ATAL_CariKoduDegistir',
            (v) => val.taltekATALCariKoduDegistir = v as bool?);
        $checkedConvert('taltek_ATAL_Aciklamalar_YetkiTuru',
            (v) => val.taltekATALAciklamalarYetkiTuru = v as String?);
        $checkedConvert(
            'taltek_ATAL_GizlenecekAlanlar',
            (v) => val.taltekATALGizlenecekAlanlar =
                (v as List<dynamic>?)?.map((e) => e as String).toList());
        $checkedConvert(
            'taltek_ATAL_AciklamaAlanlari',
            (v) => val.taltekATALAciklamaAlanlari =
                (v as List<dynamic>?)?.map((e) => e as int).toList());
        $checkedConvert('taltek_ATAL_BelgeKopyala',
            (v) => val.taltekATALBelgeKopyala = v as bool?);
        $checkedConvert('taltek_STAL', (v) => val.taltekSTAL = v as bool?);
        $checkedConvert(
            'taltek_STAL_Kaydet', (v) => val.taltekSTALKaydet = v as bool?);
        $checkedConvert(
            'taltek_STAL_Duzelt', (v) => val.taltekSTALDuzelt = v as bool?);
        $checkedConvert(
            'taltek_STAL_Sil', (v) => val.taltekSTALSil = v as bool?);
        $checkedConvert('taltek_STAL_KapalilarListenlenmesin',
            (v) => val.taltekSTALKapalilarListenlenmesin = v as bool?);
        $checkedConvert('taltek_STAL_OnayIslemleri',
            (v) => val.taltekSTALOnayIslemleri = v as bool?);
        $checkedConvert('taltek_STAL_CariKoduDegistir',
            (v) => val.taltekSTALCariKoduDegistir = v as bool?);
        $checkedConvert('taltek_STAL_FiyatDegistirilmesin',
            (v) => val.taltekSTALFiyatDegistirilmesin = v as bool?);
        $checkedConvert(
            'taltek_STAL_GizlenecekAlanlar',
            (v) => val.taltekSTALGizlenecekAlanlar =
                (v as List<dynamic>?)?.map((e) => e as String).toList());
        $checkedConvert('taltek_STAL_DipFiyatUygulamasi',
            (v) => val.taltekSTALDipFiyatUygulamasi = v as bool?);
        $checkedConvert('ebelge_EFat', (v) => val.ebelgeEFat = v as bool?);
        $checkedConvert('ebelge_EFatCariGuncelle',
            (v) => val.ebelgeEFatCariGuncelle = v as bool?);
        $checkedConvert(
            'ebelge_EFatSorgula', (v) => val.ebelgeEFatSorgula = v as bool?);
        $checkedConvert('ebelge_EFatGelenKutusu',
            (v) => val.ebelgeEFatGelenKutusu = v as bool?);
        $checkedConvert('ebelge_EFatTaslakOlustur',
            (v) => val.ebelgeEFatTaslakOlustur = v as bool?);
        $checkedConvert('ebelge_EFatTaslakSil',
            (v) => val.ebelgeEFatTaslakSil = v as bool?);
        $checkedConvert('ebelge_EFatTaslakBasim',
            (v) => val.ebelgeEFatTaslakBasim = v as bool?);
        $checkedConvert('ebelge_EFatGoruntule',
            (v) => val.ebelgeEFatGoruntule = v as bool?);
        $checkedConvert('ebelge_EFatAlisFatOlustur',
            (v) => val.ebelgeEFatAlisFatOlustur = v as bool?);
        $checkedConvert(
            'ebelge_EFatGonder', (v) => val.ebelgeEFatGonder = v as bool?);
        $checkedConvert(
            'ebelge_EFat_Dizayn', (v) => val.ebelgeEFatDizayn = v as int?);
        $checkedConvert('ebelge_EArsiv', (v) => val.ebelgeEArsiv = v as bool?);
        $checkedConvert('ebelge_EArsivTaslakOlustur',
            (v) => val.ebelgeEArsivTaslakOlustur = v as bool?);
        $checkedConvert('ebelge_EArsivTaslakSil',
            (v) => val.ebelgeEArsivTaslakSil = v as bool?);
        $checkedConvert('ebelge_EArsivTaslakBasim',
            (v) => val.ebelgeEArsivTaslakBasim = v as bool?);
        $checkedConvert('ebelge_EArsivGoruntule',
            (v) => val.ebelgeEArsivGoruntule = v as bool?);
        $checkedConvert('ebelge_EArsivSorgula',
            (v) => val.ebelgeEArsivSorgula = v as bool?);
        $checkedConvert(
            'ebelge_EArsivGonder', (v) => val.ebelgeEArsivGonder = v as bool?);
        $checkedConvert(
            'ebelge_EArsiv_Dizayn', (v) => val.ebelgeEArsivDizayn = v as int?);
        $checkedConvert(
            'ebelge_EIrsaliye', (v) => val.ebelgeEIrsaliye = v as bool?);
        $checkedConvert('ebelge_EIrsaliyeGidenKutusu',
            (v) => val.ebelgeEIrsaliyeGidenKutusu = v as bool?);
        $checkedConvert('ebelge_EIrsaliyeGelenKutusu',
            (v) => val.ebelgeEIrsaliyeGelenKutusu = v as bool?);
        $checkedConvert('ebelge_EIrsaliyeTaslakOlustur',
            (v) => val.ebelgeEIrsaliyeTaslakOlustur = v as bool?);
        $checkedConvert('ebelge_EIrsaliyeTaslakSil',
            (v) => val.ebelgeEIrsaliyeTaslakSil = v as bool?);
        $checkedConvert('ebelge_EIrsaliyeTaslakBasim',
            (v) => val.ebelgeEIrsaliyeTaslakBasim = v as bool?);
        $checkedConvert('ebelge_EIrsaliyeGonder',
            (v) => val.ebelgeEIrsaliyeGonder = v as bool?);
        $checkedConvert('ebelge_EIrsaliyeGoruntule',
            (v) => val.ebelgeEIrsaliyeGoruntule = v as bool?);
        $checkedConvert('ebelge_EIrsaliye_Dizayn',
            (v) => val.ebelgeEIrsaliyeDizayn = v as int?);
        $checkedConvert('entegrasyon_UETDSESYA',
            (v) => val.entegrasyonUETDSESYA = v as bool?);
        $checkedConvert('entegrasyon_UETDSESYA_Iptal',
            (v) => val.entegrasyonUETDSESYAIptal = v as bool?);
        return val;
      },
      fieldKeyMap: const {
        'yazdirmaSatisIrsYazicilari': 'yazdirma_SatisIrs_Yazicilari',
        'yazdirmaDizaynSatisIrs': 'yazdirma_Dizayn_SatisIrs',
        'yazdirmaSatisTalebi': 'yazdirma_SatisTalebi',
        'yazdirmaSatisTalebiYazicilari': 'yazdirma_SatisTalebi_Yazicilari',
        'yazdirmaDizaynSatisTalebi': 'yazdirma_Dizayn_SatisTalebi',
        'yazdirmaSatisTeklifi': 'yazdirma_SatisTeklifi',
        'yazdirmaDizaynSatisTeklifi': 'yazdirma_Dizayn_SatisTeklifi',
        'yazdirmaSayim': 'yazdirma_Sayim',
        'yazdirmaSayimYazicilari': 'yazdirma_Sayim_Yazicilari',
        'yazdirmaDizaynSayim': 'yazdirma_Dizayn_Sayim',
        'yazdirmaSevkiyatEtiketi': 'yazdirma_Sevkiyat_Etiketi',
        'yazdirmaSevkiyatEtiketiYazicilari':
            'yazdirma_Sevkiyat_Etiketi_Yazicilari',
        'yazdirmaDizaynSevkiyatEtiketi': 'yazdirma_Dizayn_SevkiyatEtiketi',
        'yazdirmaSevkiyatEtiketiKopyaSayisiGizle':
            'yazdirma_Sevkiyat_Etiketi_KopyaSayisiGizle',
        'yazdirmaSerbest': 'yazdirma_Serbest',
        'yazdirmaSerbestYazicilari': 'yazdirma_Serbest_Yazicilari',
        'yazdirmaDizaynSerbest': 'yazdirma_Dizayn_Serbest',
        'yazdirmaSeriEtiketi': 'yazdirma_SeriEtiketi',
        'yazdirmaSeriEtiketiYazicilari': 'yazdirma_Seri_Etiketi_Yazicilari',
        'yazdirmaDizaynSeriEtiketi': 'yazdirma_Dizayn_SeriEtiketi',
        'yazdirmaStokEtiketi': 'yazdirma_Stok_Etiketi',
        'yazdirmaStokEtiketiYazicilari': 'yazdirma_Stok_Etiketi_Yazicilari',
        'yazdirmaDizaynStokEtiketi': 'yazdirma_Dizayn_StokEtiketi',
        'yazdirmaTahsilatMakbuzu': 'yazdirma_TahsilatMakbuzu',
        'yazdirmaDizaynTahsilatMakbuzu': 'yazdirma_Dizayn_TahsilatMakbuzu',
        'yazdirmaUSK': 'yazdirma_USK',
        'yazdirmaUSKYazicilari': 'yazdirma_USK_Yazicilari',
        'yazdirmaDizaynUSK': 'yazdirma_Dizayn_USK',
        'yazdirmaUretMalTop': 'yazdirma_UretMalTop',
        'yazdirmaUretMalTopYazicilari': 'yazdirma_UretMalTop_Yazicilari',
        'yazdirmaDizaynUretMalTop': 'yazdirma_Dizayn_UretMalTop',
        'sirketTamEkranAcilsin': 'sirket_TamEkranAcilsin',
        'sirketRehberdeCariKodGizle': 'sirket_RehberdeCariKodGizle',
        'sirketRehberdeStokKodGizle': 'sirket_RehberdeStokKodGizle',
        'sirketRaporlardaFiyatGizle': 'sirket_RaporlardaFiyatGizle',
        'sirketTarihDegismesin': 'sirket_TarihDegismesin',
        'sirketDevirSirketineGiris': 'sirket_DevirSirketineGiris',
        'sirketKontrolluAktarBelgeTipleri':
            'sirket_KontrolluAktar_BelgeTipleri',
        'sirketKontrolluAktarBelgeNoGoster':
            'sirket_KontrolluAktar_BelgeNoGoster',
        'sirketKontrolAciklamasiBelgeTipleri':
            'sirket_KontrolAciklamasi_BelgeTipleri',
        'sirketTLFiyatGelsinBelgeTipleri': 'sirket_TLFiyatGelsin_BelgeTipleri',
        'sirketKalemKayitKontrolBelgeTipleri':
            'sirket_KalemKayitKontrol_BelgeTipleri',
        'sirketAktifDepolar': 'sirket_aktifDepolar',
        'sirketSatisDepo': 'sirket_satisDepo',
        'sirketSatisDepoOzellestir': 'sirket_satisDepo_Ozellestir',
        'sirketSatisDepoMusSip': 'sirket_satisDepo_MusSip',
        'sirketSatisDepoSatisFat': 'sirket_satisDepo_SatisFat',
        'sirketSatisDepoSatisIrs': 'sirket_satisDepo_SatisIrs',
        'sirketAlisDepo': 'sirket_alisDepo',
        'sirketIadeDepo': 'sirket_iadeDepo',
        'sirketProjeKodu': 'sirket_projeKodu',
        'sirketAktifProjeler': 'sirket_aktifProjeler',
        'ayarlarFirmaAyarlari': 'ayarlar_FirmaAyarlari',
        'ayarlarOturumlar': 'ayarlar_Oturumlar',
        'sirketSifreHatirlamaDurumu': 'sirket_SifreHatirlamaDurumu',
        'genelDovizKurlari': 'genel_DovizKurlari',
        'genelDovizKurlariEkle': 'genel_DovizKurlari_Ekle',
        'genelDovizKurlariDuzelt': 'genel_DovizKurlari_Duzelt',
        'genelDovizKurlariSil': 'genel_DovizKurlari_Sil',
        'genelBelgeKontrol': 'genel_BelgeKontrol',
        'genelBelgeKontrolEkle': 'genel_BelgeKontrol_Ekle',
        'genelBelgeKontrolSil': 'genel_BelgeKontrol_Sil',
        'genelBelgeKontrolBelgeTipleri': 'genel_BelgeKontrol_BelgeTipleri',
        'genelBelgeKontrolBarkodOkutsun': 'genel_BelgeKontrol_BarkodOkutsun',
        'genelBelgeKontrolMiktarOtomatikGelsin':
            'genel_BelgeKontrol_MiktarOtomatikGelsin',
        'genelBelgeKontrolKalemDetaySorulmasin':
            'genel_BelgeKontrol_KalemDetaySorulmasin',
        'genelBelgeKontrolBelgeOnaySormasin':
            'genel_BelgeKontrol_BelgeOnaySormasin',
        'malKabulFiyatDegistirilmesin': 'malKabul_FiyatDegistirilmesin',
        'malKabulAlisIrsBelgeTipleri': 'malKabul_AlisIrs_BelgeTipleri',
        'malKabulAlisIrsGizlenecekAlanlar':
            'malKabul_AlisIrs_GizlenecekAlanlar',
        'malKabulAlisIrsAciklamaAlanlari': 'malKabul_AlisIrs_AciklamaAlanlari',
        'malKabulSatinAlma': 'malKabul_SatinAlma',
        'malKabulSatinAlmaKaydet': 'malKabul_SatinAlma_Kaydet',
        'malKabulSatinAlmaDuzelt': 'malKabul_SatinAlma_Duzelt',
        'malKabulSatinAlmaSil': 'malKabul_SatinAlma_Sil',
        'malKabulAlisIrsaliyesiFiyatGor': 'malKabul_AlisIrsaliyesiFiyatGor',
        'malKabulAlisIrsDigerSekmesiGoster':
            'malKabul_AlisIrs_DigerSekmesiGoster',
        'malKabulAlisIrsSipBagSecenegi': 'malKabul_AlisIrs_SipBagSecenegi',
        'malKabulAlisIrsReferansStokUygulamasi':
            'malKabul_AlisIrs_ReferansStokUygulamasi',
        'malKabulAlisIrsSipBagSipHariciKalemEklenebilir':
            'malKabul_AlisIrs_SipBag_SipHariciKalemEklenebilir',
        'malKabulAlisIrsSipBagFazlaTeslimatYapilabilir':
            'malKabul_AlisIrs_SipBag_FazlaTeslimatYapilabilir',
        'malKabulAlisIrsSipBagSipOkutulsun':
            'malKabul_AlisIrs_SipBag_SipOkutulsun',
        'malKabulAlisIrsSipBagCokluSecim': 'malKabul_AlisIrs_SipBag_CokluSecim',
        'malKabulAlisIrsSipBagTumKalemlerSecilsin':
            'malKabul_AlisIrs_SipBag_TumKalemlerSecilsin',
        'malKabulAlisIrsSipBagEslesmeDurumu':
            'malKabul_AlisIrs_SipBag_EslesmeDurumu',
        'malKabulAlisIrsBarkodluGiris': 'malKabul_AlisIrs_BarkodluGiris',
        'malKabulAlisIrsMiktarOtomatikGelsin':
            'malKabul_AlisIrs_MiktarOtomatikGelsin',
        'malKabulAlisIrsKalemDetaySorulmasin':
            'malKabul_AlisIrs_KalemDetaySorulmasin',
        'malKabulAlisIrsKalemlerBirlestirilsin':
            'malKabul_AlisIrs_KalemlerBirlestirilsin',
        'malKabulAlisIrsStokRehberiAcilmasin':
            'malKabul_AlisIrs_StokRehberiAcilmasin',
        'malKabulAlisIrsKalemDuzeltilemesin':
            'malKabul_AlisIrs_KalemDuzeltilemesin',
        'malKabulAlisIrsTekrarEdenBarkod': 'malKabul_AlisIrs_TekrarEdenBarkod',
        'malKabulAlisIrsKlavyeEngelle': 'malKabul_AlisIrs_KlavyeEngelle',
        'malKabulAlisIrsMiktar1Gelsin': 'malKabul_AlisIrs_Miktar1Gelsin',
        'malKabulAlisIrsRaporlar': 'malKabul_AlisIrs_Raporlar',
        'malKabulAlisIrsKalemRaporu': 'malKabul_AlisIrs_KalemRaporu',
        'malKabulAlisIrsOtoBasimYap': 'malKabul_AlisIrs_OtoBasimYap',
        'malKabulAlisIrsKacGunlukKayitlarListelensin':
            'malKabul_AlisIrs_KacGunlukKayitlarListelensin',
        'malKabulAlisIrsFiyatSirasi': 'malKabul_AlisIrs_FiyatSirasi',
        'malKabulAlisIrsBirim1denKaydet': 'malKabul_AlisIrs_Birim1denKaydet',
        'malKabulAlisIrsCariKoduDegistir': 'malKabul_AlisIrs_CariKoduDegistir',
        'malKabulAlisIrsCariRehPlaEslesmesin':
            'malKabul_AlisIrs_CariRehPlaEslesmesin',
        'malKabulIade': 'malKabul_Iade',
        'malKabulIadeKaydet': 'malKabul_Iade_Kaydet',
        'malKabulIadeDuzelt': 'malKabul_Iade_Duzelt',
        'malKabulIadeSil': 'malKabul_Iade_Sil',
        'malKabulAlisFaturasiBelgeTipleri':
            'malKabul_AlisFaturasi_BelgeTipleri',
        'malKabulAlisFaturasi': 'malKabul_AlisFaturasi',
        'malKabulAlisFaturasiKaydet': 'malKabul_AlisFaturasi_Kaydet',
        'malKabulAlisFaturasiDuzelt': 'malKabul_AlisFaturasi_Duzelt',
        'malKabulAlisFaturasiSil': 'malKabul_AlisFaturasi_Sil',
        'malKabulAlisFatDigerSekmesiGoster':
            'malKabul_AlisFat_DigerSekmesiGoster',
        'malKabulAlisFatKacGunlukKayitlarListelensin':
            'malKabul_AlisFat_KacGunlukKayitlarListelensin',
        'malKabulAlisFatFiyatSirasi': 'malKabul_AlisFat_FiyatSirasi',
        'malKabulAlisFatBirim1denKaydet': 'malKabul_AlisFat_Birim1denKaydet',
        'malKabulAlisFatAciklamalarYetkiTuru':
            'malKabul_AlisFat_Aciklamalar_YetkiTuru',
        'malKabulAlisFatAciklamaAlanlari': 'malKabul_AlisFat_AciklamaAlanlari',
        'malKabulAlisFatCariKoduDegistir': 'malKabul_AlisFat_CariKoduDegistir',
        'malKabulAlisFatBarkodluGiris': 'malKabul_AlisFat_BarkodluGiris',
        'malKabulAlisFatMiktarOtomatikGelsin':
            'malKabul_AlisFat_MiktarOtomatikGelsin',
        'malKabulAlisFatKalemDetaySorulmasin':
            'malKabul_AlisFat_KalemDetaySorulmasin',
        'malKabulAlisFatStokRehberiAcilmasin':
            'malKabul_AlisFat_StokRehberiAcilmasin',
        'malKabulAlisFatKalemDuzeltilemesin':
            'malKabul_AlisFat_KalemDuzeltilemesin',
        'malKabulAlisFatKlavyeEngelle': 'malKabul_AlisFat_KlavyeEngelle',
        'malKabulAlisFatMiktar1Gelsin': 'malKabul_AlisFat_Miktar1Gelsin',
        'malKabulAlisFatReferansStokUygulamasi':
            'malKabul_AlisFat_ReferansStokUygulamasi',
        'malKabulAlisFatSipBagSipHariciKalemEklenebilir':
            'malKabul_AlisFat_SipBag_SipHariciKalemEklenebilir',
        'malKabulAlisFatSipBagFazlaTeslimatYapilabilir':
            'malKabul_AlisFat_SipBag_FazlaTeslimatYapilabilir',
        'malKabulAlisFatSipBagSipOkutulsun':
            'malKabul_AlisFat_SipBag_SipOkutulsun',
        'malKabulAlisFatSipBagCokluSecim': 'malKabul_AlisFat_SipBag_CokluSecim',
        'malKabulAlisFatSipBagTumKalemlerSecilsin':
            'malKabul_AlisFat_SipBag_TumKalemlerSecilsin',
        'malKabulAlisFatSipBagEslesmeDurumu':
            'malKabul_AlisFat_SipBag_EslesmeDurumu',
        'malKabulAlisFatRaporlar': 'malKabul_AlisFat_Raporlar',
        'malKabulAlisFatKalemRaporu': 'malKabul_AlisFat_KalemRaporu',
        'malKabulMustahsil': 'malKabul_Mustahsil',
        'malKabulMustahsilEkle': 'malKabul_Mustahsil_Ekle',
        'malKabulMustahsilDuzelt': 'malKabul_Mustahsil_Duzelt',
        'malKabulMustahsilSil': 'malKabul_Mustahsil_Sil',
        'transferDAT': 'transfer_DAT',
        'transferDATKaydet': 'transfer_DAT_Kaydet',
        'transferDATDuzelt': 'transfer_DAT_Duzelt',
        'transferDATSil': 'transfer_DAT_Sil',
        'transferDATFiyatGor': 'transfer_DAT_FiyatGor',
        'transferDATOtoEtiketBas': 'transfer_DAT_OtoEtiketBas',
        'transferDATVarsayilanCikisDepo': 'transfer_DAT_VarsayilanCikisDepo',
        'transferDATVarsayilanGirisDepo': 'transfer_DAT_VarsayilanGirisDepo',
        'transferDATEIrsIsaretleyemesin': 'transfer_DAT_eIrsIsaretleyemesin',
        'transferDATDigerSekmesiGoster': 'transfer_DAT_DigerSekmesiGoster',
        'transferDATBarkodluGiris': 'transfer_DAT_BarkodluGiris',
        'transferDATMiktarOtomatikGelsin': 'transfer_DAT_MiktarOtomatikGelsin',
        'transferDATKalemDetaySorulmasin': 'transfer_DAT_KalemDetaySorulmasin',
        'transferDATStokRehberiAcilmasin': 'transfer_DAT_StokRehberiAcilmasin',
        'transferDATKalemDuzeltilemesin': 'transfer_DAT_KalemDuzeltilemesin',
        'transferDATKlavyeEngelle': 'transfer_DAT_KlavyeEngelle',
        'transferDATMiktar1Gelsin': 'transfer_DAT_Miktar1Gelsin',
        'transferDATKalemlerBirlestirilsin':
            'transfer_DAT_KalemlerBirlestirilsin',
        'transferDATKacGunlukKayitlarListelensin':
            'transfer_DAT_KacGunlukKayitlarListelensin',
        'transferDATOnayIslemleri': 'transfer_DAT_OnayIslemleri',
        'transferDATOnayIslemleriDepolar': 'transfer_DAT_OnayIslemleri_Depolar',
        'transferDATEkAlan2Hatirla': 'transfer_DAT_EkAlan2Hatirla',
        'transferDATEkAlan2Tablodan': 'transfer_DAT_EkAlan2Tablodan',
        'transferDATLokalDATSeciliGelmesin':
            'transfer_DAT_LokalDATSeciliGelmesin',
        'transferDATSeriGirisHarYapabilsin':
            'transfer_DAT_SeriGirisHarYapabilsin',
        'transferDATBirim1denKaydet': 'transfer_DAT_Birim1denKaydet',
        'transferDATBarkod2Sor': 'transfer_DAT_Barkod2Sor',
        'transferDATBosGecilmeyecekAlanlar':
            'transfer_DAT_BosGecilmeyecekAlanlar',
        'transferDATGizlenecekAlanlar': 'transfer_DAT_GizlenecekAlanlar',
        'transferDATDegismeyecekAlanlar': 'transfer_DAT_DegismeyecekAlanlar',
        'transferDATAciklamaAlanlari': 'transfer_DAT_AciklamaAlanlari',
        'transferDATSipBagSecenegi': 'transfer_DAT_SipBagSecenegi',
        'transferDATReferansStokUygulamasi':
            'transfer_DAT_ReferansStokUygulamasi',
        'transferDATSipBagSipHariciKalemEklenebilir':
            'transfer_DAT_SipBag_SipHariciKalemEklenebilir',
        'transferDATSipBagFazlaTeslimatYapilabilir':
            'transfer_DAT_SipBag_FazlaTeslimatYapilabilir',
        'transferDATSipBagSipOkutulsun': 'transfer_DAT_SipBag_SipOkutulsun',
        'transferDATSipBagSipOkutulsunMiktar2BazAl':
            'transfer_DAT_SipBag_SipOkutulsun_Miktar2BazAl',
        'transferDATSipBagSipOkutulsunKalanMiktarGelsin':
            'transfer_DAT_SipBag_SipOkutulsun_KalanMiktarGelsin',
        'transferDATSipBagCokluSecim': 'transfer_DAT_SipBag_CokluSecim',
        'transferDATSipBagTumKalemlerSecilsin':
            'transfer_DAT_SipBag_TumKalemlerSecilsin',
        'transferDATSipBagEslesmeDurumu': 'transfer_DAT_SipBag_EslesmeDurumu',
        'transferDATSipBagMalToplananlarGelsin':
            'transfer_DAT_SipBag_MalToplananlarGelsin',
        'transferDATSipBagSevkOnayliSiparislerGelsin':
            'transfer_DAT_SipBag_SevkOnayliSiparislerGelsin',
        'transferAG': 'transfer_AG',
        'transferAGKaydet': 'transfer_AG_Kaydet',
        'transferAGDuzelt': 'transfer_AG_Duzelt',
        'transferAGSil': 'transfer_AG_Sil',
        'transferAGFiyatGor': 'transfer_AG_FiyatGor',
        'transferAGKacGunlukKayitlarListelensin':
            'transfer_AG_KacGunlukKayitlarListelensin',
        'transferAGVarsayilanDepo': 'transfer_AG_VarsayilanDepo',
        'transferAGDigerSekmesiGoster': 'transfer_AG_DigerSekmesiGoster',
        'transferAGBelgeKopyala': 'transfer_AG_BelgeKopyala',
        'transferAGBirim1denKaydet': 'transfer_AG_Birim1denKaydet',
        'transferAGOtoBasimYap': 'transfer_AG_OtoBasimYap',
        'transferAGSeriGirisHarYapabilsin':
            'transfer_AG_SeriGirisHarYapabilsin',
        'transferAGBarkodluGiris': 'transfer_AG_BarkodluGiris',
        'transferAGMiktarOtomatikGelsin': 'transfer_AG_MiktarOtomatikGelsin',
        'transferAGKalemDetaySorulmasin': 'transfer_AG_KalemDetaySorulmasin',
        'transferAGStokRehberiAcilmasin': 'transfer_AG_StokRehberiAcilmasin',
        'transferAGKalemDuzeltilemesin': 'transfer_AG_KalemDuzeltilemesin',
        'transferAGKlavyeEngelle': 'transfer_AG_KlavyeEngelle',
        'transferAGMiktar1Gelsin': 'transfer_AG_Miktar1Gelsin',
        'transferAGReferansStokUygulamasi':
            'transfer_AG_ReferansStokUygulamasi',
        'transferAGSipBagSipHariciKalemEklenebilir':
            'transfer_AG_SipBag_SipHariciKalemEklenebilir',
        'transferAGSipBagFazlaTeslimatYapilabilir':
            'transfer_AG_SipBag_FazlaTeslimatYapilabilir',
        'transferAGSipBagSipOkutulsun': 'transfer_AG_SipBag_SipOkutulsun',
        'transferAGSipBagSipOkutulsunMiktar2BazAl':
            'transfer_AG_SipBag_SipOkutulsun_Miktar2BazAl',
        'transferAGSipBagCokluSecim': 'transfer_AG_SipBag_CokluSecim',
        'transferAGSipBagTumKalemlerSecilsin':
            'transfer_AG_SipBag_TumKalemlerSecilsin',
        'transferAGSipBagEslesmeDurumu': 'transfer_AG_SipBag_EslesmeDurumu',
        'transferAGSipBagMalToplananlarGelsin':
            'transfer_AG_SipBag_MalToplananlarGelsin',
        'transferAGSipBagSevkOnayliSiparislerGelsin':
            'transfer_AG_SipBag_SevkOnayliSiparislerGelsin',
        'transferAC': 'transfer_AC',
        'transferACKaydet': 'transfer_AC_Kaydet',
        'transferACDuzelt': 'transfer_AC_Duzelt',
        'transferACSil': 'transfer_AC_Sil',
        'transferACFiyatGor': 'transfer_AC_FiyatGor',
        'transferACKacGunlukKayitlarListelensin':
            'transfer_AC_KacGunlukKayitlarListelensin',
        'transferACVarsayilanDepo': 'transfer_AC_VarsayilanDepo',
        'transferACEIrsIsaretleyemesin': 'transfer_AC_eIrsIsaretleyemesin',
        'transferACDigerSekmesiGoster': 'transfer_AC_DigerSekmesiGoster',
        'transferACBelgeKopyala': 'transfer_AC_BelgeKopyala',
        'transferACBirim1denKaydet': 'transfer_AC_Birim1denKaydet',
        'transferACOtoBasimYap': 'transfer_AC_OtoBasimYap',
        'transferACSeriGirisHarYapabilsin':
            'transfer_AC_SeriGirisHarYapabilsin',
        'transferACEkAlan2Tablodan': 'transfer_AC_EkAlan2Tablodan',
        'transferACEkAlan2Hatirla': 'transfer_AC_EkAlan2Hatirla',
        'transferACMinStokMikGoster': 'transfer_AC_MinStokMikGoster',
        'transferACBosGecilmeyecekAlanlar':
            'transfer_AC_BosGecilmeyecekAlanlar',
        'transferACBarkodluGiris': 'transfer_AC_BarkodluGiris',
        'transferACMiktarOtomatikGelsin': 'transfer_AC_MiktarOtomatikGelsin',
        'transferACKalemDetaySorulmasin': 'transfer_AC_KalemDetaySorulmasin',
        'transferACStokRehberiAcilmasin': 'transfer_AC_StokRehberiAcilmasin',
        'transferACKalemDuzeltilemesin': 'transfer_AC_KalemDuzeltilemesin',
        'transferACKlavyeEngelle': 'transfer_AC_KlavyeEngelle',
        'transferACMiktar1Gelsin': 'transfer_AC_Miktar1Gelsin',
        'transferACReferansStokUygulamasi':
            'transfer_AC_ReferansStokUygulamasi',
        'transferACSipBagSipHariciKalemEklenebilir':
            'transfer_AC_SipBag_SipHariciKalemEklenebilir',
        'transferACSipBagFazlaTeslimatYapilabilir':
            'transfer_AC_SipBag_FazlaTeslimatYapilabilir',
        'transferACSipBagSipOkutulsun': 'transfer_AC_SipBag_SipOkutulsun',
        'transferACSipBagSipOkutulsunMiktar2BazAl':
            'transfer_AC_SipBag_SipOkutulsun_Miktar2BazAl',
        'transferACSipBagCokluSecim': 'transfer_AC_SipBag_CokluSecim',
        'transferACSipBagTumKalemlerSecilsin':
            'transfer_AC_SipBag_TumKalemlerSecilsin',
        'transferACSipBagEslesmeDurumu': 'transfer_AC_SipBag_EslesmeDurumu',
        'transferACSipBagMalToplananlarGelsin':
            'transfer_AC_SipBag_MalToplananlarGelsin',
        'transferACSipBagSevkOnayliSiparislerGelsin':
            'transfer_AC_SipBag_SevkOnayliSiparislerGelsin',
        'transferDepoTalebi': 'transfer_DepoTalebi',
        'transferDepoTalebiSil': 'transfer_DepoTalebi_Sil',
        'transferDepoTalebiMalTop': 'transfer_DepoTalebi_MalTop',
        'transferDepoTalebiMalTopFazlaTeslimat':
            'transfer_DepoTalebi_MalTop_FazlaTeslimat',
        'hucreGiristeHucreYerlestir': 'hucre_GiristeHucreYerlestir',
        'hucreCikistaHucreYerlestir': 'hucre_CikistaHucreYerlestir',
        'hucreYerlestir': 'hucre_Yerlestir',
        'hucreYerlestirBelgesiz': 'hucre_YerlestirBelgesiz',
        'hucreYerlestirKlavyeEngelle': 'hucre_Yerlestir_KlavyeEngelle',
        'hucreYerlestirRehberdenStokSecilmesin':
            'hucre_Yerlestir_RehberdenStokSecilmesin',
        'hucreYerlestirHangiHucrede': 'hucre_Yerlestir_HangiHucrede',
        'hucreYerlestirBelgeTipleri': 'hucre_Yerlestir_BelgeTipleri',
        'hucreBosalt': 'hucre_Bosalt',
        'hucreBosaltBelgesiz': 'hucre_BosaltBelgesiz',
        'hucreBosaltKlavyeEngelle': 'hucre_Bosalt_KlavyeEngelle',
        'hucreBosaltRehberdenStokSecilmesin':
            'hucre_Bosalt_RehberdenStokSecilmesin',
        'hucreBosaltHangiHucrede': 'hucre_Bosalt_HangiHucrede',
        'hucreBosaltBelgeTipleri': 'hucre_Bosalt_BelgeTipleri',
        'hucreArama': 'hucre_Arama',
        'hucreAramaTumDepolar': 'hucre_AramaTumDepolar',
        'hucreAramaOzelFonksiyon': 'hucre_AramaOzelFonksiyon',
        'hucreTransfer': 'hucre_Transfer',
        'hucreTransferKlavyeEngelle': 'hucre_Transfer_KlavyeEngelle',
        'hucreTransferRehberdenStokSecilmesin':
            'hucre_Transfer_RehberdenStokSecilmesin',
        'hucreTransferBelgeTipleri': 'hucre_Transfer_BelgeTipleri',
        'hucreListesi': 'hucre_Listesi',
        'hucreBosaltOtomatikStokEtiketiYazdir':
            'hucre_Bosalt_OtomatikStokEtiketiYazdir',
        'hucreBakiyeDurumu': 'hucre_BakiyeDurumu',
        'hucreHareketleri': 'hucre_Hareketleri',
        'hucreHareketleriSil': 'hucre_Hareketleri_Sil',
        'sevkiyatSatisIrsaliyesiBelgeTipleri':
            'sevkiyat_SatisIrsaliyesi_BelgeTipleri',
        'sevkiyatSatisIrsaliyesiGizlenecekAlanlar':
            'sevkiyat_SatisIrsaliyesi_GizlenecekAlanlar',
        'sevkiyatSatisIrsaliyesiDegismeyecekAlanlar':
            'sevkiyat_SatisIrsaliyesi_DegismeyecekAlanlar',
        'sevkiyatSatisIrsaliyesi': 'sevkiyat_SatisIrsaliyesi',
        'sevkiyatSatisIrsaliyesiKayit': 'sevkiyat_SatisIrsaliyesiKayit',
        'sevkiyatSatisIrsaliyesiDuzeltme': 'sevkiyat_SatisIrsaliyesiDuzeltme',
        'sevkiyatSatisIrsaliyesiSilme': 'sevkiyat_SatisIrsaliyesiSilme',
        'sevkiyatSatisIrsaliyesiFiyatGor': 'sevkiyat_SatisIrsaliyesiFiyatGor',
        'sevkiyatSatisIrsDigerSekmesiGoster':
            'sevkiyat_SatisIrs_DigerSekmesiGoster',
        'sevkiyatSatisIrsaliyesiSipBagSecenegi':
            'sevkiyat_SatisIrsaliyesi_SipBagSecenegi',
        'sevkiyatSatisIrsReferansStokUygulamasi':
            'sevkiyat_SatisIrs_ReferansStokUygulamasi',
        'sevkiyatSatisIrsSipBagSipHariciKalemEklenebilir':
            'sevkiyat_SatisIrs_SipBag_SipHariciKalemEklenebilir',
        'sevkiyatSatisIrsSipBagFazlaTeslimatYapilabilir':
            'sevkiyat_SatisIrs_SipBag_FazlaTeslimatYapilabilir',
        'sevkiyatSatisIrsSipBagSipOkutulsun':
            'sevkiyat_SatisIrs_SipBag_SipOkutulsun',
        'sevkiyatSatisIrsSipBagSipOkutulsunMiktar2BazAl':
            'sevkiyat_SatisIrs_SipBag_SipOkutulsun_Miktar2BazAl',
        'sevkiyatSatisIrsSipBagSipOkutulsunKalanMiktarGelsin':
            'sevkiyat_SatisIrs_SipBag_SipOkutulsun_KalanMiktarGelsin',
        'sevkiyatSatisIrsSipBagCokluSecim':
            'sevkiyat_SatisIrs_SipBag_CokluSecim',
        'sevkiyatSatisIrsSipBagTumKalemlerSecilsin':
            'sevkiyat_SatisIrs_SipBag_TumKalemlerSecilsin',
        'sevkiyatSatisIrsSipBagEslesmeDurumu':
            'sevkiyat_SatisIrs_SipBag_EslesmeDurumu',
        'sevkiyatSatisIrsSipBagMalToplananlarGelsin':
            'sevkiyat_SatisIrs_SipBag_MalToplananlarGelsin',
        'sevkiyatSatisIrsSipBagSevkOnayliSiparislerGelsin':
            'sevkiyat_SatisIrs_SipBag_SevkOnayliSiparislerGelsin',
        'sevkiyatFiyatDegistirilmesin': 'sevkiyat_FiyatDegistirilmesin',
        'sevkiyatSatisIrsaliyesiEIrsaliyeDuzenleyemesin':
            'sevkiyat_SatisIrsaliyesi_EIrsaliyeDuzenleyemesin',
        'sevkiyatSatisIrsKalemlerBirlestirilsin':
            'sevkiyat_SatisIrs_KalemlerBirlestirilsin',
        'sevkiyatSatisIrsOtoBasimYap': 'sevkiyat_SatisIrs_OtoBasimYap',
        'sevkiyatSatisIrsKacGunlukKayitlarListelensin':
            'sevkiyat_SatisIrs_KacGunlukKayitlarListelensin',
        'sevkiyatSatisIrsFiyatSirasi': 'sevkiyat_SatisIrs_FiyatSirasi',
        'sevkiyatSatisIrsKDVSifirGelsin': 'sevkiyat_SatisIrs_KDVSifirGelsin',
        'sevkiyatSatisIrsSeriGirisHarYapabilsin':
            'sevkiyat_SatisIrs_SeriGirisHarYapabilsin',
        'sevkiyatSatisIrsBirim1denKaydet': 'sevkiyat_SatisIrs_Birim1denKaydet',
        'sevkiyatSatisIrsEkAlan2Tablodan': 'sevkiyat_SatisIrs_EkAlan2Tablodan',
        'sevkiyatSatisIrsEkAlan2Hatirla': 'sevkiyat_SatisIrs_EkAlan2Hatirla',
        'sevkiyatSatisIrsOlcuBirimi': 'sevkiyat_SatisIrs_OlcuBirimi',
        'sevkiyatSatisIrsCariKoduDegistir':
            'sevkiyat_SatisIrs_CariKoduDegistir',
        'sevkiyatSatisIrsMaxIskUygulamasi':
            'sevkiyat_SatisIrs_MaxIskUygulamasi',
        'sevkiyatSatisIrsMaxSatIsk1': 'sevkiyat_SatisIrs_MaxSatIsk1',
        'sevkiyatSatisIrsMaxSatIsk2': 'sevkiyat_SatisIrs_MaxSatIsk2',
        'sevkiyatSatisIrsMaxSatIsk3': 'sevkiyat_SatisIrs_MaxSatIsk3',
        'sevkiyatSatisIrsMaxSatIsk4': 'sevkiyat_SatisIrs_MaxSatIsk4',
        'sevkiyatSatisIrsMaxSatIsk5': 'sevkiyat_SatisIrs_MaxSatIsk5',
        'sevkiyatSatisIrsMaxSatIsk6': 'sevkiyat_SatisIrs_MaxSatIsk6',
        'sevkiyatSatisIrsMaxGenIsk1': 'sevkiyat_SatisIrs_MaxGenIsk1',
        'sevkiyatSatisIrsMaxGenIsk2': 'sevkiyat_SatisIrs_MaxGenIsk2',
        'sevkiyatSatisIrsMaxGenIsk3': 'sevkiyat_SatisIrs_MaxGenIsk3',
        'sevkiyatSatisIrsDipFiyatUygulamasi':
            'sevkiyat_SatisIrs_DipFiyatUygulamasi',
        'sevkiyatSatisIrsDipFiyatSaha': 'sevkiyat_SatisIrs_DipFiyatSaha',
        'sevkiyatSatisIrsDipFiyatEylem': 'sevkiyat_SatisIrs_DipFiyatEylem',
        'sevkiyatSatisIrsDipFiyatKDVDurumu':
            'sevkiyat_SatisIrs_DipFiyatKDVDurumu',
        'sevkiyatSatisIrsBarkodluGiris': 'sevkiyat_SatisIrs_BarkodluGiris',
        'sevkiyatSatisIrsMiktarOtomatikGelsin':
            'sevkiyat_SatisIrs_MiktarOtomatikGelsin',
        'sevkiyatSatisIrsKalemDetaySorulmasin':
            'sevkiyat_SatisIrs_KalemDetaySorulmasin',
        'sevkiyatSatisIrsStokRehberiAcilmasin':
            'sevkiyat_SatisIrs_StokRehberiAcilmasin',
        'sevkiyatSatisIrsKalemDuzeltilemesin':
            'sevkiyat_SatisIrs_KalemDuzeltilemesin',
        'sevkiyatSatisIrsKlavyeEngelle': 'sevkiyat_SatisIrs_KlavyeEngelle',
        'sevkiyatSatisIrsMiktar1Gelsin': 'sevkiyat_SatisIrs_Miktar1Gelsin',
        'sevkiyatSatisIrsBakiyesizStokSecilmesin':
            'sevkiyat_SatisIrs_BakiyesizStokSecilmesin',
        'sevkiyatSatisIrsRaporlar': 'sevkiyat_SatisIrs_Raporlar',
        'sevkiyatSatisIrsKalemRaporu': 'sevkiyat_SatisIrs_KalemRaporu',
        'sevkiyatSatisFatBelgeTipleri': 'sevkiyat_SatisFat_BelgeTipleri',
        'sevkiyatSatisFatVarsayilanBelgeTipi':
            'sevkiyat_SatisFat_VarsayilanBelgeTipi',
        'sevkiyatSatisFat': 'sevkiyat_SatisFat',
        'sevkiyatSatisFatKaydet': 'sevkiyat_SatisFat_Kaydet',
        'sevkiyatSatisFatDuzelt': 'sevkiyat_SatisFat_Duzelt',
        'sevkiyatSatisFatSil': 'sevkiyat_SatisFat_Sil',
        'sevkiyatSatisFatToplamlarCariTahsilatIslemleri':
            'sevkiyat_SatisFat_ToplamlarCariTahsilatIslemleri',
        'sevkiyatSatisFatKayittanSonraTaslakOlustur':
            'sevkiyat_SatisFat_KayittanSonraTaslakOlustur',
        'sevkiyatSatisFatOtomatikBasimYap':
            'sevkiyat_SatisFat_OtomatikBasimYap',
        'sevkiyatSatisFatDigerSekmesiGoster':
            'sevkiyat_SatisFat_DigerSekmesiGoster',
        'sevkiyatSatisFatFiyatDegistirilmesin':
            'sevkiyat_SatisFat_FiyatDegistirilmesin',
        'sevkiyatSatisFatKacGunlukKayitlarListelensin':
            'sevkiyat_SatisFat_KacGunlukKayitlarListelensin',
        'sevkiyatSatisFatFiyatSirasi': 'sevkiyat_SatisFat_FiyatSirasi',
        'sevkiyatSatisFatKalemlerBirlestirilsin':
            'sevkiyat_SatisFat_KalemlerBirlestirilsin',
        'sevkiyatSatisFatBirim1denKaydet': 'sevkiyat_SatisFat_Birim1denKaydet',
        'sevkiyatSatisFatEkAlan2Tablodan': 'sevkiyat_SatisFat_EkAlan2Tablodan',
        'sevkiyatSatisFatEkAlan2Hatirla': 'sevkiyat_SatisFat_EkAlan2Hatirla',
        'sevkiyatSatisFatFiltre': 'sevkiyat_SatisFat_Filtre',
        'sevkiyatSatisFatFiltreSQL': 'sevkiyat_SatisFat_FiltreSQL',
        'sevkiyatSatisFatOlcuBirimi': 'sevkiyat_SatisFat_OlcuBirimi',
        'sevkiyatSatisFatAciklamaAlanlari':
            'sevkiyat_SatisFat_AciklamaAlanlari',
        'sevkiyatSatisFatBosGecilmeyecekAlanlar':
            'sevkiyat_SatisFat_BosGecilmeyecekAlanlar',
        'sevkiyatSatisFatGizlenecekAlanlar':
            'sevkiyat_SatisFat_GizlenecekAlanlar',
        'sevkiyatSatisFatDegismeyecekAlanlar':
            'sevkiyat_SatisFat_DegismeyecekAlanlar',
        'sevkiyatSatisFatSeriGirisHarYapabilsin':
            'sevkiyat_SatisFat_SeriGirisHarYapabilsin',
        'sevkiyatSatisFatCariKoduDegistir':
            'sevkiyat_SatisFat_CariKoduDegistir',
        'sevkiyatSatisFaturasiSipBagSecenegi':
            'sevkiyat_SatisFaturasi_SipBagSecenegi',
        'sevkiyatSatisFatReferansStokUygulamasi':
            'sevkiyat_SatisFat_ReferansStokUygulamasi',
        'sevkiyatSatisFatSipBagSipHariciKalemEklenebilir':
            'sevkiyat_SatisFat_SipBag_SipHariciKalemEklenebilir',
        'sevkiyatSatisFatSipBagFazlaTeslimatYapilabilir':
            'sevkiyat_SatisFat_SipBag_FazlaTeslimatYapilabilir',
        'sevkiyatSatisFatSipBagSipOkutulsun':
            'sevkiyat_SatisFat_SipBag_SipOkutulsun',
        'sevkiyatSatisFatSipBagSipOkutulsunMiktar2BazAl':
            'sevkiyat_SatisFat_SipBag_SipOkutulsun_Miktar2BazAl',
        'sevkiyatSatisFatSipBagCokluSecim':
            'sevkiyat_SatisFat_SipBag_CokluSecim',
        'sevkiyatSatisFatSipBagTumKalemlerSecilsin':
            'sevkiyat_SatisFat_SipBag_TumKalemlerSecilsin',
        'sevkiyatSatisFatSipBagEslesmeDurumu':
            'sevkiyat_SatisFat_SipBag_EslesmeDurumu',
        'sevkiyatSatisFatSipBagSevkOnayliSiparislerGelsin':
            'sevkiyat_SatisFat_SipBag_SevkOnayliSiparislerGelsin',
        'sevkiyatSatisFatBarkodluGiris': 'sevkiyat_SatisFat_BarkodluGiris',
        'sevkiyatSatisFaturasiMiktarOtomatikGelsin':
            'sevkiyat_SatisFaturasi_MiktarOtomatikGelsin',
        'sevkiyatSatisFaturasiKalemDetaySorulmasin':
            'sevkiyat_SatisFaturasi_KalemDetaySorulmasin',
        'sevkiyatSatisFatBarkodSayisiSaklanacakAlan':
            'sevkiyat_SatisFat_BarkodSayisiSaklanacakAlan',
        'sevkiyatSatisFatStokRehberiAcilmasin':
            'sevkiyat_SatisFat_StokRehberiAcilmasin',
        'sevkiyatSatisFatKalemDuzeltilemesin':
            'sevkiyat_SatisFat_KalemDuzeltilemesin',
        'sevkiyatSatisFatKlavyeEngelle': 'sevkiyat_SatisFat_KlavyeEngelle',
        'sevkiyatSatisFatMiktar1Gelsin': 'sevkiyat_SatisFat_Miktar1Gelsin',
        'sevkiyatSatisFatBakiyesizStokSecilmesin':
            'sevkiyat_SatisFat_BakiyesizStokSecilmesin',
        'sevkiyatSatisFatRaporlar': 'sevkiyat_SatisFat_Raporlar',
        'sevkiyatSatisFatKalemRaporu': 'sevkiyat_SatisFat_KalemRaporu',
        'sevkiyatSatisFatKarlilikRaporu': 'sevkiyat_SatisFat_KarlilikRaporu',
        'sevkiyatSatisFatMaxIskUygulamasi':
            'sevkiyat_SatisFat_MaxIskUygulamasi',
        'sevkiyatSatisFatMaxSatIsk1': 'sevkiyat_SatisFat_MaxSatIsk1',
        'sevkiyatSatisFatMaxSatIsk2': 'sevkiyat_SatisFat_MaxSatIsk2',
        'sevkiyatSatisFatMaxSatIsk3': 'sevkiyat_SatisFat_MaxSatIsk3',
        'sevkiyatSatisFatMaxSatIsk4': 'sevkiyat_SatisFat_MaxSatIsk4',
        'sevkiyatSatisFatMaxSatIsk5': 'sevkiyat_SatisFat_MaxSatIsk5',
        'sevkiyatSatisFatMaxSatIsk6': 'sevkiyat_SatisFat_MaxSatIsk6',
        'sevkiyatSatisFatMaxGenIsk1': 'sevkiyat_SatisFat_MaxGenIsk1',
        'sevkiyatSatisFatMaxGenIsk2': 'sevkiyat_SatisFat_MaxGenIsk2',
        'sevkiyatSatisFatMaxGenIsk3': 'sevkiyat_SatisFat_MaxGenIsk3',
        'sevkiyatSatisFatDipFiyatUygulamasi':
            'sevkiyat_SatisFat_DipFiyatUygulamasi',
        'sevkiyatSatisFatDipFiyatSaha': 'sevkiyat_SatisFat_DipFiyatSaha',
        'sevkiyatSatisFatDipFiyatEylem': 'sevkiyat_SatisFat_DipFiyatEylem',
        'sevkiyatSatisFatDipFiyatKDVDurumu':
            'sevkiyat_SatisFat_DipFiyatKDVDurumu',
        'sevkiyatSatisIrsaliyesiSiparissiz':
            'sevkiyat_SatisIrsaliyesiSiparissiz',
        'sevkiyatSatisIrsaliyesiSiparissizFiyatGor':
            'sevkiyat_SatisIrsaliyesiSiparissizFiyatGor',
        'sevkiyatSatisIrsaliyesiIade': 'sevkiyat_SatisIrsaliyesiIade',
        'sevkiyatSiptenMalTop': 'sevkiyat_SiptenMalTop',
        'sevkiyatSiptenMalTopMiktarBarkoddanGelsin':
            'sevkiyat_SiptenMalTop_MiktarBarkoddanGelsin',
        'sevkiyatSiptenMalTopRehberdenStokSecilmesin':
            'sevkiyat_SiptenMalTop_RehberdenStokSecilmesin',
        'sevkiyatSiptenMalTopKlavyedenBarkodGirilmesin':
            'sevkiyat_SiptenMalTop_KlavyedenBarkodGirilmesin',
        'sevkiyatSiptenMalTopSevkOnayliSiparislerGelsin':
            'sevkiyat_SiptenMalTop_SevkOnayliSiparislerGelsin',
        'sevkiyatSiptenMalTopKacGunlukKayitlarListelensin':
            'sevkiyat_SiptenMalTop_KacGunlukKayitlarListelensin',
        'sevkemriMalToplama': 'sevkemri_MalToplama',
        'sevkemriMalToplamaAtanabilir': 'sevkemri_MalToplamaAtanabilir',
        'sevkemriMalToplamaAtayabilir': 'sevkemri_MalToplamaAtayabilir',
        'sevkemriUrunDegistir': 'sevkemri_UrunDegistir',
        'sevkemriMiktarDegistir': 'sevkemri_MiktarDegistir',
        'sevkemriMuadilUrun': 'sevkemri_MuadilUrun',
        'sevkemriMalToplamaBarkodsuzUrunListedenSecilsin':
            'sevkemri_malToplama_BarkodsuzUrunListedenSecilsin',
        'sevkemriMalToplamaOtoStokEtiketiYazdir':
            'sevkemri_MalToplama_OtoStokEtiketiYazdir',
        'sevkemriMalToplamaOtoStokEtiketiYazdirSor':
            'sevkemri_MalToplama_OtoStokEtiketiYazdirSor',
        'sevkemriMalToplamaKlavyedenGirisiEngelle':
            'sevkemri_MalToplama_KlavyedenGirisiEngelle',
        'sevkemriMalToplamaBarkod2Sor': 'sevkemri_MalToplama_Barkod2Sor',
        'sevkemriMalToplamaBarkod2YildizliGorunsun':
            'sevkemri_MalToplama_Barkod2_YildizliGorunsun',
        'sevkemriMalToplamaBarkod2KalemEkranindaSor':
            'sevkemri_MalToplama_Barkod2KalemEkranindaSor',
        'sevkemriMalToplamaTumuToplanmadanTamamlanmasin':
            'sevkemri_MalToplama_TumuToplanmadanTamamlanmasin',
        'sevkemriMalToplamaHangiHucredeGoster':
            'sevkemri_MalToplama_HangiHucredeGoster',
        'sevkemriMalToplamaKalemDetayIslemOnaySormasin':
            'sevkemri_MalToplama_KalemDetayIslemOnaySormasin',
        'sevkemriMalToplamaGosterilecekEkBilgiler':
            'sevkemri_MalToplama_GosterilecekEkBilgiler',
        'sevkemriMalToplamaDegistirilemeyecekAlanlar':
            'sevkemri_MalToplama_DegistirilemeyecekAlanlar',
        'sevkemriMalToplamaGizlenecekAlanlar':
            'sevkemri_MalToplama_GizlenecekAlanlar',
        'sevkemriMalToplamaMiktarBarkoddan':
            'sevkemri_MalToplama_MiktarBarkoddan',
        'sevkemriMalToplamaKalemDetayiSorulmasin':
            'sevkemri_MalToplama_KalemDetayiSorulmasin',
        'sevkemriMalToplamaKalemDetayaUlasamasin':
            'sevkemri_MalToplama_KalemDetayaUlasamasin',
        'sevkemriMalToplamaFazlaTeslimat': 'sevkemri_MalToplama_FazlaTeslimat',
        'sevkemriMalToplamaVarsayilanOlcuBirimi':
            'sevkemri_MalToplama_VarsayilanOlcuBirimi',
        'sevkemriMalToplamaSiralamaTipi': 'sevkemri_MalToplama_SiralamaTipi',
        'sevkemriMalKontrol': 'sevkemri_MalKontrol',
        'sevkemriMalKontrolKlavyeEngelle': 'sevkemri_MalKontrol_KlavyeEngelle',
        'sevkemriMalKontrolTipi': 'sevkemri_MalKontrolTipi',
        'sevkemriMalKontrolKullanicilar': 'sevkemri_MalKontrolKullanicilar',
        'sevkemriPaketleme': 'sevkemri_Paketleme',
        'sevkemriPaketlemeKlavyeEngelle': 'sevkemri_Paketleme_KlavyeEngelle',
        'sevkemriPaketlemeBarkodOkutmayaZorla':
            'sevkemri_Paketleme_BarkodOkutmayaZorla',
        'sevkemriPaketlemeBarkodsuzUrunListedenSecilsin':
            'sevkemri_Paketleme_BarkodsuzUrunListedenSecilsin',
        'sevkemriAracYukleme': 'sevkemri_AracYukleme',
        'sevkemriAracYuklemeKlavyeEngelle':
            'sevkemri_AracYukleme_KlavyeEngelle',
        'sevkemriAracBosaltma': 'sevkemri_AracBosaltma',
        'sevkemriAracBosaltmaKlavyeEngelle':
            'sevkemri_AracBosaltma_KlavyeEngelle',
        'sevkemriDepodanTeslimat': 'sevkemri_DepodanTeslimat',
        'sevkemriDepodanTeslimatKlavyeEngelle':
            'sevkemri_DepodanTeslimat_KlavyeEngelle',
        'sayimSayim': 'sayim_sayim',
        'sayimKontrolMiktari': 'sayim_Kontrol_Miktari',
        'sayimMiktarBarkoddanGelsin': 'sayim_MiktarBarkoddanGelsin',
        'sayimAyniStokDurumu': 'sayim_AyniStokDurumu',
        'sayimMiktar1Gelsin': 'sayim_Miktar1Gelsin',
        'sayimHemenKaydet': 'sayim_HemenKaydet',
        'sayimCarpanAktif': 'sayim_CarpanAktif',
        'sayimSeriMikGirilenMikKabulEdilsin':
            'sayim_SeriMikGirilenMikKabulEdilsin',
        'sayimDigerKulSayimHarGorsun': 'sayim_DigerKulSayimHarGorsun',
        'sayimDigerKulSayimFisGorsun': 'sayim_DigerKulSayimFisGorsun',
        'sayimSerbest': 'sayim_Serbest',
        'sayimSerbestSil': 'sayim_Serbest_Sil',
        'sayimDepoFarkRaporu': 'sayim_DepoFarkRaporu',
        'sayimBelgeBaglantisiniKopar': 'sayim_BelgeBaglantisiniKopar',
        'sayimBelgeOlusturabilir': 'sayim_BelgeOlusturabilir',
        'sayimEkAlanlar': 'sayim_EkAlanlar',
        'sayimDegismeyecekAlanlar': 'sayim_DegismeyecekAlanlar',
        'sayimGizlenecekAlanlar': 'sayim_GizlenecekAlanlar',
        'sayimVarsayilanOlcuBirimi': 'sayim_VarsayilanOlcuBirimi',
        'sayimRaporu': 'sayim_Raporu',
        'paketOlustur': 'paket_Olustur',
        'paketCokluOlustur': 'paket_CokluOlustur',
        'paketKontrol': 'paket_Kontrol',
        'paketMalzemeCikisi': 'paket_MalzemeCikisi',
        'paketReceteyiFiltrele': 'paket_ReceteyiFiltrele',
        'islemlerHucreEtiket': 'islemler_HucreEtiket',
        'islemlerStokEtiket': 'islemler_StokEtiket',
        'islemlerBarkodTanimlama': 'islemler_BarkodTanimlama',
        'siparisMusteriSiparisi': 'siparis_MusteriSiparisi',
        'siparisMusteriSiparisiKaydet': 'siparis_MusteriSiparisi_Kaydet',
        'siparisMusteriSiparisiDuzelt': 'siparis_MusteriSiparisi_Duzelt',
        'siparisMusteriSiparisiSil': 'siparis_MusteriSiparisi_Sil',
        'siparisMusteriSiparisiKapalilarListelenmesin':
            'siparis_MusteriSiparisi_KapalilarListelenmesin',
        'siparisMusteriSiparisiFiyatDegistirilmesin':
            'siparis_MusteriSiparisi_FiyatDegistirilmesin',
        'siparisMusteriSiparisiFiyatSirasi':
            'siparis_MusteriSiparisi_FiyatSirasi',
        'siparisMusSipBirim1denKaydet': 'siparis_MusSip_Birim1denKaydet',
        'siparisMusteriSiparisiKapatmaIslemi':
            'siparis_MusteriSiparisi_KapatmaIslemi',
        'siparisMusSipOnayIslemleri': 'siparis_MusSip_OnayIslemleri',
        'siparisMusteriSiparisiSonFiyatGoster':
            'siparis_MusteriSiparisi_SonFiyatGoster',
        'siparisMusSipDigerSekmesiGoster': 'siparis_MusSip_DigerSekmesiGoster',
        'siparisMusSipEkAlan2Tablodan': 'siparis_MusSip_EkAlan2Tablodan',
        'siparisMusSipEkAlan2Hatirla': 'siparis_MusSip_EkAlan2Hatirla',
        'siparisMusSipMiktar1Gelsin': 'siparis_MusSip_Miktar1Gelsin',
        'siparisMusSipBosGecilmeyecekAlanlar':
            'siparis_MusSip_BosGecilmeyecekAlanlar',
        'siparisMusSipOtoPdfGor': 'siparis_MusSip_OtoPdfGor',
        'siparisMusSipCariKoduDegistir': 'siparis_MusSip_CariKoduDegistir',
        'siparisMusteriSiparisiAciklamaAlanlari':
            'siparis_MusteriSiparisi_AciklamaAlanlari',
        'siparisMusteriSiparisiGizlenecekAlanlar':
            'siparis_MusteriSiparisi_GizlenecekAlanlar',
        'siparisMusteriSiparisiDegismeyecekAlanlar':
            'siparis_MusteriSiparisi_DegismeyecekAlanlar',
        'siparisMusSipEkstraAlanlar': 'siparis_MusSip_EkstraAlanlar',
        'siparisMusteriSiparisiSatirAciklamaAlanlari':
            'siparis_MusteriSiparisi_SatirAciklamaAlanlari',
        'siparisMusSipOlcuBirimi': 'siparis_MusSip_OlcuBirimi',
        'siparisMusSipBakiyesizStokSecilmesin':
            'siparis_MusSip_BakiyesizStokSecilmesin',
        'siparisMusSipHizliUrunGirisiMiktar2Kullanilsin':
            'siparis_MusSip_HizliUrunGirisi_Miktar2Kullanilsin',
        'siparisMusteriSiparisiDipFiyatUygulamasi':
            'siparis_MusteriSiparisi_DipFiyatUygulamasi',
        'siparisMusteriSiparisiDipFiyatSaha':
            'siparis_MusteriSiparisi_DipFiyatSaha',
        'siparisMusteriSiparisiDipFiyatEylem':
            'siparis_MusteriSiparisi_DipFiyatEylem',
        'siparisMusteriSiparisiDipFiyatKDVDurumu':
            'siparis_MusteriSiparisi_DipFiyatKDVDurumu',
        'siparisMusSipMaxIskUygulamasi': 'siparis_MusSip_MaxIskUygulamasi',
        'siparisMusSipMaxSatIsk1': 'siparis_MusSip_MaxSatIsk1',
        'siparisMusSipMaxSatIsk2': 'siparis_MusSip_MaxSatIsk2',
        'siparisMusSipMaxSatIsk3': 'siparis_MusSip_MaxSatIsk3',
        'siparisMusSipMaxSatIsk4': 'siparis_MusSip_MaxSatIsk4',
        'siparisMusSipMaxSatIsk5': 'siparis_MusSip_MaxSatIsk5',
        'siparisMusSipMaxSatIsk6': 'siparis_MusSip_MaxSatIsk6',
        'siparisMusSipMaxGenIsk1': 'siparis_MusSip_MaxGenIsk1',
        'siparisMusSipMaxGenIsk2': 'siparis_MusSip_MaxGenIsk2',
        'siparisMusSipMaxGenIsk3': 'siparis_MusSip_MaxGenIsk3',
        'siparisMusteriSiparisiRaporlar': 'siparis_MusteriSiparisi_Raporlar',
        'siparisMusteriSiparisiDurumRaporu':
            'siparis_MusteriSiparisi_DurumRaporu',
        'siparisMusteriSiparisiDurumRaporuFiyatGor':
            'siparis_MusteriSiparisi_DurumRaporuFiyatGor',
        'siparisMusSipKarlilikRaporu': 'siparis_MusSip_KarlilikRaporu',
        'siparisMusSipTeslimRaporu': 'siparis_MusSip_TeslimRaporu',
        'siparisSaticiSiparisi': 'siparis_SaticiSiparisi',
        'siparisSaticiSiparisiKaydet': 'siparis_SaticiSiparisi_Kaydet',
        'siparisSaticiSiparisiDuzelt': 'siparis_SaticiSiparisi_Duzelt',
        'siparisSaticiSiparisiSil': 'siparis_SaticiSiparisi_Sil',
        'siparisSaticiSiparisiKapalilarListelenmesin':
            'siparis_SaticiSiparisi_KapalilarListelenmesin',
        'siparisSaticiSiparisiFiyatDegistirilmesin':
            'siparis_SaticiSiparisi_FiyatDegistirilmesin',
        'siparisSaticiSiparisiFiyatSirasi':
            'siparis_SaticiSiparisi_FiyatSirasi',
        'siparisSaticiSipBirim1denKaydet': 'siparis_SaticiSip_Birim1denKaydet',
        'siparisSaticiSiparisiKapatmaIslemi':
            'siparis_SaticiSiparisi_KapatmaIslemi',
        'siparisSaticiSipOnayIslemleri': 'siparis_SaticiSip_OnayIslemleri',
        'siparisSaticiSipDigerSekmesiGoster':
            'siparis_SaticiSip_DigerSekmesiGoster',
        'siparisSaticiSipOlcuBirimi': 'siparis_SaticiSip_OlcuBirimi',
        'siparisSaticiSipCariKoduDegistir':
            'siparis_SaticiSip_CariKoduDegistir',
        'siparisSaticiSiparisiRaporlar': 'siparis_SaticiSiparisi_Raporlar',
        'siparisSaticiSiparisiDurumRaporu':
            'siparis_SaticiSiparisi_DurumRaporu',
        'siparisSaticiSiparisiDurumRaporuFiyatGor':
            'siparis_SaticiSiparisi_DurumRaporuFiyatGor',
        'siparisSaticiSipTeslimRaporu': 'siparis_SaticiSip_TeslimRaporu',
        'stokStokListesi': 'stok_StokListesi',
        'stokStokListesiExtraAlanlar': 'stok_StokListesi_ExtraAlanlar',
        'stokStokKarti': 'stok_StokKarti',
        'stokStokKartiKaydet': 'stok_StokKarti_Kaydet',
        'stokStokKartiDuzelt': 'stok_StokKarti_Duzelt',
        'stokStokKartiSil': 'stok_StokKarti_Sil',
        'stokStokKartiAlisFiyatiGizle': 'stok_StokKarti_AlisFiyatiGizle',
        'stokStokKartiSatisFiyatiGizle': 'stok_StokKarti_SatisFiyatiGizle',
        'stokStokHareketleri': 'stok_StokHareketleri',
        'stokStokHarKaydet': 'stok_StokHar_Kaydet',
        'stokStokHarDuzelt': 'stok_StokHar_Duzelt',
        'stokStokHarSil': 'stok_StokHar_Sil',
        'stokStokHarPlasiyerKendiniGorsun':
            'stok_StokHar_PlasiyerKendiniGorsun',
        'stokFiltreSQLTipi': 'stok_FiltreSQLTipi',
        'stokResimGoster': 'stok_ResimGoster',
        'stokResimGosterEkle': 'stok_ResimGoster_Ekle',
        'stokResimGosterSil': 'stok_ResimGoster_Sil',
        'stokFiyatOzeti': 'stok_FiyatOzeti',
        'stokHareketDetayiniGizle': 'stok_HareketDetayiniGizle',
        'stokGirisHareketleriniGizle': 'stok_GirisHareketleriniGizle',
        'stokCikisHareketleriniGizle': 'stok_CikisHareketleriniGizle',
        'stokBakiyeGosterimTipi': 'stok_BakiyeGosterimTipi',
        'stokBarkodKontrol': 'stok_BarkodKontrol',
        'stokDepoBakiyeDurumu': 'stok_DepoBakiyeDurumu',
        'stokBarkodTanimlama': 'stok_BarkodTanimlama',
        'stokBarkodTanimlamaGorunecekAlanlar':
            'stok_BarkodTanimlama_GorunecekAlanlar',
        'stokBarkodKayitlari': 'stok_BarkodKayitlari',
        'stokBarkodKayitlariEkle': 'stok_BarkodKayitlari_Ekle',
        'stokBarkodKayitlariDuzelt': 'stok_BarkodKayitlari_Duzelt',
        'stokBarkodKayitlariSil': 'stok_BarkodKayitlari_Sil',
        'stokKanbanBarkodEsle': 'stok_KanbanBarkodEsle',
        'stokKanbanBarkodEsleSil': 'stok_KanbanBarkodEsle_Sil',
        'stokKanbanBarkodEsleFarkliStokOkutulmasin':
            'stok_KanbanBarkodEsleFarkliStokOkutulmasin',
        'stokFiyatGorEkrani': 'stok_FiyatGorEkrani',
        'stokFiyatGorEkraniGunlukKurdanTLGoster':
            'stok_FiyatGorEkrani_GunlukKurdanTLGoster',
        'stokFiyatGorEkraniGorunecekAlanlar':
            'stok_FiyatGorEkraniGorunecekAlanlar',
        'stokFiyatGecmisi': 'stok_FiyatGecmisi',
        'stokFiyatGecmisiSil': 'stok_FiyatGecmisiSil',
        'stokFiyatGecmisiFiyatTipleri': 'stok_FiyatGecmisiFiyatTipleri',
        'stokSeriHar': 'stok_SeriHar',
        'stokSeriHarEkle': 'stok_SeriHar_Ekle',
        'stokSeriHarDuzelt': 'stok_SeriHar_Duzelt',
        'stokSeriHarSil': 'stok_SeriHar_Sil',
        'stokSeriParcala': 'stok_SeriParcala',
        'stokSeriParcalaEkle': 'stok_SeriParcala_Ekle',
        'stokSeriParcalaDuzelt': 'stok_SeriParcala_Duzelt',
        'stokSeriParcalaSil': 'stok_SeriParcala_Sil',
        'stokSeriBirlestir': 'stok_SeriBirlestir',
        'stokSeriBirlestirEkle': 'stok_SeriBirlestir_Ekle',
        'stokSeriBirlestirDuzelt': 'stok_SeriBirlestir_Duzelt',
        'stokSeriBirlestirSil': 'stok_SeriBirlestir_Sil',
        'stokPaketleme': 'stok_Paketleme',
        'stokPaketlemeEkle': 'stok_Paketleme_Ekle',
        'stokPaketlemeSil': 'stok_Paketleme_Sil',
        'stokPaketlemeOnaySormasin': 'stok_Paketleme_OnaySormasin',
        'stokPaketlemeDigerKulKayitGorebilir':
            'stok_Paketleme_DigerKulKayitGorebilir',
        'stokPaketlemeSorulacakBelgeTipleri':
            'stok_Paketleme_SorulacakBelgeTipleri',
        'stokRaporlar': 'stok_Raporlar',
        'stokRapAmbarMaliyet': 'stok_Rap_AmbarMaliyet',
        'stokRapLokalDepoBakiye': 'stok_Rap_LokalDepoBakiye',
        'stokRapUrunGrubunaGoreSatis': 'stok_Rap_UrunGrubunaGoreSatis',
        'cariCariListesi': 'cari_CariListesi',
        'cariCariListesiRiskGorebilir': 'cari_CariListesi_RiskGorebilir',
        'cariRiskGirisi': 'cari_RiskGirisi',
        'cariCariKarti': 'cari_CariKarti',
        'cariCariKartiKaydet': 'cari_CariKarti_Kaydet',
        'cariCariKartiDuzelt': 'cari_CariKarti_Duzelt',
        'cariCariKartiSil': 'cari_CariKarti_Sil',
        'cariCariKartiEIslemler': 'cari_CariKarti_EIslemler',
        'cariCariKartiDegismeyecekAlanlar':
            'cari_CariKarti_DegismeyecekAlanlar',
        'cariCariKartiGizlenecekAlanlar': 'cari_CariKarti_GizlenecekAlanlar',
        'cariCariHareketleri': 'cari_CariHareketleri',
        'cariCariHarKaydet': 'cari_CariHar_Kaydet',
        'cariCariHarDuzelt': 'cari_CariHar_Duzelt',
        'cariCariHarSil': 'cari_CariHar_Sil',
        'cariCariHareketleriHarDetayGorsun':
            'cari_CariHareketleri_HarDetayGorsun',
        'stokCariHarPlasiyerKendiniGorsun':
            'stok_CariHar_PlasiyerKendiniGorsun',
        'cariAktivite': 'cari_Aktivite',
        'cariAktiviteEkle': 'cari_Aktivite_Ekle',
        'cariAktiviteDuzelt': 'cari_Aktivite_Duzelt',
        'cariAktiviteSil': 'cari_Aktivite_Sil',
        'cariAktiviteAtayabilir': 'cari_Aktivite_Atayabilir',
        'cariAktiviteBitirmeyiGeriAl': 'cari_Aktivite_BitirmeyiGeriAl',
        'cariOzelHesapKapatma': 'cari_OzelHesapKapatma',
        'cariOzelHesapKapatmaSil': 'cari_OzelHesapKapatma_Sil',
        'cariVadeKontrolu': 'cari_VadeKontrolu',
        'cariVadeKontroluGun': 'cari_VadeKontrolu_Gun',
        'cariVadeKontroluBelgeTipleri': 'cari_VadeKontrolu_BelgeTipleri',
        'cariFiltre': 'cari_Filtre',
        'cariFiltreSQL': 'cari_FiltreSQL',
        'cariFiltreSQLTipi': 'cari_FiltreSQLTipi',
        'cariVirman': 'cari_Virman',
        'cariVirmanKaydet': 'cari_Virman_Kaydet',
        'cariHarita': 'cari_Harita',
        'cariTeslimCariRehberSadeceSecsin':
            'cari_TeslimCari_RehberSadeceSecsin',
        'cariTeslimCariSatisBaglanmisCarilerSecilsin':
            'cari_TeslimCari_SatisBaglanmisCarilerSecilsin',
        'cariRaporlar': 'cari_Raporlar',
        'cariRapEkstre': 'cari_Rap_Ekstre',
        'cariRapStokEkstre': 'cari_Rap_StokEkstre',
        'cariRapYaslandirma': 'cari_Rap_Yaslandirma',
        'cariRapHarDetayliYaslandir': 'cari_Rap_HarDetayliYaslandir',
        'cariRapDovizBakiye': 'cari_Rap_DovizBakiye',
        'cariRapStokSatisOzeti': 'cari_Rap_StokSatisOzeti',
        'cariRapDovizliEkstre': 'cari_Rap_DovizliEkstre',
        'tahsilatTahsilatlar': 'tahsilat_Tahsilatlar',
        'tahsilatNakitTahsilat': 'tahsilat_NakitTahsilat',
        'tahsilatNakitTahsilatKaydet': 'tahsilat_NakitTahsilat_Kaydet',
        'tahsilatKKartiTahsilat': 'tahsilat_KKartiTahsilat',
        'tahsilatKKartiTahsilatKaydet': 'tahsilat_KKartiTahsilat_Kaydet',
        'tahsilatNakitOdeme': 'tahsilat_NakitOdeme',
        'tahsilatNakitOdemeKaydet': 'tahsilat_NakitOdeme_Kaydet',
        'tahsilatSenetTahsilat': 'tahsilat_SenetTahsilat',
        'tahsilatSenetTahsilatKaydet': 'tahsilat_SenetTahsilat_Kaydet',
        'tahsilatCekTahsilat': 'tahsilat_CekTahsilat',
        'tahsilatCekTahsilatKaydet': 'tahsilat_CekTahsilat_Kaydet',
        'tahsilatMuhtelifTahsilat': 'tahsilat_MuhtelifTahsilat',
        'tahsilatMuhtelifOdeme': 'tahsilat_MuhtelifOdeme',
        'tahsilatMuhtelifTahsilatFiltre': 'tahsilat_MuhtelifTahsilatFiltre',
        'tahsilatMuhtelifTahsilatFiltreSQL':
            'tahsilat_MuhtelifTahsilatFiltreSQL',
        'tahsilatMuhtelifOdemeFiltre': 'tahsilat_MuhtelifOdemeFiltre',
        'tahsilatMuhtelifOdemeFiltreSQL': 'tahsilat_MuhtelifOdemeFiltreSQL',
        'yoneticiBankaBankaLitesi': 'yonetici_Banka_Banka_Litesi',
        'yoneticiBankaIslemleri': 'yonetici_Banka_Islemleri',
        'yoneticiBankaIslemleriSil': 'yonetici_Banka_Islemleri_Sil',
        'yoneticiBankaIslemHesapEFT': 'yonetici_Banka_Islem_HesapEFT',
        'yoneticiBankaIslemHesapVirman': 'yonetici_Banka_Islem_HesapVirman',
        'yoneticiBankaIslemCariEFT': 'yonetici_Banka_Islem_CariEFT',
        'finansBankaKasaTransferi': 'finans_Banka_Kasa_Transferi',
        'finansKasaListesi': 'finans_Kasa_Listesi',
        'finansKasaIslemleri': 'finans_Kasa_Islemleri',
        'finansKasaIslemleriSil': 'finans_Kasa_Islemleri_Sil',
        'finansKasalarArasiTransfer': 'finans_KasalarArasiTransfer',
        'finansKasaNakitTahsilat': 'finans_Kasa_NakitTahsilat',
        'finansKasaNakitOdeme': 'finans_Kasa_NakitOdeme',
        'finansKasaMuhtelifTahsilat': 'finans_Kasa_MuhtelifTahsilat',
        'finansKasaMuhtelifOdeme': 'finans_Kasa_MuhtelifOdeme',
        'finansKasaSenetTahsilati': 'finans_Kasa_SenetTahsilati',
        'finansKasaSenetOdemesi': 'finans_Kasa_SenetOdemesi',
        'finansKasaCekTahsilati': 'finans_Kasa_CekTahsilati',
        'finansKasaCekOdemesi': 'finans_Kasa_CekOdemesi',
        'dekontListesi': 'dekont_Listesi',
        'dekontKaydet': 'dekont_Kaydet',
        'dekontDuzelt': 'dekont_Duzelt',
        'dekontSil': 'dekont_Sil',
        'finansCekGizlenecekAlanlar': 'finans_Cek_GizlenecekAlanlar',
        'finansCekMusteri': 'finans_Cek_Musteri',
        'finansMCEKEkle': 'finans_MCEK_Ekle',
        'finansMCEKSil': 'finans_MCEK_Sil',
        'finansMCEKBelgeDetayi': 'finans_MCEK_BelgeDetayi',
        'finansMCEKHareketler': 'finans_MCEK_Hareketler',
        'finansMCEKEvraklar': 'finans_MCEK_Evraklar',
        'finansMCEKCariyeCiro': 'finans_MCEK_CariyeCiro',
        'finansMCEKTahsileCiro': 'finans_MCEK_TahsileCiro',
        'finansMCEKTahsilDekontu': 'finans_MCEK_TahsilDekontu',
        'finansCekBorc': 'finans_Cek_Borc',
        'finansBorcCekiEkle': 'finans_BorcCeki_Ekle',
        'finansBorcCekiSil': 'finans_BorcCeki_Sil',
        'finansBCEKBelgeDetayi': 'finans_BCEK_BelgeDetayi',
        'finansBCEKHareketler': 'finans_BCEK_Hareketler',
        'finansBCEKEvraklar': 'finans_BCEK_Evraklar',
        'finansBCEKOdemeDekontu': 'finans_BCEK_OdemeDekontu',
        'finansSenetMusteri': 'finans_Senet_Musteri',
        'finansMSENEkle': 'finans_MSEN_Ekle',
        'finansMSENSil': 'finans_MSEN_Sil',
        'finansMSENBelgeDetayi': 'finans_MSEN_BelgeDetayi',
        'finansMSENHareketler': 'finans_MSEN_Hareketler',
        'finansMSENEvraklar': 'finans_MSEN_Evraklar',
        'finansMSENCariyeCiro': 'finans_MSEN_CariyeCiro',
        'finansMSENTahsileCiro': 'finans_MSEN_TahsileCiro',
        'finansMSENTahsilDekontu': 'finans_MSEN_TahsilDekontu',
        'finansSenetBorc': 'finans_Senet_Borc',
        'finansBSENEkle': 'finans_BSEN_Ekle',
        'finansBSENSil': 'finans_BSEN_Sil',
        'finansBSENBelgeDetayi': 'finans_BSEN_BelgeDetayi',
        'finansBSENHareketler': 'finans_BSEN_Hareketler',
        'finansBSENEvraklar': 'finans_BSEN_Evraklar',
        'finansBSENOdemeDekontu': 'finans_BSEN_OdemeDekontu',
        'finansKKartiTahsilati': 'finans_KKartiTahsilati',
        'finansMuhtelifTahsilat': 'finans_MuhtelifTahsilat',
        'finansMuhtelifOdeme': 'finans_MuhtelifOdeme',
        'finansTahsilatKayitlari': 'finans_TahsilatKayitlari',
        'finansHizliTahsilatKayitlari': 'finans_HizliTahsilatKayitlari',
        'finansHizliTahsilatKayitlariSil': 'finans_HizliTahsilatKayitlari_Sil',
        'finansOrtalamaVadeTarihiHesaplama':
            'finans_OrtalamaVadeTarihiHesaplama',
        'finansOzetRapor': 'finans_OzetRapor',
        'finansRaporlarFinansalDurum': 'finans_Raporlar_FinansalDurum',
        'finansRaporlarAylikMizan': 'finans_Raporlar_AylikMizan',
        'temsilciProfil': 'temsilci_Profil',
        'temsilciProfilKdvDahil': 'temsilci_Profil_KdvDahil',
        'temsilciProfilSatisPerformansiniGizle':
            'temsilci_Profil_SatisPerformansiniGizle',
        'temsilciProfilAylaraGoreSatisiGizle':
            'temsilci_Profil_AylaraGoreSatisiGizle',
        'temsilciProfilAylaraGoreTahsilatiGizle':
            'temsilci_Profil_AylaraGoreTahsilatiGizle',
        'yazdirmaBluetoothYaziciKullanabilir':
            'yazdirma_BluetoothYaziciKullanabilir',
        'yazdirmaHucreEtiketi': 'yazdirma_Hucre_Etiketi',
        'yazdirmaHucreEtiketiYazicilari': 'yazdirma_Hucre_Etiketi_Yazicilari',
        'yazdirmaDizaynHucreEtiketi': 'yazdirma_Dizayn_HucreEtiketi',
        'yazdirmaMalToplamaEtiketi': 'yazdirma_MalToplama_Etiketi',
        'yazdirmaMalToplamaYazicilari': 'yazdirma_Mal_Toplama_Yazicilari',
        'yazdirmaDizaynMalToplama': 'yazdirma_Dizayn_MalToplama',
        'yazdirmaMalKontrolEtiketi': 'yazdirma_MalKontrol_Etiketi',
        'yazdirmaMalKontrolYazicilari': 'yazdirma_Mal_Kontrol_Yazicilari',
        'yazdirmaDizaynMalKontrol': 'yazdirma_Dizayn_MalKontrol',
        'yazdirmaDAT': 'yazdirma_DAT',
        'yazdirmaDATYazicilari': 'yazdirma_DAT_Yazicilari',
        'yazdirmaDizaynDAT': 'yazdirma_Dizayn_DAT',
        'yazdirmaPaketlemeEtiketi': 'yazdirma_Paketleme_Etiketi',
        'yazdirmaPaketlemeKopyaSayisiGizle':
            'yazdirma_Paketleme_KopyaSayisiGizle',
        'yazdirmaPaketlemeYazicilari': 'yazdirma_Paketleme_Yazicilari',
        'yazdirmaDizaynPaketleme': 'yazdirma_Dizayn_Paketleme',
        'yazdirmaSatisIrs': 'yazdirma_SatisIrs',
        'yazdirmaSatisFat': 'yazdirma_SatisFat',
        'yazdirmaSatisFatYazicilari': 'yazdirma_SatisFat_Yazicilari',
        'yazdirmaDizaynSatisFat': 'yazdirma_Dizayn_SatisFat',
        'yazdirmaAlisFat': 'yazdirma_AlisFat',
        'yazdirmaDizaynAlisFat': 'yazdirma_Dizayn_AlisFat',
        'yazdirmaMustahsil': 'yazdirma_Mustahsil',
        'yazdirmaMusSip': 'yazdirma_MusSip',
        'yazdirmaMusSipYazicilari': 'yazdirma_MusSip_Yazicilari',
        'yazdirmaDizaynMusSip': 'yazdirma_Dizayn_MusSip',
        'yazdirmaSaticiSip': 'yazdirma_SaticiSip',
        'yazdirmaDizaynSaticiSip': 'yazdirma_Dizayn_SaticiSip',
        'yazdirmaATAL': 'yazdirma_ATAL',
        'yazdirmaATALYazicilari': 'yazdirma_ATAL_Yazicilari',
        'yazdirmaDizaynATAL': 'yazdirma_Dizayn_ATAL',
        'yazdirmaOdemeMakbuzu': 'yazdirma_OdemeMakbuzu',
        'yazdirmaOdemeMakbuzuYazicilari': 'yazdirma_OdemeMakbuzu_Yazicilari',
        'yazdirmaDizaynOdemeMakbuzu': 'yazdirma_Dizayn_OdemeMakbuzu',
        'yazdirmaAlisIrs': 'yazdirma_AlisIrs',
        'yazdirmaAlisIrsYazicilari': 'yazdirma_AlisIrs_Yazicilari',
        'yazdirmaDizaynAlisIrs': 'yazdirma_Dizayn_AlisIrs',
        'yazdirmaIsEmri': 'yazdirma_IsEmri',
        'yazdirmaAmbarCikis': 'yazdirma_AmbarCikis',
        'yazdirmaAmbarGiris': 'yazdirma_AmbarGiris',
        'yazdirmaCariHareket': 'yazdirma_CariHareket',
        'uretimFiyatGorebilir': 'uretim_FiyatGorebilir',
        'uretimUSK': 'uretim_USK',
        'uretimUSKKaydet': 'uretim_USK_Kaydet',
        'uretimUSKDuzelt': 'uretim_USK_Duzelt',
        'uretimUSKSil': 'uretim_USK_Sil',
        'uretimUSKKacGunlukKayitlarListelensin':
            'uretim_USK_KacGunlukKayitlarListelensin',
        'uretimUSKMiktarBarkoddan': 'uretim_USK_MiktarBarkoddan',
        'uretimUSKMiktar1Gelsin': 'uretim_USK_Miktar1Gelsin',
        'sirketDepoUretimGiris': 'sirket_Depo_Uretim_Giris',
        'sirketDepoUretimCikis': 'sirket_Depo_Uretim_Cikis',
        'uretimUSKIsEmriOtoGelsin': 'uretim_USK_IsEmriOtoGelsin',
        'uretimUSKSoruSorulmasin': 'uretim_USK_SoruSorulmasin',
        'uretimUSKStokRehberiAcilmasin': 'uretim_USK_StokRehberiAcilmasin',
        'uretimUSKKlavyeEngelle': 'uretim_USK_KlavyeEngelle',
        'uretimUSKDepoOnceligi': 'uretim_USK_DepoOnceligi',
        'uretimUSKFisiErpUretsin': 'uretim_USK_FisiErpUretsin',
        'uretimUSKGizlenecekAlanlar': 'uretim_USK_GizlenecekAlanlar',
        'uretimUSKBosGecilmeyecekAlanlar': 'uretim_USK_BosGecilmeyecekAlanlar',
        'uretimUSKDegismeyecekAlanlar': 'uretim_USK_DegismeyecekAlanlar',
        'uretimUSKOlcuBirimi': 'uretim_USK_OlcuBirimi',
        'uretimUSKOtoYazdir': 'uretim_USK_OtoYazdir',
        'uretimUSKKalemliYapi': 'uretim_USK_KalemliYapi',
        'uretimUSKKalemliYapiStokMevcutaEklensin':
            'uretim_USK_KalemliYapi_StokMevcutaEklensin',
        'uretimUSKKalemliYapiOtoEtiketYazdir':
            'uretim_USK_KalemliYapi_OtoEtiketYazdir',
        'uretimUSKKalemliYapiAyniBarkodOkutulamaz':
            'uretim_USK_KalemliYapi_AyniBarkodOkutulamaz',
        'uretimUSKKalemliYapiOkutulanEnUsteEklensin':
            'uretim_USK_KalemliYapi_OkutulanEnUsteEklensin',
        'uretimUSKKalemliYapiKalemDuzeltilemesin':
            'uretim_USK_KalemliYapi_KalemDuzeltilemesin',
        'uretimReceteIzleme': 'uretim_ReceteIzleme',
        'uretimMalToplama': 'uretim_MalToplama',
        'uretimMalToplamaEkle': 'uretim_MalToplama_Ekle',
        'uretimMalToplamaSil': 'uretim_MalToplama_Sil',
        'uretimMalToplamaKlavyeEngelle': 'uretim_MalToplama_KlavyeEngelle',
        'uretimMalToplamaBarkodOkutsun': 'uretim_MalToplama_BarkodOkutsun',
        'uretimMalToplamaBelgeTipleri': 'uretim_MalToplama_BelgeTipleri',
        'uretimMalToplamaReceteFiltresi': 'uretim_MalToplama_ReceteFiltresi',
        'uretimMalToplamaReceteFiltresiSQL':
            'uretim_MalToplama_ReceteFiltresiSQL',
        'uretimIsEmri': 'uretim_IsEmri',
        'uretimIsEmriEkle': 'uretim_IsEmri_Ekle',
        'uretimIsEmriDuzelt': 'uretim_IsEmri_Duzelt',
        'uretimIsEmriSil': 'uretim_IsEmri_Sil',
        'taltekSTEK': 'taltek_STEK',
        'taltekSTEKKaydet': 'taltek_STEK_Kaydet',
        'taltekSTEKDuzelt': 'taltek_STEK_Duzelt',
        'taltekSTEKSil': 'taltek_STEK_Sil',
        'taltekSTEKKapalilarListenlenmesin':
            'taltek_STEK_KapalilarListenlenmesin',
        'taltekSTEKOnayIslemleri': 'taltek_STEK_OnayIslemleri',
        'taltekSTEKCariKoduDegistir': 'taltek_STEK_CariKoduDegistir',
        'taltekSTEKFiyatDegistirilmesin': 'taltek_STEK_FiyatDegistirilmesin',
        'taltekSTEKAciklamalarYetkiTuru': 'taltek_STEK_Aciklamalar_YetkiTuru',
        'taltekSTEKGizlenecekAlanlar': 'taltek_STEK_GizlenecekAlanlar',
        'taltekSTEKDegismeyecekAlanlar': 'taltek_STEK_DegismeyecekAlanlar',
        'taltekSTEKBosGecilmeyecekAlanlar':
            'taltek_STEK_BosGecilmeyecekAlanlar',
        'taltekSTEKAciklamaAlanlari': 'taltek_STEK_AciklamaAlanlari',
        'taltekSTEKOzelKod1Degeri': 'taltek_STEK_OzelKod1Degeri',
        'taltekSTEKDipFiyatUygulamasi': 'taltek_STEK_DipFiyatUygulamasi',
        'taltekSTEKDipFiyatSaha': 'taltek_STEK_DipFiyatSaha',
        'taltekSTEKDipFiyatEylem': 'taltek_STEK_DipFiyatEylem',
        'taltekATAL': 'taltek_ATAL',
        'taltekATALKaydet': 'taltek_ATAL_Kaydet',
        'taltekATALDuzelt': 'taltek_ATAL_Duzelt',
        'taltekATALSil': 'taltek_ATAL_Sil',
        'taltekATALCariEMailAlani': 'taltek_ATAL_CariEMailAlani',
        'taltekATALOnayIslemleri': 'taltek_ATAL_OnayIslemleri',
        'taltekATALCariKoduDegistir': 'taltek_ATAL_CariKoduDegistir',
        'taltekATALAciklamalarYetkiTuru': 'taltek_ATAL_Aciklamalar_YetkiTuru',
        'taltekATALGizlenecekAlanlar': 'taltek_ATAL_GizlenecekAlanlar',
        'taltekATALAciklamaAlanlari': 'taltek_ATAL_AciklamaAlanlari',
        'taltekATALBelgeKopyala': 'taltek_ATAL_BelgeKopyala',
        'taltekSTAL': 'taltek_STAL',
        'taltekSTALKaydet': 'taltek_STAL_Kaydet',
        'taltekSTALDuzelt': 'taltek_STAL_Duzelt',
        'taltekSTALSil': 'taltek_STAL_Sil',
        'taltekSTALKapalilarListenlenmesin':
            'taltek_STAL_KapalilarListenlenmesin',
        'taltekSTALOnayIslemleri': 'taltek_STAL_OnayIslemleri',
        'taltekSTALCariKoduDegistir': 'taltek_STAL_CariKoduDegistir',
        'taltekSTALFiyatDegistirilmesin': 'taltek_STAL_FiyatDegistirilmesin',
        'taltekSTALGizlenecekAlanlar': 'taltek_STAL_GizlenecekAlanlar',
        'taltekSTALDipFiyatUygulamasi': 'taltek_STAL_DipFiyatUygulamasi',
        'ebelgeEFat': 'ebelge_EFat',
        'ebelgeEFatCariGuncelle': 'ebelge_EFatCariGuncelle',
        'ebelgeEFatSorgula': 'ebelge_EFatSorgula',
        'ebelgeEFatGelenKutusu': 'ebelge_EFatGelenKutusu',
        'ebelgeEFatTaslakOlustur': 'ebelge_EFatTaslakOlustur',
        'ebelgeEFatTaslakSil': 'ebelge_EFatTaslakSil',
        'ebelgeEFatTaslakBasim': 'ebelge_EFatTaslakBasim',
        'ebelgeEFatGoruntule': 'ebelge_EFatGoruntule',
        'ebelgeEFatAlisFatOlustur': 'ebelge_EFatAlisFatOlustur',
        'ebelgeEFatGonder': 'ebelge_EFatGonder',
        'ebelgeEFatDizayn': 'ebelge_EFat_Dizayn',
        'ebelgeEArsiv': 'ebelge_EArsiv',
        'ebelgeEArsivTaslakOlustur': 'ebelge_EArsivTaslakOlustur',
        'ebelgeEArsivTaslakSil': 'ebelge_EArsivTaslakSil',
        'ebelgeEArsivTaslakBasim': 'ebelge_EArsivTaslakBasim',
        'ebelgeEArsivGoruntule': 'ebelge_EArsivGoruntule',
        'ebelgeEArsivSorgula': 'ebelge_EArsivSorgula',
        'ebelgeEArsivGonder': 'ebelge_EArsivGonder',
        'ebelgeEArsivDizayn': 'ebelge_EArsiv_Dizayn',
        'ebelgeEIrsaliye': 'ebelge_EIrsaliye',
        'ebelgeEIrsaliyeGidenKutusu': 'ebelge_EIrsaliyeGidenKutusu',
        'ebelgeEIrsaliyeGelenKutusu': 'ebelge_EIrsaliyeGelenKutusu',
        'ebelgeEIrsaliyeTaslakOlustur': 'ebelge_EIrsaliyeTaslakOlustur',
        'ebelgeEIrsaliyeTaslakSil': 'ebelge_EIrsaliyeTaslakSil',
        'ebelgeEIrsaliyeTaslakBasim': 'ebelge_EIrsaliyeTaslakBasim',
        'ebelgeEIrsaliyeGonder': 'ebelge_EIrsaliyeGonder',
        'ebelgeEIrsaliyeGoruntule': 'ebelge_EIrsaliyeGoruntule',
        'ebelgeEIrsaliyeDizayn': 'ebelge_EIrsaliye_Dizayn',
        'entegrasyonUETDSESYA': 'entegrasyon_UETDSESYA',
        'entegrasyonUETDSESYAIptal': 'entegrasyon_UETDSESYA_Iptal'
      },
    );

Map<String, dynamic> _$ProfilYetkiModelToJson(ProfilYetkiModel instance) =>
    <String, dynamic>{
      'yazdirma_SatisIrs_Yazicilari': instance.yazdirmaSatisIrsYazicilari,
      'yazdirma_Dizayn_SatisIrs': instance.yazdirmaDizaynSatisIrs,
      'yazdirma_SatisTalebi': instance.yazdirmaSatisTalebi,
      'yazdirma_SatisTalebi_Yazicilari': instance.yazdirmaSatisTalebiYazicilari,
      'yazdirma_Dizayn_SatisTalebi': instance.yazdirmaDizaynSatisTalebi,
      'yazdirma_SatisTeklifi': instance.yazdirmaSatisTeklifi,
      'yazdirma_Dizayn_SatisTeklifi': instance.yazdirmaDizaynSatisTeklifi,
      'yazdirma_Sayim': instance.yazdirmaSayim,
      'yazdirma_Sayim_Yazicilari': instance.yazdirmaSayimYazicilari,
      'yazdirma_Dizayn_Sayim': instance.yazdirmaDizaynSayim,
      'yazdirma_Sevkiyat_Etiketi': instance.yazdirmaSevkiyatEtiketi,
      'yazdirma_Sevkiyat_Etiketi_Yazicilari':
          instance.yazdirmaSevkiyatEtiketiYazicilari,
      'yazdirma_Dizayn_SevkiyatEtiketi': instance.yazdirmaDizaynSevkiyatEtiketi,
      'yazdirma_Sevkiyat_Etiketi_KopyaSayisiGizle':
          instance.yazdirmaSevkiyatEtiketiKopyaSayisiGizle,
      'yazdirma_Serbest': instance.yazdirmaSerbest,
      'yazdirma_Serbest_Yazicilari': instance.yazdirmaSerbestYazicilari,
      'yazdirma_Dizayn_Serbest': instance.yazdirmaDizaynSerbest,
      'yazdirma_SeriEtiketi': instance.yazdirmaSeriEtiketi,
      'yazdirma_Seri_Etiketi_Yazicilari':
          instance.yazdirmaSeriEtiketiYazicilari,
      'yazdirma_Dizayn_SeriEtiketi': instance.yazdirmaDizaynSeriEtiketi,
      'yazdirma_Stok_Etiketi': instance.yazdirmaStokEtiketi,
      'yazdirma_Stok_Etiketi_Yazicilari':
          instance.yazdirmaStokEtiketiYazicilari,
      'yazdirma_Dizayn_StokEtiketi': instance.yazdirmaDizaynStokEtiketi,
      'yazdirma_TahsilatMakbuzu': instance.yazdirmaTahsilatMakbuzu,
      'yazdirma_Dizayn_TahsilatMakbuzu': instance.yazdirmaDizaynTahsilatMakbuzu,
      'yazdirma_USK': instance.yazdirmaUSK,
      'yazdirma_USK_Yazicilari': instance.yazdirmaUSKYazicilari,
      'yazdirma_Dizayn_USK': instance.yazdirmaDizaynUSK,
      'yazdirma_UretMalTop': instance.yazdirmaUretMalTop,
      'yazdirma_UretMalTop_Yazicilari': instance.yazdirmaUretMalTopYazicilari,
      'yazdirma_Dizayn_UretMalTop': instance.yazdirmaDizaynUretMalTop,
      'kullanicilar': instance.kullanicilar,
      'sirket_TamEkranAcilsin': instance.sirketTamEkranAcilsin,
      'sirket_RehberdeCariKodGizle': instance.sirketRehberdeCariKodGizle,
      'sirket_RehberdeStokKodGizle': instance.sirketRehberdeStokKodGizle,
      'sirket_RaporlardaFiyatGizle': instance.sirketRaporlardaFiyatGizle,
      'sirket_TarihDegismesin': instance.sirketTarihDegismesin,
      'sirket_DevirSirketineGiris': instance.sirketDevirSirketineGiris,
      'sirket_KontrolluAktar_BelgeTipleri':
          instance.sirketKontrolluAktarBelgeTipleri,
      'sirket_KontrolluAktar_BelgeNoGoster':
          instance.sirketKontrolluAktarBelgeNoGoster,
      'sirket_KontrolAciklamasi_BelgeTipleri':
          instance.sirketKontrolAciklamasiBelgeTipleri,
      'sirket_TLFiyatGelsin_BelgeTipleri':
          instance.sirketTLFiyatGelsinBelgeTipleri,
      'sirket_KalemKayitKontrol_BelgeTipleri':
          instance.sirketKalemKayitKontrolBelgeTipleri,
      'sirket_aktifDepolar': instance.sirketAktifDepolar,
      'sirket_satisDepo': instance.sirketSatisDepo,
      'sirket_satisDepo_Ozellestir': instance.sirketSatisDepoOzellestir,
      'sirket_satisDepo_MusSip': instance.sirketSatisDepoMusSip,
      'sirket_satisDepo_SatisFat': instance.sirketSatisDepoSatisFat,
      'sirket_satisDepo_SatisIrs': instance.sirketSatisDepoSatisIrs,
      'sirket_alisDepo': instance.sirketAlisDepo,
      'sirket_iadeDepo': instance.sirketIadeDepo,
      'sirket_projeKodu': instance.sirketProjeKodu,
      'sirket_aktifProjeler': instance.sirketAktifProjeler,
      'ayarlar_FirmaAyarlari': instance.ayarlarFirmaAyarlari,
      'ayarlar_Oturumlar': instance.ayarlarOturumlar,
      'sirket_SifreHatirlamaDurumu': instance.sirketSifreHatirlamaDurumu,
      'genel_DovizKurlari': instance.genelDovizKurlari,
      'genel_DovizKurlari_Ekle': instance.genelDovizKurlariEkle,
      'genel_DovizKurlari_Duzelt': instance.genelDovizKurlariDuzelt,
      'genel_DovizKurlari_Sil': instance.genelDovizKurlariSil,
      'genel_BelgeKontrol': instance.genelBelgeKontrol,
      'genel_BelgeKontrol_Ekle': instance.genelBelgeKontrolEkle,
      'genel_BelgeKontrol_Sil': instance.genelBelgeKontrolSil,
      'genel_BelgeKontrol_BelgeTipleri': instance.genelBelgeKontrolBelgeTipleri,
      'genel_BelgeKontrol_BarkodOkutsun':
          instance.genelBelgeKontrolBarkodOkutsun,
      'genel_BelgeKontrol_MiktarOtomatikGelsin':
          instance.genelBelgeKontrolMiktarOtomatikGelsin,
      'genel_BelgeKontrol_KalemDetaySorulmasin':
          instance.genelBelgeKontrolKalemDetaySorulmasin,
      'genel_BelgeKontrol_BelgeOnaySormasin':
          instance.genelBelgeKontrolBelgeOnaySormasin,
      'malKabul_FiyatDegistirilmesin': instance.malKabulFiyatDegistirilmesin,
      'malKabul_AlisIrs_BelgeTipleri': instance.malKabulAlisIrsBelgeTipleri,
      'malKabul_AlisIrs_GizlenecekAlanlar':
          instance.malKabulAlisIrsGizlenecekAlanlar,
      'malKabul_AlisIrs_AciklamaAlanlari':
          instance.malKabulAlisIrsAciklamaAlanlari,
      'malKabul_SatinAlma': instance.malKabulSatinAlma,
      'malKabul_SatinAlma_Kaydet': instance.malKabulSatinAlmaKaydet,
      'malKabul_SatinAlma_Duzelt': instance.malKabulSatinAlmaDuzelt,
      'malKabul_SatinAlma_Sil': instance.malKabulSatinAlmaSil,
      'malKabul_AlisIrsaliyesiFiyatGor':
          instance.malKabulAlisIrsaliyesiFiyatGor,
      'malKabul_AlisIrs_DigerSekmesiGoster':
          instance.malKabulAlisIrsDigerSekmesiGoster,
      'malKabul_AlisIrs_SipBagSecenegi': instance.malKabulAlisIrsSipBagSecenegi,
      'malKabul_AlisIrs_ReferansStokUygulamasi':
          instance.malKabulAlisIrsReferansStokUygulamasi,
      'malKabul_AlisIrs_SipBag_SipHariciKalemEklenebilir':
          instance.malKabulAlisIrsSipBagSipHariciKalemEklenebilir,
      'malKabul_AlisIrs_SipBag_FazlaTeslimatYapilabilir':
          instance.malKabulAlisIrsSipBagFazlaTeslimatYapilabilir,
      'malKabul_AlisIrs_SipBag_SipOkutulsun':
          instance.malKabulAlisIrsSipBagSipOkutulsun,
      'malKabul_AlisIrs_SipBag_CokluSecim':
          instance.malKabulAlisIrsSipBagCokluSecim,
      'malKabul_AlisIrs_SipBag_TumKalemlerSecilsin':
          instance.malKabulAlisIrsSipBagTumKalemlerSecilsin,
      'malKabul_AlisIrs_SipBag_EslesmeDurumu':
          instance.malKabulAlisIrsSipBagEslesmeDurumu,
      'malKabul_AlisIrs_BarkodluGiris': instance.malKabulAlisIrsBarkodluGiris,
      'malKabul_AlisIrs_MiktarOtomatikGelsin':
          instance.malKabulAlisIrsMiktarOtomatikGelsin,
      'malKabul_AlisIrs_KalemDetaySorulmasin':
          instance.malKabulAlisIrsKalemDetaySorulmasin,
      'malKabul_AlisIrs_KalemlerBirlestirilsin':
          instance.malKabulAlisIrsKalemlerBirlestirilsin,
      'malKabul_AlisIrs_StokRehberiAcilmasin':
          instance.malKabulAlisIrsStokRehberiAcilmasin,
      'malKabul_AlisIrs_KalemDuzeltilemesin':
          instance.malKabulAlisIrsKalemDuzeltilemesin,
      'malKabul_AlisIrs_TekrarEdenBarkod':
          instance.malKabulAlisIrsTekrarEdenBarkod,
      'malKabul_AlisIrs_KlavyeEngelle': instance.malKabulAlisIrsKlavyeEngelle,
      'malKabul_AlisIrs_Miktar1Gelsin': instance.malKabulAlisIrsMiktar1Gelsin,
      'malKabul_AlisIrs_Raporlar': instance.malKabulAlisIrsRaporlar,
      'malKabul_AlisIrs_KalemRaporu': instance.malKabulAlisIrsKalemRaporu,
      'malKabul_AlisIrs_OtoBasimYap': instance.malKabulAlisIrsOtoBasimYap,
      'malKabul_AlisIrs_KacGunlukKayitlarListelensin':
          instance.malKabulAlisIrsKacGunlukKayitlarListelensin,
      'malKabul_AlisIrs_FiyatSirasi': instance.malKabulAlisIrsFiyatSirasi,
      'malKabul_AlisIrs_Birim1denKaydet':
          instance.malKabulAlisIrsBirim1denKaydet,
      'malKabul_AlisIrs_CariKoduDegistir':
          instance.malKabulAlisIrsCariKoduDegistir,
      'malKabul_AlisIrs_CariRehPlaEslesmesin':
          instance.malKabulAlisIrsCariRehPlaEslesmesin,
      'malKabul_Iade': instance.malKabulIade,
      'malKabul_Iade_Kaydet': instance.malKabulIadeKaydet,
      'malKabul_Iade_Duzelt': instance.malKabulIadeDuzelt,
      'malKabul_Iade_Sil': instance.malKabulIadeSil,
      'malKabul_AlisFaturasi_BelgeTipleri':
          instance.malKabulAlisFaturasiBelgeTipleri,
      'malKabul_AlisFaturasi': instance.malKabulAlisFaturasi,
      'malKabul_AlisFaturasi_Kaydet': instance.malKabulAlisFaturasiKaydet,
      'malKabul_AlisFaturasi_Duzelt': instance.malKabulAlisFaturasiDuzelt,
      'malKabul_AlisFaturasi_Sil': instance.malKabulAlisFaturasiSil,
      'malKabul_AlisFat_DigerSekmesiGoster':
          instance.malKabulAlisFatDigerSekmesiGoster,
      'malKabul_AlisFat_KacGunlukKayitlarListelensin':
          instance.malKabulAlisFatKacGunlukKayitlarListelensin,
      'malKabul_AlisFat_FiyatSirasi': instance.malKabulAlisFatFiyatSirasi,
      'malKabul_AlisFat_Birim1denKaydet':
          instance.malKabulAlisFatBirim1denKaydet,
      'malKabul_AlisFat_Aciklamalar_YetkiTuru':
          instance.malKabulAlisFatAciklamalarYetkiTuru,
      'malKabul_AlisFat_AciklamaAlanlari':
          instance.malKabulAlisFatAciklamaAlanlari,
      'malKabul_AlisFat_CariKoduDegistir':
          instance.malKabulAlisFatCariKoduDegistir,
      'malKabul_AlisFat_BarkodluGiris': instance.malKabulAlisFatBarkodluGiris,
      'malKabul_AlisFat_MiktarOtomatikGelsin':
          instance.malKabulAlisFatMiktarOtomatikGelsin,
      'malKabul_AlisFat_KalemDetaySorulmasin':
          instance.malKabulAlisFatKalemDetaySorulmasin,
      'malKabul_AlisFat_StokRehberiAcilmasin':
          instance.malKabulAlisFatStokRehberiAcilmasin,
      'malKabul_AlisFat_KalemDuzeltilemesin':
          instance.malKabulAlisFatKalemDuzeltilemesin,
      'malKabul_AlisFat_KlavyeEngelle': instance.malKabulAlisFatKlavyeEngelle,
      'malKabul_AlisFat_Miktar1Gelsin': instance.malKabulAlisFatMiktar1Gelsin,
      'malKabul_AlisFat_ReferansStokUygulamasi':
          instance.malKabulAlisFatReferansStokUygulamasi,
      'malKabul_AlisFat_SipBag_SipHariciKalemEklenebilir':
          instance.malKabulAlisFatSipBagSipHariciKalemEklenebilir,
      'malKabul_AlisFat_SipBag_FazlaTeslimatYapilabilir':
          instance.malKabulAlisFatSipBagFazlaTeslimatYapilabilir,
      'malKabul_AlisFat_SipBag_SipOkutulsun':
          instance.malKabulAlisFatSipBagSipOkutulsun,
      'malKabul_AlisFat_SipBag_CokluSecim':
          instance.malKabulAlisFatSipBagCokluSecim,
      'malKabul_AlisFat_SipBag_TumKalemlerSecilsin':
          instance.malKabulAlisFatSipBagTumKalemlerSecilsin,
      'malKabul_AlisFat_SipBag_EslesmeDurumu':
          instance.malKabulAlisFatSipBagEslesmeDurumu,
      'malKabul_AlisFat_Raporlar': instance.malKabulAlisFatRaporlar,
      'malKabul_AlisFat_KalemRaporu': instance.malKabulAlisFatKalemRaporu,
      'malKabul_Mustahsil': instance.malKabulMustahsil,
      'malKabul_Mustahsil_Ekle': instance.malKabulMustahsilEkle,
      'malKabul_Mustahsil_Duzelt': instance.malKabulMustahsilDuzelt,
      'malKabul_Mustahsil_Sil': instance.malKabulMustahsilSil,
      'transfer_DAT': instance.transferDAT,
      'transfer_DAT_Kaydet': instance.transferDATKaydet,
      'transfer_DAT_Duzelt': instance.transferDATDuzelt,
      'transfer_DAT_Sil': instance.transferDATSil,
      'transfer_DAT_FiyatGor': instance.transferDATFiyatGor,
      'transfer_DAT_OtoEtiketBas': instance.transferDATOtoEtiketBas,
      'transfer_DAT_VarsayilanCikisDepo':
          instance.transferDATVarsayilanCikisDepo,
      'transfer_DAT_VarsayilanGirisDepo':
          instance.transferDATVarsayilanGirisDepo,
      'transfer_DAT_eIrsIsaretleyemesin':
          instance.transferDATEIrsIsaretleyemesin,
      'transfer_DAT_DigerSekmesiGoster': instance.transferDATDigerSekmesiGoster,
      'transfer_DAT_BarkodluGiris': instance.transferDATBarkodluGiris,
      'transfer_DAT_MiktarOtomatikGelsin':
          instance.transferDATMiktarOtomatikGelsin,
      'transfer_DAT_KalemDetaySorulmasin':
          instance.transferDATKalemDetaySorulmasin,
      'transfer_DAT_StokRehberiAcilmasin':
          instance.transferDATStokRehberiAcilmasin,
      'transfer_DAT_KalemDuzeltilemesin':
          instance.transferDATKalemDuzeltilemesin,
      'transfer_DAT_KlavyeEngelle': instance.transferDATKlavyeEngelle,
      'transfer_DAT_Miktar1Gelsin': instance.transferDATMiktar1Gelsin,
      'transfer_DAT_KalemlerBirlestirilsin':
          instance.transferDATKalemlerBirlestirilsin,
      'transfer_DAT_KacGunlukKayitlarListelensin':
          instance.transferDATKacGunlukKayitlarListelensin,
      'transfer_DAT_OnayIslemleri': instance.transferDATOnayIslemleri,
      'transfer_DAT_OnayIslemleri_Depolar':
          instance.transferDATOnayIslemleriDepolar,
      'transfer_DAT_EkAlan2Hatirla': instance.transferDATEkAlan2Hatirla,
      'transfer_DAT_EkAlan2Tablodan': instance.transferDATEkAlan2Tablodan,
      'transfer_DAT_LokalDATSeciliGelmesin':
          instance.transferDATLokalDATSeciliGelmesin,
      'transfer_DAT_SeriGirisHarYapabilsin':
          instance.transferDATSeriGirisHarYapabilsin,
      'transfer_DAT_Birim1denKaydet': instance.transferDATBirim1denKaydet,
      'transfer_DAT_Barkod2Sor': instance.transferDATBarkod2Sor,
      'transfer_DAT_BosGecilmeyecekAlanlar':
          instance.transferDATBosGecilmeyecekAlanlar,
      'transfer_DAT_GizlenecekAlanlar': instance.transferDATGizlenecekAlanlar,
      'transfer_DAT_DegismeyecekAlanlar':
          instance.transferDATDegismeyecekAlanlar,
      'transfer_DAT_AciklamaAlanlari': instance.transferDATAciklamaAlanlari,
      'transfer_DAT_SipBagSecenegi': instance.transferDATSipBagSecenegi,
      'transfer_DAT_ReferansStokUygulamasi':
          instance.transferDATReferansStokUygulamasi,
      'transfer_DAT_SipBag_SipHariciKalemEklenebilir':
          instance.transferDATSipBagSipHariciKalemEklenebilir,
      'transfer_DAT_SipBag_FazlaTeslimatYapilabilir':
          instance.transferDATSipBagFazlaTeslimatYapilabilir,
      'transfer_DAT_SipBag_SipOkutulsun':
          instance.transferDATSipBagSipOkutulsun,
      'transfer_DAT_SipBag_SipOkutulsun_Miktar2BazAl':
          instance.transferDATSipBagSipOkutulsunMiktar2BazAl,
      'transfer_DAT_SipBag_SipOkutulsun_KalanMiktarGelsin':
          instance.transferDATSipBagSipOkutulsunKalanMiktarGelsin,
      'transfer_DAT_SipBag_CokluSecim': instance.transferDATSipBagCokluSecim,
      'transfer_DAT_SipBag_TumKalemlerSecilsin':
          instance.transferDATSipBagTumKalemlerSecilsin,
      'transfer_DAT_SipBag_EslesmeDurumu':
          instance.transferDATSipBagEslesmeDurumu,
      'transfer_DAT_SipBag_MalToplananlarGelsin':
          instance.transferDATSipBagMalToplananlarGelsin,
      'transfer_DAT_SipBag_SevkOnayliSiparislerGelsin':
          instance.transferDATSipBagSevkOnayliSiparislerGelsin,
      'transfer_AG': instance.transferAG,
      'transfer_AG_Kaydet': instance.transferAGKaydet,
      'transfer_AG_Duzelt': instance.transferAGDuzelt,
      'transfer_AG_Sil': instance.transferAGSil,
      'transfer_AG_FiyatGor': instance.transferAGFiyatGor,
      'transfer_AG_KacGunlukKayitlarListelensin':
          instance.transferAGKacGunlukKayitlarListelensin,
      'transfer_AG_VarsayilanDepo': instance.transferAGVarsayilanDepo,
      'transfer_AG_DigerSekmesiGoster': instance.transferAGDigerSekmesiGoster,
      'transfer_AG_BelgeKopyala': instance.transferAGBelgeKopyala,
      'transfer_AG_Birim1denKaydet': instance.transferAGBirim1denKaydet,
      'transfer_AG_OtoBasimYap': instance.transferAGOtoBasimYap,
      'transfer_AG_SeriGirisHarYapabilsin':
          instance.transferAGSeriGirisHarYapabilsin,
      'transfer_AG_BarkodluGiris': instance.transferAGBarkodluGiris,
      'transfer_AG_MiktarOtomatikGelsin':
          instance.transferAGMiktarOtomatikGelsin,
      'transfer_AG_KalemDetaySorulmasin':
          instance.transferAGKalemDetaySorulmasin,
      'transfer_AG_StokRehberiAcilmasin':
          instance.transferAGStokRehberiAcilmasin,
      'transfer_AG_KalemDuzeltilemesin': instance.transferAGKalemDuzeltilemesin,
      'transfer_AG_KlavyeEngelle': instance.transferAGKlavyeEngelle,
      'transfer_AG_Miktar1Gelsin': instance.transferAGMiktar1Gelsin,
      'transfer_AG_ReferansStokUygulamasi':
          instance.transferAGReferansStokUygulamasi,
      'transfer_AG_SipBag_SipHariciKalemEklenebilir':
          instance.transferAGSipBagSipHariciKalemEklenebilir,
      'transfer_AG_SipBag_FazlaTeslimatYapilabilir':
          instance.transferAGSipBagFazlaTeslimatYapilabilir,
      'transfer_AG_SipBag_SipOkutulsun': instance.transferAGSipBagSipOkutulsun,
      'transfer_AG_SipBag_SipOkutulsun_Miktar2BazAl':
          instance.transferAGSipBagSipOkutulsunMiktar2BazAl,
      'transfer_AG_SipBag_CokluSecim': instance.transferAGSipBagCokluSecim,
      'transfer_AG_SipBag_TumKalemlerSecilsin':
          instance.transferAGSipBagTumKalemlerSecilsin,
      'transfer_AG_SipBag_EslesmeDurumu':
          instance.transferAGSipBagEslesmeDurumu,
      'transfer_AG_SipBag_MalToplananlarGelsin':
          instance.transferAGSipBagMalToplananlarGelsin,
      'transfer_AG_SipBag_SevkOnayliSiparislerGelsin':
          instance.transferAGSipBagSevkOnayliSiparislerGelsin,
      'transfer_AC': instance.transferAC,
      'transfer_AC_Kaydet': instance.transferACKaydet,
      'transfer_AC_Duzelt': instance.transferACDuzelt,
      'transfer_AC_Sil': instance.transferACSil,
      'transfer_AC_FiyatGor': instance.transferACFiyatGor,
      'transfer_AC_KacGunlukKayitlarListelensin':
          instance.transferACKacGunlukKayitlarListelensin,
      'transfer_AC_VarsayilanDepo': instance.transferACVarsayilanDepo,
      'transfer_AC_eIrsIsaretleyemesin': instance.transferACEIrsIsaretleyemesin,
      'transfer_AC_DigerSekmesiGoster': instance.transferACDigerSekmesiGoster,
      'transfer_AC_BelgeKopyala': instance.transferACBelgeKopyala,
      'transfer_AC_Birim1denKaydet': instance.transferACBirim1denKaydet,
      'transfer_AC_OtoBasimYap': instance.transferACOtoBasimYap,
      'transfer_AC_SeriGirisHarYapabilsin':
          instance.transferACSeriGirisHarYapabilsin,
      'transfer_AC_EkAlan2Tablodan': instance.transferACEkAlan2Tablodan,
      'transfer_AC_EkAlan2Hatirla': instance.transferACEkAlan2Hatirla,
      'transfer_AC_MinStokMikGoster': instance.transferACMinStokMikGoster,
      'transfer_AC_BosGecilmeyecekAlanlar':
          instance.transferACBosGecilmeyecekAlanlar,
      'transfer_AC_BarkodluGiris': instance.transferACBarkodluGiris,
      'transfer_AC_MiktarOtomatikGelsin':
          instance.transferACMiktarOtomatikGelsin,
      'transfer_AC_KalemDetaySorulmasin':
          instance.transferACKalemDetaySorulmasin,
      'transfer_AC_StokRehberiAcilmasin':
          instance.transferACStokRehberiAcilmasin,
      'transfer_AC_KalemDuzeltilemesin': instance.transferACKalemDuzeltilemesin,
      'transfer_AC_KlavyeEngelle': instance.transferACKlavyeEngelle,
      'transfer_AC_Miktar1Gelsin': instance.transferACMiktar1Gelsin,
      'transfer_AC_ReferansStokUygulamasi':
          instance.transferACReferansStokUygulamasi,
      'transfer_AC_SipBag_SipHariciKalemEklenebilir':
          instance.transferACSipBagSipHariciKalemEklenebilir,
      'transfer_AC_SipBag_FazlaTeslimatYapilabilir':
          instance.transferACSipBagFazlaTeslimatYapilabilir,
      'transfer_AC_SipBag_SipOkutulsun': instance.transferACSipBagSipOkutulsun,
      'transfer_AC_SipBag_SipOkutulsun_Miktar2BazAl':
          instance.transferACSipBagSipOkutulsunMiktar2BazAl,
      'transfer_AC_SipBag_CokluSecim': instance.transferACSipBagCokluSecim,
      'transfer_AC_SipBag_TumKalemlerSecilsin':
          instance.transferACSipBagTumKalemlerSecilsin,
      'transfer_AC_SipBag_EslesmeDurumu':
          instance.transferACSipBagEslesmeDurumu,
      'transfer_AC_SipBag_MalToplananlarGelsin':
          instance.transferACSipBagMalToplananlarGelsin,
      'transfer_AC_SipBag_SevkOnayliSiparislerGelsin':
          instance.transferACSipBagSevkOnayliSiparislerGelsin,
      'transfer_DepoTalebi': instance.transferDepoTalebi,
      'transfer_DepoTalebi_Sil': instance.transferDepoTalebiSil,
      'transfer_DepoTalebi_MalTop': instance.transferDepoTalebiMalTop,
      'transfer_DepoTalebi_MalTop_FazlaTeslimat':
          instance.transferDepoTalebiMalTopFazlaTeslimat,
      'hucre_GiristeHucreYerlestir': instance.hucreGiristeHucreYerlestir,
      'hucre_CikistaHucreYerlestir': instance.hucreCikistaHucreYerlestir,
      'hucre_Yerlestir': instance.hucreYerlestir,
      'hucre_YerlestirBelgesiz': instance.hucreYerlestirBelgesiz,
      'hucre_Yerlestir_KlavyeEngelle': instance.hucreYerlestirKlavyeEngelle,
      'hucre_Yerlestir_RehberdenStokSecilmesin':
          instance.hucreYerlestirRehberdenStokSecilmesin,
      'hucre_Yerlestir_HangiHucrede': instance.hucreYerlestirHangiHucrede,
      'hucre_Yerlestir_BelgeTipleri': instance.hucreYerlestirBelgeTipleri,
      'hucre_Bosalt': instance.hucreBosalt,
      'hucre_BosaltBelgesiz': instance.hucreBosaltBelgesiz,
      'hucre_Bosalt_KlavyeEngelle': instance.hucreBosaltKlavyeEngelle,
      'hucre_Bosalt_RehberdenStokSecilmesin':
          instance.hucreBosaltRehberdenStokSecilmesin,
      'hucre_Bosalt_HangiHucrede': instance.hucreBosaltHangiHucrede,
      'hucre_Bosalt_BelgeTipleri': instance.hucreBosaltBelgeTipleri,
      'hucre_Arama': instance.hucreArama,
      'hucre_AramaTumDepolar': instance.hucreAramaTumDepolar,
      'hucre_AramaOzelFonksiyon': instance.hucreAramaOzelFonksiyon,
      'hucre_Transfer': instance.hucreTransfer,
      'hucre_Transfer_KlavyeEngelle': instance.hucreTransferKlavyeEngelle,
      'hucre_Transfer_RehberdenStokSecilmesin':
          instance.hucreTransferRehberdenStokSecilmesin,
      'hucre_Transfer_BelgeTipleri': instance.hucreTransferBelgeTipleri,
      'hucre_Listesi': instance.hucreListesi,
      'hucre_Bosalt_OtomatikStokEtiketiYazdir':
          instance.hucreBosaltOtomatikStokEtiketiYazdir,
      'hucre_BakiyeDurumu': instance.hucreBakiyeDurumu,
      'hucre_Hareketleri': instance.hucreHareketleri,
      'hucre_Hareketleri_Sil': instance.hucreHareketleriSil,
      'sevkiyat_SatisIrsaliyesi_BelgeTipleri':
          instance.sevkiyatSatisIrsaliyesiBelgeTipleri,
      'sevkiyat_SatisIrsaliyesi_GizlenecekAlanlar':
          instance.sevkiyatSatisIrsaliyesiGizlenecekAlanlar,
      'sevkiyat_SatisIrsaliyesi_DegismeyecekAlanlar':
          instance.sevkiyatSatisIrsaliyesiDegismeyecekAlanlar,
      'sevkiyat_SatisIrsaliyesi': instance.sevkiyatSatisIrsaliyesi,
      'sevkiyat_SatisIrsaliyesiKayit': instance.sevkiyatSatisIrsaliyesiKayit,
      'sevkiyat_SatisIrsaliyesiDuzeltme':
          instance.sevkiyatSatisIrsaliyesiDuzeltme,
      'sevkiyat_SatisIrsaliyesiSilme': instance.sevkiyatSatisIrsaliyesiSilme,
      'sevkiyat_SatisIrsaliyesiFiyatGor':
          instance.sevkiyatSatisIrsaliyesiFiyatGor,
      'sevkiyat_SatisIrs_DigerSekmesiGoster':
          instance.sevkiyatSatisIrsDigerSekmesiGoster,
      'sevkiyat_SatisIrsaliyesi_SipBagSecenegi':
          instance.sevkiyatSatisIrsaliyesiSipBagSecenegi,
      'sevkiyat_SatisIrs_ReferansStokUygulamasi':
          instance.sevkiyatSatisIrsReferansStokUygulamasi,
      'sevkiyat_SatisIrs_SipBag_SipHariciKalemEklenebilir':
          instance.sevkiyatSatisIrsSipBagSipHariciKalemEklenebilir,
      'sevkiyat_SatisIrs_SipBag_FazlaTeslimatYapilabilir':
          instance.sevkiyatSatisIrsSipBagFazlaTeslimatYapilabilir,
      'sevkiyat_SatisIrs_SipBag_SipOkutulsun':
          instance.sevkiyatSatisIrsSipBagSipOkutulsun,
      'sevkiyat_SatisIrs_SipBag_SipOkutulsun_Miktar2BazAl':
          instance.sevkiyatSatisIrsSipBagSipOkutulsunMiktar2BazAl,
      'sevkiyat_SatisIrs_SipBag_SipOkutulsun_KalanMiktarGelsin':
          instance.sevkiyatSatisIrsSipBagSipOkutulsunKalanMiktarGelsin,
      'sevkiyat_SatisIrs_SipBag_CokluSecim':
          instance.sevkiyatSatisIrsSipBagCokluSecim,
      'sevkiyat_SatisIrs_SipBag_TumKalemlerSecilsin':
          instance.sevkiyatSatisIrsSipBagTumKalemlerSecilsin,
      'sevkiyat_SatisIrs_SipBag_EslesmeDurumu':
          instance.sevkiyatSatisIrsSipBagEslesmeDurumu,
      'sevkiyat_SatisIrs_SipBag_MalToplananlarGelsin':
          instance.sevkiyatSatisIrsSipBagMalToplananlarGelsin,
      'sevkiyat_SatisIrs_SipBag_SevkOnayliSiparislerGelsin':
          instance.sevkiyatSatisIrsSipBagSevkOnayliSiparislerGelsin,
      'sevkiyat_FiyatDegistirilmesin': instance.sevkiyatFiyatDegistirilmesin,
      'sevkiyat_SatisIrsaliyesi_EIrsaliyeDuzenleyemesin':
          instance.sevkiyatSatisIrsaliyesiEIrsaliyeDuzenleyemesin,
      'sevkiyat_SatisIrs_KalemlerBirlestirilsin':
          instance.sevkiyatSatisIrsKalemlerBirlestirilsin,
      'sevkiyat_SatisIrs_OtoBasimYap': instance.sevkiyatSatisIrsOtoBasimYap,
      'sevkiyat_SatisIrs_KacGunlukKayitlarListelensin':
          instance.sevkiyatSatisIrsKacGunlukKayitlarListelensin,
      'sevkiyat_SatisIrs_FiyatSirasi': instance.sevkiyatSatisIrsFiyatSirasi,
      'sevkiyat_SatisIrs_KDVSifirGelsin':
          instance.sevkiyatSatisIrsKDVSifirGelsin,
      'sevkiyat_SatisIrs_SeriGirisHarYapabilsin':
          instance.sevkiyatSatisIrsSeriGirisHarYapabilsin,
      'sevkiyat_SatisIrs_Birim1denKaydet':
          instance.sevkiyatSatisIrsBirim1denKaydet,
      'sevkiyat_SatisIrs_EkAlan2Tablodan':
          instance.sevkiyatSatisIrsEkAlan2Tablodan,
      'sevkiyat_SatisIrs_EkAlan2Hatirla':
          instance.sevkiyatSatisIrsEkAlan2Hatirla,
      'sevkiyat_SatisIrs_OlcuBirimi': instance.sevkiyatSatisIrsOlcuBirimi,
      'sevkiyat_SatisIrs_CariKoduDegistir':
          instance.sevkiyatSatisIrsCariKoduDegistir,
      'sevkiyat_SatisIrs_MaxIskUygulamasi':
          instance.sevkiyatSatisIrsMaxIskUygulamasi,
      'sevkiyat_SatisIrs_MaxSatIsk1': instance.sevkiyatSatisIrsMaxSatIsk1,
      'sevkiyat_SatisIrs_MaxSatIsk2': instance.sevkiyatSatisIrsMaxSatIsk2,
      'sevkiyat_SatisIrs_MaxSatIsk3': instance.sevkiyatSatisIrsMaxSatIsk3,
      'sevkiyat_SatisIrs_MaxSatIsk4': instance.sevkiyatSatisIrsMaxSatIsk4,
      'sevkiyat_SatisIrs_MaxSatIsk5': instance.sevkiyatSatisIrsMaxSatIsk5,
      'sevkiyat_SatisIrs_MaxSatIsk6': instance.sevkiyatSatisIrsMaxSatIsk6,
      'sevkiyat_SatisIrs_MaxGenIsk1': instance.sevkiyatSatisIrsMaxGenIsk1,
      'sevkiyat_SatisIrs_MaxGenIsk2': instance.sevkiyatSatisIrsMaxGenIsk2,
      'sevkiyat_SatisIrs_MaxGenIsk3': instance.sevkiyatSatisIrsMaxGenIsk3,
      'sevkiyat_SatisIrs_DipFiyatUygulamasi':
          instance.sevkiyatSatisIrsDipFiyatUygulamasi,
      'sevkiyat_SatisIrs_DipFiyatSaha': instance.sevkiyatSatisIrsDipFiyatSaha,
      'sevkiyat_SatisIrs_DipFiyatEylem': instance.sevkiyatSatisIrsDipFiyatEylem,
      'sevkiyat_SatisIrs_DipFiyatKDVDurumu':
          instance.sevkiyatSatisIrsDipFiyatKDVDurumu,
      'sevkiyat_SatisIrs_BarkodluGiris': instance.sevkiyatSatisIrsBarkodluGiris,
      'sevkiyat_SatisIrs_MiktarOtomatikGelsin':
          instance.sevkiyatSatisIrsMiktarOtomatikGelsin,
      'sevkiyat_SatisIrs_KalemDetaySorulmasin':
          instance.sevkiyatSatisIrsKalemDetaySorulmasin,
      'sevkiyat_SatisIrs_StokRehberiAcilmasin':
          instance.sevkiyatSatisIrsStokRehberiAcilmasin,
      'sevkiyat_SatisIrs_KalemDuzeltilemesin':
          instance.sevkiyatSatisIrsKalemDuzeltilemesin,
      'sevkiyat_SatisIrs_KlavyeEngelle': instance.sevkiyatSatisIrsKlavyeEngelle,
      'sevkiyat_SatisIrs_Miktar1Gelsin': instance.sevkiyatSatisIrsMiktar1Gelsin,
      'sevkiyat_SatisIrs_BakiyesizStokSecilmesin':
          instance.sevkiyatSatisIrsBakiyesizStokSecilmesin,
      'sevkiyat_SatisIrs_Raporlar': instance.sevkiyatSatisIrsRaporlar,
      'sevkiyat_SatisIrs_KalemRaporu': instance.sevkiyatSatisIrsKalemRaporu,
      'sevkiyat_SatisFat_BelgeTipleri': instance.sevkiyatSatisFatBelgeTipleri,
      'sevkiyat_SatisFat_VarsayilanBelgeTipi':
          instance.sevkiyatSatisFatVarsayilanBelgeTipi,
      'sevkiyat_SatisFat': instance.sevkiyatSatisFat,
      'sevkiyat_SatisFat_Kaydet': instance.sevkiyatSatisFatKaydet,
      'sevkiyat_SatisFat_Duzelt': instance.sevkiyatSatisFatDuzelt,
      'sevkiyat_SatisFat_Sil': instance.sevkiyatSatisFatSil,
      'sevkiyat_SatisFat_ToplamlarCariTahsilatIslemleri':
          instance.sevkiyatSatisFatToplamlarCariTahsilatIslemleri,
      'sevkiyat_SatisFat_KayittanSonraTaslakOlustur':
          instance.sevkiyatSatisFatKayittanSonraTaslakOlustur,
      'sevkiyat_SatisFat_OtomatikBasimYap':
          instance.sevkiyatSatisFatOtomatikBasimYap,
      'sevkiyat_SatisFat_DigerSekmesiGoster':
          instance.sevkiyatSatisFatDigerSekmesiGoster,
      'sevkiyat_SatisFat_FiyatDegistirilmesin':
          instance.sevkiyatSatisFatFiyatDegistirilmesin,
      'sevkiyat_SatisFat_KacGunlukKayitlarListelensin':
          instance.sevkiyatSatisFatKacGunlukKayitlarListelensin,
      'sevkiyat_SatisFat_FiyatSirasi': instance.sevkiyatSatisFatFiyatSirasi,
      'sevkiyat_SatisFat_KalemlerBirlestirilsin':
          instance.sevkiyatSatisFatKalemlerBirlestirilsin,
      'sevkiyat_SatisFat_Birim1denKaydet':
          instance.sevkiyatSatisFatBirim1denKaydet,
      'sevkiyat_SatisFat_EkAlan2Tablodan':
          instance.sevkiyatSatisFatEkAlan2Tablodan,
      'sevkiyat_SatisFat_EkAlan2Hatirla':
          instance.sevkiyatSatisFatEkAlan2Hatirla,
      'sevkiyat_SatisFat_Filtre': instance.sevkiyatSatisFatFiltre,
      'sevkiyat_SatisFat_FiltreSQL': instance.sevkiyatSatisFatFiltreSQL,
      'sevkiyat_SatisFat_OlcuBirimi': instance.sevkiyatSatisFatOlcuBirimi,
      'sevkiyat_SatisFat_AciklamaAlanlari':
          instance.sevkiyatSatisFatAciklamaAlanlari,
      'sevkiyat_SatisFat_BosGecilmeyecekAlanlar':
          instance.sevkiyatSatisFatBosGecilmeyecekAlanlar,
      'sevkiyat_SatisFat_GizlenecekAlanlar':
          instance.sevkiyatSatisFatGizlenecekAlanlar,
      'sevkiyat_SatisFat_DegismeyecekAlanlar':
          instance.sevkiyatSatisFatDegismeyecekAlanlar,
      'sevkiyat_SatisFat_SeriGirisHarYapabilsin':
          instance.sevkiyatSatisFatSeriGirisHarYapabilsin,
      'sevkiyat_SatisFat_CariKoduDegistir':
          instance.sevkiyatSatisFatCariKoduDegistir,
      'sevkiyat_SatisFaturasi_SipBagSecenegi':
          instance.sevkiyatSatisFaturasiSipBagSecenegi,
      'sevkiyat_SatisFat_ReferansStokUygulamasi':
          instance.sevkiyatSatisFatReferansStokUygulamasi,
      'sevkiyat_SatisFat_SipBag_SipHariciKalemEklenebilir':
          instance.sevkiyatSatisFatSipBagSipHariciKalemEklenebilir,
      'sevkiyat_SatisFat_SipBag_FazlaTeslimatYapilabilir':
          instance.sevkiyatSatisFatSipBagFazlaTeslimatYapilabilir,
      'sevkiyat_SatisFat_SipBag_SipOkutulsun':
          instance.sevkiyatSatisFatSipBagSipOkutulsun,
      'sevkiyat_SatisFat_SipBag_SipOkutulsun_Miktar2BazAl':
          instance.sevkiyatSatisFatSipBagSipOkutulsunMiktar2BazAl,
      'sevkiyat_SatisFat_SipBag_CokluSecim':
          instance.sevkiyatSatisFatSipBagCokluSecim,
      'sevkiyat_SatisFat_SipBag_TumKalemlerSecilsin':
          instance.sevkiyatSatisFatSipBagTumKalemlerSecilsin,
      'sevkiyat_SatisFat_SipBag_EslesmeDurumu':
          instance.sevkiyatSatisFatSipBagEslesmeDurumu,
      'sevkiyat_SatisFat_SipBag_SevkOnayliSiparislerGelsin':
          instance.sevkiyatSatisFatSipBagSevkOnayliSiparislerGelsin,
      'sevkiyat_SatisFat_BarkodluGiris': instance.sevkiyatSatisFatBarkodluGiris,
      'sevkiyat_SatisFaturasi_MiktarOtomatikGelsin':
          instance.sevkiyatSatisFaturasiMiktarOtomatikGelsin,
      'sevkiyat_SatisFaturasi_KalemDetaySorulmasin':
          instance.sevkiyatSatisFaturasiKalemDetaySorulmasin,
      'sevkiyat_SatisFat_BarkodSayisiSaklanacakAlan':
          instance.sevkiyatSatisFatBarkodSayisiSaklanacakAlan,
      'sevkiyat_SatisFat_StokRehberiAcilmasin':
          instance.sevkiyatSatisFatStokRehberiAcilmasin,
      'sevkiyat_SatisFat_KalemDuzeltilemesin':
          instance.sevkiyatSatisFatKalemDuzeltilemesin,
      'sevkiyat_SatisFat_KlavyeEngelle': instance.sevkiyatSatisFatKlavyeEngelle,
      'sevkiyat_SatisFat_Miktar1Gelsin': instance.sevkiyatSatisFatMiktar1Gelsin,
      'sevkiyat_SatisFat_BakiyesizStokSecilmesin':
          instance.sevkiyatSatisFatBakiyesizStokSecilmesin,
      'sevkiyat_SatisFat_Raporlar': instance.sevkiyatSatisFatRaporlar,
      'sevkiyat_SatisFat_KalemRaporu': instance.sevkiyatSatisFatKalemRaporu,
      'sevkiyat_SatisFat_KarlilikRaporu':
          instance.sevkiyatSatisFatKarlilikRaporu,
      'sevkiyat_SatisFat_MaxIskUygulamasi':
          instance.sevkiyatSatisFatMaxIskUygulamasi,
      'sevkiyat_SatisFat_MaxSatIsk1': instance.sevkiyatSatisFatMaxSatIsk1,
      'sevkiyat_SatisFat_MaxSatIsk2': instance.sevkiyatSatisFatMaxSatIsk2,
      'sevkiyat_SatisFat_MaxSatIsk3': instance.sevkiyatSatisFatMaxSatIsk3,
      'sevkiyat_SatisFat_MaxSatIsk4': instance.sevkiyatSatisFatMaxSatIsk4,
      'sevkiyat_SatisFat_MaxSatIsk5': instance.sevkiyatSatisFatMaxSatIsk5,
      'sevkiyat_SatisFat_MaxSatIsk6': instance.sevkiyatSatisFatMaxSatIsk6,
      'sevkiyat_SatisFat_MaxGenIsk1': instance.sevkiyatSatisFatMaxGenIsk1,
      'sevkiyat_SatisFat_MaxGenIsk2': instance.sevkiyatSatisFatMaxGenIsk2,
      'sevkiyat_SatisFat_MaxGenIsk3': instance.sevkiyatSatisFatMaxGenIsk3,
      'sevkiyat_SatisFat_DipFiyatUygulamasi':
          instance.sevkiyatSatisFatDipFiyatUygulamasi,
      'sevkiyat_SatisFat_DipFiyatSaha': instance.sevkiyatSatisFatDipFiyatSaha,
      'sevkiyat_SatisFat_DipFiyatEylem': instance.sevkiyatSatisFatDipFiyatEylem,
      'sevkiyat_SatisFat_DipFiyatKDVDurumu':
          instance.sevkiyatSatisFatDipFiyatKDVDurumu,
      'sevkiyat_SatisIrsaliyesiSiparissiz':
          instance.sevkiyatSatisIrsaliyesiSiparissiz,
      'sevkiyat_SatisIrsaliyesiSiparissizFiyatGor':
          instance.sevkiyatSatisIrsaliyesiSiparissizFiyatGor,
      'sevkiyat_SatisIrsaliyesiIade': instance.sevkiyatSatisIrsaliyesiIade,
      'sevkiyat_SiptenMalTop': instance.sevkiyatSiptenMalTop,
      'sevkiyat_SiptenMalTop_MiktarBarkoddanGelsin':
          instance.sevkiyatSiptenMalTopMiktarBarkoddanGelsin,
      'sevkiyat_SiptenMalTop_RehberdenStokSecilmesin':
          instance.sevkiyatSiptenMalTopRehberdenStokSecilmesin,
      'sevkiyat_SiptenMalTop_KlavyedenBarkodGirilmesin':
          instance.sevkiyatSiptenMalTopKlavyedenBarkodGirilmesin,
      'sevkiyat_SiptenMalTop_SevkOnayliSiparislerGelsin':
          instance.sevkiyatSiptenMalTopSevkOnayliSiparislerGelsin,
      'sevkiyat_SiptenMalTop_KacGunlukKayitlarListelensin':
          instance.sevkiyatSiptenMalTopKacGunlukKayitlarListelensin,
      'sevkemri_MalToplama': instance.sevkemriMalToplama,
      'sevkemri_MalToplamaAtanabilir': instance.sevkemriMalToplamaAtanabilir,
      'sevkemri_MalToplamaAtayabilir': instance.sevkemriMalToplamaAtayabilir,
      'sevkemri_UrunDegistir': instance.sevkemriUrunDegistir,
      'sevkemri_MiktarDegistir': instance.sevkemriMiktarDegistir,
      'sevkemri_MuadilUrun': instance.sevkemriMuadilUrun,
      'sevkemri_malToplama_BarkodsuzUrunListedenSecilsin':
          instance.sevkemriMalToplamaBarkodsuzUrunListedenSecilsin,
      'sevkemri_MalToplama_OtoStokEtiketiYazdir':
          instance.sevkemriMalToplamaOtoStokEtiketiYazdir,
      'sevkemri_MalToplama_OtoStokEtiketiYazdirSor':
          instance.sevkemriMalToplamaOtoStokEtiketiYazdirSor,
      'sevkemri_MalToplama_KlavyedenGirisiEngelle':
          instance.sevkemriMalToplamaKlavyedenGirisiEngelle,
      'sevkemri_MalToplama_Barkod2Sor': instance.sevkemriMalToplamaBarkod2Sor,
      'sevkemri_MalToplama_Barkod2_YildizliGorunsun':
          instance.sevkemriMalToplamaBarkod2YildizliGorunsun,
      'sevkemri_MalToplama_Barkod2KalemEkranindaSor':
          instance.sevkemriMalToplamaBarkod2KalemEkranindaSor,
      'sevkemri_MalToplama_TumuToplanmadanTamamlanmasin':
          instance.sevkemriMalToplamaTumuToplanmadanTamamlanmasin,
      'sevkemri_MalToplama_HangiHucredeGoster':
          instance.sevkemriMalToplamaHangiHucredeGoster,
      'sevkemri_MalToplama_KalemDetayIslemOnaySormasin':
          instance.sevkemriMalToplamaKalemDetayIslemOnaySormasin,
      'sevkemri_MalToplama_GosterilecekEkBilgiler':
          instance.sevkemriMalToplamaGosterilecekEkBilgiler,
      'sevkemri_MalToplama_DegistirilemeyecekAlanlar':
          instance.sevkemriMalToplamaDegistirilemeyecekAlanlar,
      'sevkemri_MalToplama_GizlenecekAlanlar':
          instance.sevkemriMalToplamaGizlenecekAlanlar,
      'sevkemri_MalToplama_MiktarBarkoddan':
          instance.sevkemriMalToplamaMiktarBarkoddan,
      'sevkemri_MalToplama_KalemDetayiSorulmasin':
          instance.sevkemriMalToplamaKalemDetayiSorulmasin,
      'sevkemri_MalToplama_KalemDetayaUlasamasin':
          instance.sevkemriMalToplamaKalemDetayaUlasamasin,
      'sevkemri_MalToplama_FazlaTeslimat':
          instance.sevkemriMalToplamaFazlaTeslimat,
      'sevkemri_MalToplama_VarsayilanOlcuBirimi':
          instance.sevkemriMalToplamaVarsayilanOlcuBirimi,
      'sevkemri_MalToplama_SiralamaTipi':
          instance.sevkemriMalToplamaSiralamaTipi,
      'sevkemri_MalKontrol': instance.sevkemriMalKontrol,
      'sevkemri_MalKontrol_KlavyeEngelle':
          instance.sevkemriMalKontrolKlavyeEngelle,
      'sevkemri_MalKontrolTipi': instance.sevkemriMalKontrolTipi?.toJson(),
      'sevkemri_MalKontrolKullanicilar':
          instance.sevkemriMalKontrolKullanicilar,
      'sevkemri_Paketleme': instance.sevkemriPaketleme,
      'sevkemri_Paketleme_KlavyeEngelle':
          instance.sevkemriPaketlemeKlavyeEngelle,
      'sevkemri_Paketleme_BarkodOkutmayaZorla':
          instance.sevkemriPaketlemeBarkodOkutmayaZorla,
      'sevkemri_Paketleme_BarkodsuzUrunListedenSecilsin':
          instance.sevkemriPaketlemeBarkodsuzUrunListedenSecilsin,
      'sevkemri_AracYukleme': instance.sevkemriAracYukleme,
      'sevkemri_AracYukleme_KlavyeEngelle':
          instance.sevkemriAracYuklemeKlavyeEngelle,
      'sevkemri_AracBosaltma': instance.sevkemriAracBosaltma,
      'sevkemri_AracBosaltma_KlavyeEngelle':
          instance.sevkemriAracBosaltmaKlavyeEngelle,
      'sevkemri_DepodanTeslimat': instance.sevkemriDepodanTeslimat,
      'sevkemri_DepodanTeslimat_KlavyeEngelle':
          instance.sevkemriDepodanTeslimatKlavyeEngelle,
      'sayim_sayim': instance.sayimSayim,
      'sayim_Kontrol_Miktari': instance.sayimKontrolMiktari,
      'sayim_MiktarBarkoddanGelsin': instance.sayimMiktarBarkoddanGelsin,
      'sayim_AyniStokDurumu': instance.sayimAyniStokDurumu,
      'sayim_Miktar1Gelsin': instance.sayimMiktar1Gelsin,
      'sayim_HemenKaydet': instance.sayimHemenKaydet,
      'sayim_CarpanAktif': instance.sayimCarpanAktif,
      'sayim_SeriMikGirilenMikKabulEdilsin':
          instance.sayimSeriMikGirilenMikKabulEdilsin,
      'sayim_DigerKulSayimHarGorsun': instance.sayimDigerKulSayimHarGorsun,
      'sayim_DigerKulSayimFisGorsun': instance.sayimDigerKulSayimFisGorsun,
      'sayim_Serbest': instance.sayimSerbest,
      'sayim_Serbest_Sil': instance.sayimSerbestSil,
      'sayim_DepoFarkRaporu': instance.sayimDepoFarkRaporu,
      'sayim_BelgeBaglantisiniKopar': instance.sayimBelgeBaglantisiniKopar,
      'sayim_BelgeOlusturabilir': instance.sayimBelgeOlusturabilir,
      'sayim_EkAlanlar': instance.sayimEkAlanlar,
      'sayim_DegismeyecekAlanlar': instance.sayimDegismeyecekAlanlar,
      'sayim_GizlenecekAlanlar': instance.sayimGizlenecekAlanlar,
      'sayim_VarsayilanOlcuBirimi': instance.sayimVarsayilanOlcuBirimi,
      'sayim_Raporu': instance.sayimRaporu,
      'paket_Olustur': instance.paketOlustur,
      'paket_CokluOlustur': instance.paketCokluOlustur,
      'paket_Kontrol': instance.paketKontrol,
      'paket_MalzemeCikisi': instance.paketMalzemeCikisi,
      'paket_ReceteyiFiltrele': instance.paketReceteyiFiltrele,
      'islemler_HucreEtiket': instance.islemlerHucreEtiket,
      'islemler_StokEtiket': instance.islemlerStokEtiket,
      'islemler_BarkodTanimlama': instance.islemlerBarkodTanimlama,
      'siparis_MusteriSiparisi': instance.siparisMusteriSiparisi,
      'siparis_MusteriSiparisi_Kaydet': instance.siparisMusteriSiparisiKaydet,
      'siparis_MusteriSiparisi_Duzelt': instance.siparisMusteriSiparisiDuzelt,
      'siparis_MusteriSiparisi_Sil': instance.siparisMusteriSiparisiSil,
      'siparis_MusteriSiparisi_KapalilarListelenmesin':
          instance.siparisMusteriSiparisiKapalilarListelenmesin,
      'siparis_MusteriSiparisi_FiyatDegistirilmesin':
          instance.siparisMusteriSiparisiFiyatDegistirilmesin,
      'siparis_MusteriSiparisi_FiyatSirasi':
          instance.siparisMusteriSiparisiFiyatSirasi,
      'siparis_MusSip_Birim1denKaydet': instance.siparisMusSipBirim1denKaydet,
      'siparis_MusteriSiparisi_KapatmaIslemi':
          instance.siparisMusteriSiparisiKapatmaIslemi,
      'siparis_MusSip_OnayIslemleri': instance.siparisMusSipOnayIslemleri,
      'siparis_MusteriSiparisi_SonFiyatGoster':
          instance.siparisMusteriSiparisiSonFiyatGoster,
      'siparis_MusSip_DigerSekmesiGoster':
          instance.siparisMusSipDigerSekmesiGoster,
      'siparis_MusSip_EkAlan2Tablodan': instance.siparisMusSipEkAlan2Tablodan,
      'siparis_MusSip_EkAlan2Hatirla': instance.siparisMusSipEkAlan2Hatirla,
      'siparis_MusSip_Miktar1Gelsin': instance.siparisMusSipMiktar1Gelsin,
      'siparis_MusSip_BosGecilmeyecekAlanlar':
          instance.siparisMusSipBosGecilmeyecekAlanlar,
      'siparis_MusSip_OtoPdfGor': instance.siparisMusSipOtoPdfGor,
      'siparis_MusSip_CariKoduDegistir': instance.siparisMusSipCariKoduDegistir,
      'siparis_MusteriSiparisi_AciklamaAlanlari':
          instance.siparisMusteriSiparisiAciklamaAlanlari,
      'siparis_MusteriSiparisi_GizlenecekAlanlar':
          instance.siparisMusteriSiparisiGizlenecekAlanlar,
      'siparis_MusteriSiparisi_DegismeyecekAlanlar':
          instance.siparisMusteriSiparisiDegismeyecekAlanlar,
      'siparis_MusSip_EkstraAlanlar': instance.siparisMusSipEkstraAlanlar,
      'siparis_MusteriSiparisi_SatirAciklamaAlanlari':
          instance.siparisMusteriSiparisiSatirAciklamaAlanlari,
      'siparis_MusSip_OlcuBirimi': instance.siparisMusSipOlcuBirimi,
      'siparis_MusSip_BakiyesizStokSecilmesin':
          instance.siparisMusSipBakiyesizStokSecilmesin,
      'siparis_MusSip_HizliUrunGirisi_Miktar2Kullanilsin':
          instance.siparisMusSipHizliUrunGirisiMiktar2Kullanilsin,
      'siparis_MusteriSiparisi_DipFiyatUygulamasi':
          instance.siparisMusteriSiparisiDipFiyatUygulamasi,
      'siparis_MusteriSiparisi_DipFiyatSaha':
          instance.siparisMusteriSiparisiDipFiyatSaha,
      'siparis_MusteriSiparisi_DipFiyatEylem':
          instance.siparisMusteriSiparisiDipFiyatEylem,
      'siparis_MusteriSiparisi_DipFiyatKDVDurumu':
          instance.siparisMusteriSiparisiDipFiyatKDVDurumu,
      'siparis_MusSip_MaxIskUygulamasi': instance.siparisMusSipMaxIskUygulamasi,
      'siparis_MusSip_MaxSatIsk1': instance.siparisMusSipMaxSatIsk1,
      'siparis_MusSip_MaxSatIsk2': instance.siparisMusSipMaxSatIsk2,
      'siparis_MusSip_MaxSatIsk3': instance.siparisMusSipMaxSatIsk3,
      'siparis_MusSip_MaxSatIsk4': instance.siparisMusSipMaxSatIsk4,
      'siparis_MusSip_MaxSatIsk5': instance.siparisMusSipMaxSatIsk5,
      'siparis_MusSip_MaxSatIsk6': instance.siparisMusSipMaxSatIsk6,
      'siparis_MusSip_MaxGenIsk1': instance.siparisMusSipMaxGenIsk1,
      'siparis_MusSip_MaxGenIsk2': instance.siparisMusSipMaxGenIsk2,
      'siparis_MusSip_MaxGenIsk3': instance.siparisMusSipMaxGenIsk3,
      'siparis_MusteriSiparisi_Raporlar':
          instance.siparisMusteriSiparisiRaporlar,
      'siparis_MusteriSiparisi_DurumRaporu':
          instance.siparisMusteriSiparisiDurumRaporu,
      'siparis_MusteriSiparisi_DurumRaporuFiyatGor':
          instance.siparisMusteriSiparisiDurumRaporuFiyatGor,
      'siparis_MusSip_KarlilikRaporu': instance.siparisMusSipKarlilikRaporu,
      'siparis_MusSip_TeslimRaporu': instance.siparisMusSipTeslimRaporu,
      'siparis_SaticiSiparisi': instance.siparisSaticiSiparisi,
      'siparis_SaticiSiparisi_Kaydet': instance.siparisSaticiSiparisiKaydet,
      'siparis_SaticiSiparisi_Duzelt': instance.siparisSaticiSiparisiDuzelt,
      'siparis_SaticiSiparisi_Sil': instance.siparisSaticiSiparisiSil,
      'siparis_SaticiSiparisi_KapalilarListelenmesin':
          instance.siparisSaticiSiparisiKapalilarListelenmesin,
      'siparis_SaticiSiparisi_FiyatDegistirilmesin':
          instance.siparisSaticiSiparisiFiyatDegistirilmesin,
      'siparis_SaticiSiparisi_FiyatSirasi':
          instance.siparisSaticiSiparisiFiyatSirasi,
      'siparis_SaticiSip_Birim1denKaydet':
          instance.siparisSaticiSipBirim1denKaydet,
      'siparis_SaticiSiparisi_KapatmaIslemi':
          instance.siparisSaticiSiparisiKapatmaIslemi,
      'siparis_SaticiSip_OnayIslemleri': instance.siparisSaticiSipOnayIslemleri,
      'siparis_SaticiSip_DigerSekmesiGoster':
          instance.siparisSaticiSipDigerSekmesiGoster,
      'siparis_SaticiSip_OlcuBirimi': instance.siparisSaticiSipOlcuBirimi,
      'siparis_SaticiSip_CariKoduDegistir':
          instance.siparisSaticiSipCariKoduDegistir,
      'siparis_SaticiSiparisi_Raporlar': instance.siparisSaticiSiparisiRaporlar,
      'siparis_SaticiSiparisi_DurumRaporu':
          instance.siparisSaticiSiparisiDurumRaporu,
      'siparis_SaticiSiparisi_DurumRaporuFiyatGor':
          instance.siparisSaticiSiparisiDurumRaporuFiyatGor,
      'siparis_SaticiSip_TeslimRaporu': instance.siparisSaticiSipTeslimRaporu,
      'stok_StokListesi': instance.stokStokListesi,
      'stok_StokListesi_ExtraAlanlar': instance.stokStokListesiExtraAlanlar,
      'stok_StokKarti': instance.stokStokKarti,
      'stok_StokKarti_Kaydet': instance.stokStokKartiKaydet,
      'stok_StokKarti_Duzelt': instance.stokStokKartiDuzelt,
      'stok_StokKarti_Sil': instance.stokStokKartiSil,
      'stok_StokKarti_AlisFiyatiGizle': instance.stokStokKartiAlisFiyatiGizle,
      'stok_StokKarti_SatisFiyatiGizle': instance.stokStokKartiSatisFiyatiGizle,
      'stok_StokHareketleri': instance.stokStokHareketleri,
      'stok_StokHar_Kaydet': instance.stokStokHarKaydet,
      'stok_StokHar_Duzelt': instance.stokStokHarDuzelt,
      'stok_StokHar_Sil': instance.stokStokHarSil,
      'stok_StokHar_PlasiyerKendiniGorsun':
          instance.stokStokHarPlasiyerKendiniGorsun,
      'stok_FiltreSQLTipi': instance.stokFiltreSQLTipi,
      'stok_ResimGoster': instance.stokResimGoster,
      'stok_ResimGoster_Ekle': instance.stokResimGosterEkle,
      'stok_ResimGoster_Sil': instance.stokResimGosterSil,
      'stok_FiyatOzeti': instance.stokFiyatOzeti,
      'stok_HareketDetayiniGizle': instance.stokHareketDetayiniGizle,
      'stok_GirisHareketleriniGizle': instance.stokGirisHareketleriniGizle,
      'stok_CikisHareketleriniGizle': instance.stokCikisHareketleriniGizle,
      'stok_BakiyeGosterimTipi': instance.stokBakiyeGosterimTipi,
      'stok_BarkodKontrol': instance.stokBarkodKontrol,
      'stok_DepoBakiyeDurumu': instance.stokDepoBakiyeDurumu,
      'stok_BarkodTanimlama': instance.stokBarkodTanimlama,
      'stok_BarkodTanimlama_GorunecekAlanlar':
          instance.stokBarkodTanimlamaGorunecekAlanlar,
      'stok_BarkodKayitlari': instance.stokBarkodKayitlari,
      'stok_BarkodKayitlari_Ekle': instance.stokBarkodKayitlariEkle,
      'stok_BarkodKayitlari_Duzelt': instance.stokBarkodKayitlariDuzelt,
      'stok_BarkodKayitlari_Sil': instance.stokBarkodKayitlariSil,
      'stok_KanbanBarkodEsle': instance.stokKanbanBarkodEsle,
      'stok_KanbanBarkodEsle_Sil': instance.stokKanbanBarkodEsleSil,
      'stok_KanbanBarkodEsleFarkliStokOkutulmasin':
          instance.stokKanbanBarkodEsleFarkliStokOkutulmasin,
      'stok_FiyatGorEkrani': instance.stokFiyatGorEkrani,
      'stok_FiyatGorEkrani_GunlukKurdanTLGoster':
          instance.stokFiyatGorEkraniGunlukKurdanTLGoster,
      'stok_FiyatGorEkraniGorunecekAlanlar':
          instance.stokFiyatGorEkraniGorunecekAlanlar,
      'stok_FiyatGecmisi': instance.stokFiyatGecmisi,
      'stok_FiyatGecmisiSil': instance.stokFiyatGecmisiSil,
      'stok_FiyatGecmisiFiyatTipleri': instance.stokFiyatGecmisiFiyatTipleri,
      'stok_SeriHar': instance.stokSeriHar,
      'stok_SeriHar_Ekle': instance.stokSeriHarEkle,
      'stok_SeriHar_Duzelt': instance.stokSeriHarDuzelt,
      'stok_SeriHar_Sil': instance.stokSeriHarSil,
      'stok_SeriParcala': instance.stokSeriParcala,
      'stok_SeriParcala_Ekle': instance.stokSeriParcalaEkle,
      'stok_SeriParcala_Duzelt': instance.stokSeriParcalaDuzelt,
      'stok_SeriParcala_Sil': instance.stokSeriParcalaSil,
      'stok_SeriBirlestir': instance.stokSeriBirlestir,
      'stok_SeriBirlestir_Ekle': instance.stokSeriBirlestirEkle,
      'stok_SeriBirlestir_Duzelt': instance.stokSeriBirlestirDuzelt,
      'stok_SeriBirlestir_Sil': instance.stokSeriBirlestirSil,
      'stok_Paketleme': instance.stokPaketleme,
      'stok_Paketleme_Ekle': instance.stokPaketlemeEkle,
      'stok_Paketleme_Sil': instance.stokPaketlemeSil,
      'stok_Paketleme_OnaySormasin': instance.stokPaketlemeOnaySormasin,
      'stok_Paketleme_DigerKulKayitGorebilir':
          instance.stokPaketlemeDigerKulKayitGorebilir,
      'stok_Paketleme_SorulacakBelgeTipleri':
          instance.stokPaketlemeSorulacakBelgeTipleri,
      'stok_Raporlar': instance.stokRaporlar,
      'stok_Rap_AmbarMaliyet': instance.stokRapAmbarMaliyet,
      'stok_Rap_LokalDepoBakiye': instance.stokRapLokalDepoBakiye,
      'stok_Rap_UrunGrubunaGoreSatis': instance.stokRapUrunGrubunaGoreSatis,
      'cari_CariListesi': instance.cariCariListesi,
      'cari_CariListesi_RiskGorebilir': instance.cariCariListesiRiskGorebilir,
      'cari_RiskGirisi': instance.cariRiskGirisi,
      'cari_CariKarti': instance.cariCariKarti,
      'cari_CariKarti_Kaydet': instance.cariCariKartiKaydet,
      'cari_CariKarti_Duzelt': instance.cariCariKartiDuzelt,
      'cari_CariKarti_Sil': instance.cariCariKartiSil,
      'cari_CariKarti_EIslemler': instance.cariCariKartiEIslemler,
      'cari_CariKarti_DegismeyecekAlanlar':
          instance.cariCariKartiDegismeyecekAlanlar,
      'cari_CariKarti_GizlenecekAlanlar':
          instance.cariCariKartiGizlenecekAlanlar,
      'cari_CariHareketleri': instance.cariCariHareketleri,
      'cari_CariHar_Kaydet': instance.cariCariHarKaydet,
      'cari_CariHar_Duzelt': instance.cariCariHarDuzelt,
      'cari_CariHar_Sil': instance.cariCariHarSil,
      'cari_CariHareketleri_HarDetayGorsun':
          instance.cariCariHareketleriHarDetayGorsun,
      'stok_CariHar_PlasiyerKendiniGorsun':
          instance.stokCariHarPlasiyerKendiniGorsun,
      'cari_Aktivite': instance.cariAktivite,
      'cari_Aktivite_Ekle': instance.cariAktiviteEkle,
      'cari_Aktivite_Duzelt': instance.cariAktiviteDuzelt,
      'cari_Aktivite_Sil': instance.cariAktiviteSil,
      'cari_Aktivite_Atayabilir': instance.cariAktiviteAtayabilir,
      'cari_Aktivite_BitirmeyiGeriAl': instance.cariAktiviteBitirmeyiGeriAl,
      'cari_OzelHesapKapatma': instance.cariOzelHesapKapatma,
      'cari_OzelHesapKapatma_Sil': instance.cariOzelHesapKapatmaSil,
      'cari_VadeKontrolu': instance.cariVadeKontrolu,
      'cari_VadeKontrolu_Gun': instance.cariVadeKontroluGun,
      'cari_VadeKontrolu_BelgeTipleri': instance.cariVadeKontroluBelgeTipleri,
      'cari_Filtre': instance.cariFiltre,
      'cari_FiltreSQL': instance.cariFiltreSQL,
      'cari_FiltreSQLTipi': instance.cariFiltreSQLTipi,
      'cari_Virman': instance.cariVirman,
      'cari_Virman_Kaydet': instance.cariVirmanKaydet,
      'cari_Harita': instance.cariHarita,
      'cari_TeslimCari_RehberSadeceSecsin':
          instance.cariTeslimCariRehberSadeceSecsin,
      'cari_TeslimCari_SatisBaglanmisCarilerSecilsin':
          instance.cariTeslimCariSatisBaglanmisCarilerSecilsin,
      'cari_Raporlar': instance.cariRaporlar,
      'cari_Rap_Ekstre': instance.cariRapEkstre,
      'cari_Rap_StokEkstre': instance.cariRapStokEkstre,
      'cari_Rap_Yaslandirma': instance.cariRapYaslandirma,
      'cari_Rap_HarDetayliYaslandir': instance.cariRapHarDetayliYaslandir,
      'cari_Rap_DovizBakiye': instance.cariRapDovizBakiye,
      'cari_Rap_StokSatisOzeti': instance.cariRapStokSatisOzeti,
      'cari_Rap_DovizliEkstre': instance.cariRapDovizliEkstre,
      'tahsilat_Tahsilatlar': instance.tahsilatTahsilatlar,
      'tahsilat_NakitTahsilat': instance.tahsilatNakitTahsilat,
      'tahsilat_NakitTahsilat_Kaydet': instance.tahsilatNakitTahsilatKaydet,
      'tahsilat_KKartiTahsilat': instance.tahsilatKKartiTahsilat,
      'tahsilat_KKartiTahsilat_Kaydet': instance.tahsilatKKartiTahsilatKaydet,
      'tahsilat_NakitOdeme': instance.tahsilatNakitOdeme,
      'tahsilat_NakitOdeme_Kaydet': instance.tahsilatNakitOdemeKaydet,
      'tahsilat_SenetTahsilat': instance.tahsilatSenetTahsilat,
      'tahsilat_SenetTahsilat_Kaydet': instance.tahsilatSenetTahsilatKaydet,
      'tahsilat_CekTahsilat': instance.tahsilatCekTahsilat,
      'tahsilat_CekTahsilat_Kaydet': instance.tahsilatCekTahsilatKaydet,
      'tahsilat_MuhtelifTahsilat': instance.tahsilatMuhtelifTahsilat,
      'tahsilat_MuhtelifOdeme': instance.tahsilatMuhtelifOdeme,
      'tahsilat_MuhtelifTahsilatFiltre':
          instance.tahsilatMuhtelifTahsilatFiltre,
      'tahsilat_MuhtelifTahsilatFiltreSQL':
          instance.tahsilatMuhtelifTahsilatFiltreSQL,
      'tahsilat_MuhtelifOdemeFiltre': instance.tahsilatMuhtelifOdemeFiltre,
      'tahsilat_MuhtelifOdemeFiltreSQL':
          instance.tahsilatMuhtelifOdemeFiltreSQL,
      'yonetici_Banka_Banka_Litesi': instance.yoneticiBankaBankaLitesi,
      'yonetici_Banka_Islemleri': instance.yoneticiBankaIslemleri,
      'yonetici_Banka_Islemleri_Sil': instance.yoneticiBankaIslemleriSil,
      'yonetici_Banka_Islem_HesapEFT': instance.yoneticiBankaIslemHesapEFT,
      'yonetici_Banka_Islem_HesapVirman':
          instance.yoneticiBankaIslemHesapVirman,
      'yonetici_Banka_Islem_CariEFT': instance.yoneticiBankaIslemCariEFT,
      'finans_Banka_Kasa_Transferi': instance.finansBankaKasaTransferi,
      'finans_Kasa_Listesi': instance.finansKasaListesi,
      'finans_Kasa_Islemleri': instance.finansKasaIslemleri,
      'finans_Kasa_Islemleri_Sil': instance.finansKasaIslemleriSil,
      'finans_KasalarArasiTransfer': instance.finansKasalarArasiTransfer,
      'finans_Kasa_NakitTahsilat': instance.finansKasaNakitTahsilat,
      'finans_Kasa_NakitOdeme': instance.finansKasaNakitOdeme,
      'finans_Kasa_MuhtelifTahsilat': instance.finansKasaMuhtelifTahsilat,
      'finans_Kasa_MuhtelifOdeme': instance.finansKasaMuhtelifOdeme,
      'finans_Kasa_SenetTahsilati': instance.finansKasaSenetTahsilati,
      'finans_Kasa_SenetOdemesi': instance.finansKasaSenetOdemesi,
      'finans_Kasa_CekTahsilati': instance.finansKasaCekTahsilati,
      'finans_Kasa_CekOdemesi': instance.finansKasaCekOdemesi,
      'dekont_Listesi': instance.dekontListesi,
      'dekont_Kaydet': instance.dekontKaydet,
      'dekont_Duzelt': instance.dekontDuzelt,
      'dekont_Sil': instance.dekontSil,
      'finans_Cek_GizlenecekAlanlar': instance.finansCekGizlenecekAlanlar,
      'finans_Cek_Musteri': instance.finansCekMusteri,
      'finans_MCEK_Ekle': instance.finansMCEKEkle,
      'finans_MCEK_Sil': instance.finansMCEKSil,
      'finans_MCEK_BelgeDetayi': instance.finansMCEKBelgeDetayi,
      'finans_MCEK_Hareketler': instance.finansMCEKHareketler,
      'finans_MCEK_Evraklar': instance.finansMCEKEvraklar,
      'finans_MCEK_CariyeCiro': instance.finansMCEKCariyeCiro,
      'finans_MCEK_TahsileCiro': instance.finansMCEKTahsileCiro,
      'finans_MCEK_TahsilDekontu': instance.finansMCEKTahsilDekontu,
      'finans_Cek_Borc': instance.finansCekBorc,
      'finans_BorcCeki_Ekle': instance.finansBorcCekiEkle,
      'finans_BorcCeki_Sil': instance.finansBorcCekiSil,
      'finans_BCEK_BelgeDetayi': instance.finansBCEKBelgeDetayi,
      'finans_BCEK_Hareketler': instance.finansBCEKHareketler,
      'finans_BCEK_Evraklar': instance.finansBCEKEvraklar,
      'finans_BCEK_OdemeDekontu': instance.finansBCEKOdemeDekontu,
      'finans_Senet_Musteri': instance.finansSenetMusteri,
      'finans_MSEN_Ekle': instance.finansMSENEkle,
      'finans_MSEN_Sil': instance.finansMSENSil,
      'finans_MSEN_BelgeDetayi': instance.finansMSENBelgeDetayi,
      'finans_MSEN_Hareketler': instance.finansMSENHareketler,
      'finans_MSEN_Evraklar': instance.finansMSENEvraklar,
      'finans_MSEN_CariyeCiro': instance.finansMSENCariyeCiro,
      'finans_MSEN_TahsileCiro': instance.finansMSENTahsileCiro,
      'finans_MSEN_TahsilDekontu': instance.finansMSENTahsilDekontu,
      'finans_Senet_Borc': instance.finansSenetBorc,
      'finans_BSEN_Ekle': instance.finansBSENEkle,
      'finans_BSEN_Sil': instance.finansBSENSil,
      'finans_BSEN_BelgeDetayi': instance.finansBSENBelgeDetayi,
      'finans_BSEN_Hareketler': instance.finansBSENHareketler,
      'finans_BSEN_Evraklar': instance.finansBSENEvraklar,
      'finans_BSEN_OdemeDekontu': instance.finansBSENOdemeDekontu,
      'finans_KKartiTahsilati': instance.finansKKartiTahsilati,
      'finans_MuhtelifTahsilat': instance.finansMuhtelifTahsilat,
      'finans_MuhtelifOdeme': instance.finansMuhtelifOdeme,
      'finans_TahsilatKayitlari': instance.finansTahsilatKayitlari,
      'finans_HizliTahsilatKayitlari': instance.finansHizliTahsilatKayitlari,
      'finans_HizliTahsilatKayitlari_Sil':
          instance.finansHizliTahsilatKayitlariSil,
      'finans_OrtalamaVadeTarihiHesaplama':
          instance.finansOrtalamaVadeTarihiHesaplama,
      'finans_OzetRapor': instance.finansOzetRapor,
      'finans_Raporlar_FinansalDurum': instance.finansRaporlarFinansalDurum,
      'finans_Raporlar_AylikMizan': instance.finansRaporlarAylikMizan,
      'temsilci_Profil': instance.temsilciProfil,
      'temsilci_Profil_KdvDahil': instance.temsilciProfilKdvDahil,
      'temsilci_Profil_SatisPerformansiniGizle':
          instance.temsilciProfilSatisPerformansiniGizle,
      'temsilci_Profil_AylaraGoreSatisiGizle':
          instance.temsilciProfilAylaraGoreSatisiGizle,
      'temsilci_Profil_AylaraGoreTahsilatiGizle':
          instance.temsilciProfilAylaraGoreTahsilatiGizle,
      'yazdirma_BluetoothYaziciKullanabilir':
          instance.yazdirmaBluetoothYaziciKullanabilir,
      'yazdirma_Hucre_Etiketi': instance.yazdirmaHucreEtiketi,
      'yazdirma_Hucre_Etiketi_Yazicilari':
          instance.yazdirmaHucreEtiketiYazicilari,
      'yazdirma_Dizayn_HucreEtiketi': instance.yazdirmaDizaynHucreEtiketi,
      'yazdirma_MalToplama_Etiketi': instance.yazdirmaMalToplamaEtiketi,
      'yazdirma_Mal_Toplama_Yazicilari': instance.yazdirmaMalToplamaYazicilari,
      'yazdirma_Dizayn_MalToplama': instance.yazdirmaDizaynMalToplama,
      'yazdirma_MalKontrol_Etiketi': instance.yazdirmaMalKontrolEtiketi,
      'yazdirma_Mal_Kontrol_Yazicilari': instance.yazdirmaMalKontrolYazicilari,
      'yazdirma_Dizayn_MalKontrol': instance.yazdirmaDizaynMalKontrol,
      'yazdirma_DAT': instance.yazdirmaDAT,
      'yazdirma_DAT_Yazicilari': instance.yazdirmaDATYazicilari,
      'yazdirma_Dizayn_DAT': instance.yazdirmaDizaynDAT,
      'yazdirma_Paketleme_Etiketi': instance.yazdirmaPaketlemeEtiketi,
      'yazdirma_Paketleme_KopyaSayisiGizle':
          instance.yazdirmaPaketlemeKopyaSayisiGizle,
      'yazdirma_Paketleme_Yazicilari': instance.yazdirmaPaketlemeYazicilari,
      'yazdirma_Dizayn_Paketleme': instance.yazdirmaDizaynPaketleme,
      'yazdirma_SatisIrs': instance.yazdirmaSatisIrs,
      'yazdirma_SatisFat': instance.yazdirmaSatisFat,
      'yazdirma_SatisFat_Yazicilari': instance.yazdirmaSatisFatYazicilari,
      'yazdirma_Dizayn_SatisFat': instance.yazdirmaDizaynSatisFat,
      'yazdirma_AlisFat': instance.yazdirmaAlisFat,
      'yazdirma_Dizayn_AlisFat': instance.yazdirmaDizaynAlisFat,
      'yazdirma_Mustahsil': instance.yazdirmaMustahsil,
      'yazdirma_MusSip': instance.yazdirmaMusSip,
      'yazdirma_MusSip_Yazicilari': instance.yazdirmaMusSipYazicilari,
      'yazdirma_Dizayn_MusSip': instance.yazdirmaDizaynMusSip,
      'yazdirma_SaticiSip': instance.yazdirmaSaticiSip,
      'yazdirma_Dizayn_SaticiSip': instance.yazdirmaDizaynSaticiSip,
      'yazdirma_ATAL': instance.yazdirmaATAL,
      'yazdirma_ATAL_Yazicilari': instance.yazdirmaATALYazicilari,
      'yazdirma_Dizayn_ATAL': instance.yazdirmaDizaynATAL,
      'yazdirma_OdemeMakbuzu': instance.yazdirmaOdemeMakbuzu,
      'yazdirma_OdemeMakbuzu_Yazicilari':
          instance.yazdirmaOdemeMakbuzuYazicilari,
      'yazdirma_Dizayn_OdemeMakbuzu': instance.yazdirmaDizaynOdemeMakbuzu,
      'yazdirma_AlisIrs': instance.yazdirmaAlisIrs,
      'yazdirma_AlisIrs_Yazicilari': instance.yazdirmaAlisIrsYazicilari,
      'yazdirma_Dizayn_AlisIrs': instance.yazdirmaDizaynAlisIrs,
      'yazdirma_IsEmri': instance.yazdirmaIsEmri,
      'yazdirma_AmbarCikis': instance.yazdirmaAmbarCikis,
      'yazdirma_AmbarGiris': instance.yazdirmaAmbarGiris,
      'yazdirma_CariHareket': instance.yazdirmaCariHareket,
      'uretim_FiyatGorebilir': instance.uretimFiyatGorebilir,
      'uretim_USK': instance.uretimUSK,
      'uretim_USK_Kaydet': instance.uretimUSKKaydet,
      'uretim_USK_Duzelt': instance.uretimUSKDuzelt,
      'uretim_USK_Sil': instance.uretimUSKSil,
      'uretim_USK_KacGunlukKayitlarListelensin':
          instance.uretimUSKKacGunlukKayitlarListelensin,
      'uretim_USK_MiktarBarkoddan': instance.uretimUSKMiktarBarkoddan,
      'uretim_USK_Miktar1Gelsin': instance.uretimUSKMiktar1Gelsin,
      'sirket_Depo_Uretim_Giris': instance.sirketDepoUretimGiris,
      'sirket_Depo_Uretim_Cikis': instance.sirketDepoUretimCikis,
      'uretim_USK_IsEmriOtoGelsin': instance.uretimUSKIsEmriOtoGelsin,
      'uretim_USK_SoruSorulmasin': instance.uretimUSKSoruSorulmasin,
      'uretim_USK_StokRehberiAcilmasin': instance.uretimUSKStokRehberiAcilmasin,
      'uretim_USK_KlavyeEngelle': instance.uretimUSKKlavyeEngelle,
      'uretim_USK_DepoOnceligi': instance.uretimUSKDepoOnceligi,
      'uretim_USK_FisiErpUretsin': instance.uretimUSKFisiErpUretsin,
      'uretim_USK_GizlenecekAlanlar': instance.uretimUSKGizlenecekAlanlar,
      'uretim_USK_BosGecilmeyecekAlanlar':
          instance.uretimUSKBosGecilmeyecekAlanlar,
      'uretim_USK_DegismeyecekAlanlar': instance.uretimUSKDegismeyecekAlanlar,
      'uretim_USK_OlcuBirimi': instance.uretimUSKOlcuBirimi,
      'uretim_USK_OtoYazdir': instance.uretimUSKOtoYazdir,
      'uretim_USK_KalemliYapi': instance.uretimUSKKalemliYapi,
      'uretim_USK_KalemliYapi_StokMevcutaEklensin':
          instance.uretimUSKKalemliYapiStokMevcutaEklensin,
      'uretim_USK_KalemliYapi_OtoEtiketYazdir':
          instance.uretimUSKKalemliYapiOtoEtiketYazdir,
      'uretim_USK_KalemliYapi_AyniBarkodOkutulamaz':
          instance.uretimUSKKalemliYapiAyniBarkodOkutulamaz,
      'uretim_USK_KalemliYapi_OkutulanEnUsteEklensin':
          instance.uretimUSKKalemliYapiOkutulanEnUsteEklensin,
      'uretim_USK_KalemliYapi_KalemDuzeltilemesin':
          instance.uretimUSKKalemliYapiKalemDuzeltilemesin,
      'uretim_ReceteIzleme': instance.uretimReceteIzleme,
      'uretim_MalToplama': instance.uretimMalToplama,
      'uretim_MalToplama_Ekle': instance.uretimMalToplamaEkle,
      'uretim_MalToplama_Sil': instance.uretimMalToplamaSil,
      'uretim_MalToplama_KlavyeEngelle': instance.uretimMalToplamaKlavyeEngelle,
      'uretim_MalToplama_BarkodOkutsun': instance.uretimMalToplamaBarkodOkutsun,
      'uretim_MalToplama_BelgeTipleri': instance.uretimMalToplamaBelgeTipleri,
      'uretim_MalToplama_ReceteFiltresi':
          instance.uretimMalToplamaReceteFiltresi,
      'uretim_MalToplama_ReceteFiltresiSQL':
          instance.uretimMalToplamaReceteFiltresiSQL,
      'uretim_IsEmri': instance.uretimIsEmri,
      'uretim_IsEmri_Ekle': instance.uretimIsEmriEkle,
      'uretim_IsEmri_Duzelt': instance.uretimIsEmriDuzelt,
      'uretim_IsEmri_Sil': instance.uretimIsEmriSil,
      'taltek_STEK': instance.taltekSTEK,
      'taltek_STEK_Kaydet': instance.taltekSTEKKaydet,
      'taltek_STEK_Duzelt': instance.taltekSTEKDuzelt,
      'taltek_STEK_Sil': instance.taltekSTEKSil,
      'taltek_STEK_KapalilarListenlenmesin':
          instance.taltekSTEKKapalilarListenlenmesin,
      'taltek_STEK_OnayIslemleri': instance.taltekSTEKOnayIslemleri,
      'taltek_STEK_CariKoduDegistir': instance.taltekSTEKCariKoduDegistir,
      'taltek_STEK_FiyatDegistirilmesin':
          instance.taltekSTEKFiyatDegistirilmesin,
      'taltek_STEK_Aciklamalar_YetkiTuru':
          instance.taltekSTEKAciklamalarYetkiTuru,
      'taltek_STEK_GizlenecekAlanlar': instance.taltekSTEKGizlenecekAlanlar,
      'taltek_STEK_DegismeyecekAlanlar': instance.taltekSTEKDegismeyecekAlanlar,
      'taltek_STEK_BosGecilmeyecekAlanlar':
          instance.taltekSTEKBosGecilmeyecekAlanlar,
      'taltek_STEK_AciklamaAlanlari': instance.taltekSTEKAciklamaAlanlari,
      'taltek_STEK_OzelKod1Degeri': instance.taltekSTEKOzelKod1Degeri,
      'taltek_STEK_DipFiyatUygulamasi': instance.taltekSTEKDipFiyatUygulamasi,
      'taltek_STEK_DipFiyatSaha': instance.taltekSTEKDipFiyatSaha,
      'taltek_STEK_DipFiyatEylem': instance.taltekSTEKDipFiyatEylem,
      'taltek_ATAL': instance.taltekATAL,
      'taltek_ATAL_Kaydet': instance.taltekATALKaydet,
      'taltek_ATAL_Duzelt': instance.taltekATALDuzelt,
      'taltek_ATAL_Sil': instance.taltekATALSil,
      'taltek_ATAL_CariEMailAlani': instance.taltekATALCariEMailAlani,
      'taltek_ATAL_OnayIslemleri': instance.taltekATALOnayIslemleri,
      'taltek_ATAL_CariKoduDegistir': instance.taltekATALCariKoduDegistir,
      'taltek_ATAL_Aciklamalar_YetkiTuru':
          instance.taltekATALAciklamalarYetkiTuru,
      'taltek_ATAL_GizlenecekAlanlar': instance.taltekATALGizlenecekAlanlar,
      'taltek_ATAL_AciklamaAlanlari': instance.taltekATALAciklamaAlanlari,
      'taltek_ATAL_BelgeKopyala': instance.taltekATALBelgeKopyala,
      'taltek_STAL': instance.taltekSTAL,
      'taltek_STAL_Kaydet': instance.taltekSTALKaydet,
      'taltek_STAL_Duzelt': instance.taltekSTALDuzelt,
      'taltek_STAL_Sil': instance.taltekSTALSil,
      'taltek_STAL_KapalilarListenlenmesin':
          instance.taltekSTALKapalilarListenlenmesin,
      'taltek_STAL_OnayIslemleri': instance.taltekSTALOnayIslemleri,
      'taltek_STAL_CariKoduDegistir': instance.taltekSTALCariKoduDegistir,
      'taltek_STAL_FiyatDegistirilmesin':
          instance.taltekSTALFiyatDegistirilmesin,
      'taltek_STAL_GizlenecekAlanlar': instance.taltekSTALGizlenecekAlanlar,
      'taltek_STAL_DipFiyatUygulamasi': instance.taltekSTALDipFiyatUygulamasi,
      'ebelge_EFat': instance.ebelgeEFat,
      'ebelge_EFatCariGuncelle': instance.ebelgeEFatCariGuncelle,
      'ebelge_EFatSorgula': instance.ebelgeEFatSorgula,
      'ebelge_EFatGelenKutusu': instance.ebelgeEFatGelenKutusu,
      'ebelge_EFatTaslakOlustur': instance.ebelgeEFatTaslakOlustur,
      'ebelge_EFatTaslakSil': instance.ebelgeEFatTaslakSil,
      'ebelge_EFatTaslakBasim': instance.ebelgeEFatTaslakBasim,
      'ebelge_EFatGoruntule': instance.ebelgeEFatGoruntule,
      'ebelge_EFatAlisFatOlustur': instance.ebelgeEFatAlisFatOlustur,
      'ebelge_EFatGonder': instance.ebelgeEFatGonder,
      'ebelge_EFat_Dizayn': instance.ebelgeEFatDizayn,
      'ebelge_EArsiv': instance.ebelgeEArsiv,
      'ebelge_EArsivTaslakOlustur': instance.ebelgeEArsivTaslakOlustur,
      'ebelge_EArsivTaslakSil': instance.ebelgeEArsivTaslakSil,
      'ebelge_EArsivTaslakBasim': instance.ebelgeEArsivTaslakBasim,
      'ebelge_EArsivGoruntule': instance.ebelgeEArsivGoruntule,
      'ebelge_EArsivSorgula': instance.ebelgeEArsivSorgula,
      'ebelge_EArsivGonder': instance.ebelgeEArsivGonder,
      'ebelge_EArsiv_Dizayn': instance.ebelgeEArsivDizayn,
      'ebelge_EIrsaliye': instance.ebelgeEIrsaliye,
      'ebelge_EIrsaliyeGidenKutusu': instance.ebelgeEIrsaliyeGidenKutusu,
      'ebelge_EIrsaliyeGelenKutusu': instance.ebelgeEIrsaliyeGelenKutusu,
      'ebelge_EIrsaliyeTaslakOlustur': instance.ebelgeEIrsaliyeTaslakOlustur,
      'ebelge_EIrsaliyeTaslakSil': instance.ebelgeEIrsaliyeTaslakSil,
      'ebelge_EIrsaliyeTaslakBasim': instance.ebelgeEIrsaliyeTaslakBasim,
      'ebelge_EIrsaliyeGonder': instance.ebelgeEIrsaliyeGonder,
      'ebelge_EIrsaliyeGoruntule': instance.ebelgeEIrsaliyeGoruntule,
      'ebelge_EIrsaliye_Dizayn': instance.ebelgeEIrsaliyeDizayn,
      'entegrasyon_UETDSESYA': instance.entegrasyonUETDSESYA,
      'entegrasyon_UETDSESYA_Iptal': instance.entegrasyonUETDSESYAIptal,
    };

SevkemriMalKontrolTipi _$SevkemriMalKontrolTipiFromJson(
        Map<String, dynamic> json) =>
    $checkedCreate(
      'SevkemriMalKontrolTipi',
      json,
      ($checkedConvert) {
        final val = SevkemriMalKontrolTipi();
        $checkedConvert('Kod', (v) => val.kod = v as int?);
        $checkedConvert('Tanim', (v) => val.tanim = v as String?);
        return val;
      },
      fieldKeyMap: const {'kod': 'Kod', 'tanim': 'Tanim'},
    );

Map<String, dynamic> _$SevkemriMalKontrolTipiToJson(
        SevkemriMalKontrolTipi instance) =>
    <String, dynamic>{
      'Kod': instance.kod,
      'Tanim': instance.tanim,
    };
