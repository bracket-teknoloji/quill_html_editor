// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'finans_ozet_rapor_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$FinansOzetRaporModel {

 String? get tabloTipi; set tabloTipi(String? value); String? get belgeTipi; set belgeTipi(String? value); int? get ayKodu; set ayKodu(int? value); double? get tutar1; set tutar1(double? value); double? get tutar2; set tutar2(double? value);
/// Create a copy of FinansOzetRaporModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FinansOzetRaporModelCopyWith<FinansOzetRaporModel> get copyWith => _$FinansOzetRaporModelCopyWithImpl<FinansOzetRaporModel>(this as FinansOzetRaporModel, _$identity);

  /// Serializes this FinansOzetRaporModel to a JSON map.
  Map<String, dynamic> toJson();






}

/// @nodoc
abstract mixin class $FinansOzetRaporModelCopyWith<$Res>  {
  factory $FinansOzetRaporModelCopyWith(FinansOzetRaporModel value, $Res Function(FinansOzetRaporModel) _then) = _$FinansOzetRaporModelCopyWithImpl;
@useResult
$Res call({
 String? tabloTipi, String? belgeTipi, int? ayKodu, double? tutar1, double? tutar2
});




}
/// @nodoc
class _$FinansOzetRaporModelCopyWithImpl<$Res>
    implements $FinansOzetRaporModelCopyWith<$Res> {
  _$FinansOzetRaporModelCopyWithImpl(this._self, this._then);

  final FinansOzetRaporModel _self;
  final $Res Function(FinansOzetRaporModel) _then;

/// Create a copy of FinansOzetRaporModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? tabloTipi = freezed,Object? belgeTipi = freezed,Object? ayKodu = freezed,Object? tutar1 = freezed,Object? tutar2 = freezed,}) {
  return _then(_self.copyWith(
tabloTipi: freezed == tabloTipi ? _self.tabloTipi : tabloTipi // ignore: cast_nullable_to_non_nullable
as String?,belgeTipi: freezed == belgeTipi ? _self.belgeTipi : belgeTipi // ignore: cast_nullable_to_non_nullable
as String?,ayKodu: freezed == ayKodu ? _self.ayKodu : ayKodu // ignore: cast_nullable_to_non_nullable
as int?,tutar1: freezed == tutar1 ? _self.tutar1 : tutar1 // ignore: cast_nullable_to_non_nullable
as double?,tutar2: freezed == tutar2 ? _self.tutar2 : tutar2 // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}

}


/// Adds pattern-matching-related methods to [FinansOzetRaporModel].
extension FinansOzetRaporModelPatterns on FinansOzetRaporModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FinansOzetRaporModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FinansOzetRaporModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FinansOzetRaporModel value)  $default,){
final _that = this;
switch (_that) {
case _FinansOzetRaporModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FinansOzetRaporModel value)?  $default,){
final _that = this;
switch (_that) {
case _FinansOzetRaporModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? tabloTipi,  String? belgeTipi,  int? ayKodu,  double? tutar1,  double? tutar2)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FinansOzetRaporModel() when $default != null:
return $default(_that.tabloTipi,_that.belgeTipi,_that.ayKodu,_that.tutar1,_that.tutar2);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? tabloTipi,  String? belgeTipi,  int? ayKodu,  double? tutar1,  double? tutar2)  $default,) {final _that = this;
switch (_that) {
case _FinansOzetRaporModel():
return $default(_that.tabloTipi,_that.belgeTipi,_that.ayKodu,_that.tutar1,_that.tutar2);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? tabloTipi,  String? belgeTipi,  int? ayKodu,  double? tutar1,  double? tutar2)?  $default,) {final _that = this;
switch (_that) {
case _FinansOzetRaporModel() when $default != null:
return $default(_that.tabloTipi,_that.belgeTipi,_that.ayKodu,_that.tutar1,_that.tutar2);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _FinansOzetRaporModel extends FinansOzetRaporModel {
   _FinansOzetRaporModel({this.tabloTipi, this.belgeTipi, this.ayKodu, this.tutar1, this.tutar2}): super._();
  factory _FinansOzetRaporModel.fromJson(Map<String, dynamic> json) => _$FinansOzetRaporModelFromJson(json);

@override  String? tabloTipi;
@override  String? belgeTipi;
@override  int? ayKodu;
@override  double? tutar1;
@override  double? tutar2;

/// Create a copy of FinansOzetRaporModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FinansOzetRaporModelCopyWith<_FinansOzetRaporModel> get copyWith => __$FinansOzetRaporModelCopyWithImpl<_FinansOzetRaporModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FinansOzetRaporModelToJson(this, );
}





}

/// @nodoc
abstract mixin class _$FinansOzetRaporModelCopyWith<$Res> implements $FinansOzetRaporModelCopyWith<$Res> {
  factory _$FinansOzetRaporModelCopyWith(_FinansOzetRaporModel value, $Res Function(_FinansOzetRaporModel) _then) = __$FinansOzetRaporModelCopyWithImpl;
@override @useResult
$Res call({
 String? tabloTipi, String? belgeTipi, int? ayKodu, double? tutar1, double? tutar2
});




}
/// @nodoc
class __$FinansOzetRaporModelCopyWithImpl<$Res>
    implements _$FinansOzetRaporModelCopyWith<$Res> {
  __$FinansOzetRaporModelCopyWithImpl(this._self, this._then);

  final _FinansOzetRaporModel _self;
  final $Res Function(_FinansOzetRaporModel) _then;

/// Create a copy of FinansOzetRaporModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? tabloTipi = freezed,Object? belgeTipi = freezed,Object? ayKodu = freezed,Object? tutar1 = freezed,Object? tutar2 = freezed,}) {
  return _then(_FinansOzetRaporModel(
tabloTipi: freezed == tabloTipi ? _self.tabloTipi : tabloTipi // ignore: cast_nullable_to_non_nullable
as String?,belgeTipi: freezed == belgeTipi ? _self.belgeTipi : belgeTipi // ignore: cast_nullable_to_non_nullable
as String?,ayKodu: freezed == ayKodu ? _self.ayKodu : ayKodu // ignore: cast_nullable_to_non_nullable
as int?,tutar1: freezed == tutar1 ? _self.tutar1 : tutar1 // ignore: cast_nullable_to_non_nullable
as double?,tutar2: freezed == tutar2 ? _self.tutar2 : tutar2 // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}


}

// dart format on
