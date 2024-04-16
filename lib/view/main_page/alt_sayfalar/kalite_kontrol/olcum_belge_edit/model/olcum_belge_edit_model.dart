import "package:freezed_annotation/freezed_annotation.dart";
import "package:picker/core/base/model/base_network_mixin.dart";
import "package:picker/core/constants/enum/badge_color_enum.dart";

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
class OlcumProsesModel with _$OlcumProsesModel, NetworkManagerMixin {
  OlcumProsesModel._();
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
    int? detayId,
    String? prosesTipi,
    String? sonuc,
    String? sartliKabulNedeni,
    String? sartliKabulNedeniAciklama,
    String? olcumOperatorModelOperator,
    OlcumProsesModel? numuneler,
    int? prosesId,
    String? aciklama,
    String? kayitOperator,
    List<OlcumEkleDetayModel>? olcumler,
  }) = _OlcumProsesModel;

  factory OlcumProsesModel.fromJson(Map<String, dynamic> json) => _$OlcumProsesModelFromJson(json);

  @override
  OlcumProsesModel fromJson(Map<String, dynamic> json) => _$OlcumProsesModelFromJson(json);

  // factory OlcumProsesModel.fromOlcumProsesModel()
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

extension OlcumBelgeEditModelExtensions on OlcumBelgeEditModel {
  OlcumBelgeModel? get olcumModel => belge?.firstOrNull;
}

extension OlcumEkleProsesExtensions on OlcumProsesModel? {
  bool get olculecekMi => this?.olculecekmi == "E" ? true : false;
  String get sonucAdi {
    switch (this?.sonuc) {
      case null:
        return "";
      case "K":
        return "Kabul";
      case "R":
        return "Ret";
      case "S":
        return "Şartlı Kabul (${this?.sartliKabulNedeni})";
      default:
        return "";
    }
  }

  BadgeColorEnum get cardColor {
    switch (this?.sonuc) {
      case null:
        return BadgeColorEnum.basarili;
      case "K":
        return BadgeColorEnum.basarili;
      case "R":
        return BadgeColorEnum.hata;
      case "S":
        return BadgeColorEnum.uyari;
      default:
        return BadgeColorEnum.uyari;
    }
  }
}
