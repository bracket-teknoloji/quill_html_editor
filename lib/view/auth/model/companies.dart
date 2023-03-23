import 'package:json_annotation/json_annotation.dart';

import '../../../core/base/model/base_network_mixin.dart';

part 'companies.g.dart';

@JsonSerializable()
class Companies with NetworkManagerMixin {
  @JsonKey(name: "SIRKET")
  String? sirket;
  @JsonKey(name: "YIL")
  int? year;

  Companies();

  @override
  fromJson(Map<String, dynamic> json) {
    return _$CompaniesFromJson(json);
  }

  @override
  Map<String, dynamic> toJson() {
    return _$CompaniesToJson(this);
  }
}
