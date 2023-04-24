import '../../../../core/constants/grid_constants.dart';
import '../../view/grid_items.dart';

class MenuItemConstants {
  final List<GridItems> _gridItems = [
    //*Cari
    //*
    GridItems.anamenu(name: "CARI", title: "Cari", icon: "supervisor", color: GridThemeManager.cari, altMenuler: [
      GridItems.item(name: "cari_CariListesi", title: "Cari Listesi", icon: "Cari"),
      GridItems.item(name: "cari_Aktivite", title: "Cari Aktivite Kayıtları", icon: "Cari"),
      GridItems.altmenu(name: "cari_Raporlar", title: "Raporlar", icon: "Cari", altMenuler: [
        GridItems.item(name: "cari_Rap_Ekstre", title: "Cari Ekstre", icon: "Cari"),
        GridItems.item(name: "cari_Rap_DovizliEkstre", title: "Cari Dövizli Ekstre", icon: "Cari"),
        GridItems.item(name: "cari_Rap_StokEkstre", title: "Stok Ekstresi", icon: "Cari"),
        GridItems.item(name: "cari_Rap_Yaslandirma", title: "Yaşlandırma Raporu", icon: "Cari"),
        GridItems.item(name: "cari_Rap_DovizBakiye", title: "Döviz Bakiye Raporu", icon: "Cari"),
        GridItems.item(name: "cari_Rap_HarDetayliYaslandir", title: "Hareket Detaylı Yaşlandırma Rap.", icon: "Cari"),
        GridItems.item(name: "cari_Rap_StokSatisOzeti", title: "Cari Stok Satış Özeti", icon: "Cari"),
      ])
    ]),
    //*E-Belge
    //*
    GridItems.anamenu(name: "EBEL", title: "E-Belge", icon: "e_belge", color: GridThemeManager.eBelge, altMenuler: [
      GridItems.item(name: "ebelge_EIrsaliyeGelenKutusu", title: "Gelen Kutusu", icon: "Sayim"),
      GridItems.item(name: "ebelge_EIrsaliyeGidenKutusu", title: "Giden Kutusu", icon: "Sayim"),
      GridItems.item(name: "ebelge_EFatCariGuncelle", title: "E-Fatura Carilerini Güncelle ", icon: "Sayim")
    ]),
    //*Finans
    //*
    GridItems.anamenu(name: "SEVK", title: "Finans", icon: "wallet", color: GridThemeManager.finans, altMenuler: []),

    //* Genel
    //*
    GridItems.anamenu(name: "GNEL_BEKO", title: "Genel", icon: "settings", color: GridThemeManager.genel, altMenuler: []),

    //* Hücre Takibi
    //*
    GridItems.anamenu(name: "HTAK", title: "Hücre Takibi", icon: "shelves", color: GridThemeManager.hucreTakibi, altMenuler: []),

    //* Mal Kabul
    //*
    GridItems.anamenu(name: "MKBL", title: "Mal Kabul", icon: "pallet", color: GridThemeManager.malKabul, altMenuler: [
      GridItems.item(name: "malKabul_AlisFaturasi", title: "Alış Faturası", icon: "MalKabul"),
      GridItems.item(name: "mkbl_MalKabul", title: "Alış İrsaliyesi", icon: "MalKabul"),
      GridItems.item(name: "malKabul_Mustahsil", title: "Müstahsil Makbuzu", icon: "MalKabul"),
      GridItems.altmenu(name: "malKabul_AlisIrs_Raporlar", title: "Raporlar", icon: "MalKabul", altMenuler: [
        GridItems.item(name: "malKabul_AlisIrs_KalemRaporu", title: "Alış İrs. Kalem Raporu", icon: "MalKabul"),
        GridItems.item(name: "malKabul_AlisFat_KalemRaporu", title: "Alış Fat. Kalem Raporu", icon: "MalKabul"),
      ]),
    ]),

    //* Sayım
    //*
    GridItems.anamenu(name: "SYIM", title: "Sayım", icon: "counter", color: GridThemeManager.sayim, altMenuler: []),

    //* Sevkiyat
    //*
    GridItems.anamenu(name: "SEVK", title: "Sevkiyat", icon: "forklift", color: GridThemeManager.sevkiyat, altMenuler: []),

    //* Sipariş
    //*
    GridItems.anamenu(name: "SIPA", title: "Sipariş", icon: "order", color: GridThemeManager.siparis, altMenuler: []),

    //* Stok
    //*
    GridItems.anamenu(name: "STOK", title: "Stok", icon: "inventory", color: GridThemeManager.stok, altMenuler: [
      GridItems.item(name: "stok_StokListesi", title: "Stok Listesi"),
      GridItems.item(name: "stok_BarkodTanimlama", title: "Barkod Tanımla"),
      GridItems.item(name: "stok_FiyatGorEkrani", title: "Fiyat Gör"),
      GridItems.item(name: "stok_FiyatGecmisi", title: "Fiyat Geçmişi"),
      // TODO [name] Değiştir
      GridItems.item(name: "stok_StokListesi", title: "Yazdır"),
      GridItems.altmenu(name: "stok_StokListesi", title: "Seri İşlemleri", icon: "inventory", altMenuler: [
        GridItems.item(name: "stok_SeriHar", title: "Seri Hareketleri"),
        // TODO [name] Değiştir
        GridItems.item(name: "stok_StokListesi", title: "Seri Etiketi Yazdır"),
      ]),
      GridItems.item(name: "stok_StokListesi", title: "Paketleme"),
      GridItems.altmenu(name: "stok_Raporlar", title: "Raporlar", icon: "inventory", altMenuler: [
        GridItems.item(name: "stok_Rap_AmbarMaliyet", title: "Ambar Maliyet Raporu"),
        GridItems.item(name: "stok_Rap_LokalDepoBakiye", title: "Lokal Depo Bakiye Raporu"),
        GridItems.item(name: "stok_Rap_UrunGrubunaGoreSatis", title: "Ürün Grubuna Göre Satış Grafiği"),
      ])
    ]),

    //* Tahsilat & Ödeme
    //*
    GridItems.anamenu(name: "TAHS", title: "Tahsilat & Ödeme", icon: "atm_dollar", color: GridThemeManager.tahsilatOdeme, altMenuler: [
      //TODO [taltek_STEK] sonradan kaldır
      GridItems.item(name: "taltek_STEK", title: "Satış Teklifi", icon: "Cuzdan"),
    ]),

    //* Talep & Teklif
    //*
    GridItems.anamenu(name: "TEKL", title: "Talep & Teklif", icon: "offer", color: GridThemeManager.talepTeklif, altMenuler: [
      GridItems.item(name: "taltek_STEK", title: "Satış Teklifi", icon: "Banka"),
      GridItems.item(name: "taltek_STAL", title: "Satın Alma Talebi", icon: "Banka"),
      // TODO [name] Değiştir
      GridItems.item(name: "taltek_STAL", title: "Satış Talebi", icon: "Banka"),
    ]),

    //* Temsilci
    //*
    GridItems.anamenu(name: "TEMS", title: "Temsilci", icon: "profile", color: GridThemeManager.temsilci, altMenuler: []),

    //* Transfer
    //*
    GridItems.anamenu(name: "TRNS", title: "Transfer", icon: "trolley", color: GridThemeManager.transfer, altMenuler: [
      // GridItems.item(name: "", title: "Depo Transferi", icon: ""),
      // GridItems.item(name: "", title: "Stok Transfer Raporu", icon: ""),
    ]),

    //* Üretim
    //*
    GridItems.anamenu(name: "URET", title: "Üretim", icon: "factory", color: GridThemeManager.uretim, altMenuler: []),
  ];
  List<GridItems> getList() {
    // grid items içindeki yetkiKontrol true olanları döndür
    return _gridItems.where((element) => element.yetkiKontrol).toList();
  }
}
