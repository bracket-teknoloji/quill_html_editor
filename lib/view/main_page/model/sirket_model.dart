import "package:hive_flutter/hive_flutter.dart";
import "package:json_annotation/json_annotation.dart";

part "sirket_model.g.dart";

@JsonSerializable(createFactory: true)
@HiveType(typeId: 102)
class SirketModel {
  SirketModel();
  @JsonKey(name: "SIRKET")
  @HiveField(0)
  String? sirket;
  @JsonKey(name: "DEVSIRKET")
  @HiveField(1)
  String? devsirket;
  @JsonKey(name: "YIL")
  @HiveField(2)
  int? yil;
  @JsonKey(name: "isDevredilmis")
  @HiveField(3)
  bool? isDevredilmis;

  factory SirketModel.fromJson(Map<String, dynamic> json) => _$SirketModelFromJson(json);
  Map<String, dynamic> toJson() => _$SirketModelToJson(this);

  @override
  String toString() => toJson().toString();
}
