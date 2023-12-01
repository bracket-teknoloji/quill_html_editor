import "package:freezed_annotation/freezed_annotation.dart";
import "package:picker/core/base/model/base_network_mixin.dart";
import "package:picker/view/main_page/alt_sayfalar/siparis/siparisler/model/kalem_list_model.dart";

part "talep_teklif_listesi_model.freezed.dart";
part "talep_teklif_listesi_model.g.dart";

@unfreezed
class TalepTeklifListesiModel with _$TalepTeklifListesiModel, NetworkManagerMixin {
  TalepTeklifListesiModel._();
  factory TalepTeklifListesiModel({
    bool? cariDovizli,
    DateTime? kayittarihi,
    DateTime? tarih,
    DateTime? teslimTarihi,
    DateTime? vadeTarihi,
    double? dovizTutari,
    double? genelIskonto1,
    double? genelIskonto2,
    double? genelIskonto3,
    double? genelToplam,
    double? genIsk1O,
    double? genisk1Tipi,
    double? genIsk2O,
    double? genIsk3O,
    double? kalanMiktar,
    double? kdv,
    double? miktar,
    double? tamamlananMiktar,
    int? dovizTipi,
    int? genisk3Tipi,
    int? kalemAdedi,
    int? tipi,
    int? vadeGunu,
    List<dynamic>? tempSipList,
    List<KalemListModel>? kalemList,
    String? acik1,
    String? acik2,
    String? acik3,
    String? belgeKodu,
    String? belgeNo,
    String? belgeTuru,
    String? cariAdi,
    String? cariKodu,
    String? cYedek6,
    String? dovizAdi,
    String? ekAciklama,
    String? faturalasti,
    String? kasaKodu,
    String? kayityapankul,
    String? kdvDahil,
    String? plasiyerAciklama,
    String? plasiyerKodu,
    String? siparislesti,
  }) = _TalepTeklifListesiModel;

  factory TalepTeklifListesiModel.fromJson(Map<String, dynamic> json) => _$TalepTeklifListesiModelFromJson(json);

  @override
  TalepTeklifListesiModel fromJson(Map<String, dynamic> json) => _$TalepTeklifListesiModelFromJson(json);
}
