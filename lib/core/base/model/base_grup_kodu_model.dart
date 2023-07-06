import 'package:json_annotation/json_annotation.dart';

import 'base_network_mixin.dart';

part 'base_grup_kodu_model.g.dart';

@JsonSerializable(createToJson: true, fieldRename: FieldRename.screamingSnake)
class BaseGrupKoduModel with NetworkManagerMixin {
  String? modul;
  int? grupNo;
  String? grupKodu;
  String? grupAdi;
  String? tip;
  String? kod1;
  String? kod2;
  String? kod3;
  String? kod4;
  String? kod5;
  String? kod1Adi;
  String? kod2Adi;
  String? kod3Adi;
  String? kod4Adi;
  String? kod5Adi;

  @override
  fromJson(Map<String, dynamic> json) {
    return _$BaseGrupKoduModelFromJson(json);
  }

  @override
  Map<String, dynamic> toJson() {
    return _$BaseGrupKoduModelToJson(this);
  }

  @override
  //equality
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is BaseGrupKoduModel &&
        other.modul == modul &&
        other.grupNo == grupNo &&
        other.grupKodu == grupKodu &&
        other.grupAdi == grupAdi &&
        other.tip == tip &&
        other.kod1 == kod1 &&
        other.kod2 == kod2 &&
        other.kod3 == kod3 &&
        other.kod4 == kod4 &&
        other.kod5 == kod5 &&
        other.kod1Adi == kod1Adi &&
        other.kod2Adi == kod2Adi &&
        other.kod3Adi == kod3Adi &&
        other.kod4Adi == kod4Adi &&
        other.kod5Adi == kod5Adi;
  }
}
