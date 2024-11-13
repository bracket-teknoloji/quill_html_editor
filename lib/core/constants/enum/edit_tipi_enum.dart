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

  bool get transferMi => depoTransferiMi || ambarGirisiMi || ambarCikisiMi;

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

  String get rawValue => switch (this) {
        EditTipiEnum.musteri => "MS",
        EditTipiEnum.satici => "SS",
        EditTipiEnum.satisFatura => "SF",
        EditTipiEnum.satisIrsaliye => "SI",
        EditTipiEnum.alisFatura => "AF",
        EditTipiEnum.alisIrsaliye => "AI",
        EditTipiEnum.satisTeklifi => "STEK",
        EditTipiEnum.alisTalebi => "ATAL",
        EditTipiEnum.satisTalebi => "STAL",
        EditTipiEnum.depoTransferi || EditTipiEnum.olcumdenDepoTransferi => "DC",
        EditTipiEnum.ambarGirisi => "AG",
        EditTipiEnum.ambarCikisi => "AC",
        EditTipiEnum.isEmri => "IE",
        EditTipiEnum.altIsEmri => "AIE",
        EditTipiEnum.isEmriTakip => "TKP",
        EditTipiEnum.uretimSonuKaydi || EditTipiEnum.uretim => "USK",
        EditTipiEnum.cari => "",

        //? Bu ikisinin değeri elle girildi. Gerçek bir değer değil.
        EditTipiEnum.paket => "PAK",
        EditTipiEnum.belgesizIslem => "BI"
      };

  String get getName => switch (this) {
        EditTipiEnum.musteri => "Müşteri Siparişi",
        EditTipiEnum.satici => "Satıcı Siparişi",
        EditTipiEnum.satisFatura => "Satış Faturası",
        EditTipiEnum.satisIrsaliye => "Satış İrsaliyesi",
        EditTipiEnum.alisFatura => "Alış Faturası",
        EditTipiEnum.alisIrsaliye => "Alış İrsaliyesi",
        EditTipiEnum.satisTeklifi => "Satış Teklifi",
        EditTipiEnum.alisTalebi => "Alış Talebi",
        EditTipiEnum.satisTalebi => "Satış Talebi",
        EditTipiEnum.depoTransferi || EditTipiEnum.olcumdenDepoTransferi => "Depo Transferi",
        EditTipiEnum.ambarGirisi => "Ambar Giriş Fişi",
        EditTipiEnum.ambarCikisi => "Ambar Çıkış Fişi",
        EditTipiEnum.isEmri => "İş Emri",
        EditTipiEnum.altIsEmri => "Alt İş Emri",
        EditTipiEnum.isEmriTakip => "İş Emri Takibi",
        EditTipiEnum.uretimSonuKaydi => "Üretim Sonu Kaydı",
        EditTipiEnum.cari => "Cari",
        EditTipiEnum.uretim => "Üretim",
        EditTipiEnum.paket => "Paket",
        EditTipiEnum.belgesizIslem => "Belgesiz İşlem"
      };

  String get getPrintValue => switch (this) {
        EditTipiEnum.musteri => "MusteriSiparisi",
        EditTipiEnum.satici => "SaticiSiparisi",
        EditTipiEnum.satisFatura => "SatisFaturasi",
        EditTipiEnum.satisIrsaliye => "SatisIrsaliyesi",
        EditTipiEnum.alisFatura => "AlisFaturasi",
        EditTipiEnum.alisIrsaliye => "AlisIrsaliyesi",
        EditTipiEnum.satisTeklifi => "SatisTeklifi",
        EditTipiEnum.alisTalebi => "AlisTalebi",
        EditTipiEnum.satisTalebi => "SatisTalebi",
        EditTipiEnum.depoTransferi || EditTipiEnum.olcumdenDepoTransferi => "DepoTransferi",
        //TODO Aşağıdaki veriler yalnız onları düzelt.
        EditTipiEnum.ambarGirisi => "AmbarGirisi",
        EditTipiEnum.ambarCikisi => "AmbarCikisi",
        //TODO
        EditTipiEnum.isEmri ||
        EditTipiEnum.altIsEmri ||
        EditTipiEnum.isEmriTakip ||
        EditTipiEnum.uretimSonuKaydi ||
        EditTipiEnum.cari ||
        EditTipiEnum.uretim ||
        EditTipiEnum.paket ||
        EditTipiEnum.belgesizIslem =>
          ""
      };

  bool get yazdirilsinMi => switch (this) {
        EditTipiEnum.musteri => yetkiController.yazdirmaMusSip,
        EditTipiEnum.satici => yetkiController.yazdirmaSaticiSip,
        EditTipiEnum.satisFatura => yetkiController.yazdirmaSaticiSip,
        EditTipiEnum.satisIrsaliye => yetkiController.yazdirmaSatisIrs,
        EditTipiEnum.alisFatura => yetkiController.yazdirmaAlisFat,
        EditTipiEnum.alisIrsaliye => yetkiController.yazdirmaAlisIrs,
        EditTipiEnum.satisTeklifi => yetkiController.yazdirmaSatisTeklifi,
        EditTipiEnum.satisTalebi => yetkiController.yazdirmaSatisTalebi,
        EditTipiEnum.depoTransferi || EditTipiEnum.olcumdenDepoTransferi => yetkiController.yazdirmaDepoTransferi,
        EditTipiEnum.ambarGirisi => yetkiController.yazdirmaAmbarGirisi,
        EditTipiEnum.ambarCikisi => yetkiController.yazdirmaAmbarCikisi,
        EditTipiEnum.alisTalebi ||
        EditTipiEnum.isEmri ||
        EditTipiEnum.altIsEmri ||
        EditTipiEnum.isEmriTakip ||
        EditTipiEnum.uretimSonuKaydi ||
        EditTipiEnum.cari ||
        EditTipiEnum.uretim ||
        EditTipiEnum.paket ||
        EditTipiEnum.belgesizIslem =>
          false
      };

  bool degistirilmeyecekAlanlar(String value) => switch (this) {
        EditTipiEnum.depoTransferi || EditTipiEnum.olcumdenDepoTransferi => yetkiController.transferLokalDatDegistirilmeyecekAlanlar(value),
        EditTipiEnum.ambarGirisi => yetkiController.transferLokalAgDegistirilmeyecekAlanlar(value),
        EditTipiEnum.ambarCikisi => yetkiController.transferLokalAcDegistirilmeyecekAlanlar(value),
        EditTipiEnum.satisIrsaliye => yetkiController.satisIrsDegistirilmeyecekAlanlar(value),
        EditTipiEnum.alisIrsaliye => yetkiController.alisIrsDegistirilmeyecekAlanlar(value),
        EditTipiEnum.satisFatura => yetkiController.satisFatDegistirilmeyecekAlanlar(value),
        EditTipiEnum.alisFatura => yetkiController.alisFatDegistirilmeyecekAlanlar(value),
        _ => false
      };

  bool bosGecilmeyecekAlanlar(String value) => switch (this) {
        EditTipiEnum.depoTransferi || EditTipiEnum.olcumdenDepoTransferi => yetkiController.transferLokalDatBosGecilmeyecekAlanlar(value),
        EditTipiEnum.ambarGirisi => yetkiController.transferLokalAgBosGecilmeyecekAlanlar(value),
        EditTipiEnum.ambarCikisi => yetkiController.transferLokalAcBosGecilmeyecekAlanlar(value),
        EditTipiEnum.satisIrsaliye => yetkiController.satisIrsBosGecilmeyecekAlanlar(value),
        EditTipiEnum.alisIrsaliye => yetkiController.alisIrsBosGecilmeyecekAlanlar(value),
        EditTipiEnum.satisFatura => yetkiController.satisFatBosGecilmeyecekAlanlar(value),
        EditTipiEnum.alisFatura => yetkiController.alisFatBosGecilmeyecekAlanlar(value),
        _ => false
      };

  bool gizlenecekAlanlar(String value) => switch (this) {
        EditTipiEnum.depoTransferi || EditTipiEnum.olcumdenDepoTransferi => yetkiController.transferLokalDatGizlenecekAlanlar(value),
        EditTipiEnum.ambarGirisi => yetkiController.transferLokalAgGizlenecekAlanlar(value),
        EditTipiEnum.ambarCikisi => yetkiController.transferLokalAcGizlenecekAlanlar(value),
        EditTipiEnum.satisIrsaliye => yetkiController.satisIrsGizlenecekAlanlar(value),
        EditTipiEnum.alisIrsaliye => yetkiController.alisIrsGizlenecekAlanlar(value),
        EditTipiEnum.satisFatura => yetkiController.satisFatGizlenecekAlanlar(value),
        EditTipiEnum.alisFatura => yetkiController.alisFatGizlenecekAlanlar(value),
        _ => false
      };

  bool aciklamalarGorunecekMi(int value) => switch (this) {
        EditTipiEnum.depoTransferi || EditTipiEnum.olcumdenDepoTransferi => true,
        EditTipiEnum.ambarGirisi => yetkiController.transferLokalAgAciklamaAlanlari(value),
        EditTipiEnum.ambarCikisi => yetkiController.transferLokalAcAciklamaAlanlari(value),
        _ => false
      };

  bool get kopyalanabilirMi => switch (this) {
        EditTipiEnum.musteri => yetkiController.kopyalaMusSip,
        EditTipiEnum.alisTalebi => yetkiController.kopyalaAlisTalebi,
        EditTipiEnum.ambarGirisi => yetkiController.kopyalaAmbarGirisi,
        EditTipiEnum.ambarCikisi => yetkiController.kopyalaAmbarCikisi,
        EditTipiEnum.cari ||
        EditTipiEnum.satisFatura ||
        EditTipiEnum.satisIrsaliye ||
        EditTipiEnum.satisTeklifi ||
        EditTipiEnum.satisTalebi ||
        EditTipiEnum.depoTransferi ||
        EditTipiEnum.olcumdenDepoTransferi ||
        EditTipiEnum.satici ||
        EditTipiEnum.alisFatura ||
        EditTipiEnum.alisIrsaliye ||
        EditTipiEnum.isEmri ||
        EditTipiEnum.altIsEmri ||
        EditTipiEnum.isEmriTakip ||
        EditTipiEnum.uretimSonuKaydi ||
        EditTipiEnum.uretim ||
        EditTipiEnum.paket ||
        EditTipiEnum.belgesizIslem =>
          false
      };

  bool get aciklamaDuzenlensinMi => switch (this) {
        EditTipiEnum.depoTransferi || EditTipiEnum.olcumdenDepoTransferi => yetkiController.transferDatAciklamaDuzenle,
        EditTipiEnum.ambarGirisi => yetkiController.transferAgAciklamaDuzenle,
        EditTipiEnum.ambarCikisi => yetkiController.transferAcAciklamaDuzenle,
        _ => false
      };

  bool get cariKoduDegisirMi => switch (this) {
        EditTipiEnum.musteri => yetkiController.cariKoduDegistirMusSip,
        EditTipiEnum.satici => yetkiController.cariKoduDegistirSaticiSip,
        EditTipiEnum.satisFatura => yetkiController.cariKoduDegistirSaticiSip,
        EditTipiEnum.satisIrsaliye => yetkiController.cariKoduDegistirSatisIrs,
        EditTipiEnum.alisFatura => yetkiController.cariKoduDegistirAlisFat,
        EditTipiEnum.alisIrsaliye => yetkiController.cariKoduDegistirAlisIrs,
        EditTipiEnum.satisTeklifi => yetkiController.cariKoduDegistirSatisTeklifi,
        EditTipiEnum.alisTalebi => yetkiController.cariKoduDegistirAlisTalebi,
        EditTipiEnum.satisTalebi => yetkiController.cariKoduDegistirSatisTalebi,
        EditTipiEnum.depoTransferi ||
        EditTipiEnum.olcumdenDepoTransferi ||
        EditTipiEnum.ambarGirisi ||
        EditTipiEnum.ambarCikisi ||
        EditTipiEnum.cari ||
        EditTipiEnum.isEmri ||
        EditTipiEnum.altIsEmri ||
        EditTipiEnum.isEmriTakip ||
        EditTipiEnum.uretimSonuKaydi ||
        EditTipiEnum.uretim ||
        EditTipiEnum.paket ||
        EditTipiEnum.belgesizIslem =>
          false
      };

  bool get belgeKapatabilirMi => switch (this) { EditTipiEnum.musteri => yetkiController.belgeKapatMusSip, EditTipiEnum.satici => yetkiController.belgeKapatSaticiSip, _ => false };

  bool get satisMi => switch (this) {
        EditTipiEnum.musteri ||
        EditTipiEnum.satisFatura ||
        EditTipiEnum.satisIrsaliye ||
        EditTipiEnum.satisTeklifi ||
        EditTipiEnum.satisTalebi ||
        EditTipiEnum.depoTransferi ||
        EditTipiEnum.olcumdenDepoTransferi ||
        EditTipiEnum.ambarCikisi =>
          true,
        EditTipiEnum.satici ||
        EditTipiEnum.alisFatura ||
        EditTipiEnum.alisIrsaliye ||
        EditTipiEnum.alisTalebi ||
        EditTipiEnum.ambarGirisi ||
        EditTipiEnum.cari ||
        EditTipiEnum.isEmri ||
        EditTipiEnum.altIsEmri ||
        EditTipiEnum.isEmriTakip ||
        EditTipiEnum.uretimSonuKaydi ||
        EditTipiEnum.uretim ||
        EditTipiEnum.paket ||
        EditTipiEnum.belgesizIslem =>
          false
      };

  bool get eIrsaliyeIsaretleyemesin => switch (this) {
        EditTipiEnum.depoTransferi || EditTipiEnum.olcumdenDepoTransferi => yetkiController.transferDatEIrsaliyeIsaretleyemesin,
        EditTipiEnum.ambarCikisi => yetkiController.transferAcEIrsaliyeIsaretleyemesin,
        _ => false
      };

  bool get talepTeklifMi => switch (this) { EditTipiEnum.satisTeklifi || EditTipiEnum.alisTalebi || EditTipiEnum.satisTalebi => true, _ => false };

  bool get fiyatDegistirilmesin => switch (this) {
        EditTipiEnum.satisFatura => yetkiController.sevkiyatSatisFatFiyatDegistirilmesin,
        EditTipiEnum.satisIrsaliye => yetkiController.sevkiyatFiyatDegistirilmesin,
        EditTipiEnum.alisFatura || EditTipiEnum.alisIrsaliye => yetkiController.malKabulFiyatDegistirilmesin,
        EditTipiEnum.musteri || EditTipiEnum.satici => yetkiController.siparisFiyatDegistirilmesin,
        EditTipiEnum.satisTalebi => yetkiController.satisTalebiFiyatDegistirilmesin,
        EditTipiEnum.satisTeklifi => yetkiController.satisTeklifiFiyatDegistirilmesin,
        _ => false,
      };

  bool get fiyatGor => switch (this) {
        EditTipiEnum.satisIrsaliye => yetkiController.satisIrsFiyatGor,
        EditTipiEnum.alisIrsaliye => yetkiController.alisIrsFiyatGor,
        EditTipiEnum.depoTransferi => yetkiController.transferDatFiyatGor,
        EditTipiEnum.ambarGirisi => yetkiController.transferACFiyatGor,
        EditTipiEnum.ambarCikisi => yetkiController.transferACFiyatGor,
        _ => true,
      };

  bool get digerSekmesiGoster => switch (this) {
        EditTipiEnum.musteri || EditTipiEnum.satici => yetkiController.siparisDigerSekmesiGoster,
        EditTipiEnum.satisFatura => yetkiController.satisFatDigerSekmesiGelsin,
        EditTipiEnum.satisIrsaliye => yetkiController.satisIrsDigerSekmesiGelsin,
        EditTipiEnum.alisFatura => yetkiController.alisFatDigerSekmesiGelsin,
        EditTipiEnum.alisIrsaliye => yetkiController.alisIrsDigerSekmesiGelsin,
        EditTipiEnum.depoTransferi || EditTipiEnum.olcumdenDepoTransferi => yetkiController.transferDatDigerSekmesiGoster,
        EditTipiEnum.ambarGirisi => yetkiController.transferAgDigerSekmesiGoster,
        EditTipiEnum.ambarCikisi => yetkiController.transferAcDigerSekmesiGoster,
        _ => true
      };

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

  bool get siparisBaglantisiVarMi {
    if (transferMi) {
      return yetkiController.transferLokalDatSiparisBaglantisi;
    }
    if (satisMi && yetkiController.satistaSiparisKullan) {
      return switch (this) {
        EditTipiEnum.satisIrsaliye => yetkiController.satisIrsaliyesiSiparisBaglantisi,
        EditTipiEnum.satisFatura => yetkiController.satisFaturaSiparisBaglantisi,
        _ => false,
      };
    }
    if (!satisMi && yetkiController.alistaSiparisKullan) {
      return switch (this) {
        EditTipiEnum.alisIrsaliye => yetkiController.alisIrsaliyesiSiparisBaglantisi,
        EditTipiEnum.alisFatura => yetkiController.alisFaturaSiparisBaglantisi,
        _ => false,
      };
    }
    return false;
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
        CacheManager.addTaltekEditListItem(BaseSiparisEditModel.instance);
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
