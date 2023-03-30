import 'package:json_annotation/json_annotation.dart';

import '../../../core/base/model/base_network_mixin.dart';

part 'companies.g.dart';

@JsonSerializable(createToJson: true)
class CompanyModel with NetworkManagerMixin {
  @JsonKey(name: "SIRKET")
  String? companyModel;
  @JsonKey(name: "YIL")
  int? year;

  CompanyModel({this.companyModel, this.year});
  @override
  fromJson(dynamic json) {
    return _$CompanyModelFromJson(json);
  }

  @override
  Map<String, dynamic> toJson() {
    return _$CompanyModelToJson(this);
  }

  @override
  toString() {
    return "companyModel: $companyModel,\n year: $year";
  }
}
