import 'package:json_annotation/json_annotation.dart';

import '../../../core/base/model/base_network_mixin.dart';

part 'companies.g.dart';

@JsonSerializable(createToJson: true)
class Company with NetworkManagerMixin {
  @JsonKey(name: "SIRKET")
  String? company;
  @JsonKey(name: "YIL")
  int? year;

  Company({this.company, this.year});
  @override
  fromJson(dynamic json) {
    return _$CompanyFromJson(json);
  }

  @override
  Map<String, dynamic> toJson() {
    return _$CompanyToJson(this);
  }

  @override
  toString() {
    return "company: $company,\n year: $year";
  }
}
