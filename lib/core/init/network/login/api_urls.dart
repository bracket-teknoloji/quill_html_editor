class ApiUrls {
  static const String createSession = "General/CreateSessionV3";
  static const String deleteDovizKuru = "General/DeleteDovizKuru";
  static const String dovizKuruGuncelle = "General/DovizKuruGuncelle";
  static const String getDizaynParametreleri = "Print/GetDizaynParametreleri";
  static const String getDovizKurlari = "General/GetDovizKurlari";
  static const String getEvraklar = "General/GetEvraklar";
  static const String getGrupKodlari = "General/GetGrupKodlari";
  static const String getKosullar = "General/GetKosullar";
  static const String getKullaniciAyarlari = "General/GetKullaniciAyarlari";
  static const String getMuhaRefList = "General/GetMuhaRefList";
  static const String getProjeler = "General/GetProjeler";
  static const String getSiradakiBelgeNo = "General/GetSiradakiBelgeNo";
  static const String getSiradakiKod = "General/GetSiradakiKod";
  static const String getUlkeler = "General/GetUlkeler";
  static const String getUyeBilgileri = "https://storews.netfect.com/api/Picker/GetUyeBilgileri";
  static const String isletmelerSubeler = "General/GetIsletmelerSubeler";
  static const String logoutUser = "User/LogoutUser";
  static const String print = "Print/Print";
  static const String getDizaynlar = "Print/GetDizaynlar";
  static const String saveDovizKuru = "General/SaveDovizKuru";
  static const String saveEvrak = "General/SaveEvrak";
  static const String saveUyeBilgileri = "https://storews.netfect.com/api/Picker/SaveUyeBilgileri";
  static const String surumYenilikleri = "https://storews.netfect.com/api/Picker/GetSurumYenilikleri";
  static const String token = "token";
  static const String veriTabanlari = "General/GetVeritabanlari";

  //*Cariler
  static const String deleteCari = "Cari/DeleteCari";
  static const String deleteCariHareket = "Cari/DeleteCariHareket";
  static const String getAktiviteler = "Cari/GetAktiviteler";
  static const String getCariDetay = "Cari/GetCariDetay";
  static const String getCariHareketleri = "Cari/GetCariHareketleri";
  static const String getCariKayitliSehirler = "Cari/GetCariKayitliSehirler";
  static const String getCariler = "Cari/GetCariler";
  static const String kodDegistir = "Cari/KodDegistir";
  static const String saveCari = "Cari/SaveCari";
  static const String saveCariHareket = "Cari/SaveCariHareket";
  static const String getCariharitasi = "Cari/GetCariHaritasi";

  //* E-Belge
  static const String eBelgeIslemi = "EBelge/EBelgeIslemi";
  static const String getEFaturalar = "EBelge/GetEFaturalar";

  //*Stoklar
  static const String barkodUret = "Stok/BarkodUret";
  static const String deleteStok = "Stok/DeleteStok";
  static const String deleteStokHareket = "Stok/DeleteStokHareket";
  static const String getFiyatGorFiyatlari = "Stok/GetFiyatGorFiyatlari";
  static const String getOlcuBirimleri = "Stok/GetOlcuBirimleri";
  static const String getStokDetay = "Stok/GetStokDetay";
  static const String getStokDigerBilgi = "Stok/GetStokDigerBilgi";
  static const String getStokFiyatGecmisi = "Stok/GetStokFiyatGecmisi";
  static const String getStokFiyatOzeti = "Stok/GetStokFiyatOzeti";
  static const String getStokHareketleri = "Stok/GetStokHareketleri";
  static const String getStoklar = "Stok/GetStoklar";
  static const String getStokMuhasebeKodlari = "Stok/GetStokMuhasebeKodlari";
  static const String getUrunGrubunaGoreSatisGrafigi = "Stok/GetUrunGrubunaGoreSatisGrafigi";
  static const String getYapilandirmaListesi = "Stok/GetYapilandirmaListesi";
  static const String getYapilandirmaProfili = "Stok/GetYapilandirmaProfili";
  static const String saveStok = "Stok/SaveStok";
  static const String savestokFiyatGecmisi = "Stok/SaveStokFiyatGecmisi";
  static const String saveStokHareket = "Stok/SaveStokHareket";
  static const String getSeriHareketleri = "Stok/GetSeriHareketleri";
  static const String saveSeriHareketi = "Stok/SaveSeriHar";
  static const String deleteSeriHareketi = "Stok/DeleteSeriHar";
  static const String getSeriler = "Stok/GetSeriler";
  static const String seriNoUret = "Stok/SeriNoUret";

  //* Finans
  static const String deleteBankaHareket = "Banka/DeleteBankaHar";
  static const String deleteCekSenet = "Finans/DeleteCekSenet";
  static const String deleteDekont = "Banka/DeleteDekont";
  static const String deleteKasaHareket = "Finans/DeleteKasaHareket";
  static const String getBankaHareketleri = "Banka/GetBankaHareketleri";
  static const String getBankaHesaplari = "Banka/GetBankaHesaplari";
  static const String getBankaSozlesmeleri = "Finans/GetBankaSozlesmeleri";
  static const String getCekSenetler = "Finans/GetCekSenetler";
  static const String getDekontHareketleri = "Finans/GetDekontHareketleri";
  static const String getDekontlar = "Finans/GetDekontlar";
  static const String getDekontSeriler = "Finans/GetDekontSeriler";
  static const String getKasaHareketleri = "Finans/GetKasaHareketleri";
  static const String getKasalar = "Finans/GetKasalar";
  static const String getMuhasebeMuhasebeKodlari = "Muhasebe/GetMuhasebeKodlari";
  static const String getTcmbBankalar = "Finans/GetTCMBBankalar";
  static const String getTcmbSubeler = "Finans/GetTCMBSubeler";
  static const String saveCekSenetler = "Finans/SaveCekSenet";
  static const String saveDekont = "Banka/SaveDekont";
  static const String saveTahsilat = "Finans/SaveTahsilat";
  static const String getGunSonuRaporu = "Finans/GetGunSonuRaporu";
  static const String getAylikTutarlar = "Finans/GetAylikTutarlar";
  static const String getMasrafKodlari = "Finans/GetMasrafKodlari";

  //*Fatura
  static const String belgeDurumunuDegistir = "Fatura/BelgeDurumunuDegistir";
  static const String deleteFatura = "Fatura/DeleteFatura";
  static const String getBelgeBaglantilari = "Fatura/GetBelgeBaglantilari";
  static const String getCekSenetLoglari = "Finans/GetCekSenetLoglari";
  static const String getEFaturaOzelKodlar = "Fatura/GetEFaturaOzelKodlar";
  static const String getEIrsaliyeSablonlari = "Fatura/GetEIrsaliyeSablonlari";
  static const String getFaturaDetay = "Fatura/GetFaturaDetay";
  static const String getFaturaKalemleri = "Fatura/GetFaturaKalemleri";
  static const String getFaturalar = "Fatura/GetFaturalar";
  static const String saveFatura = "Fatura/SaveFatura";
  static const String talepTeklifSiparislestir = "Fatura/TalepTeklifSiparislestir";

  //*Temsilci
  static const String getPlasiyerOzetRaporu = "Finans/GetPlasiyerOzetRaporu";

  //*User
  static const String getOturumlar = "User/GetOturumlar";

  //* Servis
  static const String dbUpdate = "Servis/DBUpdate";
  static const String getServiceInfos = "Servis/GetServiceInfos";
  static const String getNetOpenXStatus = "Servis/GetNetOpenXStatus";
  static const String netOpenXCreateKernel = "Servis/NetOpenXCreateKernel";
  static const String eFaturaDLLKayitla = "Servis/EFaturaDLLKayitla";
  static const String netFectWinServiceRestart = "Servis/NetFectWinServiceRestart";

  //* Üretim
  static const String getIsEmirleri = "Uretim/GetIsEmirleri";
  static const String saveIsEmri = "Uretim/SaveIsEmri";

  //* Sayım
  static const String getSayimlar = "Depo/GetSayimlar";
  static const String saveSayim = "Depo/SaveSayim";
  static const String getSayimKalemleri = "Depo/GetSayimKalemleri";
}
