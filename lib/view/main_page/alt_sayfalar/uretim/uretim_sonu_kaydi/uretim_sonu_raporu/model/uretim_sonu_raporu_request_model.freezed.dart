// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'uretim_sonu_raporu_request_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UretimSonuRaporuRequestModel {

 String? get belgeNo; set belgeNo(String? value); int? get filtreKodu; set filtreKodu(int? value); String? get stokKodu; set stokKodu(String? value);
/// Create a copy of UretimSonuRaporuRequestModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UretimSonuRaporuRequestModelCopyWith<UretimSonuRaporuRequestModel> get copyWith => _$UretimSonuRaporuRequestModelCopyWithImpl<UretimSonuRaporuRequestModel>(this as UretimSonuRaporuRequestModel, _$identity);

  /// Serializes this UretimSonuRaporuRequestModel to a JSON map.
  Map<String, dynamic> toJson();






}

/// @nodoc
abstract mixin class $UretimSonuRaporuRequestModelCopyWith<$Res>  {
  factory $UretimSonuRaporuRequestModelCopyWith(UretimSonuRaporuRequestModel value, $Res Function(UretimSonuRaporuRequestModel) _then) = _$UretimSonuRaporuRequestModelCopyWithImpl;
@useResult
$Res call({
 String? belgeNo, int? filtreKodu, String? stokKodu
});




}
/// @nodoc
class _$UretimSonuRaporuRequestModelCopyWithImpl<$Res>
    implements $UretimSonuRaporuRequestModelCopyWith<$Res> {
  _$UretimSonuRaporuRequestModelCopyWithImpl(this._self, this._then);

  final UretimSonuRaporuRequestModel _self;
  final $Res Function(UretimSonuRaporuRequestModel) _then;

/// Create a copy of UretimSonuRaporuRequestModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? belgeNo = freezed,Object? filtreKodu = freezed,Object? stokKodu = freezed,}) {
  return _then(_self.copyWith(
belgeNo: freezed == belgeNo ? _self.belgeNo : belgeNo // ignore: cast_nullable_to_non_nullable
as String?,filtreKodu: freezed == filtreKodu ? _self.filtreKodu : filtreKodu // ignore: cast_nullable_to_non_nullable
as int?,stokKodu: freezed == stokKodu ? _self.stokKodu : stokKodu // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [UretimSonuRaporuRequestModel].
extension UretimSonuRaporuRequestModelPatterns on UretimSonuRaporuRequestModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UretimSonuRaporuRequestModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UretimSonuRaporuRequestModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UretimSonuRaporuRequestModel value)  $default,){
final _that = this;
switch (_that) {
case _UretimSonuRaporuRequestModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UretimSonuRaporuRequestModel value)?  $default,){
final _that = this;
switch (_that) {
case _UretimSonuRaporuRequestModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? belgeNo,  int? filtreKodu,  String? stokKodu)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UretimSonuRaporuRequestModel() when $default != null:
return $default(_that.belgeNo,_that.filtreKodu,_that.stokKodu);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? belgeNo,  int? filtreKodu,  String? stokKodu)  $default,) {final _that = this;
switch (_that) {
case _UretimSonuRaporuRequestModel():
return $default(_that.belgeNo,_that.filtreKodu,_that.stokKodu);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? belgeNo,  int? filtreKodu,  String? stokKodu)?  $default,) {final _that = this;
switch (_that) {
case _UretimSonuRaporuRequestModel() when $default != null:
return $default(_that.belgeNo,_that.filtreKodu,_that.stokKodu);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.pascal)
class _UretimSonuRaporuRequestModel implements UretimSonuRaporuRequestModel {
   _UretimSonuRaporuRequestModel({this.belgeNo, this.filtreKodu, this.stokKodu});
  factory _UretimSonuRaporuRequestModel.fromJson(Map<String, dynamic> json) => _$UretimSonuRaporuRequestModelFromJson(json);

@override  String? belgeNo;
@override  int? filtreKodu;
@override  String? stokKodu;

/// Create a copy of UretimSonuRaporuRequestModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UretimSonuRaporuRequestModelCopyWith<_UretimSonuRaporuRequestModel> get copyWith => __$UretimSonuRaporuRequestModelCopyWithImpl<_UretimSonuRaporuRequestModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UretimSonuRaporuRequestModelToJson(this, );
}





}

/// @nodoc
abstract mixin class _$UretimSonuRaporuRequestModelCopyWith<$Res> implements $UretimSonuRaporuRequestModelCopyWith<$Res> {
  factory _$UretimSonuRaporuRequestModelCopyWith(_UretimSonuRaporuRequestModel value, $Res Function(_UretimSonuRaporuRequestModel) _then) = __$UretimSonuRaporuRequestModelCopyWithImpl;
@override @useResult
$Res call({
 String? belgeNo, int? filtreKodu, String? stokKodu
});




}
/// @nodoc
class __$UretimSonuRaporuRequestModelCopyWithImpl<$Res>
    implements _$UretimSonuRaporuRequestModelCopyWith<$Res> {
  __$UretimSonuRaporuRequestModelCopyWithImpl(this._self, this._then);

  final _UretimSonuRaporuRequestModel _self;
  final $Res Function(_UretimSonuRaporuRequestModel) _then;

/// Create a copy of UretimSonuRaporuRequestModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? belgeNo = freezed,Object? filtreKodu = freezed,Object? stokKodu = freezed,}) {
  return _then(_UretimSonuRaporuRequestModel(
belgeNo: freezed == belgeNo ? _self.belgeNo : belgeNo // ignore: cast_nullable_to_non_nullable
as String?,filtreKodu: freezed == filtreKodu ? _self.filtreKodu : filtreKodu // ignore: cast_nullable_to_non_nullable
as int?,stokKodu: freezed == stokKodu ? _self.stokKodu : stokKodu // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
