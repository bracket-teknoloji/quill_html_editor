// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'olcum_pdf_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

OlcumPdfModel _$OlcumPdfModelFromJson(Map<String, dynamic> json) {
  return _OlcumPdfModel.fromJson(json);
}

/// @nodoc
mixin _$OlcumPdfModel {
  String? get stokKodu => throw _privateConstructorUsedError;
  String? get yapkod => throw _privateConstructorUsedError;
  String? get revno => throw _privateConstructorUsedError;
  DateTime? get revtar => throw _privateConstructorUsedError;
  String? get tur => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OlcumPdfModelCopyWith<OlcumPdfModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OlcumPdfModelCopyWith<$Res> {
  factory $OlcumPdfModelCopyWith(
          OlcumPdfModel value, $Res Function(OlcumPdfModel) then) =
      _$OlcumPdfModelCopyWithImpl<$Res, OlcumPdfModel>;
  @useResult
  $Res call(
      {String? stokKodu,
      String? yapkod,
      String? revno,
      DateTime? revtar,
      String? tur});
}

/// @nodoc
class _$OlcumPdfModelCopyWithImpl<$Res, $Val extends OlcumPdfModel>
    implements $OlcumPdfModelCopyWith<$Res> {
  _$OlcumPdfModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? stokKodu = freezed,
    Object? yapkod = freezed,
    Object? revno = freezed,
    Object? revtar = freezed,
    Object? tur = freezed,
  }) {
    return _then(_value.copyWith(
      stokKodu: freezed == stokKodu
          ? _value.stokKodu
          : stokKodu // ignore: cast_nullable_to_non_nullable
              as String?,
      yapkod: freezed == yapkod
          ? _value.yapkod
          : yapkod // ignore: cast_nullable_to_non_nullable
              as String?,
      revno: freezed == revno
          ? _value.revno
          : revno // ignore: cast_nullable_to_non_nullable
              as String?,
      revtar: freezed == revtar
          ? _value.revtar
          : revtar // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      tur: freezed == tur
          ? _value.tur
          : tur // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OlcumPdfModelImplCopyWith<$Res>
    implements $OlcumPdfModelCopyWith<$Res> {
  factory _$$OlcumPdfModelImplCopyWith(
          _$OlcumPdfModelImpl value, $Res Function(_$OlcumPdfModelImpl) then) =
      __$$OlcumPdfModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? stokKodu,
      String? yapkod,
      String? revno,
      DateTime? revtar,
      String? tur});
}

/// @nodoc
class __$$OlcumPdfModelImplCopyWithImpl<$Res>
    extends _$OlcumPdfModelCopyWithImpl<$Res, _$OlcumPdfModelImpl>
    implements _$$OlcumPdfModelImplCopyWith<$Res> {
  __$$OlcumPdfModelImplCopyWithImpl(
      _$OlcumPdfModelImpl _value, $Res Function(_$OlcumPdfModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? stokKodu = freezed,
    Object? yapkod = freezed,
    Object? revno = freezed,
    Object? revtar = freezed,
    Object? tur = freezed,
  }) {
    return _then(_$OlcumPdfModelImpl(
      stokKodu: freezed == stokKodu
          ? _value.stokKodu
          : stokKodu // ignore: cast_nullable_to_non_nullable
              as String?,
      yapkod: freezed == yapkod
          ? _value.yapkod
          : yapkod // ignore: cast_nullable_to_non_nullable
              as String?,
      revno: freezed == revno
          ? _value.revno
          : revno // ignore: cast_nullable_to_non_nullable
              as String?,
      revtar: freezed == revtar
          ? _value.revtar
          : revtar // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      tur: freezed == tur
          ? _value.tur
          : tur // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$OlcumPdfModelImpl extends _OlcumPdfModel {
  _$OlcumPdfModelImpl(
      {this.stokKodu, this.yapkod, this.revno, this.revtar, this.tur})
      : super._();

  factory _$OlcumPdfModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$OlcumPdfModelImplFromJson(json);

  @override
  final String? stokKodu;
  @override
  final String? yapkod;
  @override
  final String? revno;
  @override
  final DateTime? revtar;
  @override
  final String? tur;

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OlcumPdfModelImplCopyWith<_$OlcumPdfModelImpl> get copyWith =>
      __$$OlcumPdfModelImplCopyWithImpl<_$OlcumPdfModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OlcumPdfModelImplToJson(
      this,
    );
  }
}

abstract class _OlcumPdfModel extends OlcumPdfModel {
  factory _OlcumPdfModel(
      {final String? stokKodu,
      final String? yapkod,
      final String? revno,
      final DateTime? revtar,
      final String? tur}) = _$OlcumPdfModelImpl;
  _OlcumPdfModel._() : super._();

  factory _OlcumPdfModel.fromJson(Map<String, dynamic> json) =
      _$OlcumPdfModelImpl.fromJson;

  @override
  String? get stokKodu;
  @override
  String? get yapkod;
  @override
  String? get revno;
  @override
  DateTime? get revtar;
  @override
  String? get tur;
  @override
  @JsonKey(ignore: true)
  _$$OlcumPdfModelImplCopyWith<_$OlcumPdfModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
