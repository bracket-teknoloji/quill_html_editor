// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ortalama_vade_tarihi_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

OrtalamaVadeTarihiModel _$OrtalamaVadeTarihiModelFromJson(
    Map<String, dynamic> json) {
  return _OrtalamaVadeTarihiModel.fromJson(json);
}

/// @nodoc
mixin _$OrtalamaVadeTarihiModel {
  DateTime? get vadeTarihi => throw _privateConstructorUsedError;
  set vadeTarihi(DateTime? value) => throw _privateConstructorUsedError;
  double? get tutar => throw _privateConstructorUsedError;
  set tutar(double? value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OrtalamaVadeTarihiModelCopyWith<OrtalamaVadeTarihiModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrtalamaVadeTarihiModelCopyWith<$Res> {
  factory $OrtalamaVadeTarihiModelCopyWith(OrtalamaVadeTarihiModel value,
          $Res Function(OrtalamaVadeTarihiModel) then) =
      _$OrtalamaVadeTarihiModelCopyWithImpl<$Res, OrtalamaVadeTarihiModel>;
  @useResult
  $Res call({DateTime? vadeTarihi, double? tutar});
}

/// @nodoc
class _$OrtalamaVadeTarihiModelCopyWithImpl<$Res,
        $Val extends OrtalamaVadeTarihiModel>
    implements $OrtalamaVadeTarihiModelCopyWith<$Res> {
  _$OrtalamaVadeTarihiModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? vadeTarihi = freezed,
    Object? tutar = freezed,
  }) {
    return _then(_value.copyWith(
      vadeTarihi: freezed == vadeTarihi
          ? _value.vadeTarihi
          : vadeTarihi // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      tutar: freezed == tutar
          ? _value.tutar
          : tutar // ignore: cast_nullable_to_non_nullable
              as double?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OrtalamaVadeTarihiModelImplCopyWith<$Res>
    implements $OrtalamaVadeTarihiModelCopyWith<$Res> {
  factory _$$OrtalamaVadeTarihiModelImplCopyWith(
          _$OrtalamaVadeTarihiModelImpl value,
          $Res Function(_$OrtalamaVadeTarihiModelImpl) then) =
      __$$OrtalamaVadeTarihiModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({DateTime? vadeTarihi, double? tutar});
}

/// @nodoc
class __$$OrtalamaVadeTarihiModelImplCopyWithImpl<$Res>
    extends _$OrtalamaVadeTarihiModelCopyWithImpl<$Res,
        _$OrtalamaVadeTarihiModelImpl>
    implements _$$OrtalamaVadeTarihiModelImplCopyWith<$Res> {
  __$$OrtalamaVadeTarihiModelImplCopyWithImpl(
      _$OrtalamaVadeTarihiModelImpl _value,
      $Res Function(_$OrtalamaVadeTarihiModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? vadeTarihi = freezed,
    Object? tutar = freezed,
  }) {
    return _then(_$OrtalamaVadeTarihiModelImpl(
      vadeTarihi: freezed == vadeTarihi
          ? _value.vadeTarihi
          : vadeTarihi // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      tutar: freezed == tutar
          ? _value.tutar
          : tutar // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$OrtalamaVadeTarihiModelImpl implements _OrtalamaVadeTarihiModel {
  _$OrtalamaVadeTarihiModelImpl({this.vadeTarihi, this.tutar});

  factory _$OrtalamaVadeTarihiModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$OrtalamaVadeTarihiModelImplFromJson(json);

  @override
  DateTime? vadeTarihi;
  @override
  double? tutar;

  @override
  String toString() {
    return 'OrtalamaVadeTarihiModel(vadeTarihi: $vadeTarihi, tutar: $tutar)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OrtalamaVadeTarihiModelImplCopyWith<_$OrtalamaVadeTarihiModelImpl>
      get copyWith => __$$OrtalamaVadeTarihiModelImplCopyWithImpl<
          _$OrtalamaVadeTarihiModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OrtalamaVadeTarihiModelImplToJson(
      this,
    );
  }
}

abstract class _OrtalamaVadeTarihiModel implements OrtalamaVadeTarihiModel {
  factory _OrtalamaVadeTarihiModel({DateTime? vadeTarihi, double? tutar}) =
      _$OrtalamaVadeTarihiModelImpl;

  factory _OrtalamaVadeTarihiModel.fromJson(Map<String, dynamic> json) =
      _$OrtalamaVadeTarihiModelImpl.fromJson;

  @override
  DateTime? get vadeTarihi;
  set vadeTarihi(DateTime? value);
  @override
  double? get tutar;
  set tutar(double? value);
  @override
  @JsonKey(ignore: true)
  _$$OrtalamaVadeTarihiModelImplCopyWith<_$OrtalamaVadeTarihiModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
