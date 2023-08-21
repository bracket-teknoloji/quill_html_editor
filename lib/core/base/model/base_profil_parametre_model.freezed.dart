// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'base_profil_parametre_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

BaseProfilParametreModel _$BaseProfilParametreModelFromJson(
    Map<String, dynamic> json) {
  return _BaseProfilParametreModel.fromJson(json);
}

/// @nodoc
mixin _$BaseProfilParametreModel {
  bool get siparisYeniKaydaHazirla => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BaseProfilParametreModelCopyWith<BaseProfilParametreModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BaseProfilParametreModelCopyWith<$Res> {
  factory $BaseProfilParametreModelCopyWith(BaseProfilParametreModel value,
          $Res Function(BaseProfilParametreModel) then) =
      _$BaseProfilParametreModelCopyWithImpl<$Res, BaseProfilParametreModel>;
  @useResult
  $Res call({bool siparisYeniKaydaHazirla});
}

/// @nodoc
class _$BaseProfilParametreModelCopyWithImpl<$Res,
        $Val extends BaseProfilParametreModel>
    implements $BaseProfilParametreModelCopyWith<$Res> {
  _$BaseProfilParametreModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? siparisYeniKaydaHazirla = null,
  }) {
    return _then(_value.copyWith(
      siparisYeniKaydaHazirla: null == siparisYeniKaydaHazirla
          ? _value.siparisYeniKaydaHazirla
          : siparisYeniKaydaHazirla // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_BaseProfilParametreModelCopyWith<$Res>
    implements $BaseProfilParametreModelCopyWith<$Res> {
  factory _$$_BaseProfilParametreModelCopyWith(
          _$_BaseProfilParametreModel value,
          $Res Function(_$_BaseProfilParametreModel) then) =
      __$$_BaseProfilParametreModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool siparisYeniKaydaHazirla});
}

/// @nodoc
class __$$_BaseProfilParametreModelCopyWithImpl<$Res>
    extends _$BaseProfilParametreModelCopyWithImpl<$Res,
        _$_BaseProfilParametreModel>
    implements _$$_BaseProfilParametreModelCopyWith<$Res> {
  __$$_BaseProfilParametreModelCopyWithImpl(_$_BaseProfilParametreModel _value,
      $Res Function(_$_BaseProfilParametreModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? siparisYeniKaydaHazirla = null,
  }) {
    return _then(_$_BaseProfilParametreModel(
      siparisYeniKaydaHazirla: null == siparisYeniKaydaHazirla
          ? _value.siparisYeniKaydaHazirla
          : siparisYeniKaydaHazirla // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_BaseProfilParametreModel extends _BaseProfilParametreModel {
  _$_BaseProfilParametreModel({this.siparisYeniKaydaHazirla = true})
      : super._();

  factory _$_BaseProfilParametreModel.fromJson(Map<String, dynamic> json) =>
      _$$_BaseProfilParametreModelFromJson(json);

  @override
  @JsonKey()
  final bool siparisYeniKaydaHazirla;

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_BaseProfilParametreModelCopyWith<_$_BaseProfilParametreModel>
      get copyWith => __$$_BaseProfilParametreModelCopyWithImpl<
          _$_BaseProfilParametreModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_BaseProfilParametreModelToJson(
      this,
    );
  }
}

abstract class _BaseProfilParametreModel extends BaseProfilParametreModel {
  factory _BaseProfilParametreModel({final bool siparisYeniKaydaHazirla}) =
      _$_BaseProfilParametreModel;
  _BaseProfilParametreModel._() : super._();

  factory _BaseProfilParametreModel.fromJson(Map<String, dynamic> json) =
      _$_BaseProfilParametreModel.fromJson;

  @override
  bool get siparisYeniKaydaHazirla;
  @override
  @JsonKey(ignore: true)
  _$$_BaseProfilParametreModelCopyWith<_$_BaseProfilParametreModel>
      get copyWith => throw _privateConstructorUsedError;
}
