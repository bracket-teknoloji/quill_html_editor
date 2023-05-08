import 'package:json_annotation/json_annotation.dart';

import '../../../../../../core/base/model/base_network_mixin.dart';

part 'cari_listesi_grup_kodu_model.g.dart';

@JsonSerializable(createToJson: true, fieldRename: FieldRename.screamingSnake)
class CariGrupKoduModel with NetworkManagerMixin{
    String? modul;
    int? grupNo;
    String? grupKodu;
    String? grupAdi;
    
      @override
      fromJson(Map<String, dynamic> json) {
        return _$CariGrupKoduModelFromJson(json);
      }
    
      @override
      Map<String, dynamic> toJson() {
        return _$CariGrupKoduModelToJson(this);
      }


}