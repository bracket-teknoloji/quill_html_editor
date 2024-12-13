class ApiUrls {
  static const String createSession = "api/General/CreateSessionV3";
  static const String deleteDovizKuru = "api/General/DeleteDovizKuru";
  static const String dovizKuruGuncelle = "api/General/DovizKuruGuncelle";
  static const String getDizaynParametreleri = "api/Print/GetDizaynParametreleri";
  static const String getDovizKurlari = "api/General/GetDovizKurlari";
  static const String getEvraklar = "api/General/GetEvraklar";
  static const String getGrupKodlari = "api/General/GetGrupKodlari";
  static const String getKosullar = "api/General/GetKosullar";
  static const String getKullaniciAyarlari = "api/General/GetKullaniciAyarlari";
  static const String getMuhaRefList = "api/General/GetMuhaRefList";
  static const String getProjeler = "api/General/GetProjeler";
  static const String getSiradakiBelgeNo = "api/General/GetSiradakiBelgeNo";
  static const String getSiradakiKod = "api/General/GetSiradakiKod";
  static const String getUlkeler = "api/General/GetUlkeler";
  static const String getUyeBilgileri = "https://storews.netfect.com/api/Picker/GetUyeBilgileri";
  static const String isletmelerSubeler = "api/General/GetIsletmelerSubeler";
  static const String logoutUser = "api/User/LogoutUser";
  static const String print = "api/Print/Print";
  static const String getDizaynlar = "api/Print/GetDizaynlar";
  static const String saveDovizKuru = "api/General/SaveDovizKuru";
  static const String saveEvrak = "api/General/SaveEvrak";
  static const String saveUyeBilgileri = "https://storews.netfect.com/api/Picker/SaveUyeBilgileri";
  static const String surumYenilikleri = "https://storews.netfect.com/api/Picker/GetSurumYenilikleri";
  // static const String surumYenilikleri = "http://ofis.bracket.com.tr:7575/NetStore/api/Picker/GetSurumYenilikleri";
  static const String token = "token";
  static const String veriTabanlari = "api/General/GetVeritabanlari";
  static const String getGenelRehber = "api/General/GetGenelRehber";
  static const String getEkAlanlar = "api/General/GetEkAlanlar";

  //* Cariler
  static const String deleteCari = "api/Cari/DeleteCari";
  static const String deleteCariHareket = "api/Cari/DeleteCariHareket";
  static const String getAktiviteler = "api/Cari/GetAktiviteler";
  static const String saveAktivite = "api/Cari/SaveAktivite";
  static const String getCariDetay = "api/Cari/GetCariDetay";
  static const String getCariHareketleri = "api/Cari/GetCariHareketleri";
  static const String getCariKayitliSehirler = "api/Cari/GetCariKayitliSehirler";
  static const String getCariler = "api/Cari/GetCariler";
  static const String kodDegistir = "api/Cari/KodDegistir";
  static const String saveCari = "api/Cari/SaveCari";
  static const String saveCariHareket = "api/Cari/SaveCariHareket";
  static const String getCariharitasi = "api/Cari/GetCariHaritasi";

  //* E-Belge
  static const String eBelgeIslemi = "api/EBelge/EBelgeIslemi";
  static const String getEFaturalar = "api/EBelge/GetEFaturalar";

  //* Stoklar
  static const String barkodUret = "api/Stok/BarkodUret";
  static const String deleteStok = "api/Stok/DeleteStok";
  static const String deleteStokHareket = "api/Stok/DeleteStokHareket";
  static const String getFiyatGorFiyatlari = "api/Stok/GetFiyatGorFiyatlari";
  static const String getOlcuBirimleri = "api/Stok/GetOlcuBirimleri";
  static const String getStokDetay = "api/Stok/GetStokDetay";
  static const String getStokDigerBilgi = "api/Stok/GetStokDigerBilgi";
  static const String getStokFiyatGecmisi = "api/Stok/GetStokFiyatGecmisi";
  static const String getStokFiyatOzeti = "api/Stok/GetStokFiyatOzeti";
  static const String getStokHareketleri = "api/Stok/GetStokHareketleri";
  static const String getStoklar = "api/Stok/GetStoklar";
  static const String getStokMuhasebeKodlari = "api/Stok/GetStokMuhasebeKodlari";
  static const String getUrunGrubunaGoreSatisGrafigi = "api/Stok/GetUrunGrubunaGoreSatisGrafigi";
  static const String getYapilandirmaListesi = "api/Stok/GetYapilandirmaListesi";
  static const String getYapilandirmaProfili = "api/Stok/GetYapilandirmaProfili";
  static const String saveStok = "api/Stok/SaveStok";
  static const String savestokFiyatGecmisi = "api/Stok/SaveStokFiyatGecmisi";
  static const String saveStokHareket = "api/Stok/SaveStokHareket";
  static const String getSeriHareketleri = "api/Stok/GetSeriHareketleri";
  static const String saveSeriHareketi = "api/Stok/SaveSeriHar";
  static const String deleteSeriHareketi = "api/Stok/DeleteSeriHar";
  static const String getSeriler = "api/Stok/GetSeriler";
  static const String seriNoUret = "api/Stok/SeriNoUret";
  static const String getStokDepoDurum = "api/Stok/GetStokDepoDurum";
  static const String getHucreListesi = "api/Stok/GetHucreListesi";
  static const String getPaketler = "api/Stok/GetPaketler";
  static const String getPaketTuru = "api/Stok/GetPaketTuru";
  static const String savePaket = "api/Stok/SavePaket";
  static const String getPaketKalemleri = "api/Stok/GetPaketKalemleri";
  static const String getHucreHareketleri = "api/Stok/GetHucreHar";
  static const String getHucreBakiyeListesi = "api/Stok/GetHucreBakiyeListesi";
  static const String getBarkodlar = "api/Stok/GetBarkodlar";

  //* Finans
  static const String deleteBankaHareket = "api/Banka/DeleteBankaHar";
  static const String deleteCekSenet = "api/Finans/DeleteCekSenet";
  static const String deleteDekont = "api/Banka/DeleteDekont";
  static const String deleteKasaHareket = "api/Finans/DeleteKasaHareket";
  static const String getBankaHareketleri = "api/Banka/GetBankaHareketleri";
  static const String getBankaHesaplari = "api/Banka/GetBankaHesaplari";
  static const String getBankaSozlesmeleri = "api/Finans/GetBankaSozlesmeleri";
  static const String getCekSenetler = "api/Finans/GetCekSenetler";
  static const String getDekontHareketleri = "api/Finans/GetDekontHareketleri";
  static const String getDekontlar = "api/Finans/GetDekontlar";
  static const String getDekontSeriler = "api/Finans/GetDekontSeriler";
  static const String getKasaHareketleri = "api/Finans/GetKasaHareketleri";
  static const String getKasalar = "api/Finans/GetKasalar";
  static const String getMuhasebeMuhasebeKodlari = "api/Muhasebe/GetMuhasebeKodlari";
  static const String getTcmbBankalar = "api/Finans/GetTCMBBankalar";
  static const String getTcmbSubeler = "api/Finans/GetTCMBSubeler";
  static const String saveCekSenetler = "api/Finans/SaveCekSenet";
  static const String saveDekont = "api/Banka/SaveDekont";
  static const String saveTahsilat = "api/Finans/SaveTahsilat";
  static const String getGunSonuRaporu = "api/Finans/GetGunSonuRaporu";
  static const String getAylikTutarlar = "api/Finans/GetAylikTutarlar";
  static const String getMasrafKodlari = "api/Finans/GetMasrafKodlari";
  static const String getHizliTahsilatlar = "api/Finans/GetHizliTahsilatlar";
  static const String deleteHizliTahsilat = "api/Finans/DeleteHizliTahsilat";

  //* Fatura
  static const String belgeDurumunuDegistir = "api/Fatura/BelgeDurumunuDegistir";
  static const String deleteFatura = "api/Fatura/DeleteFatura";
  static const String getBelgeBaglantilari = "api/Fatura/GetBelgeBaglantilari";
  static const String getCekSenetLoglari = "api/Finans/GetCekSenetLoglari";
  static const String getEFaturaOzelKodlar = "api/Fatura/GetEFaturaOzelKodlar";
  static const String getEIrsaliyeSablonlari = "api/Fatura/GetEIrsaliyeSablonlari";
  static const String getFaturaDetay = "api/Fatura/GetFaturaDetay";
  static const String getFaturaKalemleri = "api/Fatura/GetFaturaKalemleri";
  static const String getFaturalar = "api/Fatura/GetFaturalar";
  static const String saveFatura = "api/Fatura/SaveFatura";
  static const String talepTeklifSiparislestir = "api/Fatura/TalepTeklifSiparislestir";
  static const String saveIrsaliyedenFatura = "api/Fatura/SaveIrsaliyedenFatura";

  //* Temsilci
  static const String getPlasiyerOzetRaporu = "api/Finans/GetPlasiyerOzetRaporu";

  //* User
  static const String getOturumlar = "api/User/GetOturumlar";

  //* Servis
  static const String dbUpdate = "api/Servis/DBUpdate";
  static const String getServiceInfos = "api/Servis/GetServiceInfos";
  static const String getNetOpenXStatus = "api/Servis/GetNetOpenXStatus";
  static const String netOpenXCreateKernel = "api/Servis/NetOpenXCreateKernel";
  static const String eFaturaDLLKayitla = "api/Servis/EFaturaDLLKayitla";
  static const String netFectWinServiceRestart = "api/Servis/NetFectWinServiceRestart";

  //* Üretim
  static const String getIsEmirleri = "api/Uretim/GetIsEmirleri";
  static const String getUSKListesi = "api/Uretim/GetUSKListesi";
  static const String getUSKKalemleri = "api/Uretim/GetUSKKalemleri";
  static const String saveUSK = "api/Uretim/SaveUSK";
  static const String getRecete = "api/Uretim/GetRecete";
  static const String deleteUSK = "api/Uretim/DeleteUSK";
  static const String getIsemriHammaddeTakipDetay = "api/Uretim/GetIsemriHammaddeTakipDetay";
  static const String getIsemriHammaddeTakipListe = "api/Uretim/GetIsemriHammaddeTakipListe";
  static const String isemriHammaddeTakipIslem = "api/Uretim/IsemriHammaddeTakipIslem";
  static const String saveIsEmri = "api/Uretim/SaveIsEmri";

  //* Sayım
  static const String getSayimlar = "api/Depo/GetSayimlar";
  static const String saveSayim = "api/Depo/SaveSayim";
  static const String getSayimKalemleri = "api/Depo/GetSayimKalemleri";
  static const String saveHucreTakibi = "api/Depo/SaveHucreTakibi";
  static const String getHucredekiStoklar = "api/Depo/GetHucredekiStoklar";
  static const String getHucreTakibiStoklar = "api/Depo/GetHucreTakibiStoklar";
  static const String getHucreTakibiBelgeler = "api/Depo/GetHucreTakibiBelgeler";
  static const String deleteSayimKalem = "api/Depo/DeleteSayimKalem";

  //* Sigma Kalite-Kontrol
  static const String getOlcumBelgeler = "api/Sigma/GetOlcumBelgeler";
  static const String getOlcum = "api/Sigma/GetOlcum";
  static const String getOlcumler = "api/Sigma/GetOlcumler";
  static const String olcumSil = "api/Sigma/OlcumSil";
  static const String getOlcumBelgeDetaylar = "api/Sigma/GetOlcumBelgeDetaylar";
  static const String getOlcumBelgeStok = "api/Sigma/GetOlcumBelgeStok";
  static const String getOlcumPersonel = "api/Sigma/GetOlcumPersonel";
  static const String olcumEkle = "api/Sigma/OlcumEkle";
  static const String operatorEkle = "api/Sigma/OperatorEkle";
  static const String sartliKabulEkle = "api/Sigma/SartlıKabulEkle";
  static const String getSartliKabuller = "api/Sigma/GetSartliKabuller";
  static const String getProsesler = "api/Sigma/GetProsesler";
  static const String getProsesBildirim = "api/Sigma/GetProsesBildirim";
  static const String getBelgeler = "api/Sigma/GetBelgeler";
  static const String getBelge = "api/Sigma/GetBelge";
  static const String getDatListesi = "api/Sigma/GetDatListesi";
  static const String getDatMiktar = "api/Sigma/GetDatMiktar";
}
