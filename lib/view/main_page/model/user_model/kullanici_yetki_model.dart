import "dart:convert";

import "package:freezed_annotation/freezed_annotation.dart";

part "kullanici_yetki_model.freezed.dart";
part "kullanici_yetki_model.g.dart";

@unfreezed
class KullaniciYetkiModel with _$KullaniciYetkiModel {
  @JsonSerializable(createFactory: true)
  factory KullaniciYetkiModel({
    @JsonKey(name: "bagliPlasiyerler") List<String?>? bagliPlasiyerler,
    @JsonKey(name: "eIrsOnEki") String? eIrsOnEki,
    @JsonKey(name: "eIrsAmbarOnEki") String? eIrsAmbarOnEki,
    @JsonKey(name: "yetkiliKasalar") List<String>? yetkiliKasalar,
    @JsonKey(name: "kkartiHesaplar") List<String>? kkartiHesaplar,
    @JsonKey(name: "kkartiKasalar") List<String>? kkartiKasalar,
    @JsonKey(name: "acikHesapLimiti") double? acikHesapLimiti,
    @JsonKey(name: "acikHesapTolerans") double? acikHesapTolerans,
    @JsonKey(name: "acikHesapLimitiBelgeTipleri") List? acikHesapLimitiBelgeTipleri,
    @JsonKey(name: "stok_FiltreSQLTipi") String? stokFiltreSQLTipi,
    @JsonKey(name: "cari_FiltreSQLTipi") String? cariFiltreSQLTipi,
    @JsonKey(name: "hizliTahsilat_SozlesmeKodlari") List? hizliTahsilatSozlesmeKodlari,
    @JsonKey(name: "siparis_MusSip_EkstraAlanlar") List? siparisMusSipEkstraAlanlar,
    @JsonKey(name: "sirket_alisDepo") int? sirketAlisDepo,
    @JsonKey(name: "sirket_satisDepo") int? sirketSatisDepo,
    @JsonKey(name: "transfer_DAT_VarsayilanCikisDepo") int? transferDATVarsayilanCikisDepo,
    @JsonKey(name: "transfer_DAT_VarsayilanGirisDepo") int? transferDATVarsayilanGirisDepo,
    @JsonKey(name: "cariRehPlaEslesmesinBelgeTipleri") List<dynamic>? cariRehPlaEslesmesinBelgeTipleri,
    @JsonKey(name: "profilKodu") String? profilKodu,
    @JsonKey(name: "sirket_aktifDepolar") List<int>? sirketAktifDepolar,
    @JsonKey(name: "sirket_DAT_YetkiliDepolar") List<int>? sirketDatYetkiliDepolar,
    @JsonKey(name: "ADMIN_MI") bool? adminMi,
    @JsonKey(name: "varsayilan_PlasiyerTanimi") String? varsayilanPlasiyerTanimi,
    @JsonKey(name: "siparis_MusSip_BakiyesizStokSecilmesin") bool? siparisMusSipBakiyesizStokSecilmesin,
    @JsonKey(name: "sevkiyat_SatisIrs_BakiyesizStokSecilmesin") bool? sevkiyatSatisIrsBakiyesizStokSecilmesin,
    @JsonKey(name: "sevkiyat_SatisFat_BakiyesizStokSecilmesin") bool? sevkiyatSatisFatBakiyesizStokSecilmesin,
    @JsonKey(name: "plasiyerKodu") String? plasiyerKodu,
    @JsonKey(name: "varsayilan_PlasiyerKodu") String? varsayilanPlasiyerKodu,
    @JsonKey(name: "kkartiTahsilatYontemi") String? kkartiTahsilatYontemi,
    @JsonKey(name: "satIrsOnEki") String? satIrsOnEki,
    @JsonKey(name: "varsayilanNakitKasa") String? varsayilanNakitKasa,
    @JsonKey(name: "sirket_Depo_YetkiTuru") String? sirketDepoYetkiTuru,
    @JsonKey(name: "varsayilan_ProjeTanimi") String? varsayilanProjeTanimi,
    @JsonKey(name: "varsayilan_ProjeKodu") String? varsayilanProjeKodu,
    @JsonKey(name: "varsayilanKrediKartiKasa") String? varsayilanKrediKartiKasa,
    @JsonKey(name: "varsayilan_MuhasebeReferansTanimi") String? varsayilanMuhasebeReferansTanimi,
    @JsonKey(name: "varsayilan_MuhasebeReferansKodu") String? varsayilanMuhasebeReferansKodu,
    @JsonKey(name: "satSipOnEki") String? satSipOnEki,
    @JsonKey(name: "musSipOnEki") String? musSipOnEki,
    @JsonKey(name: "alIrsOnEki") String? alIrsOnEki,
    @JsonKey(name: "eFatOnEki") String? eFatOnEki,
    @JsonKey(name: "eArvOnEki") String? eArvOnEki,
    @JsonKey(name: "satAlmTalOnEki") String? satAlmTalOnEki,
    @JsonKey(name: "satisTalOnEki") String? satisTalOnEki,
    @JsonKey(name: "satAlmTekOnEki") String? satAlmTekOnEki,
    @JsonKey(name: "satisTekOnEki") String? satisTekOnEki,
    @JsonKey(name: "tahsilatOnEki") String? tahsilatOnEki,
    @JsonKey(name: "sevkEmriOnEki") String? sevkEmriOnEki,
    @JsonKey(name: "kkTahsilatOnEki") String? kkTahsilatOnEki,
    @JsonKey(name: "eIrsDATOnEki") String? eIrsDatOnEki,
    @JsonKey(name: "DATOnEki") String? datOnEki,
    @JsonKey(name: "ambarCikisOnEki") String? ambarCikisOnEki,
    @JsonKey(name: "ambarGirisOnEki") String? ambarGirisOnEki,
    @JsonKey(name: "cariOnEki") String? cariOnEki,
    @JsonKey(name: "uskOnEki") String? uskOnEki,
    @JsonKey(name: "alisFatOnEki") String? alisFatOnEki,
    @JsonKey(name: "satisFatOnEki") String? satisFatOnEki,
    @JsonKey(name: "dekSeri_CekTahsil") String? dekSeriCekTahsil,
    @JsonKey(name: "dekSeri_KKartiTahsilati") String? dekSeriKKartiTahsilati,
    @JsonKey(name: "dekSeri_CariEFT") String? dekSeriCariEft,
    @JsonKey(name: "dekSeri_HesArasiVirman") String? dekSeriHesArasiVirman,
    @JsonKey(name: "dekSeri_HesArasiEFT") String? dekSeriHesArasiEft,
    @JsonKey(name: "dekSeri_CariVirman") String? dekSeriCariVirman,
  }) = _KullaniciYetkiModel;

  factory KullaniciYetkiModel.fromJson(String? json) => _$KullaniciYetkiModelFromJson(jsonDecode(json ?? "{}"));
}
