import "package:freezed_annotation/freezed_annotation.dart";

part "payker_filter_model.freezed.dart";
part "payker_filter_model.g.dart";

@freezed
sealed class PaykerFilterModel with _$PaykerFilterModel {
  @JsonSerializable(fieldRename: FieldRename.pascal)
  const factory PaykerFilterModel({
    List<FilterModel>? filterModels,
    int? draw,
    List<PaykerColumn>? columns,
    List<Order>? order,
    int? start,
    int? length,
    Search? search,
    String? sortOrder,
  }) = _PaykerFilterModel;

  factory PaykerFilterModel.fromJson(Map<String, dynamic> json) => _$PaykerFilterModelFromJson(json);
}

@freezed
sealed class PaykerColumn with _$PaykerColumn {
  @JsonSerializable(fieldRename: FieldRename.pascal)
  const factory PaykerColumn({
    String? data,
    dynamic name,
    bool? searchable,
    bool? orderable,
  }) = _PaykerColumn;

  factory PaykerColumn.fromJson(Map<String, dynamic> json) => _$PaykerColumnFromJson(json);
}

@freezed
sealed class FilterModel with _$FilterModel {
  @JsonSerializable(fieldRename: FieldRename.pascal)
  const factory FilterModel({
    String? type,
    String? name,
    String? value,
  }) = _FilterModel;

  factory FilterModel.fromJson(Map<String, dynamic> json) => _$FilterModelFromJson(json);
}

@freezed
sealed class Order with _$Order {
  @JsonSerializable(fieldRename: FieldRename.pascal)
  const factory Order({
    @JsonKey(includeToJson: false, includeFromJson: true) String? columnName,
    int? column,
    int? dir,
  }) = _Order;

  factory Order.fromJson(Map<String, dynamic> json) => _$OrderFromJson(json);
}

@freezed
sealed class Search with _$Search {
  @JsonSerializable(fieldRename: FieldRename.pascal)
  const factory Search({
    dynamic value,
    bool? regex,
  }) = _Search;

  factory Search.fromJson(Map<String, dynamic> json) => _$SearchFromJson(json);
}

enum FilterType {
  int,
  dateTime,
  boolean;

  String get name {
    switch (this) {
      case FilterType.int:
        return "int";
      case FilterType.dateTime:
        return "dateTime";
      case FilterType.boolean:
        return "bool";
    }
  }
}
