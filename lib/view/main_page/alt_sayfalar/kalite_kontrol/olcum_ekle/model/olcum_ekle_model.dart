import "package:freezed_annotation/freezed_annotation.dart";
import "package:picker/core/base/model/base_network_mixin.dart";
import "package:picker/view/main_page/alt_sayfalar/kalite_kontrol/olcum_belge_edit/model/olcum_belge_edit_model.dart";

part "olcum_ekle_model.freezed.dart";
part "olcum_ekle_model.g.dart";

@unfreezed
class OlcumEkleModel with _$OlcumEkleModel, NetworkManagerMixin {
  OlcumEkleModel._();

  factory OlcumEkleModel({
    String? belgeNo,
    String? belgeTipi,
    int? belgeSira,
    String? stokKodu,
    String? yapkod,
    String? opkodu,
    String? kayitOperator,
    DateTime? tarih,
    int? sira,
    String? stokAdi,
    double? miktar,
    int? belgeId,
    List<OlcumProsesModel>? prosesler,
  }) = _OlcumEkleModel;

  factory OlcumEkleModel.fromJson(Map<String, dynamic> json) => _$OlcumEkleModelFromJson(json);

  @override
  OlcumEkleModel fromJson(Map<String, dynamic> json) => _$OlcumEkleModelFromJson(json);

  factory OlcumEkleModel.fromOlcumBelgeEditModel(OlcumBelgeEditModel model) => OlcumEkleModel(
        belgeNo: model.belge?.first.belgeNo,
        belgeTipi: model.belge?.first.belgeTipi,
        stokKodu: model.belge?.first.stokKodu,
        belgeSira: model.belge?.first.sira,
        belgeId: model.olcumler?.firstOrNull?.id,
        yapkod: model.yapkod,
        opkodu: model.opkodu,
        kayitOperator: model.kayitOperator,
        prosesler: model.prosesler,
      );
}

// @unfreezed
// class OlcumEkleProsesModel with _$OlcumEkleProsesModel {
//   factory OlcumEkleProsesModel({
//     int? prosesId,
//     int? detayId,
//     String? sonuc,
//     String? sartliKabulNedeni,
//     String? aciklama,
//     String? kayitOperator,
//     List<OlcumEkleDetayModel>? olcumler,
//   }) = _OlcumEkleProsesModel;

//   factory OlcumEkleProsesModel.fromJson(Map<String, dynamic> json) => _$OlcumEkleProsesModelFromJson(json);

//   factory OlcumEkleProsesModel.fromOlcumProsesModel(OlcumProsesModel model) => OlcumEkleProsesModel(
//         prosesId: model.id,
//       );
// }

// @unfreezed
// class OlcumEkleDetayModel with _$OlcumEkleDetayModel {
//   factory OlcumEkleDetayModel({
//     double? deger,
//     int? detayId,
//     DateTime? zaman,
//   }) = _OlcumEkleDetayModel;

//   factory OlcumEkleDetayModel.fromJson(Map<String, dynamic> json) => _$OlcumEkleDetayModelFromJson(json);
// }

// extension OlcumEkleDetayModelExtensions on OlcumEkleDetayModel? {
//   bool isDegerValid => this?.deger >
// }
