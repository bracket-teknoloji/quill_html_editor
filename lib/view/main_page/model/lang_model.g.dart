// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lang_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LangModel _$LangModelFromJson(Map<String, dynamic> json) => LangModel()
  ..dilKodu = json['DilKodu'] as String?
  ..dilAciklama = json['DilAciklama'] as String?
  ..menuMalKabul = json['menuMalKabul'] as String?
  ..menuMalKabulSatinAlma = json['menuMalKabulSatinAlma'] as String?
  ..menuMalKabulIade = json['menuMalKabulIade'] as String?
  ..menuTransfer = json['menuTransfer'] as String?
  ..menuTransferDAT = json['menuTransferDAT'] as String?
  ..menuTransferAmbarGirisFisi = json['menuTransferAmbarGirisFisi'] as String?
  ..menuTransferAmbarCikisFisi = json['menuTransferAmbarCikisFisi'] as String?
  ..menuHucreTakibi = json['menuHucreTakibi'] as String?
  ..menuHucreTakibiYerlestir = json['menuHucreTakibiYerlestir'] as String?
  ..menuHucreTakibiBosalt = json['menuHucreTakibiBosalt'] as String?
  ..menuHucreTakibiTransfer = json['menuHucreTakibiTransfer'] as String?
  ..menuHucreTakibiAra = json['menuHucreTakibiAra'] as String?
  ..menuHucreTakibiListe = json['menuHucreTakibiListe'] as String?
  ..menuSevkiyat = json['menuSevkiyat'] as String?
  ..menuSevkiyatSatisIrsaliyesi = json['menuSevkiyatSatisIrsaliyesi'] as String?
  ..menuSevkiyatMalToplama = json['menuSevkiyatMalToplama'] as String?
  ..menuSayim = json['menuSayim'] as String?
  ..menuSayimSayim = json['menuSayimSayim'] as String?
  ..menuSiparis = json['menuSiparis'] as String?
  ..menuMusteriSiparisi = json['menuMusteriSiparisi'] as String?
  ..menuSaticiSiparisi = json['menuSaticiSiparisi'] as String?
  ..menuCari = json['menuCari'] as String?
  ..menuCariListesi = json['menuCariListesi'] as String?
  ..menuStok = json['menuStok'] as String?
  ..menuStokListesi = json['menuStokListesi'] as String?
  ..menuYonetici = json['menuYonetici'] as String?
  ..menuBanka = json['menuBanka'] as String?
  ..menuBankaListesi = json['menuBankaListesi'] as String?
  ..menuTahsilat = json['menuTahsilat'] as String?
  ..menuTahsilatYap = json['menuTahsilatYap'] as String?
  ..menuTahsilatKayitlari = json['menuTahsilatKayitlari'] as String?
  ..menuNakitOdeme = json['menuNakitOdeme'] as String?
  ..menuKKTahsilat = json['menuKKTahsilat'] as String?
  ..menuNakitTahsilat = json['menuNakitTahsilat'] as String?
  ..menuSenetTahsilati = json['menuSenetTahsilati'] as String?
  ..menuCekTahsilati = json['menuCekTahsilati'] as String?
  ..menuAyarlar = json['menuAyarlar'] as String?
  ..menuFirmalar = json['menuFirmalar'] as String?
  ..menuTemsilci = json['menuTemsilci'] as String?
  ..menuProfilim = json['menuProfilim'] as String?
  ..menuAlisFaturasi = json['menuAlisFaturasi'] as String?
  ..menuSatisFaturasi = json['menuSatisFaturasi'] as String?
  ..genelSirketDegistir = json['genelSirketDegistir'] as String?
  ..genelSirketOturumuKapat = json['genelSirketOturumuKapat'] as String?
  ..genelGuncelSurumuIndir = json['genelGuncelSurumuIndir'] as String?
  ..genelLutfenBekleyin = json['genelLutfenBekleyin'] as String?
  ..genelKaydet = json['genelKaydet'] as String?
  ..genelTamam = json['genelTamam'] as String?
  ..genelHayir = json['genelHayir'] as String?
  ..genelEvet = json['genelEvet'] as String?
  ..genelIptal = json['genelIptal'] as String?
  ..genelSil = json['genelSil'] as String?
  ..genelDuzenle = json['genelDuzenle'] as String?
  ..genelSirket = json['genelSirket'] as String?
  ..genelIsletme = json['genelIsletme'] as String?
  ..genelSube = json['genelSube'] as String?
  ..genelFirmaEkle = json['genelFirmaEkle'] as String?
  ..genelKayitAdi = json['genelKayitAdi'] as String?
  ..genelKullaniciAdi = json['genelKullaniciAdi'] as String?
  ..genelSifre = json['genelSifre'] as String?
  ..genelRevizyon = json['genelRevizyon'] as String?
  ..genelTarih = json['genelTarih'] as String?
  ..genelBelgeNo = json['genelBelgeNo'] as String?
  ..genelCari = json['genelCari'] as String?
  ..genelSiparisTipi = json['genelSiparisTipi'] as String?
  ..genelProje = json['genelProje'] as String?
  ..genelPlasiyer = json['genelPlasiyer'] as String?
  ..genelKDVDahil = json['genelKDVDahil'] as String?
  ..genelAciklama = json['genelAciklama'] as String?
  ..genelMiktar = json['genelMiktar'] as String?
  ..genelTutar = json['genelTutar'] as String?
  ..genelBirimFiyat = json['genelBirimFiyat'] as String?
  ..genelKDV = json['genelKDV'] as String?
  ..genelStokKodu = json['genelStokKodu'] as String?
  ..genelBrutTutar = json['genelBrutTutar'] as String?
  ..genelMalFazIsk = json['genelMalFazIsk'] as String?
  ..genelMalFazTutari = json['genelMalFazTutari'] as String?
  ..genelMalFazMiktari = json['genelMalFazMiktari'] as String?
  ..genelSatirIsk = json['genelSatirIsk'] as String?
  ..genelGenelToplam = json['genelGenelToplam'] as String?
  ..genelGenelIskonto = json['genelGenelIskonto'] as String?
  ..genelStokSeviyesi = json['genelStokSeviyesi'] as String?
  ..genelOlcuBirimi = json['genelOlcuBirimi'] as String?
  ..genelDepo = json['genelDepo'] as String?
  ..genelCikisDepo = json['genelCikisDepo'] as String?
  ..genelGirisDepo = json['genelGirisDepo'] as String?
  ..genelDovizTipi = json['genelDovizTipi'] as String?
  ..genelTLFiyati = json['genelTLFiyati'] as String?
  ..genelIskonto = json['genelIskonto'] as String?
  ..genelSeriler = json['genelSeriler'] as String?
  ..genelSeri = json['genelSeri'] as String?
  ..genelHucreler = json['genelHucreler'] as String?
  ..genelBelge = json['genelBelge'] as String?
  ..genelCariKodu = json['genelCariKodu'] as String?
  ..genelCariAdi = json['genelCariAdi'] as String?
  ..genelKalemMiktari = json['genelKalemMiktari'] as String?
  ..genelHucre = json['genelHucre'] as String?
  ..genelBarkod = json['genelBarkod'] as String?
  ..genelKalem = json['genelKalem'] as String?
  ..genelGoruntule = json['genelGoruntule'] as String?
  ..genelSecenekler = json['genelSecenekler'] as String?
  ..genelEkle = json['genelEkle'] as String?
  ..genelYenile = json['genelYenile'] as String?
  ..genelFiltrele = json['genelFiltrele'] as String?
  ..genelSirala = json['genelSirala'] as String?
  ..genelEkAciklamalar = json['genelEkAciklamalar'] as String?
  ..genelIthalat = json['genelIthalat'] as String?
  ..genelYeniBelge = json['genelYeniBelge'] as String?
  ..genelYurtici = json['genelYurtici'] as String?
  ..genelYurtdisi = json['genelYurtdisi'] as String?
  ..genelDevir = json['genelDevir'] as String?
  ..genelDepolar = json['genelDepolar'] as String?
  ..genelUretim = json['genelUretim'] as String?
  ..genelMuhtelif = json['genelMuhtelif'] as String?
  ..genelKonsinye = json['genelKonsinye'] as String?
  ..genelXRehberi = json['genelXRehberi'] as String?
  ..genelAlisIrsaliyesi = json['genelAlisIrsaliyesi'] as String?
  ..genelSatisIrsaliyesi = json['genelSatisIrsaliyesi'] as String?
  ..genelAlisFaturasi = json['genelAlisFaturasi'] as String?
  ..genelSatisFaturasi = json['genelSatisFaturasi'] as String?
  ..genelIade = json['genelIade'] as String?
  ..genelXGiriniz = json['genelXGiriniz'] as String?
  ..genelXSeciniz = json['genelXSeciniz'] as String?
  ..genelXSilinsinMi = json['genelXSilinsinMi'] as String?
  ..genelKayitSilinsinMi = json['genelKayitSilinsinMi'] as String?
  ..genelKaydedilsinMi = json['genelKaydedilsinMi'] as String?
  ..genelEksikBilgiler = json['genelEksikBilgiler'] as String?
  ..genelMiktarGiriniz = json['genelMiktarGiriniz'] as String?
  ..genelDovizSeciniz = json['genelDovizSeciniz'] as String?
  ..genelOlcuBirimiSeciniz = json['genelOlcuBirimiSeciniz'] as String?
  ..genelPlasiyerSeciniz = json['genelPlasiyerSeciniz'] as String?
  ..genelProjeSeciniz = json['genelProjeSeciniz'] as String?
  ..genelCariSeciniz = json['genelCariSeciniz'] as String?
  ..genelTarihSeciniz = json['genelTarihSeciniz'] as String?
  ..genelIthalatTipiSeciniz = json['genelIthalatTipiSeciniz'] as String?
  ..genelGirisDepoSeciniz = json['genelGirisDepoSeciniz'] as String?
  ..genelGirisVeCikisDepolarAyni =
      json['genelGirisVeCikisDepolarAyni'] as String?
  ..genelAciklamaGiriniz = json['genelAciklamaGiriniz'] as String?
  ..genelOzelKod1Seciniz = json['genelOzelKod1Seciniz'] as String?
  ..genelOzelKod2Seciniz = json['genelOzelKod2Seciniz'] as String?
  ..genelStokSeciniz = json['genelStokSeciniz'] as String?
  ..genelHareketTuruSeciniz = json['genelHareketTuruSeciniz'] as String?
  ..genelHucreMiktarlariUyumsuz = json['genelHucreMiktarlariUyumsuz'] as String?
  ..genelSeriMiktarlariUyumsuz = json['genelSeriMiktarlariUyumsuz'] as String?
  ..genelXBulunamadi = json['genelXBulunamadi'] as String?
  ..genelMuhasebeKoduSeciniz = json['genelMuhasebeKoduSeciniz'] as String?
  ..genelFiyatGiriniz = json['genelFiyatGiriniz'] as String?
  ..genelAdet = json['genelAdet'] as String?
  ..genelAramaIcinEnAzXHarfGiriniz =
      json['genelAramaIcinEnAzXHarfGiriniz'] as String?
  ..genelAra = json['genelAra'] as String?
  ..genelDovizKuru = json['genelDovizKuru'] as String?
  ..genelTemizle = json['genelTemizle'] as String?
  ..genelFisNo = json['genelFisNo'] as String?
  ..genelBelgeTuruSeciniz = json['genelBelgeTuruSeciniz'] as String?
  ..genelHucreSeciniz = json['genelHucreSeciniz'] as String?
  ..genelHucreBakiyesi = json['genelHucreBakiyesi'] as String?
  ..genelIslemBasarili = json['genelIslemBasarili'] as String?
  ..genelIslemBasarisiz = json['genelIslemBasarisiz'] as String?
  ..genelDepoSeciniz = json['genelDepoSeciniz'] as String?
  ..genelBelgeSeciniz = json['genelBelgeSeciniz'] as String?
  ..genelBelgeTuru = json['genelBelgeTuru'] as String?
  ..genelBelgeTarihi = json['genelBelgeTarihi'] as String?
  ..genelIslemMiktari = json['genelIslemMiktari'] as String?
  ..genelKaynakHucreSeciniz = json['genelKaynakHucreSeciniz'] as String?
  ..genelHedefHucreSeciniz = json['genelHedefHucreSeciniz'] as String?
  ..genelKaynakVeHedefHucrelerAyni =
      json['genelKaynakVeHedefHucrelerAyni'] as String?
  ..genelYetersizBakiye = json['genelYetersizBakiye'] as String?
  ..genelHedefHucre = json['genelHedefHucre'] as String?
  ..genelKaynakHucre = json['genelKaynakHucre'] as String?
  ..genelStokAdi = json['genelStokAdi'] as String?
  ..genelBakiye = json['genelBakiye'] as String?
  ..genelHareketler = json['genelHareketler'] as String?
  ..genelDetaylar = json['genelDetaylar'] as String?
  ..genelDepoBakiyeDurumu = json['genelDepoBakiyeDurumu'] as String?
  ..genelArti = json['genelArti'] as String?
  ..genelEksi = json['genelEksi'] as String?
  ..genelSifir = json['genelSifir'] as String?
  ..genelGrupKodu = json['genelGrupKodu'] as String?
  ..genelKod = json['genelKod'] as String?
  ..genelXHareketleri = json['genelXHareketleri'] as String?
  ..genelArtan = json['genelArtan'] as String?
  ..genelAzalan = json['genelAzalan'] as String?
  ..genelXDetaylari = json['genelXDetaylari'] as String?
  ..genelFiyat = json['genelFiyat'] as String?
  ..genelAdi = json['genelAdi'] as String?
  ..genelKodu = json['genelKodu'] as String?
  ..genelSeriCikistaAktif = json['genelSeriCikistaAktif'] as String?
  ..genelSeriGiristeAktif = json['genelSeriGiristeAktif'] as String?
  ..genelSeriMiktarKadarSor = json['genelSeriMiktarKadarSor'] as String?
  ..genelSeriBakiyeTakibiVar = json['genelSeriBakiyeTakibiVar'] as String?
  ..genelAlis = json['genelAlis'] as String?
  ..genelSatis = json['genelSatis'] as String?
  ..genelSatisFiyati = json['genelSatisFiyati'] as String?
  ..genelAlisFiyati = json['genelAlisFiyati'] as String?
  ..genelBaslamaTarihi = json['genelBaslamaTarihi'] as String?
  ..genelBitisTarihi = json['genelBitisTarihi'] as String?
  ..genelSayilanlar = json['genelSayilanlar'] as String?
  ..genelMalToplama = json['genelMalToplama'] as String?
  ..genelMalKontrol = json['genelMalKontrol'] as String?
  ..genelKullaniciyaGonder = json['genelKullaniciyaGonder'] as String?
  ..genelDepodaYok = json['genelDepodaYok'] as String?
  ..genelToplananMallar = json['genelToplananMallar'] as String?
  ..genelMalKontroleGonder = json['genelMalKontroleGonder'] as String?
  ..genelTamamlandi = json['genelTamamlandi'] as String?
  ..genelIslemiOnayliyorMusunuz = json['genelIslemiOnayliyorMusunuz'] as String?
  ..genelTamamla = json['genelTamamla'] as String?
  ..genelKullanicilar = json['genelKullanicilar'] as String?
  ..genelCariKoduBos = json['genelCariKoduBos'] as String?
  ..genelHucreIslemTuruBos = json['genelHucreIslemTuruBos'] as String?
  ..genelKullaniciAdiVeyaSifreYanlis =
      json['genelKullaniciAdiVeyaSifreYanlis'] as String?
  ..genelKullaniciKilitliDurumda =
      json['genelKullaniciKilitliDurumda'] as String?
  ..genelStokKoduBos = json['genelStokKoduBos'] as String?
  ..genelBelgeZatenKayitli = json['genelBelgeZatenKayitli'] as String?
  ..genelKayitYapildi = json['genelKayitYapildi'] as String?
  ..genelMusteriSiparisi = json['genelMusteriSiparisi'] as String?
  ..genelSaticiSiparisi = json['genelSaticiSiparisi'] as String?
  ..genelStokKarti = json['genelStokKarti'] as String?
  ..genelYazdir = json['genelYazdir'] as String?
  ..genelNetFiyat = json['genelNetFiyat'] as String?
  ..genelBrutFiyat = json['genelBrutFiyat'] as String?
  ..genelProfilim = json['genelProfilim'] as String?
  ..genelKullaniciBulunamadi = json['genelKullaniciBulunamadi'] as String?
  ..genelKayitBulunamadi = json['genelKayitBulunamadi'] as String?
  ..genelCariEFaturaMukellefidir =
      json['genelCariEFaturaMukellefidir'] as String?
  ..genelCariEArsivMukellefidir = json['genelCariEArsivMukellefidir'] as String?
  ..genelCariIleTeslimCariAyniOlamaz =
      json['genelCariIleTeslimCariAyniOlamaz'] as String?
  ..genelYeniBelgeNo = json['genelYeniBelgeNo'] as String?
  ..genelStokHareketleri = json['genelStokHareketleri'] as String?
  ..genelBelgeKayitliDegisiklikYapilamaz =
      json['genelBelgeKayitliDegisiklikYapilamaz'] as String?
  ..genelBelgeTipi = json['genelBelgeTipi'] as String?
  ..genelBelgeTipiSeciniz = json['genelBelgeTipiSeciniz'] as String?
  ..genelKasa = json['genelKasa'] as String?
  ..genelKasaSeciniz = json['genelKasaSeciniz'] as String?
  ..genel15HaneliBelgeGiriniz = json['genel15HaneliBelgeGiriniz'] as String?
  ..genelBelgeSerisiniKontrolEdin =
      json['genelBelgeSerisiniKontrolEdin'] as String?
  ..genelTopluDepo = json['genelTopluDepo'] as String?
  ..genelXXXSeciniz = json['genelXXXSeciniz'] as String?
  ..genelEFatura = json['genelEFatura'] as String?
  ..genelEArsiv = json['genelEArsiv'] as String?
  ..genelEsnekYapilandirma = json['genelEsnekYapilandirma'] as String?
  ..genelYapilandirmaKodu = json['genelYapilandirmaKodu'] as String?
  ..genelIslemler = json['genelIslemler'] as String?
  ..genelBankaIslemleri = json['genelBankaIslemleri'] as String?
  ..genelGelen = json['genelGelen'] as String?
  ..genelGonderilen = json['genelGonderilen'] as String?
  ..genelBaslama = json['genelBaslama'] as String?
  ..genelBitis = json['genelBitis'] as String?
  ..genelCariEFTKaydi = json['genelCariEFTKaydi'] as String?
  ..bankayaParaGirisi = json['bankayaParaGirisi'] as String?
  ..bankadanParaCikisi = json['bankadanParaCikisi'] as String?
  ..bankaHesabi = json['bankaHesabi'] as String?
  ..hareketDetayi = json['hareketDetayi'] as String?
  ..islemTuru = json['islemTuru'] as String?
  ..mobilCariEFTIslemi = json['MobilCariEFTIslemi'] as String?
  ..mobilHesaplarArasiEFT = json['MobilHesaplarArasiEFT'] as String?
  ..mobilHesaplarArasiVirman = json['MobilHesaplarArasiVirman'] as String?
  ..xXXBos = json['XXXBos'] as String?
  ..tahsilat = json['Tahsilat'] as String?
  ..odeme = json['Odeme'] as String?
  ..hucreBakiyeDurumu = json['HucreBakiyeDurumu'] as String?
  ..hucreHareketleri = json['HucreHareketleri'] as String?
  ..siparisDurumRaporu = json['SiparisDurumRaporu'] as String?
  ..olustur = json['SiparisDurumRaporuDetay'] as String?
  ..faturaTabGenel = json['faturaTabGenel'] as String?
  ..faturaTabKalem = json['faturaTabKalem'] as String?
  ..faturaTabToplamlar = json['faturaTabToplamlar'] as String?
  ..faturaOzelKod1 = json['faturaOzelKod1'] as String?
  ..faturaOzelKod2 = json['faturaOzelKod2'] as String?
  ..faturaKosul = json['faturaKosul'] as String?
  ..faturaHareketTuru = json['faturaHareketTuru'] as String?
  ..faturaCikisYeri = json['faturaCikisYeri'] as String?
  ..faturaMasrafKodu = json['faturaMasrafKodu'] as String?
  ..faturaFarkliTeslimat = json['faturaFarkliTeslimat'] as String?
  ..faturaIthalatTipi = json['faturaIthalatTipi'] as String?
  ..faturaIthalatRefNo = json['faturaIthalatRefNo'] as String?
  ..faturaIskontoToplami = json['faturaIskontoToplami'] as String?
  ..faturaAraToplam = json['faturaAraToplam'] as String?
  ..faturaKDVTutari = json['faturaKDVTutari'] as String?
  ..faturaMasrafMerkezi = json['faturaMasrafMerkezi'] as String?
  ..faturaAnaMalGrubu = json['faturaAnaMalGrubu'] as String?
  ..faturaMalGrubu = json['faturaMalGrubu'] as String?
  ..faturaSerbest = json['faturaSerbest'] as String?
  ..faturaGenelToplamEksiyeDustu =
      json['faturaGenelToplamEksiyeDustu'] as String?
  ..faturaCikisYeriSeciniz = json['faturaCikisYeriSeciniz'] as String?
  ..faturaMasrafKoduSeciniz = json['faturaMasrafKoduSeciniz'] as String?
  ..faturaFarkliTeslimCariSeciniz =
      json['faturaFarkliTeslimCariSeciniz'] as String?
  ..faturaKalemGiriniz = json['faturaKalemGiriniz'] as String?
  ..faturaSeriEFaturaIcinKullaniliyor =
      json['faturaSeriEFaturaIcinKullaniliyor'] as String?
  ..faturaSeriEArsivIcinKullaniliyor =
      json['faturaSeriEArsivIcinKullaniliyor'] as String?
  ..faturaSeriXXXIleBaslamali = json['faturaSeriXXXIleBaslamali'] as String?
  ..faturaEFaturaOlusturulmus = json['faturaEFaturaOlusturulmus'] as String?
  ..faturaEArsivOlusturulmus = json['faturaEArsivOlusturulmus'] as String?
  ..depoGiris = json['depoGiris'] as String?
  ..depoCikis = json['depoCikis'] as String?
  ..depoKalan = json['depoKalan'] as String?
  ..servisKullaniciDogrulamaServisiCalismiyor =
      json['servisKullaniciDogrulamaServisiCalismiyor'] as String?
  ..servisKullaniciDogrulanamadi =
      json['servisKullaniciDogrulanamadi'] as String?
  ..servisOzelKodNoTanimliDegil = json['servisOzelKodNoTanimliDegil'] as String?
  ..servisPickerBelgeTuruTanimliDegil =
      json['servisPickerBelgeTuruTanimliDegil'] as String?
  ..servisPickerYetkinizBulunmuyor =
      json['servisPickerYetkinizBulunmuyor'] as String?
  ..servisSunucuHatasi = json['servisSunucuHatasi'] as String?
  ..servisYeniBelgeNoAlinamadi = json['servisYeniBelgeNoAlinamadi'] as String?;

Map<String, dynamic> _$LangModelToJson(LangModel instance) => <String, dynamic>{
  'DilKodu': ?instance.dilKodu,
  'DilAciklama': ?instance.dilAciklama,
  'menuMalKabul': ?instance.menuMalKabul,
  'menuMalKabulSatinAlma': ?instance.menuMalKabulSatinAlma,
  'menuMalKabulIade': ?instance.menuMalKabulIade,
  'menuTransfer': ?instance.menuTransfer,
  'menuTransferDAT': ?instance.menuTransferDAT,
  'menuTransferAmbarGirisFisi': ?instance.menuTransferAmbarGirisFisi,
  'menuTransferAmbarCikisFisi': ?instance.menuTransferAmbarCikisFisi,
  'menuHucreTakibi': ?instance.menuHucreTakibi,
  'menuHucreTakibiYerlestir': ?instance.menuHucreTakibiYerlestir,
  'menuHucreTakibiBosalt': ?instance.menuHucreTakibiBosalt,
  'menuHucreTakibiTransfer': ?instance.menuHucreTakibiTransfer,
  'menuHucreTakibiAra': ?instance.menuHucreTakibiAra,
  'menuHucreTakibiListe': ?instance.menuHucreTakibiListe,
  'menuSevkiyat': ?instance.menuSevkiyat,
  'menuSevkiyatSatisIrsaliyesi': ?instance.menuSevkiyatSatisIrsaliyesi,
  'menuSevkiyatMalToplama': ?instance.menuSevkiyatMalToplama,
  'menuSayim': ?instance.menuSayim,
  'menuSayimSayim': ?instance.menuSayimSayim,
  'menuSiparis': ?instance.menuSiparis,
  'menuMusteriSiparisi': ?instance.menuMusteriSiparisi,
  'menuSaticiSiparisi': ?instance.menuSaticiSiparisi,
  'menuCari': ?instance.menuCari,
  'menuCariListesi': ?instance.menuCariListesi,
  'menuStok': ?instance.menuStok,
  'menuStokListesi': ?instance.menuStokListesi,
  'menuYonetici': ?instance.menuYonetici,
  'menuBanka': ?instance.menuBanka,
  'menuBankaListesi': ?instance.menuBankaListesi,
  'menuTahsilat': ?instance.menuTahsilat,
  'menuTahsilatYap': ?instance.menuTahsilatYap,
  'menuTahsilatKayitlari': ?instance.menuTahsilatKayitlari,
  'menuNakitOdeme': ?instance.menuNakitOdeme,
  'menuKKTahsilat': ?instance.menuKKTahsilat,
  'menuNakitTahsilat': ?instance.menuNakitTahsilat,
  'menuSenetTahsilati': ?instance.menuSenetTahsilati,
  'menuCekTahsilati': ?instance.menuCekTahsilati,
  'menuAyarlar': ?instance.menuAyarlar,
  'menuFirmalar': ?instance.menuFirmalar,
  'menuTemsilci': ?instance.menuTemsilci,
  'menuProfilim': ?instance.menuProfilim,
  'menuAlisFaturasi': ?instance.menuAlisFaturasi,
  'menuSatisFaturasi': ?instance.menuSatisFaturasi,
  'genelSirketDegistir': ?instance.genelSirketDegistir,
  'genelSirketOturumuKapat': ?instance.genelSirketOturumuKapat,
  'genelGuncelSurumuIndir': ?instance.genelGuncelSurumuIndir,
  'genelLutfenBekleyin': ?instance.genelLutfenBekleyin,
  'genelKaydet': ?instance.genelKaydet,
  'genelTamam': ?instance.genelTamam,
  'genelHayir': ?instance.genelHayir,
  'genelEvet': ?instance.genelEvet,
  'genelIptal': ?instance.genelIptal,
  'genelSil': ?instance.genelSil,
  'genelDuzenle': ?instance.genelDuzenle,
  'genelSirket': ?instance.genelSirket,
  'genelIsletme': ?instance.genelIsletme,
  'genelSube': ?instance.genelSube,
  'genelFirmaEkle': ?instance.genelFirmaEkle,
  'genelKayitAdi': ?instance.genelKayitAdi,
  'genelKullaniciAdi': ?instance.genelKullaniciAdi,
  'genelSifre': ?instance.genelSifre,
  'genelRevizyon': ?instance.genelRevizyon,
  'genelTarih': ?instance.genelTarih,
  'genelBelgeNo': ?instance.genelBelgeNo,
  'genelCari': ?instance.genelCari,
  'genelSiparisTipi': ?instance.genelSiparisTipi,
  'genelProje': ?instance.genelProje,
  'genelPlasiyer': ?instance.genelPlasiyer,
  'genelKDVDahil': ?instance.genelKDVDahil,
  'genelAciklama': ?instance.genelAciklama,
  'genelMiktar': ?instance.genelMiktar,
  'genelTutar': ?instance.genelTutar,
  'genelBirimFiyat': ?instance.genelBirimFiyat,
  'genelKDV': ?instance.genelKDV,
  'genelStokKodu': ?instance.genelStokKodu,
  'genelBrutTutar': ?instance.genelBrutTutar,
  'genelMalFazIsk': ?instance.genelMalFazIsk,
  'genelMalFazTutari': ?instance.genelMalFazTutari,
  'genelMalFazMiktari': ?instance.genelMalFazMiktari,
  'genelSatirIsk': ?instance.genelSatirIsk,
  'genelGenelToplam': ?instance.genelGenelToplam,
  'genelGenelIskonto': ?instance.genelGenelIskonto,
  'genelStokSeviyesi': ?instance.genelStokSeviyesi,
  'genelOlcuBirimi': ?instance.genelOlcuBirimi,
  'genelDepo': ?instance.genelDepo,
  'genelCikisDepo': ?instance.genelCikisDepo,
  'genelGirisDepo': ?instance.genelGirisDepo,
  'genelDovizTipi': ?instance.genelDovizTipi,
  'genelTLFiyati': ?instance.genelTLFiyati,
  'genelIskonto': ?instance.genelIskonto,
  'genelSeriler': ?instance.genelSeriler,
  'genelSeri': ?instance.genelSeri,
  'genelHucreler': ?instance.genelHucreler,
  'genelBelge': ?instance.genelBelge,
  'genelCariKodu': ?instance.genelCariKodu,
  'genelCariAdi': ?instance.genelCariAdi,
  'genelKalemMiktari': ?instance.genelKalemMiktari,
  'genelHucre': ?instance.genelHucre,
  'genelBarkod': ?instance.genelBarkod,
  'genelKalem': ?instance.genelKalem,
  'genelGoruntule': ?instance.genelGoruntule,
  'genelSecenekler': ?instance.genelSecenekler,
  'genelEkle': ?instance.genelEkle,
  'genelYenile': ?instance.genelYenile,
  'genelFiltrele': ?instance.genelFiltrele,
  'genelSirala': ?instance.genelSirala,
  'genelEkAciklamalar': ?instance.genelEkAciklamalar,
  'genelIthalat': ?instance.genelIthalat,
  'genelYeniBelge': ?instance.genelYeniBelge,
  'genelYurtici': ?instance.genelYurtici,
  'genelYurtdisi': ?instance.genelYurtdisi,
  'genelDevir': ?instance.genelDevir,
  'genelDepolar': ?instance.genelDepolar,
  'genelUretim': ?instance.genelUretim,
  'genelMuhtelif': ?instance.genelMuhtelif,
  'genelKonsinye': ?instance.genelKonsinye,
  'genelXRehberi': ?instance.genelXRehberi,
  'genelAlisIrsaliyesi': ?instance.genelAlisIrsaliyesi,
  'genelSatisIrsaliyesi': ?instance.genelSatisIrsaliyesi,
  'genelAlisFaturasi': ?instance.genelAlisFaturasi,
  'genelSatisFaturasi': ?instance.genelSatisFaturasi,
  'genelIade': ?instance.genelIade,
  'genelXGiriniz': ?instance.genelXGiriniz,
  'genelXSeciniz': ?instance.genelXSeciniz,
  'genelXSilinsinMi': ?instance.genelXSilinsinMi,
  'genelKayitSilinsinMi': ?instance.genelKayitSilinsinMi,
  'genelKaydedilsinMi': ?instance.genelKaydedilsinMi,
  'genelEksikBilgiler': ?instance.genelEksikBilgiler,
  'genelMiktarGiriniz': ?instance.genelMiktarGiriniz,
  'genelDovizSeciniz': ?instance.genelDovizSeciniz,
  'genelOlcuBirimiSeciniz': ?instance.genelOlcuBirimiSeciniz,
  'genelPlasiyerSeciniz': ?instance.genelPlasiyerSeciniz,
  'genelProjeSeciniz': ?instance.genelProjeSeciniz,
  'genelCariSeciniz': ?instance.genelCariSeciniz,
  'genelTarihSeciniz': ?instance.genelTarihSeciniz,
  'genelIthalatTipiSeciniz': ?instance.genelIthalatTipiSeciniz,
  'genelGirisDepoSeciniz': ?instance.genelGirisDepoSeciniz,
  'genelGirisVeCikisDepolarAyni': ?instance.genelGirisVeCikisDepolarAyni,
  'genelAciklamaGiriniz': ?instance.genelAciklamaGiriniz,
  'genelOzelKod1Seciniz': ?instance.genelOzelKod1Seciniz,
  'genelOzelKod2Seciniz': ?instance.genelOzelKod2Seciniz,
  'genelStokSeciniz': ?instance.genelStokSeciniz,
  'genelHareketTuruSeciniz': ?instance.genelHareketTuruSeciniz,
  'genelHucreMiktarlariUyumsuz': ?instance.genelHucreMiktarlariUyumsuz,
  'genelSeriMiktarlariUyumsuz': ?instance.genelSeriMiktarlariUyumsuz,
  'genelXBulunamadi': ?instance.genelXBulunamadi,
  'genelMuhasebeKoduSeciniz': ?instance.genelMuhasebeKoduSeciniz,
  'genelFiyatGiriniz': ?instance.genelFiyatGiriniz,
  'genelAdet': ?instance.genelAdet,
  'genelAramaIcinEnAzXHarfGiriniz': ?instance.genelAramaIcinEnAzXHarfGiriniz,
  'genelAra': ?instance.genelAra,
  'genelDovizKuru': ?instance.genelDovizKuru,
  'genelTemizle': ?instance.genelTemizle,
  'genelFisNo': ?instance.genelFisNo,
  'genelBelgeTuruSeciniz': ?instance.genelBelgeTuruSeciniz,
  'genelHucreSeciniz': ?instance.genelHucreSeciniz,
  'genelHucreBakiyesi': ?instance.genelHucreBakiyesi,
  'genelIslemBasarili': ?instance.genelIslemBasarili,
  'genelIslemBasarisiz': ?instance.genelIslemBasarisiz,
  'genelDepoSeciniz': ?instance.genelDepoSeciniz,
  'genelBelgeSeciniz': ?instance.genelBelgeSeciniz,
  'genelBelgeTuru': ?instance.genelBelgeTuru,
  'genelBelgeTarihi': ?instance.genelBelgeTarihi,
  'genelIslemMiktari': ?instance.genelIslemMiktari,
  'genelKaynakHucreSeciniz': ?instance.genelKaynakHucreSeciniz,
  'genelHedefHucreSeciniz': ?instance.genelHedefHucreSeciniz,
  'genelKaynakVeHedefHucrelerAyni': ?instance.genelKaynakVeHedefHucrelerAyni,
  'genelYetersizBakiye': ?instance.genelYetersizBakiye,
  'genelHedefHucre': ?instance.genelHedefHucre,
  'genelKaynakHucre': ?instance.genelKaynakHucre,
  'genelStokAdi': ?instance.genelStokAdi,
  'genelBakiye': ?instance.genelBakiye,
  'genelHareketler': ?instance.genelHareketler,
  'genelDetaylar': ?instance.genelDetaylar,
  'genelDepoBakiyeDurumu': ?instance.genelDepoBakiyeDurumu,
  'genelArti': ?instance.genelArti,
  'genelEksi': ?instance.genelEksi,
  'genelSifir': ?instance.genelSifir,
  'genelGrupKodu': ?instance.genelGrupKodu,
  'genelKod': ?instance.genelKod,
  'genelXHareketleri': ?instance.genelXHareketleri,
  'genelArtan': ?instance.genelArtan,
  'genelAzalan': ?instance.genelAzalan,
  'genelXDetaylari': ?instance.genelXDetaylari,
  'genelFiyat': ?instance.genelFiyat,
  'genelAdi': ?instance.genelAdi,
  'genelKodu': ?instance.genelKodu,
  'genelSeriCikistaAktif': ?instance.genelSeriCikistaAktif,
  'genelSeriGiristeAktif': ?instance.genelSeriGiristeAktif,
  'genelSeriMiktarKadarSor': ?instance.genelSeriMiktarKadarSor,
  'genelSeriBakiyeTakibiVar': ?instance.genelSeriBakiyeTakibiVar,
  'genelAlis': ?instance.genelAlis,
  'genelSatis': ?instance.genelSatis,
  'genelSatisFiyati': ?instance.genelSatisFiyati,
  'genelAlisFiyati': ?instance.genelAlisFiyati,
  'genelBaslamaTarihi': ?instance.genelBaslamaTarihi,
  'genelBitisTarihi': ?instance.genelBitisTarihi,
  'genelSayilanlar': ?instance.genelSayilanlar,
  'genelMalToplama': ?instance.genelMalToplama,
  'genelMalKontrol': ?instance.genelMalKontrol,
  'genelKullaniciyaGonder': ?instance.genelKullaniciyaGonder,
  'genelDepodaYok': ?instance.genelDepodaYok,
  'genelToplananMallar': ?instance.genelToplananMallar,
  'genelMalKontroleGonder': ?instance.genelMalKontroleGonder,
  'genelTamamlandi': ?instance.genelTamamlandi,
  'genelIslemiOnayliyorMusunuz': ?instance.genelIslemiOnayliyorMusunuz,
  'genelTamamla': ?instance.genelTamamla,
  'genelKullanicilar': ?instance.genelKullanicilar,
  'genelCariKoduBos': ?instance.genelCariKoduBos,
  'genelHucreIslemTuruBos': ?instance.genelHucreIslemTuruBos,
  'genelKullaniciAdiVeyaSifreYanlis':
      ?instance.genelKullaniciAdiVeyaSifreYanlis,
  'genelKullaniciKilitliDurumda': ?instance.genelKullaniciKilitliDurumda,
  'genelStokKoduBos': ?instance.genelStokKoduBos,
  'genelBelgeZatenKayitli': ?instance.genelBelgeZatenKayitli,
  'genelKayitYapildi': ?instance.genelKayitYapildi,
  'genelMusteriSiparisi': ?instance.genelMusteriSiparisi,
  'genelSaticiSiparisi': ?instance.genelSaticiSiparisi,
  'genelStokKarti': ?instance.genelStokKarti,
  'genelYazdir': ?instance.genelYazdir,
  'genelNetFiyat': ?instance.genelNetFiyat,
  'genelBrutFiyat': ?instance.genelBrutFiyat,
  'genelProfilim': ?instance.genelProfilim,
  'genelKullaniciBulunamadi': ?instance.genelKullaniciBulunamadi,
  'genelKayitBulunamadi': ?instance.genelKayitBulunamadi,
  'genelCariEFaturaMukellefidir': ?instance.genelCariEFaturaMukellefidir,
  'genelCariEArsivMukellefidir': ?instance.genelCariEArsivMukellefidir,
  'genelCariIleTeslimCariAyniOlamaz':
      ?instance.genelCariIleTeslimCariAyniOlamaz,
  'genelYeniBelgeNo': ?instance.genelYeniBelgeNo,
  'genelStokHareketleri': ?instance.genelStokHareketleri,
  'genelBelgeKayitliDegisiklikYapilamaz':
      ?instance.genelBelgeKayitliDegisiklikYapilamaz,
  'genelBelgeTipi': ?instance.genelBelgeTipi,
  'genelBelgeTipiSeciniz': ?instance.genelBelgeTipiSeciniz,
  'genelKasa': ?instance.genelKasa,
  'genelKasaSeciniz': ?instance.genelKasaSeciniz,
  'genel15HaneliBelgeGiriniz': ?instance.genel15HaneliBelgeGiriniz,
  'genelBelgeSerisiniKontrolEdin': ?instance.genelBelgeSerisiniKontrolEdin,
  'genelTopluDepo': ?instance.genelTopluDepo,
  'genelXXXSeciniz': ?instance.genelXXXSeciniz,
  'genelEFatura': ?instance.genelEFatura,
  'genelEArsiv': ?instance.genelEArsiv,
  'genelEsnekYapilandirma': ?instance.genelEsnekYapilandirma,
  'genelYapilandirmaKodu': ?instance.genelYapilandirmaKodu,
  'genelIslemler': ?instance.genelIslemler,
  'genelBankaIslemleri': ?instance.genelBankaIslemleri,
  'genelGelen': ?instance.genelGelen,
  'genelGonderilen': ?instance.genelGonderilen,
  'genelBaslama': ?instance.genelBaslama,
  'genelBitis': ?instance.genelBitis,
  'genelCariEFTKaydi': ?instance.genelCariEFTKaydi,
  'bankayaParaGirisi': ?instance.bankayaParaGirisi,
  'bankadanParaCikisi': ?instance.bankadanParaCikisi,
  'bankaHesabi': ?instance.bankaHesabi,
  'hareketDetayi': ?instance.hareketDetayi,
  'islemTuru': ?instance.islemTuru,
  'MobilCariEFTIslemi': ?instance.mobilCariEFTIslemi,
  'MobilHesaplarArasiEFT': ?instance.mobilHesaplarArasiEFT,
  'MobilHesaplarArasiVirman': ?instance.mobilHesaplarArasiVirman,
  'XXXBos': ?instance.xXXBos,
  'Tahsilat': ?instance.tahsilat,
  'Odeme': ?instance.odeme,
  'HucreBakiyeDurumu': ?instance.hucreBakiyeDurumu,
  'HucreHareketleri': ?instance.hucreHareketleri,
  'SiparisDurumRaporu': ?instance.siparisDurumRaporu,
  'SiparisDurumRaporuDetay': ?instance.olustur,
  'faturaTabGenel': ?instance.faturaTabGenel,
  'faturaTabKalem': ?instance.faturaTabKalem,
  'faturaTabToplamlar': ?instance.faturaTabToplamlar,
  'faturaOzelKod1': ?instance.faturaOzelKod1,
  'faturaOzelKod2': ?instance.faturaOzelKod2,
  'faturaKosul': ?instance.faturaKosul,
  'faturaHareketTuru': ?instance.faturaHareketTuru,
  'faturaCikisYeri': ?instance.faturaCikisYeri,
  'faturaMasrafKodu': ?instance.faturaMasrafKodu,
  'faturaFarkliTeslimat': ?instance.faturaFarkliTeslimat,
  'faturaIthalatTipi': ?instance.faturaIthalatTipi,
  'faturaIthalatRefNo': ?instance.faturaIthalatRefNo,
  'faturaIskontoToplami': ?instance.faturaIskontoToplami,
  'faturaAraToplam': ?instance.faturaAraToplam,
  'faturaKDVTutari': ?instance.faturaKDVTutari,
  'faturaMasrafMerkezi': ?instance.faturaMasrafMerkezi,
  'faturaAnaMalGrubu': ?instance.faturaAnaMalGrubu,
  'faturaMalGrubu': ?instance.faturaMalGrubu,
  'faturaSerbest': ?instance.faturaSerbest,
  'faturaGenelToplamEksiyeDustu': ?instance.faturaGenelToplamEksiyeDustu,
  'faturaCikisYeriSeciniz': ?instance.faturaCikisYeriSeciniz,
  'faturaMasrafKoduSeciniz': ?instance.faturaMasrafKoduSeciniz,
  'faturaFarkliTeslimCariSeciniz': ?instance.faturaFarkliTeslimCariSeciniz,
  'faturaKalemGiriniz': ?instance.faturaKalemGiriniz,
  'faturaSeriEFaturaIcinKullaniliyor':
      ?instance.faturaSeriEFaturaIcinKullaniliyor,
  'faturaSeriEArsivIcinKullaniliyor':
      ?instance.faturaSeriEArsivIcinKullaniliyor,
  'faturaSeriXXXIleBaslamali': ?instance.faturaSeriXXXIleBaslamali,
  'faturaEFaturaOlusturulmus': ?instance.faturaEFaturaOlusturulmus,
  'faturaEArsivOlusturulmus': ?instance.faturaEArsivOlusturulmus,
  'depoGiris': ?instance.depoGiris,
  'depoCikis': ?instance.depoCikis,
  'depoKalan': ?instance.depoKalan,
  'servisKullaniciDogrulamaServisiCalismiyor':
      ?instance.servisKullaniciDogrulamaServisiCalismiyor,
  'servisKullaniciDogrulanamadi': ?instance.servisKullaniciDogrulanamadi,
  'servisOzelKodNoTanimliDegil': ?instance.servisOzelKodNoTanimliDegil,
  'servisPickerBelgeTuruTanimliDegil':
      ?instance.servisPickerBelgeTuruTanimliDegil,
  'servisPickerYetkinizBulunmuyor': ?instance.servisPickerYetkinizBulunmuyor,
  'servisSunucuHatasi': ?instance.servisSunucuHatasi,
  'servisYeniBelgeNoAlinamadi': ?instance.servisYeniBelgeNoAlinamadi,
};
