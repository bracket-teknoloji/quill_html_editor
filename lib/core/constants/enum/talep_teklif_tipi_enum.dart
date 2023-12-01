import "package:picker/core/constants/yetki_controller/yetki_controller.dart";
import "package:picker/core/init/cache/cache_manager.dart";
import "package:picker/view/main_page/model/param_model.dart";

enum TalepTeklifEnum {
  satisTalep,
  satisTeklif,
  alisTalep,
}

extension TalepTeklifEnumExtension on TalepTeklifEnum {
  String get rawValue {
    switch (this) {
      case TalepTeklifEnum.satisTalep:
        return "STAL";
      case TalepTeklifEnum.satisTeklif:
        return "STEK";
      case TalepTeklifEnum.alisTalep:
        return "ATAL";
    }
  }

  String get getName {
    switch (this) {
      case TalepTeklifEnum.satisTalep:
        return "Satış Talebi";
      case TalepTeklifEnum.satisTeklif:
        return "Satış Teklifi";
      case TalepTeklifEnum.alisTalep:
        return "Alış Talebi";
    }
  }

  String get getPrintValue {
    switch (this) {
      case TalepTeklifEnum.satisTalep:
        return "SatisTalebi";
      case TalepTeklifEnum.satisTeklif:
        return "SatisTeklifi";
      case TalepTeklifEnum.alisTalep:
        return "AlisTalebi";
    }
  }

  bool get satisMi {
    switch (this) {
      case TalepTeklifEnum.satisTalep:
      case TalepTeklifEnum.satisTeklif:
        return true;
      case TalepTeklifEnum.alisTalep:
        return false;
    }
  }

  bool get alisMi {
    switch (this) {
      case TalepTeklifEnum.satisTalep:
      case TalepTeklifEnum.satisTeklif:
        return false;
      case TalepTeklifEnum.alisTalep:
        return true;
    }
  }

  String get aciklamaDuzenleRoute {
    switch (this) {
      case TalepTeklifEnum.satisTalep:
        return "/mainPage/talTekSatisTalepAciklamaDuzenle";
      case TalepTeklifEnum.satisTeklif:
        return "/mainPage/talTekSatisTeklifAciklamaDuzenle";
      case TalepTeklifEnum.alisTalep:
        return "/mainPage/talTekAlisTalepAciklamaDuzenle";
    }
  }

  bool get silinebilirMi {
    switch (this) {
      case TalepTeklifEnum.satisTalep:
        return YetkiController().satisTalebiSil;
      case TalepTeklifEnum.satisTeklif:
        return YetkiController().satisTeklifiSil;
      case TalepTeklifEnum.alisTalep:
        return YetkiController().alisTalebiSil;
    }
  }

  String aciklamaLabel(int index) {
    final ParamModel? paramModel = CacheManager.getAnaVeri?.paramModel;
    String? label;
    if (satisMi) {
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
