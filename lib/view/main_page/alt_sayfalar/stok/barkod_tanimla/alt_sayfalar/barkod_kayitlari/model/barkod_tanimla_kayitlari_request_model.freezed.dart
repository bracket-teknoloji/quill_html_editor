// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'barkod_tanimla_kayitlari_request_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

BarkodTanimlaKayitlariRequestModel _$BarkodTanimlaKayitlariRequestModelFromJson(
    Map<String, dynamic> json) {
  return _BarkodTanimlaKayitlariRequestModel.fromJson(json);
}

/// @nodoc
mixin _$BarkodTanimlaKayitlariRequestModel {
  String? get stokKodu => throw _privateConstructorUsedError;
  String? get kayitTipi => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BarkodTanimlaKayitlariRequestModelCopyWith<
          BarkodTanimlaKayitlariRequestModel>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BarkodTanimlaKayitlariRequestModelCopyWith<$Res> {
  factory $BarkodTanimlaKayitlariRequestModelCopyWith(
          BarkodTanimlaKayitlariRequestModel value,
          $Res Function(BarkodTanimlaKayitlariRequestModel) then) =
      _$BarkodTanimlaKayitlariRequestModelCopyWithImpl<$Res,
          BarkodTanimlaKayitlariRequestModel>;
  @useResult
  $Res call({String? stokKodu, String? kayitTipi});
}

/// @nodoc
class _$BarkodTanimlaKayitlariRequestModelCopyWithImpl<$Res,
        $Val extends BarkodTanimlaKayitlariRequestModel>
    implements $BarkodTanimlaKayitlariRequestModelCopyWith<$Res> {
  _$BarkodTanimlaKayitlariRequestModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? stokKodu = freezed,
    Object? kayitTipi = freezed,
  }) {
    return _then(_value.copyWith(
      stokKodu: freezed == stokKodu
          ? _value.stokKodu
          : stokKodu // ignore: cast_nullable_to_non_nullable
              as String?,
      kayitTipi: freezed == kayitTipi
          ? _value.kayitTipi
          : kayitTipi // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BarkodTanimlaKayitlariRequestModelImplCopyWith<$Res>
    implements $BarkodTanimlaKayitlariRequestModelCopyWith<$Res> {
  factory _$$BarkodTanimlaKayitlariRequestModelImplCopyWith(
          _$BarkodTanimlaKayitlariRequestModelImpl value,
          $Res Function(_$BarkodTanimlaKayitlariRequestModelImpl) then) =
      __$$BarkodTanimlaKayitlariRequestModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? stokKodu, String? kayitTipi});
}

/// @nodoc
class __$$BarkodTanimlaKayitlariRequestModelImplCopyWithImpl<$Res>
    extends _$BarkodTanimlaKayitlariRequestModelCopyWithImpl<$Res,
        _$BarkodTanimlaKayitlariRequestModelImpl>
    implements _$$BarkodTanimlaKayitlariRequestModelImplCopyWith<$Res> {
  __$$BarkodTanimlaKayitlariRequestModelImplCopyWithImpl(
      _$BarkodTanimlaKayitlariRequestModelImpl _value,
      $Res Function(_$BarkodTanimlaKayitlariRequestModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? stokKodu = freezed,
    Object? kayitTipi = freezed,
  }) {
    return _then(_$BarkodTanimlaKayitlariRequestModelImpl(
      stokKodu: freezed == stokKodu
          ? _value.stokKodu
          : stokKodu // ignore: cast_nullable_to_non_nullable
              as String?,
      kayitTipi: freezed == kayitTipi
          ? _value.kayitTipi
          : kayitTipi // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.pascal)
class _$BarkodTanimlaKayitlariRequestModelImpl
    implements _BarkodTanimlaKayitlariRequestModel {
  _$BarkodTanimlaKayitlariRequestModelImpl({this.stokKodu, this.kayitTipi});

  factory _$BarkodTanimlaKayitlariRequestModelImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$BarkodTanimlaKayitlariRequestModelImplFromJson(json);

  @override
  final String? stokKodu;
  @override
  final String? kayitTipi;

  @override
  String toString() {
    return 'BarkodTanimlaKayitlariRequestModel(stokKodu: $stokKodu, kayitTipi: $kayitTipi)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BarkodTanimlaKayitlariRequestModelImpl &&
            (identical(other.stokKodu, stokKodu) ||
                other.stokKodu == stokKodu) &&
            (identical(other.kayitTipi, kayitTipi) ||
                other.kayitTipi == kayitTipi));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, stokKodu, kayitTipi);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BarkodTanimlaKayitlariRequestModelImplCopyWith<
          _$BarkodTanimlaKayitlariRequestModelImpl>
      get copyWith => __$$BarkodTanimlaKayitlariRequestModelImplCopyWithImpl<
          _$BarkodTanimlaKayitlariRequestModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BarkodTanimlaKayitlariRequestModelImplToJson(
      this,
    );
  }
}

abstract class _BarkodTanimlaKayitlariRequestModel
    implements BarkodTanimlaKayitlariRequestModel {
  factory _BarkodTanimlaKayitlariRequestModel(
      {final String? stokKodu,
      final String? kayitTipi}) = _$BarkodTanimlaKayitlariRequestModelImpl;

  factory _BarkodTanimlaKayitlariRequestModel.fromJson(
          Map<String, dynamic> json) =
      _$BarkodTanimlaKayitlariRequestModelImpl.fromJson;

  @override
  String? get stokKodu;
  @override
  String? get kayitTipi;
  @override
  @JsonKey(ignore: true)
  _$$BarkodTanimlaKayitlariRequestModelImplCopyWith<
          _$BarkodTanimlaKayitlariRequestModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
