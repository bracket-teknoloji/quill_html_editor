// your_models.dart
import "package:freezed_annotation/freezed_annotation.dart";
import "package:picker/core/base/model/base_network_mixin.dart";

part "payker_drop_down_model.freezed.dart";
part "payker_drop_down_model.g.dart";

/// Pagination modeli
/// Sayfalama bilgilerini (more ve totalCount) tutar.
@freezed
sealed class Pagination with _$Pagination {
  @JsonSerializable(fieldRename: FieldRename.pascal)
  const factory Pagination({
    required bool more,
    int? totalCount,
  }) = _Pagination;

  factory Pagination.fromJson(Map<String, dynamic> json) => _$PaginationFromJson(json);
}

/// DropdownFilter modeli
/// Dropdown listelerinden veri çekerken filtreleme, sayfalama ve arama terimlerini yönetmek için kullanılır.
@freezed
sealed class DropdownFilter with _$DropdownFilter, NetworkManagerMixin {
  @JsonSerializable(fieldRename: FieldRename.pascal)
  factory DropdownFilter({
    /// Kullanıcının dropdown arama alanına yazdığı metin
    String? searchTerm,

    /// Sayfa numarası (sayfalama için)
    @Default(1) int pageNumber,

    /// Sayfa başına gösterilecek kayıt sayısı
    @Default(10) int pageSize,

    /// Kullanıcı tarafından seçilmiş değerlerin listesi
    List<String>? selectedValues,

    /// Filtre tipi ya da kategori (optional, örn. "Country", "Category", vb.)
    String? filterType,

    /// Ek filtreleme için opsiyonel key-value çiftleri (özelleştirilebilir)
    Map<String, String>? filters,
  }) = _DropdownFilter;

  const DropdownFilter._();

  factory DropdownFilter.fromJson(Map<String, dynamic> json) => _$DropdownFilterFromJson(json);

  @override
  DropdownFilter? fromJson(Map<String, dynamic> json) => DropdownFilter.fromJson(json);
}

@freezed
sealed class DropdownResult with _$DropdownResult, NetworkManagerMixin {
  @JsonSerializable(fieldRename: FieldRename.pascal)
  const factory DropdownResult({
    List<PaykerFirmaModel>? results,
    Pagination? pagination,
  }) = _DropdownResult;

  const DropdownResult._();
  factory DropdownResult.fromJson(Map<String, dynamic> json) => _$DropdownResultFromJson(json);

  @override
  DropdownResult? fromJson(Map<String, dynamic> json) => DropdownResult.fromJson(json);
}

@freezed
sealed class PaykerFirmaModel with _$PaykerFirmaModel, NetworkManagerMixin {
  @JsonSerializable(fieldRename: FieldRename.pascal)
  factory PaykerFirmaModel({
    String? id,
    String? text,
  }) = _PaykerFirmaModel;

  const PaykerFirmaModel._();

  factory PaykerFirmaModel.fromJson(Map<String, dynamic> json) => _$PaykerFirmaModelFromJson(json);

  @override
  PaykerFirmaModel? fromJson(Map<String, dynamic> json) => PaykerFirmaModel.fromJson(json);
}
