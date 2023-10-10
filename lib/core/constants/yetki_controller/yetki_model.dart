class ProfilResponseModel {
  static const String sipBagSecenegiOpsiyonel = "O";
  static const String sipBagSecenegiZorunlu = "E";
  static const String sipBagSecenegiBaglantisiz = "H";

  static const String faturaGizlenecekAlanBelgeTipi = "belge_tipi";
  static const String faturaGizlenecekAlanProje = "proje";
  static const String faturaGizlenecekAlanPlasiyer = "plasiyer";
  static const String faturaGizlenecekAlanSatirIskontolari =
      "satir_iskontolari";
  static const String faturaGizlenecekAlanGenelIskontolar = "genel_iskontolar";
  static const String faturaGizlenecekAlanMalFazIsk = "mal_faz_isk";
  static const String faturaGizlenecekAlanKdvDahilHaric = "kdv_dahil_haric";
  static const String faturaGizlenecekAlanCari =
      "cari"; // şuan için ATAL'da kullanılıyor
  static const String faturaGizlenecekAlanParasal =
      "parasal"; // şuan için ATAL'da kullanılıyor

  // apk 197 ; satır iskontoları gizlenecek alanlar için de kullanılmaya başlandı.
  static const String faturaAlanSatirIsk1 = "sat_isk1"; // apk 137
  static const String faturaAlanSatirIsk2 = "sat_isk2";
  static const String faturaAlanSatirIsk3 = "sat_isk3";
  static const String faturaAlanSatirIsk4 = "sat_isk4";
  static const String faturaAlanSatirIsk5 = "sat_isk5";
  static const String faturaAlanSatirIsk6 = "sat_isk6";

  static const String faturaAlanTopluDepo = "toplu_depo"; // apk 206

  static const String faturaGizlenecekAlanGenIsk1 = "gen_isk1";
  static const String faturaGizlenecekAlanGenIsk2 = "gen_isk2";
  static const String faturaGizlenecekAlanGenIsk3 = "gen_isk3";
  static const String faturaGizlenecekAlanIskTipleri = "isk_tipleri";
  static const String faturaGizlenecekAlanTeslimTarihi =
      "teslim_tarihi"; // apk 170
  static const String faturaGizlenecekAlanEkMaliyet1 = "ek_maliyet1"; // apk 207
  static const String faturaGizlenecekAlanEkMaliyet2 = "ek_maliyet2"; // apk 170
  static const String faturaGizlenecekAlanEkMaliyet3 = "ek_maliyet3"; // apk 207
  static const String faturaGizlenecekAlanEkAlan1 = "ekalan1"; // apk 177
  static const String faturaGizlenecekAlanHizliUrunGirisi =
      "hizli_urun_girisi"; // apk 219

  static const String faturaDegismeyecekAlanKdvOrani = "kdv_orani";
  static const String faturaDegismeyecekAlanKdvDahilHaric = "kdv_dahil_haric";
  static const String faturaDegismeyecekAlanKosul = "kosul";
  static const String faturaDegismeyecekAlanIskontolar = "iskontolar";
  static const String faturaDegismeyecekAlanVadeGunu = "vade_gunu";
  static const String faturaDegismeyecekAlanKalemKosul =
      "kosul_kalem"; // değişmeyecek, gizlenecek alan olarak
  // kullanılıyor. (apk 209)
  // apk 216 (değişmeyecek alan olarak eklendi.)
  static const String faturaDegismeyecekAlanTarih = "tarih";
  static const String faturaDegismeyecekOzelKod1 = "ozelkod1";
  static const String faturaDegismeyecekOzelKod2 = "ozelkod2";
}
