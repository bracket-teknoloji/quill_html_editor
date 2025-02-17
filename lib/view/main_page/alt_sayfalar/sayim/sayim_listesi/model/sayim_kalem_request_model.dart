import "package:freezed_annotation/freezed_annotation.dart";

import "../../../../../../core/constants/static_variables/singleton_models.dart";
import "sayim_listesi_model.dart";

part "sayim_kalem_request_model.freezed.dart";
part "sayim_kalem_request_model.g.dart";

@freezed
class SayimKalemRequestModel with _$SayimKalemRequestModel {
  const factory SayimKalemRequestModel({int? id, int? depoKodu, String? belgeNo}) = _SayimKalemRequestModel;

  factory SayimKalemRequestModel.fromJson(Map<String, dynamic> json) => _$SayimKalemRequestModelFromJson(json);

  factory SayimKalemRequestModel.fromSayimFiltreModel(SayimFiltreModel model) =>
      SayimKalemRequestModel(depoKodu: SingletonModels.sayimListesi?.depoKodu, id: model.id, belgeNo: model.fisno);
}
