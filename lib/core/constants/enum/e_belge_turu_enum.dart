import "package:picker/core/constants/yetki_controller/yetki_controller.dart";

enum EBelgeTuruEnum { fatura, arsiv, irsaliye }

extension EBelgeTuruEnumExtensions on EBelgeTuruEnum {
  YetkiController get _yetkiController => YetkiController();

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
}
