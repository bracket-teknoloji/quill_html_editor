import "package:get/get.dart";
import "package:hive_ce_flutter/hive_flutter.dart";
import "package:picker/core/base/view/masraf_kodu/model/masraf_kodu_rehberi_model.dart";
import "package:picker/view/add_company/model/account_model.dart";

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
    return switch (this!) {
      EditTipiEnum.satisFatura ||
      EditTipiEnum.satisIrsaliye ||
      EditTipiEnum.alisFatura ||
      EditTipiEnum.alisIrsaliye => true,
      _ => false,
    };
  }


  int get kademeliIskontoSayisi {
    if (this == null) return 0;
    return switch (this!) {
      EditTipiEnum.satici ||
      EditTipiEnum.alisFatura ||
      EditTipiEnum.alisIrsaliye ||
      EditTipiEnum.ambarGirisi => YetkiController().alisKademeliIskontoSayisi,
      EditTipiEnum.musteri ||
      EditTipiEnum.satisFatura ||
      EditTipiEnum.satisIrsaliye ||
      EditTipiEnum.ambarCikisi => YetkiController().satisKademeliIskontoSayisi,
      EditTipiEnum.alisTalebi ||
      EditTipiEnum.satisTeklifi ||
      EditTipiEnum.satisTalebi => YetkiController().talTekSatirKademeliIskontoSayisi(this?.rawValue ?? ""),
      EditTipiEnum.depoTransferi ||
      EditTipiEnum.olcumdenDepoTransferi ||
      EditTipiEnum.cari ||
      EditTipiEnum.isEmri ||
      EditTipiEnum.altIsEmri ||
      EditTipiEnum.isEmriTakip ||
      EditTipiEnum.uretimSonuKaydi ||
      EditTipiEnum.uretim ||
      EditTipiEnum.paket ||
      EditTipiEnum.belgesizIslem => 0,
    };
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
    EditTipiEnum.belgesizIslem => "BI",
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
    EditTipiEnum.belgesizIslem => "Belgesiz İşlem",
  };

  String? get tekrarEdenBarkod => switch (this) {
    EditTipiEnum.musteri => yetkiController.siparisMSTekrarEdenBarkod,
    EditTipiEnum.satici => yetkiController.siparisSSTekrarEdenBarkod,
    EditTipiEnum.satisFatura => yetkiController.satisFatTekrarEdenBarkod,
    EditTipiEnum.satisIrsaliye => yetkiController.satisIrsTekrarEdenBarkod,
    EditTipiEnum.alisFatura => yetkiController.alisFatTekrarEdenBarkod,
    EditTipiEnum.alisIrsaliye => yetkiController.alisIrsTekrarEdenBarkod,
    EditTipiEnum.depoTransferi || EditTipiEnum.olcumdenDepoTransferi => yetkiController.transferDatTekrarEdenBarkod,
    EditTipiEnum.ambarGirisi => yetkiController.transferAGTekrarEdenBarkod,
    EditTipiEnum.ambarCikisi => yetkiController.transferACTekrarEdenBarkod,
    _ => null,
  };

  String? get ozelKod1 => switch (this) {
    EditTipiEnum.musteri => yetkiController.siparisMSOzelKod1Degeri,
    EditTipiEnum.satisFatura => yetkiController.satisFaturaOzelKod1Degeri,
    EditTipiEnum.satisIrsaliye => yetkiController.satisIrsaliyeOzelKod1Degeri,
    EditTipiEnum.satisTalebi => yetkiController.satisTalebiOzelKod1Degeri,
    EditTipiEnum.satisTeklifi => yetkiController.satisTeklifOzelKod1Degeri,
    EditTipiEnum.alisIrsaliye => yetkiController.malKabulAlisIrsOzelKod1Degeri,
    EditTipiEnum.ambarCikisi => yetkiController.transferACOzelKod1Degeri,
    EditTipiEnum.depoTransferi || EditTipiEnum.olcumdenDepoTransferi => yetkiController.transferDATVarsayilanOzelKod1,
    _ => null,
  };

  String? get ozelKod2 => switch (this) {
    EditTipiEnum.musteri => yetkiController.siparisMSOzelKod2Degeri,
    EditTipiEnum.satisFatura => yetkiController.satisFaturaOzelKod2Degeri,
    EditTipiEnum.satisIrsaliye => yetkiController.satisIrsaliyeOzelKod2Degeri,
    EditTipiEnum.satisTalebi => yetkiController.satisTalebiOzelKod2Degeri,
    EditTipiEnum.satisTeklifi => yetkiController.satisTeklifOzelKod2Degeri,
    EditTipiEnum.alisIrsaliye => yetkiController.malKabulAlisIrsOzelKod2Degeri,
    EditTipiEnum.ambarCikisi => yetkiController.transferACOzelKod2Degeri,
    EditTipiEnum.depoTransferi || EditTipiEnum.olcumdenDepoTransferi => yetkiController.transferDATVarsayilanOzelKod2,
    _ => null,
  };

  bool get rehberdenStokSecilsin {
    if (!barkodluUrunGirisi && barkodluUrunGirisiOlabilirMi) return true;
    return switch (this) {
      EditTipiEnum.satisFatura => yetkiController.satisFatRehberdenStokSecilsin,
      EditTipiEnum.satisIrsaliye => yetkiController.satisIrsRehberdenStokSecilsin,
      EditTipiEnum.alisFatura => yetkiController.alisFatRehberdenStokSecilsin,
      EditTipiEnum.alisIrsaliye => yetkiController.alisIrsRehberdenStokSecilsin,
      EditTipiEnum.depoTransferi ||
      EditTipiEnum.olcumdenDepoTransferi => yetkiController.transferDatRehberdenStokSecilsin,
      EditTipiEnum.ambarGirisi => yetkiController.transferAGRehberdenStokSecilsin,
      EditTipiEnum.ambarCikisi => yetkiController.transferACRehberdenStokSecilsin,
      _ => true,
    };
  }

  bool get otoPDFGor => switch (this) {
    EditTipiEnum.satisFatura => yetkiController.sevkiyatSatFatOtomatikPDFGor,
    EditTipiEnum.satisIrsaliye => yetkiController.sevkiyatSatisIrsOtomatikPDFGor,
    EditTipiEnum.alisIrsaliye => yetkiController.malKabulAlisIrsOtomatikPDFGor,
    EditTipiEnum.depoTransferi || EditTipiEnum.olcumdenDepoTransferi => yetkiController.transferDatOtomatikPDFGor,
    EditTipiEnum.ambarGirisi => yetkiController.transferAgOtomatikPDFGor,
    EditTipiEnum.ambarCikisi => yetkiController.transferAcOtomatikPDFGor,
    EditTipiEnum.musteri => yetkiController.siparisMSOtomatikPDFGor,
    EditTipiEnum.satici => yetkiController.siparisSSOtomatikPDFGor,
    _ => false,
  };

  bool get kalemlerKlavyeAcilmasin {
    if (!barkodluUrunGirisi && barkodluUrunGirisiOlabilirMi) return true;
    return switch (this) {
      EditTipiEnum.satisFatura => yetkiController.satisFatKalemKlavyeAcilmasin,
      EditTipiEnum.satisIrsaliye => yetkiController.satisIrsKalemKlavyeAcilmasin,
      EditTipiEnum.alisFatura => yetkiController.alisFatKalemKlavyeAcilmasin,
      EditTipiEnum.alisIrsaliye => yetkiController.alisIrsKalemKlavyeAcilmasin,
      EditTipiEnum.depoTransferi ||
      EditTipiEnum.olcumdenDepoTransferi => yetkiController.transferDatKalemKlavyeAcilmasin,
      EditTipiEnum.ambarGirisi => yetkiController.transferAGKalemKlavyeAcilmasin,
      EditTipiEnum.ambarCikisi => yetkiController.transferACKalemKlavyeAcilmasin,
      _ => false,
    };
  }

  bool get barkodluUrunGirisiOlabilirMi => switch (this) {
    EditTipiEnum.satisFatura ||
    EditTipiEnum.satisIrsaliye ||
    EditTipiEnum.alisFatura ||
    EditTipiEnum.alisIrsaliye ||
    EditTipiEnum.depoTransferi ||
    EditTipiEnum.olcumdenDepoTransferi ||
    EditTipiEnum.ambarGirisi ||
    EditTipiEnum.ambarCikisi => true,
    _ => false,
  };

  bool get maxIskontoUygula => switch (this) {
    EditTipiEnum.satisFatura => yetkiController.sfMaxIskontoUygula,
    EditTipiEnum.satisIrsaliye => yetkiController.siMaxIskontoUygula,
    EditTipiEnum.musteri => yetkiController.msMaxIskontoUygula,
    _ => false,
  };

  double? get maxGenelIskonto1 => switch (this) {
    EditTipiEnum.satisFatura => yetkiController.sfMaxGenelIskonto1,
    EditTipiEnum.satisIrsaliye => yetkiController.siMaxGenelIskonto1,
    EditTipiEnum.musteri => yetkiController.msMaxGenelIskonto1,
    _ => null,
  };

  double? get maxGenelIskonto2 => switch (this) {
    EditTipiEnum.satisFatura => yetkiController.sfMaxGenelIskonto2,
    EditTipiEnum.satisIrsaliye => yetkiController.siMaxGenelIskonto2,
    EditTipiEnum.musteri => yetkiController.msMaxGenelIskonto2,
    _ => null,
  };

  double? get maxGenelIskonto3 => switch (this) {
    EditTipiEnum.satisFatura => yetkiController.sfMaxGenelIskonto3,
    EditTipiEnum.satisIrsaliye => yetkiController.siMaxGenelIskonto3,
    EditTipiEnum.musteri => yetkiController.msMaxGenelIskonto3,
    _ => null,
  };

  double? get maxSatirIskonto1 => switch (this) {
    EditTipiEnum.satisFatura => yetkiController.sfMaxSatirIskonto1,
    EditTipiEnum.satisIrsaliye => yetkiController.siMaxSatirIskonto1,
    EditTipiEnum.musteri => yetkiController.msMaxSatirIskonto1,
    _ => null,
  };

  double? get maxSatirIskonto2 => switch (this) {
    EditTipiEnum.satisFatura => yetkiController.sfMaxSatirIskonto2,
    EditTipiEnum.satisIrsaliye => yetkiController.siMaxSatirIskonto2,
    EditTipiEnum.musteri => yetkiController.msMaxSatirIskonto2,
    _ => null,
  };

  double? get maxSatirIskonto3 => switch (this) {
    EditTipiEnum.satisFatura => yetkiController.sfMaxSatirIskonto3,
    EditTipiEnum.satisIrsaliye => yetkiController.siMaxSatirIskonto3,
    EditTipiEnum.musteri => yetkiController.msMaxSatirIskonto3,
    _ => null,
  };

  double? get maxSatirIskonto4 => switch (this) {
    EditTipiEnum.satisFatura => yetkiController.sfMaxSatirIskonto4,
    EditTipiEnum.satisIrsaliye => yetkiController.siMaxSatirIskonto4,
    EditTipiEnum.musteri => yetkiController.msMaxSatirIskonto4,
    _ => null,
  };

  double? get maxSatirIskonto5 => switch (this) {
    EditTipiEnum.satisFatura => yetkiController.sfMaxSatirIskonto5,
    EditTipiEnum.satisIrsaliye => yetkiController.siMaxSatirIskonto5,
    EditTipiEnum.musteri => yetkiController.msMaxSatirIskonto5,
    _ => null,
  };

  double? get maxSatirIskonto6 => switch (this) {
    EditTipiEnum.satisFatura => yetkiController.sfMaxSatirIskonto6,
    EditTipiEnum.satisIrsaliye => yetkiController.siMaxSatirIskonto6,
    EditTipiEnum.musteri => yetkiController.msMaxSatirIskonto6,
    _ => null,
  };

  bool get urunOtomatikEklensin {
    if (!barkodluUrunGirisi && barkodluUrunGirisiOlabilirMi) return true;
    return switch (this) {
      EditTipiEnum.satisFatura => yetkiController.satisFatBarkodUrunOtomatikEkle,
      EditTipiEnum.satisIrsaliye => yetkiController.satisIrsBarkodUrunOtomatikEkle,
      EditTipiEnum.alisFatura => yetkiController.alisFatBarkodUrunOtomatikEkle,
      EditTipiEnum.alisIrsaliye => yetkiController.alisIrsBarkodUrunOtomatikEkle,
      EditTipiEnum.depoTransferi ||
      EditTipiEnum.olcumdenDepoTransferi => yetkiController.transferDatBarkodUrunOtomatikEkle,
      EditTipiEnum.ambarGirisi => yetkiController.transferAGBarkodUrunOtomatikEkle,
      EditTipiEnum.ambarCikisi => yetkiController.transferACBarkodUrunOtomatikEkle,
      _ => false,
    };
  }

  bool get kalemDuzeltilsin {
    if (!barkodluUrunGirisi && barkodluUrunGirisiOlabilirMi) return true;
    return switch (this) {
      EditTipiEnum.satisFatura => yetkiController.satisFatKalemDuzeltilsin,
      EditTipiEnum.satisIrsaliye => yetkiController.satisIrsKalemDuzeltilsin,
      EditTipiEnum.alisFatura => yetkiController.alisFatKalemDuzeltilsin,
      EditTipiEnum.alisIrsaliye => yetkiController.alisIrsKalemDuzeltilsin,
      EditTipiEnum.depoTransferi || EditTipiEnum.olcumdenDepoTransferi => yetkiController.transferDatKalemDuzeltilsin,
      EditTipiEnum.ambarGirisi => yetkiController.transferAGKalemDuzeltilsin,
      EditTipiEnum.ambarCikisi => yetkiController.transferACKalemDuzeltilsin,
      _ => false,
    };
  }

  bool get barkod2Sor => switch (this) {
    EditTipiEnum.depoTransferi || EditTipiEnum.olcumdenDepoTransferi => yetkiController.transferDATBarkod2Sor,
    _ => false,
  };

  bool get barkodluUrunGirisi => switch (this) {
    EditTipiEnum.satisFatura => yetkiController.satisFatBarkodUrunGirisi,
    EditTipiEnum.satisIrsaliye => yetkiController.satisIrsBarkodUrunGirisi,
    EditTipiEnum.alisFatura => yetkiController.alisFatBarkodUrunGirisi,
    EditTipiEnum.alisIrsaliye => yetkiController.alisIrsBarkodUrunGirisi,
    EditTipiEnum.depoTransferi || EditTipiEnum.olcumdenDepoTransferi => yetkiController.transferDatBarkodUrunGirisi,
    EditTipiEnum.ambarGirisi => yetkiController.transferAGBarkodUrunGirisi,
    EditTipiEnum.ambarCikisi => yetkiController.transferACBarkodUrunGirisi,
    _ => false,
  };

  bool get birim1denGelsin => switch (this) {
    EditTipiEnum.musteri => yetkiController.siparisMSBirim1denKaydet,
    EditTipiEnum.satici => yetkiController.siparisSSBirim1denKaydet,
    EditTipiEnum.satisFatura => yetkiController.satisFatBirim1denKaydet,
    EditTipiEnum.satisIrsaliye => yetkiController.satisIrsBirim1denKaydet,
    EditTipiEnum.alisFatura => yetkiController.alisFatBirim1denKaydet,
    EditTipiEnum.alisIrsaliye => yetkiController.alisIrsBirim1denKaydet,
    EditTipiEnum.ambarGirisi => yetkiController.transferAGBirim1Kaydet,
    EditTipiEnum.ambarCikisi => yetkiController.transferACBirim1Kaydet,
    EditTipiEnum.depoTransferi || EditTipiEnum.olcumdenDepoTransferi => yetkiController.transferDatBirim1Kaydet,
    _ => false,
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
    EditTipiEnum.belgesizIslem => "",
  };

  bool get yazdirilsinMi => switch (this) {
    EditTipiEnum.musteri => yetkiController.yazdirmaMusSip,
    EditTipiEnum.satici => yetkiController.yazdirmaSaticiSip,
    EditTipiEnum.satisFatura => yetkiController.yazdirmaSatisFat,
    EditTipiEnum.satisIrsaliye => yetkiController.yazdirmaSatisIrs,
    EditTipiEnum.alisFatura => yetkiController.yazdirmaAlisFat,
    EditTipiEnum.alisIrsaliye => yetkiController.yazdirmaAlisIrs,
    EditTipiEnum.satisTeklifi => yetkiController.yazdirmaSatisTeklifi,
    EditTipiEnum.satisTalebi => yetkiController.yazdirmaSatisTalebi,
    EditTipiEnum.depoTransferi || EditTipiEnum.olcumdenDepoTransferi => yetkiController.yazdirmaDepoTransferi,
    EditTipiEnum.ambarGirisi => yetkiController.yazdirmaAmbarGirisi,
    EditTipiEnum.ambarCikisi => yetkiController.yazdirmaAmbarCikisi,
    _ => false,
  };

  bool degistirilmeyecekAlanlar(String value) => switch (this) {
    EditTipiEnum.depoTransferi ||
    EditTipiEnum.olcumdenDepoTransferi => yetkiController.transferLokalDatDegistirilmeyecekAlanlar(value),
    EditTipiEnum.musteri => yetkiController.musteriSiparisiDegistirilmeyecekAlanlar(value),
    EditTipiEnum.satici => yetkiController.saticiSiparisiDegistirilmeyecekAlanlar(value),
    EditTipiEnum.ambarGirisi => yetkiController.transferLokalAgDegistirilmeyecekAlanlar(value),
    EditTipiEnum.ambarCikisi => yetkiController.transferLokalAcDegistirilmeyecekAlanlar(value),
    EditTipiEnum.satisIrsaliye => yetkiController.satisIrsDegistirilmeyecekAlanlar(value),
    EditTipiEnum.alisIrsaliye => yetkiController.alisIrsDegistirilmeyecekAlanlar(value),
    EditTipiEnum.satisFatura => yetkiController.satisFatDegistirilmeyecekAlanlar(value),
    EditTipiEnum.alisFatura => yetkiController.alisFatDegistirilmeyecekAlanlar(value),
    EditTipiEnum.satisTeklifi => yetkiController.satisTeklifiDegistirilmeyecekAlanlar(value),
    EditTipiEnum.alisTalebi => yetkiController.alisTalebiDegistirilmeyecekAlanlar(value),
    EditTipiEnum.satisTalebi => yetkiController.satisTalebiDegistirilmeyecekAlanlar(value),
    _ => false,
  };

  bool get cariDovizTipiniKullan =>
      satisMi ? yetkiController.satisCariDovizTipiniKullan : yetkiController.alisCariDovizTipiniKullan;

  bool bosGecilmeyecekAlanlar(String value) => switch (this) {
    EditTipiEnum.depoTransferi ||
    EditTipiEnum.olcumdenDepoTransferi => yetkiController.transferLokalDatBosGecilmeyecekAlanlar(value),
    EditTipiEnum.ambarGirisi => yetkiController.transferLokalAgBosGecilmeyecekAlanlar(value),
    EditTipiEnum.ambarCikisi => yetkiController.transferLokalAcBosGecilmeyecekAlanlar(value),
    EditTipiEnum.satisIrsaliye => yetkiController.satisIrsBosGecilmeyecekAlanlar(value),
    EditTipiEnum.alisIrsaliye => yetkiController.alisIrsBosGecilmeyecekAlanlar(value),
    EditTipiEnum.satisFatura => yetkiController.satisFatBosGecilmeyecekAlanlar(value),
    EditTipiEnum.alisFatura => yetkiController.alisFatBosGecilmeyecekAlanlar(value),
    EditTipiEnum.musteri => yetkiController.musteriSiparisiBosGecilmeyecekAlanlar(value),
    EditTipiEnum.satici => yetkiController.saticiSiparisiBosGecilmeyecekAlanlar(value),
    EditTipiEnum.satisTeklifi => yetkiController.satisTeklifiBosGecilmeyecekAlanlar(value),
    EditTipiEnum.alisTalebi => yetkiController.alisTalebiBosGecilmeyecekAlanlar(value),
    EditTipiEnum.satisTalebi => yetkiController.satisTalebiBosGecilmeyecekAlanlar(value),
    _ => false,
  };

  bool gizlenecekAlanlar(String value) => switch (this) {
    EditTipiEnum.depoTransferi ||
    EditTipiEnum.olcumdenDepoTransferi => yetkiController.transferLokalDatGizlenecekAlanlar(value),
    EditTipiEnum.ambarGirisi => yetkiController.transferLokalAgGizlenecekAlanlar(value),
    EditTipiEnum.ambarCikisi => yetkiController.transferLokalAcGizlenecekAlanlar(value),
    EditTipiEnum.satisIrsaliye => yetkiController.satisIrsGizlenecekAlanlar(value),
    EditTipiEnum.alisIrsaliye => yetkiController.alisIrsGizlenecekAlanlar(value),
    EditTipiEnum.satisFatura => yetkiController.satisFatGizlenecekAlanlar(value),
    EditTipiEnum.alisFatura => yetkiController.alisFatGizlenecekAlanlar(value),
    EditTipiEnum.satisTalebi => yetkiController.satisTalebiGizlenecekAlanlar(value),
    EditTipiEnum.alisTalebi => yetkiController.alisTalebiGizlenecekAlanlar(value),
    EditTipiEnum.satisTeklifi => yetkiController.satisTeklifiGizlenecekAlanlar(value),
    _ => false,
  };

  bool aciklamalarGorunecekMi(int value) => switch (this) {
    EditTipiEnum.depoTransferi ||
    EditTipiEnum.olcumdenDepoTransferi => yetkiController.transferDatAciklamaAlanlari(value),
    EditTipiEnum.ambarGirisi => yetkiController.transferLokalAgAciklamaAlanlari(value),
    EditTipiEnum.ambarCikisi => yetkiController.transferLokalAcAciklamaAlanlari(value),
    EditTipiEnum.satisFatura => yetkiController.satisFaturaAciklamaAlanlari(value),
    EditTipiEnum.satisIrsaliye => yetkiController.satisIrsaliyeAciklamaAlanlari(value),
    EditTipiEnum.alisFatura => yetkiController.alisFaturaAciklamaAlanlari(value),
    EditTipiEnum.alisIrsaliye => yetkiController.alisIrsaliyeAciklamaAlanlari(value),
    EditTipiEnum.musteri => yetkiController.siparisMSAciklamaAlanlari(value),
    EditTipiEnum.satisTeklifi => yetkiController.talepTeklifSatisTeklifiAciklamaAlanlari(value),
    EditTipiEnum.satisTalebi => yetkiController.talepTeklifSatisTalebiAciklamaAlanlari(value),
    EditTipiEnum.alisTalebi => yetkiController.talepTeklifAlisTalebiAciklamaAlanlari(value),
    EditTipiEnum.satici => true,
    _ => false,
  };

  bool get kopyalanabilirMi => switch (this) {
    EditTipiEnum.musteri => yetkiController.kopyalaMusSip,
    EditTipiEnum.alisTalebi => yetkiController.kopyalaAlisTalebi,
    EditTipiEnum.satisTeklifi => yetkiController.kopyalaSatisTeklifi,
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
    EditTipiEnum.belgesizIslem => false,
  };

  String get dizaynOzelKod => switch (this) {
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
    EditTipiEnum.belgesizIslem => "",
  };

  bool get aciklamaDuzenlensinMi => switch (this) {
    EditTipiEnum.depoTransferi || EditTipiEnum.olcumdenDepoTransferi => yetkiController.transferDatAciklamaDuzenle,
    EditTipiEnum.ambarGirisi => yetkiController.transferAgAciklamaDuzenle,
    EditTipiEnum.ambarCikisi => yetkiController.transferAcAciklamaDuzenle,
    EditTipiEnum.satisFatura => yetkiController.sevkiyatSatisFaturaAciklamaDuzenle,
    EditTipiEnum.alisFatura => yetkiController.malKabulAlisFaturaAciklamaDuzenle,
    EditTipiEnum.satisIrsaliye => yetkiController.sevkiyatSatisIrsaliyesiAciklamaDuzenle,
    EditTipiEnum.alisIrsaliye => yetkiController.malKabulAlisIrsaliyesiAciklamaDuzenle,
    _ => false,
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
    _ => false,
  };

  bool get belgeKapatabilirMi => switch (this) {
    EditTipiEnum.musteri => yetkiController.belgeKapatMusSip,
    EditTipiEnum.satici => yetkiController.belgeKapatSaticiSip,
    _ => false,
  };

  bool get fiyatGrubuGorunsunMu => switch (this) {
    EditTipiEnum.musteri => true,
    EditTipiEnum.satisFatura => true,
    EditTipiEnum.satisIrsaliye => true,
    _ => false,
  };

  MasrafKoduRehberiModel? get varsayilanMasrafKodu => switch (this) {
    EditTipiEnum.ambarGirisi => yetkiController.transferAgMasrafKodu,
    EditTipiEnum.ambarCikisi => yetkiController.transferAcMasrafKodu,
    _ => null,
  };
  bool get satisMi => switch (this) {
    EditTipiEnum.musteri ||
    EditTipiEnum.satisFatura ||
    EditTipiEnum.satisIrsaliye ||
    EditTipiEnum.satisTeklifi ||
    EditTipiEnum.satisTalebi ||
    EditTipiEnum.depoTransferi ||
    EditTipiEnum.olcumdenDepoTransferi ||
    EditTipiEnum.ambarCikisi => true,
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
    EditTipiEnum.belgesizIslem => false,
  };

  bool get eIrsaliyeIsaretleyemesin => switch (this) {
    EditTipiEnum.depoTransferi ||
    EditTipiEnum.olcumdenDepoTransferi => yetkiController.transferDatEIrsaliyeIsaretleyemesin,
    EditTipiEnum.ambarCikisi => yetkiController.transferAcEIrsaliyeIsaretleyemesin,
    _ => false,
  };

  bool get talepTeklifMi => switch (this) {
    EditTipiEnum.satisTeklifi || EditTipiEnum.alisTalebi || EditTipiEnum.satisTalebi => true,
    _ => false,
  };

  bool get fiyatDegistirilmesin => switch (this) {
    EditTipiEnum.satisFatura => yetkiController.sevkiyatSatisFatFiyatDegistirilmesin,
    EditTipiEnum.satisIrsaliye => yetkiController.sevkiyatFiyatDegistirilmesin,
    EditTipiEnum.alisFatura || EditTipiEnum.alisIrsaliye => yetkiController.malKabulFiyatDegistirilmesin,
    EditTipiEnum.musteri || EditTipiEnum.satici => yetkiController.siparisFiyatDegistirilmesin(this),
    EditTipiEnum.satisTalebi => yetkiController.satisTalebiFiyatDegistirilmesin,
    EditTipiEnum.satisTeklifi => yetkiController.satisTeklifiFiyatDegistirilmesin,
    _ => false,
  };

  bool get stokTipineBakmadanFiyatGor => switch (this) {
    EditTipiEnum.satisIrsaliye => yetkiController.satisIrsFiyatGor,
    EditTipiEnum.alisIrsaliye => yetkiController.alisIrsFiyatGor,
    EditTipiEnum.depoTransferi => yetkiController.transferDatFiyatGor,
    EditTipiEnum.ambarGirisi => yetkiController.transferAGFiyatGor,
    EditTipiEnum.ambarCikisi => yetkiController.transferACFiyatGor,
    EditTipiEnum.musteri => yetkiController.siparisMSFiyatGor,
    _ => true,
  };

  bool get fiyatGor => stokTipineBakmadanFiyatGor && yetkiController.stokEditTipineGorefiyatGor(this);

  bool get digerSekmesiGoster => switch (this) {
    EditTipiEnum.musteri ||
    EditTipiEnum.satici => yetkiController.siparisDigerSekmesiGoster(this == EditTipiEnum.musteri),
    EditTipiEnum.satisFatura => yetkiController.satisFatDigerSekmesiGelsin,
    EditTipiEnum.satisIrsaliye => yetkiController.satisIrsDigerSekmesiGelsin,
    EditTipiEnum.alisFatura => yetkiController.alisFatDigerSekmesiGelsin,
    EditTipiEnum.alisIrsaliye => yetkiController.alisIrsDigerSekmesiGelsin,
    EditTipiEnum.depoTransferi || EditTipiEnum.olcumdenDepoTransferi => yetkiController.transferDatDigerSekmesiGoster,
    EditTipiEnum.ambarGirisi => yetkiController.transferAgDigerSekmesiGoster,
    EditTipiEnum.ambarCikisi => yetkiController.transferAcDigerSekmesiGoster,
    _ => true,
  };

  bool get siparisBaglantisiCokluSecim => switch (this) {
    EditTipiEnum.satisFatura => yetkiController.satisFaturasiFaturaSiparisBaglantisiCokluSecim,
    EditTipiEnum.satisIrsaliye => yetkiController.satisIrsaliyesiFaturaSiparisBaglantisiCokluSecim,
    EditTipiEnum.alisFatura => yetkiController.alisFaturasiFaturaSiparisBaglantisiCokluSecim,
    EditTipiEnum.alisIrsaliye => yetkiController.alisIrsaliyesiFaturaSiparisBaglantisiCokluSecim,
    EditTipiEnum.depoTransferi ||
    EditTipiEnum.olcumdenDepoTransferi => yetkiController.transferDatSiparisBaglantisiCokluSecim,
    EditTipiEnum.ambarGirisi => yetkiController.transferAgSiparisBaglantisiCokluSecim,
    EditTipiEnum.ambarCikisi => yetkiController.transferAcSiparisBaglantisiCokluSecim,
    EditTipiEnum.isEmri || EditTipiEnum.altIsEmri => true,
    _ => true,
  };

  int? get varsayilanDepoKodu {
    final profil = CacheManager.getAnaVeri?.userModel?.profilYetki;
    int? value;
    if (musteriMi) {
      value = profil?.sirketSatisDepoMusSip != 0 ? profil?.sirketSatisDepoMusSip : null;
    }
    if (satisFaturasiMi) {
      value = profil?.sirketSatisDepoSatisFat != 0 ? profil?.sirketSatisDepoSatisFat : null;
    }
    if (satisIrsaliyesiMi) {
      value = profil?.sirketSatisDepoSatisIrs != 0 ? profil?.sirketSatisDepoSatisIrs : null;
    }
    if (satisMi) {
      value ??= profil?.sirketSatisDepo;
    } else {
      value = profil?.sirketAlisDepo;
    }
    return value != 0 ? value : null;
  }

  bool get siparisBaglantisiTumuSeciliGelsin => switch (this) {
    EditTipiEnum.satisFatura => yetkiController.satisFaturasiSiparisBaglantisiTamamiSeciliGelsin,
    EditTipiEnum.satisIrsaliye => yetkiController.satisIrsaliyesiSiparisBaglantisiTamamiSeciliGelsin,
    EditTipiEnum.alisFatura => yetkiController.alisFaturasiSiparisBaglantisiTamamiSeciliGelsin,
    EditTipiEnum.alisIrsaliye => yetkiController.alisIrsaliyesiSiparisBaglantisiTamamiSeciliGelsin,
    EditTipiEnum.depoTransferi ||
    EditTipiEnum.olcumdenDepoTransferi => yetkiController.transferDatSiparisBaglantisiTamamiSeciliGelsin,
    EditTipiEnum.ambarGirisi => yetkiController.transferAgSiparisBaglantisiTamamiSeciliGelsin,
    EditTipiEnum.ambarCikisi => yetkiController.transferAcSiparisBaglantisiTamamiSeciliGelsin,
    _ => false,
  };
  bool get siparisBaglantisiGoster => switch (this) {
    EditTipiEnum.depoTransferi => yetkiController.transferLokalDatSiparisBaglantisi,
    EditTipiEnum.olcumdenDepoTransferi => yetkiController.transferLokalDatSiparisBaglantisi,
    EditTipiEnum.ambarGirisi => yetkiController.transferAgSiparisBaglantisi,
    EditTipiEnum.ambarCikisi => yetkiController.transferAcSiparisBaglantisi,
    EditTipiEnum.isEmri || EditTipiEnum.altIsEmri => true,
    _ => true,
  };

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

  bool get siparisBaglantisiOpsiyonelMi => switch (this) {
    EditTipiEnum.depoTransferi ||
    EditTipiEnum.olcumdenDepoTransferi => yetkiController.transferLokalDatSiparisBaglantisiOpsiyonelMi,
    EditTipiEnum.ambarGirisi => yetkiController.transferAgSiparisBaglantisiOpsiyonelMi,
    EditTipiEnum.ambarCikisi => yetkiController.transferAcSiparisBaglantisiOpsiyonelMi,
    EditTipiEnum.isEmri || EditTipiEnum.altIsEmri => true,
    _ => true,
  };

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
      return yetkiController.talepTeklifEkAlan2AktifMi(this);
    }
    if (satisMi) {
      return yetkiController.satisEkAlan2AktifMi;
    } else {
      return yetkiController.alisEkAlan2AktifMi;
    }
  }

  bool belgeTipleriVarMi(int value) => switch (this) {
    EditTipiEnum.satisFatura => yetkiController.sevkiyatSatisFatBelgeTipleri(value),
    EditTipiEnum.satisIrsaliye => yetkiController.sevkiyatSatisIrsBelgeTipleri(value),
    EditTipiEnum.alisFatura => yetkiController.malKabulAlisFatBelgeTipleri(value),
    EditTipiEnum.alisIrsaliye => yetkiController.malKabulAlisIrsBelgeTipleri(value),
    _ => false,
  };

  bool get eklensinMi => switch (this) {
    EditTipiEnum.musteri => yetkiController.siparisMSKaydet,
    EditTipiEnum.satici => yetkiController.siparisSSKaydet,
    EditTipiEnum.satisFatura => yetkiController.satisFatEkle,
    EditTipiEnum.satisIrsaliye => yetkiController.satisIrsEkle,
    EditTipiEnum.alisFatura => yetkiController.alisFatEkle,
    EditTipiEnum.alisIrsaliye => yetkiController.alisIrsEkle,
    EditTipiEnum.satisTeklifi => yetkiController.satisTeklifiEkle,
    EditTipiEnum.alisTalebi => yetkiController.alisTalebiEkle,
    EditTipiEnum.satisTalebi => yetkiController.satisTalebiEkle,
    EditTipiEnum.depoTransferi || EditTipiEnum.olcumdenDepoTransferi => yetkiController.transferDatEkle,
    EditTipiEnum.ambarGirisi => yetkiController.transferAGEkle,
    EditTipiEnum.ambarCikisi => yetkiController.transferACEkle,
    EditTipiEnum.cari => yetkiController.cariKartiYeniKayit, //TODO
    EditTipiEnum.isEmri ||
    EditTipiEnum.altIsEmri ||
    EditTipiEnum.isEmriTakip ||
    EditTipiEnum.uretimSonuKaydi ||
    EditTipiEnum.uretim ||
    EditTipiEnum.paket ||
    EditTipiEnum.belgesizIslem => false,
  };

  bool get goruntulensinMi => switch (this) {
    EditTipiEnum.musteri => yetkiController.siparisMSGoruntule,
    EditTipiEnum.satici => yetkiController.siparisSSGoruntule,
    EditTipiEnum.satisFatura => yetkiController.satisFatGoruntule,
    EditTipiEnum.satisIrsaliye => yetkiController.satisIrsGoruntule,
    EditTipiEnum.alisFatura => yetkiController.alisFatGoruntule,
    EditTipiEnum.alisIrsaliye => yetkiController.alisIrsGoruntule,
    EditTipiEnum.satisTeklifi => yetkiController.satisTeklifiGoruntule,
    EditTipiEnum.alisTalebi => yetkiController.alisTalebiGoruntule,
    EditTipiEnum.satisTalebi => yetkiController.satisTalebiGoruntule,
    EditTipiEnum.depoTransferi || EditTipiEnum.olcumdenDepoTransferi => yetkiController.transferDatGoruntule,
    EditTipiEnum.ambarGirisi => yetkiController.transferAGGoruntule,
    EditTipiEnum.ambarCikisi => yetkiController.transferACGoruntule,
    EditTipiEnum.cari => yetkiController.cariKartiGoruntuleme,
    EditTipiEnum.isEmri ||
    EditTipiEnum.altIsEmri ||
    EditTipiEnum.isEmriTakip ||
    EditTipiEnum.uretimSonuKaydi ||
    EditTipiEnum.uretim ||
    EditTipiEnum.paket ||
    EditTipiEnum.belgesizIslem => true,
  };

  bool get duzenlensinMi => switch (this) {
    EditTipiEnum.musteri => yetkiController.siparisMSDuzelt,
    EditTipiEnum.satici => yetkiController.siparisSSDuzelt,
    EditTipiEnum.satisFatura => yetkiController.satisFatDuzenle,
    EditTipiEnum.satisIrsaliye => yetkiController.satisIrsDuzenle,
    EditTipiEnum.alisFatura => yetkiController.alisFatDuzenle,
    EditTipiEnum.alisIrsaliye => yetkiController.alisIrsDuzenle,
    EditTipiEnum.satisTeklifi => yetkiController.satisTeklifiDuzenle,
    EditTipiEnum.alisTalebi => yetkiController.alisTalebiDuzenle,
    EditTipiEnum.satisTalebi => yetkiController.satisTalebiDuzenle,
    EditTipiEnum.depoTransferi || EditTipiEnum.olcumdenDepoTransferi => yetkiController.transferDatDuzenle,
    EditTipiEnum.ambarGirisi => yetkiController.transferAGDuzenle,
    EditTipiEnum.ambarCikisi => yetkiController.transferACDuzenle,
    EditTipiEnum.cari => yetkiController.cariKartiDuzenleme,
    EditTipiEnum.isEmri ||
    EditTipiEnum.altIsEmri ||
    EditTipiEnum.isEmriTakip ||
    EditTipiEnum.uretimSonuKaydi ||
    EditTipiEnum.uretim ||
    EditTipiEnum.paket ||
    EditTipiEnum.belgesizIslem => false,
  };

  bool get silinsinMi => switch (this) {
    EditTipiEnum.musteri => yetkiController.siparisMSSil,
    EditTipiEnum.satici => yetkiController.siparisSSSil,
    EditTipiEnum.satisFatura => yetkiController.satisFatSil,
    EditTipiEnum.satisIrsaliye => yetkiController.satisIrsSil,
    EditTipiEnum.alisFatura => yetkiController.alisFatSil,
    EditTipiEnum.alisIrsaliye => yetkiController.alisIrsSil,
    EditTipiEnum.satisTeklifi => yetkiController.satisTeklifiSil,
    EditTipiEnum.alisTalebi => yetkiController.alisTalebiSil,
    EditTipiEnum.satisTalebi => yetkiController.satisTalebiSil,
    EditTipiEnum.depoTransferi || EditTipiEnum.olcumdenDepoTransferi => yetkiController.transferDatSil,
    EditTipiEnum.ambarGirisi => yetkiController.transferAGSil,
    EditTipiEnum.ambarCikisi => yetkiController.transferACSil,
    EditTipiEnum.cari => yetkiController.cariKartiSilme,
    EditTipiEnum.isEmri ||
    EditTipiEnum.altIsEmri ||
    EditTipiEnum.isEmriTakip ||
    EditTipiEnum.uretimSonuKaydi ||
    EditTipiEnum.uretim ||
    EditTipiEnum.paket ||
    EditTipiEnum.belgesizIslem => false,
  };

  bool get transferMi => switch (this) {
    EditTipiEnum.depoTransferi ||
    EditTipiEnum.olcumdenDepoTransferi ||
    EditTipiEnum.ambarGirisi ||
    EditTipiEnum.ambarCikisi => true,
    _ => false,
  };

  bool get siparisMi => switch (this) {
    EditTipiEnum.musteri || EditTipiEnum.satici => true,
    _ => false,
  };

  int? get varsayilanBelgeTipi {
    final profilYetki = CacheManager.getAnaVeri?.userModel?.profilYetki;
    if (AccountModel.instance.adminMi) {
      return 2;
    }
    const exceptionList = [0, null];
    return switch (this) {
      EditTipiEnum.satisFatura =>
        exceptionList.contains(profilYetki?.sevkiyatSatisFatVarsayilanBelgeTipi)
            ? 2
            : profilYetki?.sevkiyatSatisFatVarsayilanBelgeTipi,
      EditTipiEnum.satisIrsaliye =>
        exceptionList.contains(profilYetki?.sevkiyatSatisIrsVarsayilanBelgeTipi)
            ? 2
            : profilYetki?.sevkiyatSatisIrsVarsayilanBelgeTipi,
      _ => 2,
    };
  }

  bool get faturaMi => switch (this) {
    EditTipiEnum.satisFatura ||
    EditTipiEnum.satisIrsaliye ||
    EditTipiEnum.alisFatura ||
    EditTipiEnum.alisIrsaliye ||
    EditTipiEnum.ambarGirisi ||
    EditTipiEnum.ambarCikisi ||
    EditTipiEnum.cari => true,
    _ => false,
  };

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

  String get getRoute => switch (this) {
    EditTipiEnum.musteri => "/mainPage/siparisMusteriSiparisi",
    EditTipiEnum.satici => "/mainPage/siparisSaticiSiparisi",
    _ => "/mainPage/siparisSaticiSiparisi",
  };

  String get getEditRoute => switch (this) {
    EditTipiEnum.musteri || EditTipiEnum.satici => "/mainPage/siparisEdit",
    EditTipiEnum.satisFatura ||
    EditTipiEnum.alisFatura ||
    EditTipiEnum.alisIrsaliye ||
    EditTipiEnum.satisIrsaliye => "/mainPage/faturaEdit",
    EditTipiEnum.satisTeklifi || EditTipiEnum.alisTalebi || EditTipiEnum.satisTalebi => "/mainPage/talTekEdit",
    EditTipiEnum.depoTransferi ||
    EditTipiEnum.olcumdenDepoTransferi ||
    EditTipiEnum.ambarGirisi ||
    EditTipiEnum.ambarCikisi => "/mainPage/transferEdit",
    _ => throw Exception("Edit route bulunamadı"),
  };

  String get getListRoute => switch (this) {
    EditTipiEnum.satisFatura => "/mainPage/sevkiyatSatisFaturasi",
    EditTipiEnum.satisIrsaliye => "/mainPage/sevkiyatSatisIrsaliyesi",
    EditTipiEnum.alisFatura => "/mainPage/malKabulAlisFaturasi",
    EditTipiEnum.alisIrsaliye => "/mainPage/malKabulAlisIrsaliyesi",
    EditTipiEnum.musteri => "/mainPage/siparisMusteriSiparisi",
    EditTipiEnum.satici => "/mainPage/siparisSaticiSiparisi",
    EditTipiEnum.satisTeklifi => "/mainPage/talTekSatisTeklif",
    EditTipiEnum.alisTalebi => "/mainPage/talTekAlisTalep",
    EditTipiEnum.satisTalebi => "/mainPage/talTekSatisTalep",
    EditTipiEnum.depoTransferi || EditTipiEnum.olcumdenDepoTransferi => "/mainPage/transferDepo",
    EditTipiEnum.ambarGirisi => "/mainPage/transferAmbarGirisi",
    EditTipiEnum.ambarCikisi => "/mainPage/transferAmbarCikisi",

    _ => throw Exception("List route bulunamadı"),
  };

  String get aciklamaDuzenleRoute => switch (this) {
    EditTipiEnum.satisFatura => "/mainPage/faturaSatisFaturasiAciklamaDuzenle",
    EditTipiEnum.satisIrsaliye => "/mainPage/faturaSatisIrsaliyesiAciklamaDuzenle",
    EditTipiEnum.alisFatura => "/mainPage/faturaAlisFaturasiAciklamaDuzenle",
    EditTipiEnum.alisIrsaliye => "/mainPage/faturaAlisIrsaliyesiAciklamaDuzenle",
    EditTipiEnum.satisTeklifi => "/mainPage/talTekSatisTeklifAciklamaDuzenle",
    EditTipiEnum.alisTalebi => "/mainPage/talTekAlisTalepAciklamaDuzenle",
    EditTipiEnum.satisTalebi => "/mainPage/talTekSatisTalepAciklamaDuzenle",
    EditTipiEnum.depoTransferi || EditTipiEnum.olcumdenDepoTransferi => "/mainPage/transferDepoAciklamaDuzenle",
    EditTipiEnum.ambarGirisi => "/mainPage/transferAmbarGirisiAciklamaDuzenle",
    EditTipiEnum.ambarCikisi => "/mainPage/transferAmbarCikisiAciklamaDuzenle",
    _ => throw Exception("Açıklama düzenleme route bulunamadı"),
  };

  EditTipiEnum? getEditTipiEnumWithRawValue(String? rawValue) =>
      EditTipiEnum.values.firstWhereOrNull((element) => element.rawValue == rawValue);

  String aciklamaLabel(int value) {
    final ParamModel? paramModel = CacheManager.getAnaVeri?.paramModel;
    String? label;
    if (talepTeklifMi) {
      final TalTekParam? talTekParam = paramModel?.talTekParam?.firstWhereOrNull(
        (element) => element.belgeTipi == rawValue,
      );
      switch (value) {
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
      switch (value) {
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
      switch (value) {
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
    return label ?? "Açıklama $value";
  }


  // bool satirAciklamaGorunecekMi(int index) switch (this) {
  //   if (talepTeklifMi) {
  //     return yetkiController.satirAciklamaAlanlari(this, index);
  //   }
  //   if (satisMi) {
  //     return yetkiController.satisSatirAciklamaGoster(index);
  //   } else {
  //     return yetkiController.alisSatirAciklamaGoster(index);
  //   }
}
