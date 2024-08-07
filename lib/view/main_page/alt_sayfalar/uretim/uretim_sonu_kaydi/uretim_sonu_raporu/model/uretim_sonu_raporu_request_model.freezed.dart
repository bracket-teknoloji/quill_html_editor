// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'uretim_sonu_raporu_request_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UretimSonuRaporuRequestModel _$UretimSonuRaporuRequestModelFromJson(
    Map<String, dynamic> json) {
  return _UretimSonuRaporuRequestModel.fromJson(json);
}

/// @nodoc
mixin _$UretimSonuRaporuRequestModel {
  String? get belgeNo => throw _privateConstructorUsedError;
  set belgeNo(String? value) => throw _privateConstructorUsedError;
  int? get filtreKodu => throw _privateConstructorUsedError;
  set filtreKodu(int? value) => throw _privateConstructorUsedError;
  String? get stokKodu => throw _privateConstructorUsedError;
  set stokKodu(String? value) => throw _privateConstructorUsedError;

  /// Serializes this UretimSonuRaporuRequestModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UretimSonuRaporuRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UretimSonuRaporuRequestModelCopyWith<UretimSonuRaporuRequestModel>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UretimSonuRaporuRequestModelCopyWith<$Res> {
  factory $UretimSonuRaporuRequestModelCopyWith(
          UretimSonuRaporuRequestModel value,
          $Res Function(UretimSonuRaporuRequestModel) then) =
      _$UretimSonuRaporuRequestModelCopyWithImpl<$Res,
          UretimSonuRaporuRequestModel>;
  @useResult
  $Res call({String? belgeNo, int? filtreKodu, String? stokKodu});
}

/// @nodoc
class _$UretimSonuRaporuRequestModelCopyWithImpl<$Res,
        $Val extends UretimSonuRaporuRequestModel>
    implements $UretimSonuRaporuRequestModelCopyWith<$Res> {
  _$UretimSonuRaporuRequestModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UretimSonuRaporuRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? belgeNo = freezed,
    Object? filtreKodu = freezed,
    Object? stokKodu = freezed,
  }) {
    return _then(_value.copyWith(
      belgeNo: freezed == belgeNo
          ? _value.belgeNo
          : belgeNo // ignore: cast_nullable_to_non_nullable
              as String?,
      filtreKodu: freezed == filtreKodu
          ? _value.filtreKodu
          : filtreKodu // ignore: cast_nullable_to_non_nullable
              as int?,
      stokKodu: freezed == stokKodu
          ? _value.stokKodu
          : stokKodu // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UretimSonuRaporuRequestModelImplCopyWith<$Res>
    implements $UretimSonuRaporuRequestModelCopyWith<$Res> {
  factory _$$UretimSonuRaporuRequestModelImplCopyWith(
          _$UretimSonuRaporuRequestModelImpl value,
          $Res Function(_$UretimSonuRaporuRequestModelImpl) then) =
      __$$UretimSonuRaporuRequestModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? belgeNo, int? filtreKodu, String? stokKodu});
}

/// @nodoc
class __$$UretimSonuRaporuRequestModelImplCopyWithImpl<$Res>
    extends _$UretimSonuRaporuRequestModelCopyWithImpl<$Res,
        _$UretimSonuRaporuRequestModelImpl>
    implements _$$UretimSonuRaporuRequestModelImplCopyWith<$Res> {
  __$$UretimSonuRaporuRequestModelImplCopyWithImpl(
      _$UretimSonuRaporuRequestModelImpl _value,
      $Res Function(_$UretimSonuRaporuRequestModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of UretimSonuRaporuRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? belgeNo = freezed,
    Object? filtreKodu = freezed,
    Object? stokKodu = freezed,
  }) {
    return _then(_$UretimSonuRaporuRequestModelImpl(
      belgeNo: freezed == belgeNo
          ? _value.belgeNo
          : belgeNo // ignore: cast_nullable_to_non_nullable
              as String?,
      filtreKodu: freezed == filtreKodu
          ? _value.filtreKodu
          : filtreKodu // ignore: cast_nullable_to_non_nullable
              as int?,
      stokKodu: freezed == stokKodu
          ? _value.stokKodu
          : stokKodu // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.pascal)
class _$UretimSonuRaporuRequestModelImpl
    implements _UretimSonuRaporuRequestModel {
  _$UretimSonuRaporuRequestModelImpl(
      {this.belgeNo, this.filtreKodu, this.stokKodu});

  factory _$UretimSonuRaporuRequestModelImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$UretimSonuRaporuRequestModelImplFromJson(json);

  @override
  String? belgeNo;
  @override
  int? filtreKodu;
  @override
  String? stokKodu;

  @override
  String toString() {
    return 'UretimSonuRaporuRequestModel(belgeNo: $belgeNo, filtreKodu: $filtreKodu, stokKodu: $stokKodu)';
  }

  /// Create a copy of UretimSonuRaporuRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UretimSonuRaporuRequestModelImplCopyWith<
          _$UretimSonuRaporuRequestModelImpl>
      get copyWith => __$$UretimSonuRaporuRequestModelImplCopyWithImpl<
          _$UretimSonuRaporuRequestModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UretimSonuRaporuRequestModelImplToJson(
      this,
    );
  }
}

abstract class _UretimSonuRaporuRequestModel
    implements UretimSonuRaporuRequestModel {
  factory _UretimSonuRaporuRequestModel(
      {String? belgeNo,
      int? filtreKodu,
      String? stokKodu}) = _$UretimSonuRaporuRequestModelImpl;

  factory _UretimSonuRaporuRequestModel.fromJson(Map<String, dynamic> json) =
      _$UretimSonuRaporuRequestModelImpl.fromJson;

  @override
  String? get belgeNo;
  set belgeNo(String? value);
  @override
  int? get filtreKodu;
  set filtreKodu(int? value);
  @override
  String? get stokKodu;
  set stokKodu(String? value);

  /// Create a copy of UretimSonuRaporuRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UretimSonuRaporuRequestModelImplCopyWith<
          _$UretimSonuRaporuRequestModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
