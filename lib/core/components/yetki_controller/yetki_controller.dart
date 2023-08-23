import "package:picker/core/constants/static_variables/static_variables.dart";

import "../../../view/main_page/model/main_page_model.dart";
import "../../../view/main_page/model/param_model.dart";
import "../../../view/main_page/model/user_model/profil_yetki_model.dart";
import "../../../view/main_page/model/user_model/user_model.dart";
import "../../init/cache/cache_manager.dart";

class YetkiController {
  YetkiController();
  static MainPageModel? get anaVeri => CacheManager.getAnaVeri();

  UserModel? get userModel => anaVeri?.userModel;
  ParamModel? get paramModel => anaVeri?.paramModel;

  ProfilYetkiModel? yetkiModel = anaVeri?.userModel?.profilYetki;

  /// Verilen değer null ise false döndürür
  ///
  /// Eğer Admin ise true döndürür
  ///
  /// Bunu yapma sebebim null gelen verilerin admin sebepli mi yoksa yetki sebepli mi olduğunu anlamak
  ///
  /// ! EĞER ParamModel'den geliyorsa skipAdmin: true yapılmalı, YetkiModel'den geliyorsa skipAdmin: false kalmalı
  bool isTrue(bool? value, {bool skipAdmin = false}) {
    return (value ?? false) || (skipAdmin ? false : (userModel?.adminMi ?? false));
  }

  //! GENEL
  bool get projeUygulamasiAcikMi => isTrue(paramModel?.projeUygulamasiAcik, skipAdmin: true);
  bool get plasiyerUygulamasiAcikMi => isTrue(paramModel?.plasiyerUygulamasi, skipAdmin: true);

  //! CARİ

  bool get cariListesi => isTrue(yetkiModel?.cariCariListesi);
  bool get cariListesiRiskGorebilir => isTrue(yetkiModel?.cariCariListesiRiskGorebilir);

  //* Cari Kartı
  bool get cariKarti => isTrue(yetkiModel?.cariCariKarti);
  bool get cariKartiYeniKayit => isTrue(yetkiModel?.cariCariKartiKaydet);
  bool get cariKartiDuzenleme => isTrue(yetkiModel?.cariCariKartiDuzelt);
  bool get cariKartiSilme => isTrue(yetkiModel?.cariCariKartiSil);

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
  bool get _musteriSiparisiMi => StaticVariables.instance.isMusteriSiparisleri;
  bool get siparisDuzelt => _musteriSiparisiMi ? siparisMSDuzelt : siparisSSDuzelt;
  bool get siparisSil => _musteriSiparisiMi ? siparisMSSil : siparisSSSil;
  bool get siparisKapalilarListelenmesin => _musteriSiparisiMi ? siparisMSKapalilarListelenmesin : siparisSSKapalilarListelenmesin;
  bool get siparisBirim1denKaydet => _musteriSiparisiMi ? siparisMSBirim1denKaydet : siparisSSBirim1denKaydet;
  bool get siparisDigerSekmesiGoster => _musteriSiparisiMi ? siparisMSDigerSekmesiGoster : siparisSSDigerSekmesiGoster;
  bool get siparisKosulAktifMi => _musteriSiparisiMi ? siparisMSKosulAktifMi : siparisSSKosulAktifMi;
  bool get siparisKosulSatirdaSor => _musteriSiparisiMi ? (siparisMSKosulAktifMi && siparisMSKosulSatirdaSor) : (siparisSSKosulAktifMi);
  bool get siparisFarkliTeslimCariAktif => _musteriSiparisiMi ? siparisMSFarkliTeslimCariAktif : siparisSSFarkliTeslimCariAktif;

  //* Müşteri Siparişi
  //😳SatisSatirKademeliIskontoSayisi => 0 ise kademeli iskonto yok demektir. Kaç tane varsa o kadar genisk ve geniskTipi gelecek
  bool get satisOzelKod1AktifMi => isTrue(paramModel?.satisOzelKod1Aktif, skipAdmin: true);
  bool get satisOzelKod2AktifMi => isTrue(paramModel?.satisOzelKod2Aktif, skipAdmin: true);
  bool get siparisMSDuzelt => isTrue(yetkiModel?.siparisMusteriSiparisiDuzelt);
  bool get siparisMSSil => isTrue(yetkiModel?.siparisMusteriSiparisiSil);
  bool get siparisMSCariKoduDegistir => isTrue(yetkiModel?.siparisMusSipCariKoduDegistir);
  bool get siparisMSOtoPdfGor => isTrue(yetkiModel?.siparisMusSipOtoPdfGor);
  bool get siparisMSKapalilarListelenmesin => isTrue(yetkiModel?.siparisMusteriSiparisiKapalilarListelenmesin);
  bool get siparisMSBirim1denKaydet => isTrue(yetkiModel?.siparisMusSipBirim1denKaydet);
  bool get siparisMSKapatmaIslemi => isTrue(yetkiModel?.siparisMusteriSiparisiKapatmaIslemi);
  bool get siparisMSOnayIslemleri => isTrue(yetkiModel?.siparisMusSipOnayIslemleri);
  bool get siparisMSSonFiyatGoster => isTrue(yetkiModel?.siparisMusteriSiparisiSonFiyatGoster);
  bool get siparisMSDigerSekmesiGoster => isTrue(yetkiModel?.siparisMusSipDigerSekmesiGoster);
  bool get siparisMSKosulAktifMi => isTrue(paramModel?.satisKosulAktif, skipAdmin: true);
  bool get siparisMSKosulSatirdaSor => isTrue(paramModel?.satisKosulSatirdaSor, skipAdmin: true);
  bool get siparisMSFarkliTeslimCariAktif => isTrue(paramModel?.satisFarkliTeslimCariAktif, skipAdmin: true);
  bool get siparisMSMiktar2Sor => isTrue(paramModel?.satisMiktar2Sor, skipAdmin: true);

  // bool get siparisMSbelgeKopyala => isTrue(yetkiModel?.siparisMusSipBelge);
  ///? Eğer içeriyorsa boş geçilecek
  bool siparisMSBosGecilecekAlanMi(String alan) => isTrue(yetkiModel?.siparisMusSipBosGecilmeyecekAlanlar?.contains(alan), skipAdmin: true);

  ///? Eğer içeriyorsa gizlenecek
  bool siparisMSGizlenecekAlanMi(String alan) => isTrue(yetkiModel?.siparisMusteriSiparisiGizlenecekAlanlar?.contains(alan), skipAdmin: true);

  ///? Eğer içeriyorsa değiştirilemeyecek
  bool siparisMSDegismeyecekAlanMi(String alan) => isTrue(yetkiModel?.siparisMusteriSiparisiDegismeyecekAlanlar?.contains(alan), skipAdmin: true);

  ///? Eğer içeriyorsa gösterilecek (Sipariş için)
  bool siparisMSAciklamaAlanlari(int index) => isTrue((yetkiModel?.siparisMusteriSiparisiAciklamaAlanlari?.contains(index) ?? false) && (paramModel?.satisEkAciklamalarAktif ?? false));

  ///? Eğer içeriyorsa gösterilecek (Kalemler İçin)
  bool siparisMSSatirAciklamaAlanlari(int index) =>
      isTrue((yetkiModel?.siparisMusteriSiparisiSatirAciklamaAlanlari?.contains(index) ?? false) && (paramModel?.satisSatirdaAciklamalarAktif ?? false), skipAdmin: true);

  //* Satıcı Siparişi
  bool get siparisSSDuzelt => isTrue(yetkiModel?.siparisSaticiSiparisiDuzelt);
  bool get siparisSSSil => isTrue(yetkiModel?.siparisSaticiSiparisiSil);
  bool get siparisSSKapalilarListelenmesin => isTrue(yetkiModel?.siparisSaticiSiparisiKapalilarListelenmesin);
  bool get siparisSSBirim1denKaydet => isTrue(yetkiModel?.siparisSaticiSipBirim1denKaydet);
  bool get siparisSSDigerSekmesiGoster => isTrue(yetkiModel?.siparisSaticiSipDigerSekmesiGoster);
  bool get siparisSSKosulAktifMi => isTrue(paramModel?.alisKosulAktif, skipAdmin: true);
  bool get siparisSSFarkliTeslimCariAktif => isTrue(paramModel?.alisFarkliTeslimCariAktif, skipAdmin: true);
  bool get siparisSSmiktar2Sor => isTrue(paramModel?.alisMiktar2Sor, skipAdmin: true);
}
