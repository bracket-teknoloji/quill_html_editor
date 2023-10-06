// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'seri_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SeriModel _$SeriModelFromJson(Map<String, dynamic> json) {
  return _SeriModel.fromJson(json);
}

/// @nodoc
mixin _$SeriModel {
  String? get seriNo => throw _privateConstructorUsedError;
  String? get aciklama => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SeriModelCopyWith<SeriModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SeriModelCopyWith<$Res> {
  factory $SeriModelCopyWith(SeriModel value, $Res Function(SeriModel) then) =
      _$SeriModelCopyWithImpl<$Res, SeriModel>;
  @useResult
  $Res call({String? seriNo, String? aciklama});
}

/// @nodoc
class _$SeriModelCopyWithImpl<$Res, $Val extends SeriModel>
    implements $SeriModelCopyWith<$Res> {
  _$SeriModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? seriNo = freezed,
    Object? aciklama = freezed,
  }) {
    return _then(_value.copyWith(
      seriNo: freezed == seriNo
          ? _value.seriNo
          : seriNo // ignore: cast_nullable_to_non_nullable
              as String?,
      aciklama: freezed == aciklama
          ? _value.aciklama
          : aciklama // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SeriModelCopyWith<$Res> implements $SeriModelCopyWith<$Res> {
  factory _$$_SeriModelCopyWith(
          _$_SeriModel value, $Res Function(_$_SeriModel) then) =
      __$$_SeriModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? seriNo, String? aciklama});
}

/// @nodoc
class __$$_SeriModelCopyWithImpl<$Res>
    extends _$SeriModelCopyWithImpl<$Res, _$_SeriModel>
    implements _$$_SeriModelCopyWith<$Res> {
  __$$_SeriModelCopyWithImpl(
      _$_SeriModel _value, $Res Function(_$_SeriModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? seriNo = freezed,
    Object? aciklama = freezed,
  }) {
    return _then(_$_SeriModel(
      seriNo: freezed == seriNo
          ? _value.seriNo
          : seriNo // ignore: cast_nullable_to_non_nullable
              as String?,
      aciklama: freezed == aciklama
          ? _value.aciklama
          : aciklama // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SeriModel extends _SeriModel {
  _$_SeriModel({this.seriNo, this.aciklama}) : super._();

  factory _$_SeriModel.fromJson(Map<String, dynamic> json) =>
      _$$_SeriModelFromJson(json);

  @override
  final String? seriNo;
  @override
  final String? aciklama;

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SeriModelCopyWith<_$_SeriModel> get copyWith =>
      __$$_SeriModelCopyWithImpl<_$_SeriModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SeriModelToJson(
      this,
    );
  }
}

abstract class _SeriModel extends SeriModel {
  factory _SeriModel({final String? seriNo, final String? aciklama}) =
      _$_SeriModel;
  _SeriModel._() : super._();

  factory _SeriModel.fromJson(Map<String, dynamic> json) =
      _$_SeriModel.fromJson;

  @override
  String? get seriNo;
  @override
  String? get aciklama;
  @override
  @JsonKey(ignore: true)
  _$$_SeriModelCopyWith<_$_SeriModel> get copyWith =>
      throw _privateConstructorUsedError;
}
