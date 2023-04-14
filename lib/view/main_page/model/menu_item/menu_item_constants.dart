import '../../../../core/constants/grid_constants.dart';
import '../../view/grid_items.dart';

class MenuItemConstants {
  final List<GridItems> _gridItems = [
    //*Cari
    //*
    GridItems.anamenu(name: "CARI", title: "Cari", icon: "Cari", color: GridThemeManager.cari, altMenuler: [
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
    GridItems.anamenu(name: "EBEL", title: "E-Belge", icon: "Sayim", color: GridThemeManager.eBelge, altMenuler: [
      GridItems.item(name: "ebelge_EIrsaliyeGelenKutusu", title: "Gelen Kutusu", icon: "Sayim"),
      GridItems.item(name: "ebelge_EIrsaliyeGidenKutusu", title: "Giden Kutusu", icon: "Sayim"),
      GridItems.item(name: "ebelge_EFatCariGuncelle", title: "E-Fatura Carilerini Güncelle ", icon: "Sayim")
    ]),
    //*Finans
    //*
    GridItems.anamenu(name: "SEVK", title: "Finans", icon: "Cuzdan", color: GridThemeManager.finans, altMenuler: []),

    //* Genel
    //*
    GridItems.anamenu(name: "GNEL_BEKO", title: "Genel", icon: "Ayarlar", color: GridThemeManager.genel, altMenuler: []),

    //* Hücre Takibi
    //*
    GridItems.anamenu(name: "HTAK", title: "Hücre Takibi", icon: "Sayim", color: GridThemeManager.hucreTakibi, altMenuler: []),

    //* Mal Kabul
    //*
    GridItems.anamenu(name: "MKBL", title: "Mal Kabul", icon: "MalKabul", color: GridThemeManager.malKabul, altMenuler: [
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
    GridItems.anamenu(name: "SYIM", title: "Sayım", icon: "Sayim", color: GridThemeManager.sayim, altMenuler: []),

    //* Sevkiyat
    //*
    GridItems.anamenu(name: "SEVK", title: "Sevkiyat", icon: "Kamyon", color: GridThemeManager.sevkiyat, altMenuler: []),

    //* Sipariş
    //*
    GridItems.anamenu(name: "SIPA", title: "Sipariş", icon: "Siparis", color: GridThemeManager.siparis, altMenuler: []),

    //* Stok
    //*
    GridItems.anamenu(name: "STOK", title: "Stok", icon: "Stok", color: GridThemeManager.stok, altMenuler: [
      GridItems.item(name: "stok_StokListesi", title: "Stok Listesi", icon: "MalKabul"),
      GridItems.item(name: "stok_BarkodTanimlama", title: "Barkod Tanımla", icon: "MalKabul"),
      GridItems.item(name: "stok_FiyatGorEkrani", title: "Fiyat Gör", icon: "MalKabul"),
      GridItems.item(name: "stok_FiyatGecmisi", title: "Fiyat Geçmişi", icon: "MalKabul"),
      // TODO [name] Değiştir
      GridItems.item(name: "stok_StokListesi", title: "Yazdır", icon: "MalKabul"),
      GridItems.altmenu(name: "stok_StokListesi", title: "Seri İşlemleri", icon: "MalKabul", altMenuler: [
        GridItems.item(name: "stok_SeriHar", title: "Seri Hareketleri", icon: "MalKabul"),
        // TODO [name] Değiştir
        GridItems.item(name: "stok_StokListesi", title: "Seri Etiketi Yazdır", icon: "MalKabul"),
      ]),
      GridItems.item(name: "stok_StokListesi", title: "Paketleme", icon: "MalKabul"),
      GridItems.altmenu(name: "stok_Raporlar", title: "Raporlar", icon: "MalKabul", altMenuler: [
        GridItems.item(name: "stok_Rap_AmbarMaliyet", title: "Ambar Maliyet Raporu", icon: "MalKabul"),
        GridItems.item(name: "stok_Rap_LokalDepoBakiye", title: "Lokal Depo Bakiye Raporu", icon: "MalKabul"),
        GridItems.item(name: "stok_Rap_UrunGrubunaGoreSatis", title: "Ürün Grubuna Göre Satış Grafiği", icon: "MalKabul"),
      ])
    ]),

    //* Tahsilat & Ödeme
    //*
    GridItems.anamenu(name: "TAHS", title: "Tahsilat & Ödeme", icon: "Cuzdan", color: GridThemeManager.tahsilatOdeme, altMenuler: [
      //TODO [taltek_STEK] sonradan kaldır
      GridItems.item(name: "taltek_STEK", title: "Satış Teklifi", icon: "Cuzdan"),
    ]),

    //* Talep & Teklif
    //*
    GridItems.anamenu(name: "TEKL", title: "Talep & Teklif", icon: "Banka", color: GridThemeManager.talepTeklif, altMenuler: [
      GridItems.item(name: "taltek_STEK", title: "Satış Teklifi", icon: "Banka"),
      GridItems.item(name: "taltek_STAL", title: "Satın Alma Talebi", icon: "Banka"),
      // TODO [name] Değiştir
      GridItems.item(name: "taltek_STAL", title: "Satış Talebi", icon: "Banka"),
    ]),

    //* Temsilci
    //*
    GridItems.anamenu(name: "TEMS", title: "Temsilci", icon: "ElSikisma", color: GridThemeManager.temsilci, altMenuler: []),

    //* Transfer
    //*
    GridItems.anamenu(name: "TRNS", title: "Transfer", icon: "Transpalet", color: GridThemeManager.transfer, altMenuler: [
      // GridItems.item(name: "", title: "Depo Transferi", icon: ""),
      // GridItems.item(name: "", title: "Stok Transfer Raporu", icon: ""),
    ]),

    //* Üretim
    //*
    GridItems.anamenu(name: "URET", title: "Üretim", icon: "MalKabul", color: GridThemeManager.uretim, altMenuler: []),
  ];
  List<GridItems> getList() {
    // grid items içindeki yetkiKontrol true olanları döndür
    return _gridItems.where((element) => element.yetkiKontrol).toList();
  }
}
