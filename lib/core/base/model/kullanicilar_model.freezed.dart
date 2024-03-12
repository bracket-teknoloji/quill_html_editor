// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'kullanicilar_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

KullanicilarModel _$KullanicilarModelFromJson(Map<String, dynamic> json) {
  return _KullanicilarModel.fromJson(json);
}

/// @nodoc
mixin _$KullanicilarModel {
  String? get kodu => throw _privateConstructorUsedError;
  set kodu(String? value) => throw _privateConstructorUsedError;
  String? get adi => throw _privateConstructorUsedError;
  set adi(String? value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $KullanicilarModelCopyWith<KullanicilarModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $KullanicilarModelCopyWith<$Res> {
  factory $KullanicilarModelCopyWith(
          KullanicilarModel value, $Res Function(KullanicilarModel) then) =
      _$KullanicilarModelCopyWithImpl<$Res, KullanicilarModel>;
  @useResult
  $Res call({String? kodu, String? adi});
}

/// @nodoc
class _$KullanicilarModelCopyWithImpl<$Res, $Val extends KullanicilarModel>
    implements $KullanicilarModelCopyWith<$Res> {
  _$KullanicilarModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? kodu = freezed,
    Object? adi = freezed,
  }) {
    return _then(_value.copyWith(
      kodu: freezed == kodu
          ? _value.kodu
          : kodu // ignore: cast_nullable_to_non_nullable
              as String?,
      adi: freezed == adi
          ? _value.adi
          : adi // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$KullanicilarModelImplCopyWith<$Res>
    implements $KullanicilarModelCopyWith<$Res> {
  factory _$$KullanicilarModelImplCopyWith(_$KullanicilarModelImpl value,
          $Res Function(_$KullanicilarModelImpl) then) =
      __$$KullanicilarModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? kodu, String? adi});
}

/// @nodoc
class __$$KullanicilarModelImplCopyWithImpl<$Res>
    extends _$KullanicilarModelCopyWithImpl<$Res, _$KullanicilarModelImpl>
    implements _$$KullanicilarModelImplCopyWith<$Res> {
  __$$KullanicilarModelImplCopyWithImpl(_$KullanicilarModelImpl _value,
      $Res Function(_$KullanicilarModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? kodu = freezed,
    Object? adi = freezed,
  }) {
    return _then(_$KullanicilarModelImpl(
      kodu: freezed == kodu
          ? _value.kodu
          : kodu // ignore: cast_nullable_to_non_nullable
              as String?,
      adi: freezed == adi
          ? _value.adi
          : adi // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$KullanicilarModelImpl extends _KullanicilarModel {
  _$KullanicilarModelImpl({this.kodu, this.adi}) : super._();

  factory _$KullanicilarModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$KullanicilarModelImplFromJson(json);

  @override
  String? kodu;
  @override
  String? adi;

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$KullanicilarModelImplCopyWith<_$KullanicilarModelImpl> get copyWith =>
      __$$KullanicilarModelImplCopyWithImpl<_$KullanicilarModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$KullanicilarModelImplToJson(
      this,
    );
  }
}

abstract class _KullanicilarModel extends KullanicilarModel {
  factory _KullanicilarModel({String? kodu, String? adi}) =
      _$KullanicilarModelImpl;
  _KullanicilarModel._() : super._();

  factory _KullanicilarModel.fromJson(Map<String, dynamic> json) =
      _$KullanicilarModelImpl.fromJson;

  @override
  String? get kodu;
  set kodu(String? value);
  @override
  String? get adi;
  set adi(String? value);
  @override
  @JsonKey(ignore: true)
  _$$KullanicilarModelImplCopyWith<_$KullanicilarModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
