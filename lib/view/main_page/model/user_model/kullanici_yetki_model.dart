import "dart:convert";

import "package:freezed_annotation/freezed_annotation.dart";

part "kullanici_yetki_model.freezed.dart";
part "kullanici_yetki_model.g.dart";

@freezed
class KullaniciYetkiModel with _$KullaniciYetkiModel {
  @JsonSerializable(createFactory: true)
  const factory KullaniciYetkiModel({
    @JsonKey(name: "bagliPlasiyerler") List? bagliPlasiyerler,
    @JsonKey(name: "eIrsOnEki") String? eIrsOnEki,
    @JsonKey(name: "eIrsAmbarOnEki") String? eIrsAmbarOnEki,
    @JsonKey(name: "yetkiliKasalar") List? yetkiliKasalar,
    @JsonKey(name: "kkartiHesaplar") List? kkartiHesaplar,
    @JsonKey(name: "kkartiKasalar") List? kkartiKasalar,
    @JsonKey(name: "acikHesapLimiti") double? acikHesapLimiti,
    @JsonKey(name: "acikHesapTolerans") double? acikHesapTolerans,
    @JsonKey(name: "acikHesapLimitiBelgeTipleri")
    List? acikHesapLimitiBelgeTipleri,
    @JsonKey(name: "stok_FiltreSQLTipi") String? stokFiltreSQLTipi,
    @JsonKey(name: "cari_FiltreSQLTipi") String? cariFiltreSQLTipi,
    @JsonKey(name: "hizliTahsilat_SozlesmeKodlari")
    List? hizliTahsilatSozlesmeKodlari,
    @JsonKey(name: "siparis_MusSip_EkstraAlanlar")
    List? siparisMusSipEkstraAlanlar,
    @JsonKey(name: "sirket_alisDepo") int? sirketAlisDepo,
    @JsonKey(name: "sirket_satisDepo") int? sirketSatisDepo,
    @JsonKey(name: "transfer_DAT_VarsayilanCikisDepo")
    int? transferDATVarsayilanCikisDepo,
    @JsonKey(name: "transfer_DAT_VarsayilanGirisDepo")
    int? transferDATVarsayilanGirisDepo,
  }) = _KullaniciYetkiModel;

  factory KullaniciYetkiModel.fromJson(String json) =>
      _$KullaniciYetkiModelFromJson(jsonDecode(json));
}
