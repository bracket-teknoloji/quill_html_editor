// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'muhasebe_referans_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MuhasebeReferansModel _$MuhasebeReferansModelFromJson(
    Map<String, dynamic> json) {
  return _MuhasebeReferansModel.fromJson(json);
}

/// @nodoc
mixin _$MuhasebeReferansModel {
  String? get kodu => throw _privateConstructorUsedError;
  set kodu(String? value) => throw _privateConstructorUsedError;
  String? get tanimi => throw _privateConstructorUsedError;
  set tanimi(String? value) => throw _privateConstructorUsedError;

  /// Serializes this MuhasebeReferansModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MuhasebeReferansModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MuhasebeReferansModelCopyWith<MuhasebeReferansModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MuhasebeReferansModelCopyWith<$Res> {
  factory $MuhasebeReferansModelCopyWith(MuhasebeReferansModel value,
          $Res Function(MuhasebeReferansModel) then) =
      _$MuhasebeReferansModelCopyWithImpl<$Res, MuhasebeReferansModel>;
  @useResult
  $Res call({String? kodu, String? tanimi});
}

/// @nodoc
class _$MuhasebeReferansModelCopyWithImpl<$Res,
        $Val extends MuhasebeReferansModel>
    implements $MuhasebeReferansModelCopyWith<$Res> {
  _$MuhasebeReferansModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MuhasebeReferansModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? kodu = freezed,
    Object? tanimi = freezed,
  }) {
    return _then(_value.copyWith(
      kodu: freezed == kodu
          ? _value.kodu
          : kodu // ignore: cast_nullable_to_non_nullable
              as String?,
      tanimi: freezed == tanimi
          ? _value.tanimi
          : tanimi // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MuhasebeReferansModelImplCopyWith<$Res>
    implements $MuhasebeReferansModelCopyWith<$Res> {
  factory _$$MuhasebeReferansModelImplCopyWith(
          _$MuhasebeReferansModelImpl value,
          $Res Function(_$MuhasebeReferansModelImpl) then) =
      __$$MuhasebeReferansModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? kodu, String? tanimi});
}

/// @nodoc
class __$$MuhasebeReferansModelImplCopyWithImpl<$Res>
    extends _$MuhasebeReferansModelCopyWithImpl<$Res,
        _$MuhasebeReferansModelImpl>
    implements _$$MuhasebeReferansModelImplCopyWith<$Res> {
  __$$MuhasebeReferansModelImplCopyWithImpl(_$MuhasebeReferansModelImpl _value,
      $Res Function(_$MuhasebeReferansModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of MuhasebeReferansModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? kodu = freezed,
    Object? tanimi = freezed,
  }) {
    return _then(_$MuhasebeReferansModelImpl(
      kodu: freezed == kodu
          ? _value.kodu
          : kodu // ignore: cast_nullable_to_non_nullable
              as String?,
      tanimi: freezed == tanimi
          ? _value.tanimi
          : tanimi // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MuhasebeReferansModelImpl extends _MuhasebeReferansModel {
  _$MuhasebeReferansModelImpl({this.kodu, this.tanimi}) : super._();

  factory _$MuhasebeReferansModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$MuhasebeReferansModelImplFromJson(json);

  @override
  String? kodu;
  @override
  String? tanimi;

  /// Create a copy of MuhasebeReferansModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MuhasebeReferansModelImplCopyWith<_$MuhasebeReferansModelImpl>
      get copyWith => __$$MuhasebeReferansModelImplCopyWithImpl<
          _$MuhasebeReferansModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MuhasebeReferansModelImplToJson(
      this,
    );
  }
}

abstract class _MuhasebeReferansModel extends MuhasebeReferansModel {
  factory _MuhasebeReferansModel({String? kodu, String? tanimi}) =
      _$MuhasebeReferansModelImpl;
  _MuhasebeReferansModel._() : super._();

  factory _MuhasebeReferansModel.fromJson(Map<String, dynamic> json) =
      _$MuhasebeReferansModelImpl.fromJson;

  @override
  String? get kodu;
  set kodu(String? value);
  @override
  String? get tanimi;
  set tanimi(String? value);

  /// Create a copy of MuhasebeReferansModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MuhasebeReferansModelImplCopyWith<_$MuhasebeReferansModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
