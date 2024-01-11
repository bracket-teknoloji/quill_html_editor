// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'seri_hareketleri_request_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SeriHareketleriRequestModel _$SeriHareketleriRequestModelFromJson(
    Map<String, dynamic> json) {
  return _SeriHareketleriRequestModel.fromJson(json);
}

/// @nodoc
mixin _$SeriHareketleriRequestModel {
  @JsonKey(name: "StokKodu")
  String? get stokKodu => throw _privateConstructorUsedError;
  @JsonKey(name: "StokKodu")
  set stokKodu(String? value) => throw _privateConstructorUsedError;
  @JsonKey(name: "Sirala")
  String? get sirala => throw _privateConstructorUsedError;
  @JsonKey(name: "Sirala")
  set sirala(String? value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SeriHareketleriRequestModelCopyWith<SeriHareketleriRequestModel>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SeriHareketleriRequestModelCopyWith<$Res> {
  factory $SeriHareketleriRequestModelCopyWith(
          SeriHareketleriRequestModel value,
          $Res Function(SeriHareketleriRequestModel) then) =
      _$SeriHareketleriRequestModelCopyWithImpl<$Res,
          SeriHareketleriRequestModel>;
  @useResult
  $Res call(
      {@JsonKey(name: "StokKodu") String? stokKodu,
      @JsonKey(name: "Sirala") String? sirala});
}

/// @nodoc
class _$SeriHareketleriRequestModelCopyWithImpl<$Res,
        $Val extends SeriHareketleriRequestModel>
    implements $SeriHareketleriRequestModelCopyWith<$Res> {
  _$SeriHareketleriRequestModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? stokKodu = freezed,
    Object? sirala = freezed,
  }) {
    return _then(_value.copyWith(
      stokKodu: freezed == stokKodu
          ? _value.stokKodu
          : stokKodu // ignore: cast_nullable_to_non_nullable
              as String?,
      sirala: freezed == sirala
          ? _value.sirala
          : sirala // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SeriHareketleriRequestModelImplCopyWith<$Res>
    implements $SeriHareketleriRequestModelCopyWith<$Res> {
  factory _$$SeriHareketleriRequestModelImplCopyWith(
          _$SeriHareketleriRequestModelImpl value,
          $Res Function(_$SeriHareketleriRequestModelImpl) then) =
      __$$SeriHareketleriRequestModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "StokKodu") String? stokKodu,
      @JsonKey(name: "Sirala") String? sirala});
}

/// @nodoc
class __$$SeriHareketleriRequestModelImplCopyWithImpl<$Res>
    extends _$SeriHareketleriRequestModelCopyWithImpl<$Res,
        _$SeriHareketleriRequestModelImpl>
    implements _$$SeriHareketleriRequestModelImplCopyWith<$Res> {
  __$$SeriHareketleriRequestModelImplCopyWithImpl(
      _$SeriHareketleriRequestModelImpl _value,
      $Res Function(_$SeriHareketleriRequestModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? stokKodu = freezed,
    Object? sirala = freezed,
  }) {
    return _then(_$SeriHareketleriRequestModelImpl(
      stokKodu: freezed == stokKodu
          ? _value.stokKodu
          : stokKodu // ignore: cast_nullable_to_non_nullable
              as String?,
      sirala: freezed == sirala
          ? _value.sirala
          : sirala // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SeriHareketleriRequestModelImpl
    implements _SeriHareketleriRequestModel {
  _$SeriHareketleriRequestModelImpl(
      {@JsonKey(name: "StokKodu") this.stokKodu,
      @JsonKey(name: "Sirala") this.sirala});

  factory _$SeriHareketleriRequestModelImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$SeriHareketleriRequestModelImplFromJson(json);

  @override
  @JsonKey(name: "StokKodu")
  String? stokKodu;
  @override
  @JsonKey(name: "Sirala")
  String? sirala;

  @override
  String toString() {
    return 'SeriHareketleriRequestModel(stokKodu: $stokKodu, sirala: $sirala)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SeriHareketleriRequestModelImplCopyWith<_$SeriHareketleriRequestModelImpl>
      get copyWith => __$$SeriHareketleriRequestModelImplCopyWithImpl<
          _$SeriHareketleriRequestModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SeriHareketleriRequestModelImplToJson(
      this,
    );
  }
}

abstract class _SeriHareketleriRequestModel
    implements SeriHareketleriRequestModel {
  factory _SeriHareketleriRequestModel(
          {@JsonKey(name: "StokKodu") String? stokKodu,
          @JsonKey(name: "Sirala") String? sirala}) =
      _$SeriHareketleriRequestModelImpl;

  factory _SeriHareketleriRequestModel.fromJson(Map<String, dynamic> json) =
      _$SeriHareketleriRequestModelImpl.fromJson;

  @override
  @JsonKey(name: "StokKodu")
  String? get stokKodu;
  @JsonKey(name: "StokKodu")
  set stokKodu(String? value);
  @override
  @JsonKey(name: "Sirala")
  String? get sirala;
  @JsonKey(name: "Sirala")
  set sirala(String? value);
  @override
  @JsonKey(ignore: true)
  _$$SeriHareketleriRequestModelImplCopyWith<_$SeriHareketleriRequestModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
