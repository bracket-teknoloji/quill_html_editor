// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
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


/// Adds pattern-matching-related methods to [OlcumSeriRequestModel].
extension OlcumSeriRequestModelPatterns on OlcumSeriRequestModel {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OlcumSeriRequestModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OlcumSeriRequestModel() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OlcumSeriRequestModel value)  $default,){
final _that = this;
switch (_that) {
case _OlcumSeriRequestModel():
return $default(_that);}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OlcumSeriRequestModel value)?  $default,){
final _that = this;
switch (_that) {
case _OlcumSeriRequestModel() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? stokKodu,  int? girisDepo,  int? cikisDepo,  int? redGirisDepo,  int? kabulGirisDepo,  List<String>? seriListe)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OlcumSeriRequestModel() when $default != null:
return $default(_that.stokKodu,_that.girisDepo,_that.cikisDepo,_that.redGirisDepo,_that.kabulGirisDepo,_that.seriListe);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? stokKodu,  int? girisDepo,  int? cikisDepo,  int? redGirisDepo,  int? kabulGirisDepo,  List<String>? seriListe)  $default,) {final _that = this;
switch (_that) {
case _OlcumSeriRequestModel():
return $default(_that.stokKodu,_that.girisDepo,_that.cikisDepo,_that.redGirisDepo,_that.kabulGirisDepo,_that.seriListe);}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? stokKodu,  int? girisDepo,  int? cikisDepo,  int? redGirisDepo,  int? kabulGirisDepo,  List<String>? seriListe)?  $default,) {final _that = this;
switch (_that) {
case _OlcumSeriRequestModel() when $default != null:
return $default(_that.stokKodu,_that.girisDepo,_that.cikisDepo,_that.redGirisDepo,_that.kabulGirisDepo,_that.seriListe);case _:
  return null;

}
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
