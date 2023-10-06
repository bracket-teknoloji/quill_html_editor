// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'muhasebe_referans_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MuhasebeReferansModel _$MuhasebeReferansModelFromJson(
    Map<String, dynamic> json) {
  return _MuhasebeReferansModel.fromJson(json);
}

/// @nodoc
mixin _$MuhasebeReferansModel {
  String? get kodu => throw _privateConstructorUsedError;
  set kodu(String? value) => throw _privateConstructorUsedError;
  String? get tanimi => throw _privateConstructorUsedError;
  set tanimi(String? value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MuhasebeReferansModelCopyWith<MuhasebeReferansModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MuhasebeReferansModelCopyWith<$Res> {
  factory $MuhasebeReferansModelCopyWith(MuhasebeReferansModel value,
          $Res Function(MuhasebeReferansModel) then) =
      _$MuhasebeReferansModelCopyWithImpl<$Res, MuhasebeReferansModel>;
  @useResult
  $Res call({String? kodu, String? tanimi});
}

/// @nodoc
class _$MuhasebeReferansModelCopyWithImpl<$Res,
        $Val extends MuhasebeReferansModel>
    implements $MuhasebeReferansModelCopyWith<$Res> {
  _$MuhasebeReferansModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? kodu = freezed,
    Object? tanimi = freezed,
  }) {
    return _then(_value.copyWith(
      kodu: freezed == kodu
          ? _value.kodu
          : kodu // ignore: cast_nullable_to_non_nullable
              as String?,
      tanimi: freezed == tanimi
          ? _value.tanimi
          : tanimi // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_MuhasebeReferansModelCopyWith<$Res>
    implements $MuhasebeReferansModelCopyWith<$Res> {
  factory _$$_MuhasebeReferansModelCopyWith(_$_MuhasebeReferansModel value,
          $Res Function(_$_MuhasebeReferansModel) then) =
      __$$_MuhasebeReferansModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? kodu, String? tanimi});
}

/// @nodoc
class __$$_MuhasebeReferansModelCopyWithImpl<$Res>
    extends _$MuhasebeReferansModelCopyWithImpl<$Res, _$_MuhasebeReferansModel>
    implements _$$_MuhasebeReferansModelCopyWith<$Res> {
  __$$_MuhasebeReferansModelCopyWithImpl(_$_MuhasebeReferansModel _value,
      $Res Function(_$_MuhasebeReferansModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? kodu = freezed,
    Object? tanimi = freezed,
  }) {
    return _then(_$_MuhasebeReferansModel(
      kodu: freezed == kodu
          ? _value.kodu
          : kodu // ignore: cast_nullable_to_non_nullable
              as String?,
      tanimi: freezed == tanimi
          ? _value.tanimi
          : tanimi // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_MuhasebeReferansModel extends _MuhasebeReferansModel {
  _$_MuhasebeReferansModel({this.kodu, this.tanimi}) : super._();

  factory _$_MuhasebeReferansModel.fromJson(Map<String, dynamic> json) =>
      _$$_MuhasebeReferansModelFromJson(json);

  @override
  String? kodu;
  @override
  String? tanimi;

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MuhasebeReferansModelCopyWith<_$_MuhasebeReferansModel> get copyWith =>
      __$$_MuhasebeReferansModelCopyWithImpl<_$_MuhasebeReferansModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MuhasebeReferansModelToJson(
      this,
    );
  }
}

abstract class _MuhasebeReferansModel extends MuhasebeReferansModel {
  factory _MuhasebeReferansModel({String? kodu, String? tanimi}) =
      _$_MuhasebeReferansModel;
  _MuhasebeReferansModel._() : super._();

  factory _MuhasebeReferansModel.fromJson(Map<String, dynamic> json) =
      _$_MuhasebeReferansModel.fromJson;

  @override
  String? get kodu;
  set kodu(String? value);
  @override
  String? get tanimi;
  set tanimi(String? value);
  @override
  @JsonKey(ignore: true)
  _$$_MuhasebeReferansModelCopyWith<_$_MuhasebeReferansModel> get copyWith =>
      throw _privateConstructorUsedError;
}
