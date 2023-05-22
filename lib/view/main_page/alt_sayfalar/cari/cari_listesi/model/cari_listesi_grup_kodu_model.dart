import 'package:json_annotation/json_annotation.dart';

import '../../../../../../core/base/model/base_network_mixin.dart';

part 'cari_listesi_grup_kodu_model.g.dart';

@JsonSerializable(createToJson: true, fieldRename: FieldRename.screamingSnake)
class CariGrupKoduModel with NetworkManagerMixin{
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
        return _$CariGrupKoduModelFromJson(json);
      }
    
      @override
      Map<String, dynamic> toJson() {
        return _$CariGrupKoduModelToJson(this);
      }


}