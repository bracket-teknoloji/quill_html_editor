import "../yetki_controller/yetki_controller.dart";

enum CekSenetListesiEnum { cekMusteri, senetMusteri, cekBorc, senetBorc }

extension CekSenetExtensions on CekSenetListesiEnum {
  YetkiController get _yetkiController => YetkiController();
  String get title {
    switch (this) {
      case CekSenetListesiEnum.cekMusteri:
        return "Müşteri Çekleri";
      case CekSenetListesiEnum.senetMusteri:
        return "Müşteri Senetleri";
      case CekSenetListesiEnum.cekBorc:
        return "Borç Çekleri";
      case CekSenetListesiEnum.senetBorc:
        return "Borç Senetleri";
    }
  }

  String get belgeTipi {
    switch (this) {
      case CekSenetListesiEnum.cekMusteri:
        return "MCEK";
      case CekSenetListesiEnum.senetMusteri:
        return "MSEN";
      case CekSenetListesiEnum.cekBorc:
        return "BCEK";
      case CekSenetListesiEnum.senetBorc:
        return "BSEN";
    }
  }

  bool get silebilirMi {
    switch (this) {
      case CekSenetListesiEnum.cekMusteri:
        return _yetkiController.musteriCekSil;
      case CekSenetListesiEnum.senetMusteri:
        return _yetkiController.musteriSenetSil;
      case CekSenetListesiEnum.cekBorc:
        return _yetkiController.borcCekSil;
      case CekSenetListesiEnum.senetBorc:
        return _yetkiController.borcSenetSil;
    }
  }

  bool get eklenebilirMi {
    switch (this) {
      case CekSenetListesiEnum.cekMusteri:
        return _yetkiController.musteriCekEkle;
      case CekSenetListesiEnum.senetMusteri:
        return _yetkiController.musteriSenetEkle;
      case CekSenetListesiEnum.cekBorc:
        return _yetkiController.borcCekEkle;
      case CekSenetListesiEnum.senetBorc:
        return _yetkiController.borcSenetEkle;
    }
  }

  bool get hareketlerGorulebilirMi {
    switch (this) {
      case CekSenetListesiEnum.cekMusteri:
        return _yetkiController.musteriCekHareketler;
      case CekSenetListesiEnum.senetMusteri:
        return _yetkiController.musteriSenetHareketler;
      case CekSenetListesiEnum.cekBorc:
        return _yetkiController.borcCekHareketler;
      case CekSenetListesiEnum.senetBorc:
        return _yetkiController.borcSenetHareketler;
    }
  }

  String get tahsilatRoute {
    switch (this) {
      case CekSenetListesiEnum.cekMusteri:
        return "/mainPage/cekMusteriTahsilat";
      case CekSenetListesiEnum.senetMusteri:
        return "/mainPage/senetMusteriTahsilat";
      case CekSenetListesiEnum.cekBorc:
        return "/mainPage/cekBorcTahsilat";
      case CekSenetListesiEnum.senetBorc:
        return "/mainPage/senetBorcTahsilat";
    }
  }
}
