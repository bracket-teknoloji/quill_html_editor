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
  ..genelGirisVeCikisDepolarAyni = json['genelGirisVeCikisDepolarAyni'] as String?
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
  ..genelAramaIcinEnAzXHarfGiriniz = json['genelAramaIcinEnAzXHarfGiriniz'] as String?
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
  ..genelKaynakVeHedefHucrelerAyni = json['genelKaynakVeHedefHucrelerAyni'] as String?
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
  ..genelKullaniciAdiVeyaSifreYanlis = json['genelKullaniciAdiVeyaSifreYanlis'] as String?
  ..genelKullaniciKilitliDurumda = json['genelKullaniciKilitliDurumda'] as String?
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
  ..genelCariEFaturaMukellefidir = json['genelCariEFaturaMukellefidir'] as String?
  ..genelCariEArsivMukellefidir = json['genelCariEArsivMukellefidir'] as String?
  ..genelCariIleTeslimCariAyniOlamaz = json['genelCariIleTeslimCariAyniOlamaz'] as String?
  ..genelYeniBelgeNo = json['genelYeniBelgeNo'] as String?
  ..genelStokHareketleri = json['genelStokHareketleri'] as String?
  ..genelBelgeKayitliDegisiklikYapilamaz = json['genelBelgeKayitliDegisiklikYapilamaz'] as String?
  ..genelBelgeTipi = json['genelBelgeTipi'] as String?
  ..genelBelgeTipiSeciniz = json['genelBelgeTipiSeciniz'] as String?
  ..genelKasa = json['genelKasa'] as String?
  ..genelKasaSeciniz = json['genelKasaSeciniz'] as String?
  ..genel15HaneliBelgeGiriniz = json['genel15HaneliBelgeGiriniz'] as String?
  ..genelBelgeSerisiniKontrolEdin = json['genelBelgeSerisiniKontrolEdin'] as String?
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
  ..faturaGenelToplamEksiyeDustu = json['faturaGenelToplamEksiyeDustu'] as String?
  ..faturaCikisYeriSeciniz = json['faturaCikisYeriSeciniz'] as String?
  ..faturaMasrafKoduSeciniz = json['faturaMasrafKoduSeciniz'] as String?
  ..faturaFarkliTeslimCariSeciniz = json['faturaFarkliTeslimCariSeciniz'] as String?
  ..faturaKalemGiriniz = json['faturaKalemGiriniz'] as String?
  ..faturaSeriEFaturaIcinKullaniliyor = json['faturaSeriEFaturaIcinKullaniliyor'] as String?
  ..faturaSeriEArsivIcinKullaniliyor = json['faturaSeriEArsivIcinKullaniliyor'] as String?
  ..faturaSeriXXXIleBaslamali = json['faturaSeriXXXIleBaslamali'] as String?
  ..faturaEFaturaOlusturulmus = json['faturaEFaturaOlusturulmus'] as String?
  ..faturaEArsivOlusturulmus = json['faturaEArsivOlusturulmus'] as String?
  ..depoGiris = json['depoGiris'] as String?
  ..depoCikis = json['depoCikis'] as String?
  ..depoKalan = json['depoKalan'] as String?
  ..servisKullaniciDogrulamaServisiCalismiyor = json['servisKullaniciDogrulamaServisiCalismiyor'] as String?
  ..servisKullaniciDogrulanamadi = json['servisKullaniciDogrulanamadi'] as String?
  ..servisOzelKodNoTanimliDegil = json['servisOzelKodNoTanimliDegil'] as String?
  ..servisPickerBelgeTuruTanimliDegil = json['servisPickerBelgeTuruTanimliDegil'] as String?
  ..servisPickerYetkinizBulunmuyor = json['servisPickerYetkinizBulunmuyor'] as String?
  ..servisSunucuHatasi = json['servisSunucuHatasi'] as String?
  ..servisYeniBelgeNoAlinamadi = json['servisYeniBelgeNoAlinamadi'] as String?;

Map<String, dynamic> _$LangModelToJson(LangModel instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('DilKodu', instance.dilKodu);
  writeNotNull('DilAciklama', instance.dilAciklama);
  writeNotNull('menuMalKabul', instance.menuMalKabul);
  writeNotNull('menuMalKabulSatinAlma', instance.menuMalKabulSatinAlma);
  writeNotNull('menuMalKabulIade', instance.menuMalKabulIade);
  writeNotNull('menuTransfer', instance.menuTransfer);
  writeNotNull('menuTransferDAT', instance.menuTransferDAT);
  writeNotNull('menuTransferAmbarGirisFisi', instance.menuTransferAmbarGirisFisi);
  writeNotNull('menuTransferAmbarCikisFisi', instance.menuTransferAmbarCikisFisi);
  writeNotNull('menuHucreTakibi', instance.menuHucreTakibi);
  writeNotNull('menuHucreTakibiYerlestir', instance.menuHucreTakibiYerlestir);
  writeNotNull('menuHucreTakibiBosalt', instance.menuHucreTakibiBosalt);
  writeNotNull('menuHucreTakibiTransfer', instance.menuHucreTakibiTransfer);
  writeNotNull('menuHucreTakibiAra', instance.menuHucreTakibiAra);
  writeNotNull('menuHucreTakibiListe', instance.menuHucreTakibiListe);
  writeNotNull('menuSevkiyat', instance.menuSevkiyat);
  writeNotNull('menuSevkiyatSatisIrsaliyesi', instance.menuSevkiyatSatisIrsaliyesi);
  writeNotNull('menuSevkiyatMalToplama', instance.menuSevkiyatMalToplama);
  writeNotNull('menuSayim', instance.menuSayim);
  writeNotNull('menuSayimSayim', instance.menuSayimSayim);
  writeNotNull('menuSiparis', instance.menuSiparis);
  writeNotNull('menuMusteriSiparisi', instance.menuMusteriSiparisi);
  writeNotNull('menuSaticiSiparisi', instance.menuSaticiSiparisi);
  writeNotNull('menuCari', instance.menuCari);
  writeNotNull('menuCariListesi', instance.menuCariListesi);
  writeNotNull('menuStok', instance.menuStok);
  writeNotNull('menuStokListesi', instance.menuStokListesi);
  writeNotNull('menuYonetici', instance.menuYonetici);
  writeNotNull('menuBanka', instance.menuBanka);
  writeNotNull('menuBankaListesi', instance.menuBankaListesi);
  writeNotNull('menuTahsilat', instance.menuTahsilat);
  writeNotNull('menuTahsilatYap', instance.menuTahsilatYap);
  writeNotNull('menuTahsilatKayitlari', instance.menuTahsilatKayitlari);
  writeNotNull('menuNakitOdeme', instance.menuNakitOdeme);
  writeNotNull('menuKKTahsilat', instance.menuKKTahsilat);
  writeNotNull('menuNakitTahsilat', instance.menuNakitTahsilat);
  writeNotNull('menuSenetTahsilati', instance.menuSenetTahsilati);
  writeNotNull('menuCekTahsilati', instance.menuCekTahsilati);
  writeNotNull('menuAyarlar', instance.menuAyarlar);
  writeNotNull('menuFirmalar', instance.menuFirmalar);
  writeNotNull('menuTemsilci', instance.menuTemsilci);
  writeNotNull('menuProfilim', instance.menuProfilim);
  writeNotNull('menuAlisFaturasi', instance.menuAlisFaturasi);
  writeNotNull('menuSatisFaturasi', instance.menuSatisFaturasi);
  writeNotNull('genelSirketDegistir', instance.genelSirketDegistir);
  writeNotNull('genelSirketOturumuKapat', instance.genelSirketOturumuKapat);
  writeNotNull('genelGuncelSurumuIndir', instance.genelGuncelSurumuIndir);
  writeNotNull('genelLutfenBekleyin', instance.genelLutfenBekleyin);
  writeNotNull('genelKaydet', instance.genelKaydet);
  writeNotNull('genelTamam', instance.genelTamam);
  writeNotNull('genelHayir', instance.genelHayir);
  writeNotNull('genelEvet', instance.genelEvet);
  writeNotNull('genelIptal', instance.genelIptal);
  writeNotNull('genelSil', instance.genelSil);
  writeNotNull('genelDuzenle', instance.genelDuzenle);
  writeNotNull('genelSirket', instance.genelSirket);
  writeNotNull('genelIsletme', instance.genelIsletme);
  writeNotNull('genelSube', instance.genelSube);
  writeNotNull('genelFirmaEkle', instance.genelFirmaEkle);
  writeNotNull('genelKayitAdi', instance.genelKayitAdi);
  writeNotNull('genelKullaniciAdi', instance.genelKullaniciAdi);
  writeNotNull('genelSifre', instance.genelSifre);
  writeNotNull('genelRevizyon', instance.genelRevizyon);
  writeNotNull('genelTarih', instance.genelTarih);
  writeNotNull('genelBelgeNo', instance.genelBelgeNo);
  writeNotNull('genelCari', instance.genelCari);
  writeNotNull('genelSiparisTipi', instance.genelSiparisTipi);
  writeNotNull('genelProje', instance.genelProje);
  writeNotNull('genelPlasiyer', instance.genelPlasiyer);
  writeNotNull('genelKDVDahil', instance.genelKDVDahil);
  writeNotNull('genelAciklama', instance.genelAciklama);
  writeNotNull('genelMiktar', instance.genelMiktar);
  writeNotNull('genelTutar', instance.genelTutar);
  writeNotNull('genelBirimFiyat', instance.genelBirimFiyat);
  writeNotNull('genelKDV', instance.genelKDV);
  writeNotNull('genelStokKodu', instance.genelStokKodu);
  writeNotNull('genelBrutTutar', instance.genelBrutTutar);
  writeNotNull('genelMalFazIsk', instance.genelMalFazIsk);
  writeNotNull('genelMalFazTutari', instance.genelMalFazTutari);
  writeNotNull('genelMalFazMiktari', instance.genelMalFazMiktari);
  writeNotNull('genelSatirIsk', instance.genelSatirIsk);
  writeNotNull('genelGenelToplam', instance.genelGenelToplam);
  writeNotNull('genelGenelIskonto', instance.genelGenelIskonto);
  writeNotNull('genelStokSeviyesi', instance.genelStokSeviyesi);
  writeNotNull('genelOlcuBirimi', instance.genelOlcuBirimi);
  writeNotNull('genelDepo', instance.genelDepo);
  writeNotNull('genelCikisDepo', instance.genelCikisDepo);
  writeNotNull('genelGirisDepo', instance.genelGirisDepo);
  writeNotNull('genelDovizTipi', instance.genelDovizTipi);
  writeNotNull('genelTLFiyati', instance.genelTLFiyati);
  writeNotNull('genelIskonto', instance.genelIskonto);
  writeNotNull('genelSeriler', instance.genelSeriler);
  writeNotNull('genelSeri', instance.genelSeri);
  writeNotNull('genelHucreler', instance.genelHucreler);
  writeNotNull('genelBelge', instance.genelBelge);
  writeNotNull('genelCariKodu', instance.genelCariKodu);
  writeNotNull('genelCariAdi', instance.genelCariAdi);
  writeNotNull('genelKalemMiktari', instance.genelKalemMiktari);
  writeNotNull('genelHucre', instance.genelHucre);
  writeNotNull('genelBarkod', instance.genelBarkod);
  writeNotNull('genelKalem', instance.genelKalem);
  writeNotNull('genelGoruntule', instance.genelGoruntule);
  writeNotNull('genelSecenekler', instance.genelSecenekler);
  writeNotNull('genelEkle', instance.genelEkle);
  writeNotNull('genelYenile', instance.genelYenile);
  writeNotNull('genelFiltrele', instance.genelFiltrele);
  writeNotNull('genelSirala', instance.genelSirala);
  writeNotNull('genelEkAciklamalar', instance.genelEkAciklamalar);
  writeNotNull('genelIthalat', instance.genelIthalat);
  writeNotNull('genelYeniBelge', instance.genelYeniBelge);
  writeNotNull('genelYurtici', instance.genelYurtici);
  writeNotNull('genelYurtdisi', instance.genelYurtdisi);
  writeNotNull('genelDevir', instance.genelDevir);
  writeNotNull('genelDepolar', instance.genelDepolar);
  writeNotNull('genelUretim', instance.genelUretim);
  writeNotNull('genelMuhtelif', instance.genelMuhtelif);
  writeNotNull('genelKonsinye', instance.genelKonsinye);
  writeNotNull('genelXRehberi', instance.genelXRehberi);
  writeNotNull('genelAlisIrsaliyesi', instance.genelAlisIrsaliyesi);
  writeNotNull('genelSatisIrsaliyesi', instance.genelSatisIrsaliyesi);
  writeNotNull('genelAlisFaturasi', instance.genelAlisFaturasi);
  writeNotNull('genelSatisFaturasi', instance.genelSatisFaturasi);
  writeNotNull('genelIade', instance.genelIade);
  writeNotNull('genelXGiriniz', instance.genelXGiriniz);
  writeNotNull('genelXSeciniz', instance.genelXSeciniz);
  writeNotNull('genelXSilinsinMi', instance.genelXSilinsinMi);
  writeNotNull('genelKayitSilinsinMi', instance.genelKayitSilinsinMi);
  writeNotNull('genelKaydedilsinMi', instance.genelKaydedilsinMi);
  writeNotNull('genelEksikBilgiler', instance.genelEksikBilgiler);
  writeNotNull('genelMiktarGiriniz', instance.genelMiktarGiriniz);
  writeNotNull('genelDovizSeciniz', instance.genelDovizSeciniz);
  writeNotNull('genelOlcuBirimiSeciniz', instance.genelOlcuBirimiSeciniz);
  writeNotNull('genelPlasiyerSeciniz', instance.genelPlasiyerSeciniz);
  writeNotNull('genelProjeSeciniz', instance.genelProjeSeciniz);
  writeNotNull('genelCariSeciniz', instance.genelCariSeciniz);
  writeNotNull('genelTarihSeciniz', instance.genelTarihSeciniz);
  writeNotNull('genelIthalatTipiSeciniz', instance.genelIthalatTipiSeciniz);
  writeNotNull('genelGirisDepoSeciniz', instance.genelGirisDepoSeciniz);
  writeNotNull('genelGirisVeCikisDepolarAyni', instance.genelGirisVeCikisDepolarAyni);
  writeNotNull('genelAciklamaGiriniz', instance.genelAciklamaGiriniz);
  writeNotNull('genelOzelKod1Seciniz', instance.genelOzelKod1Seciniz);
  writeNotNull('genelOzelKod2Seciniz', instance.genelOzelKod2Seciniz);
  writeNotNull('genelStokSeciniz', instance.genelStokSeciniz);
  writeNotNull('genelHareketTuruSeciniz', instance.genelHareketTuruSeciniz);
  writeNotNull('genelHucreMiktarlariUyumsuz', instance.genelHucreMiktarlariUyumsuz);
  writeNotNull('genelSeriMiktarlariUyumsuz', instance.genelSeriMiktarlariUyumsuz);
  writeNotNull('genelXBulunamadi', instance.genelXBulunamadi);
  writeNotNull('genelMuhasebeKoduSeciniz', instance.genelMuhasebeKoduSeciniz);
  writeNotNull('genelFiyatGiriniz', instance.genelFiyatGiriniz);
  writeNotNull('genelAdet', instance.genelAdet);
  writeNotNull('genelAramaIcinEnAzXHarfGiriniz', instance.genelAramaIcinEnAzXHarfGiriniz);
  writeNotNull('genelAra', instance.genelAra);
  writeNotNull('genelDovizKuru', instance.genelDovizKuru);
  writeNotNull('genelTemizle', instance.genelTemizle);
  writeNotNull('genelFisNo', instance.genelFisNo);
  writeNotNull('genelBelgeTuruSeciniz', instance.genelBelgeTuruSeciniz);
  writeNotNull('genelHucreSeciniz', instance.genelHucreSeciniz);
  writeNotNull('genelHucreBakiyesi', instance.genelHucreBakiyesi);
  writeNotNull('genelIslemBasarili', instance.genelIslemBasarili);
  writeNotNull('genelIslemBasarisiz', instance.genelIslemBasarisiz);
  writeNotNull('genelDepoSeciniz', instance.genelDepoSeciniz);
  writeNotNull('genelBelgeSeciniz', instance.genelBelgeSeciniz);
  writeNotNull('genelBelgeTuru', instance.genelBelgeTuru);
  writeNotNull('genelBelgeTarihi', instance.genelBelgeTarihi);
  writeNotNull('genelIslemMiktari', instance.genelIslemMiktari);
  writeNotNull('genelKaynakHucreSeciniz', instance.genelKaynakHucreSeciniz);
  writeNotNull('genelHedefHucreSeciniz', instance.genelHedefHucreSeciniz);
  writeNotNull('genelKaynakVeHedefHucrelerAyni', instance.genelKaynakVeHedefHucrelerAyni);
  writeNotNull('genelYetersizBakiye', instance.genelYetersizBakiye);
  writeNotNull('genelHedefHucre', instance.genelHedefHucre);
  writeNotNull('genelKaynakHucre', instance.genelKaynakHucre);
  writeNotNull('genelStokAdi', instance.genelStokAdi);
  writeNotNull('genelBakiye', instance.genelBakiye);
  writeNotNull('genelHareketler', instance.genelHareketler);
  writeNotNull('genelDetaylar', instance.genelDetaylar);
  writeNotNull('genelDepoBakiyeDurumu', instance.genelDepoBakiyeDurumu);
  writeNotNull('genelArti', instance.genelArti);
  writeNotNull('genelEksi', instance.genelEksi);
  writeNotNull('genelSifir', instance.genelSifir);
  writeNotNull('genelGrupKodu', instance.genelGrupKodu);
  writeNotNull('genelKod', instance.genelKod);
  writeNotNull('genelXHareketleri', instance.genelXHareketleri);
  writeNotNull('genelArtan', instance.genelArtan);
  writeNotNull('genelAzalan', instance.genelAzalan);
  writeNotNull('genelXDetaylari', instance.genelXDetaylari);
  writeNotNull('genelFiyat', instance.genelFiyat);
  writeNotNull('genelAdi', instance.genelAdi);
  writeNotNull('genelKodu', instance.genelKodu);
  writeNotNull('genelSeriCikistaAktif', instance.genelSeriCikistaAktif);
  writeNotNull('genelSeriGiristeAktif', instance.genelSeriGiristeAktif);
  writeNotNull('genelSeriMiktarKadarSor', instance.genelSeriMiktarKadarSor);
  writeNotNull('genelSeriBakiyeTakibiVar', instance.genelSeriBakiyeTakibiVar);
  writeNotNull('genelAlis', instance.genelAlis);
  writeNotNull('genelSatis', instance.genelSatis);
  writeNotNull('genelSatisFiyati', instance.genelSatisFiyati);
  writeNotNull('genelAlisFiyati', instance.genelAlisFiyati);
  writeNotNull('genelBaslamaTarihi', instance.genelBaslamaTarihi);
  writeNotNull('genelBitisTarihi', instance.genelBitisTarihi);
  writeNotNull('genelSayilanlar', instance.genelSayilanlar);
  writeNotNull('genelMalToplama', instance.genelMalToplama);
  writeNotNull('genelMalKontrol', instance.genelMalKontrol);
  writeNotNull('genelKullaniciyaGonder', instance.genelKullaniciyaGonder);
  writeNotNull('genelDepodaYok', instance.genelDepodaYok);
  writeNotNull('genelToplananMallar', instance.genelToplananMallar);
  writeNotNull('genelMalKontroleGonder', instance.genelMalKontroleGonder);
  writeNotNull('genelTamamlandi', instance.genelTamamlandi);
  writeNotNull('genelIslemiOnayliyorMusunuz', instance.genelIslemiOnayliyorMusunuz);
  writeNotNull('genelTamamla', instance.genelTamamla);
  writeNotNull('genelKullanicilar', instance.genelKullanicilar);
  writeNotNull('genelCariKoduBos', instance.genelCariKoduBos);
  writeNotNull('genelHucreIslemTuruBos', instance.genelHucreIslemTuruBos);
  writeNotNull('genelKullaniciAdiVeyaSifreYanlis', instance.genelKullaniciAdiVeyaSifreYanlis);
  writeNotNull('genelKullaniciKilitliDurumda', instance.genelKullaniciKilitliDurumda);
  writeNotNull('genelStokKoduBos', instance.genelStokKoduBos);
  writeNotNull('genelBelgeZatenKayitli', instance.genelBelgeZatenKayitli);
  writeNotNull('genelKayitYapildi', instance.genelKayitYapildi);
  writeNotNull('genelMusteriSiparisi', instance.genelMusteriSiparisi);
  writeNotNull('genelSaticiSiparisi', instance.genelSaticiSiparisi);
  writeNotNull('genelStokKarti', instance.genelStokKarti);
  writeNotNull('genelYazdir', instance.genelYazdir);
  writeNotNull('genelNetFiyat', instance.genelNetFiyat);
  writeNotNull('genelBrutFiyat', instance.genelBrutFiyat);
  writeNotNull('genelProfilim', instance.genelProfilim);
  writeNotNull('genelKullaniciBulunamadi', instance.genelKullaniciBulunamadi);
  writeNotNull('genelKayitBulunamadi', instance.genelKayitBulunamadi);
  writeNotNull('genelCariEFaturaMukellefidir', instance.genelCariEFaturaMukellefidir);
  writeNotNull('genelCariEArsivMukellefidir', instance.genelCariEArsivMukellefidir);
  writeNotNull('genelCariIleTeslimCariAyniOlamaz', instance.genelCariIleTeslimCariAyniOlamaz);
  writeNotNull('genelYeniBelgeNo', instance.genelYeniBelgeNo);
  writeNotNull('genelStokHareketleri', instance.genelStokHareketleri);
  writeNotNull('genelBelgeKayitliDegisiklikYapilamaz', instance.genelBelgeKayitliDegisiklikYapilamaz);
  writeNotNull('genelBelgeTipi', instance.genelBelgeTipi);
  writeNotNull('genelBelgeTipiSeciniz', instance.genelBelgeTipiSeciniz);
  writeNotNull('genelKasa', instance.genelKasa);
  writeNotNull('genelKasaSeciniz', instance.genelKasaSeciniz);
  writeNotNull('genel15HaneliBelgeGiriniz', instance.genel15HaneliBelgeGiriniz);
  writeNotNull('genelBelgeSerisiniKontrolEdin', instance.genelBelgeSerisiniKontrolEdin);
  writeNotNull('genelTopluDepo', instance.genelTopluDepo);
  writeNotNull('genelXXXSeciniz', instance.genelXXXSeciniz);
  writeNotNull('genelEFatura', instance.genelEFatura);
  writeNotNull('genelEArsiv', instance.genelEArsiv);
  writeNotNull('genelEsnekYapilandirma', instance.genelEsnekYapilandirma);
  writeNotNull('genelYapilandirmaKodu', instance.genelYapilandirmaKodu);
  writeNotNull('genelIslemler', instance.genelIslemler);
  writeNotNull('genelBankaIslemleri', instance.genelBankaIslemleri);
  writeNotNull('genelGelen', instance.genelGelen);
  writeNotNull('genelGonderilen', instance.genelGonderilen);
  writeNotNull('genelBaslama', instance.genelBaslama);
  writeNotNull('genelBitis', instance.genelBitis);
  writeNotNull('genelCariEFTKaydi', instance.genelCariEFTKaydi);
  writeNotNull('bankayaParaGirisi', instance.bankayaParaGirisi);
  writeNotNull('bankadanParaCikisi', instance.bankadanParaCikisi);
  writeNotNull('bankaHesabi', instance.bankaHesabi);
  writeNotNull('hareketDetayi', instance.hareketDetayi);
  writeNotNull('islemTuru', instance.islemTuru);
  writeNotNull('MobilCariEFTIslemi', instance.mobilCariEFTIslemi);
  writeNotNull('MobilHesaplarArasiEFT', instance.mobilHesaplarArasiEFT);
  writeNotNull('MobilHesaplarArasiVirman', instance.mobilHesaplarArasiVirman);
  writeNotNull('XXXBos', instance.xXXBos);
  writeNotNull('Tahsilat', instance.tahsilat);
  writeNotNull('Odeme', instance.odeme);
  writeNotNull('HucreBakiyeDurumu', instance.hucreBakiyeDurumu);
  writeNotNull('HucreHareketleri', instance.hucreHareketleri);
  writeNotNull('SiparisDurumRaporu', instance.siparisDurumRaporu);
  writeNotNull('SiparisDurumRaporuDetay', instance.olustur);
  writeNotNull('faturaTabGenel', instance.faturaTabGenel);
  writeNotNull('faturaTabKalem', instance.faturaTabKalem);
  writeNotNull('faturaTabToplamlar', instance.faturaTabToplamlar);
  writeNotNull('faturaOzelKod1', instance.faturaOzelKod1);
  writeNotNull('faturaOzelKod2', instance.faturaOzelKod2);
  writeNotNull('faturaKosul', instance.faturaKosul);
  writeNotNull('faturaHareketTuru', instance.faturaHareketTuru);
  writeNotNull('faturaCikisYeri', instance.faturaCikisYeri);
  writeNotNull('faturaMasrafKodu', instance.faturaMasrafKodu);
  writeNotNull('faturaFarkliTeslimat', instance.faturaFarkliTeslimat);
  writeNotNull('faturaIthalatTipi', instance.faturaIthalatTipi);
  writeNotNull('faturaIthalatRefNo', instance.faturaIthalatRefNo);
  writeNotNull('faturaIskontoToplami', instance.faturaIskontoToplami);
  writeNotNull('faturaAraToplam', instance.faturaAraToplam);
  writeNotNull('faturaKDVTutari', instance.faturaKDVTutari);
  writeNotNull('faturaMasrafMerkezi', instance.faturaMasrafMerkezi);
  writeNotNull('faturaAnaMalGrubu', instance.faturaAnaMalGrubu);
  writeNotNull('faturaMalGrubu', instance.faturaMalGrubu);
  writeNotNull('faturaSerbest', instance.faturaSerbest);
  writeNotNull('faturaGenelToplamEksiyeDustu', instance.faturaGenelToplamEksiyeDustu);
  writeNotNull('faturaCikisYeriSeciniz', instance.faturaCikisYeriSeciniz);
  writeNotNull('faturaMasrafKoduSeciniz', instance.faturaMasrafKoduSeciniz);
  writeNotNull('faturaFarkliTeslimCariSeciniz', instance.faturaFarkliTeslimCariSeciniz);
  writeNotNull('faturaKalemGiriniz', instance.faturaKalemGiriniz);
  writeNotNull('faturaSeriEFaturaIcinKullaniliyor', instance.faturaSeriEFaturaIcinKullaniliyor);
  writeNotNull('faturaSeriEArsivIcinKullaniliyor', instance.faturaSeriEArsivIcinKullaniliyor);
  writeNotNull('faturaSeriXXXIleBaslamali', instance.faturaSeriXXXIleBaslamali);
  writeNotNull('faturaEFaturaOlusturulmus', instance.faturaEFaturaOlusturulmus);
  writeNotNull('faturaEArsivOlusturulmus', instance.faturaEArsivOlusturulmus);
  writeNotNull('depoGiris', instance.depoGiris);
  writeNotNull('depoCikis', instance.depoCikis);
  writeNotNull('depoKalan', instance.depoKalan);
  writeNotNull('servisKullaniciDogrulamaServisiCalismiyor', instance.servisKullaniciDogrulamaServisiCalismiyor);
  writeNotNull('servisKullaniciDogrulanamadi', instance.servisKullaniciDogrulanamadi);
  writeNotNull('servisOzelKodNoTanimliDegil', instance.servisOzelKodNoTanimliDegil);
  writeNotNull('servisPickerBelgeTuruTanimliDegil', instance.servisPickerBelgeTuruTanimliDegil);
  writeNotNull('servisPickerYetkinizBulunmuyor', instance.servisPickerYetkinizBulunmuyor);
  writeNotNull('servisSunucuHatasi', instance.servisSunucuHatasi);
  writeNotNull('servisYeniBelgeNoAlinamadi', instance.servisYeniBelgeNoAlinamadi);
  return val;
}
