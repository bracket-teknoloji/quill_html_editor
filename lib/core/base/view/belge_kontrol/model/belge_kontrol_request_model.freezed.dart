// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'belge_kontrol_request_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

BelgeKontrolRequestModel _$BelgeKontrolRequestModelFromJson(Map<String, dynamic> json) {
  return _BelgeKontrolRequestModel.fromJson(json);
}

/// @nodoc
mixin _$BelgeKontrolRequestModel {
  @JsonKey(name: "BaslamaTarihi")
  String? get baslamaTarihi => throw _privateConstructorUsedError;
  @JsonKey(name: "BaslamaTarihi")
  set baslamaTarihi(String? value) => throw _privateConstructorUsedError;
  @JsonKey(name: "BitisTarihi")
  String? get bitisTarihi => throw _privateConstructorUsedError;
  @JsonKey(name: "BitisTarihi")
  set bitisTarihi(String? value) => throw _privateConstructorUsedError;
  @JsonKey(name: "Durum")
  String? get durum => throw _privateConstructorUsedError;
  @JsonKey(name: "Durum")
  set durum(String? value) => throw _privateConstructorUsedError;

  /// Serializes this BelgeKontrolRequestModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of BelgeKontrolRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BelgeKontrolRequestModelCopyWith<BelgeKontrolRequestModel> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BelgeKontrolRequestModelCopyWith<$Res> {
  factory $BelgeKontrolRequestModelCopyWith(
    BelgeKontrolRequestModel value,
    $Res Function(BelgeKontrolRequestModel) then,
  ) = _$BelgeKontrolRequestModelCopyWithImpl<$Res, BelgeKontrolRequestModel>;
  @useResult
  $Res call({
    @JsonKey(name: "BaslamaTarihi") String? baslamaTarihi,
    @JsonKey(name: "BitisTarihi") String? bitisTarihi,
    @JsonKey(name: "Durum") String? durum,
  });
}

/// @nodoc
class _$BelgeKontrolRequestModelCopyWithImpl<$Res, $Val extends BelgeKontrolRequestModel>
    implements $BelgeKontrolRequestModelCopyWith<$Res> {
  _$BelgeKontrolRequestModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BelgeKontrolRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? baslamaTarihi = freezed, Object? bitisTarihi = freezed, Object? durum = freezed}) {
    return _then(
      _value.copyWith(
            baslamaTarihi: freezed == baslamaTarihi
                ? _value.baslamaTarihi
                : baslamaTarihi // ignore: cast_nullable_to_non_nullable
                      as String?,
            bitisTarihi: freezed == bitisTarihi
                ? _value.bitisTarihi
                : bitisTarihi // ignore: cast_nullable_to_non_nullable
                      as String?,
            durum: freezed == durum
                ? _value.durum
                : durum // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$BelgeKontrolRequestModelImplCopyWith<$Res> implements $BelgeKontrolRequestModelCopyWith<$Res> {
  factory _$$BelgeKontrolRequestModelImplCopyWith(
    _$BelgeKontrolRequestModelImpl value,
    $Res Function(_$BelgeKontrolRequestModelImpl) then,
  ) = __$$BelgeKontrolRequestModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: "BaslamaTarihi") String? baslamaTarihi,
    @JsonKey(name: "BitisTarihi") String? bitisTarihi,
    @JsonKey(name: "Durum") String? durum,
  });
}

/// @nodoc
class __$$BelgeKontrolRequestModelImplCopyWithImpl<$Res>
    extends _$BelgeKontrolRequestModelCopyWithImpl<$Res, _$BelgeKontrolRequestModelImpl>
    implements _$$BelgeKontrolRequestModelImplCopyWith<$Res> {
  __$$BelgeKontrolRequestModelImplCopyWithImpl(
    _$BelgeKontrolRequestModelImpl _value,
    $Res Function(_$BelgeKontrolRequestModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of BelgeKontrolRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? baslamaTarihi = freezed, Object? bitisTarihi = freezed, Object? durum = freezed}) {
    return _then(
      _$BelgeKontrolRequestModelImpl(
        baslamaTarihi: freezed == baslamaTarihi
            ? _value.baslamaTarihi
            : baslamaTarihi // ignore: cast_nullable_to_non_nullable
                  as String?,
        bitisTarihi: freezed == bitisTarihi
            ? _value.bitisTarihi
            : bitisTarihi // ignore: cast_nullable_to_non_nullable
                  as String?,
        durum: freezed == durum
            ? _value.durum
            : durum // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$BelgeKontrolRequestModelImpl extends _BelgeKontrolRequestModel {
  _$BelgeKontrolRequestModelImpl({
    @JsonKey(name: "BaslamaTarihi") this.baslamaTarihi,
    @JsonKey(name: "BitisTarihi") this.bitisTarihi,
    @JsonKey(name: "Durum") this.durum,
  }) : super._();

  factory _$BelgeKontrolRequestModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$BelgeKontrolRequestModelImplFromJson(json);

  @override
  @JsonKey(name: "BaslamaTarihi")
  String? baslamaTarihi;
  @override
  @JsonKey(name: "BitisTarihi")
  String? bitisTarihi;
  @override
  @JsonKey(name: "Durum")
  String? durum;

  /// Create a copy of BelgeKontrolRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BelgeKontrolRequestModelImplCopyWith<_$BelgeKontrolRequestModelImpl> get copyWith =>
      __$$BelgeKontrolRequestModelImplCopyWithImpl<_$BelgeKontrolRequestModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BelgeKontrolRequestModelImplToJson(this);
  }
}

abstract class _BelgeKontrolRequestModel extends BelgeKontrolRequestModel {
  factory _BelgeKontrolRequestModel({
    @JsonKey(name: "BaslamaTarihi") String? baslamaTarihi,
    @JsonKey(name: "BitisTarihi") String? bitisTarihi,
    @JsonKey(name: "Durum") String? durum,
  }) = _$BelgeKontrolRequestModelImpl;
  _BelgeKontrolRequestModel._() : super._();

  factory _BelgeKontrolRequestModel.fromJson(Map<String, dynamic> json) = _$BelgeKontrolRequestModelImpl.fromJson;

  @override
  @JsonKey(name: "BaslamaTarihi")
  String? get baslamaTarihi;
  @JsonKey(name: "BaslamaTarihi")
  set baslamaTarihi(String? value);
  @override
  @JsonKey(name: "BitisTarihi")
  String? get bitisTarihi;
  @JsonKey(name: "BitisTarihi")
  set bitisTarihi(String? value);
  @override
  @JsonKey(name: "Durum")
  String? get durum;
  @JsonKey(name: "Durum")
  set durum(String? value);

  /// Create a copy of BelgeKontrolRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BelgeKontrolRequestModelImplCopyWith<_$BelgeKontrolRequestModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
