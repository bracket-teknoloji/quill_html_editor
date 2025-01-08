// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ek_rehberler_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

EkRehberlerModel _$EkRehberlerModelFromJson(Map<String, dynamic> json) {
  return _EkRehberlerModel.fromJson(json);
}

/// @nodoc
mixin _$EkRehberlerModel {
  int? get id => throw _privateConstructorUsedError;
  String? get baslik => throw _privateConstructorUsedError;
  String? get ekran => throw _privateConstructorUsedError;
  String? get alan => throw _privateConstructorUsedError;

  /// Serializes this EkRehberlerModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of EkRehberlerModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $EkRehberlerModelCopyWith<EkRehberlerModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EkRehberlerModelCopyWith<$Res> {
  factory $EkRehberlerModelCopyWith(
          EkRehberlerModel value, $Res Function(EkRehberlerModel) then) =
      _$EkRehberlerModelCopyWithImpl<$Res, EkRehberlerModel>;
  @useResult
  $Res call({int? id, String? baslik, String? ekran, String? alan});
}

/// @nodoc
class _$EkRehberlerModelCopyWithImpl<$Res, $Val extends EkRehberlerModel>
    implements $EkRehberlerModelCopyWith<$Res> {
  _$EkRehberlerModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of EkRehberlerModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? baslik = freezed,
    Object? ekran = freezed,
    Object? alan = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      baslik: freezed == baslik
          ? _value.baslik
          : baslik // ignore: cast_nullable_to_non_nullable
              as String?,
      ekran: freezed == ekran
          ? _value.ekran
          : ekran // ignore: cast_nullable_to_non_nullable
              as String?,
      alan: freezed == alan
          ? _value.alan
          : alan // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$EkRehberlerModelImplCopyWith<$Res>
    implements $EkRehberlerModelCopyWith<$Res> {
  factory _$$EkRehberlerModelImplCopyWith(_$EkRehberlerModelImpl value,
          $Res Function(_$EkRehberlerModelImpl) then) =
      __$$EkRehberlerModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? id, String? baslik, String? ekran, String? alan});
}

/// @nodoc
class __$$EkRehberlerModelImplCopyWithImpl<$Res>
    extends _$EkRehberlerModelCopyWithImpl<$Res, _$EkRehberlerModelImpl>
    implements _$$EkRehberlerModelImplCopyWith<$Res> {
  __$$EkRehberlerModelImplCopyWithImpl(_$EkRehberlerModelImpl _value,
      $Res Function(_$EkRehberlerModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of EkRehberlerModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? baslik = freezed,
    Object? ekran = freezed,
    Object? alan = freezed,
  }) {
    return _then(_$EkRehberlerModelImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      baslik: freezed == baslik
          ? _value.baslik
          : baslik // ignore: cast_nullable_to_non_nullable
              as String?,
      ekran: freezed == ekran
          ? _value.ekran
          : ekran // ignore: cast_nullable_to_non_nullable
              as String?,
      alan: freezed == alan
          ? _value.alan
          : alan // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@JsonSerializable(createFactory: true)
class _$EkRehberlerModelImpl implements _EkRehberlerModel {
  const _$EkRehberlerModelImpl({this.id, this.baslik, this.ekran, this.alan});

  factory _$EkRehberlerModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$EkRehberlerModelImplFromJson(json);

  @override
  final int? id;
  @override
  final String? baslik;
  @override
  final String? ekran;
  @override
  final String? alan;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EkRehberlerModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.baslik, baslik) || other.baslik == baslik) &&
            (identical(other.ekran, ekran) || other.ekran == ekran) &&
            (identical(other.alan, alan) || other.alan == alan));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, baslik, ekran, alan);

  /// Create a copy of EkRehberlerModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EkRehberlerModelImplCopyWith<_$EkRehberlerModelImpl> get copyWith =>
      __$$EkRehberlerModelImplCopyWithImpl<_$EkRehberlerModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EkRehberlerModelImplToJson(
      this,
    );
  }
}

abstract class _EkRehberlerModel implements EkRehberlerModel {
  const factory _EkRehberlerModel(
      {final int? id,
      final String? baslik,
      final String? ekran,
      final String? alan}) = _$EkRehberlerModelImpl;

  factory _EkRehberlerModel.fromJson(Map<String, dynamic> json) =
      _$EkRehberlerModelImpl.fromJson;

  @override
  int? get id;
  @override
  String? get baslik;
  @override
  String? get ekran;
  @override
  String? get alan;

  /// Create a copy of EkRehberlerModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EkRehberlerModelImplCopyWith<_$EkRehberlerModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
