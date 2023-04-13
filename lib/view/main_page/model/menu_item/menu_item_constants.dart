import '../../../../core/constants/grid_constants.dart';
import '../../view/grid_items.dart';

class MenuItemConstants {
  final List<GridItems> _gridItems = [
    //*Cari
    //*
    GridItems.anamenu(name: "CARI", title: "Cari", icon: "", color: GridThemeManager.cari, altMenuler: [
      GridItems.item(name: "cari_CariListesi", title: "Cari Listesi", icon: ""),
      GridItems.item(name: "cari_Aktivite", title: "Cari Aktivite Kayıtları", icon: ""),
      GridItems.altmenu(name: "cari_Raporlar", title: "Raporlar", icon: "", altMenuler: [
        GridItems.item(name: "cari_Rap_Ekstre", title: "Cari Ekstre", icon: ""),
        GridItems.item(name: "cari_Rap_DovizliEkstre", title: "Cari Dövizli Ekstre", icon: ""),
        GridItems.item(name: "cari_Rap_StokEkstre", title: "Stok Ekstresi", icon: ""),
        GridItems.item(name: "cari_Rap_Yaslandirma", title: "Yaşlandırma Raporu", icon: ""),
        GridItems.item(name: "cari_Rap_DovizBakiye", title: "Döviz Bakiye Raporu", icon: ""),
        GridItems.item(name: "cari_Rap_HarDetayliYaslandir", title: "Hareket Detaylı Yaşlandırma Rap.", icon: ""),
        GridItems.item(name: "cari_Rap_StokSatisOzeti", title: "Cari Stok Satış Özeti", icon: ""),
      ])
    ]),
    //*E-Belge
    //*
    GridItems.anamenu(name: "EBEL", title: "E-Belge", icon: "", color: GridThemeManager.eBelge, altMenuler: [
      GridItems.item(name: "ebelge_EIrsaliyeGelenKutusu", title: "Gelen Kutusu", icon: ""),
      GridItems.item(name: "ebelge_EIrsaliyeGidenKutusu", title: "Giden Kutusu", icon: ""),
      GridItems.item(name: "ebelge_EFatCariGuncelle", title: "E-Fatura Carilerini Güncelle ", icon: "")
    ]),
    //*Finans
    //*
    GridItems.anamenu(name: "SEVK", title: "Finans", icon: "", color: GridThemeManager.finans, altMenuler: []),

    //* Genel
    //*
    GridItems.anamenu(name: "GNEL_BEKO", title: "Genel", icon: "", color: GridThemeManager.genel, altMenuler: []),

    //* Hücre Takibi
    //*
    GridItems.anamenu(name: "HTAK", title: "Hücre Takibi", icon: "", color: GridThemeManager.hucreTakibi, altMenuler: []),

    //* Mal Kabul
    //*
    GridItems.anamenu(name: "MKBL", title: "Mal Kabul", icon: "", color: GridThemeManager.malKabul, altMenuler: [
      GridItems.item(name: "malKabul_AlisFaturasi", title: "Alış Faturası", icon: ""),
      GridItems.item(name: "mkbl_MalKabul", title: "Alış İrsaliyesi", icon: ""),
      GridItems.item(name: "malKabul_Mustahsil", title: "Müstahsil Makbuzu", icon: ""),
      GridItems.altmenu(name: "malKabul_AlisIrs_Raporlar", title: "Raporlar", icon: "", altMenuler: [
        GridItems.item(name: "malKabul_AlisIrs_KalemRaporu", title: "Alış İrs. Kalem Raporu", icon: ""),
        GridItems.item(name: "malKabul_AlisFat_KalemRaporu", title: "Alış Fat. Kalem Raporu", icon: ""),
      ]),
    ]),

    //* Sayım
    //*
    GridItems.anamenu(name: "SYIM", title: "Sayım", icon: "", color: GridThemeManager.sayim, altMenuler: []),

    //* Sevkiyat
    //*
    GridItems.anamenu(name: "SEVK", title: "Sevkiyat", icon: "", color: GridThemeManager.sevkiyat, altMenuler: []),

    //* Sipariş
    //*
    GridItems.anamenu(name: "SIPA", title: "Sipariş", icon: "", color: GridThemeManager.siparis, altMenuler: []),

    //* Stok
    //*
    GridItems.anamenu(name: "STOK", title: "Stok", icon: "", color: GridThemeManager.stok, altMenuler: [
      GridItems.item(name: "stok_StokListesi", title: "Stok Listesi", icon: ""),
      GridItems.item(name: "stok_BarkodTanimlama", title: "Barkod Tanımla", icon: ""),
      GridItems.item(name: "stok_FiyatGorEkrani", title: "Fiyat Gör", icon: ""),
      GridItems.item(name: "stok_FiyatGecmisi", title: "Fiyat Geçmişi", icon: ""),
      // TODO [name] Değiştir
      GridItems.item(name: "stok_StokListesi", title: "Yazdır", icon: ""),
      GridItems.altmenu(name: "stok_StokListesi", title: "Seri İşlemleri", icon: "", altMenuler: [
        GridItems.item(name: "stok_SeriHar", title: "Seri Hareketleri", icon: ""),
        // TODO [name] Değiştir
        GridItems.item(name: "stok_StokListesi", title: "Seri Etiketi Yazdır", icon: ""),
      ]),
      GridItems.item(name: "stok_StokListesi", title: "Paketleme", icon: ""),
      GridItems.altmenu(name: "stok_Raporlar", title: "Raporlar", icon: "", altMenuler: [
        GridItems.item(name: "stok_Rap_AmbarMaliyet", title: "Ambar Maliyet Raporu", icon: ""),
        GridItems.item(name: "stok_Rap_LokalDepoBakiye", title: "Lokal Depo Bakiye Raporu", icon: ""),
        GridItems.item(name: "stok_Rap_UrunGrubunaGoreSatis", title: "Ürün Grubuna Göre Satış Grafiği", icon: ""),
      ])
    ]),

    //* Tahsilat & Ödeme
    //*
    GridItems.anamenu(name: "TAHS", title: "Tahsilat & Ödeme", icon: "", color: GridThemeManager.tahsilatOdeme, altMenuler: [
      //TODO [taltek_STEK] sonradan kaldır 
      GridItems.item(name: "taltek_STEK", title: "Satış Teklifi", icon: ""),
    ]),

    //* Talep & Teklif
    //*
    GridItems.anamenu(name: "TEKL", title: "Talep & Teklif", icon: "", color: GridThemeManager.talepTeklif, altMenuler: [
      GridItems.item(name: "taltek_STEK", title: "Satış Teklifi", icon: ""),
      GridItems.item(name: "taltek_STAL", title: "Satın Alma Talebi", icon: ""),
      // TODO [name] Değiştir
      GridItems.item(name: "taltek_STAL", title: "Satış Talebi", icon: ""),
    ]),

    //* Temsilci
    //*
    GridItems.anamenu(name: "TEMS", title: "Temsilci", icon: "", color: GridThemeManager.temsilci, altMenuler: []),

    //* Transfer
    //*
    GridItems.anamenu(name: "TRNS", title: "Transfer", icon: "", color: GridThemeManager.transfer, altMenuler: [
      // GridItems.item(name: "", title: "Depo Transferi", icon: ""),
      // GridItems.item(name: "", title: "Stok Transfer Raporu", icon: ""),
    ]),

    //* Üretim
    //*
    GridItems.anamenu(name: "URET", title: "Üretim", icon: "", color: GridThemeManager.uretim, altMenuler: []),
  ];
  List<GridItems> getList() {
    // grid items içindeki yetkiKontrol true olanları döndür
    return _gridItems.where((element) => element.yetkiKontrol).toList();
  }
}
