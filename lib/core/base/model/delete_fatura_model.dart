// ignore_for_file: unused_field

import 'package:json_annotation/json_annotation.dart';
import 'package:picker/core/base/model/base_network_mixin.dart';

part 'delete_fatura_model.g.dart';

@JsonSerializable(createToJson: true, fieldRename: FieldRename.screamingSnake)
class DeleteFaturaModel with NetworkManagerMixin {
  int? tipi;
  String? tag;
  Map? paramMap;
  String? belgeNo;
  String? cariKodu;
  String? belgeTuru;
  @JsonKey(name: "BELGE_TIPI")
  int? _belgeTipi;
  @JsonKey(name: "MEVCUT_BELGE_NO")
  String? _mevcutBelgeNo;
  @JsonKey(name: "MEVCUT_CARI_KODU")
  String? _mevcutCariKodu;
  @JsonKey(name: "PICKER_BELGE_TURU")
  String? _pickerBelgeTuru;

  @override
  Map<String, dynamic> toJson() {
    tipi = _belgeTipi;
    _mevcutBelgeNo = belgeNo;
    _mevcutCariKodu = cariKodu;
    _pickerBelgeTuru = belgeTuru;
    return _$DeleteFaturaModelToJson(this);
  }

  @override
  fromJson(Map<String, dynamic> json) => _$DeleteFaturaModelFromJson(json);
}
