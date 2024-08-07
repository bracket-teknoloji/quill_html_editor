// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sayim_kalem_request_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SayimKalemRequestModel _$SayimKalemRequestModelFromJson(
    Map<String, dynamic> json) {
  return _SayimKalemRequestModel.fromJson(json);
}

/// @nodoc
mixin _$SayimKalemRequestModel {
  int? get id => throw _privateConstructorUsedError;
  int? get depoKodu => throw _privateConstructorUsedError;
  String? get belgeNo => throw _privateConstructorUsedError;

  /// Serializes this SayimKalemRequestModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SayimKalemRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SayimKalemRequestModelCopyWith<SayimKalemRequestModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SayimKalemRequestModelCopyWith<$Res> {
  factory $SayimKalemRequestModelCopyWith(SayimKalemRequestModel value,
          $Res Function(SayimKalemRequestModel) then) =
      _$SayimKalemRequestModelCopyWithImpl<$Res, SayimKalemRequestModel>;
  @useResult
  $Res call({int? id, int? depoKodu, String? belgeNo});
}

/// @nodoc
class _$SayimKalemRequestModelCopyWithImpl<$Res,
        $Val extends SayimKalemRequestModel>
    implements $SayimKalemRequestModelCopyWith<$Res> {
  _$SayimKalemRequestModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SayimKalemRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? depoKodu = freezed,
    Object? belgeNo = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      depoKodu: freezed == depoKodu
          ? _value.depoKodu
          : depoKodu // ignore: cast_nullable_to_non_nullable
              as int?,
      belgeNo: freezed == belgeNo
          ? _value.belgeNo
          : belgeNo // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SayimKalemRequestModelImplCopyWith<$Res>
    implements $SayimKalemRequestModelCopyWith<$Res> {
  factory _$$SayimKalemRequestModelImplCopyWith(
          _$SayimKalemRequestModelImpl value,
          $Res Function(_$SayimKalemRequestModelImpl) then) =
      __$$SayimKalemRequestModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? id, int? depoKodu, String? belgeNo});
}

/// @nodoc
class __$$SayimKalemRequestModelImplCopyWithImpl<$Res>
    extends _$SayimKalemRequestModelCopyWithImpl<$Res,
        _$SayimKalemRequestModelImpl>
    implements _$$SayimKalemRequestModelImplCopyWith<$Res> {
  __$$SayimKalemRequestModelImplCopyWithImpl(
      _$SayimKalemRequestModelImpl _value,
      $Res Function(_$SayimKalemRequestModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of SayimKalemRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? depoKodu = freezed,
    Object? belgeNo = freezed,
  }) {
    return _then(_$SayimKalemRequestModelImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      depoKodu: freezed == depoKodu
          ? _value.depoKodu
          : depoKodu // ignore: cast_nullable_to_non_nullable
              as int?,
      belgeNo: freezed == belgeNo
          ? _value.belgeNo
          : belgeNo // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SayimKalemRequestModelImpl implements _SayimKalemRequestModel {
  const _$SayimKalemRequestModelImpl({this.id, this.depoKodu, this.belgeNo});

  factory _$SayimKalemRequestModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$SayimKalemRequestModelImplFromJson(json);

  @override
  final int? id;
  @override
  final int? depoKodu;
  @override
  final String? belgeNo;

  @override
  String toString() {
    return 'SayimKalemRequestModel(id: $id, depoKodu: $depoKodu, belgeNo: $belgeNo)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SayimKalemRequestModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.depoKodu, depoKodu) ||
                other.depoKodu == depoKodu) &&
            (identical(other.belgeNo, belgeNo) || other.belgeNo == belgeNo));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, depoKodu, belgeNo);

  /// Create a copy of SayimKalemRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SayimKalemRequestModelImplCopyWith<_$SayimKalemRequestModelImpl>
      get copyWith => __$$SayimKalemRequestModelImplCopyWithImpl<
          _$SayimKalemRequestModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SayimKalemRequestModelImplToJson(
      this,
    );
  }
}

abstract class _SayimKalemRequestModel implements SayimKalemRequestModel {
  const factory _SayimKalemRequestModel(
      {final int? id,
      final int? depoKodu,
      final String? belgeNo}) = _$SayimKalemRequestModelImpl;

  factory _SayimKalemRequestModel.fromJson(Map<String, dynamic> json) =
      _$SayimKalemRequestModelImpl.fromJson;

  @override
  int? get id;
  @override
  int? get depoKodu;
  @override
  String? get belgeNo;

  /// Create a copy of SayimKalemRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SayimKalemRequestModelImplCopyWith<_$SayimKalemRequestModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
