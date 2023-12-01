

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
}