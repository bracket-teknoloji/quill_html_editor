import "package:freezed_annotation/freezed_annotation.dart";
import "package:picker/view/main_page/alt_sayfalar/cari/cari_hareketleri/model/cari_hareketleri_model.dart";

part "kasa_islemleri_request_model.freezed.dart";
part "kasa_islemleri_request_model.g.dart";

@unfreezed
class KasaIslemleriRequestModel with _$KasaIslemleriRequestModel {
  @JsonSerializable(fieldRename: FieldRename.pascal)
  factory KasaIslemleriRequestModel({
    String? baslamaTarihi,
    String? bitisTarihi,
    String? menuKodu,
    int? sayfa,
    String? plasiyerKodu,
    String? hesapTipi,
    String? hesapKodu,
    String? kasaKodu,
    String? gc,
    bool? kisitYok,
    String? refKey,
  }) = _KasaIslemleriRequestModel;

  factory KasaIslemleriRequestModel.fromJson(Map<String, dynamic> json) => _$KasaIslemleriRequestModelFromJson(json);

  factory KasaIslemleriRequestModel.fromCariHareketleriModel(CariHareketleriModel model) => KasaIslemleriRequestModel(
        refKey: model.refkey,
        kisitYok: true,
        menuKodu: "KASA_HARD",
      );
}
