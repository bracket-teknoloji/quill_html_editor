// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'olcum_seri_request_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$OlcumSeriRequestModel {

 String? get stokKodu; int? get girisDepo; int? get cikisDepo; int? get redGirisDepo; int? get kabulGirisDepo; List<String>? get seriListe;
/// Create a copy of OlcumSeriRequestModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OlcumSeriRequestModelCopyWith<OlcumSeriRequestModel> get copyWith => _$OlcumSeriRequestModelCopyWithImpl<OlcumSeriRequestModel>(this as OlcumSeriRequestModel, _$identity);

  /// Serializes this OlcumSeriRequestModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OlcumSeriRequestModel&&(identical(other.stokKodu, stokKodu) || other.stokKodu == stokKodu)&&(identical(other.girisDepo, girisDepo) || other.girisDepo == girisDepo)&&(identical(other.cikisDepo, cikisDepo) || other.cikisDepo == cikisDepo)&&(identical(other.redGirisDepo, redGirisDepo) || other.redGirisDepo == redGirisDepo)&&(identical(other.kabulGirisDepo, kabulGirisDepo) || other.kabulGirisDepo == kabulGirisDepo)&&const DeepCollectionEquality().equals(other.seriListe, seriListe));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,stokKodu,girisDepo,cikisDepo,redGirisDepo,kabulGirisDepo,const DeepCollectionEquality().hash(seriListe));



}

/// @nodoc
abstract mixin class $OlcumSeriRequestModelCopyWith<$Res>  {
  factory $OlcumSeriRequestModelCopyWith(OlcumSeriRequestModel value, $Res Function(OlcumSeriRequestModel) _then) = _$OlcumSeriRequestModelCopyWithImpl;
@useResult
$Res call({
 String? stokKodu, int? girisDepo, int? cikisDepo, int? redGirisDepo, int? kabulGirisDepo, List<String>? seriListe
});




}
/// @nodoc
class _$OlcumSeriRequestModelCopyWithImpl<$Res>
    implements $OlcumSeriRequestModelCopyWith<$Res> {
  _$OlcumSeriRequestModelCopyWithImpl(this._self, this._then);

  final OlcumSeriRequestModel _self;
  final $Res Function(OlcumSeriRequestModel) _then;

/// Create a copy of OlcumSeriRequestModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? stokKodu = freezed,Object? girisDepo = freezed,Object? cikisDepo = freezed,Object? redGirisDepo = freezed,Object? kabulGirisDepo = freezed,Object? seriListe = freezed,}) {
  return _then(_self.copyWith(
stokKodu: freezed == stokKodu ? _self.stokKodu : stokKodu // ignore: cast_nullable_to_non_nullable
as String?,girisDepo: freezed == girisDepo ? _self.girisDepo : girisDepo // ignore: cast_nullable_to_non_nullable
as int?,cikisDepo: freezed == cikisDepo ? _self.cikisDepo : cikisDepo // ignore: cast_nullable_to_non_nullable
as int?,redGirisDepo: freezed == redGirisDepo ? _self.redGirisDepo : redGirisDepo // ignore: cast_nullable_to_non_nullable
as int?,kabulGirisDepo: freezed == kabulGirisDepo ? _self.kabulGirisDepo : kabulGirisDepo // ignore: cast_nullable_to_non_nullable
as int?,seriListe: freezed == seriListe ? _self.seriListe : seriListe // ignore: cast_nullable_to_non_nullable
as List<String>?,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _OlcumSeriRequestModel implements OlcumSeriRequestModel {
  const _OlcumSeriRequestModel({this.stokKodu, this.girisDepo, this.cikisDepo, this.redGirisDepo, this.kabulGirisDepo, final  List<String>? seriListe}): _seriListe = seriListe;
  factory _OlcumSeriRequestModel.fromJson(Map<String, dynamic> json) => _$OlcumSeriRequestModelFromJson(json);

@override final  String? stokKodu;
@override final  int? girisDepo;
@override final  int? cikisDepo;
@override final  int? redGirisDepo;
@override final  int? kabulGirisDepo;
 final  List<String>? _seriListe;
@override List<String>? get seriListe {
  final value = _seriListe;
  if (value == null) return null;
  if (_seriListe is EqualUnmodifiableListView) return _seriListe;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of OlcumSeriRequestModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OlcumSeriRequestModelCopyWith<_OlcumSeriRequestModel> get copyWith => __$OlcumSeriRequestModelCopyWithImpl<_OlcumSeriRequestModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$OlcumSeriRequestModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OlcumSeriRequestModel&&(identical(other.stokKodu, stokKodu) || other.stokKodu == stokKodu)&&(identical(other.girisDepo, girisDepo) || other.girisDepo == girisDepo)&&(identical(other.cikisDepo, cikisDepo) || other.cikisDepo == cikisDepo)&&(identical(other.redGirisDepo, redGirisDepo) || other.redGirisDepo == redGirisDepo)&&(identical(other.kabulGirisDepo, kabulGirisDepo) || other.kabulGirisDepo == kabulGirisDepo)&&const DeepCollectionEquality().equals(other._seriListe, _seriListe));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,stokKodu,girisDepo,cikisDepo,redGirisDepo,kabulGirisDepo,const DeepCollectionEquality().hash(_seriListe));



}

/// @nodoc
abstract mixin class _$OlcumSeriRequestModelCopyWith<$Res> implements $OlcumSeriRequestModelCopyWith<$Res> {
  factory _$OlcumSeriRequestModelCopyWith(_OlcumSeriRequestModel value, $Res Function(_OlcumSeriRequestModel) _then) = __$OlcumSeriRequestModelCopyWithImpl;
@override @useResult
$Res call({
 String? stokKodu, int? girisDepo, int? cikisDepo, int? redGirisDepo, int? kabulGirisDepo, List<String>? seriListe
});




}
/// @nodoc
class __$OlcumSeriRequestModelCopyWithImpl<$Res>
    implements _$OlcumSeriRequestModelCopyWith<$Res> {
  __$OlcumSeriRequestModelCopyWithImpl(this._self, this._then);

  final _OlcumSeriRequestModel _self;
  final $Res Function(_OlcumSeriRequestModel) _then;

/// Create a copy of OlcumSeriRequestModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? stokKodu = freezed,Object? girisDepo = freezed,Object? cikisDepo = freezed,Object? redGirisDepo = freezed,Object? kabulGirisDepo = freezed,Object? seriListe = freezed,}) {
  return _then(_OlcumSeriRequestModel(
stokKodu: freezed == stokKodu ? _self.stokKodu : stokKodu // ignore: cast_nullable_to_non_nullable
as String?,girisDepo: freezed == girisDepo ? _self.girisDepo : girisDepo // ignore: cast_nullable_to_non_nullable
as int?,cikisDepo: freezed == cikisDepo ? _self.cikisDepo : cikisDepo // ignore: cast_nullable_to_non_nullable
as int?,redGirisDepo: freezed == redGirisDepo ? _self.redGirisDepo : redGirisDepo // ignore: cast_nullable_to_non_nullable
as int?,kabulGirisDepo: freezed == kabulGirisDepo ? _self.kabulGirisDepo : kabulGirisDepo // ignore: cast_nullable_to_non_nullable
as int?,seriListe: freezed == seriListe ? _self._seriListe : seriListe // ignore: cast_nullable_to_non_nullable
as List<String>?,
  ));
}


}

// dart format on
