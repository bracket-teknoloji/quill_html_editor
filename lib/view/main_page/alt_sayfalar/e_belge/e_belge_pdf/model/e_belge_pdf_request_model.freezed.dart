// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'e_belge_pdf_request_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

EBelgePdfRequestModel _$EBelgePdfRequestModelFromJson(Map<String, dynamic> json) {
  return _EBelgePdfRequestModel.fromJson(json);
}

/// @nodoc
mixin _$EBelgePdfRequestModel {
  String? get belgeTuru => throw _privateConstructorUsedError;
  String? get ebelgeTuru => throw _privateConstructorUsedError;
  int? get islemKodu => throw _privateConstructorUsedError;
  String? get resmiBelgeNo => throw _privateConstructorUsedError;

  /// Serializes this EBelgePdfRequestModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of EBelgePdfRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $EBelgePdfRequestModelCopyWith<EBelgePdfRequestModel> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EBelgePdfRequestModelCopyWith<$Res> {
  factory $EBelgePdfRequestModelCopyWith(EBelgePdfRequestModel value, $Res Function(EBelgePdfRequestModel) then) =
      _$EBelgePdfRequestModelCopyWithImpl<$Res, EBelgePdfRequestModel>;
  @useResult
  $Res call({String? belgeTuru, String? ebelgeTuru, int? islemKodu, String? resmiBelgeNo});
}

/// @nodoc
class _$EBelgePdfRequestModelCopyWithImpl<$Res, $Val extends EBelgePdfRequestModel>
    implements $EBelgePdfRequestModelCopyWith<$Res> {
  _$EBelgePdfRequestModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of EBelgePdfRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? belgeTuru = freezed,
    Object? ebelgeTuru = freezed,
    Object? islemKodu = freezed,
    Object? resmiBelgeNo = freezed,
  }) {
    return _then(
      _value.copyWith(
            belgeTuru: freezed == belgeTuru
                ? _value.belgeTuru
                : belgeTuru // ignore: cast_nullable_to_non_nullable
                      as String?,
            ebelgeTuru: freezed == ebelgeTuru
                ? _value.ebelgeTuru
                : ebelgeTuru // ignore: cast_nullable_to_non_nullable
                      as String?,
            islemKodu: freezed == islemKodu
                ? _value.islemKodu
                : islemKodu // ignore: cast_nullable_to_non_nullable
                      as int?,
            resmiBelgeNo: freezed == resmiBelgeNo
                ? _value.resmiBelgeNo
                : resmiBelgeNo // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$EBelgePdfRequestModelImplCopyWith<$Res> implements $EBelgePdfRequestModelCopyWith<$Res> {
  factory _$$EBelgePdfRequestModelImplCopyWith(
    _$EBelgePdfRequestModelImpl value,
    $Res Function(_$EBelgePdfRequestModelImpl) then,
  ) = __$$EBelgePdfRequestModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? belgeTuru, String? ebelgeTuru, int? islemKodu, String? resmiBelgeNo});
}

/// @nodoc
class __$$EBelgePdfRequestModelImplCopyWithImpl<$Res>
    extends _$EBelgePdfRequestModelCopyWithImpl<$Res, _$EBelgePdfRequestModelImpl>
    implements _$$EBelgePdfRequestModelImplCopyWith<$Res> {
  __$$EBelgePdfRequestModelImplCopyWithImpl(
    _$EBelgePdfRequestModelImpl _value,
    $Res Function(_$EBelgePdfRequestModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of EBelgePdfRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? belgeTuru = freezed,
    Object? ebelgeTuru = freezed,
    Object? islemKodu = freezed,
    Object? resmiBelgeNo = freezed,
  }) {
    return _then(
      _$EBelgePdfRequestModelImpl(
        belgeTuru: freezed == belgeTuru
            ? _value.belgeTuru
            : belgeTuru // ignore: cast_nullable_to_non_nullable
                  as String?,
        ebelgeTuru: freezed == ebelgeTuru
            ? _value.ebelgeTuru
            : ebelgeTuru // ignore: cast_nullable_to_non_nullable
                  as String?,
        islemKodu: freezed == islemKodu
            ? _value.islemKodu
            : islemKodu // ignore: cast_nullable_to_non_nullable
                  as int?,
        resmiBelgeNo: freezed == resmiBelgeNo
            ? _value.resmiBelgeNo
            : resmiBelgeNo // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$EBelgePdfRequestModelImpl implements _EBelgePdfRequestModel {
  const _$EBelgePdfRequestModelImpl({this.belgeTuru, this.ebelgeTuru, this.islemKodu, this.resmiBelgeNo});

  factory _$EBelgePdfRequestModelImpl.fromJson(Map<String, dynamic> json) => _$$EBelgePdfRequestModelImplFromJson(json);

  @override
  final String? belgeTuru;
  @override
  final String? ebelgeTuru;
  @override
  final int? islemKodu;
  @override
  final String? resmiBelgeNo;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EBelgePdfRequestModelImpl &&
            (identical(other.belgeTuru, belgeTuru) || other.belgeTuru == belgeTuru) &&
            (identical(other.ebelgeTuru, ebelgeTuru) || other.ebelgeTuru == ebelgeTuru) &&
            (identical(other.islemKodu, islemKodu) || other.islemKodu == islemKodu) &&
            (identical(other.resmiBelgeNo, resmiBelgeNo) || other.resmiBelgeNo == resmiBelgeNo));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, belgeTuru, ebelgeTuru, islemKodu, resmiBelgeNo);

  /// Create a copy of EBelgePdfRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EBelgePdfRequestModelImplCopyWith<_$EBelgePdfRequestModelImpl> get copyWith =>
      __$$EBelgePdfRequestModelImplCopyWithImpl<_$EBelgePdfRequestModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EBelgePdfRequestModelImplToJson(this);
  }
}

abstract class _EBelgePdfRequestModel implements EBelgePdfRequestModel {
  const factory _EBelgePdfRequestModel({
    final String? belgeTuru,
    final String? ebelgeTuru,
    final int? islemKodu,
    final String? resmiBelgeNo,
  }) = _$EBelgePdfRequestModelImpl;

  factory _EBelgePdfRequestModel.fromJson(Map<String, dynamic> json) = _$EBelgePdfRequestModelImpl.fromJson;

  @override
  String? get belgeTuru;
  @override
  String? get ebelgeTuru;
  @override
  int? get islemKodu;
  @override
  String? get resmiBelgeNo;

  /// Create a copy of EBelgePdfRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EBelgePdfRequestModelImplCopyWith<_$EBelgePdfRequestModelImpl> get copyWith => throw _privateConstructorUsedError;
}
