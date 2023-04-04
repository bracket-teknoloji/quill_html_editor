import 'package:json_annotation/json_annotation.dart';

import '../../../core/base/model/base_network_mixin.dart';

part 'companies.g.dart';

@JsonSerializable(createToJson: true)
class CompanyModel with NetworkManagerMixin {
  @JsonKey(name: "SIRKET")
  String? company;
  @JsonKey(name: "YIL")
  int? year;

  CompanyModel();
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
    return "company: $company,\n year: $year";
  }
}
