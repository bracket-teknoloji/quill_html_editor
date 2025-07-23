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
  if (instance.dilKodu case final value?) 'DilKodu': value,
  if (instance.dilAciklama case final value?) 'DilAciklama': value,
  if (instance.menuMalKabul case final value?) 'menuMalKabul': value,
  if (instance.menuMalKabulSatinAlma case final value?)
    'menuMalKabulSatinAlma': value,
  if (instance.menuMalKabulIade case final value?) 'menuMalKabulIade': value,
  if (instance.menuTransfer case final value?) 'menuTransfer': value,
  if (instance.menuTransferDAT case final value?) 'menuTransferDAT': value,
  if (instance.menuTransferAmbarGirisFisi case final value?)
    'menuTransferAmbarGirisFisi': value,
  if (instance.menuTransferAmbarCikisFisi case final value?)
    'menuTransferAmbarCikisFisi': value,
  if (instance.menuHucreTakibi case final value?) 'menuHucreTakibi': value,
  if (instance.menuHucreTakibiYerlestir case final value?)
    'menuHucreTakibiYerlestir': value,
  if (instance.menuHucreTakibiBosalt case final value?)
    'menuHucreTakibiBosalt': value,
  if (instance.menuHucreTakibiTransfer case final value?)
    'menuHucreTakibiTransfer': value,
  if (instance.menuHucreTakibiAra case final value?)
    'menuHucreTakibiAra': value,
  if (instance.menuHucreTakibiListe case final value?)
    'menuHucreTakibiListe': value,
  if (instance.menuSevkiyat case final value?) 'menuSevkiyat': value,
  if (instance.menuSevkiyatSatisIrsaliyesi case final value?)
    'menuSevkiyatSatisIrsaliyesi': value,
  if (instance.menuSevkiyatMalToplama case final value?)
    'menuSevkiyatMalToplama': value,
  if (instance.menuSayim case final value?) 'menuSayim': value,
  if (instance.menuSayimSayim case final value?) 'menuSayimSayim': value,
  if (instance.menuSiparis case final value?) 'menuSiparis': value,
  if (instance.menuMusteriSiparisi case final value?)
    'menuMusteriSiparisi': value,
  if (instance.menuSaticiSiparisi case final value?)
    'menuSaticiSiparisi': value,
  if (instance.menuCari case final value?) 'menuCari': value,
  if (instance.menuCariListesi case final value?) 'menuCariListesi': value,
  if (instance.menuStok case final value?) 'menuStok': value,
  if (instance.menuStokListesi case final value?) 'menuStokListesi': value,
  if (instance.menuYonetici case final value?) 'menuYonetici': value,
  if (instance.menuBanka case final value?) 'menuBanka': value,
  if (instance.menuBankaListesi case final value?) 'menuBankaListesi': value,
  if (instance.menuTahsilat case final value?) 'menuTahsilat': value,
  if (instance.menuTahsilatYap case final value?) 'menuTahsilatYap': value,
  if (instance.menuTahsilatKayitlari case final value?)
    'menuTahsilatKayitlari': value,
  if (instance.menuNakitOdeme case final value?) 'menuNakitOdeme': value,
  if (instance.menuKKTahsilat case final value?) 'menuKKTahsilat': value,
  if (instance.menuNakitTahsilat case final value?) 'menuNakitTahsilat': value,
  if (instance.menuSenetTahsilati case final value?)
    'menuSenetTahsilati': value,
  if (instance.menuCekTahsilati case final value?) 'menuCekTahsilati': value,
  if (instance.menuAyarlar case final value?) 'menuAyarlar': value,
  if (instance.menuFirmalar case final value?) 'menuFirmalar': value,
  if (instance.menuTemsilci case final value?) 'menuTemsilci': value,
  if (instance.menuProfilim case final value?) 'menuProfilim': value,
  if (instance.menuAlisFaturasi case final value?) 'menuAlisFaturasi': value,
  if (instance.menuSatisFaturasi case final value?) 'menuSatisFaturasi': value,
  if (instance.genelSirketDegistir case final value?)
    'genelSirketDegistir': value,
  if (instance.genelSirketOturumuKapat case final value?)
    'genelSirketOturumuKapat': value,
  if (instance.genelGuncelSurumuIndir case final value?)
    'genelGuncelSurumuIndir': value,
  if (instance.genelLutfenBekleyin case final value?)
    'genelLutfenBekleyin': value,
  if (instance.genelKaydet case final value?) 'genelKaydet': value,
  if (instance.genelTamam case final value?) 'genelTamam': value,
  if (instance.genelHayir case final value?) 'genelHayir': value,
  if (instance.genelEvet case final value?) 'genelEvet': value,
  if (instance.genelIptal case final value?) 'genelIptal': value,
  if (instance.genelSil case final value?) 'genelSil': value,
  if (instance.genelDuzenle case final value?) 'genelDuzenle': value,
  if (instance.genelSirket case final value?) 'genelSirket': value,
  if (instance.genelIsletme case final value?) 'genelIsletme': value,
  if (instance.genelSube case final value?) 'genelSube': value,
  if (instance.genelFirmaEkle case final value?) 'genelFirmaEkle': value,
  if (instance.genelKayitAdi case final value?) 'genelKayitAdi': value,
  if (instance.genelKullaniciAdi case final value?) 'genelKullaniciAdi': value,
  if (instance.genelSifre case final value?) 'genelSifre': value,
  if (instance.genelRevizyon case final value?) 'genelRevizyon': value,
  if (instance.genelTarih case final value?) 'genelTarih': value,
  if (instance.genelBelgeNo case final value?) 'genelBelgeNo': value,
  if (instance.genelCari case final value?) 'genelCari': value,
  if (instance.genelSiparisTipi case final value?) 'genelSiparisTipi': value,
  if (instance.genelProje case final value?) 'genelProje': value,
  if (instance.genelPlasiyer case final value?) 'genelPlasiyer': value,
  if (instance.genelKDVDahil case final value?) 'genelKDVDahil': value,
  if (instance.genelAciklama case final value?) 'genelAciklama': value,
  if (instance.genelMiktar case final value?) 'genelMiktar': value,
  if (instance.genelTutar case final value?) 'genelTutar': value,
  if (instance.genelBirimFiyat case final value?) 'genelBirimFiyat': value,
  if (instance.genelKDV case final value?) 'genelKDV': value,
  if (instance.genelStokKodu case final value?) 'genelStokKodu': value,
  if (instance.genelBrutTutar case final value?) 'genelBrutTutar': value,
  if (instance.genelMalFazIsk case final value?) 'genelMalFazIsk': value,
  if (instance.genelMalFazTutari case final value?) 'genelMalFazTutari': value,
  if (instance.genelMalFazMiktari case final value?)
    'genelMalFazMiktari': value,
  if (instance.genelSatirIsk case final value?) 'genelSatirIsk': value,
  if (instance.genelGenelToplam case final value?) 'genelGenelToplam': value,
  if (instance.genelGenelIskonto case final value?) 'genelGenelIskonto': value,
  if (instance.genelStokSeviyesi case final value?) 'genelStokSeviyesi': value,
  if (instance.genelOlcuBirimi case final value?) 'genelOlcuBirimi': value,
  if (instance.genelDepo case final value?) 'genelDepo': value,
  if (instance.genelCikisDepo case final value?) 'genelCikisDepo': value,
  if (instance.genelGirisDepo case final value?) 'genelGirisDepo': value,
  if (instance.genelDovizTipi case final value?) 'genelDovizTipi': value,
  if (instance.genelTLFiyati case final value?) 'genelTLFiyati': value,
  if (instance.genelIskonto case final value?) 'genelIskonto': value,
  if (instance.genelSeriler case final value?) 'genelSeriler': value,
  if (instance.genelSeri case final value?) 'genelSeri': value,
  if (instance.genelHucreler case final value?) 'genelHucreler': value,
  if (instance.genelBelge case final value?) 'genelBelge': value,
  if (instance.genelCariKodu case final value?) 'genelCariKodu': value,
  if (instance.genelCariAdi case final value?) 'genelCariAdi': value,
  if (instance.genelKalemMiktari case final value?) 'genelKalemMiktari': value,
  if (instance.genelHucre case final value?) 'genelHucre': value,
  if (instance.genelBarkod case final value?) 'genelBarkod': value,
  if (instance.genelKalem case final value?) 'genelKalem': value,
  if (instance.genelGoruntule case final value?) 'genelGoruntule': value,
  if (instance.genelSecenekler case final value?) 'genelSecenekler': value,
  if (instance.genelEkle case final value?) 'genelEkle': value,
  if (instance.genelYenile case final value?) 'genelYenile': value,
  if (instance.genelFiltrele case final value?) 'genelFiltrele': value,
  if (instance.genelSirala case final value?) 'genelSirala': value,
  if (instance.genelEkAciklamalar case final value?)
    'genelEkAciklamalar': value,
  if (instance.genelIthalat case final value?) 'genelIthalat': value,
  if (instance.genelYeniBelge case final value?) 'genelYeniBelge': value,
  if (instance.genelYurtici case final value?) 'genelYurtici': value,
  if (instance.genelYurtdisi case final value?) 'genelYurtdisi': value,
  if (instance.genelDevir case final value?) 'genelDevir': value,
  if (instance.genelDepolar case final value?) 'genelDepolar': value,
  if (instance.genelUretim case final value?) 'genelUretim': value,
  if (instance.genelMuhtelif case final value?) 'genelMuhtelif': value,
  if (instance.genelKonsinye case final value?) 'genelKonsinye': value,
  if (instance.genelXRehberi case final value?) 'genelXRehberi': value,
  if (instance.genelAlisIrsaliyesi case final value?)
    'genelAlisIrsaliyesi': value,
  if (instance.genelSatisIrsaliyesi case final value?)
    'genelSatisIrsaliyesi': value,
  if (instance.genelAlisFaturasi case final value?) 'genelAlisFaturasi': value,
  if (instance.genelSatisFaturasi case final value?)
    'genelSatisFaturasi': value,
  if (instance.genelIade case final value?) 'genelIade': value,
  if (instance.genelXGiriniz case final value?) 'genelXGiriniz': value,
  if (instance.genelXSeciniz case final value?) 'genelXSeciniz': value,
  if (instance.genelXSilinsinMi case final value?) 'genelXSilinsinMi': value,
  if (instance.genelKayitSilinsinMi case final value?)
    'genelKayitSilinsinMi': value,
  if (instance.genelKaydedilsinMi case final value?)
    'genelKaydedilsinMi': value,
  if (instance.genelEksikBilgiler case final value?)
    'genelEksikBilgiler': value,
  if (instance.genelMiktarGiriniz case final value?)
    'genelMiktarGiriniz': value,
  if (instance.genelDovizSeciniz case final value?) 'genelDovizSeciniz': value,
  if (instance.genelOlcuBirimiSeciniz case final value?)
    'genelOlcuBirimiSeciniz': value,
  if (instance.genelPlasiyerSeciniz case final value?)
    'genelPlasiyerSeciniz': value,
  if (instance.genelProjeSeciniz case final value?) 'genelProjeSeciniz': value,
  if (instance.genelCariSeciniz case final value?) 'genelCariSeciniz': value,
  if (instance.genelTarihSeciniz case final value?) 'genelTarihSeciniz': value,
  if (instance.genelIthalatTipiSeciniz case final value?)
    'genelIthalatTipiSeciniz': value,
  if (instance.genelGirisDepoSeciniz case final value?)
    'genelGirisDepoSeciniz': value,
  if (instance.genelGirisVeCikisDepolarAyni case final value?)
    'genelGirisVeCikisDepolarAyni': value,
  if (instance.genelAciklamaGiriniz case final value?)
    'genelAciklamaGiriniz': value,
  if (instance.genelOzelKod1Seciniz case final value?)
    'genelOzelKod1Seciniz': value,
  if (instance.genelOzelKod2Seciniz case final value?)
    'genelOzelKod2Seciniz': value,
  if (instance.genelStokSeciniz case final value?) 'genelStokSeciniz': value,
  if (instance.genelHareketTuruSeciniz case final value?)
    'genelHareketTuruSeciniz': value,
  if (instance.genelHucreMiktarlariUyumsuz case final value?)
    'genelHucreMiktarlariUyumsuz': value,
  if (instance.genelSeriMiktarlariUyumsuz case final value?)
    'genelSeriMiktarlariUyumsuz': value,
  if (instance.genelXBulunamadi case final value?) 'genelXBulunamadi': value,
  if (instance.genelMuhasebeKoduSeciniz case final value?)
    'genelMuhasebeKoduSeciniz': value,
  if (instance.genelFiyatGiriniz case final value?) 'genelFiyatGiriniz': value,
  if (instance.genelAdet case final value?) 'genelAdet': value,
  if (instance.genelAramaIcinEnAzXHarfGiriniz case final value?)
    'genelAramaIcinEnAzXHarfGiriniz': value,
  if (instance.genelAra case final value?) 'genelAra': value,
  if (instance.genelDovizKuru case final value?) 'genelDovizKuru': value,
  if (instance.genelTemizle case final value?) 'genelTemizle': value,
  if (instance.genelFisNo case final value?) 'genelFisNo': value,
  if (instance.genelBelgeTuruSeciniz case final value?)
    'genelBelgeTuruSeciniz': value,
  if (instance.genelHucreSeciniz case final value?) 'genelHucreSeciniz': value,
  if (instance.genelHucreBakiyesi case final value?)
    'genelHucreBakiyesi': value,
  if (instance.genelIslemBasarili case final value?)
    'genelIslemBasarili': value,
  if (instance.genelIslemBasarisiz case final value?)
    'genelIslemBasarisiz': value,
  if (instance.genelDepoSeciniz case final value?) 'genelDepoSeciniz': value,
  if (instance.genelBelgeSeciniz case final value?) 'genelBelgeSeciniz': value,
  if (instance.genelBelgeTuru case final value?) 'genelBelgeTuru': value,
  if (instance.genelBelgeTarihi case final value?) 'genelBelgeTarihi': value,
  if (instance.genelIslemMiktari case final value?) 'genelIslemMiktari': value,
  if (instance.genelKaynakHucreSeciniz case final value?)
    'genelKaynakHucreSeciniz': value,
  if (instance.genelHedefHucreSeciniz case final value?)
    'genelHedefHucreSeciniz': value,
  if (instance.genelKaynakVeHedefHucrelerAyni case final value?)
    'genelKaynakVeHedefHucrelerAyni': value,
  if (instance.genelYetersizBakiye case final value?)
    'genelYetersizBakiye': value,
  if (instance.genelHedefHucre case final value?) 'genelHedefHucre': value,
  if (instance.genelKaynakHucre case final value?) 'genelKaynakHucre': value,
  if (instance.genelStokAdi case final value?) 'genelStokAdi': value,
  if (instance.genelBakiye case final value?) 'genelBakiye': value,
  if (instance.genelHareketler case final value?) 'genelHareketler': value,
  if (instance.genelDetaylar case final value?) 'genelDetaylar': value,
  if (instance.genelDepoBakiyeDurumu case final value?)
    'genelDepoBakiyeDurumu': value,
  if (instance.genelArti case final value?) 'genelArti': value,
  if (instance.genelEksi case final value?) 'genelEksi': value,
  if (instance.genelSifir case final value?) 'genelSifir': value,
  if (instance.genelGrupKodu case final value?) 'genelGrupKodu': value,
  if (instance.genelKod case final value?) 'genelKod': value,
  if (instance.genelXHareketleri case final value?) 'genelXHareketleri': value,
  if (instance.genelArtan case final value?) 'genelArtan': value,
  if (instance.genelAzalan case final value?) 'genelAzalan': value,
  if (instance.genelXDetaylari case final value?) 'genelXDetaylari': value,
  if (instance.genelFiyat case final value?) 'genelFiyat': value,
  if (instance.genelAdi case final value?) 'genelAdi': value,
  if (instance.genelKodu case final value?) 'genelKodu': value,
  if (instance.genelSeriCikistaAktif case final value?)
    'genelSeriCikistaAktif': value,
  if (instance.genelSeriGiristeAktif case final value?)
    'genelSeriGiristeAktif': value,
  if (instance.genelSeriMiktarKadarSor case final value?)
    'genelSeriMiktarKadarSor': value,
  if (instance.genelSeriBakiyeTakibiVar case final value?)
    'genelSeriBakiyeTakibiVar': value,
  if (instance.genelAlis case final value?) 'genelAlis': value,
  if (instance.genelSatis case final value?) 'genelSatis': value,
  if (instance.genelSatisFiyati case final value?) 'genelSatisFiyati': value,
  if (instance.genelAlisFiyati case final value?) 'genelAlisFiyati': value,
  if (instance.genelBaslamaTarihi case final value?)
    'genelBaslamaTarihi': value,
  if (instance.genelBitisTarihi case final value?) 'genelBitisTarihi': value,
  if (instance.genelSayilanlar case final value?) 'genelSayilanlar': value,
  if (instance.genelMalToplama case final value?) 'genelMalToplama': value,
  if (instance.genelMalKontrol case final value?) 'genelMalKontrol': value,
  if (instance.genelKullaniciyaGonder case final value?)
    'genelKullaniciyaGonder': value,
  if (instance.genelDepodaYok case final value?) 'genelDepodaYok': value,
  if (instance.genelToplananMallar case final value?)
    'genelToplananMallar': value,
  if (instance.genelMalKontroleGonder case final value?)
    'genelMalKontroleGonder': value,
  if (instance.genelTamamlandi case final value?) 'genelTamamlandi': value,
  if (instance.genelIslemiOnayliyorMusunuz case final value?)
    'genelIslemiOnayliyorMusunuz': value,
  if (instance.genelTamamla case final value?) 'genelTamamla': value,
  if (instance.genelKullanicilar case final value?) 'genelKullanicilar': value,
  if (instance.genelCariKoduBos case final value?) 'genelCariKoduBos': value,
  if (instance.genelHucreIslemTuruBos case final value?)
    'genelHucreIslemTuruBos': value,
  if (instance.genelKullaniciAdiVeyaSifreYanlis case final value?)
    'genelKullaniciAdiVeyaSifreYanlis': value,
  if (instance.genelKullaniciKilitliDurumda case final value?)
    'genelKullaniciKilitliDurumda': value,
  if (instance.genelStokKoduBos case final value?) 'genelStokKoduBos': value,
  if (instance.genelBelgeZatenKayitli case final value?)
    'genelBelgeZatenKayitli': value,
  if (instance.genelKayitYapildi case final value?) 'genelKayitYapildi': value,
  if (instance.genelMusteriSiparisi case final value?)
    'genelMusteriSiparisi': value,
  if (instance.genelSaticiSiparisi case final value?)
    'genelSaticiSiparisi': value,
  if (instance.genelStokKarti case final value?) 'genelStokKarti': value,
  if (instance.genelYazdir case final value?) 'genelYazdir': value,
  if (instance.genelNetFiyat case final value?) 'genelNetFiyat': value,
  if (instance.genelBrutFiyat case final value?) 'genelBrutFiyat': value,
  if (instance.genelProfilim case final value?) 'genelProfilim': value,
  if (instance.genelKullaniciBulunamadi case final value?)
    'genelKullaniciBulunamadi': value,
  if (instance.genelKayitBulunamadi case final value?)
    'genelKayitBulunamadi': value,
  if (instance.genelCariEFaturaMukellefidir case final value?)
    'genelCariEFaturaMukellefidir': value,
  if (instance.genelCariEArsivMukellefidir case final value?)
    'genelCariEArsivMukellefidir': value,
  if (instance.genelCariIleTeslimCariAyniOlamaz case final value?)
    'genelCariIleTeslimCariAyniOlamaz': value,
  if (instance.genelYeniBelgeNo case final value?) 'genelYeniBelgeNo': value,
  if (instance.genelStokHareketleri case final value?)
    'genelStokHareketleri': value,
  if (instance.genelBelgeKayitliDegisiklikYapilamaz case final value?)
    'genelBelgeKayitliDegisiklikYapilamaz': value,
  if (instance.genelBelgeTipi case final value?) 'genelBelgeTipi': value,
  if (instance.genelBelgeTipiSeciniz case final value?)
    'genelBelgeTipiSeciniz': value,
  if (instance.genelKasa case final value?) 'genelKasa': value,
  if (instance.genelKasaSeciniz case final value?) 'genelKasaSeciniz': value,
  if (instance.genel15HaneliBelgeGiriniz case final value?)
    'genel15HaneliBelgeGiriniz': value,
  if (instance.genelBelgeSerisiniKontrolEdin case final value?)
    'genelBelgeSerisiniKontrolEdin': value,
  if (instance.genelTopluDepo case final value?) 'genelTopluDepo': value,
  if (instance.genelXXXSeciniz case final value?) 'genelXXXSeciniz': value,
  if (instance.genelEFatura case final value?) 'genelEFatura': value,
  if (instance.genelEArsiv case final value?) 'genelEArsiv': value,
  if (instance.genelEsnekYapilandirma case final value?)
    'genelEsnekYapilandirma': value,
  if (instance.genelYapilandirmaKodu case final value?)
    'genelYapilandirmaKodu': value,
  if (instance.genelIslemler case final value?) 'genelIslemler': value,
  if (instance.genelBankaIslemleri case final value?)
    'genelBankaIslemleri': value,
  if (instance.genelGelen case final value?) 'genelGelen': value,
  if (instance.genelGonderilen case final value?) 'genelGonderilen': value,
  if (instance.genelBaslama case final value?) 'genelBaslama': value,
  if (instance.genelBitis case final value?) 'genelBitis': value,
  if (instance.genelCariEFTKaydi case final value?) 'genelCariEFTKaydi': value,
  if (instance.bankayaParaGirisi case final value?) 'bankayaParaGirisi': value,
  if (instance.bankadanParaCikisi case final value?)
    'bankadanParaCikisi': value,
  if (instance.bankaHesabi case final value?) 'bankaHesabi': value,
  if (instance.hareketDetayi case final value?) 'hareketDetayi': value,
  if (instance.islemTuru case final value?) 'islemTuru': value,
  if (instance.mobilCariEFTIslemi case final value?)
    'MobilCariEFTIslemi': value,
  if (instance.mobilHesaplarArasiEFT case final value?)
    'MobilHesaplarArasiEFT': value,
  if (instance.mobilHesaplarArasiVirman case final value?)
    'MobilHesaplarArasiVirman': value,
  if (instance.xXXBos case final value?) 'XXXBos': value,
  if (instance.tahsilat case final value?) 'Tahsilat': value,
  if (instance.odeme case final value?) 'Odeme': value,
  if (instance.hucreBakiyeDurumu case final value?) 'HucreBakiyeDurumu': value,
  if (instance.hucreHareketleri case final value?) 'HucreHareketleri': value,
  if (instance.siparisDurumRaporu case final value?)
    'SiparisDurumRaporu': value,
  if (instance.olustur case final value?) 'SiparisDurumRaporuDetay': value,
  if (instance.faturaTabGenel case final value?) 'faturaTabGenel': value,
  if (instance.faturaTabKalem case final value?) 'faturaTabKalem': value,
  if (instance.faturaTabToplamlar case final value?)
    'faturaTabToplamlar': value,
  if (instance.faturaOzelKod1 case final value?) 'faturaOzelKod1': value,
  if (instance.faturaOzelKod2 case final value?) 'faturaOzelKod2': value,
  if (instance.faturaKosul case final value?) 'faturaKosul': value,
  if (instance.faturaHareketTuru case final value?) 'faturaHareketTuru': value,
  if (instance.faturaCikisYeri case final value?) 'faturaCikisYeri': value,
  if (instance.faturaMasrafKodu case final value?) 'faturaMasrafKodu': value,
  if (instance.faturaFarkliTeslimat case final value?)
    'faturaFarkliTeslimat': value,
  if (instance.faturaIthalatTipi case final value?) 'faturaIthalatTipi': value,
  if (instance.faturaIthalatRefNo case final value?)
    'faturaIthalatRefNo': value,
  if (instance.faturaIskontoToplami case final value?)
    'faturaIskontoToplami': value,
  if (instance.faturaAraToplam case final value?) 'faturaAraToplam': value,
  if (instance.faturaKDVTutari case final value?) 'faturaKDVTutari': value,
  if (instance.faturaMasrafMerkezi case final value?)
    'faturaMasrafMerkezi': value,
  if (instance.faturaAnaMalGrubu case final value?) 'faturaAnaMalGrubu': value,
  if (instance.faturaMalGrubu case final value?) 'faturaMalGrubu': value,
  if (instance.faturaSerbest case final value?) 'faturaSerbest': value,
  if (instance.faturaGenelToplamEksiyeDustu case final value?)
    'faturaGenelToplamEksiyeDustu': value,
  if (instance.faturaCikisYeriSeciniz case final value?)
    'faturaCikisYeriSeciniz': value,
  if (instance.faturaMasrafKoduSeciniz case final value?)
    'faturaMasrafKoduSeciniz': value,
  if (instance.faturaFarkliTeslimCariSeciniz case final value?)
    'faturaFarkliTeslimCariSeciniz': value,
  if (instance.faturaKalemGiriniz case final value?)
    'faturaKalemGiriniz': value,
  if (instance.faturaSeriEFaturaIcinKullaniliyor case final value?)
    'faturaSeriEFaturaIcinKullaniliyor': value,
  if (instance.faturaSeriEArsivIcinKullaniliyor case final value?)
    'faturaSeriEArsivIcinKullaniliyor': value,
  if (instance.faturaSeriXXXIleBaslamali case final value?)
    'faturaSeriXXXIleBaslamali': value,
  if (instance.faturaEFaturaOlusturulmus case final value?)
    'faturaEFaturaOlusturulmus': value,
  if (instance.faturaEArsivOlusturulmus case final value?)
    'faturaEArsivOlusturulmus': value,
  if (instance.depoGiris case final value?) 'depoGiris': value,
  if (instance.depoCikis case final value?) 'depoCikis': value,
  if (instance.depoKalan case final value?) 'depoKalan': value,
  if (instance.servisKullaniciDogrulamaServisiCalismiyor case final value?)
    'servisKullaniciDogrulamaServisiCalismiyor': value,
  if (instance.servisKullaniciDogrulanamadi case final value?)
    'servisKullaniciDogrulanamadi': value,
  if (instance.servisOzelKodNoTanimliDegil case final value?)
    'servisOzelKodNoTanimliDegil': value,
  if (instance.servisPickerBelgeTuruTanimliDegil case final value?)
    'servisPickerBelgeTuruTanimliDegil': value,
  if (instance.servisPickerYetkinizBulunmuyor case final value?)
    'servisPickerYetkinizBulunmuyor': value,
  if (instance.servisSunucuHatasi case final value?)
    'servisSunucuHatasi': value,
  if (instance.servisYeniBelgeNoAlinamadi case final value?)
    'servisYeniBelgeNoAlinamadi': value,
};
