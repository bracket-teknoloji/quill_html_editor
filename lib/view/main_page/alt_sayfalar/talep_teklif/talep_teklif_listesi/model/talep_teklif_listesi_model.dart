import "package:freezed_annotation/freezed_annotation.dart";

import "../../../../../../core/base/model/base_network_mixin.dart";
import "../../../siparis/siparisler/model/kalem_list_model.dart";

part "talep_teklif_listesi_model.freezed.dart";
part "talep_teklif_listesi_model.g.dart";

@unfreezed
class TalepTeklifListesiModel with _$TalepTeklifListesiModel, NetworkManagerMixin {
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
    String? acik4,
    String? acik5,
    String? acik6,
    String? acik7,
    String? acik8,
    String? acik9,
    String? acik10,
    String? acik11,
    String? acik12,
    String? acik13,
    String? acik14,
    String? acik15,
    String? acik16,
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
    String? ekAcik1,
    String? ekAcik10,
    String? ekAcik11,
    String? ekAcik12,
    String? ekAcik13,
    String? ekAcik14,
    String? ekAcik15,
    String? ekAcik16,
    String? ekAcik2,
    String? ekAcik3,
    String? ekAcik4,
    String? ekAcik5,
    String? ekAcik6,
    String? ekAcik7,
    String? ekAcik8,
    String? ekAcik9,
    int? islemKodu,
    @Default("FaturaModel") String? tag,
  }) = _TalepTeklifListesiModel;
  TalepTeklifListesiModel._();

  factory TalepTeklifListesiModel.fromJson(Map<String, dynamic> json) => _$TalepTeklifListesiModelFromJson(json);

  @override
  TalepTeklifListesiModel fromJson(Map<String, dynamic> json) => _$TalepTeklifListesiModelFromJson(json);
}
