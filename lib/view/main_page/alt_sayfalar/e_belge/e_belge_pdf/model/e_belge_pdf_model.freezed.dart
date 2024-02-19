// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'e_belge_pdf_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

EBelgePdfModel _$EBelgePdfModelFromJson(Map<String, dynamic> json) {
  return _EBelgePdfModel.fromJson(json);
}

/// @nodoc
mixin _$EBelgePdfModel {
  int? get islemKodu => throw _privateConstructorUsedError;
  set islemKodu(int? value) => throw _privateConstructorUsedError;
  @JsonKey(name: "FileModel")
  FileModel? get fileModel => throw _privateConstructorUsedError;
  @JsonKey(name: "FileModel")
  set fileModel(FileModel? value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EBelgePdfModelCopyWith<EBelgePdfModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EBelgePdfModelCopyWith<$Res> {
  factory $EBelgePdfModelCopyWith(
          EBelgePdfModel value, $Res Function(EBelgePdfModel) then) =
      _$EBelgePdfModelCopyWithImpl<$Res, EBelgePdfModel>;
  @useResult
  $Res call({int? islemKodu, @JsonKey(name: "FileModel") FileModel? fileModel});

  $FileModelCopyWith<$Res>? get fileModel;
}

/// @nodoc
class _$EBelgePdfModelCopyWithImpl<$Res, $Val extends EBelgePdfModel>
    implements $EBelgePdfModelCopyWith<$Res> {
  _$EBelgePdfModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? islemKodu = freezed,
    Object? fileModel = freezed,
  }) {
    return _then(_value.copyWith(
      islemKodu: freezed == islemKodu
          ? _value.islemKodu
          : islemKodu // ignore: cast_nullable_to_non_nullable
              as int?,
      fileModel: freezed == fileModel
          ? _value.fileModel
          : fileModel // ignore: cast_nullable_to_non_nullable
              as FileModel?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $FileModelCopyWith<$Res>? get fileModel {
    if (_value.fileModel == null) {
      return null;
    }

    return $FileModelCopyWith<$Res>(_value.fileModel!, (value) {
      return _then(_value.copyWith(fileModel: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$EBelgePdfModelImplCopyWith<$Res>
    implements $EBelgePdfModelCopyWith<$Res> {
  factory _$$EBelgePdfModelImplCopyWith(_$EBelgePdfModelImpl value,
          $Res Function(_$EBelgePdfModelImpl) then) =
      __$$EBelgePdfModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? islemKodu, @JsonKey(name: "FileModel") FileModel? fileModel});

  @override
  $FileModelCopyWith<$Res>? get fileModel;
}

/// @nodoc
class __$$EBelgePdfModelImplCopyWithImpl<$Res>
    extends _$EBelgePdfModelCopyWithImpl<$Res, _$EBelgePdfModelImpl>
    implements _$$EBelgePdfModelImplCopyWith<$Res> {
  __$$EBelgePdfModelImplCopyWithImpl(
      _$EBelgePdfModelImpl _value, $Res Function(_$EBelgePdfModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? islemKodu = freezed,
    Object? fileModel = freezed,
  }) {
    return _then(_$EBelgePdfModelImpl(
      islemKodu: freezed == islemKodu
          ? _value.islemKodu
          : islemKodu // ignore: cast_nullable_to_non_nullable
              as int?,
      fileModel: freezed == fileModel
          ? _value.fileModel
          : fileModel // ignore: cast_nullable_to_non_nullable
              as FileModel?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$EBelgePdfModelImpl extends _EBelgePdfModel {
  _$EBelgePdfModelImpl(
      {this.islemKodu, @JsonKey(name: "FileModel") this.fileModel})
      : super._();

  factory _$EBelgePdfModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$EBelgePdfModelImplFromJson(json);

  @override
  int? islemKodu;
  @override
  @JsonKey(name: "FileModel")
  FileModel? fileModel;

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EBelgePdfModelImplCopyWith<_$EBelgePdfModelImpl> get copyWith =>
      __$$EBelgePdfModelImplCopyWithImpl<_$EBelgePdfModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EBelgePdfModelImplToJson(
      this,
    );
  }
}

abstract class _EBelgePdfModel extends EBelgePdfModel {
  factory _EBelgePdfModel(
      {int? islemKodu,
      @JsonKey(name: "FileModel") FileModel? fileModel}) = _$EBelgePdfModelImpl;
  _EBelgePdfModel._() : super._();

  factory _EBelgePdfModel.fromJson(Map<String, dynamic> json) =
      _$EBelgePdfModelImpl.fromJson;

  @override
  int? get islemKodu;
  set islemKodu(int? value);
  @override
  @JsonKey(name: "FileModel")
  FileModel? get fileModel;
  @JsonKey(name: "FileModel")
  set fileModel(FileModel? value);
  @override
  @JsonKey(ignore: true)
  _$$EBelgePdfModelImplCopyWith<_$EBelgePdfModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

FileModel _$FileModelFromJson(Map<String, dynamic> json) {
  return _FileModel.fromJson(json);
}

/// @nodoc
mixin _$FileModel {
  String? get byteData => throw _privateConstructorUsedError;
  String? get uzanti => throw _privateConstructorUsedError;
  DateTime? get dosyaTarihi => throw _privateConstructorUsedError;
  String? get dosyaAdi => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FileModelCopyWith<FileModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FileModelCopyWith<$Res> {
  factory $FileModelCopyWith(FileModel value, $Res Function(FileModel) then) =
      _$FileModelCopyWithImpl<$Res, FileModel>;
  @useResult
  $Res call(
      {String? byteData,
      String? uzanti,
      DateTime? dosyaTarihi,
      String? dosyaAdi});
}

/// @nodoc
class _$FileModelCopyWithImpl<$Res, $Val extends FileModel>
    implements $FileModelCopyWith<$Res> {
  _$FileModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? byteData = freezed,
    Object? uzanti = freezed,
    Object? dosyaTarihi = freezed,
    Object? dosyaAdi = freezed,
  }) {
    return _then(_value.copyWith(
      byteData: freezed == byteData
          ? _value.byteData
          : byteData // ignore: cast_nullable_to_non_nullable
              as String?,
      uzanti: freezed == uzanti
          ? _value.uzanti
          : uzanti // ignore: cast_nullable_to_non_nullable
              as String?,
      dosyaTarihi: freezed == dosyaTarihi
          ? _value.dosyaTarihi
          : dosyaTarihi // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      dosyaAdi: freezed == dosyaAdi
          ? _value.dosyaAdi
          : dosyaAdi // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FileModelImplCopyWith<$Res>
    implements $FileModelCopyWith<$Res> {
  factory _$$FileModelImplCopyWith(
          _$FileModelImpl value, $Res Function(_$FileModelImpl) then) =
      __$$FileModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? byteData,
      String? uzanti,
      DateTime? dosyaTarihi,
      String? dosyaAdi});
}

/// @nodoc
class __$$FileModelImplCopyWithImpl<$Res>
    extends _$FileModelCopyWithImpl<$Res, _$FileModelImpl>
    implements _$$FileModelImplCopyWith<$Res> {
  __$$FileModelImplCopyWithImpl(
      _$FileModelImpl _value, $Res Function(_$FileModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? byteData = freezed,
    Object? uzanti = freezed,
    Object? dosyaTarihi = freezed,
    Object? dosyaAdi = freezed,
  }) {
    return _then(_$FileModelImpl(
      byteData: freezed == byteData
          ? _value.byteData
          : byteData // ignore: cast_nullable_to_non_nullable
              as String?,
      uzanti: freezed == uzanti
          ? _value.uzanti
          : uzanti // ignore: cast_nullable_to_non_nullable
              as String?,
      dosyaTarihi: freezed == dosyaTarihi
          ? _value.dosyaTarihi
          : dosyaTarihi // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      dosyaAdi: freezed == dosyaAdi
          ? _value.dosyaAdi
          : dosyaAdi // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FileModelImpl implements _FileModel {
  const _$FileModelImpl(
      {this.byteData, this.uzanti, this.dosyaTarihi, this.dosyaAdi});

  factory _$FileModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$FileModelImplFromJson(json);

  @override
  final String? byteData;
  @override
  final String? uzanti;
  @override
  final DateTime? dosyaTarihi;
  @override
  final String? dosyaAdi;

  @override
  String toString() {
    return 'FileModel(byteData: $byteData, uzanti: $uzanti, dosyaTarihi: $dosyaTarihi, dosyaAdi: $dosyaAdi)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FileModelImpl &&
            (identical(other.byteData, byteData) ||
                other.byteData == byteData) &&
            (identical(other.uzanti, uzanti) || other.uzanti == uzanti) &&
            (identical(other.dosyaTarihi, dosyaTarihi) ||
                other.dosyaTarihi == dosyaTarihi) &&
            (identical(other.dosyaAdi, dosyaAdi) ||
                other.dosyaAdi == dosyaAdi));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, byteData, uzanti, dosyaTarihi, dosyaAdi);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FileModelImplCopyWith<_$FileModelImpl> get copyWith =>
      __$$FileModelImplCopyWithImpl<_$FileModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FileModelImplToJson(
      this,
    );
  }
}

abstract class _FileModel implements FileModel {
  const factory _FileModel(
      {final String? byteData,
      final String? uzanti,
      final DateTime? dosyaTarihi,
      final String? dosyaAdi}) = _$FileModelImpl;

  factory _FileModel.fromJson(Map<String, dynamic> json) =
      _$FileModelImpl.fromJson;

  @override
  String? get byteData;
  @override
  String? get uzanti;
  @override
  DateTime? get dosyaTarihi;
  @override
  String? get dosyaAdi;
  @override
  @JsonKey(ignore: true)
  _$$FileModelImplCopyWith<_$FileModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
