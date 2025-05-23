// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'paketleme_edit_request_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

PaketlemeEditRequestModel _$PaketlemeEditRequestModelFromJson(Map<String, dynamic> json) {
  return _PaketlemeEditRequestModel.fromJson(json);
}

/// @nodoc
mixin _$PaketlemeEditRequestModel {
  int? get islemKodu => throw _privateConstructorUsedError;
  int? get paketId => throw _privateConstructorUsedError;
  int? get kalemId => throw _privateConstructorUsedError;

  /// Serializes this PaketlemeEditRequestModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PaketlemeEditRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PaketlemeEditRequestModelCopyWith<PaketlemeEditRequestModel> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaketlemeEditRequestModelCopyWith<$Res> {
  factory $PaketlemeEditRequestModelCopyWith(
    PaketlemeEditRequestModel value,
    $Res Function(PaketlemeEditRequestModel) then,
  ) = _$PaketlemeEditRequestModelCopyWithImpl<$Res, PaketlemeEditRequestModel>;
  @useResult
  $Res call({int? islemKodu, int? paketId, int? kalemId});
}

/// @nodoc
class _$PaketlemeEditRequestModelCopyWithImpl<$Res, $Val extends PaketlemeEditRequestModel>
    implements $PaketlemeEditRequestModelCopyWith<$Res> {
  _$PaketlemeEditRequestModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PaketlemeEditRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? islemKodu = freezed, Object? paketId = freezed, Object? kalemId = freezed}) {
    return _then(
      _value.copyWith(
            islemKodu: freezed == islemKodu
                ? _value.islemKodu
                : islemKodu // ignore: cast_nullable_to_non_nullable
                      as int?,
            paketId: freezed == paketId
                ? _value.paketId
                : paketId // ignore: cast_nullable_to_non_nullable
                      as int?,
            kalemId: freezed == kalemId
                ? _value.kalemId
                : kalemId // ignore: cast_nullable_to_non_nullable
                      as int?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$PaketlemeEditRequestModelImplCopyWith<$Res> implements $PaketlemeEditRequestModelCopyWith<$Res> {
  factory _$$PaketlemeEditRequestModelImplCopyWith(
    _$PaketlemeEditRequestModelImpl value,
    $Res Function(_$PaketlemeEditRequestModelImpl) then,
  ) = __$$PaketlemeEditRequestModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? islemKodu, int? paketId, int? kalemId});
}

/// @nodoc
class __$$PaketlemeEditRequestModelImplCopyWithImpl<$Res>
    extends _$PaketlemeEditRequestModelCopyWithImpl<$Res, _$PaketlemeEditRequestModelImpl>
    implements _$$PaketlemeEditRequestModelImplCopyWith<$Res> {
  __$$PaketlemeEditRequestModelImplCopyWithImpl(
    _$PaketlemeEditRequestModelImpl _value,
    $Res Function(_$PaketlemeEditRequestModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PaketlemeEditRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? islemKodu = freezed, Object? paketId = freezed, Object? kalemId = freezed}) {
    return _then(
      _$PaketlemeEditRequestModelImpl(
        islemKodu: freezed == islemKodu
            ? _value.islemKodu
            : islemKodu // ignore: cast_nullable_to_non_nullable
                  as int?,
        paketId: freezed == paketId
            ? _value.paketId
            : paketId // ignore: cast_nullable_to_non_nullable
                  as int?,
        kalemId: freezed == kalemId
            ? _value.kalemId
            : kalemId // ignore: cast_nullable_to_non_nullable
                  as int?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$PaketlemeEditRequestModelImpl implements _PaketlemeEditRequestModel {
  const _$PaketlemeEditRequestModelImpl({this.islemKodu, this.paketId, this.kalemId});

  factory _$PaketlemeEditRequestModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$PaketlemeEditRequestModelImplFromJson(json);

  @override
  final int? islemKodu;
  @override
  final int? paketId;
  @override
  final int? kalemId;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PaketlemeEditRequestModelImpl &&
            (identical(other.islemKodu, islemKodu) || other.islemKodu == islemKodu) &&
            (identical(other.paketId, paketId) || other.paketId == paketId) &&
            (identical(other.kalemId, kalemId) || other.kalemId == kalemId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, islemKodu, paketId, kalemId);

  /// Create a copy of PaketlemeEditRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PaketlemeEditRequestModelImplCopyWith<_$PaketlemeEditRequestModelImpl> get copyWith =>
      __$$PaketlemeEditRequestModelImplCopyWithImpl<_$PaketlemeEditRequestModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PaketlemeEditRequestModelImplToJson(this);
  }
}

abstract class _PaketlemeEditRequestModel implements PaketlemeEditRequestModel {
  const factory _PaketlemeEditRequestModel({final int? islemKodu, final int? paketId, final int? kalemId}) =
      _$PaketlemeEditRequestModelImpl;

  factory _PaketlemeEditRequestModel.fromJson(Map<String, dynamic> json) = _$PaketlemeEditRequestModelImpl.fromJson;

  @override
  int? get islemKodu;
  @override
  int? get paketId;
  @override
  int? get kalemId;

  /// Create a copy of PaketlemeEditRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PaketlemeEditRequestModelImplCopyWith<_$PaketlemeEditRequestModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
