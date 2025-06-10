import "package:hive_ce_flutter/hive_flutter.dart";
import "package:json_annotation/json_annotation.dart";

part "sirket_model.g.dart";

@JsonSerializable(createFactory: true)
@HiveType(typeId: 102)
final class SirketModel {
  SirketModel();

  factory SirketModel.fromJson(Map<String, dynamic> json) => _$SirketModelFromJson(json);
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
  Map<String, dynamic> toJson() => _$SirketModelToJson(this);

  @override
  String toString() => toJson().toString();
}
