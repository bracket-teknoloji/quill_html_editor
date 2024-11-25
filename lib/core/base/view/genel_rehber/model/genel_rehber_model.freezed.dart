// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'genel_rehber_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

GenelRehberModel _$GenelRehberModelFromJson(Map<String, dynamic> json) {
  return _GenelRehberModel.fromJson(json);
}

/// @nodoc
mixin _$GenelRehberModel {
  String? get kodu => throw _privateConstructorUsedError;
  set kodu(String? value) => throw _privateConstructorUsedError;
  String? get aciklama => throw _privateConstructorUsedError;
  set aciklama(String? value) => throw _privateConstructorUsedError;
  String? get adi => throw _privateConstructorUsedError;
  set adi(String? value) => throw _privateConstructorUsedError;

  /// Serializes this GenelRehberModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of GenelRehberModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GenelRehberModelCopyWith<GenelRehberModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GenelRehberModelCopyWith<$Res> {
  factory $GenelRehberModelCopyWith(
          GenelRehberModel value, $Res Function(GenelRehberModel) then) =
      _$GenelRehberModelCopyWithImpl<$Res, GenelRehberModel>;
  @useResult
  $Res call({String? kodu, String? aciklama, String? adi});
}

/// @nodoc
class _$GenelRehberModelCopyWithImpl<$Res, $Val extends GenelRehberModel>
    implements $GenelRehberModelCopyWith<$Res> {
  _$GenelRehberModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GenelRehberModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? kodu = freezed,
    Object? aciklama = freezed,
    Object? adi = freezed,
  }) {
    return _then(_value.copyWith(
      kodu: freezed == kodu
          ? _value.kodu
          : kodu // ignore: cast_nullable_to_non_nullable
              as String?,
      aciklama: freezed == aciklama
          ? _value.aciklama
          : aciklama // ignore: cast_nullable_to_non_nullable
              as String?,
      adi: freezed == adi
          ? _value.adi
          : adi // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GenelRehberModelImplCopyWith<$Res>
    implements $GenelRehberModelCopyWith<$Res> {
  factory _$$GenelRehberModelImplCopyWith(_$GenelRehberModelImpl value,
          $Res Function(_$GenelRehberModelImpl) then) =
      __$$GenelRehberModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? kodu, String? aciklama, String? adi});
}

/// @nodoc
class __$$GenelRehberModelImplCopyWithImpl<$Res>
    extends _$GenelRehberModelCopyWithImpl<$Res, _$GenelRehberModelImpl>
    implements _$$GenelRehberModelImplCopyWith<$Res> {
  __$$GenelRehberModelImplCopyWithImpl(_$GenelRehberModelImpl _value,
      $Res Function(_$GenelRehberModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of GenelRehberModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? kodu = freezed,
    Object? aciklama = freezed,
    Object? adi = freezed,
  }) {
    return _then(_$GenelRehberModelImpl(
      kodu: freezed == kodu
          ? _value.kodu
          : kodu // ignore: cast_nullable_to_non_nullable
              as String?,
      aciklama: freezed == aciklama
          ? _value.aciklama
          : aciklama // ignore: cast_nullable_to_non_nullable
              as String?,
      adi: freezed == adi
          ? _value.adi
          : adi // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GenelRehberModelImpl extends _GenelRehberModel {
  _$GenelRehberModelImpl({this.kodu, this.aciklama, this.adi}) : super._();

  factory _$GenelRehberModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$GenelRehberModelImplFromJson(json);

  @override
  String? kodu;
  @override
  String? aciklama;
  @override
  String? adi;

  /// Create a copy of GenelRehberModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GenelRehberModelImplCopyWith<_$GenelRehberModelImpl> get copyWith =>
      __$$GenelRehberModelImplCopyWithImpl<_$GenelRehberModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GenelRehberModelImplToJson(
      this,
    );
  }
}

abstract class _GenelRehberModel extends GenelRehberModel {
  factory _GenelRehberModel({String? kodu, String? aciklama, String? adi}) =
      _$GenelRehberModelImpl;
  _GenelRehberModel._() : super._();

  factory _GenelRehberModel.fromJson(Map<String, dynamic> json) =
      _$GenelRehberModelImpl.fromJson;

  @override
  String? get kodu;
  set kodu(String? value);
  @override
  String? get aciklama;
  set aciklama(String? value);
  @override
  String? get adi;
  set adi(String? value);

  /// Create a copy of GenelRehberModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GenelRehberModelImplCopyWith<_$GenelRehberModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
