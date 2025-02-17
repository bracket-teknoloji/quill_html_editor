import "../yetki_controller/yetki_controller.dart";

enum CekSenetListesiEnum { cekMusteri, senetMusteri, cekBorc, senetBorc }

extension CekSenetExtensions on CekSenetListesiEnum {
  YetkiController get _yetkiController => YetkiController();
  String get title => switch (this) {
    CekSenetListesiEnum.cekMusteri => "Müşteri Çekleri",
    CekSenetListesiEnum.senetMusteri => "Müşteri Senetleri",
    CekSenetListesiEnum.cekBorc => "Borç Çekleri",
    CekSenetListesiEnum.senetBorc => "Borç Senetleri",
  };

  String get dekontTitle => switch (this) {
    CekSenetListesiEnum.cekBorc => "Çek Ödeme Dekontu",
    CekSenetListesiEnum.cekMusteri => "Çek Tahsil Dekontu",
    CekSenetListesiEnum.senetBorc => "Senet Ödeme Dekontu",
    CekSenetListesiEnum.senetMusteri => "Senet Tahsil Dekontu",
  };

  String get dekontAciklama => switch (this) {
    CekSenetListesiEnum.senetBorc => "No. Senet Ode.",
    CekSenetListesiEnum.senetMusteri => "No. Senet Tah.",
    CekSenetListesiEnum.cekBorc => "No. Çek Ode.",
    CekSenetListesiEnum.cekMusteri => "No. Çek. Tah.",
  };

  String get belgeTipi => switch (this) {
    CekSenetListesiEnum.cekMusteri => "MCEK",
    CekSenetListesiEnum.senetMusteri => "MSEN",
    CekSenetListesiEnum.cekBorc => "BCEK",
    CekSenetListesiEnum.senetBorc => "BSEN",
  };

  bool get silebilirMi => switch (this) {
    CekSenetListesiEnum.cekMusteri => _yetkiController.musteriCekSil,
    CekSenetListesiEnum.senetMusteri => _yetkiController.musteriSenetSil,
    CekSenetListesiEnum.cekBorc => _yetkiController.borcCekSil,
    CekSenetListesiEnum.senetBorc => _yetkiController.borcSenetSil,
  };

  bool get eklenebilirMi => switch (this) {
    CekSenetListesiEnum.cekMusteri => _yetkiController.musteriCekEkle,
    CekSenetListesiEnum.senetMusteri => _yetkiController.musteriSenetEkle,
    CekSenetListesiEnum.cekBorc => _yetkiController.borcCekEkle,
    CekSenetListesiEnum.senetBorc => _yetkiController.borcSenetEkle,
  };

  bool get hareketlerGorulebilirMi => switch (this) {
    CekSenetListesiEnum.cekMusteri => _yetkiController.musteriCekHareketler,
    CekSenetListesiEnum.senetMusteri => _yetkiController.musteriSenetHareketler,
    CekSenetListesiEnum.cekBorc => _yetkiController.borcCekHareketler,
    CekSenetListesiEnum.senetBorc => _yetkiController.borcSenetHareketler,
  };

  bool get borcMu => switch (this) {
    CekSenetListesiEnum.cekMusteri || CekSenetListesiEnum.senetMusteri => false,
    CekSenetListesiEnum.cekBorc || CekSenetListesiEnum.senetBorc => true,
  };

  bool get tahsilatCirola => switch (this) {
    CekSenetListesiEnum.cekMusteri => _yetkiController.musteriCekTahsilHesabinaCirola,
    CekSenetListesiEnum.senetMusteri => _yetkiController.musteriSenetTahsilHesabinaCirola,
    _ => false,
  };

  bool get cariHesabinaCirola => switch (this) {
    CekSenetListesiEnum.cekMusteri => _yetkiController.musteriCekTahsilHesabinaCirola,
    CekSenetListesiEnum.senetMusteri => _yetkiController.musteriSenetTahsilHesabinaCirola,
    _ => false,
  };

  bool get tahsilDekontu => switch (this) {
    CekSenetListesiEnum.cekMusteri => _yetkiController.musteriCekTahsilHesabinaCirola,
    CekSenetListesiEnum.senetMusteri => _yetkiController.musteriSenetTahsilHesabinaCirola,
    _ => false,
  };

  String get tahsilatRoute => switch (this) {
    CekSenetListesiEnum.cekMusteri => "/mainPage/cekMusteriTahsilat",
    CekSenetListesiEnum.senetMusteri => "/mainPage/senetMusteriTahsilat",
    CekSenetListesiEnum.cekBorc => "/mainPage/cekBorcTahsilat",
    CekSenetListesiEnum.senetBorc => "/mainPage/senetBorcTahsilat",
  };

  bool get cekMi => switch (this) {
    CekSenetListesiEnum.cekMusteri || CekSenetListesiEnum.cekBorc => true,
    CekSenetListesiEnum.senetMusteri || CekSenetListesiEnum.senetBorc => false,
  };

  String get dekontIslemTuru => switch (this) {
    CekSenetListesiEnum.cekBorc => "BCO",
    CekSenetListesiEnum.senetBorc => "BSO",
    CekSenetListesiEnum.cekMusteri => "DCT",
    CekSenetListesiEnum.senetMusteri => "DST",
  };

  String get tahsilatEkleRoute => switch (this) {
    CekSenetListesiEnum.cekMusteri => "/mainPage/cekMusteriTahsilatEkle",
    CekSenetListesiEnum.senetMusteri => "/mainPage/senetMusteriTahsilatEkle",
    CekSenetListesiEnum.cekBorc => "/mainPage/cekBorcTahsilatEkle",
    CekSenetListesiEnum.senetBorc => "/mainPage/senetBorcTahsilatEkle",
  };
}
