import "package:collection/collection.dart";
import "package:freezed_annotation/freezed_annotation.dart";

import "../../../../../../../core/base/model/base_network_mixin.dart";

part "banka_listesi_model.freezed.dart";
part "banka_listesi_model.g.dart";

@unfreezed
sealed class BankaListesiModel with _$BankaListesiModel, NetworkManagerMixin {
  factory BankaListesiModel({
    String? bankaKodu,
    String? bankasubeKodu,
    String? hesapKodu,
    String? hesapAdi,
    String? muhasebeHesapTipi,
    String? hesapNo,
    String? ibanNo,
    String? kilit,
    int? hesapTipi,
    String? hesapTipiAdi,
    int? dovizTipi,
    double? borcToplami,
    double? alacakToplami,
    double? dovizborcToplami,
    double? dovizalacakToplami,
    String? dovizAdi,
    String? bankaAdi,
    String? subeAdi,
    String? baglihesapKodu,
  }) = _BankaListesiModel;
  BankaListesiModel._();

  factory BankaListesiModel.fromJson(Map<String, dynamic> json) => _$BankaListesiModelFromJson(json);

  @override
  BankaListesiModel fromJson(Map<String, dynamic> json) => BankaListesiModel.fromJson(json);
}

extension BankaListesiModelExtension on BankaListesiModel {
  double get bakiye => (borcToplami ?? 0) - (alacakToplami ?? 0);
  double get dovizBakiye => (dovizborcToplami ?? 0) - (dovizalacakToplami ?? 0);
  double get bakiyeDovizli => dovizAdi == null ? bakiye : dovizBakiye;
}

extension BankaListesiModelListExtension on List<BankaListesiModel> {
  double get bakiye => map((element) => element.bakiye).sum;
  double get dovizBakiye => map((element) => element.dovizBakiye).sum;
  double get bakiyeDovizli => map((element) => element.bakiyeDovizli).sum;

  Map<String, double> bakiyeMap(String mainCurrency) {
    final Map<String, double> map = {};
    forEach((element) {
      if (map[element.dovizAdi] == null) {
        if (element.bakiyeDovizli == 0) {
          return;
        }
        map[element.dovizAdi ?? mainCurrency] = element.bakiyeDovizli;
      } else {
        if (element.bakiyeDovizli == 0) {
          return;
        }
        map[element.dovizAdi ?? mainCurrency] = map[element.dovizAdi ?? mainCurrency]! + element.bakiyeDovizli;
      }
    });
    return map;
  }
}
