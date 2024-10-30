import "package:freezed_annotation/freezed_annotation.dart";

import "../../../../../../core/base/model/base_network_mixin.dart";
import "../../../../../../core/constants/enum/badge_color_enum.dart";
import "../../../../../../core/constants/enum/edit_tipi_enum.dart";

part "olcum_belge_edit_model.freezed.dart";
part "olcum_belge_edit_model.g.dart";

@unfreezed
class OlcumBelgeEditModel with _$OlcumBelgeEditModel, NetworkManagerMixin {
  OlcumBelgeEditModel._();
  factory OlcumBelgeEditModel({
    String? belgeNo,
    String? belgeTipi,
    int? belgeSira,
    String? seriNo,
    String? stokKodu,
    String? yapkod,
    String? opkodu,
    String? kayitOperator,
    String? kayitOperatorKodu,
    List<OlcumBelgeModel>? belge,
    List<OlcumOlcumlerModel>? olcumler,
    List<OlcumProsesModel>? prosesler,
  }) = _OlcumBelgeEditModel;

  factory OlcumBelgeEditModel.fromJson(Map<String, dynamic> json) => _$OlcumBelgeEditModelFromJson(json);

  @override
  OlcumBelgeEditModel fromJson(Map<String, dynamic> json) => _$OlcumBelgeEditModelFromJson(json);
}

@unfreezed
class OlcumBelgeModel with _$OlcumBelgeModel, NetworkManagerMixin {
  OlcumBelgeModel._();
  factory OlcumBelgeModel({
    String? belgeNo,
    String? belgeTipi,
    int? belgeSira,
    DateTime? tarih,
    int? sira,
    String? stokKodu,
    String? stokAdi,
    double? miktar,
    String? yapkod,
    String? yapacik,
    double? olcumAdedi,
    double? kabulAdet,
    double? sartliAdet,
    double? retAdet,
    String? opkodu,
    String? cariKodu,
    String? cariAdi,
    String? belgeTuru,
    int? kalemAdedi,
    String? seriNo,
    String? prosesVar,
    String? teknikResimVarmi,
    String? kontrolPlaniVarmi,
    String? yarimOlcumYapabilirmi,
    String? opkoduTanimi,
    String? istasyonKodu,
    String? istasyonTanimi,
    int? datAdedi,
    String? seriSorulsunmu,
    String? tur,
    @JsonKey(name: "SearchText") String? searchText,
    @JsonKey(name: "Sayfa") int? sayfa,
  }) = _OlcumBelgeModel;

  factory OlcumBelgeModel.fromJson(Map<String, dynamic> json) => _$OlcumBelgeModelFromJson(json);

  @override
  OlcumBelgeModel fromJson(Map<String, dynamic> json) => _$OlcumBelgeModelFromJson(json);
}

@unfreezed
class OlcumOlcumlerModel with _$OlcumOlcumlerModel, NetworkManagerMixin {
  OlcumOlcumlerModel._();
  factory OlcumOlcumlerModel({
    int? id,
    int? belgeSira,
    String? stokKodu,
    String? stokAdi,
    String? olcumlerOperator,
    String? kayityapankul,
    String? kayitOperator,
    String? kayitOperatorKodu,
    DateTime? kayittarihi,
    double? kabulAdet,
    double? sartliAdet,
    double? retAdet,
    String? seriNo,
    String? tamamlandi,
  }) = _OlcumOlcumlerModel;

  factory OlcumOlcumlerModel.fromJson(Map<String, dynamic> json) => _$OlcumOlcumlerModelFromJson(json);

  @override
  OlcumOlcumlerModel fromJson(Map<String, dynamic> json) => _$OlcumOlcumlerModelFromJson(json);
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
    String? oncekiOlcudeSartlivarmi,
    @JsonKey(includeToJson: false, includeFromJson: false) OlcumProsesModel? numuneler,
    int? prosesId,
    String? aciklama,
    String? kayitOperator,
    String? olcuBirimi,
    String? talno,
    String? form,
    String? detayAciklama,
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
  OlcumBelgeModel? get olcumModel => belge?.lastOrNull;

  // bool get karisikMi => true;
  bool get karisikMi => olcumler?.any((e) => e.karisikMi) == true;

  bool get kabulMu => olcumler?.every((e) => e.kabulMu) == true;

  bool get kabulVarMi => olcumler?.any((e) => e.kabulMu) == true;

  bool get retVarMi => olcumler?.any((e) => e.retMi) == true;

  bool get retMi => olcumler?.every((e) => e.retMi) == true;
}

extension OlcumBelgeModelExtensions on OlcumBelgeModel {
  OlcumBelgeModel get forDetayRequest => OlcumBelgeModel(
        stokKodu: stokKodu,
        yapkod: yapkod,
        opkodu: opkodu,
        belgeNo: belgeNo,
        belgeTipi: belgeTipi,
        belgeSira: sira,
      );

  OlcumBelgeModel get forKalemSec => OlcumBelgeModel(
        belgeNo: belgeNo,
        belgeTipi: belgeTipi,
        sayfa: sayfa,
      );

  OlcumBelgeModel get forTeknikResim => OlcumBelgeModel(
        stokKodu: stokKodu,
        yapkod: yapkod,
        opkodu: opkodu,
        tur: "T",
      );

  OlcumBelgeModel get forDatListesi => OlcumBelgeModel(
        belgeNo: belgeNo,
        belgeTipi: belgeTipi,
      );

  OlcumBelgeModel get forOlcumlerList => OlcumBelgeModel(
        belgeNo: belgeNo,
        belgeTipi: belgeTipi,
        belgeSira: belgeSira,
      );

  OlcumBelgeModel get forKontrolPlani => OlcumBelgeModel(
        stokKodu: stokKodu,
        yapkod: yapkod,
        opkodu: opkodu,
        tur: "K",
      );

  bool get prosesVarMi => prosesVar == "E";

  EditTipiEnum get getEditTipiEnum => EditTipiEnum.values.firstWhere((element) => element.rawValue == belgeTipi);
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
        return "Şartlı Kabul (${this?.sartliKabulNedeniAciklama})";
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

extension OlcumOlcumlerModelExtensions on OlcumOlcumlerModel? {
  bool get retMi => (this?.retAdet ?? 0) > 0;

  bool get kabulMu => ((this?.kabulAdet ?? 0) + (this?.sartliAdet ?? 0)) > 0;

  double? get toplamKabul => (this?.kabulAdet ?? 0) + (this?.sartliAdet ?? 0);

  bool get karisikMi => retMi && kabulMu;
}
