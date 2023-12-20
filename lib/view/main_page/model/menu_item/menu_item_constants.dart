import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:kartal/kartal.dart";
import "package:picker/core/components/dialog/bottom_sheet/bottom_sheet_dialog_manager.dart";
import "package:picker/core/components/dialog/bottom_sheet/model/bottom_sheet_model.dart";
import "package:picker/core/constants/enum/edit_tipi_enum.dart";
import "package:picker/core/constants/extensions/widget_extensions.dart";

import "../../../../core/constants/color_palette.dart";
import "../../../../core/constants/enum/serbest_rapor_detay_kod_enum.dart";
import "../../../../core/init/cache/cache_manager.dart";
import "../grid_item_model.dart";
import "../main_page_model.dart";
import "../param_model.dart";

class MenuItemConstants {
  static final MainPageModel? _anaVeri = CacheManager.getAnaVeri;
  static final List<NetFectDizaynList> _serbestRapor = _anaVeri?.paramModel?.netFectDizaynList?.where((NetFectDizaynList element) => element.ozelKod == "Serbest").toList() ?? [];

  static List<GridItemModel> get getGridItemModel =>
      _serbestRapor.map((NetFectDizaynList e) => GridItemModel.serbestRaporlar(name: e.detayKod, title: e.dizaynAdi ?? "", color: ColorPalette.asparagus, arguments: e)).toList();

  static List<GridItemModel> _getSerbestRapor(SerbestRaporDetayKodEnum detayKod) {
    final List<NetFectDizaynList> serbestRaporList = _serbestRapor.where((NetFectDizaynList element) => element.detayKod == detayKod.detayKod).toList();
    if (serbestRaporList.ext.isNullOrEmpty) {
      return [];
    }
    return List.generate(
      _serbestRapor.where((NetFectDizaynList element) => element.detayKod == detayKod.detayKod).length,
      (int index) => GridItemModel.serbestRaporlar(title: serbestRaporList[index].dizaynAdi ?? "", arguments: serbestRaporList[index], color: ColorPalette.asparagus),
    );
  }

  final List<GridItemModel> _gridItemModel = <Object?>[
    //*Cari
    //*
    GridItemModel.anamenu(
      name: "CARI",
      title: "Cari",
      icon: "supervisor",
      color: ColorPalette.ecru,
      altMenuler: <GridItemModel>[
        GridItemModel.item(name: "cari_CariListesi", title: "Cari Listesi", route: "/mainPage/cariListesi", arguments: false),
        //😳 GridItemModel.item(name: "cari_Aktivite", title: "Cari Aktivite Kayıtları"),
        GridItemModel.altmenu(
          name: "cari_Raporlar",
          title: "Raporlar",
          icon: "monitoring",
          altMenuler: <GridItemModel>[
            GridItemModel.item(name: "cari_Rap_Ekstre", title: "Cari Ekstre", route: "/mainPage/cariEkstre"),
            GridItemModel.item(name: "cari_Rap_DovizliEkstre", title: "Cari Dövizli Ekstre", route: "/mainPage/cariDovizliEkstre"),
            GridItemModel.item(name: "cari_Rap_BorcAlacakDokumu", title: "Borç / Alacak Dökümü", route: "/mainPage/cariBorcAlacakDokumu"),
            GridItemModel.item(name: "cari_Rap_StokEkstre", title: "Stok Ekstresi", route: "/mainPage/cariStokEkstre"),
            GridItemModel.item(name: "cari_Rap_Yaslandirma", title: "Yaşlandırma Raporu", route: "/mainPage/cariYaslandirmaRaporu"),
            GridItemModel.item(name: "cari_Rap_DovizBakiye", title: "Döviz Bakiye Raporu", route: "/mainPage/cariDovizBakiyeRaporu"),
            GridItemModel.item(name: "cari_Rap_Hareket", title: "Cari Hareket Raporu", route: "/mainPage/cariHareketRaporu"),
            GridItemModel.item(name: "cari_Rap_HarDetayliYaslandir", title: "Hareket Detaylı Yaşlandırma Rap.", route: "/mainPage/cariHareketDetayliYaslandirmaRaporu"),
            GridItemModel.item(name: "cari_Rap_StokSatisOzeti", title: "Cari Stok Satış Özeti", route: "/mainPage/cariStokSatisOzeti"),
            GridItemModel.item(name: "cari_Raporlar", title: "Ürün Grubuna Göre Satış Grafiği", route: "/mainPage/urunGrubunaGoreSatisGrafigi"),
            ..._getSerbestRapor(SerbestRaporDetayKodEnum.cari),
          ],
        ),
      ],
    ),
    //*E-Belge
    //*
    GridItemModel.anamenu(
      name: "EBEL",
      title: "E-Belge",
      icon: "e_belge",
      color: ColorPalette.marineBlue,
      altMenuler: <GridItemModel>[
        //! UNUTMA BUNU AÇMAYI
        GridItemModel.item(name: "ebelge_EIrsaliyeGelenKutusu", title: "Gelen Kutusu", route: "/mainPage/eBelgeGelenKutusu"), // onTap: () => Get.to(PDFViewerView())),
        GridItemModel.item(name: "ebelge_EIrsaliyeGidenKutusu", title: "Giden Kutusu", route: "/mainPage/eBelgeGidenKutusu"),
        GridItemModel.item(name: "ebelge_EFatCariGuncelle", title: "E-Fatura Carilerini Güncelle "),
      ],
    ),
    //*Finans
    //*
    GridItemModel.anamenu(
      name: "YONE",
      title: "Finans",
      icon: "wallet",
      color: ColorPalette.persianRed,
      altMenuler: <GridItemModel>[
        GridItemModel.altmenu(
          name: null,
          title: "Banka",
          iconData: Icons.account_balance_outlined,
          altMenuler: <Object?>[
            GridItemModel.item(name: "yonetici_Banka_Banka_Litesi", title: "Banka Listesi", route: "/mainPage/bankaListesi"),
            GridItemModel.item(name: "yonetici_Banka_Islemleri", title: "İşlemler", route: "/mainPage/bankaIslemleri"),
          ].whereType<GridItemModel>().toList(),
        ),
        GridItemModel.altmenu(
          name: null,
          title: "Kasa",
          iconData: Icons.point_of_sale_outlined,
          altMenuler: <GridItemModel>[
            GridItemModel.item(name: "finans_Kasa_Listesi", title: "Kasa Listesi", route: "/mainPage/kasaListesi"),
            GridItemModel.item(name: "finans_Kasa_Islemleri", title: "İşlemler", route: "/mainPage/kasaIslemleri"),
            GridItemModel.item(name: "finans_KasalarArasiTransfer", title: "Kasa Transferi", route: "/mainPage/kasaTransferi"),
            GridItemModel.altmenu(
              name: null,
              title: "Raporlar",
              icon: "monitoring",
              altMenuler: <GridItemModel>[
                GridItemModel.item(name: "finans_Raporlar_KasaEkstre", title: "Kasa Ekstre", route: "/mainPage/kasaKasaEkstreRaporu"),
                ..._getSerbestRapor(SerbestRaporDetayKodEnum.kasa),
              ],
            ),
          ],
        ),
        GridItemModel.item(name: "dekont_Listesi", title: "Dekontlar", route: "/mainPage/dekontlarListesi"),
        GridItemModel.altmenu(
          name: null,
          title: "Çek",
          altMenuler: <GridItemModel>[
            GridItemModel.item(name: "finans_Cek_Musteri", title: "Müşteri Çekleri", route: "/mainPage/musteriCekleri"),
            GridItemModel.item(name: "finans_Cek_Borc", title: "Borç Çekleri", route: "/mainPage/borcCekleri"),
            GridItemModel.altmenu(
              name: null,
              title: "Raporlar",
              icon: "monitoring",
              altMenuler: _getSerbestRapor(SerbestRaporDetayKodEnum.cek),
            ),
          ],
        ),
        GridItemModel.altmenu(
          name: null,
          title: "Senet",
          altMenuler: <GridItemModel>[
            GridItemModel.item(name: "finans_Senet_Musteri", title: "Müşteri Senetleri", route: "/mainPage/musteriSenetleri"),
            GridItemModel.item(name: "finans_Senet_Borc", title: "Borç Senetleri", route: "/mainPage/borcSenetleri"),
            GridItemModel.altmenu(
              name: null,
              title: "Raporlar",
              icon: "monitoring",
              altMenuler: _getSerbestRapor(SerbestRaporDetayKodEnum.senet),
            ),
          ],
        ),
        GridItemModel.item(name: null, title: "Tahsilat & Ödeme Kayıtları", route: "/mainPage/tahsilatOdemeKayitlari"),
        GridItemModel.item(name: null, title: "Hızlı Tahsilat Kayıtları"),
        GridItemModel.altmenu(
          name: null,
          title: "Hızlı İşlemler",
          iconData: Icons.tune_outlined,
          altMenuler: <GridItemModel>[
            GridItemModel.item(name: "finans_KKartiTahsilati", title: "Kredi Kartı Tahsilatı", route: "/mainPage/krediKartiTahsilati"),
            GridItemModel.item(name: "finans_Kasa_NakitTahsilat", title: "Nakit Tahsilat", route: "/mainPage/nakitTahsilat"),
            GridItemModel.item(name: "finans_Kasa_SenetTahsilati", title: "Senet Tahsilatı", route: "/mainPage/senetMusteriTahsilat"),
            GridItemModel.item(name: "finans_Kasa_CekTahsilati", title: "Çek Tahsilatı", route: "/mainPage/cekMusteriTahsilat"),
            GridItemModel.item(name: "finans_Kasa_MuhtelifTahsilat", title: "Muhtelif Nakit Tahsilat", route: "/mainPage/muhtelifTahsilat"),
            GridItemModel.item(name: "finans_Kasa_MuhtelifOdeme", title: "Muhtelif Nakit Ödeme", route: "/mainPage/muhtelifOdeme"),
            GridItemModel.item(name: "finans_Kasa_NakitOdeme", title: "Nakit Ödeme", route: "/mainPage/nakitOdeme"),
          ],
        ),
        GridItemModel.item(name: "finans_OrtalamaVadeTarihiHesaplama", title: "Ortalama Vade Tarihi Hesaplama", route: "/mainPage/ortalamaVadeTarihiHesaplama"),
        GridItemModel.altmenu(
          name: null,
          title: "Raporlar",
          icon: "monitoring",
          altMenuler: <GridItemModel>[
            // GridItemModel.item(name: "finans_OzetRapor", title: "Özet Rapor"),
            GridItemModel.item(name: "finans_Raporlar_FinansalDurum", title: "Finansal Durum Raporu", route: "/mainPage/finansFinansalDurumRaporu"),
            GridItemModel.item(name: "finans_Raporlar_AylikMizan", title: "Aylık Mizan Raporu", route: "/mainPage/finansAylikMizanRaporu"),
            ..._getSerbestRapor(SerbestRaporDetayKodEnum.finans),
          ],
        ),
      ],
    ),

    //* Genel
    //*
    GridItemModel.anamenu(
      name: "GNEL_BEKO",
      title: "Genel",
      icon: "settings",
      color: ColorPalette.tomato,
      altMenuler: [
        GridItemModel.item(name: null, title: "Döviz Kurları", route: "/dovizKurlari"),
        GridItemModel.item(name: null, title: "Firmalar", route: "/addCompany"),
        GridItemModel.item(name: null, title: "Oturumlar", route: "/oturumlar").isDebug(),
        GridItemModel.item(name: null, title: "Sürüm Yenilikleri", route: "/mainPage/surumYenilikleri"),
        GridItemModel.item(name: null, title: "Servis İşlemleri", route: "/servisIslemleri"),
      ].whereType<GridItemModel>().toList(),
    ),

    //* Hücre Takibi
    //*
    GridItemModel.anamenu(name: "HTAK", title: "Hücre Takibi", icon: "shelves", color: ColorPalette.skyBlue, altMenuler: <GridItemModel>[]),

    //* Mal Kabul
    //*
    GridItemModel.anamenu(
      name: "MKBL",
      title: "Mal Kabul",
      icon: "pallet",
      color: ColorPalette.coyote,
      altMenuler: <GridItemModel>[
        GridItemModel.item(name: "malKabul_AlisFaturasi", title: "Alış Faturası", route: "/mainPage/malKabulAlisFaturasi"),
        GridItemModel.item(name: "malKabul_SatinAlma", title: "Alış İrsaliyesi", route: "/mainPage/malKabulAlisIrsaliyesi"),
        // GridItemModel.item(name: "mkbl_MalKabul", title: "Alış İrsaliyesi"),
        GridItemModel.item(name: "malKabul_Mustahsil", title: "Müstahsil Makbuzu"),
        GridItemModel.altmenu(
          name: "malKabul_AlisIrs_Raporlar",
          title: "Raporlar",
          icon: "monitoring",
          altMenuler: [
            GridItemModel.item(name: "malKabul_AlisIrs_KalemRaporu", title: "Alış İrs. Kalem Raporu"),
            GridItemModel.item(name: "malKabul_AlisFat_KalemRaporu", title: "Alış Fat. Kalem Raporu"),
          ],
        ),
      ],
    ),

    //* Sayım
    //*
    GridItemModel.anamenu(name: "SYIM", title: "Sayım", icon: "counter", color: ColorPalette.dodgerBlue, altMenuler: <GridItemModel>[]),

    //* Sevkiyat
    //*
    GridItemModel.anamenu(
      name: "SEVK",
      title: "Sevkiyat",
      icon: "forklift",
      color: ColorPalette.mountbattenPink,
      altMenuler: <GridItemModel>[
        GridItemModel.item(name: "sevkiyat_SatisFat", title: "Satış Faturası", route: "/mainPage/sevkiyatSatisFaturasi"),
        GridItemModel.item(name: "sevkiyat_SatisIrsaliyesi", title: "Satış İrsaliyesi", route: "/mainPage/sevkiyatSatisIrsaliyesi"),
        GridItemModel.item(name: "sevkemri_MalToplama", title: "Mal Toplama"),
      ],
    ),

    //* Sipariş
    //*
    GridItemModel.anamenu(
      name: "SIPA",
      title: "Sipariş",
      icon: "order",
      color: ColorPalette.blueGray,
      altMenuler: <GridItemModel>[
        GridItemModel.item(name: "siparis_MusteriSiparisi", title: "Müşteri Siparişleri", route: "/mainPage/siparisMusteriSiparisi"),
        GridItemModel.item(name: "siparis_SaticiSiparisi", title: "Satıcı Siparişleri", route: "/mainPage/siparisSaticiSiparisi"),
        GridItemModel.altmenu(
          name: null,
          title: "Raporlar",
          altMenuler: <GridItemModel>[
            // GridItemModel.item(name: "siparis_MusteriSiparisi_DurumRaporu", title: "Müşteri Siparişi Durum Raporu"),
            GridItemModel.item(
              name: "siparis_MusteriSiparisi_DurumRaporu",
              title: "Müşteri Siparişi Durum Raporu",
              siparisTipi: EditTipiEnum.musteri,
              route: "/mainPage/siparisMusteriSiparisiDurumRaporu",
            ),
            GridItemModel.item(
              name: "siparis_SaticiSiparisi_DurumRaporu",
              title: "Satıcı Siparişi Durum Raporu",
              siparisTipi: EditTipiEnum.satici,
              route: "/mainPage/siparisSaticiSiparisiDurumRaporu",
            ),
            GridItemModel.item(name: "siparis_MusSip_KarlilikRaporu", title: "Sipariş Karlılık Raporu", siparisTipi: EditTipiEnum.musteri, route: "/mainPage/siparisSiparisKarlilikRaporu"),
            GridItemModel.item(
              name: "siparis_MusSip_TeslimRaporu",
              title: "Müşteri Siparişi Teslim Raporu",
              siparisTipi: EditTipiEnum.musteri,
              route: "/mainPage/siparisMusteriSiparisiTeslimRaporu",
            ),
            GridItemModel.item(
              name: "siparis_SaticiSip_TeslimRaporu",
              title: "Satıcı Siparişi Teslim Raporu",
              siparisTipi: EditTipiEnum.satici,
              route: "/mainPage/siparisSaticiSiparisiTeslimRaporu",
            ),
            GridItemModel.item(name: "siparis_MusSip_StokIhtiyacRaporu", title: "Stok İhtiyaç Raporu", route: "/mainPage/siparisStokIhtiyacRaporu"),
            // GridItemModel.item(name: "siparis_SaticiSiparisi_DurumRaporu", title: "Satıcı Sİparişi Durum Raporu", route: "/mainPage/siparisSaticiSiparisiDurumRaporu"),
            // GridItemModel.item(name: "siparis_MusSip_KarlilikRaporu", title: "Sipariş Karlılık Raporu", route: "/mainPage/siparisSiparisKarlikRaporu"),
            // GridItemModel.item(name: "siparis_MusSip_TeslimRaporu", title: "Müşteri Siparişi Teslim Raporu", route: "/mainPage/siparisMusteriSiparisiTeslimRaporu"),
            // GridItemModel.item(name: "siparis_SaticiSip_TeslimRaporu", title: "Satıcı Siparişi Teslim Raporu", route: "/mainPage/siparisSaticiSiparisiTeslimRaporu"),
          ],
        ),
      ],
    ),

    //* Stok
    //*
    GridItemModel.anamenu(
      name: "STOK",
      title: "Stok",
      icon: "inventory",
      color: ColorPalette.mantis,
      altMenuler: <GridItemModel>[
        GridItemModel.item(name: "stok_StokListesi", title: "Stok Listesi", route: "/mainPage/stokListesi"),
        //😳GridItemModel.item(name: "stok_BarkodTanimlama", title: "Barkod Tanımla"),
        GridItemModel.item(name: "stok_FiyatGorEkrani", title: "Fiyat Gör", route: "/mainPage/stokFiyatGor"),
        GridItemModel.item(name: "stok_FiyatGecmisi", title: "Fiyat Geçmişi", route: "/mainPage/stokFiyatGecmisi"),
        GridItemModel.item(name: "stok_StokListesi", title: "Yazdır", route: "/mainPage/stokYazdir"),
        //😳GridItemModel.altmenu(name: "stok_StokListesi", title: "Seri İşlemleri", icon: "inventory", altMenuler: [
        //😳  GridItemModel.item(name: "stok_SeriHar", title: "Seri Hareketleri"),
        //😳  GridItemModel.item(name: "stok_StokListesi", title: "Seri Etiketi Yazdır"),
        //😳]),
        //😳GridItemModel.item(name: "stok_StokListesi", title: "Paketleme"),
        GridItemModel.altmenu(
          name: "stok_Raporlar",
          title: "Raporlar",
          icon: "monitoring",
          altMenuler: <GridItemModel>[
            GridItemModel.item(name: "stok_Rap_AmbarMaliyet", title: "Ambar Maliyet Raporu", route: "/mainPage/stokAmbarMaliyetRaporu"),
            GridItemModel.item(name: "stok_Rap_LokalDepoBakiye", title: "Lokal Depo Bakiye Raporu", route: "/mainPage/stokLokalDepoBakiyeRaporu"),
            GridItemModel.item(name: "stok_Rap_UrunGrubunaGoreSatis", title: "Ürün Grubuna Göre Satış Grafiği", route: "/mainPage/urunGrubunaGoreSatisGrafigi"),
            ..._getSerbestRapor(SerbestRaporDetayKodEnum.stok),
          ],
        ),
      ],
    ),

    //* Tahsilat & Ödeme
    //*
    GridItemModel.anamenu(
      name: "TAHS",
      title: "Tahsilat & Ödeme",
      icon: "atm_dollar",
      color: ColorPalette.pineGreen,
      altMenuler: <GridItemModel>[
        GridItemModel.item(name: "tahsilat_Tahsilatlar", title: "Tahsilat & Ödeme Kayıtları", route: "/mainPage/tahsilatOdemeKayitlari"),
        GridItemModel.item(name: "tahsilat_NakitTahsilat", title: "Nakit Tahsilat", route: "/mainPage/nakitTahsilat"),
        GridItemModel.item(name: "tahsilat_KKartiTahsilat", title: "Kredi Kartı Tahsilatı", route: "/mainPage/krediKartiTahsilati"),
        GridItemModel.item(name: "tahsilat_CekTahsilat", title: "Çek Tahsilatı", route: "/mainPage/cekMusteriTahsilat"),
        GridItemModel.item(name: "tahsilat_SenetTahsilat", title: "Senet Tahsilatı", route: "/mainPage/senetMusteriTahsilat"),
        GridItemModel.item(name: "tahsilat_MuhtelifTahsilat", title: "Muhtelif Tahsilat", route: "/mainPage/muhtelifTahsilat"),
        GridItemModel.item(name: "tahsilat_NakitOdeme", title: "Nakit Ödeme", route: "/mainPage/nakitOdeme"),
        GridItemModel.item(name: "tahsilat_MuhtelifOdeme", title: "Muhtelif Ödeme", route: "/mainPage/muhtelifOdeme"),

        //😳 GridItemModel.item(name: "TAHS_STEK", title: "Satış Teklifi", icon: "atm_dollar"),
      ],
    ),

    //* Talep & Teklif
    //*∑
    GridItemModel.anamenu(
      name: "TEKL",
      title: "Talep & Teklif",
      icon: "offer",
      color: ColorPalette.mulberry,
      altMenuler: <GridItemModel>[
        GridItemModel.item(name: "taltek_STEK", title: "Satış Teklifi", route: "/mainPage/talTekSatisTeklif"),
        GridItemModel.item(name: "taltek_STAL", title: "Satın Alma Talebi", route: "/mainPage/talTekAlisTalep"),
        GridItemModel.item(name: "taltek_STAL", title: "Satış Talebi", route: "/mainPage/talTekSatisTalep"),
      ],
    ),

    //* Temsilci
    //*
    GridItemModel.anamenu(
      name: "TEMS",
      title: "Profilim",
      icon: "profile",
      color: ColorPalette.gamboge,
      altMenuler: <GridItemModel>[
        //? anamenünün onTap'i olmadığı için tek item verdim. Tek item verince direkt onu açıyor. O yüzden parametrelerin bir anlamı yok.
        GridItemModel.item(name: "temsilci_Profil", title: "Profilim", icon: "profile", route: "/mainPage/temsilciProfil"),
      ],
      yetkiListesi: <bool?>[
        CacheManager.getAnaVeri?.paramModel?.plasiyerUygulamasi == true,
      ],
    ),

    //* Transfer
    //*
    GridItemModel.anamenu(
      name: "TRNS",
      title: "Transfer",
      icon: "trolley",
      color: ColorPalette.slateGray,
      altMenuler: <GridItemModel>[
        // GridItemModel.item(name: "", title: "Depo Transferi", icon: ""),
        // GridItemModel.item(name: "", title: "Stok Transfer Raporu", icon: ""),
      ],
    ),

    //* Üretim
    //*
    GridItemModel.anamenu(name: "URET", title: "Üretim", icon: "factory_2", color: ColorPalette.outerSpace, altMenuler: <GridItemModel>[]),
    GridItemModel.anamenu(
      name: "GNEL_SRAP",
      title: "Serbest Raporlar",
      icon: "monitoring",
      color: ColorPalette.asparagus,
      altMenuler: <GridItemModel>[
        ...groupBySerbestRaporList(),
        // ...List.generate(_serbestRapor?.length ?? 0, (index) => GridItemModel.serbestRaporlar(title: _serbestRapor?[index].dizaynAdi ?? "", arguments: _serbestRapor?[index])),
      ],
    ),
  ].whereType<GridItemModel>().toList();

  List<GridItemModel> getList() => _gridItemModel.where((GridItemModel element) => element.yetkiKontrol).toList();

  List<GridItemModel?> getAltMenuList(String name) => getGridItemModel.where((GridItemModel element) => element.name == name).toList();

  static List<GridItemModel> groupBySerbestRaporList() {
    if (_serbestRapor.length >= 16) {
      final Map<String?, GridItemModel> result = groupBy(
        _serbestRapor,
        (NetFectDizaynList obj) => obj.detayKod,
      ).map((String? key, List<NetFectDizaynList> value) {
        if (value.length != 1) {
          return MapEntry(
            key,
            GridItemModel.altmenu(
              name: "stok_Raporlar",
              title: key ?? "",
              altMenuler: List.generate(value.length, (int index) => GridItemModel.serbestRaporlar(title: value[index].dizaynAdi ?? "", arguments: value[index])),
            ),
          );
        } else {
          return MapEntry(
            key,
            GridItemModel.serbestRaporlar(
              title: value[0].dizaynAdi ?? "",
              arguments: value[0],
            ),
          );
        }
      });
      return result.values.sortedBy((GridItemModel element) => element.menuTipi).toList();
    } else {
      return getGridItemModel;
    }
  }

  static Future<void> genelServisIslemleriDialog() async {
    await BottomSheetDialogManager().showBottomSheetDialog(
      Get.context!,
      title: "Servis İşlemleri",
      children: [
        BottomSheetModel(title: "Web Servis Çalışıyor Mu?"),
        BottomSheetModel(title: "Web Servis Çalışıyor Mu?"),
        BottomSheetModel(title: "Web Servis Çalışıyor Mu?"),
        BottomSheetModel(title: "Web Servis Çalışıyor Mu?"),
        BottomSheetModel(title: "Web Servis Çalışıyor Mu?"),
        BottomSheetModel(title: "Web Servis Çalışıyor Mu?"),
        BottomSheetModel(title: "Web Servis Çalışıyor Mu?"),
        BottomSheetModel(title: "Web Servis Çalışıyor Mu?"),
      ],
    );
  }
}
