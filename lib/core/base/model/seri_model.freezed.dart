// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'seri_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SeriModel _$SeriModelFromJson(Map<String, dynamic> json) {
  return _SeriModel.fromJson(json);
}

/// @nodoc
mixin _$SeriModel {
  String? get seriNo => throw _privateConstructorUsedError;
  String? get aciklama => throw _privateConstructorUsedError;
  String? get stokKodu => throw _privateConstructorUsedError;
  String? get stokAdi => throw _privateConstructorUsedError;
  int? get depoKodu => throw _privateConstructorUsedError;
  int? get miktar => throw _privateConstructorUsedError;
  String? get depoTanimi => throw _privateConstructorUsedError;

  /// Serializes this SeriModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SeriModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SeriModelCopyWith<SeriModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SeriModelCopyWith<$Res> {
  factory $SeriModelCopyWith(SeriModel value, $Res Function(SeriModel) then) =
      _$SeriModelCopyWithImpl<$Res, SeriModel>;
  @useResult
  $Res call(
      {String? seriNo,
      String? aciklama,
      String? stokKodu,
      String? stokAdi,
      int? depoKodu,
      int? miktar,
      String? depoTanimi});
}

/// @nodoc
class _$SeriModelCopyWithImpl<$Res, $Val extends SeriModel>
    implements $SeriModelCopyWith<$Res> {
  _$SeriModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SeriModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? seriNo = freezed,
    Object? aciklama = freezed,
    Object? stokKodu = freezed,
    Object? stokAdi = freezed,
    Object? depoKodu = freezed,
    Object? miktar = freezed,
    Object? depoTanimi = freezed,
  }) {
    return _then(_value.copyWith(
      seriNo: freezed == seriNo
          ? _value.seriNo
          : seriNo // ignore: cast_nullable_to_non_nullable
              as String?,
      aciklama: freezed == aciklama
          ? _value.aciklama
          : aciklama // ignore: cast_nullable_to_non_nullable
              as String?,
      stokKodu: freezed == stokKodu
          ? _value.stokKodu
          : stokKodu // ignore: cast_nullable_to_non_nullable
              as String?,
      stokAdi: freezed == stokAdi
          ? _value.stokAdi
          : stokAdi // ignore: cast_nullable_to_non_nullable
              as String?,
      depoKodu: freezed == depoKodu
          ? _value.depoKodu
          : depoKodu // ignore: cast_nullable_to_non_nullable
              as int?,
      miktar: freezed == miktar
          ? _value.miktar
          : miktar // ignore: cast_nullable_to_non_nullable
              as int?,
      depoTanimi: freezed == depoTanimi
          ? _value.depoTanimi
          : depoTanimi // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SeriModelImplCopyWith<$Res>
    implements $SeriModelCopyWith<$Res> {
  factory _$$SeriModelImplCopyWith(
          _$SeriModelImpl value, $Res Function(_$SeriModelImpl) then) =
      __$$SeriModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? seriNo,
      String? aciklama,
      String? stokKodu,
      String? stokAdi,
      int? depoKodu,
      int? miktar,
      String? depoTanimi});
}

/// @nodoc
class __$$SeriModelImplCopyWithImpl<$Res>
    extends _$SeriModelCopyWithImpl<$Res, _$SeriModelImpl>
    implements _$$SeriModelImplCopyWith<$Res> {
  __$$SeriModelImplCopyWithImpl(
      _$SeriModelImpl _value, $Res Function(_$SeriModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of SeriModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? seriNo = freezed,
    Object? aciklama = freezed,
    Object? stokKodu = freezed,
    Object? stokAdi = freezed,
    Object? depoKodu = freezed,
    Object? miktar = freezed,
    Object? depoTanimi = freezed,
  }) {
    return _then(_$SeriModelImpl(
      seriNo: freezed == seriNo
          ? _value.seriNo
          : seriNo // ignore: cast_nullable_to_non_nullable
              as String?,
      aciklama: freezed == aciklama
          ? _value.aciklama
          : aciklama // ignore: cast_nullable_to_non_nullable
              as String?,
      stokKodu: freezed == stokKodu
          ? _value.stokKodu
          : stokKodu // ignore: cast_nullable_to_non_nullable
              as String?,
      stokAdi: freezed == stokAdi
          ? _value.stokAdi
          : stokAdi // ignore: cast_nullable_to_non_nullable
              as String?,
      depoKodu: freezed == depoKodu
          ? _value.depoKodu
          : depoKodu // ignore: cast_nullable_to_non_nullable
              as int?,
      miktar: freezed == miktar
          ? _value.miktar
          : miktar // ignore: cast_nullable_to_non_nullable
              as int?,
      depoTanimi: freezed == depoTanimi
          ? _value.depoTanimi
          : depoTanimi // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SeriModelImpl extends _SeriModel {
  _$SeriModelImpl(
      {this.seriNo,
      this.aciklama,
      this.stokKodu,
      this.stokAdi,
      this.depoKodu,
      this.miktar,
      this.depoTanimi})
      : super._();

  factory _$SeriModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$SeriModelImplFromJson(json);

  @override
  final String? seriNo;
  @override
  final String? aciklama;
  @override
  final String? stokKodu;
  @override
  final String? stokAdi;
  @override
  final int? depoKodu;
  @override
  final int? miktar;
  @override
  final String? depoTanimi;

  /// Create a copy of SeriModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SeriModelImplCopyWith<_$SeriModelImpl> get copyWith =>
      __$$SeriModelImplCopyWithImpl<_$SeriModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SeriModelImplToJson(
      this,
    );
  }
}

abstract class _SeriModel extends SeriModel {
  factory _SeriModel(
      {final String? seriNo,
      final String? aciklama,
      final String? stokKodu,
      final String? stokAdi,
      final int? depoKodu,
      final int? miktar,
      final String? depoTanimi}) = _$SeriModelImpl;
  _SeriModel._() : super._();

  factory _SeriModel.fromJson(Map<String, dynamic> json) =
      _$SeriModelImpl.fromJson;

  @override
  String? get seriNo;
  @override
  String? get aciklama;
  @override
  String? get stokKodu;
  @override
  String? get stokAdi;
  @override
  int? get depoKodu;
  @override
  int? get miktar;
  @override
  String? get depoTanimi;

  /// Create a copy of SeriModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SeriModelImplCopyWith<_$SeriModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
