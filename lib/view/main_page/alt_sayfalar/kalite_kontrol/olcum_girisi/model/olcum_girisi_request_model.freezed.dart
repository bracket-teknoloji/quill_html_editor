// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'olcum_girisi_request_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$OlcumGirisiRequestModel {

 int? get durum; set durum(int? value); String? get belgeTipi; set belgeTipi(String? value); String? get bastar; set bastar(String? value); String? get bittar; set bittar(String? value); String? get siralama; set siralama(String? value); String? get qrstring; set qrstring(String? value);@JsonKey(name: "SearchText") String? get searchText;@JsonKey(name: "SearchText") set searchText(String? value);@JsonKey(name: "Sayfa") int? get sayfa;@JsonKey(name: "Sayfa") set sayfa(int? value);
/// Create a copy of OlcumGirisiRequestModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OlcumGirisiRequestModelCopyWith<OlcumGirisiRequestModel> get copyWith => _$OlcumGirisiRequestModelCopyWithImpl<OlcumGirisiRequestModel>(this as OlcumGirisiRequestModel, _$identity);

  /// Serializes this OlcumGirisiRequestModel to a JSON map.
  Map<String, dynamic> toJson();






}

/// @nodoc
abstract mixin class $OlcumGirisiRequestModelCopyWith<$Res>  {
  factory $OlcumGirisiRequestModelCopyWith(OlcumGirisiRequestModel value, $Res Function(OlcumGirisiRequestModel) _then) = _$OlcumGirisiRequestModelCopyWithImpl;
@useResult
$Res call({
 int? durum, String? belgeTipi, String? bastar, String? bittar, String? siralama, String? qrstring,@JsonKey(name: "SearchText") String? searchText,@JsonKey(name: "Sayfa") int? sayfa
});




}
/// @nodoc
class _$OlcumGirisiRequestModelCopyWithImpl<$Res>
    implements $OlcumGirisiRequestModelCopyWith<$Res> {
  _$OlcumGirisiRequestModelCopyWithImpl(this._self, this._then);

  final OlcumGirisiRequestModel _self;
  final $Res Function(OlcumGirisiRequestModel) _then;

/// Create a copy of OlcumGirisiRequestModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? durum = freezed,Object? belgeTipi = freezed,Object? bastar = freezed,Object? bittar = freezed,Object? siralama = freezed,Object? qrstring = freezed,Object? searchText = freezed,Object? sayfa = freezed,}) {
  return _then(_self.copyWith(
durum: freezed == durum ? _self.durum : durum // ignore: cast_nullable_to_non_nullable
as int?,belgeTipi: freezed == belgeTipi ? _self.belgeTipi : belgeTipi // ignore: cast_nullable_to_non_nullable
as String?,bastar: freezed == bastar ? _self.bastar : bastar // ignore: cast_nullable_to_non_nullable
as String?,bittar: freezed == bittar ? _self.bittar : bittar // ignore: cast_nullable_to_non_nullable
as String?,siralama: freezed == siralama ? _self.siralama : siralama // ignore: cast_nullable_to_non_nullable
as String?,qrstring: freezed == qrstring ? _self.qrstring : qrstring // ignore: cast_nullable_to_non_nullable
as String?,searchText: freezed == searchText ? _self.searchText : searchText // ignore: cast_nullable_to_non_nullable
as String?,sayfa: freezed == sayfa ? _self.sayfa : sayfa // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [OlcumGirisiRequestModel].
extension OlcumGirisiRequestModelPatterns on OlcumGirisiRequestModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OlcumGirisiRequestModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OlcumGirisiRequestModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OlcumGirisiRequestModel value)  $default,){
final _that = this;
switch (_that) {
case _OlcumGirisiRequestModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OlcumGirisiRequestModel value)?  $default,){
final _that = this;
switch (_that) {
case _OlcumGirisiRequestModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? durum,  String? belgeTipi,  String? bastar,  String? bittar,  String? siralama,  String? qrstring, @JsonKey(name: "SearchText")  String? searchText, @JsonKey(name: "Sayfa")  int? sayfa)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OlcumGirisiRequestModel() when $default != null:
return $default(_that.durum,_that.belgeTipi,_that.bastar,_that.bittar,_that.siralama,_that.qrstring,_that.searchText,_that.sayfa);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? durum,  String? belgeTipi,  String? bastar,  String? bittar,  String? siralama,  String? qrstring, @JsonKey(name: "SearchText")  String? searchText, @JsonKey(name: "Sayfa")  int? sayfa)  $default,) {final _that = this;
switch (_that) {
case _OlcumGirisiRequestModel():
return $default(_that.durum,_that.belgeTipi,_that.bastar,_that.bittar,_that.siralama,_that.qrstring,_that.searchText,_that.sayfa);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? durum,  String? belgeTipi,  String? bastar,  String? bittar,  String? siralama,  String? qrstring, @JsonKey(name: "SearchText")  String? searchText, @JsonKey(name: "Sayfa")  int? sayfa)?  $default,) {final _that = this;
switch (_that) {
case _OlcumGirisiRequestModel() when $default != null:
return $default(_that.durum,_that.belgeTipi,_that.bastar,_that.bittar,_that.siralama,_that.qrstring,_that.searchText,_that.sayfa);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _OlcumGirisiRequestModel implements OlcumGirisiRequestModel {
   _OlcumGirisiRequestModel({this.durum, this.belgeTipi, this.bastar, this.bittar, this.siralama, this.qrstring, @JsonKey(name: "SearchText") this.searchText, @JsonKey(name: "Sayfa") this.sayfa});
  factory _OlcumGirisiRequestModel.fromJson(Map<String, dynamic> json) => _$OlcumGirisiRequestModelFromJson(json);

@override  int? durum;
@override  String? belgeTipi;
@override  String? bastar;
@override  String? bittar;
@override  String? siralama;
@override  String? qrstring;
@override@JsonKey(name: "SearchText")  String? searchText;
@override@JsonKey(name: "Sayfa")  int? sayfa;

/// Create a copy of OlcumGirisiRequestModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OlcumGirisiRequestModelCopyWith<_OlcumGirisiRequestModel> get copyWith => __$OlcumGirisiRequestModelCopyWithImpl<_OlcumGirisiRequestModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$OlcumGirisiRequestModelToJson(this, );
}





}

/// @nodoc
abstract mixin class _$OlcumGirisiRequestModelCopyWith<$Res> implements $OlcumGirisiRequestModelCopyWith<$Res> {
  factory _$OlcumGirisiRequestModelCopyWith(_OlcumGirisiRequestModel value, $Res Function(_OlcumGirisiRequestModel) _then) = __$OlcumGirisiRequestModelCopyWithImpl;
@override @useResult
$Res call({
 int? durum, String? belgeTipi, String? bastar, String? bittar, String? siralama, String? qrstring,@JsonKey(name: "SearchText") String? searchText,@JsonKey(name: "Sayfa") int? sayfa
});




}
/// @nodoc
class __$OlcumGirisiRequestModelCopyWithImpl<$Res>
    implements _$OlcumGirisiRequestModelCopyWith<$Res> {
  __$OlcumGirisiRequestModelCopyWithImpl(this._self, this._then);

  final _OlcumGirisiRequestModel _self;
  final $Res Function(_OlcumGirisiRequestModel) _then;

/// Create a copy of OlcumGirisiRequestModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? durum = freezed,Object? belgeTipi = freezed,Object? bastar = freezed,Object? bittar = freezed,Object? siralama = freezed,Object? qrstring = freezed,Object? searchText = freezed,Object? sayfa = freezed,}) {
  return _then(_OlcumGirisiRequestModel(
durum: freezed == durum ? _self.durum : durum // ignore: cast_nullable_to_non_nullable
as int?,belgeTipi: freezed == belgeTipi ? _self.belgeTipi : belgeTipi // ignore: cast_nullable_to_non_nullable
as String?,bastar: freezed == bastar ? _self.bastar : bastar // ignore: cast_nullable_to_non_nullable
as String?,bittar: freezed == bittar ? _self.bittar : bittar // ignore: cast_nullable_to_non_nullable
as String?,siralama: freezed == siralama ? _self.siralama : siralama // ignore: cast_nullable_to_non_nullable
as String?,qrstring: freezed == qrstring ? _self.qrstring : qrstring // ignore: cast_nullable_to_non_nullable
as String?,searchText: freezed == searchText ? _self.searchText : searchText // ignore: cast_nullable_to_non_nullable
as String?,sayfa: freezed == sayfa ? _self.sayfa : sayfa // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

// dart format on
