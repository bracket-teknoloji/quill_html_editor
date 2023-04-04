import 'package:json_annotation/json_annotation.dart';

part 'sirket_model.g.dart';

@JsonSerializable(createToJson: true, createFactory: true)
class SirketModel {
  SirketModel();
  @JsonKey(name: "SIRKET")
  String? sirket;
  @JsonKey(name: "DEVSIRKET")
  String? devsirket;
  @JsonKey(name: "YIL")
  int? yil;
  @JsonKey(name: "isDevredilmis", required: true)
  bool? isDevredilmis;

  factory SirketModel.fromJson(Map<String, dynamic> json) {
    return _$SirketModelFromJson(json);
  }
  Map<String, dynamic> toJson() {
    return _$SirketModelToJson(this);
  }

  @override
  String toString() {
    return toJson().toString();
  }
}
