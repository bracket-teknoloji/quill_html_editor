import "e_belge_enum.dart";
import "../yetki_controller/yetki_controller.dart";

enum EBelgeTuruEnum { fatura, arsiv, irsaliye }

extension EBelgeTuruEnumExtensions on EBelgeTuruEnum {
  YetkiController get _yetkiController => YetkiController();

  String get name {
    switch (this) {
      case EBelgeTuruEnum.fatura:
        return "E-Fatura";
      case EBelgeTuruEnum.arsiv:
        return "E-Arşiv";
      case EBelgeTuruEnum.irsaliye:
        return "E-İrsaliye";
    }
  }

  String get value {
    switch (this) {
      case EBelgeTuruEnum.fatura:
        return "EFT";
      case EBelgeTuruEnum.arsiv:
        return "AFT";
      case EBelgeTuruEnum.irsaliye:
        return "EIR";
    }
  }

  // bool get yetkiVarMi {
  //   switch (this) {
  //     case EBelgeTuruEnum.fatura:
  //       return _yetkiController.ebelgeEFatura;
  //     case EBelgeTuruEnum.arsiv:
  //       return _yetkiController.ebelgeEArsiv;
  //     case EBelgeTuruEnum.irsaliye:
  //       return _yetkiController.ebelgeEIrsaliye;
  //   }
  // }

  bool get goruntule {
    switch (this) {
      case EBelgeTuruEnum.fatura:
        return _yetkiController.ebelgeEFaturaGoruntule;
      case EBelgeTuruEnum.arsiv:
        return _yetkiController.ebelgeEArsivGoruntule;
      case EBelgeTuruEnum.irsaliye:
        return _yetkiController.ebelgeEIrsaliyeGoruntule;
    }
  }

  bool yetkiVarMi(EBelgeEnum eBelgeEnum) {
    if (eBelgeEnum == EBelgeEnum.gelen) {
      switch (this) {
        case EBelgeTuruEnum.fatura:
          return _yetkiController.ebelgeEFaturaGelenKutusu;
        case EBelgeTuruEnum.arsiv:
          return _yetkiController.ebelgeEArsiv;
        case EBelgeTuruEnum.irsaliye:
          return _yetkiController.ebelgeEIrsaliyeGelenKutusu;
        default:
          return false;
      }
    } else {
      switch (this) {
        case EBelgeTuruEnum.fatura:
          return _yetkiController.ebelgeEFaturaGidenKutusu;
        case EBelgeTuruEnum.arsiv:
          return _yetkiController.ebelgeEArsivGidenKutusu;
        case EBelgeTuruEnum.irsaliye:
          return _yetkiController.ebelgeEIrsaliyeGidenKutusu;
      }
    }
  }
}
