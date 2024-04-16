import "package:freezed_annotation/freezed_annotation.dart";
import "package:picker/core/base/model/base_network_mixin.dart";
import "package:picker/view/main_page/alt_sayfalar/kalite_kontrol/olcum_ekle/model/olcum_ekle_model.dart";

part "olcum_belge_edit_model.freezed.dart";
part "olcum_belge_edit_model.g.dart";

@unfreezed
class OlcumBelgeEditModel with _$OlcumBelgeEditModel, NetworkManagerMixin {
  OlcumBelgeEditModel._();
  factory OlcumBelgeEditModel({
    String? belgeNo,
    String? belgeTipi,
    int? belgeSira,
    String? stokKodu,
    String? yapkod,
    String? opkodu,
    String? kayitOperator,
    List<OlcumBelgeModel>? belge,
    List<OlcumOlcumlerModel>? olcumler,
    List<OlcumProsesModel>? prosesler,
  }) = _OlcumBelgeEditModel;

  factory OlcumBelgeEditModel.fromJson(Map<String, dynamic> json) => _$OlcumBelgeEditModelFromJson(json);

  @override
  OlcumBelgeEditModel fromJson(Map<String, dynamic> json) => _$OlcumBelgeEditModelFromJson(json);
}

@unfreezed
class OlcumBelgeModel with _$OlcumBelgeModel {
  factory OlcumBelgeModel({
    String? belgeNo,
    String? belgeTipi,
    DateTime? tarih,
    int? sira,
    String? stokKodu,
    String? stokAdi,
    double? miktar,
  }) = _OlcumBelgeModel;

  factory OlcumBelgeModel.fromJson(Map<String, dynamic> json) => _$OlcumBelgeModelFromJson(json);
}

@unfreezed
class OlcumOlcumlerModel with _$OlcumOlcumlerModel {
  factory OlcumOlcumlerModel({
    int? id,
    int? belgeSira,
    String? stokKodu,
    String? stokAdi,
    String? olcumlerOperator,
    String? kayityapankul,
    DateTime? kayittarihi,
    int? sira,
    double? kabulAdet,
    double? sartliAdet,
    double? retAdet,
  }) = _OlcumOlcumlerModel;

  factory OlcumOlcumlerModel.fromJson(Map<String, dynamic> json) => _$OlcumOlcumlerModelFromJson(json);
}

@unfreezed
class OlcumProsesModel with _$OlcumProsesModel {
  factory OlcumProsesModel({
    int? id,
    int? sira,
    String? proses,
    String? kriter,
    String? kabulSarti,
    String? tolerans,
    String? ekipman,
    String? olculecekmi,
    String? onemlimi,
    double? altSinir,
    double? ustSinir,
    String? tur,
    int? olcumSikligi,
    int? numuneMiktari,
    OlcumEkleProsesModel? numunler,
  }) = _OlcumProsesModel;

  factory OlcumProsesModel.fromJson(Map<String, dynamic> json) => _$OlcumProsesModelFromJson(json);
}

extension OlcumBelgeEditModelExtensions on OlcumBelgeEditModel {
  OlcumBelgeModel? get olcumModel => belge?.firstOrNull;
}

extension OlcumProsesModelExtensions on OlcumProsesModel {
  bool get olculecekMi => olculecekmi == "E" ? true : false;
}
