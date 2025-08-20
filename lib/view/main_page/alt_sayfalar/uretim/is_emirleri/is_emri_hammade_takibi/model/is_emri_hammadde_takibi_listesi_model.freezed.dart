// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'is_emri_hammadde_takibi_listesi_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$IsEmriHammaddeTakibiListesiModel {

 int? get takipno; set takipno(int? value); int? get nfisemrino; set nfisemrino(int? value); String? get isemrino; set isemrino(String? value); String? get stokKodu; set stokKodu(String? value); String? get stokAdi; set stokAdi(String? value); String? get yapkod; set yapkod(String? value); String? get yapacik; set yapacik(String? value); String? get makineKodu; set makineKodu(String? value); double? get miktar; set miktar(double? value);
/// Create a copy of IsEmriHammaddeTakibiListesiModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$IsEmriHammaddeTakibiListesiModelCopyWith<IsEmriHammaddeTakibiListesiModel> get copyWith => _$IsEmriHammaddeTakibiListesiModelCopyWithImpl<IsEmriHammaddeTakibiListesiModel>(this as IsEmriHammaddeTakibiListesiModel, _$identity);

  /// Serializes this IsEmriHammaddeTakibiListesiModel to a JSON map.
  Map<String, dynamic> toJson();






}

/// @nodoc
abstract mixin class $IsEmriHammaddeTakibiListesiModelCopyWith<$Res>  {
  factory $IsEmriHammaddeTakibiListesiModelCopyWith(IsEmriHammaddeTakibiListesiModel value, $Res Function(IsEmriHammaddeTakibiListesiModel) _then) = _$IsEmriHammaddeTakibiListesiModelCopyWithImpl;
@useResult
$Res call({
 int? takipno, int? nfisemrino, String? isemrino, String? stokKodu, String? stokAdi, String? yapkod, String? yapacik, String? makineKodu, double? miktar
});




}
/// @nodoc
class _$IsEmriHammaddeTakibiListesiModelCopyWithImpl<$Res>
    implements $IsEmriHammaddeTakibiListesiModelCopyWith<$Res> {
  _$IsEmriHammaddeTakibiListesiModelCopyWithImpl(this._self, this._then);

  final IsEmriHammaddeTakibiListesiModel _self;
  final $Res Function(IsEmriHammaddeTakibiListesiModel) _then;

/// Create a copy of IsEmriHammaddeTakibiListesiModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? takipno = freezed,Object? nfisemrino = freezed,Object? isemrino = freezed,Object? stokKodu = freezed,Object? stokAdi = freezed,Object? yapkod = freezed,Object? yapacik = freezed,Object? makineKodu = freezed,Object? miktar = freezed,}) {
  return _then(_self.copyWith(
takipno: freezed == takipno ? _self.takipno : takipno // ignore: cast_nullable_to_non_nullable
as int?,nfisemrino: freezed == nfisemrino ? _self.nfisemrino : nfisemrino // ignore: cast_nullable_to_non_nullable
as int?,isemrino: freezed == isemrino ? _self.isemrino : isemrino // ignore: cast_nullable_to_non_nullable
as String?,stokKodu: freezed == stokKodu ? _self.stokKodu : stokKodu // ignore: cast_nullable_to_non_nullable
as String?,stokAdi: freezed == stokAdi ? _self.stokAdi : stokAdi // ignore: cast_nullable_to_non_nullable
as String?,yapkod: freezed == yapkod ? _self.yapkod : yapkod // ignore: cast_nullable_to_non_nullable
as String?,yapacik: freezed == yapacik ? _self.yapacik : yapacik // ignore: cast_nullable_to_non_nullable
as String?,makineKodu: freezed == makineKodu ? _self.makineKodu : makineKodu // ignore: cast_nullable_to_non_nullable
as String?,miktar: freezed == miktar ? _self.miktar : miktar // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}

}


/// Adds pattern-matching-related methods to [IsEmriHammaddeTakibiListesiModel].
extension IsEmriHammaddeTakibiListesiModelPatterns on IsEmriHammaddeTakibiListesiModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _IsEmriHammaddeTakibiListesiModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _IsEmriHammaddeTakibiListesiModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _IsEmriHammaddeTakibiListesiModel value)  $default,){
final _that = this;
switch (_that) {
case _IsEmriHammaddeTakibiListesiModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _IsEmriHammaddeTakibiListesiModel value)?  $default,){
final _that = this;
switch (_that) {
case _IsEmriHammaddeTakibiListesiModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? takipno,  int? nfisemrino,  String? isemrino,  String? stokKodu,  String? stokAdi,  String? yapkod,  String? yapacik,  String? makineKodu,  double? miktar)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _IsEmriHammaddeTakibiListesiModel() when $default != null:
return $default(_that.takipno,_that.nfisemrino,_that.isemrino,_that.stokKodu,_that.stokAdi,_that.yapkod,_that.yapacik,_that.makineKodu,_that.miktar);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? takipno,  int? nfisemrino,  String? isemrino,  String? stokKodu,  String? stokAdi,  String? yapkod,  String? yapacik,  String? makineKodu,  double? miktar)  $default,) {final _that = this;
switch (_that) {
case _IsEmriHammaddeTakibiListesiModel():
return $default(_that.takipno,_that.nfisemrino,_that.isemrino,_that.stokKodu,_that.stokAdi,_that.yapkod,_that.yapacik,_that.makineKodu,_that.miktar);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? takipno,  int? nfisemrino,  String? isemrino,  String? stokKodu,  String? stokAdi,  String? yapkod,  String? yapacik,  String? makineKodu,  double? miktar)?  $default,) {final _that = this;
switch (_that) {
case _IsEmriHammaddeTakibiListesiModel() when $default != null:
return $default(_that.takipno,_that.nfisemrino,_that.isemrino,_that.stokKodu,_that.stokAdi,_that.yapkod,_that.yapacik,_that.makineKodu,_that.miktar);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _IsEmriHammaddeTakibiListesiModel extends IsEmriHammaddeTakibiListesiModel {
   _IsEmriHammaddeTakibiListesiModel({this.takipno, this.nfisemrino, this.isemrino, this.stokKodu, this.stokAdi, this.yapkod, this.yapacik, this.makineKodu, this.miktar}): super._();
  factory _IsEmriHammaddeTakibiListesiModel.fromJson(Map<String, dynamic> json) => _$IsEmriHammaddeTakibiListesiModelFromJson(json);

@override  int? takipno;
@override  int? nfisemrino;
@override  String? isemrino;
@override  String? stokKodu;
@override  String? stokAdi;
@override  String? yapkod;
@override  String? yapacik;
@override  String? makineKodu;
@override  double? miktar;

/// Create a copy of IsEmriHammaddeTakibiListesiModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$IsEmriHammaddeTakibiListesiModelCopyWith<_IsEmriHammaddeTakibiListesiModel> get copyWith => __$IsEmriHammaddeTakibiListesiModelCopyWithImpl<_IsEmriHammaddeTakibiListesiModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$IsEmriHammaddeTakibiListesiModelToJson(this, );
}





}

/// @nodoc
abstract mixin class _$IsEmriHammaddeTakibiListesiModelCopyWith<$Res> implements $IsEmriHammaddeTakibiListesiModelCopyWith<$Res> {
  factory _$IsEmriHammaddeTakibiListesiModelCopyWith(_IsEmriHammaddeTakibiListesiModel value, $Res Function(_IsEmriHammaddeTakibiListesiModel) _then) = __$IsEmriHammaddeTakibiListesiModelCopyWithImpl;
@override @useResult
$Res call({
 int? takipno, int? nfisemrino, String? isemrino, String? stokKodu, String? stokAdi, String? yapkod, String? yapacik, String? makineKodu, double? miktar
});




}
/// @nodoc
class __$IsEmriHammaddeTakibiListesiModelCopyWithImpl<$Res>
    implements _$IsEmriHammaddeTakibiListesiModelCopyWith<$Res> {
  __$IsEmriHammaddeTakibiListesiModelCopyWithImpl(this._self, this._then);

  final _IsEmriHammaddeTakibiListesiModel _self;
  final $Res Function(_IsEmriHammaddeTakibiListesiModel) _then;

/// Create a copy of IsEmriHammaddeTakibiListesiModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? takipno = freezed,Object? nfisemrino = freezed,Object? isemrino = freezed,Object? stokKodu = freezed,Object? stokAdi = freezed,Object? yapkod = freezed,Object? yapacik = freezed,Object? makineKodu = freezed,Object? miktar = freezed,}) {
  return _then(_IsEmriHammaddeTakibiListesiModel(
takipno: freezed == takipno ? _self.takipno : takipno // ignore: cast_nullable_to_non_nullable
as int?,nfisemrino: freezed == nfisemrino ? _self.nfisemrino : nfisemrino // ignore: cast_nullable_to_non_nullable
as int?,isemrino: freezed == isemrino ? _self.isemrino : isemrino // ignore: cast_nullable_to_non_nullable
as String?,stokKodu: freezed == stokKodu ? _self.stokKodu : stokKodu // ignore: cast_nullable_to_non_nullable
as String?,stokAdi: freezed == stokAdi ? _self.stokAdi : stokAdi // ignore: cast_nullable_to_non_nullable
as String?,yapkod: freezed == yapkod ? _self.yapkod : yapkod // ignore: cast_nullable_to_non_nullable
as String?,yapacik: freezed == yapacik ? _self.yapacik : yapacik // ignore: cast_nullable_to_non_nullable
as String?,makineKodu: freezed == makineKodu ? _self.makineKodu : makineKodu // ignore: cast_nullable_to_non_nullable
as String?,miktar: freezed == miktar ? _self.miktar : miktar // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}


}

// dart format on
