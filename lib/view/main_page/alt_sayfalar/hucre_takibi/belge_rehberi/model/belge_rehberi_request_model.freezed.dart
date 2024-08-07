// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'belge_rehberi_request_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

BelgeRehberiRequestModel _$BelgeRehberiRequestModelFromJson(
    Map<String, dynamic> json) {
  return _BelgeRehberiRequestModel.fromJson(json);
}

/// @nodoc
mixin _$BelgeRehberiRequestModel {
  int? get depoKodu => throw _privateConstructorUsedError;
  String? get islemTuru => throw _privateConstructorUsedError;
  String? get pickerBelgeTuru => throw _privateConstructorUsedError;
  String? get searchText => throw _privateConstructorUsedError;

  /// Serializes this BelgeRehberiRequestModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of BelgeRehberiRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BelgeRehberiRequestModelCopyWith<BelgeRehberiRequestModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BelgeRehberiRequestModelCopyWith<$Res> {
  factory $BelgeRehberiRequestModelCopyWith(BelgeRehberiRequestModel value,
          $Res Function(BelgeRehberiRequestModel) then) =
      _$BelgeRehberiRequestModelCopyWithImpl<$Res, BelgeRehberiRequestModel>;
  @useResult
  $Res call(
      {int? depoKodu,
      String? islemTuru,
      String? pickerBelgeTuru,
      String? searchText});
}

/// @nodoc
class _$BelgeRehberiRequestModelCopyWithImpl<$Res,
        $Val extends BelgeRehberiRequestModel>
    implements $BelgeRehberiRequestModelCopyWith<$Res> {
  _$BelgeRehberiRequestModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BelgeRehberiRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? depoKodu = freezed,
    Object? islemTuru = freezed,
    Object? pickerBelgeTuru = freezed,
    Object? searchText = freezed,
  }) {
    return _then(_value.copyWith(
      depoKodu: freezed == depoKodu
          ? _value.depoKodu
          : depoKodu // ignore: cast_nullable_to_non_nullable
              as int?,
      islemTuru: freezed == islemTuru
          ? _value.islemTuru
          : islemTuru // ignore: cast_nullable_to_non_nullable
              as String?,
      pickerBelgeTuru: freezed == pickerBelgeTuru
          ? _value.pickerBelgeTuru
          : pickerBelgeTuru // ignore: cast_nullable_to_non_nullable
              as String?,
      searchText: freezed == searchText
          ? _value.searchText
          : searchText // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BelgeRehberiRequestModelImplCopyWith<$Res>
    implements $BelgeRehberiRequestModelCopyWith<$Res> {
  factory _$$BelgeRehberiRequestModelImplCopyWith(
          _$BelgeRehberiRequestModelImpl value,
          $Res Function(_$BelgeRehberiRequestModelImpl) then) =
      __$$BelgeRehberiRequestModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? depoKodu,
      String? islemTuru,
      String? pickerBelgeTuru,
      String? searchText});
}

/// @nodoc
class __$$BelgeRehberiRequestModelImplCopyWithImpl<$Res>
    extends _$BelgeRehberiRequestModelCopyWithImpl<$Res,
        _$BelgeRehberiRequestModelImpl>
    implements _$$BelgeRehberiRequestModelImplCopyWith<$Res> {
  __$$BelgeRehberiRequestModelImplCopyWithImpl(
      _$BelgeRehberiRequestModelImpl _value,
      $Res Function(_$BelgeRehberiRequestModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of BelgeRehberiRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? depoKodu = freezed,
    Object? islemTuru = freezed,
    Object? pickerBelgeTuru = freezed,
    Object? searchText = freezed,
  }) {
    return _then(_$BelgeRehberiRequestModelImpl(
      depoKodu: freezed == depoKodu
          ? _value.depoKodu
          : depoKodu // ignore: cast_nullable_to_non_nullable
              as int?,
      islemTuru: freezed == islemTuru
          ? _value.islemTuru
          : islemTuru // ignore: cast_nullable_to_non_nullable
              as String?,
      pickerBelgeTuru: freezed == pickerBelgeTuru
          ? _value.pickerBelgeTuru
          : pickerBelgeTuru // ignore: cast_nullable_to_non_nullable
              as String?,
      searchText: freezed == searchText
          ? _value.searchText
          : searchText // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.pascal)
class _$BelgeRehberiRequestModelImpl implements _BelgeRehberiRequestModel {
  const _$BelgeRehberiRequestModelImpl(
      {this.depoKodu, this.islemTuru, this.pickerBelgeTuru, this.searchText});

  factory _$BelgeRehberiRequestModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$BelgeRehberiRequestModelImplFromJson(json);

  @override
  final int? depoKodu;
  @override
  final String? islemTuru;
  @override
  final String? pickerBelgeTuru;
  @override
  final String? searchText;

  @override
  String toString() {
    return 'BelgeRehberiRequestModel(depoKodu: $depoKodu, islemTuru: $islemTuru, pickerBelgeTuru: $pickerBelgeTuru, searchText: $searchText)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BelgeRehberiRequestModelImpl &&
            (identical(other.depoKodu, depoKodu) ||
                other.depoKodu == depoKodu) &&
            (identical(other.islemTuru, islemTuru) ||
                other.islemTuru == islemTuru) &&
            (identical(other.pickerBelgeTuru, pickerBelgeTuru) ||
                other.pickerBelgeTuru == pickerBelgeTuru) &&
            (identical(other.searchText, searchText) ||
                other.searchText == searchText));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, depoKodu, islemTuru, pickerBelgeTuru, searchText);

  /// Create a copy of BelgeRehberiRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BelgeRehberiRequestModelImplCopyWith<_$BelgeRehberiRequestModelImpl>
      get copyWith => __$$BelgeRehberiRequestModelImplCopyWithImpl<
          _$BelgeRehberiRequestModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BelgeRehberiRequestModelImplToJson(
      this,
    );
  }
}

abstract class _BelgeRehberiRequestModel implements BelgeRehberiRequestModel {
  const factory _BelgeRehberiRequestModel(
      {final int? depoKodu,
      final String? islemTuru,
      final String? pickerBelgeTuru,
      final String? searchText}) = _$BelgeRehberiRequestModelImpl;

  factory _BelgeRehberiRequestModel.fromJson(Map<String, dynamic> json) =
      _$BelgeRehberiRequestModelImpl.fromJson;

  @override
  int? get depoKodu;
  @override
  String? get islemTuru;
  @override
  String? get pickerBelgeTuru;
  @override
  String? get searchText;

  /// Create a copy of BelgeRehberiRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BelgeRehberiRequestModelImplCopyWith<_$BelgeRehberiRequestModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
