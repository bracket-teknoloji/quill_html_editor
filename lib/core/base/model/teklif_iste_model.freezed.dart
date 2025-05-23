// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'teklif_iste_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

TeklifIsteModel _$TeklifIsteModelFromJson(Map<String, dynamic> json) {
  return _TeklifIsteModel.fromJson(json);
}

/// @nodoc
mixin _$TeklifIsteModel {
  String? get tip => throw _privateConstructorUsedError;
  String? get mesaj => throw _privateConstructorUsedError;

  /// Serializes this TeklifIsteModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TeklifIsteModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TeklifIsteModelCopyWith<TeklifIsteModel> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TeklifIsteModelCopyWith<$Res> {
  factory $TeklifIsteModelCopyWith(TeklifIsteModel value, $Res Function(TeklifIsteModel) then) =
      _$TeklifIsteModelCopyWithImpl<$Res, TeklifIsteModel>;
  @useResult
  $Res call({String? tip, String? mesaj});
}

/// @nodoc
class _$TeklifIsteModelCopyWithImpl<$Res, $Val extends TeklifIsteModel> implements $TeklifIsteModelCopyWith<$Res> {
  _$TeklifIsteModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TeklifIsteModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? tip = freezed, Object? mesaj = freezed}) {
    return _then(
      _value.copyWith(
            tip: freezed == tip
                ? _value.tip
                : tip // ignore: cast_nullable_to_non_nullable
                      as String?,
            mesaj: freezed == mesaj
                ? _value.mesaj
                : mesaj // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$TeklifIsteModelImplCopyWith<$Res> implements $TeklifIsteModelCopyWith<$Res> {
  factory _$$TeklifIsteModelImplCopyWith(_$TeklifIsteModelImpl value, $Res Function(_$TeklifIsteModelImpl) then) =
      __$$TeklifIsteModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? tip, String? mesaj});
}

/// @nodoc
class __$$TeklifIsteModelImplCopyWithImpl<$Res> extends _$TeklifIsteModelCopyWithImpl<$Res, _$TeklifIsteModelImpl>
    implements _$$TeklifIsteModelImplCopyWith<$Res> {
  __$$TeklifIsteModelImplCopyWithImpl(_$TeklifIsteModelImpl _value, $Res Function(_$TeklifIsteModelImpl) _then)
    : super(_value, _then);

  /// Create a copy of TeklifIsteModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? tip = freezed, Object? mesaj = freezed}) {
    return _then(
      _$TeklifIsteModelImpl(
        tip: freezed == tip
            ? _value.tip
            : tip // ignore: cast_nullable_to_non_nullable
                  as String?,
        mesaj: freezed == mesaj
            ? _value.mesaj
            : mesaj // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$TeklifIsteModelImpl extends _TeklifIsteModel {
  const _$TeklifIsteModelImpl({this.tip, this.mesaj}) : super._();

  factory _$TeklifIsteModelImpl.fromJson(Map<String, dynamic> json) => _$$TeklifIsteModelImplFromJson(json);

  @override
  final String? tip;
  @override
  final String? mesaj;

  /// Create a copy of TeklifIsteModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TeklifIsteModelImplCopyWith<_$TeklifIsteModelImpl> get copyWith =>
      __$$TeklifIsteModelImplCopyWithImpl<_$TeklifIsteModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TeklifIsteModelImplToJson(this);
  }
}

abstract class _TeklifIsteModel extends TeklifIsteModel {
  const factory _TeklifIsteModel({final String? tip, final String? mesaj}) = _$TeklifIsteModelImpl;
  const _TeklifIsteModel._() : super._();

  factory _TeklifIsteModel.fromJson(Map<String, dynamic> json) = _$TeklifIsteModelImpl.fromJson;

  @override
  String? get tip;
  @override
  String? get mesaj;

  /// Create a copy of TeklifIsteModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TeklifIsteModelImplCopyWith<_$TeklifIsteModelImpl> get copyWith => throw _privateConstructorUsedError;
}
