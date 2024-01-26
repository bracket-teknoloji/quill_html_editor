// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'seri_uret_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SeriUretModel _$SeriUretModelFromJson(Map<String, dynamic> json) {
  return _SeriUretModel.fromJson(json);
}

/// @nodoc
mixin _$SeriUretModel {
  String? get seriNo => throw _privateConstructorUsedError;
  set seriNo(String? value) => throw _privateConstructorUsedError;
  String? get stokKodu => throw _privateConstructorUsedError;
  set stokKodu(String? value) => throw _privateConstructorUsedError;
  int? get sonNo => throw _privateConstructorUsedError;
  set sonNo(int? value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SeriUretModelCopyWith<SeriUretModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SeriUretModelCopyWith<$Res> {
  factory $SeriUretModelCopyWith(
          SeriUretModel value, $Res Function(SeriUretModel) then) =
      _$SeriUretModelCopyWithImpl<$Res, SeriUretModel>;
  @useResult
  $Res call({String? seriNo, String? stokKodu, int? sonNo});
}

/// @nodoc
class _$SeriUretModelCopyWithImpl<$Res, $Val extends SeriUretModel>
    implements $SeriUretModelCopyWith<$Res> {
  _$SeriUretModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? seriNo = freezed,
    Object? stokKodu = freezed,
    Object? sonNo = freezed,
  }) {
    return _then(_value.copyWith(
      seriNo: freezed == seriNo
          ? _value.seriNo
          : seriNo // ignore: cast_nullable_to_non_nullable
              as String?,
      stokKodu: freezed == stokKodu
          ? _value.stokKodu
          : stokKodu // ignore: cast_nullable_to_non_nullable
              as String?,
      sonNo: freezed == sonNo
          ? _value.sonNo
          : sonNo // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SeriUretModelImplCopyWith<$Res>
    implements $SeriUretModelCopyWith<$Res> {
  factory _$$SeriUretModelImplCopyWith(
          _$SeriUretModelImpl value, $Res Function(_$SeriUretModelImpl) then) =
      __$$SeriUretModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? seriNo, String? stokKodu, int? sonNo});
}

/// @nodoc
class __$$SeriUretModelImplCopyWithImpl<$Res>
    extends _$SeriUretModelCopyWithImpl<$Res, _$SeriUretModelImpl>
    implements _$$SeriUretModelImplCopyWith<$Res> {
  __$$SeriUretModelImplCopyWithImpl(
      _$SeriUretModelImpl _value, $Res Function(_$SeriUretModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? seriNo = freezed,
    Object? stokKodu = freezed,
    Object? sonNo = freezed,
  }) {
    return _then(_$SeriUretModelImpl(
      seriNo: freezed == seriNo
          ? _value.seriNo
          : seriNo // ignore: cast_nullable_to_non_nullable
              as String?,
      stokKodu: freezed == stokKodu
          ? _value.stokKodu
          : stokKodu // ignore: cast_nullable_to_non_nullable
              as String?,
      sonNo: freezed == sonNo
          ? _value.sonNo
          : sonNo // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SeriUretModelImpl extends _SeriUretModel {
  _$SeriUretModelImpl({this.seriNo, this.stokKodu, this.sonNo}) : super._();

  factory _$SeriUretModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$SeriUretModelImplFromJson(json);

  @override
  String? seriNo;
  @override
  String? stokKodu;
  @override
  int? sonNo;

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SeriUretModelImplCopyWith<_$SeriUretModelImpl> get copyWith =>
      __$$SeriUretModelImplCopyWithImpl<_$SeriUretModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SeriUretModelImplToJson(
      this,
    );
  }
}

abstract class _SeriUretModel extends SeriUretModel {
  factory _SeriUretModel({String? seriNo, String? stokKodu, int? sonNo}) =
      _$SeriUretModelImpl;
  _SeriUretModel._() : super._();

  factory _SeriUretModel.fromJson(Map<String, dynamic> json) =
      _$SeriUretModelImpl.fromJson;

  @override
  String? get seriNo;
  set seriNo(String? value);
  @override
  String? get stokKodu;
  set stokKodu(String? value);
  @override
  int? get sonNo;
  set sonNo(int? value);
  @override
  @JsonKey(ignore: true)
  _$$SeriUretModelImplCopyWith<_$SeriUretModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
