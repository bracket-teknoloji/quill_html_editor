// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'banka_sozlesmesi_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$BankaSozlesmesiModel {

 String? get sozlesmeKodu; set sozlesmeKodu(String? value); String? get sozlesmeAdi; set sozlesmeAdi(String? value); String? get krediKartiTanimi; set krediKartiTanimi(String? value); String? get bankaTanimi; set bankaTanimi(String? value); DateTime? get baslamaTarihi; set baslamaTarihi(DateTime? value); DateTime? get bitisTarihi; set bitisTarihi(DateTime? value); int? get taksitBitis; set taksitBitis(int? value);
/// Create a copy of BankaSozlesmesiModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BankaSozlesmesiModelCopyWith<BankaSozlesmesiModel> get copyWith => _$BankaSozlesmesiModelCopyWithImpl<BankaSozlesmesiModel>(this as BankaSozlesmesiModel, _$identity);

  /// Serializes this BankaSozlesmesiModel to a JSON map.
  Map<String, dynamic> toJson();






}

/// @nodoc
abstract mixin class $BankaSozlesmesiModelCopyWith<$Res>  {
  factory $BankaSozlesmesiModelCopyWith(BankaSozlesmesiModel value, $Res Function(BankaSozlesmesiModel) _then) = _$BankaSozlesmesiModelCopyWithImpl;
@useResult
$Res call({
 String? sozlesmeKodu, String? sozlesmeAdi, String? krediKartiTanimi, String? bankaTanimi, DateTime? baslamaTarihi, DateTime? bitisTarihi, int? taksitBitis
});




}
/// @nodoc
class _$BankaSozlesmesiModelCopyWithImpl<$Res>
    implements $BankaSozlesmesiModelCopyWith<$Res> {
  _$BankaSozlesmesiModelCopyWithImpl(this._self, this._then);

  final BankaSozlesmesiModel _self;
  final $Res Function(BankaSozlesmesiModel) _then;

/// Create a copy of BankaSozlesmesiModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? sozlesmeKodu = freezed,Object? sozlesmeAdi = freezed,Object? krediKartiTanimi = freezed,Object? bankaTanimi = freezed,Object? baslamaTarihi = freezed,Object? bitisTarihi = freezed,Object? taksitBitis = freezed,}) {
  return _then(_self.copyWith(
sozlesmeKodu: freezed == sozlesmeKodu ? _self.sozlesmeKodu : sozlesmeKodu // ignore: cast_nullable_to_non_nullable
as String?,sozlesmeAdi: freezed == sozlesmeAdi ? _self.sozlesmeAdi : sozlesmeAdi // ignore: cast_nullable_to_non_nullable
as String?,krediKartiTanimi: freezed == krediKartiTanimi ? _self.krediKartiTanimi : krediKartiTanimi // ignore: cast_nullable_to_non_nullable
as String?,bankaTanimi: freezed == bankaTanimi ? _self.bankaTanimi : bankaTanimi // ignore: cast_nullable_to_non_nullable
as String?,baslamaTarihi: freezed == baslamaTarihi ? _self.baslamaTarihi : baslamaTarihi // ignore: cast_nullable_to_non_nullable
as DateTime?,bitisTarihi: freezed == bitisTarihi ? _self.bitisTarihi : bitisTarihi // ignore: cast_nullable_to_non_nullable
as DateTime?,taksitBitis: freezed == taksitBitis ? _self.taksitBitis : taksitBitis // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [BankaSozlesmesiModel].
extension BankaSozlesmesiModelPatterns on BankaSozlesmesiModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BankaSozlesmesiModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BankaSozlesmesiModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BankaSozlesmesiModel value)  $default,){
final _that = this;
switch (_that) {
case _BankaSozlesmesiModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BankaSozlesmesiModel value)?  $default,){
final _that = this;
switch (_that) {
case _BankaSozlesmesiModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? sozlesmeKodu,  String? sozlesmeAdi,  String? krediKartiTanimi,  String? bankaTanimi,  DateTime? baslamaTarihi,  DateTime? bitisTarihi,  int? taksitBitis)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BankaSozlesmesiModel() when $default != null:
return $default(_that.sozlesmeKodu,_that.sozlesmeAdi,_that.krediKartiTanimi,_that.bankaTanimi,_that.baslamaTarihi,_that.bitisTarihi,_that.taksitBitis);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? sozlesmeKodu,  String? sozlesmeAdi,  String? krediKartiTanimi,  String? bankaTanimi,  DateTime? baslamaTarihi,  DateTime? bitisTarihi,  int? taksitBitis)  $default,) {final _that = this;
switch (_that) {
case _BankaSozlesmesiModel():
return $default(_that.sozlesmeKodu,_that.sozlesmeAdi,_that.krediKartiTanimi,_that.bankaTanimi,_that.baslamaTarihi,_that.bitisTarihi,_that.taksitBitis);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? sozlesmeKodu,  String? sozlesmeAdi,  String? krediKartiTanimi,  String? bankaTanimi,  DateTime? baslamaTarihi,  DateTime? bitisTarihi,  int? taksitBitis)?  $default,) {final _that = this;
switch (_that) {
case _BankaSozlesmesiModel() when $default != null:
return $default(_that.sozlesmeKodu,_that.sozlesmeAdi,_that.krediKartiTanimi,_that.bankaTanimi,_that.baslamaTarihi,_that.bitisTarihi,_that.taksitBitis);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _BankaSozlesmesiModel extends BankaSozlesmesiModel {
   _BankaSozlesmesiModel({this.sozlesmeKodu, this.sozlesmeAdi, this.krediKartiTanimi, this.bankaTanimi, this.baslamaTarihi, this.bitisTarihi, this.taksitBitis}): super._();
  factory _BankaSozlesmesiModel.fromJson(Map<String, dynamic> json) => _$BankaSozlesmesiModelFromJson(json);

@override  String? sozlesmeKodu;
@override  String? sozlesmeAdi;
@override  String? krediKartiTanimi;
@override  String? bankaTanimi;
@override  DateTime? baslamaTarihi;
@override  DateTime? bitisTarihi;
@override  int? taksitBitis;

/// Create a copy of BankaSozlesmesiModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BankaSozlesmesiModelCopyWith<_BankaSozlesmesiModel> get copyWith => __$BankaSozlesmesiModelCopyWithImpl<_BankaSozlesmesiModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BankaSozlesmesiModelToJson(this, );
}





}

/// @nodoc
abstract mixin class _$BankaSozlesmesiModelCopyWith<$Res> implements $BankaSozlesmesiModelCopyWith<$Res> {
  factory _$BankaSozlesmesiModelCopyWith(_BankaSozlesmesiModel value, $Res Function(_BankaSozlesmesiModel) _then) = __$BankaSozlesmesiModelCopyWithImpl;
@override @useResult
$Res call({
 String? sozlesmeKodu, String? sozlesmeAdi, String? krediKartiTanimi, String? bankaTanimi, DateTime? baslamaTarihi, DateTime? bitisTarihi, int? taksitBitis
});




}
/// @nodoc
class __$BankaSozlesmesiModelCopyWithImpl<$Res>
    implements _$BankaSozlesmesiModelCopyWith<$Res> {
  __$BankaSozlesmesiModelCopyWithImpl(this._self, this._then);

  final _BankaSozlesmesiModel _self;
  final $Res Function(_BankaSozlesmesiModel) _then;

/// Create a copy of BankaSozlesmesiModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? sozlesmeKodu = freezed,Object? sozlesmeAdi = freezed,Object? krediKartiTanimi = freezed,Object? bankaTanimi = freezed,Object? baslamaTarihi = freezed,Object? bitisTarihi = freezed,Object? taksitBitis = freezed,}) {
  return _then(_BankaSozlesmesiModel(
sozlesmeKodu: freezed == sozlesmeKodu ? _self.sozlesmeKodu : sozlesmeKodu // ignore: cast_nullable_to_non_nullable
as String?,sozlesmeAdi: freezed == sozlesmeAdi ? _self.sozlesmeAdi : sozlesmeAdi // ignore: cast_nullable_to_non_nullable
as String?,krediKartiTanimi: freezed == krediKartiTanimi ? _self.krediKartiTanimi : krediKartiTanimi // ignore: cast_nullable_to_non_nullable
as String?,bankaTanimi: freezed == bankaTanimi ? _self.bankaTanimi : bankaTanimi // ignore: cast_nullable_to_non_nullable
as String?,baslamaTarihi: freezed == baslamaTarihi ? _self.baslamaTarihi : baslamaTarihi // ignore: cast_nullable_to_non_nullable
as DateTime?,bitisTarihi: freezed == bitisTarihi ? _self.bitisTarihi : bitisTarihi // ignore: cast_nullable_to_non_nullable
as DateTime?,taksitBitis: freezed == taksitBitis ? _self.taksitBitis : taksitBitis // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

// dart format on
