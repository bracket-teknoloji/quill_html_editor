// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'transfer_mal_talebi_listesi_request_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TransferMalTalebiListesiRequestModel
    _$TransferMalTalebiListesiRequestModelFromJson(Map<String, dynamic> json) {
  return _TransferMalTalebiListesiRequestModel.fromJson(json);
}

/// @nodoc
mixin _$TransferMalTalebiListesiRequestModel {
  String? get durum => throw _privateConstructorUsedError;
  List<int>? get filtreler => throw _privateConstructorUsedError;

  /// Serializes this TransferMalTalebiListesiRequestModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TransferMalTalebiListesiRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TransferMalTalebiListesiRequestModelCopyWith<
          TransferMalTalebiListesiRequestModel>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TransferMalTalebiListesiRequestModelCopyWith<$Res> {
  factory $TransferMalTalebiListesiRequestModelCopyWith(
          TransferMalTalebiListesiRequestModel value,
          $Res Function(TransferMalTalebiListesiRequestModel) then) =
      _$TransferMalTalebiListesiRequestModelCopyWithImpl<$Res,
          TransferMalTalebiListesiRequestModel>;
  @useResult
  $Res call({String? durum, List<int>? filtreler});
}

/// @nodoc
class _$TransferMalTalebiListesiRequestModelCopyWithImpl<$Res,
        $Val extends TransferMalTalebiListesiRequestModel>
    implements $TransferMalTalebiListesiRequestModelCopyWith<$Res> {
  _$TransferMalTalebiListesiRequestModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TransferMalTalebiListesiRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? durum = freezed,
    Object? filtreler = freezed,
  }) {
    return _then(_value.copyWith(
      durum: freezed == durum
          ? _value.durum
          : durum // ignore: cast_nullable_to_non_nullable
              as String?,
      filtreler: freezed == filtreler
          ? _value.filtreler
          : filtreler // ignore: cast_nullable_to_non_nullable
              as List<int>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TransferMalTalebiListesiRequestModelImplCopyWith<$Res>
    implements $TransferMalTalebiListesiRequestModelCopyWith<$Res> {
  factory _$$TransferMalTalebiListesiRequestModelImplCopyWith(
          _$TransferMalTalebiListesiRequestModelImpl value,
          $Res Function(_$TransferMalTalebiListesiRequestModelImpl) then) =
      __$$TransferMalTalebiListesiRequestModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? durum, List<int>? filtreler});
}

/// @nodoc
class __$$TransferMalTalebiListesiRequestModelImplCopyWithImpl<$Res>
    extends _$TransferMalTalebiListesiRequestModelCopyWithImpl<$Res,
        _$TransferMalTalebiListesiRequestModelImpl>
    implements _$$TransferMalTalebiListesiRequestModelImplCopyWith<$Res> {
  __$$TransferMalTalebiListesiRequestModelImplCopyWithImpl(
      _$TransferMalTalebiListesiRequestModelImpl _value,
      $Res Function(_$TransferMalTalebiListesiRequestModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of TransferMalTalebiListesiRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? durum = freezed,
    Object? filtreler = freezed,
  }) {
    return _then(_$TransferMalTalebiListesiRequestModelImpl(
      durum: freezed == durum
          ? _value.durum
          : durum // ignore: cast_nullable_to_non_nullable
              as String?,
      filtreler: freezed == filtreler
          ? _value._filtreler
          : filtreler // ignore: cast_nullable_to_non_nullable
              as List<int>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TransferMalTalebiListesiRequestModelImpl
    implements _TransferMalTalebiListesiRequestModel {
  const _$TransferMalTalebiListesiRequestModelImpl(
      {this.durum, final List<int>? filtreler})
      : _filtreler = filtreler;

  factory _$TransferMalTalebiListesiRequestModelImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$TransferMalTalebiListesiRequestModelImplFromJson(json);

  @override
  final String? durum;
  final List<int>? _filtreler;
  @override
  List<int>? get filtreler {
    final value = _filtreler;
    if (value == null) return null;
    if (_filtreler is EqualUnmodifiableListView) return _filtreler;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TransferMalTalebiListesiRequestModelImpl &&
            (identical(other.durum, durum) || other.durum == durum) &&
            const DeepCollectionEquality()
                .equals(other._filtreler, _filtreler));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, durum, const DeepCollectionEquality().hash(_filtreler));

  /// Create a copy of TransferMalTalebiListesiRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TransferMalTalebiListesiRequestModelImplCopyWith<
          _$TransferMalTalebiListesiRequestModelImpl>
      get copyWith => __$$TransferMalTalebiListesiRequestModelImplCopyWithImpl<
          _$TransferMalTalebiListesiRequestModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TransferMalTalebiListesiRequestModelImplToJson(
      this,
    );
  }
}

abstract class _TransferMalTalebiListesiRequestModel
    implements TransferMalTalebiListesiRequestModel {
  const factory _TransferMalTalebiListesiRequestModel(
      {final String? durum,
      final List<int>? filtreler}) = _$TransferMalTalebiListesiRequestModelImpl;

  factory _TransferMalTalebiListesiRequestModel.fromJson(
          Map<String, dynamic> json) =
      _$TransferMalTalebiListesiRequestModelImpl.fromJson;

  @override
  String? get durum;
  @override
  List<int>? get filtreler;

  /// Create a copy of TransferMalTalebiListesiRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TransferMalTalebiListesiRequestModelImplCopyWith<
          _$TransferMalTalebiListesiRequestModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
