import "package:freezed_annotation/freezed_annotation.dart";
import "package:picker/core/base/model/base_network_mixin.dart";

part "e_irsaliye_bilgi_model.freezed.dart";
part "e_irsaliye_bilgi_model.g.dart";

@unfreezed
class EIrsaliyeBilgiModel with _$EIrsaliyeBilgiModel, NetworkManagerMixin {
    
    EIrsaliyeBilgiModel._();
   factory EIrsaliyeBilgiModel({
    String? dorsePlaka1,
    String? dorsePlaka2,
    String? dorsePlaka3,
    String? plaka,
    DateTime? sevktar,
    String? sofor1Aciklama,
    String? sofor1Adi,
    String? sofor1KimlikNo,
    String? sofor1Soyadi,
    String? sofor2Aciklama,
    String? sofor2Adi,
    String? sofor2KimlikNo,
    String? sofor2Soyadi,
    String? sofor3Aciklama,
    String? sofor3Adi,
    String? sofor3KimlikNo,
    String? sofor3Soyadi,
    String? tasiyiciIl,
    String? tasiyiciIlce,
    String? tasiyiciPostakodu,
    String? tasiyiciUlke,
    String? tasiyiciUnvan,
    String? tasiyiciVkn,
  }) = _EIrsaliyeBilgiModel;

  factory EIrsaliyeBilgiModel.fromJson(Map<String, dynamic> json) => _$EIrsaliyeBilgiModelFromJson(json);

  @override
  EIrsaliyeBilgiModel fromJson(Map<String, dynamic> json) => _$EIrsaliyeBilgiModelFromJson(json);
}
