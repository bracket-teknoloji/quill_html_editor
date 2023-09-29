import "package:freezed_annotation/freezed_annotation.dart";
import "package:picker/core/base/model/base_network_mixin.dart";

part "kasa_listesi_model.freezed.dart";
part "kasa_listesi_model.g.dart";

@freezed
class KasaListesiModel with _$KasaListesiModel , NetworkManagerMixin{

    KasaListesiModel._();
    factory KasaListesiModel({
        String? kasaKodu,
        String? kasaTanimi,
        int? subeKodu,
        String? dovizli,
        int? dovizTipi,
        bool? kkartKasasi,
        double? toplamGiris,
        double? toplamCikis,
        double? bakiye,
        double? devirliBakiye,
        double? devirTutari,
        double? dovizToplamGiris,
        double? dovizToplamCikis,
        double? dovizBakiye,
        double? devirliDovizBakiye,
        double? dovizDevirTutari,
        String? dovizAdi,
    }) = _KasaListesiModel;

    factory KasaListesiModel.fromJson(Map<String, dynamic> json) => _$KasaListesiModelFromJson(json);

    @override
    fromJson(Map<String, dynamic> json) => _$KasaListesiModelFromJson(json);
    
}