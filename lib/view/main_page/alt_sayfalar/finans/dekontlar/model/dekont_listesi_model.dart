import "package:freezed_annotation/freezed_annotation.dart";

import "../../../../../../core/base/model/base_network_mixin.dart";
import "../../../cari/cari_hareketleri/model/cari_hareketleri_model.dart";
import "../../../e_belge/e_belge_gelen_giden_kutusu/model/e_belge_listesi_model.dart";
import "../dekont_edit/model/dekont_duzenle_request_model.dart";

part "dekont_listesi_model.freezed.dart";
part "dekont_listesi_model.g.dart";

@unfreezed
class DekontListesiModel with _$DekontListesiModel, NetworkManagerMixin {
  DekontListesiModel._();
  factory DekontListesiModel({
    int? inckeyno,
    String? seri,
    int? dekontNo,
    DateTime? tarih,
    int? kalemSayisi,
    double? borcToplami,
    String? seriAdi,
  }) = _DekontListesiModel;

  factory DekontListesiModel.fromJson(Map<String, dynamic> json) => _$DekontListesiModelFromJson(json);

  @override
  DekontListesiModel fromJson(Map<String, dynamic> json) => DekontListesiModel.fromJson(json);

  factory DekontListesiModel.fromCariHareketleriModel(CariHareketleriModel model) => DekontListesiModel(
        inckeyno: model.inckeyno,
        // dekontNo: model.hare,
        // tarih: model.tarih,
        // borcToplami: model.borcToplami,
        // seriAdi: model.dekontSeriAdi,
      );

  factory DekontListesiModel.fromDekontDuzenleRequestModel(DekontDuzenleRequestModel model) => DekontListesiModel(
        dekontNo: model.dekontNo,
        seri: model.seriNo,
      );

  factory DekontListesiModel.fromEBelgeListesiModel(EBelgeListesiModel model) => DekontListesiModel();
}

extension DekontListesiExtensions on DekontListesiModel {
  String get title => "$seri-$dekontNo";

  Map<String, dynamic> get queryParam => {
        "DekontNo": dekontNo,
        "SeriNo": seri,
      };
}
