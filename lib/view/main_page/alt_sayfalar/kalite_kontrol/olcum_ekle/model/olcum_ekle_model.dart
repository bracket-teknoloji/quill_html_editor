import "package:freezed_annotation/freezed_annotation.dart";
import "package:picker/view/main_page/alt_sayfalar/kalite_kontrol/olcum_belge_edit/model/olcum_belge_edit_model.dart";

part "olcum_ekle_model.freezed.dart";
part "olcum_ekle_model.g.dart";

@unfreezed
class OlcumEkleModel with _$OlcumEkleModel {
  factory OlcumEkleModel({
    String? belgeNo,
    String? belgeTipi,
    String? stokKodu,
    int? belgeSira,
    String? yapkod,
    String? prosesId,
    String? sonuc,
    String? kayitOperator,
    List<OlcumEkleProsesModel>? prosesler,
  }) = _OlcumEkleModel;

  factory OlcumEkleModel.fromJson(Map<String, dynamic> json) => _$OlcumEkleModelFromJson(json);

  factory OlcumEkleModel.fromOlcumGirisiModel(OlcumBelgeModel model) => OlcumEkleModel(
        belgeNo: model.belgeNo,
        belgeTipi: model.belgeTipi,
        stokKodu: model.stokKodu,
      );
}

@unfreezed
class OlcumEkleProsesModel with _$OlcumEkleProsesModel {
  factory OlcumEkleProsesModel({
    String? belgeNo,
    int? belgeSira,
    String? yapkod,
    int? prosesId,
    int? detayId,
    String? sonuc,
    String? sartliKabulNedeni,
    String? aciklama,
    List<OlcumEkleDetayModel>? detaylar,
  }) = _OlcumEkleProsesModel;

  factory OlcumEkleProsesModel.fromJson(Map<String, dynamic> json) => _$OlcumEkleProsesModelFromJson(json);

  factory OlcumEkleProsesModel.fromOlcumProsesModel(OlcumProsesModel model) => OlcumEkleProsesModel(
        belgeSira: model.sira,
        prosesId: model.id,
      );
}

@unfreezed
class OlcumEkleDetayModel with _$OlcumEkleDetayModel {
  factory OlcumEkleDetayModel({
    double? deger,
    int? detayId,
    DateTime? zaman,
  }) = _OlcumEkleDetayModel;

  factory OlcumEkleDetayModel.fromJson(Map<String, dynamic> json) => _$OlcumEkleDetayModelFromJson(json);
}
