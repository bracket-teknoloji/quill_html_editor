// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'yapilandirma_profil_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

YapilandirmaProfilModel _$YapilandirmaProfilModelFromJson(Map<String, dynamic> json) {
  return _YapilandirmaProfilModel.fromJson(json);
}

/// @nodoc
mixin _$YapilandirmaProfilModel {
  int? get sira => throw _privateConstructorUsedError;
  set sira(int? value) => throw _privateConstructorUsedError;
  String? get ozellikKodu => throw _privateConstructorUsedError;
  set ozellikKodu(String? value) => throw _privateConstructorUsedError;
  String? get aciklama => throw _privateConstructorUsedError;
  set aciklama(String? value) => throw _privateConstructorUsedError;
  List<YapilandirmaRehberiModel?>? get deger => throw _privateConstructorUsedError;
  set deger(List<YapilandirmaRehberiModel?>? value) => throw _privateConstructorUsedError;

  /// Serializes this YapilandirmaProfilModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of YapilandirmaProfilModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $YapilandirmaProfilModelCopyWith<YapilandirmaProfilModel> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $YapilandirmaProfilModelCopyWith<$Res> {
  factory $YapilandirmaProfilModelCopyWith(YapilandirmaProfilModel value, $Res Function(YapilandirmaProfilModel) then) =
      _$YapilandirmaProfilModelCopyWithImpl<$Res, YapilandirmaProfilModel>;
  @useResult
  $Res call({int? sira, String? ozellikKodu, String? aciklama, List<YapilandirmaRehberiModel?>? deger});
}

/// @nodoc
class _$YapilandirmaProfilModelCopyWithImpl<$Res, $Val extends YapilandirmaProfilModel>
    implements $YapilandirmaProfilModelCopyWith<$Res> {
  _$YapilandirmaProfilModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of YapilandirmaProfilModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sira = freezed,
    Object? ozellikKodu = freezed,
    Object? aciklama = freezed,
    Object? deger = freezed,
  }) {
    return _then(
      _value.copyWith(
            sira: freezed == sira
                ? _value.sira
                : sira // ignore: cast_nullable_to_non_nullable
                      as int?,
            ozellikKodu: freezed == ozellikKodu
                ? _value.ozellikKodu
                : ozellikKodu // ignore: cast_nullable_to_non_nullable
                      as String?,
            aciklama: freezed == aciklama
                ? _value.aciklama
                : aciklama // ignore: cast_nullable_to_non_nullable
                      as String?,
            deger: freezed == deger
                ? _value.deger
                : deger // ignore: cast_nullable_to_non_nullable
                      as List<YapilandirmaRehberiModel?>?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$YapilandirmaProfilModelImplCopyWith<$Res> implements $YapilandirmaProfilModelCopyWith<$Res> {
  factory _$$YapilandirmaProfilModelImplCopyWith(
    _$YapilandirmaProfilModelImpl value,
    $Res Function(_$YapilandirmaProfilModelImpl) then,
  ) = __$$YapilandirmaProfilModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? sira, String? ozellikKodu, String? aciklama, List<YapilandirmaRehberiModel?>? deger});
}

/// @nodoc
class __$$YapilandirmaProfilModelImplCopyWithImpl<$Res>
    extends _$YapilandirmaProfilModelCopyWithImpl<$Res, _$YapilandirmaProfilModelImpl>
    implements _$$YapilandirmaProfilModelImplCopyWith<$Res> {
  __$$YapilandirmaProfilModelImplCopyWithImpl(
    _$YapilandirmaProfilModelImpl _value,
    $Res Function(_$YapilandirmaProfilModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of YapilandirmaProfilModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sira = freezed,
    Object? ozellikKodu = freezed,
    Object? aciklama = freezed,
    Object? deger = freezed,
  }) {
    return _then(
      _$YapilandirmaProfilModelImpl(
        sira: freezed == sira
            ? _value.sira
            : sira // ignore: cast_nullable_to_non_nullable
                  as int?,
        ozellikKodu: freezed == ozellikKodu
            ? _value.ozellikKodu
            : ozellikKodu // ignore: cast_nullable_to_non_nullable
                  as String?,
        aciklama: freezed == aciklama
            ? _value.aciklama
            : aciklama // ignore: cast_nullable_to_non_nullable
                  as String?,
        deger: freezed == deger
            ? _value.deger
            : deger // ignore: cast_nullable_to_non_nullable
                  as List<YapilandirmaRehberiModel?>?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$YapilandirmaProfilModelImpl extends _YapilandirmaProfilModel {
  _$YapilandirmaProfilModelImpl({this.sira, this.ozellikKodu, this.aciklama, this.deger}) : super._();

  factory _$YapilandirmaProfilModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$YapilandirmaProfilModelImplFromJson(json);

  @override
  int? sira;
  @override
  String? ozellikKodu;
  @override
  String? aciklama;
  @override
  List<YapilandirmaRehberiModel?>? deger;

  /// Create a copy of YapilandirmaProfilModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$YapilandirmaProfilModelImplCopyWith<_$YapilandirmaProfilModelImpl> get copyWith =>
      __$$YapilandirmaProfilModelImplCopyWithImpl<_$YapilandirmaProfilModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$YapilandirmaProfilModelImplToJson(this);
  }
}

abstract class _YapilandirmaProfilModel extends YapilandirmaProfilModel {
  factory _YapilandirmaProfilModel({
    int? sira,
    String? ozellikKodu,
    String? aciklama,
    List<YapilandirmaRehberiModel?>? deger,
  }) = _$YapilandirmaProfilModelImpl;
  _YapilandirmaProfilModel._() : super._();

  factory _YapilandirmaProfilModel.fromJson(Map<String, dynamic> json) = _$YapilandirmaProfilModelImpl.fromJson;

  @override
  int? get sira;
  set sira(int? value);
  @override
  String? get ozellikKodu;
  set ozellikKodu(String? value);
  @override
  String? get aciklama;
  set aciklama(String? value);
  @override
  List<YapilandirmaRehberiModel?>? get deger;
  set deger(List<YapilandirmaRehberiModel?>? value);

  /// Create a copy of YapilandirmaProfilModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$YapilandirmaProfilModelImplCopyWith<_$YapilandirmaProfilModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
