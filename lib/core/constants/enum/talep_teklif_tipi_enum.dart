import "package:get/get.dart";

import "../../../view/main_page/model/param_model.dart";
import "../../init/cache/cache_manager.dart";
import "../yetki_controller/yetki_controller.dart";

enum TalepTeklifEnum {
  satisTalep,
  satisTeklif,
  alisTalep,
}

extension TalepTeklifEnumExtension on TalepTeklifEnum {
  String get rawValue => switch (this) {
        TalepTeklifEnum.satisTalep => "STAL",
        TalepTeklifEnum.satisTeklif => "STEK",
        TalepTeklifEnum.alisTalep => "ATAL",
      };

  String get getName => switch (this) {
        TalepTeklifEnum.satisTalep => "Satış Talebi",
        TalepTeklifEnum.satisTeklif => "Satış Teklifi",
        TalepTeklifEnum.alisTalep => "Alış Talebi",
      };

  String get getPrintValue => switch (this) {
        TalepTeklifEnum.satisTalep => "SatisTalebi",
        TalepTeklifEnum.satisTeklif => "SatisTeklifi",
        TalepTeklifEnum.alisTalep => "AlisTalebi",
      };

  bool get satisMi => switch (this) {
        TalepTeklifEnum.satisTalep || TalepTeklifEnum.satisTeklif => true,
        TalepTeklifEnum.alisTalep => false,
      };

  bool get alisMi => switch (this) {
        TalepTeklifEnum.satisTalep || TalepTeklifEnum.satisTeklif => false,
        TalepTeklifEnum.alisTalep => true,
      };

  String get aciklamaDuzenleRoute => switch (this) {
        TalepTeklifEnum.satisTalep => "/mainPage/talTekSatisTalepAciklamaDuzenle",
        TalepTeklifEnum.satisTeklif => "/mainPage/talTekSatisTeklifAciklamaDuzenle",
        TalepTeklifEnum.alisTalep => "/mainPage/talTekAlisTalepAciklamaDuzenle",
      };

  bool get silinebilirMi => switch (this) {
        TalepTeklifEnum.satisTalep => YetkiController().satisTalebiSil,
        TalepTeklifEnum.satisTeklif => YetkiController().satisTeklifiSil,
        TalepTeklifEnum.alisTalep => YetkiController().alisTalebiSil,
      };

  String aciklamaLabel(int index) {
    final ParamModel? paramModel = CacheManager.getAnaVeri?.paramModel;
    String? label;
    if (satisMi) {
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
