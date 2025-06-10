// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'print_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PrintModel {

 String get raporOzelKod; int? get dizaynId; int? get etiketSayisi; bool? get yazdir; String? get yaziciAdi; String? get yaziciTipi; DicParams? get dicParams; bool? get standart; String? get exportTipi;
/// Create a copy of PrintModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PrintModelCopyWith<PrintModel> get copyWith => _$PrintModelCopyWithImpl<PrintModel>(this as PrintModel, _$identity);

  /// Serializes this PrintModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PrintModel&&super == other&&(identical(other.raporOzelKod, raporOzelKod) || other.raporOzelKod == raporOzelKod)&&(identical(other.dizaynId, dizaynId) || other.dizaynId == dizaynId)&&(identical(other.etiketSayisi, etiketSayisi) || other.etiketSayisi == etiketSayisi)&&(identical(other.yazdir, yazdir) || other.yazdir == yazdir)&&(identical(other.yaziciAdi, yaziciAdi) || other.yaziciAdi == yaziciAdi)&&(identical(other.yaziciTipi, yaziciTipi) || other.yaziciTipi == yaziciTipi)&&(identical(other.dicParams, dicParams) || other.dicParams == dicParams)&&(identical(other.standart, standart) || other.standart == standart)&&(identical(other.exportTipi, exportTipi) || other.exportTipi == exportTipi));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,raporOzelKod,dizaynId,etiketSayisi,yazdir,yaziciAdi,yaziciTipi,dicParams,standart,exportTipi);



}

/// @nodoc
abstract mixin class $PrintModelCopyWith<$Res>  {
  factory $PrintModelCopyWith(PrintModel value, $Res Function(PrintModel) _then) = _$PrintModelCopyWithImpl;
@useResult
$Res call({
 String raporOzelKod, int? dizaynId, int? etiketSayisi, bool? yazdir, String? yaziciAdi, String? yaziciTipi, DicParams? dicParams, bool? standart, String? exportTipi
});


$DicParamsCopyWith<$Res>? get dicParams;

}
/// @nodoc
class _$PrintModelCopyWithImpl<$Res>
    implements $PrintModelCopyWith<$Res> {
  _$PrintModelCopyWithImpl(this._self, this._then);

  final PrintModel _self;
  final $Res Function(PrintModel) _then;

/// Create a copy of PrintModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? raporOzelKod = null,Object? dizaynId = freezed,Object? etiketSayisi = freezed,Object? yazdir = freezed,Object? yaziciAdi = freezed,Object? yaziciTipi = freezed,Object? dicParams = freezed,Object? standart = freezed,Object? exportTipi = freezed,}) {
  return _then(_self.copyWith(
raporOzelKod: null == raporOzelKod ? _self.raporOzelKod : raporOzelKod // ignore: cast_nullable_to_non_nullable
as String,dizaynId: freezed == dizaynId ? _self.dizaynId : dizaynId // ignore: cast_nullable_to_non_nullable
as int?,etiketSayisi: freezed == etiketSayisi ? _self.etiketSayisi : etiketSayisi // ignore: cast_nullable_to_non_nullable
as int?,yazdir: freezed == yazdir ? _self.yazdir : yazdir // ignore: cast_nullable_to_non_nullable
as bool?,yaziciAdi: freezed == yaziciAdi ? _self.yaziciAdi : yaziciAdi // ignore: cast_nullable_to_non_nullable
as String?,yaziciTipi: freezed == yaziciTipi ? _self.yaziciTipi : yaziciTipi // ignore: cast_nullable_to_non_nullable
as String?,dicParams: freezed == dicParams ? _self.dicParams : dicParams // ignore: cast_nullable_to_non_nullable
as DicParams?,standart: freezed == standart ? _self.standart : standart // ignore: cast_nullable_to_non_nullable
as bool?,exportTipi: freezed == exportTipi ? _self.exportTipi : exportTipi // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of PrintModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DicParamsCopyWith<$Res>? get dicParams {
    if (_self.dicParams == null) {
    return null;
  }

  return $DicParamsCopyWith<$Res>(_self.dicParams!, (value) {
    return _then(_self.copyWith(dicParams: value));
  });
}
}


/// @nodoc
@JsonSerializable()

class _PrintModel extends PrintModel {
   _PrintModel({required this.raporOzelKod, this.dizaynId, this.etiketSayisi, this.yazdir = true, this.yaziciAdi, this.yaziciTipi, this.dicParams, this.standart, this.exportTipi}): super._();
  factory _PrintModel.fromJson(Map<String, dynamic> json) => _$PrintModelFromJson(json);

@override final  String raporOzelKod;
@override final  int? dizaynId;
@override final  int? etiketSayisi;
@override@JsonKey() final  bool? yazdir;
@override final  String? yaziciAdi;
@override final  String? yaziciTipi;
@override final  DicParams? dicParams;
@override final  bool? standart;
@override final  String? exportTipi;

/// Create a copy of PrintModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PrintModelCopyWith<_PrintModel> get copyWith => __$PrintModelCopyWithImpl<_PrintModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PrintModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PrintModel&&super == other&&(identical(other.raporOzelKod, raporOzelKod) || other.raporOzelKod == raporOzelKod)&&(identical(other.dizaynId, dizaynId) || other.dizaynId == dizaynId)&&(identical(other.etiketSayisi, etiketSayisi) || other.etiketSayisi == etiketSayisi)&&(identical(other.yazdir, yazdir) || other.yazdir == yazdir)&&(identical(other.yaziciAdi, yaziciAdi) || other.yaziciAdi == yaziciAdi)&&(identical(other.yaziciTipi, yaziciTipi) || other.yaziciTipi == yaziciTipi)&&(identical(other.dicParams, dicParams) || other.dicParams == dicParams)&&(identical(other.standart, standart) || other.standart == standart)&&(identical(other.exportTipi, exportTipi) || other.exportTipi == exportTipi));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,raporOzelKod,dizaynId,etiketSayisi,yazdir,yaziciAdi,yaziciTipi,dicParams,standart,exportTipi);



}

/// @nodoc
abstract mixin class _$PrintModelCopyWith<$Res> implements $PrintModelCopyWith<$Res> {
  factory _$PrintModelCopyWith(_PrintModel value, $Res Function(_PrintModel) _then) = __$PrintModelCopyWithImpl;
@override @useResult
$Res call({
 String raporOzelKod, int? dizaynId, int? etiketSayisi, bool? yazdir, String? yaziciAdi, String? yaziciTipi, DicParams? dicParams, bool? standart, String? exportTipi
});


@override $DicParamsCopyWith<$Res>? get dicParams;

}
/// @nodoc
class __$PrintModelCopyWithImpl<$Res>
    implements _$PrintModelCopyWith<$Res> {
  __$PrintModelCopyWithImpl(this._self, this._then);

  final _PrintModel _self;
  final $Res Function(_PrintModel) _then;

/// Create a copy of PrintModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? raporOzelKod = null,Object? dizaynId = freezed,Object? etiketSayisi = freezed,Object? yazdir = freezed,Object? yaziciAdi = freezed,Object? yaziciTipi = freezed,Object? dicParams = freezed,Object? standart = freezed,Object? exportTipi = freezed,}) {
  return _then(_PrintModel(
raporOzelKod: null == raporOzelKod ? _self.raporOzelKod : raporOzelKod // ignore: cast_nullable_to_non_nullable
as String,dizaynId: freezed == dizaynId ? _self.dizaynId : dizaynId // ignore: cast_nullable_to_non_nullable
as int?,etiketSayisi: freezed == etiketSayisi ? _self.etiketSayisi : etiketSayisi // ignore: cast_nullable_to_non_nullable
as int?,yazdir: freezed == yazdir ? _self.yazdir : yazdir // ignore: cast_nullable_to_non_nullable
as bool?,yaziciAdi: freezed == yaziciAdi ? _self.yaziciAdi : yaziciAdi // ignore: cast_nullable_to_non_nullable
as String?,yaziciTipi: freezed == yaziciTipi ? _self.yaziciTipi : yaziciTipi // ignore: cast_nullable_to_non_nullable
as String?,dicParams: freezed == dicParams ? _self.dicParams : dicParams // ignore: cast_nullable_to_non_nullable
as DicParams?,standart: freezed == standart ? _self.standart : standart // ignore: cast_nullable_to_non_nullable
as bool?,exportTipi: freezed == exportTipi ? _self.exportTipi : exportTipi // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of PrintModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DicParamsCopyWith<$Res>? get dicParams {
    if (_self.dicParams == null) {
    return null;
  }

  return $DicParamsCopyWith<$Res>(_self.dicParams!, (value) {
    return _then(_self.copyWith(dicParams: value));
  });
}
}

// dart format on
