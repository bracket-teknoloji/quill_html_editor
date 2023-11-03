enum IslemTipiEnum { stok, cari, stokRapor, cariRapor, stokSerbest, cariSerbest, siparis, kasa, cariHareketleri, banka}

extension IslemTipiEnumExtension on IslemTipiEnum {
  String get value {
    //return capitalized with method
    if (this != IslemTipiEnum.siparis) {
      return "${toString().split('.').last[0].toUpperCase()}${toString().split('.').last.substring(1)}";
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
    } else {
      return "/mainPage/rapor";
    }
  }
}
