import "package:freezed_annotation/freezed_annotation.dart";

import "../../../../../../core/base/model/base_network_mixin.dart";
import "../../olcum_belge_edit/model/olcum_belge_edit_model.dart";

part "olcum_ekle_model.freezed.dart";
part "olcum_ekle_model.g.dart";

@unfreezed
sealed class OlcumEkleModel with _$OlcumEkleModel, NetworkManagerMixin {
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
    String? seriNo,
    double? miktar,
    int? belgeId,
    bool? tamamlandi,
    List<OlcumProsesModel>? prosesler,
  }) = _OlcumEkleModel;

  factory OlcumEkleModel.fromOlcumBelgeEditModel(OlcumBelgeEditModel model) => OlcumEkleModel(
    belgeNo: model.belge?.firstOrNull?.belgeNo,
    belgeTipi: model.belge?.firstOrNull?.belgeTipi,
    stokKodu: model.belge?.firstOrNull?.stokKodu,
    belgeSira: model.belge?.firstOrNull?.belgeSira,
    belgeId: model.olcumler?.firstOrNull?.id,
    yapkod: model.yapkod,
    opkodu: model.opkodu,
    kayitOperator: model.kayitOperatorKodu,
    prosesler: model.prosesler,
    seriNo: model.seriNo,
  );
  OlcumEkleModel._();

  factory OlcumEkleModel.fromJson(Map<String, dynamic> json) => _$OlcumEkleModelFromJson(json);

  @override
  OlcumEkleModel fromJson(Map<String, dynamic> json) => _$OlcumEkleModelFromJson(json);
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
