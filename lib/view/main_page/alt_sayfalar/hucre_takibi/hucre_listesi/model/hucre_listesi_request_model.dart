import "package:freezed_annotation/freezed_annotation.dart";

part "hucre_listesi_request_model.freezed.dart";
part "hucre_listesi_request_model.g.dart";

@freezed
class HucreListesiRequestModel with _$HucreListesiRequestModel {
  @JsonSerializable(fieldRename: FieldRename.pascal)
  factory HucreListesiRequestModel({
    @Default(0) int? depoKodu,
    @Default("") String? hucreKodu,
    @Default("") String? filterText,
    String? tempBarkod,
    int? inckeyno,
    String? depoTanimi,
    int? hareketId,
    String? kayitTipi,
    String? kayitTipiAdi,
    String? belgeNo,
    String? belgeTipi,
    String? belgeTipiAdi,
    String? haracik,
    String? gckod,
    int? subeKodu,
    DateTime? tarih,
    int? stharInc,
    int? yedek4,
    String? yedek4Str,

    //    'YEDEK8 Açıklamalar;
    // 'N : Sevk emri mal toplama
    // 'T : Servo geçici seri kullanım kayıtları.
    // 'P : Paketleme(TBLNF_PCIPAKET,Üretime mal toplama vs)
    // 'S : Picker seri parçalama
    // 'B : Picker seri birleştirme
    // 'D : Picker Depo Talep
    String? yedek8,
    int? seriSayisi,
    String? paketKodu,
    String? cariKodu,
  }) = _HucreListesiRequestModel;

  factory HucreListesiRequestModel.fromJson(Map<String, dynamic> json) => _$HucreListesiRequestModelFromJson(json);
}
