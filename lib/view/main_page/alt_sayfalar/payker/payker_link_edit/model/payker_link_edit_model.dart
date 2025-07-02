import "dart:convert";

import "package:freezed_annotation/freezed_annotation.dart";
import "package:picker/core/base/model/base_network_mixin.dart";
import "package:picker/view/main_page/alt_sayfalar/payker/payker_tahsilat/model/taksit_response_model.dart";

part "payker_link_edit_model.freezed.dart";
part "payker_link_edit_model.g.dart";

@freezed
sealed class PaykerLinkEditModel with _$PaykerLinkEditModel, NetworkManagerMixin {
  const factory PaykerLinkEditModel({
    @Default(0) int firmaId,
    int? bayiId,
    double? tutar,
    String? email,
    String? unvan,
    DateTime? bittar,
    String? taksitlerJson,
    int? kullanimSayisi,
    String? guid,
    bool? alindi,
  }) = _PaykerLinkEditModel;
  const PaykerLinkEditModel._();

  factory PaykerLinkEditModel.fromJson(Map<String, dynamic> json) => _$PaykerLinkEditModelFromJson(json);

  String setTaksitlerJson(List<Taksitler> taksitler) {
    final List<Map<String, dynamic>> mapList = [];
    for (final e in taksitler) {
      if (mapList.any((element) => element["BankaId"] == e.banka?.id)) {
        final index = mapList.indexWhere((element) => element["BankaId"] == e.banka?.id);
        mapList[index]["Taksitler"].add(e.taksit);
      } else {
        mapList.add({
          "BankaId": e.banka?.id,
          "Taksitler": [e.taksit],
        });
      }
    }
    return jsonEncode(mapList);
  }

  List<Taksitler> getTaksitlerFromJson() {
    if (taksitlerJson == null || taksitlerJson!.isEmpty) return [];
    final List<dynamic> jsonList = jsonDecode(taksitlerJson!);
    return jsonList
        .map(
          (e) => (e["Taksitler"] as List)
              .map(
                (r) => Taksitler.fromJson({
                  "BANKA": {"ID": e["BankaId"]},
                  "TAKSIT": r,
                }),
              )
              .toList(),
        )
        .expand((element) => element)
        .toList();
  }

  @override
  PaykerLinkEditModel fromJson(Map<String, dynamic> json) => PaykerLinkEditModel.fromJson(json);
}
