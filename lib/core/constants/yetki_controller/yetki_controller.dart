import "package:kartal/kartal.dart";

import "../../../view/main_page/model/main_page_model.dart";
import "../../../view/main_page/model/param_model.dart";
import "../../../view/main_page/model/user_model/profil_yetki_model.dart";
import "../../../view/main_page/model/user_model/user_model.dart";
import "../../init/cache/cache_manager.dart";
import "../static_variables/static_variables.dart";
import "yetki_model.dart";

final class YetkiController {
  YetkiController();
  MainPageModel? get _anaVeri => CacheManager.getAnaVeri;

  UserModel? get userModel => _anaVeri?.userModel;
  ParamModel? get _paramModel => _anaVeri?.paramModel;

  ProfilYetkiModel? get _yetkiModel => userModel?.profilYetki;

  /// Verilen değer `null` ise `false` döndürür
  ///
  /// Eğer Admin ise `true` döndürür.
  /// Bunu yapma sebebim `null` gelen verilerin admin sebepli mi yoksa yetki sebepli mi olduğunu anlamak
  ///
  /// ! `EĞER ParamModel'den geliyorsa skipAdmin: true yapılmalı, YetkiModel'den geliyorsa skipAdmin: false kalmalı`
  // bool _isTrue(bool? value, {bool skipAdmin = false}) => (value ?? false) || (skipAdmin ? false : (userModel?.adminMi ?? false));
  // * Adminse artık her şeye erişiyor 1.3.0
  bool _isTrue(bool? value, {bool skipAdmin = false}) => (value ?? false) || (skipAdmin ? false : (userModel?.adminMi ?? false));

  //! GENEL


  int get satisKademeliIskontoSayisi => _paramModel?.satisSatirKademeliIskontoSayisi ?? 0;
  int get alisKademeliIskontoSayisi => _paramModel?.alisSatirKademeliIskontoSayisi ?? 0;

  bool get projeUygulamasiAcikMi => _isTrue(_paramModel?.projeUygulamasiAcik, skipAdmin: true);
  bool get plasiyerUygulamasiAcikMi => _isTrue(_paramModel?.plasiyerUygulamasi, skipAdmin: true);
  bool get lokalDepoUygulamasiAcikMi => _isTrue(_paramModel?.lokalDepoUygulamasiAcik, skipAdmin: true);

  //! TEMSİLCİ
  bool get temsilciProfilKdvDahilMi => _isTrue(_yetkiModel?.temsilciProfilKdvDahil, skipAdmin: true);
  bool get temsilciProfilSatisPerformansiniGizle => _isTrue(_yetkiModel?.temsilciProfilSatisPerformansiniGizle, skipAdmin: true);
  bool get temsilciProfilAylaraGoreSatisiGizle => _isTrue(_yetkiModel?.temsilciProfilAylaraGoreSatisiGizle, skipAdmin: true);
  bool get temsilciProfilAylaraGoreTahsilatiGizle => _isTrue(_yetkiModel?.temsilciProfilAylaraGoreTahsilatiGizle, skipAdmin: true);

  //! CARİ

  bool get cariListesi => _isTrue(_yetkiModel?.cariCariListesi);
  bool get cariRapStokSatisOzeti => _isTrue(_yetkiModel?.cariRapStokSatisOzeti);
  bool get cariListesiRiskGorebilir => _isTrue(_yetkiModel?.cariCariListesiRiskGorebilir);

  //* Cari Kartı
  bool get cariKarti => _isTrue(_yetkiModel?.cariCariKarti);
  bool get cariKartiYeniKayit => _isTrue(_yetkiModel?.cariCariKartiKaydet);
  bool get cariKartiDuzenleme => _isTrue(_yetkiModel?.cariCariKartiDuzelt);
  bool get cariKartiSilme => _isTrue(_yetkiModel?.cariCariKartiSil);

  bool cariKartiDegistirilmeyecekAlanlar(String? index) => _isTrue(!_isTrue(_yetkiModel?.cariCariKartiDegismeyecekAlanlar?.contains(index) ?? false));

  //* Cari Hareketleri
  bool get cariHareketleri => _isTrue(_yetkiModel?.cariCariHareketleri);
  bool get cariHareketleriYeniKayit => _isTrue(_yetkiModel?.cariCariHarKaydet);
  bool get cariHareketleriDuzenleme => _isTrue(_yetkiModel?.cariCariHarDuzelt);
  bool get cariHareketleriSilme => _isTrue(_yetkiModel?.cariCariHarSil);
  bool get cariHareketleriHarDetayGorsun => _isTrue(_yetkiModel?.cariCariHareketleriHarDetayGorsun);
  bool get cariHareketleriPlasiyerKendiniGorsun => _isTrue(_yetkiModel?.stokCariHarPlasiyerKendiniGorsun);

  //* Cari Aktivite
  bool get cariAktivite => _isTrue(_yetkiModel?.cariAktivite);
  bool get cariAktiviteYeniKayit => _isTrue(_yetkiModel?.cariAktiviteEkle);
  bool get cariAktiviteDuzenleme => _isTrue(_yetkiModel?.cariAktiviteDuzelt);
  bool get cariAktiviteSilme => _isTrue(_yetkiModel?.cariAktiviteSil);
  bool get cariAktiviteAtayabilir => _isTrue(_yetkiModel?.cariAktiviteAtayabilir);
  bool get cariAktiviteBitirmeyiGeriAl => _isTrue(_yetkiModel?.cariAktiviteBitirmeyiGeriAl);

  //! STOK

  bool get stokListesi => _isTrue(_yetkiModel?.stokStokListesi);
  bool get stokFiyatOzeti => _isTrue(_yetkiModel?.stokFiyatOzeti);

  //* Stok Kartı
  bool get stokKarti => _isTrue(_yetkiModel?.stokStokKarti);
  bool get stokKartiYeniKayit => _isTrue(_yetkiModel?.stokStokKartiKaydet);
  bool get stokKartiDuzenleme => _isTrue(_yetkiModel?.stokStokKartiDuzelt);
  bool get stokKartiSilme => _isTrue(_yetkiModel?.stokStokKartiSil);
  bool get stokAlisFiyatiGizle => _isTrue(_yetkiModel?.stokStokKartiAlisFiyatiGizle);
  bool get stokSatisFiyatiGizle => _isTrue(_yetkiModel?.stokStokKartiSatisFiyatiGizle);

  //* Stok Hareketleri
  bool get stokHareketleriStokHareketleri => _isTrue(_yetkiModel?.stokStokHareketleri);
  bool get stokHareketleriStokYeniKayit => _isTrue(_yetkiModel?.stokStokHarKaydet);
  bool get stokHareketleriStokDuzenleme => _isTrue(_yetkiModel?.stokStokHarDuzelt);
  bool get stokHareketleriStokSilme => _isTrue(_yetkiModel?.stokStokHarSil);
  bool get stokHareketleriPlasiyerKendiniGorsun => _isTrue(_yetkiModel?.stokStokHarPlasiyerKendiniGorsun);
  bool get stokHareketDetayiniGizle => _isTrue(_yetkiModel?.stokHareketDetayiniGizle ?? false, skipAdmin: true);

  //* Stok Resim
  bool get stokResimGoster => _isTrue(_yetkiModel?.stokResimGoster);
  bool get stokResimEkle => _isTrue(_yetkiModel?.stokResimGosterEkle);
  bool get stokResimSil => _isTrue(_yetkiModel?.stokResimGosterSil);

  //* Stok Barkod
  bool get stokBarkodKontrol => _isTrue(_yetkiModel?.stokBarkodKontrol);
  bool get stokBarkodTanimla => _isTrue(_yetkiModel?.stokBarkodTanimlama);
  bool get stokBarkodKayitlari => _isTrue(_yetkiModel?.stokBarkodKayitlari);
  bool get stokBarkodEkle => _isTrue(_yetkiModel?.stokBarkodKayitlariEkle);
  bool get stokBarkodDuzenle => _isTrue(_yetkiModel?.stokBarkodKayitlariDuzelt);
  bool get stokBarkodSil => _isTrue(_yetkiModel?.stokBarkodKayitlariSil);

  //! Sipariş
  bool get _musteriSiparisiMi => StaticVariables.instance.isMusteriSiparisleri;

  //* Genel Sipariş Yetkileri

  String? get siparisSatisEkMaliyet2Adi => _musteriSiparisiMi ? _paramModel?.satisEkMaliyet2Adi : _paramModel?.alisEkMaliyet2Adi;
  int get siparisSatirKademeliIskontoSayisi => _musteriSiparisiMi ? _paramModel?.satisSatirKademeliIskontoSayisi ?? 0 : _paramModel?.alisSatirKademeliIskontoSayisi ?? 0;

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
  bool get satisOzelKod1AktifMi => _isTrue(_paramModel?.satisOzelKod1Aktif ?? false, skipAdmin: true);
  bool get satisOzelKod2AktifMi => _isTrue(_paramModel?.satisOzelKod2Aktif, skipAdmin: true);
  bool get siparisMSGenIsk1AktifMi => _isTrue(_paramModel?.satisGenIsk1Aktif, skipAdmin: true);
  bool get siparisMSGenIsk2AktifMi => _isTrue(_paramModel?.satisGenIsk2Aktif, skipAdmin: true);
  bool get siparisMSGenIsk3AktifMi => _isTrue(_paramModel?.satisGenIsk3Aktif, skipAdmin: true);
  bool get siparisMSDuzelt => _isTrue(_yetkiModel?.siparisMusteriSiparisiDuzelt);
  bool get siparisMSKaydet => _isTrue(_yetkiModel?.siparisMusteriSiparisiKaydet);
  bool get siparisMSSil => _isTrue(_yetkiModel?.siparisMusteriSiparisiSil);
  bool get siparisMSCariKoduDegistir => _isTrue(_yetkiModel?.siparisMusSipCariKoduDegistir);
  bool get siparisMSOtoPdfGor => _isTrue(_yetkiModel?.siparisMusSipOtoPdfGor);
  bool get siparisMSKapalilarListelenmesin => _isTrue(_yetkiModel?.siparisMusteriSiparisiKapalilarListelenmesin);
  bool get siparisMSBirim1denKaydet => _isTrue(_yetkiModel?.siparisMusSipBirim1DenKaydet);
  bool get siparisMSKapatmaIslemi => _isTrue(_yetkiModel?.siparisMusteriSiparisiKapatmaIslemi);
  bool get siparisMSOnayIslemleri => _isTrue(_yetkiModel?.siparisMusSipOnayIslemleri);
  bool get siparisMSSonFiyatGoster => _isTrue(_yetkiModel?.siparisMusteriSiparisiSonFiyatGoster);
  bool get siparisMSDigerSekmesiGoster => _isTrue(_yetkiModel?.siparisMusSipDigerSekmesiGoster);
  bool get siparisMSKosulAktifMi => _isTrue(_paramModel?.satisKosulAktif, skipAdmin: true);
  bool get siparisMSKosulSatirdaSor => _isTrue(_paramModel?.satisKosulSatirdaSor, skipAdmin: true);
  bool get siparisMSFarkliTeslimCariAktif => _isTrue(_paramModel?.satisFarkliTeslimCariAktif, skipAdmin: true);
  bool get siparisMSMiktar2Sor => _isTrue(_paramModel?.satisMiktar2Sor, skipAdmin: true);
  bool get siparisMSISk1YuzdeSor => _isTrue(
        (_paramModel?.satisSatirIsk1YuzdeSor ?? false) && StaticVariables.instance.isMusteriSiparisleri,
      );
  bool get siparisMSsatirdaKDVSor => _isTrue(_paramModel?.satisSatirdaKdvSor, skipAdmin: true);
  bool get siparisMSSatisHizmetAktifMi => _isTrue(_paramModel?.satisHizmetAktif, skipAdmin: true);
  bool get siparisMSEkMaliyet2AktifMi => _isTrue(_paramModel?.satisEkMaliyet2Aktif, skipAdmin: true);
  bool get siparisMSEkAlan1AktifMi => _isTrue(_paramModel?.satisEkAlan1Aktif, skipAdmin: true);
  bool get siparisMSSatirdaEkAlan2AktifMi => _isTrue(_paramModel?.satisSatirdaEkAlan2Aktif, skipAdmin: true);
  bool get siparisMSSatirIsk1YuzdeSor => _isTrue(_paramModel?.satisSatirIsk1YuzdeSor, skipAdmin: true);
  bool get siparisMSsatirdaTeslimTarihiSor => _isTrue(_paramModel?.satisSatirdaTeslimTarihiSor, skipAdmin: true);

  // bool get siparisMSbelgeKopyala => _isTrue(_yetkiModel?.siparisMusSipBelge);
  ///? Eğer içeriyorsa boş geçilecek
  bool siparisMSBosGecilecekAlanMi(String alan) => _isTrue(!(_yetkiModel?.siparisMusSipBosGecilmeyecekAlanlar?.contains(alan) ?? false));

  ///? Eğer içeriyorsa gizlenecek
  bool siparisMSGizlenecekAlanMi(String alan) => _isTrue(!(_yetkiModel?.siparisMusteriSiparisiGizlenecekAlanlar?.contains(alan) ?? false));
  bool get siparisMSKontrolAciklamasiAktifMi => _isTrue(_paramModel?.fatuKontrolAciklamasiAktif?.contains("MS"), skipAdmin: true);

  ///? Eğer içeriyorsa değiştirilemeyecek
  bool siparisMSDegismeyecekAlanMi(String alan) => _isTrue(!(_yetkiModel?.siparisMusteriSiparisiDegismeyecekAlanlar?.contains(alan) ?? false));

  ///? Eğer içeriyorsa gösterilecek (Sipariş için)
  bool siparisMSAciklamaAlanlari(int? index) => (index == null
      ? _isTrue(_yetkiModel?.siparisMusteriSiparisiAciklamaAlanlari?.ext.isNotNullOrEmpty)
      : _isTrue(_isTrue(_yetkiModel?.siparisMusteriSiparisiAciklamaAlanlari?.contains(index) ?? false)) && (_paramModel?.satisEkAciklamalarAktif ?? false));

  ///? Eğer içeriyorsa gösterilecek (Kalemler İçin)
  bool siparisMSSatirAciklamaAlanlari(int? index) => index == null
      ? _isTrue(_yetkiModel?.siparisMusteriSiparisiSatirAciklamaAlanlari?.ext.isNotNullOrEmpty)
      : _isTrue((_yetkiModel?.siparisMusteriSiparisiSatirAciklamaAlanlari?.contains(index) ?? false) && (_paramModel?.satisSatirdaAciklamalarAktif ?? false));

  //* Satıcı Siparişi
  // bool get alisOzelKod1AktifMi => _isTrue(_paramModel?.alisO);
  // bool get alisOzelKod2AktifMi => _isTrue(_paramModel?.alisOzelKod2Aktif);
  bool get siparisSSGenIsk1AktifMi => _isTrue(_paramModel?.alisGenIsk1Aktif, skipAdmin: true);
  bool get siparisSSGenIsk2AktifMi => _isTrue(_paramModel?.alisGenIsk2Aktif, skipAdmin: true);
  bool get siparisSSGenIsk3AktifMi => _isTrue(_paramModel?.alisGenIsk3Aktif, skipAdmin: true);
  bool get siparisSSDuzelt => _isTrue(_yetkiModel?.siparisSaticiSiparisiDuzelt);
  bool get siparisSSKaydet => _isTrue(_yetkiModel?.siparisSaticiSiparisiKaydet);
  bool get siparisSSSil => _isTrue(_yetkiModel?.siparisSaticiSiparisiSil);
  bool get siparisSSKapalilarListelenmesin => _isTrue(_yetkiModel?.siparisSaticiSiparisiKapalilarListelenmesin);
  bool get siparisSSBirim1denKaydet => _isTrue(_yetkiModel?.siparisSaticiSipBirim1DenKaydet);
  bool get siparisSSDigerSekmesiGoster => _isTrue(_yetkiModel?.siparisSaticiSipDigerSekmesiGoster);
  bool get siparisSSKosulAktifMi => _isTrue(_paramModel?.alisKosulAktif, skipAdmin: true);
  bool get siparisSSFarkliTeslimCariAktif => _isTrue(_paramModel?.alisFarkliTeslimCariAktif, skipAdmin: true);
  bool get siparisSSMiktar2Sor => _isTrue(_paramModel?.alisMiktar2Sor, skipAdmin: true);
  bool get siparisSSsatirdaKDVSor => _isTrue(_paramModel?.alisSatirdaKdvSor, skipAdmin: true);
  bool get siparisSSSatisHizmetAktifMi => _isTrue(_paramModel?.alisHizmetAktif, skipAdmin: true);
  bool get siparisSSKontrolAciklamasiAktifMi => _isTrue(_paramModel?.fatuKontrolAciklamasiAktif?.contains("SS"), skipAdmin: true);
  bool get siparisSSSatirdaEkAlan2AktifMi => _isTrue(_paramModel?.alisSatirdaEkAlan2Aktif, skipAdmin: true);
  bool get siparisSSSatirdaTeslimTarihiSor => _isTrue(_paramModel?.alisSatirdaTeslimTarihiSor, skipAdmin: true);
  // bool get siparisSSISk1YuzdeSor => _isTrue(_paramModel?.alisSatirIsk1YuzdeSor);

  //! FİNANS
  bool referansKoduSorulsun(bool tahsilatMi) => tahsilatMi ? tahsilatReferansKoduSorulsun : odemeReferansKoduSorulsun;
  bool referansKodu(String? hesapTipi) {
    if ((_paramModel?.muhasebeEntegre ?? false) && (_paramModel?.muhFislerdeRefKodSorulsun ?? false) && hesapTipi != null) {
      if (hesapTipi == "A") {
        return _isTrue(_paramModel?.muhFislerdeRefKodSorulsunAktif);
      } else if (hesapTipi == "P") {
        return _isTrue(_paramModel?.muhFislerdeRefKodSorulsunPasif);
      } else if (hesapTipi == "G") {
        return _isTrue(_paramModel?.muhFislerdeRefKodSorulsunGelir);
      } else if (hesapTipi == "I") {
        return _isTrue(_paramModel?.muhFislerdeRefKodSorulsunGider);
      } else if (hesapTipi == "N") {
        return _isTrue(_paramModel?.muhFislerdeRefKodSorulsunNazim);
      }
      return false;
    }
    return false;
  }

  //* Kasa
  bool get kasaListesi => _isTrue(_yetkiModel?.finansKasaListesi);
  bool get finansKasaIslemleriSil => _isTrue(_yetkiModel?.finansKasaIslemleriSil);
  bool get tahsilatReferansKoduSorulsun => _isTrue(_paramModel?.muhFislerdeRefKodSorulsunGelir, skipAdmin: true);
  bool get odemeReferansKoduSorulsun => _isTrue(_paramModel?.muhFislerdeRefKodSorulsunGider, skipAdmin: true);

  //* Banka
  bool kayitliHesapTipiMi(int value) => _paramModel?.kayitliBankaHesapTipleri?.contains(value) ?? false;

  bool get musteriCekSil => _isTrue(_yetkiModel?.finansMcekSil);
  bool get musteriSenetSil => _isTrue(_yetkiModel?.finansMsenSil);
  bool get borcCekSil => _isTrue(_yetkiModel?.finansBcekSil);
  bool get borcSenetSil => _isTrue(_yetkiModel?.finansBsenSil);

  bool get musteriCekEkle => _isTrue(_yetkiModel?.finansMcekEkle);
  bool get musteriSenetEkle => _isTrue(_yetkiModel?.finansMsenEkle);
  bool get borcCekEkle => _isTrue(_yetkiModel?.finansBcekEkle);
  bool get borcSenetEkle => _isTrue(_yetkiModel?.finansBsenEkle);

  bool get musteriCekHareketler => _isTrue(_yetkiModel?.finansMcekHareketler);
  bool get musteriSenetHareketler => _isTrue(_yetkiModel?.finansMsenHareketler);
  bool get borcCekHareketler => _isTrue(_yetkiModel?.finansBcekHareketler);
  bool get borcSenetHareketler => _isTrue(_yetkiModel?.finansBsenHareketler);

  //! SEVKİYAT

  bool sevkiyatSatisFatAciklamaAlanlari(int? index) => _isTrue(!_isTrue(_yetkiModel?.sevkiyatSatisFatAciklamaAlanlari?.contains(index) ?? false));
  bool sevkiyatIrsAciklamaAlanlari(int? index) => _isTrue(!_isTrue(_yetkiModel?.sevkiyatSatisIrsaliyesiAciklamaAlanlari?.contains(index) ?? false));
  bool sevkiyatSatisFatGizlenecekAlanlar(String? index) => _isTrue(!_isTrue(_yetkiModel?.sevkiyatSatisFatGizlenecekAlanlar?.contains(index) ?? false));
  bool sevkiyatIrsDegistirilmeyecekAlanlar(String? index) => _isTrue(!_isTrue(_yetkiModel?.sevkiyatSatisFatDegismeyecekAlanlar?.contains(index) ?? false));

  bool get satisFatEkle => _isTrue(_yetkiModel?.sevkiyatSatisFatKaydet);
  bool get satisFatDuzenle => _isTrue(_yetkiModel?.sevkiyatSatisFatDuzelt);
  bool get satisFatSil => _isTrue(_yetkiModel?.sevkiyatSatisFatSil);

  bool get satisIrsEkle => _isTrue(_yetkiModel?.sevkiyatSatisIrsaliyesiKayit);
  bool get satisIrsDuzenle => _isTrue(_yetkiModel?.sevkiyatSatisIrsaliyesiDuzeltme);
  bool get satisIrsSil => _isTrue(_yetkiModel?.sevkiyatSatisIrsaliyesiSilme);

  bool get satisFatDigerSekmesiGelsin => _isTrue(_yetkiModel?.sevkiyatSatisFatDigerSekmesiGoster);
  bool get satisIrsDigerSekmesiGelsin => _isTrue(_yetkiModel?.sevkiyatSatisIrsDigerSekmesiGoster);

  //! MAL KABUL

  bool malKabulAlisFatAciklamaAlanlari(int? index) => _isTrue(!_isTrue(_yetkiModel?.malKabulAlisFatAciklamaAlanlari?.contains(index) ?? false));
  bool malKabulAlisIrsAciklamaAlanlari(int? index) => _isTrue(!_isTrue(_yetkiModel?.malKabulAlisIrsAciklamaAlanlari?.contains(index) ?? false));
  // bool malKabulAlisFatGizlenecekAlanlar(String? index) => _isTrue(!_isTrue(_yetkiModel?.malKabulAlisFatGizlenecekAlanlar?.contains(index) ?? false));
  // bool malKabulAlisFatDegistirilmeyecekAlanlar(String? index) => _isTrue(!_isTrue(_yetkiModel?.malKabulAlisFatDegismeyecekAlanlar?.contains(index) ?? false));
  bool malKabulAlisIrsGizlenecekAlanlar(String? index) => _isTrue(!_isTrue(_yetkiModel?.malKabulAlisIrsGizlenecekAlanlar?.contains(index) ?? false));
  // bool malKabulAlisIrsDegistirilmeyecekAlanlar(String? index) => _isTrue(!_isTrue(_yetkiModel?.degismey?.contains(index) ?? false));

  bool get alisFatEkle => _isTrue(_yetkiModel?.malKabulAlisFaturasiKaydet);
  bool get alisFatDuzenle => _isTrue(_yetkiModel?.malKabulAlisFaturasiDuzelt);
  bool get alisFatSil => _isTrue(_yetkiModel?.malKabulAlisFaturasiSil);

  bool get alisIrsEkle => _isTrue(_yetkiModel?.malKabulSatinAlmaKaydet);
  bool get alisIrsDuzenle => _isTrue(_yetkiModel?.malKabulSatinAlmaDuzelt);
  bool get alisIrsSil => _isTrue(_yetkiModel?.malKabulSatinAlmaSil);

  bool get alisFatDigerSekmesiGelsin => _isTrue(_yetkiModel?.malKabulAlisFatDigerSekmesiGoster);
  bool get alisIrsDigerSekmesiGelsin => _isTrue(_yetkiModel?.malKabulAlisFatDigerSekmesiGoster);
  // bool get satisFatEkle => _isTrue(_yetkiModel?.ekle);

  //! E-FATURA
  bool get ebelgeEFatura => _isTrue((_yetkiModel?.ebelgeEFat ?? false) && (_paramModel?.eFaturaAktif ?? false));
  bool get ebelgeEFaturaGelenKutusu => _isTrue(_yetkiModel?.ebelgeEFatGelenKutusu);
  bool get ebelgeEFaturaGidenKutusu => _isTrue(_yetkiModel?.ebelgeEFatSorgula);
  bool get ebelgeEFaturaGonder => _isTrue(_yetkiModel?.ebelgeEFatGonder);
  bool get ebelgeEFaturaSorgula => _isTrue(_yetkiModel?.ebelgeEFatSorgula);
  bool get ebelgeEFaturaGoruntule => _isTrue(_yetkiModel?.ebelgeEFatGoruntule);
  bool get ebelgeEFaturaTaslakSil => _isTrue(_yetkiModel?.ebelgeEFatTaslakSil);
  bool get eFaturaAktif => _isTrue(_paramModel?.eFaturaAktif ?? false);
  bool eFaturaSerisindenMi(String belgeNo)=> _isTrue(belgeNo.contains(_paramModel?.seriEFatura??""));

  bool get ebelgeEIrsaliye => _isTrue((_yetkiModel?.ebelgeEIrsaliye ?? false) && (_paramModel?.eIrsaliyeAktif ?? false));
  bool get ebelgeEIrsaliyeGelenKutusu => _isTrue(_yetkiModel?.ebelgeEIrsaliyeGelenKutusu);
  bool get ebelgeEIrsaliyeGidenKutusu => _isTrue(_yetkiModel?.ebelgeEIrsaliyeGidenKutusu);
  bool get ebelgeEIrsaliyeGonder => _isTrue(_yetkiModel?.ebelgeEIrsaliyeGonder);
  // bool get ebelgeEIrsaliyeSorgula => _isTrue(_yetkiModel?.ebelgeEIrsaliyeSorgula);
  bool get ebelgeEIrsaliyeGoruntule => _isTrue(_yetkiModel?.ebelgeEIrsaliyeGoruntule);
  bool get ebelgeEIrsaliyeTaslakSil => _isTrue(_yetkiModel?.ebelgeEIrsaliyeTaslakSil);
  bool get eIrsaliyeAktif => _isTrue(_paramModel?.eIrsaliyeAktif ?? false);
  bool eIrsaliyeSerisindenMi(String belgeNo)=> _isTrue(belgeNo.contains(_paramModel?.seriEIrsaliye??""));

  bool get ebelgeEArsiv => _isTrue((_yetkiModel?.ebelgeEArsiv ?? false) && (_paramModel?.eIrsaliyeAktif ?? false));
  // bool get ebelgeEArsivGelenKutusu => _isTrue(_yetkiModel?.ebelgeEArsivGelenKutusu);
  bool get ebelgeEArsivGidenKutusu => _isTrue((_paramModel?.eIrsaliyeAktif ?? false) && (_yetkiModel?.ebelgeEArsivSorgula ?? false));
  bool get ebelgeEArsivGonder => _isTrue(_yetkiModel?.ebelgeEArsivGonder);
  bool get ebelgeEArsivSorgula => _isTrue(_yetkiModel?.ebelgeEArsivSorgula);
  bool get ebelgeEArsivGoruntule => _isTrue(_yetkiModel?.ebelgeEArsivGoruntule);
  bool get ebelgeEArsivTaslakSil => _isTrue(_yetkiModel?.ebelgeEArsivTaslakSil);
  bool get eArsivAktif => _isTrue(_paramModel?.eArsivAktif ?? false);
  bool eArsivSerisindenMi(String belgeNo)=> _isTrue(belgeNo.contains(_paramModel?.seriEArsiv??""));

  //! TALEP TEKLİF
  String? talepTeklifEkAciklamaAdi(bool satisMi) => satisMi ? _paramModel?.satisEkMaliyet2Adi : _paramModel?.alisEkMaliyet2Adi;
  int  talTekSatirKademeliIskontoSayisi(String? belgeTuru) => int.tryParse(_paramModel?.talTekParam?.firstWhereOrNull((element) => element.belgeTipi == belgeTuru)?.satirIskontoSayisi??"")?? 0;
  

  bool get satisTeklifiSil => _isTrue(_yetkiModel?.taltekStekSil);
  bool get alisTalebiSil => _isTrue(_yetkiModel?.taltekAtalSil);
  bool get satisTalebiSil => _isTrue(_yetkiModel?.taltekStalSil);

  bool get satisTeklifiYazdir => _isTrue(_yetkiModel?.yazdirmaSatisTeklifi);
  bool get alisTalebiYazdir => _isTrue(_yetkiModel?.yazdirmaAtal);
  bool get satisTalebiYazdir => _isTrue(_yetkiModel?.yazdirmaSatisTalebi);

  bool get satisTeklifiDuzenle => _isTrue(_yetkiModel?.taltekStekDuzelt);
  bool get alisTalebiDuzenle => _isTrue(_yetkiModel?.taltekAtalDuzelt);
  bool get satisTalebiDuzenle => _isTrue(_yetkiModel?.taltekStalDuzelt);

  bool get satisTeklifiEkle => _isTrue(_yetkiModel?.taltekStekKaydet);
  bool get alisTalebiEkle => _isTrue(_yetkiModel?.taltekAtalKaydet);
  bool get satisTalebiEkle => _isTrue(_yetkiModel?.taltekStalKaydet);

  bool talepTeklifAciklamaAlanlari(int? index) => _isTrue(!_isTrue(_yetkiModel?.taltekStekAciklamaAlanlari?.contains(index) ?? false));

  bool taltekOnayIslemleri(String? belgeTuru) {
    if (belgeTuru == "STEK") {
      return stekOnayIslemleri;
    } else if (belgeTuru == "STAL") {
      return stalOnayIslemleri;
    } else if (belgeTuru == "ATAL") {
      return atalOnayIslemleri;
    }
    return false;
  }

  // bool get stekDigersSekmesiGelsin => _isTrue(_yetkiModel?.diger);


  bool get stekOnayIslemleri => _isTrue(_yetkiModel?.taltekStekOnayIslemleri ?? false);
  bool get stalOnayIslemleri => _isTrue(_yetkiModel?.taltekStalOnayIslemleri ?? false);
  bool get atalOnayIslemleri => _isTrue(_yetkiModel?.taltekAtalOnayIslemleri ?? false);

  // bool get satisTeklifiDigerSekmesiGelsin => _isTrue(_yetkiModel);
}
