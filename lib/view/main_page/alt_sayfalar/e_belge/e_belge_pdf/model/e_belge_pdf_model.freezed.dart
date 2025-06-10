// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'e_belge_pdf_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$EBelgePdfModel {

 int? get islemKodu; set islemKodu(int? value);@JsonKey(name: "FileModel") FileModel? get fileModel;@JsonKey(name: "FileModel") set fileModel(FileModel? value);
/// Create a copy of EBelgePdfModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EBelgePdfModelCopyWith<EBelgePdfModel> get copyWith => _$EBelgePdfModelCopyWithImpl<EBelgePdfModel>(this as EBelgePdfModel, _$identity);

  /// Serializes this EBelgePdfModel to a JSON map.
  Map<String, dynamic> toJson();






}

/// @nodoc
abstract mixin class $EBelgePdfModelCopyWith<$Res>  {
  factory $EBelgePdfModelCopyWith(EBelgePdfModel value, $Res Function(EBelgePdfModel) _then) = _$EBelgePdfModelCopyWithImpl;
@useResult
$Res call({
 int? islemKodu,@JsonKey(name: "FileModel") FileModel? fileModel
});


$FileModelCopyWith<$Res>? get fileModel;

}
/// @nodoc
class _$EBelgePdfModelCopyWithImpl<$Res>
    implements $EBelgePdfModelCopyWith<$Res> {
  _$EBelgePdfModelCopyWithImpl(this._self, this._then);

  final EBelgePdfModel _self;
  final $Res Function(EBelgePdfModel) _then;

/// Create a copy of EBelgePdfModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? islemKodu = freezed,Object? fileModel = freezed,}) {
  return _then(_self.copyWith(
islemKodu: freezed == islemKodu ? _self.islemKodu : islemKodu // ignore: cast_nullable_to_non_nullable
as int?,fileModel: freezed == fileModel ? _self.fileModel : fileModel // ignore: cast_nullable_to_non_nullable
as FileModel?,
  ));
}
/// Create a copy of EBelgePdfModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FileModelCopyWith<$Res>? get fileModel {
    if (_self.fileModel == null) {
    return null;
  }

  return $FileModelCopyWith<$Res>(_self.fileModel!, (value) {
    return _then(_self.copyWith(fileModel: value));
  });
}
}


/// @nodoc
@JsonSerializable()

class _EBelgePdfModel extends EBelgePdfModel {
   _EBelgePdfModel({this.islemKodu, @JsonKey(name: "FileModel") this.fileModel}): super._();
  factory _EBelgePdfModel.fromJson(Map<String, dynamic> json) => _$EBelgePdfModelFromJson(json);

@override  int? islemKodu;
@override@JsonKey(name: "FileModel")  FileModel? fileModel;

/// Create a copy of EBelgePdfModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EBelgePdfModelCopyWith<_EBelgePdfModel> get copyWith => __$EBelgePdfModelCopyWithImpl<_EBelgePdfModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$EBelgePdfModelToJson(this, );
}





}

/// @nodoc
abstract mixin class _$EBelgePdfModelCopyWith<$Res> implements $EBelgePdfModelCopyWith<$Res> {
  factory _$EBelgePdfModelCopyWith(_EBelgePdfModel value, $Res Function(_EBelgePdfModel) _then) = __$EBelgePdfModelCopyWithImpl;
@override @useResult
$Res call({
 int? islemKodu,@JsonKey(name: "FileModel") FileModel? fileModel
});


@override $FileModelCopyWith<$Res>? get fileModel;

}
/// @nodoc
class __$EBelgePdfModelCopyWithImpl<$Res>
    implements _$EBelgePdfModelCopyWith<$Res> {
  __$EBelgePdfModelCopyWithImpl(this._self, this._then);

  final _EBelgePdfModel _self;
  final $Res Function(_EBelgePdfModel) _then;

/// Create a copy of EBelgePdfModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? islemKodu = freezed,Object? fileModel = freezed,}) {
  return _then(_EBelgePdfModel(
islemKodu: freezed == islemKodu ? _self.islemKodu : islemKodu // ignore: cast_nullable_to_non_nullable
as int?,fileModel: freezed == fileModel ? _self.fileModel : fileModel // ignore: cast_nullable_to_non_nullable
as FileModel?,
  ));
}

/// Create a copy of EBelgePdfModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FileModelCopyWith<$Res>? get fileModel {
    if (_self.fileModel == null) {
    return null;
  }

  return $FileModelCopyWith<$Res>(_self.fileModel!, (value) {
    return _then(_self.copyWith(fileModel: value));
  });
}
}


/// @nodoc
mixin _$FileModel {

 String? get byteData; String? get uzanti; DateTime? get dosyaTarihi; String? get dosyaAdi;
/// Create a copy of FileModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FileModelCopyWith<FileModel> get copyWith => _$FileModelCopyWithImpl<FileModel>(this as FileModel, _$identity);

  /// Serializes this FileModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FileModel&&(identical(other.byteData, byteData) || other.byteData == byteData)&&(identical(other.uzanti, uzanti) || other.uzanti == uzanti)&&(identical(other.dosyaTarihi, dosyaTarihi) || other.dosyaTarihi == dosyaTarihi)&&(identical(other.dosyaAdi, dosyaAdi) || other.dosyaAdi == dosyaAdi));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,byteData,uzanti,dosyaTarihi,dosyaAdi);



}

/// @nodoc
abstract mixin class $FileModelCopyWith<$Res>  {
  factory $FileModelCopyWith(FileModel value, $Res Function(FileModel) _then) = _$FileModelCopyWithImpl;
@useResult
$Res call({
 String? byteData, String? uzanti, DateTime? dosyaTarihi, String? dosyaAdi
});




}
/// @nodoc
class _$FileModelCopyWithImpl<$Res>
    implements $FileModelCopyWith<$Res> {
  _$FileModelCopyWithImpl(this._self, this._then);

  final FileModel _self;
  final $Res Function(FileModel) _then;

/// Create a copy of FileModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? byteData = freezed,Object? uzanti = freezed,Object? dosyaTarihi = freezed,Object? dosyaAdi = freezed,}) {
  return _then(_self.copyWith(
byteData: freezed == byteData ? _self.byteData : byteData // ignore: cast_nullable_to_non_nullable
as String?,uzanti: freezed == uzanti ? _self.uzanti : uzanti // ignore: cast_nullable_to_non_nullable
as String?,dosyaTarihi: freezed == dosyaTarihi ? _self.dosyaTarihi : dosyaTarihi // ignore: cast_nullable_to_non_nullable
as DateTime?,dosyaAdi: freezed == dosyaAdi ? _self.dosyaAdi : dosyaAdi // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _FileModel implements FileModel {
  const _FileModel({this.byteData, this.uzanti, this.dosyaTarihi, this.dosyaAdi});
  factory _FileModel.fromJson(Map<String, dynamic> json) => _$FileModelFromJson(json);

@override final  String? byteData;
@override final  String? uzanti;
@override final  DateTime? dosyaTarihi;
@override final  String? dosyaAdi;

/// Create a copy of FileModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FileModelCopyWith<_FileModel> get copyWith => __$FileModelCopyWithImpl<_FileModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FileModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FileModel&&(identical(other.byteData, byteData) || other.byteData == byteData)&&(identical(other.uzanti, uzanti) || other.uzanti == uzanti)&&(identical(other.dosyaTarihi, dosyaTarihi) || other.dosyaTarihi == dosyaTarihi)&&(identical(other.dosyaAdi, dosyaAdi) || other.dosyaAdi == dosyaAdi));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,byteData,uzanti,dosyaTarihi,dosyaAdi);



}

/// @nodoc
abstract mixin class _$FileModelCopyWith<$Res> implements $FileModelCopyWith<$Res> {
  factory _$FileModelCopyWith(_FileModel value, $Res Function(_FileModel) _then) = __$FileModelCopyWithImpl;
@override @useResult
$Res call({
 String? byteData, String? uzanti, DateTime? dosyaTarihi, String? dosyaAdi
});




}
/// @nodoc
class __$FileModelCopyWithImpl<$Res>
    implements _$FileModelCopyWith<$Res> {
  __$FileModelCopyWithImpl(this._self, this._then);

  final _FileModel _self;
  final $Res Function(_FileModel) _then;

/// Create a copy of FileModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? byteData = freezed,Object? uzanti = freezed,Object? dosyaTarihi = freezed,Object? dosyaAdi = freezed,}) {
  return _then(_FileModel(
byteData: freezed == byteData ? _self.byteData : byteData // ignore: cast_nullable_to_non_nullable
as String?,uzanti: freezed == uzanti ? _self.uzanti : uzanti // ignore: cast_nullable_to_non_nullable
as String?,dosyaTarihi: freezed == dosyaTarihi ? _self.dosyaTarihi : dosyaTarihi // ignore: cast_nullable_to_non_nullable
as DateTime?,dosyaAdi: freezed == dosyaAdi ? _self.dosyaAdi : dosyaAdi // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
