import "../yetki_controller/yetki_controller.dart";
import "e_belge_enum.dart";

enum EBelgeTuruEnum { fatura, arsiv, irsaliye }

extension EBelgeTuruEnumExtensions on EBelgeTuruEnum {
  YetkiController get _yetkiController => YetkiController();

  String get name => switch (this) {
        EBelgeTuruEnum.fatura => "E-Fatura",
        EBelgeTuruEnum.arsiv => "E-Arşiv",
        EBelgeTuruEnum.irsaliye => "E-İrsaliye",
      };

  String get value => switch (this) {
        EBelgeTuruEnum.fatura => "EFT",
        EBelgeTuruEnum.arsiv => "AFT",
        EBelgeTuruEnum.irsaliye => "EIR",
      };

  bool get goruntule => switch (this) {
        EBelgeTuruEnum.fatura => _yetkiController.ebelgeEFaturaGoruntule,
        EBelgeTuruEnum.arsiv => _yetkiController.ebelgeEArsivGoruntule,
        EBelgeTuruEnum.irsaliye => _yetkiController.ebelgeEIrsaliyeGoruntule
      };

  bool yetkiVarMi(EBelgeEnum eBelgeEnum) {
    if (eBelgeEnum == EBelgeEnum.gelen) {
      return switch (this) {
        EBelgeTuruEnum.fatura => _yetkiController.ebelgeEFaturaGelenKutusu,
        EBelgeTuruEnum.arsiv => _yetkiController.ebelgeEArsiv,
        EBelgeTuruEnum.irsaliye => _yetkiController.ebelgeEIrsaliyeGelenKutusu,
      };
    } else {
      return switch (this) {
        EBelgeTuruEnum.fatura => _yetkiController.ebelgeEFaturaGidenKutusu,
        EBelgeTuruEnum.arsiv => _yetkiController.ebelgeEArsivGidenKutusu,
        EBelgeTuruEnum.irsaliye => _yetkiController.ebelgeEIrsaliyeGidenKutusu
      };
    }
  }
}
