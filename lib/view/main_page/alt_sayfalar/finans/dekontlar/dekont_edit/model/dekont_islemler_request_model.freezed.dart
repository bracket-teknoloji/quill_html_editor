// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'dekont_islemler_request_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

DekontIslemlerRequestModel _$DekontIslemlerRequestModelFromJson(Map<String, dynamic> json) {
  return _DekontIslemlerRequestModel.fromJson(json);
}

/// @nodoc
mixin _$DekontIslemlerRequestModel {
  String? get dekontIslemTuru => throw _privateConstructorUsedError;
  set dekontIslemTuru(String? value) => throw _privateConstructorUsedError;
  String? get dekontSeri => throw _privateConstructorUsedError;
  set dekontSeri(String? value) => throw _privateConstructorUsedError;
  String? get guid => throw _privateConstructorUsedError;
  set guid(String? value) => throw _privateConstructorUsedError;
  List<DekontKalemler>? get kalemler => throw _privateConstructorUsedError;
  set kalemler(List<DekontKalemler>? value) => throw _privateConstructorUsedError;
  String? get plasiyerKodu => throw _privateConstructorUsedError;
  set plasiyerKodu(String? value) => throw _privateConstructorUsedError;
  String? get tag => throw _privateConstructorUsedError;
  set tag(String? value) => throw _privateConstructorUsedError;
  DateTime? get tarih => throw _privateConstructorUsedError;
  set tarih(DateTime? value) => throw _privateConstructorUsedError;
  @JsonKey(name: "_YeniKayit")
  bool? get yeniKayit => throw _privateConstructorUsedError;
  @JsonKey(name: "_YeniKayit")
  set yeniKayit(bool? value) => throw _privateConstructorUsedError;
  int? get dekontNo => throw _privateConstructorUsedError;
  set dekontNo(int? value) => throw _privateConstructorUsedError;
  @JsonKey(includeFromJson: false, includeToJson: false)
  String? get seriAdi => throw _privateConstructorUsedError;
  @JsonKey(includeFromJson: false, includeToJson: false)
  set seriAdi(String? value) => throw _privateConstructorUsedError;
  @JsonKey(includeFromJson: false, includeToJson: false)
  String? get plasiyerAdi => throw _privateConstructorUsedError;
  @JsonKey(includeFromJson: false, includeToJson: false)
  set plasiyerAdi(String? value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DekontIslemlerRequestModelCopyWith<DekontIslemlerRequestModel> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DekontIslemlerRequestModelCopyWith<$Res> {
  factory $DekontIslemlerRequestModelCopyWith(DekontIslemlerRequestModel value, $Res Function(DekontIslemlerRequestModel) then) =
      _$DekontIslemlerRequestModelCopyWithImpl<$Res, DekontIslemlerRequestModel>;
  @useResult
  $Res call(
      {String? dekontIslemTuru,
      String? dekontSeri,
      String? guid,
      List<DekontKalemler>? kalemler,
      String? plasiyerKodu,
      String? tag,
      DateTime? tarih,
      @JsonKey(name: "_YeniKayit") bool? yeniKayit,
      int? dekontNo,
      @JsonKey(includeFromJson: false, includeToJson: false) String? seriAdi,
      @JsonKey(includeFromJson: false, includeToJson: false) String? plasiyerAdi});
}

/// @nodoc
class _$DekontIslemlerRequestModelCopyWithImpl<$Res, $Val extends DekontIslemlerRequestModel> implements $DekontIslemlerRequestModelCopyWith<$Res> {
  _$DekontIslemlerRequestModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dekontIslemTuru = freezed,
    Object? dekontSeri = freezed,
    Object? guid = freezed,
    Object? kalemler = freezed,
    Object? plasiyerKodu = freezed,
    Object? tag = freezed,
    Object? tarih = freezed,
    Object? yeniKayit = freezed,
    Object? dekontNo = freezed,
    Object? seriAdi = freezed,
    Object? plasiyerAdi = freezed,
  }) {
    return _then(_value.copyWith(
      dekontIslemTuru: freezed == dekontIslemTuru
          ? _value.dekontIslemTuru
          : dekontIslemTuru // ignore: cast_nullable_to_non_nullable
              as String?,
      dekontSeri: freezed == dekontSeri
          ? _value.dekontSeri
          : dekontSeri // ignore: cast_nullable_to_non_nullable
              as String?,
      guid: freezed == guid
          ? _value.guid
          : guid // ignore: cast_nullable_to_non_nullable
              as String?,
      kalemler: freezed == kalemler
          ? _value.kalemler
          : kalemler // ignore: cast_nullable_to_non_nullable
              as List<DekontKalemler>?,
      plasiyerKodu: freezed == plasiyerKodu
          ? _value.plasiyerKodu
          : plasiyerKodu // ignore: cast_nullable_to_non_nullable
              as String?,
      tag: freezed == tag
          ? _value.tag
          : tag // ignore: cast_nullable_to_non_nullable
              as String?,
      tarih: freezed == tarih
          ? _value.tarih
          : tarih // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      yeniKayit: freezed == yeniKayit
          ? _value.yeniKayit
          : yeniKayit // ignore: cast_nullable_to_non_nullable
              as bool?,
      dekontNo: freezed == dekontNo
          ? _value.dekontNo
          : dekontNo // ignore: cast_nullable_to_non_nullable
              as int?,
      seriAdi: freezed == seriAdi
          ? _value.seriAdi
          : seriAdi // ignore: cast_nullable_to_non_nullable
              as String?,
      plasiyerAdi: freezed == plasiyerAdi
          ? _value.plasiyerAdi
          : plasiyerAdi // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DekontIslemlerRequestModelImplCopyWith<$Res> implements $DekontIslemlerRequestModelCopyWith<$Res> {
  factory _$$DekontIslemlerRequestModelImplCopyWith(_$DekontIslemlerRequestModelImpl value, $Res Function(_$DekontIslemlerRequestModelImpl) then) =
      __$$DekontIslemlerRequestModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? dekontIslemTuru,
      String? dekontSeri,
      String? guid,
      List<DekontKalemler>? kalemler,
      String? plasiyerKodu,
      String? tag,
      DateTime? tarih,
      @JsonKey(name: "_YeniKayit") bool? yeniKayit,
      int? dekontNo,
      @JsonKey(includeFromJson: false, includeToJson: false) String? seriAdi,
      @JsonKey(includeFromJson: false, includeToJson: false) String? plasiyerAdi});
}

/// @nodoc
class __$$DekontIslemlerRequestModelImplCopyWithImpl<$Res> extends _$DekontIslemlerRequestModelCopyWithImpl<$Res, _$DekontIslemlerRequestModelImpl>
    implements _$$DekontIslemlerRequestModelImplCopyWith<$Res> {
  __$$DekontIslemlerRequestModelImplCopyWithImpl(_$DekontIslemlerRequestModelImpl _value, $Res Function(_$DekontIslemlerRequestModelImpl) _then) : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dekontIslemTuru = freezed,
    Object? dekontSeri = freezed,
    Object? guid = freezed,
    Object? kalemler = freezed,
    Object? plasiyerKodu = freezed,
    Object? tag = freezed,
    Object? tarih = freezed,
    Object? yeniKayit = freezed,
    Object? dekontNo = freezed,
    Object? seriAdi = freezed,
    Object? plasiyerAdi = freezed,
  }) {
    return _then(_$DekontIslemlerRequestModelImpl(
      dekontIslemTuru: freezed == dekontIslemTuru
          ? _value.dekontIslemTuru
          : dekontIslemTuru // ignore: cast_nullable_to_non_nullable
              as String?,
      dekontSeri: freezed == dekontSeri
          ? _value.dekontSeri
          : dekontSeri // ignore: cast_nullable_to_non_nullable
              as String?,
      guid: freezed == guid
          ? _value.guid
          : guid // ignore: cast_nullable_to_non_nullable
              as String?,
      kalemler: freezed == kalemler
          ? _value.kalemler
          : kalemler // ignore: cast_nullable_to_non_nullable
              as List<DekontKalemler>?,
      plasiyerKodu: freezed == plasiyerKodu
          ? _value.plasiyerKodu
          : plasiyerKodu // ignore: cast_nullable_to_non_nullable
              as String?,
      tag: freezed == tag
          ? _value.tag
          : tag // ignore: cast_nullable_to_non_nullable
              as String?,
      tarih: freezed == tarih
          ? _value.tarih
          : tarih // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      yeniKayit: freezed == yeniKayit
          ? _value.yeniKayit
          : yeniKayit // ignore: cast_nullable_to_non_nullable
              as bool?,
      dekontNo: freezed == dekontNo
          ? _value.dekontNo
          : dekontNo // ignore: cast_nullable_to_non_nullable
              as int?,
      seriAdi: freezed == seriAdi
          ? _value.seriAdi
          : seriAdi // ignore: cast_nullable_to_non_nullable
              as String?,
      plasiyerAdi: freezed == plasiyerAdi
          ? _value.plasiyerAdi
          : plasiyerAdi // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DekontIslemlerRequestModelImpl extends _DekontIslemlerRequestModel {
  _$DekontIslemlerRequestModelImpl(
      {this.dekontIslemTuru,
      this.dekontSeri,
      this.guid,
      this.kalemler,
      this.plasiyerKodu,
      this.tag = "DekontModel",
      this.tarih,
      @JsonKey(name: "_YeniKayit") this.yeniKayit,
      this.dekontNo,
      @JsonKey(includeFromJson: false, includeToJson: false) this.seriAdi,
      @JsonKey(includeFromJson: false, includeToJson: false) this.plasiyerAdi})
      : super._();

  factory _$DekontIslemlerRequestModelImpl.fromJson(Map<String, dynamic> json) => _$$DekontIslemlerRequestModelImplFromJson(json);

  @override
  String? dekontIslemTuru;
  @override
  String? dekontSeri;
  @override
  String? guid;
  @override
  List<DekontKalemler>? kalemler;
  @override
  String? plasiyerKodu;
  @override
  @JsonKey()
  String? tag;
  @override
  DateTime? tarih;
  @override
  @JsonKey(name: "_YeniKayit")
  bool? yeniKayit;
  @override
  int? dekontNo;
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  String? seriAdi;
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  String? plasiyerAdi;

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DekontIslemlerRequestModelImplCopyWith<_$DekontIslemlerRequestModelImpl> get copyWith => __$$DekontIslemlerRequestModelImplCopyWithImpl<_$DekontIslemlerRequestModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DekontIslemlerRequestModelImplToJson(
      this,
    );
  }
}

abstract class _DekontIslemlerRequestModel extends DekontIslemlerRequestModel {
  factory _DekontIslemlerRequestModel(
      {String? dekontIslemTuru,
      String? dekontSeri,
      String? guid,
      List<DekontKalemler>? kalemler,
      String? plasiyerKodu,
      String? tag,
      DateTime? tarih,
      @JsonKey(name: "_YeniKayit") bool? yeniKayit,
      int? dekontNo,
      @JsonKey(includeFromJson: false, includeToJson: false) String? seriAdi,
      @JsonKey(includeFromJson: false, includeToJson: false) String? plasiyerAdi}) = _$DekontIslemlerRequestModelImpl;
  _DekontIslemlerRequestModel._() : super._();

  factory _DekontIslemlerRequestModel.fromJson(Map<String, dynamic> json) = _$DekontIslemlerRequestModelImpl.fromJson;

  @override
  String? get dekontIslemTuru;
  set dekontIslemTuru(String? value);
  @override
  String? get dekontSeri;
  set dekontSeri(String? value);
  @override
  String? get guid;
  set guid(String? value);
  @override
  List<DekontKalemler>? get kalemler;
  set kalemler(List<DekontKalemler>? value);
  @override
  String? get plasiyerKodu;
  set plasiyerKodu(String? value);
  @override
  String? get tag;
  set tag(String? value);
  @override
  DateTime? get tarih;
  set tarih(DateTime? value);
  @override
  @JsonKey(name: "_YeniKayit")
  bool? get yeniKayit;
  @JsonKey(name: "_YeniKayit")
  set yeniKayit(bool? value);
  @override
  int? get dekontNo;
  set dekontNo(int? value);
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  String? get seriAdi;
  @JsonKey(includeFromJson: false, includeToJson: false)
  set seriAdi(String? value);
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  String? get plasiyerAdi;
  @JsonKey(includeFromJson: false, includeToJson: false)
  set plasiyerAdi(String? value);
  @override
  @JsonKey(ignore: true)
  _$$DekontIslemlerRequestModelImplCopyWith<_$DekontIslemlerRequestModelImpl> get copyWith => throw _privateConstructorUsedError;
}
