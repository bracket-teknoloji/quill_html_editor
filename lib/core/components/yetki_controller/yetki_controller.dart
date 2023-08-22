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

  bool isTrue(bool? value) {
    return (value ?? false) || (userModel?.adminMi ?? false);
  }

  //! GENEL
  bool get projeUygulamasiAcikMi => isTrue(paramModel?.projeUygulamasiAcik);
  bool get plasiyerUygulamasiAcikMi => isTrue(paramModel?.plasiyerUygulamasi);
  bool get satisOzelKod1AktifMi => isTrue(paramModel?.satisOzelKod1Aktif);
  bool get satisOzelKod2AktifMi => isTrue(paramModel?.satisOzelKod2Aktif);

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

  //* Müşteri Siparişi
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


  // bool get siparisMSbelgeKopyala => isTrue(yetkiModel?.siparisMusSipBelge);
  ///? Eğer içeriyorsa boş geçilecek
  bool siparisMSBosGecilecekAlanMi(String alan) => isTrue(yetkiModel?.siparisMusSipBosGecilmeyecekAlanlar?.contains(alan));

  ///? Eğer içeriyorsa gizlenecek
  bool siparisMSGizlenecekAlanMi(String alan) => isTrue(yetkiModel?.siparisMusteriSiparisiGizlenecekAlanlar?.contains(alan));

  ///? Eğer içeriyorsa değiştirilemeyecek
  bool siparisMSDegismeyecekAlanMi(String alan) => isTrue(yetkiModel?.siparisMusteriSiparisiDegismeyecekAlanlar?.contains(alan));

  ///? Eğer içeriyorsa gösterilecek (Sipariş için)
   bool siparisMSAciklamaAlanlari(int index) => isTrue(yetkiModel?.siparisMusteriSiparisiAciklamaAlanlari?.contains(index));

  ///? Eğer içeriyorsa gösterilecek (Kalemler İçin)
  bool siparisMSSatirAciklamaAlanlari(int index) => isTrue(yetkiModel?.siparisMusteriSiparisiSatirAciklamaAlanlari?.contains(index));

  //* Satıcı Siparişi
  bool get siparisSSDuzelt => isTrue(yetkiModel?.siparisSaticiSiparisiDuzelt);
  bool get siparisSSSil => isTrue(yetkiModel?.siparisSaticiSiparisiSil);
  bool get siparisSSKapalilarListelenmesin => isTrue(yetkiModel?.siparisSaticiSiparisiKapalilarListelenmesin);
  bool get siparisSSBirim1denKaydet => isTrue(yetkiModel?.siparisSaticiSipBirim1denKaydet);
  bool get siparisSSDigerSekmesiGoster => isTrue(yetkiModel?.siparisSaticiSipDigerSekmesiGoster);
}
