import "package:picker/core/constants/yetki_controller/yetki_controller.dart";

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
        return "/talTekSatisTalepAciklamaDuzenle";
      case TalepTeklifEnum.satisTeklif:
        return "/talTekSatisTeklifAciklamaDuzenle";
      case TalepTeklifEnum.alisTalep:
        return "/talTekAlisTalepAciklamaDuzenle";
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
}
