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
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

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
  @JsonKey(name: "SeriNo")
  String? get seriNo => throw _privateConstructorUsedError;
  @JsonKey(name: "SeriNo")
  set seriNo(String? value) => throw _privateConstructorUsedError;
  @JsonKey(name: "Sirala", defaultValue: "TARIH_ZA")
  String? get sirala => throw _privateConstructorUsedError;
  @JsonKey(name: "Sirala", defaultValue: "TARIH_ZA")
  set sirala(String? value) => throw _privateConstructorUsedError;
  @JsonKey(name: "BelgeNo")
  String? get belgeNo => throw _privateConstructorUsedError;
  @JsonKey(name: "BelgeNo")
  set belgeNo(String? value) => throw _privateConstructorUsedError;
  @JsonKey(name: "BelgeTipi")
  String? get belgeTipi => throw _privateConstructorUsedError;
  @JsonKey(name: "BelgeTipi")
  set belgeTipi(String? value) => throw _privateConstructorUsedError;
  @JsonKey(name: "HareketID")
  int? get hareketId => throw _privateConstructorUsedError;
  @JsonKey(name: "HareketID")
  set hareketId(int? value) => throw _privateConstructorUsedError;
  @JsonKey(name: "TempGetir")
  String? get tempGetir => throw _privateConstructorUsedError;
  @JsonKey(name: "TempGetir")
  set tempGetir(String? value) => throw _privateConstructorUsedError;

  /// Serializes this SeriHareketleriRequestModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SeriHareketleriRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
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
      @JsonKey(name: "SeriNo") String? seriNo,
      @JsonKey(name: "Sirala", defaultValue: "TARIH_ZA") String? sirala,
      @JsonKey(name: "BelgeNo") String? belgeNo,
      @JsonKey(name: "BelgeTipi") String? belgeTipi,
      @JsonKey(name: "HareketID") int? hareketId,
      @JsonKey(name: "TempGetir") String? tempGetir});
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

  /// Create a copy of SeriHareketleriRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? stokKodu = freezed,
    Object? seriNo = freezed,
    Object? sirala = freezed,
    Object? belgeNo = freezed,
    Object? belgeTipi = freezed,
    Object? hareketId = freezed,
    Object? tempGetir = freezed,
  }) {
    return _then(_value.copyWith(
      stokKodu: freezed == stokKodu
          ? _value.stokKodu
          : stokKodu // ignore: cast_nullable_to_non_nullable
              as String?,
      seriNo: freezed == seriNo
          ? _value.seriNo
          : seriNo // ignore: cast_nullable_to_non_nullable
              as String?,
      sirala: freezed == sirala
          ? _value.sirala
          : sirala // ignore: cast_nullable_to_non_nullable
              as String?,
      belgeNo: freezed == belgeNo
          ? _value.belgeNo
          : belgeNo // ignore: cast_nullable_to_non_nullable
              as String?,
      belgeTipi: freezed == belgeTipi
          ? _value.belgeTipi
          : belgeTipi // ignore: cast_nullable_to_non_nullable
              as String?,
      hareketId: freezed == hareketId
          ? _value.hareketId
          : hareketId // ignore: cast_nullable_to_non_nullable
              as int?,
      tempGetir: freezed == tempGetir
          ? _value.tempGetir
          : tempGetir // ignore: cast_nullable_to_non_nullable
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
      @JsonKey(name: "SeriNo") String? seriNo,
      @JsonKey(name: "Sirala", defaultValue: "TARIH_ZA") String? sirala,
      @JsonKey(name: "BelgeNo") String? belgeNo,
      @JsonKey(name: "BelgeTipi") String? belgeTipi,
      @JsonKey(name: "HareketID") int? hareketId,
      @JsonKey(name: "TempGetir") String? tempGetir});
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

  /// Create a copy of SeriHareketleriRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? stokKodu = freezed,
    Object? seriNo = freezed,
    Object? sirala = freezed,
    Object? belgeNo = freezed,
    Object? belgeTipi = freezed,
    Object? hareketId = freezed,
    Object? tempGetir = freezed,
  }) {
    return _then(_$SeriHareketleriRequestModelImpl(
      stokKodu: freezed == stokKodu
          ? _value.stokKodu
          : stokKodu // ignore: cast_nullable_to_non_nullable
              as String?,
      seriNo: freezed == seriNo
          ? _value.seriNo
          : seriNo // ignore: cast_nullable_to_non_nullable
              as String?,
      sirala: freezed == sirala
          ? _value.sirala
          : sirala // ignore: cast_nullable_to_non_nullable
              as String?,
      belgeNo: freezed == belgeNo
          ? _value.belgeNo
          : belgeNo // ignore: cast_nullable_to_non_nullable
              as String?,
      belgeTipi: freezed == belgeTipi
          ? _value.belgeTipi
          : belgeTipi // ignore: cast_nullable_to_non_nullable
              as String?,
      hareketId: freezed == hareketId
          ? _value.hareketId
          : hareketId // ignore: cast_nullable_to_non_nullable
              as int?,
      tempGetir: freezed == tempGetir
          ? _value.tempGetir
          : tempGetir // ignore: cast_nullable_to_non_nullable
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
      @JsonKey(name: "SeriNo") this.seriNo,
      @JsonKey(name: "Sirala", defaultValue: "TARIH_ZA") this.sirala,
      @JsonKey(name: "BelgeNo") this.belgeNo,
      @JsonKey(name: "BelgeTipi") this.belgeTipi,
      @JsonKey(name: "HareketID") this.hareketId,
      @JsonKey(name: "TempGetir") this.tempGetir});

  factory _$SeriHareketleriRequestModelImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$SeriHareketleriRequestModelImplFromJson(json);

  @override
  @JsonKey(name: "StokKodu")
  String? stokKodu;
  @override
  @JsonKey(name: "SeriNo")
  String? seriNo;
  @override
  @JsonKey(name: "Sirala", defaultValue: "TARIH_ZA")
  String? sirala;
  @override
  @JsonKey(name: "BelgeNo")
  String? belgeNo;
  @override
  @JsonKey(name: "BelgeTipi")
  String? belgeTipi;
  @override
  @JsonKey(name: "HareketID")
  int? hareketId;
  @override
  @JsonKey(name: "TempGetir")
  String? tempGetir;

  /// Create a copy of SeriHareketleriRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
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
          @JsonKey(name: "SeriNo") String? seriNo,
          @JsonKey(name: "Sirala", defaultValue: "TARIH_ZA") String? sirala,
          @JsonKey(name: "BelgeNo") String? belgeNo,
          @JsonKey(name: "BelgeTipi") String? belgeTipi,
          @JsonKey(name: "HareketID") int? hareketId,
          @JsonKey(name: "TempGetir") String? tempGetir}) =
      _$SeriHareketleriRequestModelImpl;

  factory _SeriHareketleriRequestModel.fromJson(Map<String, dynamic> json) =
      _$SeriHareketleriRequestModelImpl.fromJson;

  @override
  @JsonKey(name: "StokKodu")
  String? get stokKodu;
  @JsonKey(name: "StokKodu")
  set stokKodu(String? value);
  @override
  @JsonKey(name: "SeriNo")
  String? get seriNo;
  @JsonKey(name: "SeriNo")
  set seriNo(String? value);
  @override
  @JsonKey(name: "Sirala", defaultValue: "TARIH_ZA")
  String? get sirala;
  @JsonKey(name: "Sirala", defaultValue: "TARIH_ZA")
  set sirala(String? value);
  @override
  @JsonKey(name: "BelgeNo")
  String? get belgeNo;
  @JsonKey(name: "BelgeNo")
  set belgeNo(String? value);
  @override
  @JsonKey(name: "BelgeTipi")
  String? get belgeTipi;
  @JsonKey(name: "BelgeTipi")
  set belgeTipi(String? value);
  @override
  @JsonKey(name: "HareketID")
  int? get hareketId;
  @JsonKey(name: "HareketID")
  set hareketId(int? value);
  @override
  @JsonKey(name: "TempGetir")
  String? get tempGetir;
  @JsonKey(name: "TempGetir")
  set tempGetir(String? value);

  /// Create a copy of SeriHareketleriRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SeriHareketleriRequestModelImplCopyWith<_$SeriHareketleriRequestModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
