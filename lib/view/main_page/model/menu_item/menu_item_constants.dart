import '../../../../core/constants/grid_constants.dart';
import '../../view/grid_items.dart';

class MenuItemConstants {
  final List<GridItems> _gridItems = [
    //*Cari
    //*
    GridItems.anamenu(name: "CARI", title: "Cari", icon: "supervisor", color: GridThemeManager.cari, altMenuler: [
      GridItems.item(name: "cari_CariListesi", title: "Cari Listesi", route: "/mainPage/cariListesi", arguments: false),
      //😳 GridItems.item(name: "cari_Aktivite", title: "Cari Aktivite Kayıtları"),
      GridItems.altmenu(name: "cari_Raporlar", title: "Raporlar", icon: "monitoring", altMenuler: [
        GridItems.item(name: "cari_Rap_Ekstre", title: "Cari Ekstre", route: "/mainPage/cariEkstre"),
        GridItems.item(name: "cari_Rap_DovizliEkstre", title: "Cari Dövizli Ekstre", route: "/mainPage/cariDovizliEkstre"),
        GridItems.item(name: "cari_Rap_StokEkstre", title: "Stok Ekstresi", route: "/mainPage/cariStokEkstre"),
        GridItems.item(name: "cari_Rap_Yaslandirma", title: "Yaşlandırma Raporu", route: "/mainPage/cariYaslandirmaRaporu"),
        GridItems.item(name: "cari_Rap_DovizBakiye", title: "Döviz Bakiye Raporu", route: "/mainPage/cariDovizBakiyeRaporu"),
        GridItems.item(name: "cari_Rap_Hareket", title: "Cari Hareket Raporu", route: "/mainPage/cariHareketRaporu"),
        GridItems.item(name: "cari_Rap_HarDetayliYaslandir", title: "Hareket Detaylı Yaşlandırma Rap.", route: "/mainPage/cariHareketDetayliYaslandirmaRaporu"),
        GridItems.item(name: "cari_Rap_StokSatisOzeti", title: "Cari Stok Satış Özeti", route: "/mainPage/cariStokSatisOzeti"),
        GridItems.item(name: "stok_Rap_UrunGrubunaGoreSatis", title: "Ürün Grubuna Göre Satış Grafiği", route: "/mainPage/urunGrubunaGoreSatisGrafigi"),
      ])
    ]),
    //*E-Belge
    //*
    GridItems.anamenu(name: "EBEL", title: "E-Belge", icon: "e_belge", color: GridThemeManager.eBelge, altMenuler: [
      //! UNUTMA BUNU AÇMAYI
      //😳GridItems.item(name: "ebelge_EIrsaliyeGelenKutusu", title: "Gelen Kutusu"), // onTap: () => Get.to(PDFViewerView())),
      //😳GridItems.item(name: "ebelge_EIrsaliyeGidenKutusu", title: "Giden Kutusu"),
      //😳GridItems.item(name: "ebelge_EFatCariGuncelle", title: "E-Fatura Carilerini Güncelle ")
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
      //😳GridItems.item(name: "malKabul_AlisFaturasi", title: "Alış Faturası"),
      //😳GridItems.item(name: "mkbl_MalKabul", title: "Alış İrsaliyesi"),
      //😳GridItems.item(name: "malKabul_Mustahsil", title: "Müstahsil Makbuzu"),
      //😳GridItems.altmenu(name: "malKabul_AlisIrs_Raporlar", title: "Raporlar", icon: "monitoring", altMenuler: [
      //😳  GridItems.item(name: "malKabul_AlisIrs_KalemRaporu", title: "Alış İrs. Kalem Raporu"),
      //😳  GridItems.item(name: "malKabul_AlisFat_KalemRaporu", title: "Alış Fat. Kalem Raporu"),
      //😳]),
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
      GridItems.item(name: "stok_StokListesi", title: "Stok Listesi", route: "/mainPage/stokListesi"),
      //😳GridItems.item(name: "stok_BarkodTanimlama", title: "Barkod Tanımla"),
      //😳GridItems.item(name: "stok_FiyatGorEkrani", title: "Fiyat Gör"),
      //😳GridItems.item(name: "stok_FiyatGecmisi", title: "Fiyat Geçmişi"),
      //😳 TODO [name] Değiştir
      //😳GridItems.item(name: "stok_StokListesi", title: "Yazdır"),
      //😳GridItems.altmenu(name: "stok_StokListesi", title: "Seri İşlemleri", icon: "inventory", altMenuler: [
      //😳  GridItems.item(name: "stok_SeriHar", title: "Seri Hareketleri"),
      //😳  // TODO [name] Değiştir
      //😳  GridItems.item(name: "stok_StokListesi", title: "Seri Etiketi Yazdır"),
      //😳]),
      //😳GridItems.item(name: "stok_StokListesi", title: "Paketleme"),
      GridItems.altmenu(name: "stok_Raporlar", title: "Raporlar", icon: "monitoring", altMenuler: [
        GridItems.item(name: "stok_Rap_AmbarMaliyet", title: "Ambar Maliyet Raporu", route: "/mainPage/stokAmbarMaliyetRaporu"),
        GridItems.item(name: "stok_Rap_LokalDepoBakiye", title: "Lokal Depo Bakiye Raporu", route: "/mainPage/stokLokalDepoBakiyeRaporu"),
        GridItems.item(name: "stok_Rap_UrunGrubunaGoreSatis", title: "Ürün Grubuna Göre Satış Grafiği", route: "/mainPage/urunGrubunaGoreSatisGrafigi"),
      ])
    ]),

    //* Tahsilat & Ödeme
    //*
    GridItems.anamenu(name: "TAHS", title: "Tahsilat & Ödeme", icon: "atm_dollar", color: GridThemeManager.tahsilatOdeme, altMenuler: [
      //TODO [taltek_STEK] sonradan kaldır
      //😳GridItems.item(name: "taltek_STEK", title: "Satış Teklifi", icon: "atm_dollar"),
    ]),

    //* Talep & Teklif
    //*
    GridItems.anamenu(name: "TEKL", title: "Talep & Teklif", icon: "offer", color: GridThemeManager.talepTeklif, altMenuler: [
      //😳GridItems.item(name: "taltek_STEK", title: "Satış Teklifi", icon: "offer"),
      //😳GridItems.item(name: "taltek_STAL", title: "Satın Alma Talebi", icon: "offer"),
      //😳 TODO [name] Değiştir
      //😳GridItems.item(name: "taltek_STAL", title: "Satış Talebi", icon: "offer"),
    ]),

    //* Temsilci
    //*
    GridItems.anamenu(name: "TEMS", title: "Profilim", icon: "profile", color: GridThemeManager.temsilci, altMenuler: [
      //? anamenünün onTap'i olmadığı için tek item verdim. Tek item verince direkt onu açıyor. O yüzden parametrelerin bir anlamı yok.
      GridItems.item(name: "taltek_STAL", title: "Profilim", icon: "profile", route: "/mainPage/temsilciProfil"),
    ]),

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
