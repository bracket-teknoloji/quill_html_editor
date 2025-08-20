// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ek_rehber_request_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$EkRehberRequestModel {

 String? get belgeNo; DateTime? get belgeTarihi; String? get belgeTipi; String? get cariKodu; String? get stokKodu;@JsonKey(name: "ID") int? get id; int? get rehberKodu; String? get yapkod;@JsonKey(name: "PARAMS") Map<String, dynamic>? get params;@JsonKey(includeToJson: false, includeFromJson: false) String? get baslik;
/// Create a copy of EkRehberRequestModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EkRehberRequestModelCopyWith<EkRehberRequestModel> get copyWith => _$EkRehberRequestModelCopyWithImpl<EkRehberRequestModel>(this as EkRehberRequestModel, _$identity);

  /// Serializes this EkRehberRequestModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EkRehberRequestModel&&(identical(other.belgeNo, belgeNo) || other.belgeNo == belgeNo)&&(identical(other.belgeTarihi, belgeTarihi) || other.belgeTarihi == belgeTarihi)&&(identical(other.belgeTipi, belgeTipi) || other.belgeTipi == belgeTipi)&&(identical(other.cariKodu, cariKodu) || other.cariKodu == cariKodu)&&(identical(other.stokKodu, stokKodu) || other.stokKodu == stokKodu)&&(identical(other.id, id) || other.id == id)&&(identical(other.rehberKodu, rehberKodu) || other.rehberKodu == rehberKodu)&&(identical(other.yapkod, yapkod) || other.yapkod == yapkod)&&const DeepCollectionEquality().equals(other.params, params)&&(identical(other.baslik, baslik) || other.baslik == baslik));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,belgeNo,belgeTarihi,belgeTipi,cariKodu,stokKodu,id,rehberKodu,yapkod,const DeepCollectionEquality().hash(params),baslik);



}

/// @nodoc
abstract mixin class $EkRehberRequestModelCopyWith<$Res>  {
  factory $EkRehberRequestModelCopyWith(EkRehberRequestModel value, $Res Function(EkRehberRequestModel) _then) = _$EkRehberRequestModelCopyWithImpl;
@useResult
$Res call({
 String? belgeNo, DateTime? belgeTarihi, String? belgeTipi, String? cariKodu, String? stokKodu,@JsonKey(name: "ID") int? id, int? rehberKodu, String? yapkod,@JsonKey(name: "PARAMS") Map<String, dynamic>? params,@JsonKey(includeToJson: false, includeFromJson: false) String? baslik
});




}
/// @nodoc
class _$EkRehberRequestModelCopyWithImpl<$Res>
    implements $EkRehberRequestModelCopyWith<$Res> {
  _$EkRehberRequestModelCopyWithImpl(this._self, this._then);

  final EkRehberRequestModel _self;
  final $Res Function(EkRehberRequestModel) _then;

/// Create a copy of EkRehberRequestModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? belgeNo = freezed,Object? belgeTarihi = freezed,Object? belgeTipi = freezed,Object? cariKodu = freezed,Object? stokKodu = freezed,Object? id = freezed,Object? rehberKodu = freezed,Object? yapkod = freezed,Object? params = freezed,Object? baslik = freezed,}) {
  return _then(_self.copyWith(
belgeNo: freezed == belgeNo ? _self.belgeNo : belgeNo // ignore: cast_nullable_to_non_nullable
as String?,belgeTarihi: freezed == belgeTarihi ? _self.belgeTarihi : belgeTarihi // ignore: cast_nullable_to_non_nullable
as DateTime?,belgeTipi: freezed == belgeTipi ? _self.belgeTipi : belgeTipi // ignore: cast_nullable_to_non_nullable
as String?,cariKodu: freezed == cariKodu ? _self.cariKodu : cariKodu // ignore: cast_nullable_to_non_nullable
as String?,stokKodu: freezed == stokKodu ? _self.stokKodu : stokKodu // ignore: cast_nullable_to_non_nullable
as String?,id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,rehberKodu: freezed == rehberKodu ? _self.rehberKodu : rehberKodu // ignore: cast_nullable_to_non_nullable
as int?,yapkod: freezed == yapkod ? _self.yapkod : yapkod // ignore: cast_nullable_to_non_nullable
as String?,params: freezed == params ? _self.params : params // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,baslik: freezed == baslik ? _self.baslik : baslik // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [EkRehberRequestModel].
extension EkRehberRequestModelPatterns on EkRehberRequestModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _EkRehberRequestModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _EkRehberRequestModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _EkRehberRequestModel value)  $default,){
final _that = this;
switch (_that) {
case _EkRehberRequestModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _EkRehberRequestModel value)?  $default,){
final _that = this;
switch (_that) {
case _EkRehberRequestModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? belgeNo,  DateTime? belgeTarihi,  String? belgeTipi,  String? cariKodu,  String? stokKodu, @JsonKey(name: "ID")  int? id,  int? rehberKodu,  String? yapkod, @JsonKey(name: "PARAMS")  Map<String, dynamic>? params, @JsonKey(includeToJson: false, includeFromJson: false)  String? baslik)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _EkRehberRequestModel() when $default != null:
return $default(_that.belgeNo,_that.belgeTarihi,_that.belgeTipi,_that.cariKodu,_that.stokKodu,_that.id,_that.rehberKodu,_that.yapkod,_that.params,_that.baslik);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? belgeNo,  DateTime? belgeTarihi,  String? belgeTipi,  String? cariKodu,  String? stokKodu, @JsonKey(name: "ID")  int? id,  int? rehberKodu,  String? yapkod, @JsonKey(name: "PARAMS")  Map<String, dynamic>? params, @JsonKey(includeToJson: false, includeFromJson: false)  String? baslik)  $default,) {final _that = this;
switch (_that) {
case _EkRehberRequestModel():
return $default(_that.belgeNo,_that.belgeTarihi,_that.belgeTipi,_that.cariKodu,_that.stokKodu,_that.id,_that.rehberKodu,_that.yapkod,_that.params,_that.baslik);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? belgeNo,  DateTime? belgeTarihi,  String? belgeTipi,  String? cariKodu,  String? stokKodu, @JsonKey(name: "ID")  int? id,  int? rehberKodu,  String? yapkod, @JsonKey(name: "PARAMS")  Map<String, dynamic>? params, @JsonKey(includeToJson: false, includeFromJson: false)  String? baslik)?  $default,) {final _that = this;
switch (_that) {
case _EkRehberRequestModel() when $default != null:
return $default(_that.belgeNo,_that.belgeTarihi,_that.belgeTipi,_that.cariKodu,_that.stokKodu,_that.id,_that.rehberKodu,_that.yapkod,_that.params,_that.baslik);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.pascal)
class _EkRehberRequestModel implements EkRehberRequestModel {
  const _EkRehberRequestModel({this.belgeNo, this.belgeTarihi, this.belgeTipi, this.cariKodu, this.stokKodu, @JsonKey(name: "ID") this.id, this.rehberKodu, this.yapkod, @JsonKey(name: "PARAMS") final  Map<String, dynamic>? params, @JsonKey(includeToJson: false, includeFromJson: false) this.baslik}): _params = params;
  factory _EkRehberRequestModel.fromJson(Map<String, dynamic> json) => _$EkRehberRequestModelFromJson(json);

@override final  String? belgeNo;
@override final  DateTime? belgeTarihi;
@override final  String? belgeTipi;
@override final  String? cariKodu;
@override final  String? stokKodu;
@override@JsonKey(name: "ID") final  int? id;
@override final  int? rehberKodu;
@override final  String? yapkod;
 final  Map<String, dynamic>? _params;
@override@JsonKey(name: "PARAMS") Map<String, dynamic>? get params {
  final value = _params;
  if (value == null) return null;
  if (_params is EqualUnmodifiableMapView) return _params;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}

@override@JsonKey(includeToJson: false, includeFromJson: false) final  String? baslik;

/// Create a copy of EkRehberRequestModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EkRehberRequestModelCopyWith<_EkRehberRequestModel> get copyWith => __$EkRehberRequestModelCopyWithImpl<_EkRehberRequestModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$EkRehberRequestModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EkRehberRequestModel&&(identical(other.belgeNo, belgeNo) || other.belgeNo == belgeNo)&&(identical(other.belgeTarihi, belgeTarihi) || other.belgeTarihi == belgeTarihi)&&(identical(other.belgeTipi, belgeTipi) || other.belgeTipi == belgeTipi)&&(identical(other.cariKodu, cariKodu) || other.cariKodu == cariKodu)&&(identical(other.stokKodu, stokKodu) || other.stokKodu == stokKodu)&&(identical(other.id, id) || other.id == id)&&(identical(other.rehberKodu, rehberKodu) || other.rehberKodu == rehberKodu)&&(identical(other.yapkod, yapkod) || other.yapkod == yapkod)&&const DeepCollectionEquality().equals(other._params, _params)&&(identical(other.baslik, baslik) || other.baslik == baslik));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,belgeNo,belgeTarihi,belgeTipi,cariKodu,stokKodu,id,rehberKodu,yapkod,const DeepCollectionEquality().hash(_params),baslik);



}

/// @nodoc
abstract mixin class _$EkRehberRequestModelCopyWith<$Res> implements $EkRehberRequestModelCopyWith<$Res> {
  factory _$EkRehberRequestModelCopyWith(_EkRehberRequestModel value, $Res Function(_EkRehberRequestModel) _then) = __$EkRehberRequestModelCopyWithImpl;
@override @useResult
$Res call({
 String? belgeNo, DateTime? belgeTarihi, String? belgeTipi, String? cariKodu, String? stokKodu,@JsonKey(name: "ID") int? id, int? rehberKodu, String? yapkod,@JsonKey(name: "PARAMS") Map<String, dynamic>? params,@JsonKey(includeToJson: false, includeFromJson: false) String? baslik
});




}
/// @nodoc
class __$EkRehberRequestModelCopyWithImpl<$Res>
    implements _$EkRehberRequestModelCopyWith<$Res> {
  __$EkRehberRequestModelCopyWithImpl(this._self, this._then);

  final _EkRehberRequestModel _self;
  final $Res Function(_EkRehberRequestModel) _then;

/// Create a copy of EkRehberRequestModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? belgeNo = freezed,Object? belgeTarihi = freezed,Object? belgeTipi = freezed,Object? cariKodu = freezed,Object? stokKodu = freezed,Object? id = freezed,Object? rehberKodu = freezed,Object? yapkod = freezed,Object? params = freezed,Object? baslik = freezed,}) {
  return _then(_EkRehberRequestModel(
belgeNo: freezed == belgeNo ? _self.belgeNo : belgeNo // ignore: cast_nullable_to_non_nullable
as String?,belgeTarihi: freezed == belgeTarihi ? _self.belgeTarihi : belgeTarihi // ignore: cast_nullable_to_non_nullable
as DateTime?,belgeTipi: freezed == belgeTipi ? _self.belgeTipi : belgeTipi // ignore: cast_nullable_to_non_nullable
as String?,cariKodu: freezed == cariKodu ? _self.cariKodu : cariKodu // ignore: cast_nullable_to_non_nullable
as String?,stokKodu: freezed == stokKodu ? _self.stokKodu : stokKodu // ignore: cast_nullable_to_non_nullable
as String?,id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,rehberKodu: freezed == rehberKodu ? _self.rehberKodu : rehberKodu // ignore: cast_nullable_to_non_nullable
as int?,yapkod: freezed == yapkod ? _self.yapkod : yapkod // ignore: cast_nullable_to_non_nullable
as String?,params: freezed == params ? _self._params : params // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,baslik: freezed == baslik ? _self.baslik : baslik // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
