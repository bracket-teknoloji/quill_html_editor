enum IslemTipiEnum {
  stok,
  cari,
  cariIslemleri,
  stokRapor,
  cariRapor,
  stokSerbest,
  cariSerbest,
  siparis,
  kasa,
  cariHareketleri,
  banka,
  bankaIslemleri,
  cekSenet,
  tahsilatOdeme,
  fatura,
  talepTeklif,
  eBelge,
  depoTransferi,
}

extension IslemTipiEnumExtension on IslemTipiEnum {
  String get value {
    //return capitalized with method
    if (this != IslemTipiEnum.siparis && this != IslemTipiEnum.cariIslemleri) {
      return "${toString().split('.').last[0].toUpperCase()}${toString().split('.').last.substring(1)}";
    } else if (this == IslemTipiEnum.cariIslemleri) {
      return "Cari";
    } else {
      return "Sipariş";
    }
  }

  String get route {
    if (this == IslemTipiEnum.cari) {
      return "/mainPage/cariEdit";
    } else if (this == IslemTipiEnum.stok) {
      return "/mainPage/stokEdit";
    } else if (this == IslemTipiEnum.siparis) {
      return "/mainPage/siparisEdit";
    } else if (this == IslemTipiEnum.kasa) {
      return "/mainPage/kasaEdit";
    } else if (this == IslemTipiEnum.fatura) {
      return "/mainPage/faturaEdit";
    } else if (this == IslemTipiEnum.talepTeklif) {
      return "/mainPage/talTekEdit";
    } else if (this == IslemTipiEnum.depoTransferi) {
      return "/mainPage/transferEdit";
    } else {
      return "/mainPage/rapor";
    }
  }
}
