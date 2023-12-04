import "package:collection/collection.dart";
import "package:hive_flutter/hive_flutter.dart";
import "package:picker/view/main_page/model/param_model.dart";

import "../../../view/main_page/alt_sayfalar/siparis/base_siparis_edit/model/base_siparis_edit_model.dart";
import "../../init/cache/cache_manager.dart";
import "../yetki_controller/yetki_controller.dart";

part "siparis_tipi_enum.g.dart";

@HiveType(typeId: 79)
enum SiparisTipiEnum {
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
}

extension SiparisTipiEnumExtension on SiparisTipiEnum {
  static YetkiController yetkiController = YetkiController();
  String get rawValue {
    switch (this) {
      case SiparisTipiEnum.musteri:
        return "MS";
      case SiparisTipiEnum.satici:
        return "SS";
      case SiparisTipiEnum.satisFatura:
        return "SF";
      case SiparisTipiEnum.satisIrsaliye:
        return "SI";
      case SiparisTipiEnum.alisFatura:
        return "AF";
      case SiparisTipiEnum.alisIrsaliye:
        return "AI";
      case SiparisTipiEnum.satisTeklifi:
        return "STEK";
      case SiparisTipiEnum.alisTalebi:
        return "ATAL";
      case SiparisTipiEnum.satisTalebi:
        return "STAL";
    }
  }

  String get getName {
    switch (this) {
      case SiparisTipiEnum.musteri:
        return "Müşteri Siparişi";
      case SiparisTipiEnum.satici:
        return "Satıcı Siparişi";
      case SiparisTipiEnum.satisFatura:
        return "Satış Faturası";
      case SiparisTipiEnum.satisIrsaliye:
        return "Satış İrsaliyesi";
      case SiparisTipiEnum.alisFatura:
        return "Alış Faturası";
      case SiparisTipiEnum.alisIrsaliye:
        return "Alış İrsaliyesi";
      case SiparisTipiEnum.satisTeklifi:
        return "Satış Teklifi";
      case SiparisTipiEnum.alisTalebi:
        return "Alış Talebi";
      case SiparisTipiEnum.satisTalebi:
        return "Satış Talebi";
    }
  }

  String get getPrintValue {
    switch (this) {
      case SiparisTipiEnum.musteri:
        return "MusteriSiparisi";
      case SiparisTipiEnum.satici:
        return "SaticiSiparisi";
      case SiparisTipiEnum.satisFatura:
        return "SatisFaturasi";
      case SiparisTipiEnum.satisIrsaliye:
        return "SatisIrsaliyesi";
      case SiparisTipiEnum.alisFatura:
        return "AlisFaturasi";
      case SiparisTipiEnum.alisIrsaliye:
        return "AlisIrsaliyesi";
      case SiparisTipiEnum.satisTeklifi:
        return "SatisTeklifi";
      case SiparisTipiEnum.alisTalebi:
        return "AlisTalebi";
      case SiparisTipiEnum.satisTalebi:
        return "SatisTalebi";
    }
  }

  bool get satisMi {
    switch (this) {
      case SiparisTipiEnum.musteri:
      case SiparisTipiEnum.satisFatura:
      case SiparisTipiEnum.satisIrsaliye:
      case SiparisTipiEnum.satisTeklifi:
      case SiparisTipiEnum.satisTalebi:
        return true;
      case SiparisTipiEnum.satici:
      case SiparisTipiEnum.alisFatura:
      case SiparisTipiEnum.alisIrsaliye:
      case SiparisTipiEnum.alisTalebi:
        return false;
    }
  }

  bool get digerSekmesiGoster {
    switch (this) {
      case SiparisTipiEnum.musteri:
      case SiparisTipiEnum.satici:
        return yetkiController.siparisDigerSekmesiGoster;
      case SiparisTipiEnum.satisFatura:
        return yetkiController.satisFatDigerSekmesiGelsin;
      case SiparisTipiEnum.satisIrsaliye:
        return yetkiController.satisIrsDigerSekmesiGelsin;
      case SiparisTipiEnum.alisFatura:
        return yetkiController.alisFatDigerSekmesiGelsin;
      case SiparisTipiEnum.alisIrsaliye:
        return yetkiController.alisIrsDigerSekmesiGelsin;
      default:
        return true;
    }
  }

  bool get eklensinMi {
    switch (this) {
      case SiparisTipiEnum.musteri:
        return yetkiController.siparisMSKaydet;
      case SiparisTipiEnum.satici:
        return yetkiController.siparisSSKaydet;
      case SiparisTipiEnum.satisFatura:
        return yetkiController.satisFatEkle;
      case SiparisTipiEnum.satisIrsaliye:
        return yetkiController.satisIrsEkle;
      case SiparisTipiEnum.alisFatura:
        return yetkiController.alisFatEkle;
      case SiparisTipiEnum.alisIrsaliye:
        return yetkiController.alisIrsEkle;
      case SiparisTipiEnum.satisTeklifi:
        return yetkiController.satisTeklifiEkle;
      case SiparisTipiEnum.alisTalebi:
        return yetkiController.alisTalebiEkle;
      case SiparisTipiEnum.satisTalebi:
        return yetkiController.satisTalebiEkle;
    }
  }

  bool get duzenlensinMi {
    switch (this) {
      case SiparisTipiEnum.musteri:
        return yetkiController.siparisMSDuzelt;
      case SiparisTipiEnum.satici:
        return yetkiController.siparisSSDuzelt;
      case SiparisTipiEnum.satisFatura:
        return yetkiController.satisFatDuzenle;
      case SiparisTipiEnum.satisIrsaliye:
        return yetkiController.satisIrsDuzenle;
      case SiparisTipiEnum.alisFatura:
        return yetkiController.alisFatDuzenle;
      case SiparisTipiEnum.alisIrsaliye:
        return yetkiController.alisIrsDuzenle;
        case SiparisTipiEnum.satisTeklifi:
        return yetkiController.satisTeklifiDuzenle;
      case SiparisTipiEnum.alisTalebi:
        return yetkiController.alisTalebiDuzenle;
      case SiparisTipiEnum.satisTalebi:
        return yetkiController.satisTalebiDuzenle;
    }
  }

  bool get silinsinMi {
    switch (this) {
      case SiparisTipiEnum.musteri:
        return yetkiController.siparisMSSil;
      case SiparisTipiEnum.satici:
        return yetkiController.siparisSSSil;
      case SiparisTipiEnum.satisFatura:
        return yetkiController.satisFatSil;
      case SiparisTipiEnum.satisIrsaliye:
        return yetkiController.satisIrsSil;
      case SiparisTipiEnum.alisFatura:
        return yetkiController.alisFatSil;
      case SiparisTipiEnum.alisIrsaliye:
        return yetkiController.alisIrsSil;
      case SiparisTipiEnum.satisTeklifi:
        return yetkiController.satisTeklifiSil;
      case SiparisTipiEnum.alisTalebi:
        return yetkiController.alisTalebiSil;
      case SiparisTipiEnum.satisTalebi:
        return yetkiController.satisTalebiSil;
    }
  }

  bool get irsaliyeMi {
    switch (this) {
      case SiparisTipiEnum.musteri:
      case SiparisTipiEnum.satici:
      case SiparisTipiEnum.satisFatura:
      case SiparisTipiEnum.alisFatura:
      case SiparisTipiEnum.satisTeklifi:
      case SiparisTipiEnum.alisTalebi:
      case SiparisTipiEnum.satisTalebi:
        return false;
      case SiparisTipiEnum.satisIrsaliye:
      case SiparisTipiEnum.alisIrsaliye:
        return true;
    }
  }

  // BaseSiparisEditModel? get getEditModel {
  //   switch (this) {
  //     case SiparisTipiEnum.musteri:
  //     case SiparisTipiEnum.satici:
  //       return CacheManager.getSiparisEdit(BaseSiparisEditModel.instance.belgeNo ?? "");
  //     case SiparisTipiEnum.satisFatura:
  //     case SiparisTipiEnum.satisIrsaliye:
  //     case SiparisTipiEnum.alisFatura:
  //     case SiparisTipiEnum.alisIrsaliye:
  //       return CacheManager.getFaturaEdit(BaseSiparisEditModel.instance.belgeNo ?? "");
  //   }
  // }

  void setEditModel() {
    switch (this) {
      case SiparisTipiEnum.musteri:
      case SiparisTipiEnum.satici:
        CacheManager.setSiparisEdit(BaseSiparisEditModel.instance);
      case SiparisTipiEnum.satisFatura:
      case SiparisTipiEnum.satisIrsaliye:
      case SiparisTipiEnum.alisFatura:
      case SiparisTipiEnum.alisIrsaliye:
        CacheManager.setFaturaEdit(BaseSiparisEditModel.instance);
      case SiparisTipiEnum.satisTeklifi:
      case SiparisTipiEnum.alisTalebi:
      case SiparisTipiEnum.satisTalebi:
        CacheManager.setTalepTeklifEdit(BaseSiparisEditModel.instance);
    }
  }

  void get addEditListItem {
    switch (this) {
      case SiparisTipiEnum.musteri:
      case SiparisTipiEnum.satici:
        CacheManager.addSiparisEditListItem(BaseSiparisEditModel.instance);
      case SiparisTipiEnum.satisFatura:
      case SiparisTipiEnum.satisIrsaliye:
      case SiparisTipiEnum.alisFatura:
      case SiparisTipiEnum.alisIrsaliye:
        CacheManager.addFaturaEditListItem(BaseSiparisEditModel.instance);
      case SiparisTipiEnum.satisTeklifi:
      case SiparisTipiEnum.alisTalebi:
      case SiparisTipiEnum.satisTalebi:
        CacheManager.addTalepTeklifEditListItem(BaseSiparisEditModel.instance);
    }
  }

  String get getRoute {
    switch (this) {
      case SiparisTipiEnum.musteri:
        return "/mainPage/siparisMusteriSiparisi";
      case SiparisTipiEnum.satici:
        return "/mainPage/siparisSaticiSiparisi";
      default:
        return "/mainPage/siparisSaticiSiparisi";
    }
  }

  SiparisTipiEnum? getSiparisTipiEnumWithRawValue(String? rawValue) => SiparisTipiEnum.values.firstWhereOrNull((element) => element.rawValue == rawValue);


  String aciklamaLabel(int index) {
    final ParamModel? paramModel = CacheManager.getAnaVeri?.paramModel;
    String? label;
    if (satisMi) {
      final TalTekParam? talTekParam = paramModel?.talTekParam?.firstWhere((element) => element.belgeTipi == rawValue);
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
