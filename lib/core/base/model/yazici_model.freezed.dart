// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'yazici_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

YaziciModel _$YaziciModelFromJson(Map<String, dynamic> json) {
  return _YaziciModel.fromJson(json);
}

/// @nodoc
mixin _$YaziciModel {
  @HiveField(0)
  String? get yaziciAdi => throw _privateConstructorUsedError;
  @HiveField(0)
  set yaziciAdi(String? value) => throw _privateConstructorUsedError;
  @HiveField(1)
  String get macAdresi => throw _privateConstructorUsedError;
  @HiveField(1)
  set macAdresi(String value) => throw _privateConstructorUsedError;
  @HiveField(2)
  YaziciTipi? get yaziciTipi => throw _privateConstructorUsedError;
  @HiveField(2)
  set yaziciTipi(YaziciTipi? value) => throw _privateConstructorUsedError;
  @HiveField(3)
  String? get aciklama => throw _privateConstructorUsedError;
  @HiveField(3)
  set aciklama(String? value) => throw _privateConstructorUsedError;
  @HiveField(4)
  String? get yazdirmaTipi => throw _privateConstructorUsedError;
  @HiveField(4)
  set yazdirmaTipi(String? value) => throw _privateConstructorUsedError;

  /// Serializes this YaziciModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of YaziciModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $YaziciModelCopyWith<YaziciModel> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $YaziciModelCopyWith<$Res> {
  factory $YaziciModelCopyWith(YaziciModel value, $Res Function(YaziciModel) then) =
      _$YaziciModelCopyWithImpl<$Res, YaziciModel>;
  @useResult
  $Res call({
    @HiveField(0) String? yaziciAdi,
    @HiveField(1) String macAdresi,
    @HiveField(2) YaziciTipi? yaziciTipi,
    @HiveField(3) String? aciklama,
    @HiveField(4) String? yazdirmaTipi,
  });
}

/// @nodoc
class _$YaziciModelCopyWithImpl<$Res, $Val extends YaziciModel> implements $YaziciModelCopyWith<$Res> {
  _$YaziciModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of YaziciModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? yaziciAdi = freezed,
    Object? macAdresi = null,
    Object? yaziciTipi = freezed,
    Object? aciklama = freezed,
    Object? yazdirmaTipi = freezed,
  }) {
    return _then(
      _value.copyWith(
            yaziciAdi: freezed == yaziciAdi
                ? _value.yaziciAdi
                : yaziciAdi // ignore: cast_nullable_to_non_nullable
                      as String?,
            macAdresi: null == macAdresi
                ? _value.macAdresi
                : macAdresi // ignore: cast_nullable_to_non_nullable
                      as String,
            yaziciTipi: freezed == yaziciTipi
                ? _value.yaziciTipi
                : yaziciTipi // ignore: cast_nullable_to_non_nullable
                      as YaziciTipi?,
            aciklama: freezed == aciklama
                ? _value.aciklama
                : aciklama // ignore: cast_nullable_to_non_nullable
                      as String?,
            yazdirmaTipi: freezed == yazdirmaTipi
                ? _value.yazdirmaTipi
                : yazdirmaTipi // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$YaziciModelImplCopyWith<$Res> implements $YaziciModelCopyWith<$Res> {
  factory _$$YaziciModelImplCopyWith(_$YaziciModelImpl value, $Res Function(_$YaziciModelImpl) then) =
      __$$YaziciModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @HiveField(0) String? yaziciAdi,
    @HiveField(1) String macAdresi,
    @HiveField(2) YaziciTipi? yaziciTipi,
    @HiveField(3) String? aciklama,
    @HiveField(4) String? yazdirmaTipi,
  });
}

/// @nodoc
class __$$YaziciModelImplCopyWithImpl<$Res> extends _$YaziciModelCopyWithImpl<$Res, _$YaziciModelImpl>
    implements _$$YaziciModelImplCopyWith<$Res> {
  __$$YaziciModelImplCopyWithImpl(_$YaziciModelImpl _value, $Res Function(_$YaziciModelImpl) _then)
    : super(_value, _then);

  /// Create a copy of YaziciModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? yaziciAdi = freezed,
    Object? macAdresi = null,
    Object? yaziciTipi = freezed,
    Object? aciklama = freezed,
    Object? yazdirmaTipi = freezed,
  }) {
    return _then(
      _$YaziciModelImpl(
        yaziciAdi: freezed == yaziciAdi
            ? _value.yaziciAdi
            : yaziciAdi // ignore: cast_nullable_to_non_nullable
                  as String?,
        macAdresi: null == macAdresi
            ? _value.macAdresi
            : macAdresi // ignore: cast_nullable_to_non_nullable
                  as String,
        yaziciTipi: freezed == yaziciTipi
            ? _value.yaziciTipi
            : yaziciTipi // ignore: cast_nullable_to_non_nullable
                  as YaziciTipi?,
        aciklama: freezed == aciklama
            ? _value.aciklama
            : aciklama // ignore: cast_nullable_to_non_nullable
                  as String?,
        yazdirmaTipi: freezed == yazdirmaTipi
            ? _value.yazdirmaTipi
            : yazdirmaTipi // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$YaziciModelImpl extends _YaziciModel {
  _$YaziciModelImpl({
    @HiveField(0) this.yaziciAdi,
    @HiveField(1) this.macAdresi = "",
    @HiveField(2) this.yaziciTipi,
    @HiveField(3) this.aciklama,
    @HiveField(4) this.yazdirmaTipi,
  }) : super._();

  factory _$YaziciModelImpl.fromJson(Map<String, dynamic> json) => _$$YaziciModelImplFromJson(json);

  @override
  @HiveField(0)
  String? yaziciAdi;
  @override
  @JsonKey()
  @HiveField(1)
  String macAdresi;
  @override
  @HiveField(2)
  YaziciTipi? yaziciTipi;
  @override
  @HiveField(3)
  String? aciklama;
  @override
  @HiveField(4)
  String? yazdirmaTipi;

  /// Create a copy of YaziciModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$YaziciModelImplCopyWith<_$YaziciModelImpl> get copyWith =>
      __$$YaziciModelImplCopyWithImpl<_$YaziciModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$YaziciModelImplToJson(this);
  }
}

abstract class _YaziciModel extends YaziciModel {
  factory _YaziciModel({
    @HiveField(0) String? yaziciAdi,
    @HiveField(1) String macAdresi,
    @HiveField(2) YaziciTipi? yaziciTipi,
    @HiveField(3) String? aciklama,
    @HiveField(4) String? yazdirmaTipi,
  }) = _$YaziciModelImpl;
  _YaziciModel._() : super._();

  factory _YaziciModel.fromJson(Map<String, dynamic> json) = _$YaziciModelImpl.fromJson;

  @override
  @HiveField(0)
  String? get yaziciAdi;
  @HiveField(0)
  set yaziciAdi(String? value);
  @override
  @HiveField(1)
  String get macAdresi;
  @HiveField(1)
  set macAdresi(String value);
  @override
  @HiveField(2)
  YaziciTipi? get yaziciTipi;
  @HiveField(2)
  set yaziciTipi(YaziciTipi? value);
  @override
  @HiveField(3)
  String? get aciklama;
  @HiveField(3)
  set aciklama(String? value);
  @override
  @HiveField(4)
  String? get yazdirmaTipi;
  @HiveField(4)
  set yazdirmaTipi(String? value);

  /// Create a copy of YaziciModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$YaziciModelImplCopyWith<_$YaziciModelImpl> get copyWith => throw _privateConstructorUsedError;
}
