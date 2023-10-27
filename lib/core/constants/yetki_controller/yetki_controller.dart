import "package:kartal/kartal.dart";

import "../../../view/main_page/model/main_page_model.dart";
import "../../../view/main_page/model/param_model.dart";
import "../../../view/main_page/model/user_model/profil_yetki_model.dart";
import "../../../view/main_page/model/user_model/user_model.dart";
import "../../init/cache/cache_manager.dart";
import "../static_variables/static_variables.dart";
import "yetki_model.dart";

class YetkiController {
  YetkiController();
  MainPageModel? get anaVeri => CacheManager.getAnaVeri;

  UserModel? get userModel => anaVeri?.userModel;
  ParamModel? get paramModel => anaVeri?.paramModel;

  ProfilYetkiModel? get yetkiModel => anaVeri?.userModel?.profilYetki;

  /// Verilen değer `null` ise `false` döndürür
  ///
  /// Eğer Admin ise `true` döndürür.
  /// Bunu yapma sebebim `null` gelen verilerin admin sebepli mi yoksa yetki sebepli mi olduğunu anlamak
  ///
  /// ! EĞER ParamModel'den geliyorsa skipAdmin: true yapılmalı, YetkiModel'den geliyorsa skipAdmin: false kalmalı
  // bool isTrue(bool? value, {bool skipAdmin = false}) => (value ?? false) || (skipAdmin ? false : (userModel?.adminMi ?? false));
  // * Adminse artık her şeye erişiyor 1.3.0
  bool isTrue(bool? value) => (value ?? false) || (userModel?.adminMi ?? false);

  //! GENEL

  bool get projeUygulamasiAcikMi => isTrue(paramModel?.projeUygulamasiAcik);
  bool get plasiyerUygulamasiAcikMi => isTrue(paramModel?.plasiyerUygulamasi);
  bool get cariRapStokSatisOzeti => isTrue(yetkiModel?.cariRapStokSatisOzeti);
  bool get lokalDepoUygulamasiAcikMi => isTrue(paramModel?.lokalDepoUygulamasiAcik);
  //! CARİ

  bool get cariListesi => isTrue(yetkiModel?.cariCariListesi);
  bool get cariListesiRiskGorebilir => isTrue(yetkiModel?.cariCariListesiRiskGorebilir);

  //* Cari Kartı
  bool get cariKarti => isTrue(yetkiModel?.cariCariKarti);
  bool get cariKartiYeniKayit => isTrue(yetkiModel?.cariCariKartiKaydet);
  bool get cariKartiDuzenleme => isTrue(yetkiModel?.cariCariKartiDuzelt);
  bool get cariKartiSilme => isTrue(yetkiModel?.cariCariKartiSil);

  bool cariKartiDegistirilmeyecekAlanlar(String? index) => isTrue(!isTrue(yetkiModel?.cariCariKartiDegismeyecekAlanlar?.contains(index) ?? false));

  //* Cari Hareketleri
  bool get cariHareketleri => isTrue(yetkiModel?.cariCariHareketleri);
  bool get cariHareketleriYeniKayit => isTrue(yetkiModel?.cariCariHarKaydet);
  bool get cariHareketleriDuzenleme => isTrue(yetkiModel?.cariCariHarDuzelt);
  bool get cariHareketleriSilme => isTrue(yetkiModel?.cariCariHarSil);
  bool get cariHareketleriHarDetayGorsun => isTrue(yetkiModel?.cariCariHareketleriHarDetayGorsun);
  bool get cariHareketleriPlasiyerKendiniGorsun => isTrue(yetkiModel?.stokCariHarPlasiyerKendiniGorsun);

  //* Cari Aktivite
  bool get cariAktivite => isTrue(yetkiModel?.cariAktivite);
  bool get cariAktiviteYeniKayit => isTrue(yetkiModel?.cariAktiviteEkle);
  bool get cariAktiviteDuzenleme => isTrue(yetkiModel?.cariAktiviteDuzelt);
  bool get cariAktiviteSilme => isTrue(yetkiModel?.cariAktiviteSil);
  bool get cariAktiviteAtayabilir => isTrue(yetkiModel?.cariAktiviteAtayabilir);
  bool get cariAktiviteBitirmeyiGeriAl => isTrue(yetkiModel?.cariAktiviteBitirmeyiGeriAl);

  //! STOK

  bool get stokListesi => isTrue(yetkiModel?.stokStokListesi);
  bool get stokFiyatOzeti => isTrue(yetkiModel?.stokFiyatOzeti);

  //* Stok Kartı
  bool get stokKarti => isTrue(yetkiModel?.stokStokKarti);
  bool get stokKartiYeniKayit => isTrue(yetkiModel?.stokStokKartiKaydet);
  bool get stokKartiDuzenleme => isTrue(yetkiModel?.stokStokKartiDuzelt);
  bool get stokKartiSilme => isTrue(yetkiModel?.stokStokKartiSil);
  bool get stokAlisFiyatiGizle => isTrue(yetkiModel?.stokStokKartiAlisFiyatiGizle);
  bool get stokSatisFiyatiGizle => isTrue(yetkiModel?.stokStokKartiSatisFiyatiGizle);

  //* Stok Hareketleri
  bool get stokHareketleriStokHareketleri => isTrue(yetkiModel?.stokStokHareketleri);
  bool get stokHareketleriStokYeniKayit => isTrue(yetkiModel?.stokStokHarKaydet);
  bool get stokHareketleriStokDuzenleme => isTrue(yetkiModel?.stokStokHarDuzelt);
  bool get stokHareketleriStokSilme => isTrue(yetkiModel?.stokStokHarSil);
  bool get stokHareketleriPlasiyerKendiniGorsun => isTrue(yetkiModel?.stokStokHarPlasiyerKendiniGorsun);
  bool get stokHareketDetayiniGizle => isTrue(yetkiModel?.stokHareketDetayiniGizle);

  //* Stok Resim
  bool get stokResimGoster => isTrue(yetkiModel?.stokResimGoster);
  bool get stokResimEkle => isTrue(yetkiModel?.stokResimGosterEkle);
  bool get stokResimSil => isTrue(yetkiModel?.stokResimGosterSil);

  //* Stok Barkod
  bool get stokBarkodKontrol => isTrue(yetkiModel?.stokBarkodKontrol);
  bool get stokBarkodTanimla => isTrue(yetkiModel?.stokBarkodTanimlama);
  bool get stokBarkodKayitlari => isTrue(yetkiModel?.stokBarkodKayitlari);
  bool get stokBarkodEkle => isTrue(yetkiModel?.stokBarkodKayitlariEkle);
  bool get stokBarkodDuzenle => isTrue(yetkiModel?.stokBarkodKayitlariDuzelt);
  bool get stokBarkodSil => isTrue(yetkiModel?.stokBarkodKayitlariSil);

  //! Sipariş

  //* Genel Sipariş Yetkileri
  String? get siparisSatisEkMaliyet2Adi => _musteriSiparisiMi ? paramModel?.satisEkMaliyet2Adi : paramModel?.alisEkMaliyet2Adi;
  int get siparisSatirKademeliIskontoSayisi => _musteriSiparisiMi ? paramModel?.satisSatirKademeliIskontoSayisi ?? 0 : paramModel?.alisSatirKademeliIskontoSayisi ?? 0;

  bool get _musteriSiparisiMi => StaticVariables.instance.isMusteriSiparisleri;
  bool get siparisOzelKod1AktifMi => false;
  bool get siparisGenIsk1AktifMi => (_musteriSiparisiMi ? siparisMSGenIsk1AktifMi : siparisSSGenIsk1AktifMi) && siparisMSDegismeyecekAlanMi(ProfilResponseModel.faturaGizlenecekAlanGenIsk1);
  bool get siparisGenIsk2AktifMi => (_musteriSiparisiMi ? siparisMSGenIsk2AktifMi : siparisSSGenIsk2AktifMi) && siparisMSDegismeyecekAlanMi(ProfilResponseModel.faturaGizlenecekAlanGenIsk2);
  bool get siparisGenIsk3AktifMi => (_musteriSiparisiMi ? siparisMSGenIsk3AktifMi : siparisSSGenIsk3AktifMi) && siparisMSDegismeyecekAlanMi(ProfilResponseModel.faturaGizlenecekAlanGenIsk3);
  bool get siparisDuzelt => _musteriSiparisiMi ? siparisMSDuzelt : siparisSSDuzelt;
  bool get siparisKaydet => _musteriSiparisiMi ? siparisMSKaydet : siparisSSKaydet;
  bool get siparisSil => _musteriSiparisiMi ? siparisMSSil : siparisSSSil;
  bool get siparisKapalilarListelenmesin => _musteriSiparisiMi ? siparisMSKapalilarListelenmesin : siparisSSKapalilarListelenmesin;
  bool get siparisBirim1denKaydet => _musteriSiparisiMi ? siparisMSBirim1denKaydet : siparisSSBirim1denKaydet;
  bool get siparisDigerSekmesiGoster => _musteriSiparisiMi ? siparisMSDigerSekmesiGoster : siparisSSDigerSekmesiGoster;
  bool get siparisKosulAktifMi => _musteriSiparisiMi ? siparisMSKosulAktifMi : siparisSSKosulAktifMi;
  bool get siparisKosulSatirdaSor => _musteriSiparisiMi ? (siparisMSKosulAktifMi && siparisMSKosulSatirdaSor) : siparisSSKosulAktifMi;
  bool get siparisFarkliTeslimCariAktif => _musteriSiparisiMi ? siparisMSFarkliTeslimCariAktif : siparisSSFarkliTeslimCariAktif;
  bool get siparisMiktar2Sor => _musteriSiparisiMi ? siparisMSMiktar2Sor : siparisSSMiktar2Sor;
  bool get siparisSatirdaKDVSor => _musteriSiparisiMi ? siparisMSsatirdaKDVSor : siparisSSsatirdaKDVSor;
  bool get siparisEkMaliyet1GizlenecekMi => siparisMSGizlenecekAlanMi(ProfilResponseModel.faturaGizlenecekAlanEkMaliyet1);
  bool get siparisEkMaliyet2GizlenecekMi => siparisMSGizlenecekAlanMi(ProfilResponseModel.faturaGizlenecekAlanEkMaliyet2);
  bool get siparisEkMaliyet3GizlenecekMi => siparisMSGizlenecekAlanMi(ProfilResponseModel.faturaGizlenecekAlanEkMaliyet3);
  bool get siparisHizmetAktifMi => _musteriSiparisiMi ? siparisMSSatisHizmetAktifMi : siparisSSSatisHizmetAktifMi;
  bool get siparisKontrolAciklamasiAktifMi => _musteriSiparisiMi ? siparisMSKontrolAciklamasiAktifMi : siparisSSKontrolAciklamasiAktifMi;
  bool get siparisSatirdaEkAlan2AktifMi => _musteriSiparisiMi ? siparisMSSatirdaEkAlan2AktifMi : siparisSSSatirdaEkAlan2AktifMi;
  bool get siparisEkAlan1AktifMi => _musteriSiparisiMi ? siparisMSEkAlan1AktifMi : false;
  bool get siparisSatirdaTeslimTarihiSor => _musteriSiparisiMi ? siparisMSsatirdaTeslimTarihiSor : siparisSSSatirdaTeslimTarihiSor;

  //* Müşteri Siparişi
  //😳SatisSatirKademeliIskontoSayisi => 0 ise kademeli iskonto yok demektir. Kaç tane varsa o kadar genisk ve geniskTipi gelecek
  bool get satisOzelKod1AktifMi => isTrue(paramModel?.satisOzelKod1Aktif ?? false);
  bool get satisOzelKod2AktifMi => isTrue(paramModel?.satisOzelKod2Aktif);
  bool get siparisMSGenIsk1AktifMi => isTrue(paramModel?.satisGenIsk1Aktif);
  bool get siparisMSGenIsk2AktifMi => isTrue(paramModel?.satisGenIsk2Aktif);
  bool get siparisMSGenIsk3AktifMi => isTrue(paramModel?.satisGenIsk3Aktif);
  bool get siparisMSDuzelt => isTrue(yetkiModel?.siparisMusteriSiparisiDuzelt);
  bool get siparisMSKaydet => isTrue(yetkiModel?.siparisMusteriSiparisiKaydet);
  bool get siparisMSSil => isTrue(yetkiModel?.siparisMusteriSiparisiSil);
  bool get siparisMSCariKoduDegistir => isTrue(yetkiModel?.siparisMusSipCariKoduDegistir);
  bool get siparisMSOtoPdfGor => isTrue(yetkiModel?.siparisMusSipOtoPdfGor);
  bool get siparisMSKapalilarListelenmesin => isTrue(yetkiModel?.siparisMusteriSiparisiKapalilarListelenmesin);
  bool get siparisMSBirim1denKaydet => isTrue(yetkiModel?.siparisMusSipBirim1denKaydet);
  bool get siparisMSKapatmaIslemi => isTrue(yetkiModel?.siparisMusteriSiparisiKapatmaIslemi);
  bool get siparisMSOnayIslemleri => isTrue(yetkiModel?.siparisMusSipOnayIslemleri);
  bool get siparisMSSonFiyatGoster => isTrue(yetkiModel?.siparisMusteriSiparisiSonFiyatGoster);
  bool get siparisMSDigerSekmesiGoster => isTrue(yetkiModel?.siparisMusSipDigerSekmesiGoster);
  bool get siparisMSKosulAktifMi => isTrue(paramModel?.satisKosulAktif);
  bool get siparisMSKosulSatirdaSor => isTrue(paramModel?.satisKosulSatirdaSor);
  bool get siparisMSFarkliTeslimCariAktif => isTrue(paramModel?.satisFarkliTeslimCariAktif);
  bool get siparisMSMiktar2Sor => isTrue(paramModel?.satisMiktar2Sor);
  bool get siparisMSISk1YuzdeSor => isTrue((paramModel?.satisSatirIsk1YuzdeSor ?? false) && StaticVariables.instance.isMusteriSiparisleri);
  bool get siparisMSsatirdaKDVSor => isTrue(paramModel?.satisSatirdaKdvSor);
  bool get siparisMSSatisHizmetAktifMi => isTrue(paramModel?.satisHizmetAktif);
  bool get siparisMSEkMaliyet2AktifMi => isTrue(paramModel?.satisEkMaliyet2Aktif);
  bool get siparisMSEkAlan1AktifMi => isTrue(paramModel?.satisEkAlan1Aktif);
  bool get siparisMSSatirdaEkAlan2AktifMi => isTrue(paramModel?.satisSatirdaEkAlan2Aktif);
  bool get siparisMSSatirIsk1YuzdeSor => isTrue(paramModel?.satisSatirIsk1YuzdeSor);
  bool get siparisMSsatirdaTeslimTarihiSor => isTrue(paramModel?.satisSatirdaTeslimTarihiSor);

  // bool get siparisMSbelgeKopyala => isTrue(yetkiModel?.siparisMusSipBelge);
  ///? Eğer içeriyorsa boş geçilecek
  bool siparisMSBosGecilecekAlanMi(String alan) => !isTrue(yetkiModel?.siparisMusSipBosGecilmeyecekAlanlar?.contains(alan));

  ///? Eğer içeriyorsa gizlenecek
  bool siparisMSGizlenecekAlanMi(String alan) => !isTrue(yetkiModel?.siparisMusteriSiparisiGizlenecekAlanlar?.contains(alan));
  bool get siparisMSKontrolAciklamasiAktifMi => isTrue(paramModel?.fatuKontrolAciklamasiAktif?.contains("MS"));

  ///? Eğer içeriyorsa değiştirilemeyecek
  bool siparisMSDegismeyecekAlanMi(String alan) => !isTrue(yetkiModel?.siparisMusteriSiparisiDegismeyecekAlanlar?.contains(alan));

  ///? Eğer içeriyorsa gösterilecek (Sipariş için)
  bool siparisMSAciklamaAlanlari(int? index) => (index == null
      ? isTrue(yetkiModel?.siparisMusteriSiparisiAciklamaAlanlari?.ext.isNotNullOrEmpty)
      : isTrue(isTrue(yetkiModel?.siparisMusteriSiparisiAciklamaAlanlari?.contains(index) ?? false)) && (paramModel?.satisEkAciklamalarAktif ?? false));

  ///? Eğer içeriyorsa gösterilecek (Kalemler İçin)
  bool siparisMSSatirAciklamaAlanlari(int? index) => index == null
      ? isTrue(yetkiModel?.siparisMusteriSiparisiSatirAciklamaAlanlari?.ext.isNotNullOrEmpty)
      : isTrue((yetkiModel?.siparisMusteriSiparisiSatirAciklamaAlanlari?.contains(index) ?? false) && (paramModel?.satisSatirdaAciklamalarAktif ?? false));

  //* Satıcı Siparişi
  // bool get alisOzelKod1AktifMi => isTrue(paramModel?.alisO);
  // bool get alisOzelKod2AktifMi => isTrue(paramModel?.alisOzelKod2Aktif);
  bool get siparisSSGenIsk1AktifMi => isTrue(paramModel?.alisGenIsk1Aktif);
  bool get siparisSSGenIsk2AktifMi => isTrue(paramModel?.alisGenIsk2Aktif);
  bool get siparisSSGenIsk3AktifMi => isTrue(paramModel?.alisGenIsk3Aktif);
  bool get siparisSSDuzelt => isTrue(yetkiModel?.siparisSaticiSiparisiDuzelt);
  bool get siparisSSKaydet => isTrue(yetkiModel?.siparisSaticiSiparisiKaydet);
  bool get siparisSSSil => isTrue(yetkiModel?.siparisSaticiSiparisiSil);
  bool get siparisSSKapalilarListelenmesin => isTrue(yetkiModel?.siparisSaticiSiparisiKapalilarListelenmesin);
  bool get siparisSSBirim1denKaydet => isTrue(yetkiModel?.siparisSaticiSipBirim1denKaydet);
  bool get siparisSSDigerSekmesiGoster => isTrue(yetkiModel?.siparisSaticiSipDigerSekmesiGoster);
  bool get siparisSSKosulAktifMi => isTrue(paramModel?.alisKosulAktif);
  bool get siparisSSFarkliTeslimCariAktif => isTrue(paramModel?.alisFarkliTeslimCariAktif);
  bool get siparisSSMiktar2Sor => isTrue(paramModel?.alisMiktar2Sor);
  bool get siparisSSsatirdaKDVSor => isTrue(paramModel?.alisSatirdaKdvSor);
  bool get siparisSSSatisHizmetAktifMi => isTrue(paramModel?.alisHizmetAktif);
  bool get siparisSSKontrolAciklamasiAktifMi => isTrue(paramModel?.fatuKontrolAciklamasiAktif?.contains("SS"));
  bool get siparisSSSatirdaEkAlan2AktifMi => isTrue(paramModel?.alisSatirdaEkAlan2Aktif);
  bool get siparisSSSatirdaTeslimTarihiSor => isTrue(paramModel?.alisSatirdaTeslimTarihiSor);
  // bool get siparisSSISk1YuzdeSor => isTrue(paramModel?.alisSatirIsk1YuzdeSor);

  //! FİNANS
  bool referansKodu(String? hesapTipi) {
    if ((paramModel?.muhasebeEntegre ?? false) && (paramModel?.muhFislerdeRefKodSorulsun ?? false) && hesapTipi != null) {
      if (hesapTipi == "A") {
        return isTrue(paramModel?.muhFislerdeRefKodSorulsunAktif);
      } else if (hesapTipi == "P") {
        return isTrue(paramModel?.muhFislerdeRefKodSorulsunPasif);
      } else if (hesapTipi == "G") {
        return isTrue(paramModel?.muhFislerdeRefKodSorulsunGelir);
      } else if (hesapTipi == "I") {
        return isTrue(paramModel?.muhFislerdeRefKodSorulsunGider);
      } else if (hesapTipi == "N") {
        return isTrue(paramModel?.muhFislerdeRefKodSorulsunNazim);
      }
      return false;
    }
    return false;
  }

  //* Kasa
  bool get kasaListesi => isTrue(yetkiModel?.finansKasaListesi);
  bool get finansKasaIslemleriSil => isTrue(yetkiModel?.finansKasaIslemleriSil);

  //! SEVKİYAT

  bool sevkiyatSatisFatAciklamaAlanlari(int? index) => isTrue(!isTrue(yetkiModel?.sevkiyatSatisFatAciklamaAlanlari?.contains(index) ?? false));
  bool sevkiyatIrsAciklamaAlanlari(int? index) => isTrue(!isTrue(yetkiModel?.sevkiyatSatisIrsaliyesiAciklamaAlanlari?.contains(index) ?? false));
  bool sevkiyatSatisFatGizlenecekAlanlar(String? index) => isTrue(!isTrue(yetkiModel?.sevkiyatSatisFatGizlenecekAlanlar?.contains(index) ?? false));
  bool sevkiyatIrsDegistirilmeyecekAlanlar(String? index) => isTrue(!isTrue(yetkiModel?.sevkiyatSatisFatDegismeyecekAlanlar?.contains(index) ?? false));

  bool get satisFatEkle => isTrue(yetkiModel?.sevkiyatSatisFatKaydet);
  bool get satisFatDuzenle => isTrue(yetkiModel?.sevkiyatSatisFatDuzelt);
  bool get satisFatSil => isTrue(yetkiModel?.sevkiyatSatisFatSil);

  bool get satisIrsEkle => isTrue(yetkiModel?.sevkiyatSatisIrsaliyesiKayit);
  bool get satisIrsDuzenle => isTrue(yetkiModel?.sevkiyatSatisIrsaliyesiDuzeltme);
  bool get satisIrsSil => isTrue(yetkiModel?.sevkiyatSatisIrsaliyesiSilme);

  bool get satisFatDigerSekmesiGelsin => isTrue(yetkiModel?.sevkiyatSatisFatDigerSekmesiGoster);
  bool get satisIrsDigerSekmesiGelsin => isTrue(yetkiModel?.sevkiyatSatisIrsDigerSekmesiGoster);

  //! MAL KABUL

  bool malKabulAlisFatAciklamaAlanlari(int? index) => isTrue(!isTrue(yetkiModel?.malKabulAlisFatAciklamaAlanlari?.contains(index) ?? false));
  bool malKabulAlisIrsAciklamaAlanlari(int? index) => isTrue(!isTrue(yetkiModel?.malKabulAlisIrsAciklamaAlanlari?.contains(index) ?? false));
  // bool malKabulAlisFatGizlenecekAlanlar(String? index) => isTrue(!isTrue(yetkiModel?.malKabulAlisFatGizlenecekAlanlar?.contains(index) ?? false));
  // bool malKabulAlisFatDegistirilmeyecekAlanlar(String? index) => isTrue(!isTrue(yetkiModel?.malKabulAlisFatDegismeyecekAlanlar?.contains(index) ?? false));
  bool malKabulAlisIrsGizlenecekAlanlar(String? index) => isTrue(!isTrue(yetkiModel?.malKabulAlisIrsGizlenecekAlanlar?.contains(index) ?? false));
  // bool malKabulAlisIrsDegistirilmeyecekAlanlar(String? index) => isTrue(!isTrue(yetkiModel?.degismey?.contains(index) ?? false));

  bool get alisFatEkle => isTrue(yetkiModel?.malKabulAlisFaturasiKaydet);
  bool get alisFatDuzenle => isTrue(yetkiModel?.malKabulAlisFaturasiDuzelt);
  bool get alisFatSil => isTrue(yetkiModel?.malKabulAlisFaturasiSil);

  bool get alisIrsEkle => isTrue(yetkiModel?.malKabulSatinAlmaKaydet);
  bool get alisIrsDuzenle => isTrue(yetkiModel?.malKabulSatinAlmaDuzelt);
  bool get alisIrsSil => isTrue(yetkiModel?.malKabulSatinAlmaSil);

  bool get alisFatDigerSekmesiGelsin => isTrue(yetkiModel?.malKabulAlisFatDigerSekmesiGoster);
  bool get alisIrsDigerSekmesiGelsin => isTrue(yetkiModel?.malKabulAlisFatDigerSekmesiGoster);
  // bool get satisFatEkle => isTrue(yetkiModel?.ekle);

  //! E-FATURA

  bool get ebelgeEFatura => isTrue((yetkiModel?.ebelgeEFat ?? false) && (paramModel?.eFaturaAktif ?? false));
  bool get ebelgeEFaturaGelenKutusu => isTrue(yetkiModel?.ebelgeEFatGelenKutusu);
  bool get ebelgeEFaturaGidenKutusu => isTrue(yetkiModel?.ebelgeEFatSorgula);
  bool get ebelgeEFaturaGonder => isTrue(yetkiModel?.ebelgeEFatGonder);
  bool get ebelgeEFaturaSorgula => isTrue(yetkiModel?.ebelgeEFatSorgula);
  bool get ebelgeEFaturaGoruntule => isTrue(yetkiModel?.ebelgeEFatGoruntule);

  bool get ebelgeEIrsaliye => isTrue((yetkiModel?.ebelgeEIrsaliye ?? false) && (paramModel?.eIrsaliyeAktif ?? false));
  bool get ebelgeEIrsaliyeGelenKutusu => isTrue(yetkiModel?.ebelgeEIrsaliyeGelenKutusu);
  bool get ebelgeEIrsaliyeGidenKutusu => isTrue(yetkiModel?.ebelgeEIrsaliyeGidenKutusu);
  bool get ebelgeEIrsaliyeGonder => isTrue(yetkiModel?.ebelgeEIrsaliyeGonder);
  // bool get ebelgeEIrsaliyeSorgula => isTrue(yetkiModel?.ebelgeEIrsaliyeSorgula);
  bool get ebelgeEIrsaliyeGoruntule => isTrue(yetkiModel?.ebelgeEIrsaliyeGoruntule);

  bool get ebelgeEArsiv => isTrue((yetkiModel?.ebelgeEArsiv ?? false) && (paramModel?.eIrsaliyeAktif ?? false));
  // bool get ebelgeEArsivGelenKutusu => isTrue(yetkiModel?.ebelgeEArsivGelenKutusu);
  bool get ebelgeEArsivGidenKutusu => isTrue((paramModel?.eIrsaliyeAktif ?? false) && (yetkiModel?.ebelgeEArsivSorgula ?? false));
  bool get ebelgeEArsivGonder => isTrue(yetkiModel?.ebelgeEArsivGonder);
  bool get ebelgeEArsivSorgula => isTrue(yetkiModel?.ebelgeEArsivSorgula);
  bool get ebelgeEArsivGoruntule => isTrue(yetkiModel?.ebelgeEArsivGoruntule);
}
