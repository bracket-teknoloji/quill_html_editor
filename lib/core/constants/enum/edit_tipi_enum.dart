import "package:get/get.dart";
import "package:hive_flutter/hive_flutter.dart";
import "package:picker/view/main_page/model/param_model.dart";

import "../../../view/main_page/alt_sayfalar/siparis/base_siparis_edit/model/base_siparis_edit_model.dart";
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
    }
  }

  bool get satisMi {
    switch (this) {
      case EditTipiEnum.musteri:
      case EditTipiEnum.satisFatura:
      case EditTipiEnum.satisIrsaliye:
      case EditTipiEnum.satisTeklifi:
      case EditTipiEnum.satisTalebi:
        return true;
      case EditTipiEnum.satici:
      case EditTipiEnum.alisFatura:
      case EditTipiEnum.alisIrsaliye:
      case EditTipiEnum.alisTalebi:
        return false;
    }
  }

  bool get talepTeklifMi {
    switch (this) {
      case EditTipiEnum.satisTeklifi:
      case EditTipiEnum.alisTalebi:
      case EditTipiEnum.satisTalebi:
        return true;
      case EditTipiEnum.musteri:
      case EditTipiEnum.satici:
      case EditTipiEnum.satisFatura:
      case EditTipiEnum.satisIrsaliye:
      case EditTipiEnum.alisFatura:
      case EditTipiEnum.alisIrsaliye:
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
      default:
        return true;
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
    }
  }

  bool get irsaliyeMi {
    switch (this) {
      case EditTipiEnum.musteri:
      case EditTipiEnum.satici:
      case EditTipiEnum.satisFatura:
      case EditTipiEnum.alisFatura:
      case EditTipiEnum.satisTeklifi:
      case EditTipiEnum.alisTalebi:
      case EditTipiEnum.satisTalebi:
        return false;
      case EditTipiEnum.satisIrsaliye:
      case EditTipiEnum.alisIrsaliye:
        return true;
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
    }else if (satisMi){
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
