// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'evraklar_request_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

EvraklarRequestModel _$EvraklarRequestModelFromJson(Map<String, dynamic> json) {
  return _EvraklarRequestModel.fromJson(json);
}

/// @nodoc
mixin _$EvraklarRequestModel {
  String? get belgeTipi => throw _privateConstructorUsedError;
  String? get urlGetir => throw _privateConstructorUsedError;
  String? get belgeNo => throw _privateConstructorUsedError;

  /// Serializes this EvraklarRequestModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of EvraklarRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $EvraklarRequestModelCopyWith<EvraklarRequestModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EvraklarRequestModelCopyWith<$Res> {
  factory $EvraklarRequestModelCopyWith(EvraklarRequestModel value,
          $Res Function(EvraklarRequestModel) then) =
      _$EvraklarRequestModelCopyWithImpl<$Res, EvraklarRequestModel>;
  @useResult
  $Res call({String? belgeTipi, String? urlGetir, String? belgeNo});
}

/// @nodoc
class _$EvraklarRequestModelCopyWithImpl<$Res,
        $Val extends EvraklarRequestModel>
    implements $EvraklarRequestModelCopyWith<$Res> {
  _$EvraklarRequestModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of EvraklarRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? belgeTipi = freezed,
    Object? urlGetir = freezed,
    Object? belgeNo = freezed,
  }) {
    return _then(_value.copyWith(
      belgeTipi: freezed == belgeTipi
          ? _value.belgeTipi
          : belgeTipi // ignore: cast_nullable_to_non_nullable
              as String?,
      urlGetir: freezed == urlGetir
          ? _value.urlGetir
          : urlGetir // ignore: cast_nullable_to_non_nullable
              as String?,
      belgeNo: freezed == belgeNo
          ? _value.belgeNo
          : belgeNo // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$EvraklarRequestModelImplCopyWith<$Res>
    implements $EvraklarRequestModelCopyWith<$Res> {
  factory _$$EvraklarRequestModelImplCopyWith(_$EvraklarRequestModelImpl value,
          $Res Function(_$EvraklarRequestModelImpl) then) =
      __$$EvraklarRequestModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? belgeTipi, String? urlGetir, String? belgeNo});
}

/// @nodoc
class __$$EvraklarRequestModelImplCopyWithImpl<$Res>
    extends _$EvraklarRequestModelCopyWithImpl<$Res, _$EvraklarRequestModelImpl>
    implements _$$EvraklarRequestModelImplCopyWith<$Res> {
  __$$EvraklarRequestModelImplCopyWithImpl(_$EvraklarRequestModelImpl _value,
      $Res Function(_$EvraklarRequestModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of EvraklarRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? belgeTipi = freezed,
    Object? urlGetir = freezed,
    Object? belgeNo = freezed,
  }) {
    return _then(_$EvraklarRequestModelImpl(
      belgeTipi: freezed == belgeTipi
          ? _value.belgeTipi
          : belgeTipi // ignore: cast_nullable_to_non_nullable
              as String?,
      urlGetir: freezed == urlGetir
          ? _value.urlGetir
          : urlGetir // ignore: cast_nullable_to_non_nullable
              as String?,
      belgeNo: freezed == belgeNo
          ? _value.belgeNo
          : belgeNo // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.pascal)
class _$EvraklarRequestModelImpl implements _EvraklarRequestModel {
  const _$EvraklarRequestModelImpl(
      {this.belgeTipi, this.urlGetir, this.belgeNo});

  factory _$EvraklarRequestModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$EvraklarRequestModelImplFromJson(json);

  @override
  final String? belgeTipi;
  @override
  final String? urlGetir;
  @override
  final String? belgeNo;

  @override
  String toString() {
    return 'EvraklarRequestModel(belgeTipi: $belgeTipi, urlGetir: $urlGetir, belgeNo: $belgeNo)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EvraklarRequestModelImpl &&
            (identical(other.belgeTipi, belgeTipi) ||
                other.belgeTipi == belgeTipi) &&
            (identical(other.urlGetir, urlGetir) ||
                other.urlGetir == urlGetir) &&
            (identical(other.belgeNo, belgeNo) || other.belgeNo == belgeNo));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, belgeTipi, urlGetir, belgeNo);

  /// Create a copy of EvraklarRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EvraklarRequestModelImplCopyWith<_$EvraklarRequestModelImpl>
      get copyWith =>
          __$$EvraklarRequestModelImplCopyWithImpl<_$EvraklarRequestModelImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EvraklarRequestModelImplToJson(
      this,
    );
  }
}

abstract class _EvraklarRequestModel implements EvraklarRequestModel {
  const factory _EvraklarRequestModel(
      {final String? belgeTipi,
      final String? urlGetir,
      final String? belgeNo}) = _$EvraklarRequestModelImpl;

  factory _EvraklarRequestModel.fromJson(Map<String, dynamic> json) =
      _$EvraklarRequestModelImpl.fromJson;

  @override
  String? get belgeTipi;
  @override
  String? get urlGetir;
  @override
  String? get belgeNo;

  /// Create a copy of EvraklarRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EvraklarRequestModelImplCopyWith<_$EvraklarRequestModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
