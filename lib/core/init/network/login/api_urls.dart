abstract final class ApiUrls {
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
  static const String saveKonum = "User/SaveKonum";
  static const String print = "Print/Print";
  static const String getDizaynlar = "Print/GetDizaynlar";
  static const String saveDovizKuru = "General/SaveDovizKuru";
  static const String saveEvrak = "General/SaveEvrak";
  static const String saveUyeBilgileri = "https://storews.netfect.com/api/Picker/SaveUyeBilgileri";
  static const String surumYenilikleri = "https://storews.netfect.com/api/Picker/GetSurumYenilikleri";
  static const String teklifIste = "https://storews.netfect.com/api/Picker/PickerTeklifIste";
  static const String createPayment = "https://odeme.bracket.com.tr/api/Payments/CreatePayment";
  static const String getBankInstallments = "https://odeme.bracket.com.tr/api/payments/getbankinstallments";
  // static const String surumYenilikleri = "http://ofis.bracket.com.tr:7575/NetStore/api/Picker/GetSurumYenilikleri";
  static const String token = "token";
  static const String veriTabanlari = "General/GetVeritabanlari";
  static const String getGenelRehber = "General/GetGenelRehber";
  static const String getEkAlanlar = "General/GetEkAlanlar";

  //* Cariler
  static const String deleteCari = "Cari/DeleteCari";
  static const String deleteCariHareket = "Cari/DeleteCariHareket";
  static const String getAktiviteler = "Cari/GetAktiviteler";
  static const String saveAktivite = "Cari/SaveAktivite";
  static const String getCariDetay = "Cari/GetCariDetay";
  static const String getCariHareketleri = "Cari/GetCariHareketleri";
  static const String getCariKayitliSehirler = "Cari/GetCariKayitliSehirler";
  static const String getCariler = "Cari/GetCariler";
  static const String kodDegistir = "Cari/KodDegistir";
  static const String saveCari = "Cari/SaveCari";
  static const String saveCariHareket = "Cari/SaveCariHareket";
  static const String getCariharitasi = "Cari/GetCariHaritasi";
  static const String saveOzelHesapKapatma = "Cari/SaveOzelHesapKapatma";

  //* E-Belge
  static const String eBelgeIslemi = "EBelge/EBelgeIslemi";
  static const String getEFaturalar = "EBelge/GetEFaturalar";

  //* Stoklar
  static const String barkodUret = "Stok/BarkodUret";
  static const String deleteStok = "Stok/DeleteStok";
  static const String getStokFiyatiTumSira = "Stok/GetStokFiyatiTumSira";
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
  static const String getStokDepoDurum = "Stok/GetStokDepoDurum";
  static const String getHucreListesi = "Stok/GetHucreListesi";
  static const String getPaketler = "Stok/GetPaketler";
  static const String getPaketTuru = "Stok/GetPaketTuru";
  static const String savePaket = "Stok/SavePaket";
  static const String getPaketKalemleri = "Stok/GetPaketKalemleri";
  static const String getHucreHareketleri = "Stok/GetHucreHar";
  static const String getHucreBakiyeListesi = "Stok/GetHucreBakiyeListesi";
  static const String getBarkodlar = "Stok/GetBarkodlar";

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
  static const String getHizliTahsilatlar = "Finans/GetHizliTahsilatlar";
  static const String deleteHizliTahsilat = "Finans/DeleteHizliTahsilat";

  //* Fatura
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
  static const String saveIrsaliyedenFatura = "Fatura/SaveIrsaliyedenFatura";
  static const String getBelgekontrolBelgeleri = "Fatura/GetBelgekontrolBelgeleri";
  static const String getBelgekontrolKalemleri = "Fatura/GetBelgekontrolKalemleri";
  static const String saveBelgeKontrol = "Fatura/SaveBelgeKontrol";

  //* Temsilci
  static const String getPlasiyerOzetRaporu = "Finans/GetPlasiyerOzetRaporu";

  //* User
  static const String getOturumlar = "User/GetOturumlar";
  static const String getKullaniciHaritasi = "User/GetKullaniciHaritasi";

  //* Servis
  static const String dbUpdate = "Servis/DBUpdate";
  static const String getServiceInfos = "Servis/GetServiceInfos";
  static const String getNetOpenXStatus = "Servis/GetNetOpenXStatus";
  static const String netOpenXCreateKernel = "Servis/NetOpenXCreateKernel";
  static const String eFaturaDLLKayitla = "Servis/EFaturaDLLKayitla";
  static const String netFectWinServiceRestart = "Servis/NetFectWinServiceRestart";

  //* Üretim
  static const String getIsEmirleri = "Uretim/GetIsEmirleri";
  static const String getUSKListesi = "Uretim/GetUSKListesi";
  static const String getUSKKalemleri = "Uretim/GetUSKKalemleri";
  static const String saveUSK = "Uretim/SaveUSK";
  static const String getRecete = "Uretim/GetRecete";
  static const String deleteUSK = "Uretim/DeleteUSK";
  static const String getIsemriHammaddeTakipDetay = "Uretim/GetIsemriHammaddeTakipDetay";
  static const String getIsemriHammaddeTakipListe = "Uretim/GetIsemriHammaddeTakipListe";
  static const String isemriHammaddeTakipIslem = "Uretim/IsemriHammaddeTakipIslem";
  static const String saveIsEmri = "Uretim/SaveIsEmri";

  //* Sayım
  static const String getSayimlar = "Depo/GetSayimlar";
  static const String saveSayim = "Depo/SaveSayim";
  static const String getSayimKalemleri = "Depo/GetSayimKalemleri";
  static const String saveHucreTakibi = "Depo/SaveHucreTakibi";
  static const String getHucredekiStoklar = "Depo/GetHucredekiStoklar";
  static const String getHucreTakibiStoklar = "Depo/GetHucreTakibiStoklar";
  static const String getHucreTakibiBelgeler = "Depo/GetHucreTakibiBelgeler";
  static const String deleteSayimKalem = "Depo/DeleteSayimKalem";

  //* Transfer
  static const String getDepoTalepleri = "fatura/GetDepoTalepleri";
  static const String getDepoTalepKalemleri = "fatura/GetDepoTalepKalemleri";
  static const String saveDepoTalep = "fatura/SaveDepoTalep";
  static const String getDepoTalepToplananlar = "fatura/GetDepoTalepToplananlar";

  //* Sigma Kalite-Kontrol
  static const String getOlcumBelgeler = "Sigma/GetOlcumBelgeler";
  static const String getOlcum = "Sigma/GetOlcum";
  static const String getOlcumler = "Sigma/GetOlcumler";
  static const String olcumSil = "Sigma/OlcumSil";
  static const String getOlcumBelgeDetaylar = "Sigma/GetOlcumBelgeDetaylar";
  static const String getOlcumBelgeStok = "Sigma/GetOlcumBelgeStok";
  static const String getOlcumPersonel = "Sigma/GetOlcumPersonel";
  static const String olcumEkle = "Sigma/OlcumEkle";
  static const String operatorEkle = "Sigma/OperatorEkle";
  static const String sartliKabulEkle = "Sigma/SartlıKabulEkle";
  static const String getSartliKabuller = "Sigma/GetSartliKabuller";
  static const String getProsesler = "Sigma/GetProsesler";
  static const String getProsesBildirim = "Sigma/GetProsesBildirim";
  static const String getBelgeler = "Sigma/GetBelgeler";
  static const String getBelge = "Sigma/GetBelge";
  static const String getDatListesi = "Sigma/GetDatListesi";
  static const String getDatMiktar = "Sigma/GetDatMiktar";
}
