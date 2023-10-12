class ApiUrls {
  static const String token = "token";
  static const String logoutUser = "User/LogoutUser";
  static const String veriTabanlari = "General/GetVeritabanlari";
  static const String isletmelerSubeler = "General/GetIsletmelerSubeler";
  static const String createSession = "General/CreateSessionV3";
  static const String getMuhaRefList = "General/GetMuhaRefList";
  static const String getUyeBilgileri = "https://storews.netfect.com/api/Picker/GetUyeBilgileri";
  static const String saveUyeBilgileri = "https://storews.netfect.com/api/Picker/SaveUyeBilgileri";
  // static const String getUyeBilgileri = "http://192.168.3.54/netstore/api/Picker/GetUyeBilgileri";
  // static const String saveUyeBilgileri = "http://192.168.3.54/netstore/api/Picker/SaveUyeBilgileri";
  static const String getProjeler = "General/GetProjeler";
  static const String print = "Print/Print";
  static const String getDizaynParametreleri = "Print/GetDizaynParametreleri";
  static const String getSiradakiBelgeNo = "General/GetSiradakiBelgeNo";
  static const String getKullaniciAyarlari = "General/GetKullaniciAyarlari";
  static const String getGrupKodlari = "General/GetGrupKodlari";
  static const String getUlkeler = "General/GetUlkeler";
  static const String getSiradakiKod = "General/GetSiradakiKod";
  static const String getKosullar = "General/GetKosullar";
  static const String getDovizKurlari = "General/GetDovizKurlari";
  static const String deleteDovizKuru = "General/DeleteDovizKuru";
  static const String saveDovizKuru = "General/SaveDovizKuru";
  static const String dovizKuruGuncelle = "General/DovizKuruGuncelle";
  //*Cariler
  static const String getCariler = "Cari/GetCariler";
  static const String getCariKayitliSehirler = "Cari/GetCariKayitliSehirler";
  static const String getAktiviteler = "Cari/GetAktiviteler";
  static const String getCariHareketleri = "Cari/GetCariHareketleri";
  static const String saveCariHareket = "Cari/SaveCariHareket";
  static const String saveCari = "Cari/SaveCari";
  static const String getCariDetay = "Cari/GetCariDetay";
  static const String deleteCari = "Cari/DeleteCari";
  static const String kodDegistir = "Cari/KodDegistir";
  //*Stoklar
  static const String getStoklar = "Stok/GetStoklar";
  static const String getStokDetay = "Stok/GetStokDetay";
  static const String deleteStok = "Stok/DeleteStok";
  static const String getStokMuhasebeKodlari = "Stok/GetStokMuhasebeKodlari";
  static const String getOlcuBirimleri = "Stok/GetOlcuBirimleri";
  static const String barkodUret = "Stok/BarkodUret";
  static const String saveStok = "Stok/SaveStok";
  static const String getStokDigerBilgi = "Stok/GetStokDigerBilgi";
  static const String getStokHareketleri = "Stok/GetStokHareketleri";
  static const String saveStokHareket = "Stok/SaveStokHareket";
  static const String deleteStokHareket = "Stok/DeleteStokHareket";
  static const String getUrunGrubunaGoreSatisGrafigi = "Stok/GetUrunGrubunaGoreSatisGrafigi";
  static const String getFiyatGorFiyatlari = "Stok/GetFiyatGorFiyatlari";
  static const String getStokFiyatGecmisi = "Stok/GetStokFiyatGecmisi";
  static const String savestokFiyatGecmisi = "Stok/SaveStokFiyatGecmisi";
  static const String getStokFiyatOzeti = "Stok/GetStokFiyatOzeti";
  static const String getYapilandirmaProfili = "Stok/GetYapilandirmaProfili";
  static const String getYapilandirmaListesi = "Stok/GetYapilandirmaListesi";

  //* Finans
  static const String deleteBankaHareket = "Banka/DeleteBankaHar";
  static const String getBankaHareketleri = "Banka/GetBankaHareketleri";
  static const String getBankaHesaplari = "Banka/GetBankaHesaplari";
  static const String getKasalar = "Finans/GetKasalar";
  static const String getKasaHareketleri = "Finans/GetKasaHareketleri";
  static const String deleteKasaHareket = "Finans/DeleteKasaHareket";
  static const String saveTahsilat = "Finans/SaveTahsilat";
  static const String getDekontSeriler = "Finans/GetDekontSeriler";
  static const String getBankaSozlesmeleri = "Finans/GetBankaSozlesmeleri";
  static const String getMuhasebeMuhasebeKodlari = "Muhasebe/GetMuhasebeKodlari";

  //*Fatura
  static const String belgeDurumunuDegistir = "Fatura/BelgeDurumunuDegistir";
  static const String getFaturaKalemleri = "Fatura/GetFaturaKalemleri";
  static const String getFaturalar = "Fatura/GetFaturalar";
  static const String getFaturaDetay = "Fatura/GetFaturaDetay";
  static const String saveFatura = "Fatura/SaveFatura";
  static const String deleteFatura = "Fatura/DeleteFatura";

  //*Temsilci
  static const String getPlasiyerOzetRaporu = "Finans/GetPlasiyerOzetRaporu";
}
