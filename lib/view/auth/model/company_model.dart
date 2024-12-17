import "package:json_annotation/json_annotation.dart";

import "../../../core/base/model/base_network_mixin.dart";

part "company_model.g.dart";

@JsonSerializable()
class CompanyModel with NetworkManagerMixin {

  CompanyModel();
  @JsonKey(name: "SIRKET")
  String? company;
  @JsonKey(name: "YIL")
  int? year;
  @JsonKey(name: "DEVSIRKET")
  String? devSirket;
  @JsonKey(name: "isDevredilmis")
  bool? isDevredilmis;
  @override
  CompanyModel fromJson(dynamic json) => _$CompanyModelFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$CompanyModelToJson(this);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CompanyModel && other.company == company && other.year == year;
  }

  @override
  int get hashCode => company.hashCode ^ year.hashCode;
}
