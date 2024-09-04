import "package:get/get.dart";
import "package:hive_flutter/hive_flutter.dart";

import "../../../view/main_page/alt_sayfalar/siparis/base_siparis_edit/model/base_siparis_edit_model.dart";
import "../../../view/main_page/model/param_model.dart";
import "../../init/cache/cache_manager.dart";
import "../yetki_controller/yetki_controller.dart";

part "edit_tipi_enum.g.dart";

@HiveType(typeId: 79)
enum EditTipiEnum {
  @HiveField(0)
  musteri,
  @HiveField(1)
  satici,
  @HiveField(2)
  satisFatura,
  @HiveField(3)
  satisIrsaliye,
  @HiveField(4)
  alisFatura,
  @HiveField(5)
  alisIrsaliye,
  @HiveField(6)
  satisTeklifi,
  @HiveField(7)
  alisTalebi,
  @HiveField(8)
  satisTalebi,
  @HiveField(9)
  depoTransferi,
  @HiveField(10)
  ambarGirisi,
  @HiveField(11)
  ambarCikisi,
  @HiveField(12)
  cari,
  @HiveField(13)
  isEmri,
  @HiveField(14)
  altIsEmri,
  @HiveField(15)
  isEmriTakip,
  @HiveField(16)
  uretimSonuKaydi,
  @HiveField(17)
  olcumdenDepoTransferi,
  @HiveField(18)
  uretim,
  @HiveField(19)
  paket,
  @HiveField(20)
  belgesizIslem,
  ;
}

extension NullableEditTipiEnumExtension on EditTipiEnum? {
  bool get musteriMi => this == EditTipiEnum.musteri;

  bool get saticiMi => this == EditTipiEnum.satici;

  bool get satisFaturasiMi => this == EditTipiEnum.satisFatura;

  bool get satisIrsaliyesiMi => this == EditTipiEnum.satisIrsaliye;

  bool get alisFaturasiMi => this == EditTipiEnum.alisFatura;

  bool get olcumdenDepoTransferiMi => this == EditTipiEnum.olcumdenDepoTransferi;

  bool get alisIrsaliyesiMi => this == EditTipiEnum.alisIrsaliye;

  bool get satisTeklifiMi => this == EditTipiEnum.satisTeklifi;

  bool get alisTalebiMi => this == EditTipiEnum.alisTalebi;

  bool get satisTalebiMi => this == EditTipiEnum.satisTalebi;

  bool get depoTransferiMi => this == EditTipiEnum.depoTransferi || this == EditTipiEnum.olcumdenDepoTransferi;

  bool get ambarGirisiMi => this == EditTipiEnum.ambarGirisi;

  bool get ambarCikisiMi => this == EditTipiEnum.ambarCikisi;

  bool get ambarFisiMi => this == EditTipiEnum.ambarGirisi || this == EditTipiEnum.ambarCikisi;

  bool get talepTeklifMi => satisTalebiMi || alisTalebiMi || satisTeklifiMi;

  bool get irsaliyeMi => satisIrsaliyesiMi || alisIrsaliyesiMi;

  bool get talepKalemlerFiltrele => alisTalebiMi || satisTalebiMi;

  bool get siparisMi => musteriMi || saticiMi;

  bool get faturaMi => satisFaturasiMi || alisFaturasiMi;

  bool get kalemSecilecekMi {
    if (this == null) return false;
    switch (this!) {
      case EditTipiEnum.satisFatura:
      case EditTipiEnum.satisIrsaliye:
      case EditTipiEnum.alisFatura:
      case EditTipiEnum.alisIrsaliye:
        return true;
      default:
        return false;
    }
  }

  int get kademeliIskontoSayisi {
    if (this == null) return 0;
    switch (this!) {
      case EditTipiEnum.satici:
      case EditTipiEnum.alisFatura:
      case EditTipiEnum.alisIrsaliye:
      case EditTipiEnum.ambarGirisi:
        return YetkiController().alisKademeliIskontoSayisi;
      case EditTipiEnum.musteri:
      case EditTipiEnum.satisFatura:
      case EditTipiEnum.satisIrsaliye:
      case EditTipiEnum.ambarCikisi:
        return YetkiController().satisKademeliIskontoSayisi;
      case EditTipiEnum.alisTalebi:
      case EditTipiEnum.satisTeklifi:
      case EditTipiEnum.satisTalebi:
        return YetkiController().talTekSatirKademeliIskontoSayisi(this?.rawValue ?? "");
      case EditTipiEnum.depoTransferi:
      case EditTipiEnum.olcumdenDepoTransferi:
      case EditTipiEnum.cari:
      case EditTipiEnum.isEmri:
      case EditTipiEnum.altIsEmri:
      case EditTipiEnum.isEmriTakip:
      case EditTipiEnum.uretimSonuKaydi:
      case EditTipiEnum.uretim:
      case EditTipiEnum.paket:
      case EditTipiEnum.belgesizIslem:
        return 0;
    }
  }
}

extension EditTipiEnumExtension on EditTipiEnum {
  static YetkiController yetkiController = YetkiController();

  String get rawValue {
    switch (this) {
      case EditTipiEnum.musteri:
        return "MS";
      case EditTipiEnum.satici:
        return "SS";
      case EditTipiEnum.satisFatura:
        return "SF";
      case EditTipiEnum.satisIrsaliye:
        return "SI";
      case EditTipiEnum.alisFatura:
        return "AF";
      case EditTipiEnum.alisIrsaliye:
        return "AI";
      case EditTipiEnum.satisTeklifi:
        return "STEK";
      case EditTipiEnum.alisTalebi:
        return "ATAL";
      case EditTipiEnum.satisTalebi:
        return "STAL";
      case EditTipiEnum.depoTransferi:
      case EditTipiEnum.olcumdenDepoTransferi:
        return "DC";
      case EditTipiEnum.ambarGirisi:
        return "AG";
      case EditTipiEnum.ambarCikisi:
        return "AC";
      case EditTipiEnum.isEmri:
        return "IE";
      case EditTipiEnum.altIsEmri:
        return "AIE";
      case EditTipiEnum.isEmriTakip:
        return "TKP";
      case EditTipiEnum.uretimSonuKaydi:
      //* Hücre yerleştirme sayfası için eklendi
      case EditTipiEnum.uretim:
        return "USK";
      case EditTipiEnum.cari:
        return "";

      //? Bu ikisinin değeri elle girildi. Gerçek bir değer değil.
      case EditTipiEnum.paket:
        return "PAK";
      case EditTipiEnum.belgesizIslem:
        return "BI";
    }
  }

  String get getName {
    switch (this) {
      case EditTipiEnum.musteri:
        return "Müşteri Siparişi";
      case EditTipiEnum.satici:
        return "Satıcı Siparişi";
      case EditTipiEnum.satisFatura:
        return "Satış Faturası";
      case EditTipiEnum.satisIrsaliye:
        return "Satış İrsaliyesi";
      case EditTipiEnum.alisFatura:
        return "Alış Faturası";
      case EditTipiEnum.alisIrsaliye:
        return "Alış İrsaliyesi";
      case EditTipiEnum.satisTeklifi:
        return "Satış Teklifi";
      case EditTipiEnum.alisTalebi:
        return "Alış Talebi";
      case EditTipiEnum.satisTalebi:
        return "Satış Talebi";
      case EditTipiEnum.depoTransferi:
      case EditTipiEnum.olcumdenDepoTransferi:
        return "Depo Transferi";
      case EditTipiEnum.ambarGirisi:
        return "Ambar Giriş Fişi";
      case EditTipiEnum.ambarCikisi:
        return "Ambar Çıkış Fişi";
      case EditTipiEnum.isEmri:
        return "İş Emri";
      case EditTipiEnum.altIsEmri:
        return "Alt İş Emri";
      case EditTipiEnum.isEmriTakip:
        return "İş Emri Takibi";
      case EditTipiEnum.uretimSonuKaydi:
        return "Üretim Sonu Kaydı";
      case EditTipiEnum.cari:
        return "Cari";
      case EditTipiEnum.uretim:
        return "Üretim";
      case EditTipiEnum.paket:
        return "Paket";
      case EditTipiEnum.belgesizIslem:
        return "Belgesiz İşlem";
    }
  }

  String get getPrintValue {
    switch (this) {
      case EditTipiEnum.musteri:
        return "MusteriSiparisi";
      case EditTipiEnum.satici:
        return "SaticiSiparisi";
      case EditTipiEnum.satisFatura:
        return "SatisFaturasi";
      case EditTipiEnum.satisIrsaliye:
        return "SatisIrsaliyesi";
      case EditTipiEnum.alisFatura:
        return "AlisFaturasi";
      case EditTipiEnum.alisIrsaliye:
        return "AlisIrsaliyesi";
      case EditTipiEnum.satisTeklifi:
        return "SatisTeklifi";
      case EditTipiEnum.alisTalebi:
        return "AlisTalebi";
      case EditTipiEnum.satisTalebi:
        return "SatisTalebi";
      case EditTipiEnum.depoTransferi:
      case EditTipiEnum.olcumdenDepoTransferi:
        return "DepoTransferi";
      //TODO Aşağıdaki veriler yalnız onları düzelt.
      case EditTipiEnum.ambarGirisi:
        return "AmbarGirisi";
      case EditTipiEnum.ambarCikisi:
        return "AmbarCikisi";
      //TODO
      case EditTipiEnum.isEmri:
      case EditTipiEnum.altIsEmri:
      case EditTipiEnum.isEmriTakip:
      case EditTipiEnum.uretimSonuKaydi:
      case EditTipiEnum.cari:
      case EditTipiEnum.uretim:
      case EditTipiEnum.paket:
      case EditTipiEnum.belgesizIslem:
        return "";
    }
  }

  bool get yazdirilsinMi {
    switch (this) {
      case EditTipiEnum.musteri:
        return yetkiController.yazdirmaMusSip;
      case EditTipiEnum.satici:
        return yetkiController.yazdirmaSaticiSip;
      case EditTipiEnum.satisFatura:
        return yetkiController.yazdirmaSaticiSip;
      case EditTipiEnum.satisIrsaliye:
        return yetkiController.yazdirmaSatisIrs;
      case EditTipiEnum.alisFatura:
        return yetkiController.yazdirmaAlisFat;
      case EditTipiEnum.alisIrsaliye:
        return yetkiController.yazdirmaAlisIrs;
      case EditTipiEnum.satisTeklifi:
        return yetkiController.yazdirmaSatisTeklifi;
      case EditTipiEnum.satisTalebi:
        return yetkiController.yazdirmaSatisTalebi;
      case EditTipiEnum.depoTransferi:
      case EditTipiEnum.olcumdenDepoTransferi:
        return yetkiController.yazdirmaDepoTransferi;
      case EditTipiEnum.ambarGirisi:
        return yetkiController.yazdirmaAmbarGirisi;
      case EditTipiEnum.ambarCikisi:
        return yetkiController.yazdirmaAmbarCikisi;
      case EditTipiEnum.alisTalebi:
      //TODO
      case EditTipiEnum.isEmri:
      case EditTipiEnum.altIsEmri:
      case EditTipiEnum.isEmriTakip:
      case EditTipiEnum.uretimSonuKaydi:
      case EditTipiEnum.cari:
      case EditTipiEnum.uretim:
      case EditTipiEnum.paket:
      case EditTipiEnum.belgesizIslem:
        return false;
    }
  }

  bool degistirilmeyecekAlanlar(String value) {
    switch (this) {
      case EditTipiEnum.depoTransferi:
      case EditTipiEnum.olcumdenDepoTransferi:
        return yetkiController.transferLokalDatDegistirilmeyecekAlanlar(value);
      case EditTipiEnum.ambarGirisi:
        return yetkiController.transferLokalAgDegistirilmeyecekAlanlar(value);
      case EditTipiEnum.ambarCikisi:
        return yetkiController.transferLokalAcDegistirilmeyecekAlanlar(value);
      default:
        return false;
    }
  }

  bool bosGecilmeyecekAlanlar(String value) {
    switch (this) {
      case EditTipiEnum.depoTransferi:
      case EditTipiEnum.olcumdenDepoTransferi:
        return yetkiController.transferLokalDatBosGecilmeyecekAlanlar(value);
      case EditTipiEnum.ambarGirisi:
        return yetkiController.transferLokalAgBosGecilmeyecekAlanlar(value);
      case EditTipiEnum.ambarCikisi:
        return yetkiController.transferLokalAcBosGecilmeyecekAlanlar(value);
      default:
        return false;
    }
  }

  bool gizlenecekAlanlar(String value) {
    switch (this) {
      case EditTipiEnum.depoTransferi:
      case EditTipiEnum.olcumdenDepoTransferi:
        return yetkiController.transferLokalDatGizlenecekAlanlar(value);
      case EditTipiEnum.ambarGirisi:
        return yetkiController.transferLokalAgGizlenecekAlanlar(value);
      case EditTipiEnum.ambarCikisi:
        return yetkiController.transferLokalAcGizlenecekAlanlar(value);
      default:
        return false;
    }
  }

  bool aciklamalarGorunecekMi(int value) {
    switch (this) {
      case EditTipiEnum.depoTransferi:
      case EditTipiEnum.olcumdenDepoTransferi:
        return true;
      case EditTipiEnum.ambarGirisi:
        return yetkiController.transferLokalAgAciklamaAlanlari(value);
      case EditTipiEnum.ambarCikisi:
        return yetkiController.transferLokalAcAciklamaAlanlari(value);
      default:
        return false;
    }
  }

  bool get kopyalanabilirMi {
    switch (this) {
      case EditTipiEnum.musteri:
        return yetkiController.kopyalaMusSip;
      case EditTipiEnum.alisTalebi:
        return yetkiController.kopyalaAlisTalebi;
      case EditTipiEnum.ambarGirisi:
        return yetkiController.kopyalaAmbarGirisi;
      case EditTipiEnum.ambarCikisi:
        return yetkiController.kopyalaAmbarCikisi;

      case EditTipiEnum.cari:
      case EditTipiEnum.satisFatura:
      case EditTipiEnum.satisIrsaliye:
      case EditTipiEnum.satisTeklifi:
      case EditTipiEnum.satisTalebi:
      case EditTipiEnum.depoTransferi:
      case EditTipiEnum.olcumdenDepoTransferi:
      case EditTipiEnum.satici:
      case EditTipiEnum.alisFatura:
      case EditTipiEnum.alisIrsaliye:
      //TODO
      case EditTipiEnum.isEmri:
      case EditTipiEnum.altIsEmri:
      case EditTipiEnum.isEmriTakip:
      case EditTipiEnum.uretimSonuKaydi:
      case EditTipiEnum.uretim:
      case EditTipiEnum.paket:
      case EditTipiEnum.belgesizIslem:
        return false;
    }
  }

  bool get aciklamaDuzenlensinMi {
    switch (this) {
      case EditTipiEnum.depoTransferi:
      case EditTipiEnum.olcumdenDepoTransferi:
        return yetkiController.transferDatAciklamaDuzenle;
      case EditTipiEnum.ambarGirisi:
        return yetkiController.transferAgAciklamaDuzenle;
      case EditTipiEnum.ambarCikisi:
        return yetkiController.transferAcAciklamaDuzenle;
      default:
        return false;
    }
  }

  bool get cariKoduDegisirMi {
    switch (this) {
      case EditTipiEnum.musteri:
        return yetkiController.cariKoduDegistirMusSip;
      case EditTipiEnum.satici:
        return yetkiController.cariKoduDegistirSaticiSip;
      case EditTipiEnum.satisFatura:
        return yetkiController.cariKoduDegistirSaticiSip;
      case EditTipiEnum.satisIrsaliye:
        return yetkiController.cariKoduDegistirSatisIrs;
      case EditTipiEnum.alisFatura:
        return yetkiController.cariKoduDegistirAlisFat;
      case EditTipiEnum.alisIrsaliye:
        return yetkiController.cariKoduDegistirAlisIrs;
      case EditTipiEnum.satisTeklifi:
        return yetkiController.cariKoduDegistirSatisTeklifi;
      case EditTipiEnum.alisTalebi:
        return yetkiController.cariKoduDegistirAlisTalebi;
      case EditTipiEnum.satisTalebi:
        return yetkiController.cariKoduDegistirSatisTalebi;
      case EditTipiEnum.depoTransferi:
      case EditTipiEnum.olcumdenDepoTransferi:
      case EditTipiEnum.ambarGirisi:
      case EditTipiEnum.ambarCikisi:
      case EditTipiEnum.cari:
      //TODO
      case EditTipiEnum.isEmri:
      case EditTipiEnum.altIsEmri:
      case EditTipiEnum.isEmriTakip:
      case EditTipiEnum.uretimSonuKaydi:
      case EditTipiEnum.uretim:
      case EditTipiEnum.paket:
      case EditTipiEnum.belgesizIslem:
        return false;
    }
  }

  bool get belgeKapatabilirMi {
    switch (this) {
      case EditTipiEnum.musteri:
        return yetkiController.belgeKapatMusSip;
      case EditTipiEnum.satici:
        return yetkiController.belgeKapatSaticiSip;
      default:
        return false;
    }
  }

  bool get satisMi {
    switch (this) {
      case EditTipiEnum.musteri:
      case EditTipiEnum.satisFatura:
      case EditTipiEnum.satisIrsaliye:
      case EditTipiEnum.satisTeklifi:
      case EditTipiEnum.satisTalebi:
      case EditTipiEnum.depoTransferi:
      case EditTipiEnum.olcumdenDepoTransferi:
      case EditTipiEnum.ambarCikisi:
        return true;
      case EditTipiEnum.satici:
      case EditTipiEnum.alisFatura:
      case EditTipiEnum.alisIrsaliye:
      case EditTipiEnum.alisTalebi:
      case EditTipiEnum.ambarGirisi:
      case EditTipiEnum.cari:
      case EditTipiEnum.isEmri:
      case EditTipiEnum.altIsEmri:
      case EditTipiEnum.isEmriTakip:
      case EditTipiEnum.uretimSonuKaydi:
      case EditTipiEnum.uretim:
      case EditTipiEnum.paket:
      case EditTipiEnum.belgesizIslem:
        return false;
    }
  }

  bool get eIrsaliyeIsaretleyemesin {
    switch (this) {
      case EditTipiEnum.depoTransferi:
      case EditTipiEnum.olcumdenDepoTransferi:
        return yetkiController.transferDatEIrsaliyeIsaretleyemesin;
      case EditTipiEnum.ambarCikisi:
        return yetkiController.transferAcEIrsaliyeIsaretleyemesin;
      default:
        return false;
    }
  }

  bool get talepTeklifMi {
    switch (this) {
      case EditTipiEnum.satisTeklifi:
      case EditTipiEnum.alisTalebi:
      case EditTipiEnum.satisTalebi:
        return true;
      default:
        return false;
    }
  }

  bool get digerSekmesiGoster {
    switch (this) {
      case EditTipiEnum.musteri:
      case EditTipiEnum.satici:
        return yetkiController.siparisDigerSekmesiGoster;
      case EditTipiEnum.satisFatura:
        return yetkiController.satisFatDigerSekmesiGelsin;
      case EditTipiEnum.satisIrsaliye:
        return yetkiController.satisIrsDigerSekmesiGelsin;
      case EditTipiEnum.alisFatura:
        return yetkiController.alisFatDigerSekmesiGelsin;
      case EditTipiEnum.alisIrsaliye:
        return yetkiController.alisIrsDigerSekmesiGelsin;
      case EditTipiEnum.depoTransferi:
      case EditTipiEnum.olcumdenDepoTransferi:
        return yetkiController.transferDatDigerSekmesiGoster;
      case EditTipiEnum.ambarGirisi:
        return yetkiController.transferAgDigerSekmesiGoster;
      case EditTipiEnum.ambarCikisi:
        return yetkiController.transferAcDigerSekmesiGoster;
      default:
        return true;
    }
  }

  bool get siparisBaglantisiGoster {
    switch (this) {
      case EditTipiEnum.depoTransferi:
      case EditTipiEnum.olcumdenDepoTransferi:
        return yetkiController.transferLokalDatSiparisBaglantisi;
      case EditTipiEnum.ambarGirisi:
        return yetkiController.transferAgSiparisBaglantisi;
      case EditTipiEnum.ambarCikisi:
        return yetkiController.transferAcSiparisBaglantisi;
      case EditTipiEnum.isEmri:
      case EditTipiEnum.altIsEmri:
      default:
        return true;
    }
  }

  bool get siparisBaglantisiOpsiyonelMi {
    switch (this) {
      case EditTipiEnum.depoTransferi:
      case EditTipiEnum.olcumdenDepoTransferi:
        return yetkiController.transferLokalDatSiparisBaglantisiOpsiyonelMi;
      case EditTipiEnum.ambarGirisi:
        return yetkiController.transferAgSiparisBaglantisiOpsiyonelMi;
      case EditTipiEnum.ambarCikisi:
        return yetkiController.transferAcSiparisBaglantisiOpsiyonelMi;
      case EditTipiEnum.isEmri:
      case EditTipiEnum.altIsEmri:
      default:
        return true;
    }
  }

  bool get ekAlan1GorunsunMu {
    if (talepTeklifMi) {
      return false;
    }
    if (satisMi) {
      return yetkiController.satisEkAlan1AktifMi;
    } else {
      return yetkiController.alisEkAlan1AktifMi;
    }
  }

  bool get ekAlan2GorunsunMu {
    if (talepTeklifMi) {
      return false;
    }
    if (satisMi) {
      return yetkiController.satisEkAlan2AktifMi;
    } else {
      return yetkiController.alisEkAlan2AktifMi;
    }
  }

  bool get eklensinMi {
    switch (this) {
      case EditTipiEnum.musteri:
        return yetkiController.siparisMSKaydet;
      case EditTipiEnum.satici:
        return yetkiController.siparisSSKaydet;
      case EditTipiEnum.satisFatura:
        return yetkiController.satisFatEkle;
      case EditTipiEnum.satisIrsaliye:
        return yetkiController.satisIrsEkle;
      case EditTipiEnum.alisFatura:
        return yetkiController.alisFatEkle;
      case EditTipiEnum.alisIrsaliye:
        return yetkiController.alisIrsEkle;
      case EditTipiEnum.satisTeklifi:
        return yetkiController.satisTeklifiEkle;
      case EditTipiEnum.alisTalebi:
        return yetkiController.alisTalebiEkle;
      case EditTipiEnum.satisTalebi:
        return yetkiController.satisTalebiEkle;
      case EditTipiEnum.depoTransferi:
      case EditTipiEnum.olcumdenDepoTransferi:
        return yetkiController.transferDatEkle;
      case EditTipiEnum.ambarGirisi:
        return yetkiController.transferAGEkle;
      case EditTipiEnum.ambarCikisi:
        return yetkiController.transferACEkle;
      case EditTipiEnum.cari:
        return yetkiController.cariKartiYeniKayit; //TODO
      case EditTipiEnum.isEmri:
      case EditTipiEnum.altIsEmri:
      case EditTipiEnum.isEmriTakip:
      case EditTipiEnum.uretimSonuKaydi:
      case EditTipiEnum.uretim:
      case EditTipiEnum.paket:
      case EditTipiEnum.belgesizIslem:
        return false;
    }
  }

  bool get duzenlensinMi {
    switch (this) {
      case EditTipiEnum.musteri:
        return yetkiController.siparisMSDuzelt;
      case EditTipiEnum.satici:
        return yetkiController.siparisSSDuzelt;
      case EditTipiEnum.satisFatura:
        return yetkiController.satisFatDuzenle;
      case EditTipiEnum.satisIrsaliye:
        return yetkiController.satisIrsDuzenle;
      case EditTipiEnum.alisFatura:
        return yetkiController.alisFatDuzenle;
      case EditTipiEnum.alisIrsaliye:
        return yetkiController.alisIrsDuzenle;
      case EditTipiEnum.satisTeklifi:
        return yetkiController.satisTeklifiDuzenle;
      case EditTipiEnum.alisTalebi:
        return yetkiController.alisTalebiDuzenle;
      case EditTipiEnum.satisTalebi:
        return yetkiController.satisTalebiDuzenle;
      case EditTipiEnum.depoTransferi:
      case EditTipiEnum.olcumdenDepoTransferi:
        return yetkiController.transferDatDuzenle;
      case EditTipiEnum.ambarGirisi:
        return yetkiController.transferAGDuzenle;
      case EditTipiEnum.ambarCikisi:
        return yetkiController.transferACDuzenle;
      case EditTipiEnum.cari:
        return yetkiController.cariKartiDuzenleme;
      case EditTipiEnum.isEmri:
      case EditTipiEnum.altIsEmri:
      case EditTipiEnum.isEmriTakip:
      case EditTipiEnum.uretimSonuKaydi:
      case EditTipiEnum.uretim:
      case EditTipiEnum.paket:
      case EditTipiEnum.belgesizIslem:
        return false;
    }
  }

  bool get silinsinMi {
    switch (this) {
      case EditTipiEnum.musteri:
        return yetkiController.siparisMSSil;
      case EditTipiEnum.satici:
        return yetkiController.siparisSSSil;
      case EditTipiEnum.satisFatura:
        return yetkiController.satisFatSil;
      case EditTipiEnum.satisIrsaliye:
        return yetkiController.satisIrsSil;
      case EditTipiEnum.alisFatura:
        return yetkiController.alisFatSil;
      case EditTipiEnum.alisIrsaliye:
        return yetkiController.alisIrsSil;
      case EditTipiEnum.satisTeklifi:
        return yetkiController.satisTeklifiSil;
      case EditTipiEnum.alisTalebi:
        return yetkiController.alisTalebiSil;
      case EditTipiEnum.satisTalebi:
        return yetkiController.satisTalebiSil;
      case EditTipiEnum.depoTransferi:
      case EditTipiEnum.olcumdenDepoTransferi:
        return yetkiController.transferDatSil;
      case EditTipiEnum.ambarGirisi:
        return yetkiController.transferAGSil;
      case EditTipiEnum.ambarCikisi:
        return yetkiController.transferACSil;
      case EditTipiEnum.cari:
        return yetkiController.cariKartiSilme;
      case EditTipiEnum.isEmri:
      case EditTipiEnum.altIsEmri:
      case EditTipiEnum.isEmriTakip:
      case EditTipiEnum.uretimSonuKaydi:
      case EditTipiEnum.uretim:
      case EditTipiEnum.paket:
      case EditTipiEnum.belgesizIslem:
        return false;
    }
  }

  bool get transferMi {
    switch (this) {
      case EditTipiEnum.depoTransferi:
      case EditTipiEnum.olcumdenDepoTransferi:
      case EditTipiEnum.ambarGirisi:
      case EditTipiEnum.ambarCikisi:
        return true;
      default:
        return false;
    }
  }

  bool get siparisMi {
    switch (this) {
      case EditTipiEnum.musteri:
      case EditTipiEnum.satici:
        return true;
      default:
        return false;
    }
  }

  bool get faturaMi {
    switch (this) {
      case EditTipiEnum.satisFatura:
      case EditTipiEnum.satisIrsaliye:
      case EditTipiEnum.alisFatura:
      case EditTipiEnum.alisIrsaliye:
      case EditTipiEnum.ambarGirisi:
      case EditTipiEnum.ambarCikisi:
      case EditTipiEnum.cari:
        return true;
      default:
        return false;
    }
  }

  // BaseSiparisEditModel? get getEditModel {
  //   switch (this) {
  //     case EditTipiEnum.musteri:
  //     case EditTipiEnum.satici:
  //       return CacheManager.getSiparisEdit(BaseSiparisEditModel.instance.belgeNo ?? "");
  //     case EditTipiEnum.satisFatura:
  //     case EditTipiEnum.satisIrsaliye:
  //     case EditTipiEnum.alisFatura:
  //     case EditTipiEnum.alisIrsaliye:
  //       return CacheManager.getFaturaEdit(BaseSiparisEditModel.instance.belgeNo ?? "");
  //   }
  // }

  void setEditModel() {
    switch (this) {
      case EditTipiEnum.musteri:
      case EditTipiEnum.satici:
        CacheManager.setSiparisEdit(BaseSiparisEditModel.instance);
      case EditTipiEnum.satisFatura:
      case EditTipiEnum.satisIrsaliye:
      case EditTipiEnum.alisFatura:
      case EditTipiEnum.alisIrsaliye:
        CacheManager.setFaturaEdit(BaseSiparisEditModel.instance);
      case EditTipiEnum.satisTeklifi:
      case EditTipiEnum.alisTalebi:
      case EditTipiEnum.satisTalebi:
        CacheManager.setTalepTeklifEdit(BaseSiparisEditModel.instance);
      case EditTipiEnum.depoTransferi:
      case EditTipiEnum.olcumdenDepoTransferi:
      case EditTipiEnum.ambarGirisi:
      case EditTipiEnum.ambarCikisi:
        CacheManager.setTransferEdit(BaseSiparisEditModel.instance);
      case EditTipiEnum.cari:
      case EditTipiEnum.isEmri:
      case EditTipiEnum.altIsEmri:
      case EditTipiEnum.isEmriTakip:
      case EditTipiEnum.uretimSonuKaydi:
      case EditTipiEnum.uretim:
      case EditTipiEnum.paket:
      case EditTipiEnum.belgesizIslem:
    }
  }

  void get addEditListItem {
    switch (this) {
      case EditTipiEnum.musteri:
      case EditTipiEnum.satici:
        CacheManager.addSiparisEditListItem(BaseSiparisEditModel.instance);
      case EditTipiEnum.satisFatura:
      case EditTipiEnum.satisIrsaliye:
      case EditTipiEnum.alisFatura:
      case EditTipiEnum.alisIrsaliye:
        CacheManager.addFaturaEditListItem(BaseSiparisEditModel.instance);
      case EditTipiEnum.satisTeklifi:
      case EditTipiEnum.alisTalebi:
      case EditTipiEnum.satisTalebi:
        CacheManager.addTalepTeklifEditListItem(BaseSiparisEditModel.instance);
      case EditTipiEnum.depoTransferi:
      case EditTipiEnum.olcumdenDepoTransferi:
      case EditTipiEnum.ambarGirisi:
      case EditTipiEnum.ambarCikisi:
        CacheManager.addTransferEditListItem(BaseSiparisEditModel.instance);
      case EditTipiEnum.cari:
      case EditTipiEnum.isEmri:
      case EditTipiEnum.altIsEmri:
      case EditTipiEnum.isEmriTakip:
      case EditTipiEnum.uretimSonuKaydi:
      case EditTipiEnum.uretim:
      case EditTipiEnum.paket:
      case EditTipiEnum.belgesizIslem:
    }
  }

  String get getRoute {
    switch (this) {
      case EditTipiEnum.musteri:
        return "/mainPage/siparisMusteriSiparisi";
      case EditTipiEnum.satici:
        return "/mainPage/siparisSaticiSiparisi";
      default:
        return "/mainPage/siparisSaticiSiparisi";
    }
  }

  String get getListRoute {
    switch (this) {
      case EditTipiEnum.satisFatura:
        return "/mainPage/sevkiyatSatisFaturasi";
      case EditTipiEnum.satisIrsaliye:
        return "/mainPage/sevkiyatSatisIrsaliyesi";
      case EditTipiEnum.alisFatura:
        return "/mainPage/malKabulAlisFaturasi";
      case EditTipiEnum.alisIrsaliye:
        return "/mainPage/malKabulAlisIrsaliyesi";
      default:
        return "";
    }
  }

  String get aciklamaDuzenleRoute {
    switch (this) {
      case EditTipiEnum.satisFatura:
        return "/mainPage/faturaSatisFaturasiAciklamaDuzenle";
      case EditTipiEnum.satisIrsaliye:
        return "/mainPage/faturaSatisIrsaliyesiAciklamaDuzenle";
      case EditTipiEnum.alisFatura:
        return "/mainPage/faturaAlisFaturasiAciklamaDuzenle";
      case EditTipiEnum.alisIrsaliye:
        return "/mainPage/faturaAlisIrsaliyesiAciklamaDuzenle";
      case EditTipiEnum.satisTeklifi:
        return "/mainPage/talTekSatisTeklifAciklamaDuzenle";
      case EditTipiEnum.alisTalebi:
        return "/mainPage/talTekAlisTalepAciklamaDuzenle";
      case EditTipiEnum.satisTalebi:
        return "/mainPage/talTekSatisTalepAciklamaDuzenle";
      case EditTipiEnum.depoTransferi:
      case EditTipiEnum.olcumdenDepoTransferi:
        return "/mainPage/transferDepoAciklamaDuzenle";
      default:
        throw Exception("Açıklama düzenleme route bulunamadı");
    }
  }

  EditTipiEnum? getEditTipiEnumWithRawValue(String? rawValue) => EditTipiEnum.values.firstWhereOrNull((element) => element.rawValue == rawValue);

  String aciklamaLabel(int index) {
    final ParamModel? paramModel = CacheManager.getAnaVeri?.paramModel;
    String? label;
    if (talepTeklifMi) {
      final TalTekParam? talTekParam = paramModel?.talTekParam?.firstWhereOrNull((element) => element.belgeTipi == rawValue);
      switch (index) {
        case 1:
          label = talTekParam?.aciklar1;
        case 2:
          label = talTekParam?.aciklar2;
        case 3:
          label = talTekParam?.aciklar3;
        case 4:
          label = talTekParam?.aciklar4;
        case 5:
          label = talTekParam?.aciklar5;
        case 6:
          label = talTekParam?.aciklar6;
        case 7:
          label = talTekParam?.aciklar7;
        case 8:
          label = talTekParam?.aciklar8;
        case 9:
          label = talTekParam?.aciklar9;
        case 10:
          label = talTekParam?.aciklar10;
        case 11:
          label = talTekParam?.aciklar11;
        case 12:
          label = talTekParam?.aciklar12;
        case 13:
          label = talTekParam?.aciklar13;
        case 14:
          label = talTekParam?.aciklar14;
        case 15:
          label = talTekParam?.aciklar15;
        case 16:
          label = talTekParam?.aciklar16;
      }
    } else if (satisMi) {
      switch (index) {
        case 1:
          label = paramModel?.satisEkAciklamaTanimi1;
        case 2:
          label = paramModel?.satisEkAciklamaTanimi2;
        case 3:
          label = paramModel?.satisEkAciklamaTanimi3;
        case 4:
          label = paramModel?.satisEkAciklamaTanimi4;
        case 5:
          label = paramModel?.satisEkAciklamaTanimi5;
        case 6:
          label = paramModel?.satisEkAciklamaTanimi6;
        case 7:
          label = paramModel?.satisEkAciklamaTanimi7;
        case 8:
          label = paramModel?.satisEkAciklamaTanimi8;
        case 9:
          label = paramModel?.satisEkAciklamaTanimi9;
        case 10:
          label = paramModel?.satisEkAciklamaTanimi10;
        case 11:
          label = paramModel?.satisEkAciklamaTanimi11;
        case 12:
          label = paramModel?.satisEkAciklamaTanimi12;
        case 13:
          label = paramModel?.satisEkAciklamaTanimi13;
        case 14:
          label = paramModel?.satisEkAciklamaTanimi14;
        case 15:
          label = paramModel?.satisEkAciklamaTanimi15;
        case 16:
          label = paramModel?.satisEkAciklamaTanimi16;
      }
    } else {
      switch (index) {
        case 1:
          label = paramModel?.alisEkAciklamaTanimi1;
        case 2:
          label = paramModel?.alisEkAciklamaTanimi2;
        case 3:
          label = paramModel?.alisEkAciklamaTanimi3;
        case 4:
          label = paramModel?.alisEkAciklamaTanimi4;
        case 5:
          label = paramModel?.alisEkAciklamaTanimi5;
        case 6:
          label = paramModel?.alisEkAciklamaTanimi6;
        case 7:
          label = paramModel?.alisEkAciklamaTanimi7;
        case 8:
          label = paramModel?.alisEkAciklamaTanimi8;
        case 9:
          label = paramModel?.alisEkAciklamaTanimi9;
        case 10:
          label = paramModel?.alisEkAciklamaTanimi10;
        case 11:
          label = paramModel?.alisEkAciklamaTanimi11;
        case 12:
          label = paramModel?.alisEkAciklamaTanimi12;
        case 13:
          label = paramModel?.alisEkAciklamaTanimi13;
        case 14:
          label = paramModel?.alisEkAciklamaTanimi14;
        case 15:
          label = paramModel?.alisEkAciklamaTanimi15;
        case 16:
          label = paramModel?.alisEkAciklamaTanimi16;
      }
    }
    return label ?? "Açıklama $index";
  }
}
