import "package:freezed_annotation/freezed_annotation.dart";

import "../../../../../view/main_page/alt_sayfalar/siparis/base_siparis_edit/model/base_siparis_edit_model.dart";
import "../../../../constants/extensions/date_time_extensions.dart";

part "stok_rehberi_request_model.freezed.dart";
part "stok_rehberi_request_model.g.dart";

@unfreezed
class StokRehberiRequestModel with _$StokRehberiRequestModel {
  @JsonSerializable(fieldRename: FieldRename.pascal)
  factory StokRehberiRequestModel({
    String? belgeNo,
    String? belgeTarihi,
    String? belgeTipi,
    String? cariKodu,
    @Default("D") String? ekranTipi,
    int? faturaTipi,
    bool? kisitYok,
    String? menuKodu,
    String? resimGoster,
    String? stokKodu,
    String? seriTakibiVar,
    int? depoKodu,
  }) = _StokRehberiRequestModel;

  factory StokRehberiRequestModel.fromJson(Map<String, dynamic> json) => _$StokRehberiRequestModelFromJson(json);

  factory StokRehberiRequestModel.fromKalemModel(KalemModel model) => StokRehberiRequestModel(
        belgeNo: model.belgeNo,
        belgeTarihi: model.tarih.toDateString,
        kisitYok: true,
        menuKodu: "COMM_FKDE",
        belgeTipi: model.belgeTipi,
        cariKodu: model.cariKodu,
        stokKodu: model.stokKodu,
      );
}
