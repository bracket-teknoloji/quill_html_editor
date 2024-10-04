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

  String get dekontTitle {
    switch (this) {
      case CekSenetListesiEnum.cekBorc:
        return "Çek Ödeme Dekontu";
      case CekSenetListesiEnum.cekMusteri:
        return "Çek Tahsil Dekontu";
      case CekSenetListesiEnum.senetBorc:
        return "Senet Ödeme Dekontu";
      case CekSenetListesiEnum.senetMusteri:
        return "Senet Tahsil Dekontu";
    }
  }

  String get dekontAciklama {
    switch (this) {
      case CekSenetListesiEnum.senetBorc:
        return "No. Senet Ode.";
      case CekSenetListesiEnum.senetMusteri:
        return "No. Senet Tah.";
      case CekSenetListesiEnum.cekBorc:
        return "No. Çek Ode.";
      case CekSenetListesiEnum.cekMusteri:
        return "No. Çek. Tah.";
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

  bool get borcMu {
    switch (this) {
      case CekSenetListesiEnum.cekMusteri:
      case CekSenetListesiEnum.senetMusteri:
        return false;
      case CekSenetListesiEnum.cekBorc:
      case CekSenetListesiEnum.senetBorc:
        return true;
    }
  }

  bool get tahsilatCirola => switch (this) {
        CekSenetListesiEnum.cekMusteri => _yetkiController.musteriCekTahsilHesabinaCirola,
        CekSenetListesiEnum.senetMusteri => _yetkiController.musteriSenetTahsilHesabinaCirola,
        _ => false
      };

  bool get cariHesabinaCirola => switch (this) {
        CekSenetListesiEnum.cekMusteri => _yetkiController.musteriCekTahsilHesabinaCirola,
        CekSenetListesiEnum.senetMusteri => _yetkiController.musteriSenetTahsilHesabinaCirola,
        _ => false
      };

  bool get tahsilDekontu => switch (this) {
        CekSenetListesiEnum.cekMusteri => _yetkiController.musteriCekTahsilHesabinaCirola,
        CekSenetListesiEnum.senetMusteri => _yetkiController.musteriSenetTahsilHesabinaCirola,
        _ => false
      };

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

  bool get cekMi {
    switch (this) {
      case CekSenetListesiEnum.cekMusteri:
      case CekSenetListesiEnum.cekBorc:
        return true;
      case CekSenetListesiEnum.senetMusteri:
      case CekSenetListesiEnum.senetBorc:
        return false;
    }
  }

  String get dekontIslemTuru {
    switch (this) {
      case CekSenetListesiEnum.cekBorc:
        return "BCO";
      case CekSenetListesiEnum.senetBorc:
        return "BSO";
      case CekSenetListesiEnum.cekMusteri:
        return "DCT";
      case CekSenetListesiEnum.senetMusteri:
        return "DST";
    }
  }

  String get tahsilatEkleRoute {
    switch (this) {
      case CekSenetListesiEnum.cekMusteri:
        return "/mainPage/cekMusteriTahsilatEkle";
      case CekSenetListesiEnum.senetMusteri:
        return "/mainPage/senetMusteriTahsilatEkle";
      case CekSenetListesiEnum.cekBorc:
        return "/mainPage/cekBorcTahsilatEkle";
      case CekSenetListesiEnum.senetBorc:
        return "/mainPage/senetBorcTahsilatEkle";
    }
  }
}
