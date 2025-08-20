// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'surum_yenilikleri_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SurumYenilikleriModel {

 int? get surumKodu; set surumKodu(int? value); String? get versiyon; set versiyon(String? value); String? get surumAdi; set surumAdi(String? value); String? get yer; set yer(String? value); List<ValueList>? get liste; set liste(List<ValueList>? value); List<String>? get listAciklama; set listAciklama(List<String>? value); DateTime? get tarih; set tarih(DateTime? value);
/// Create a copy of SurumYenilikleriModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SurumYenilikleriModelCopyWith<SurumYenilikleriModel> get copyWith => _$SurumYenilikleriModelCopyWithImpl<SurumYenilikleriModel>(this as SurumYenilikleriModel, _$identity);

  /// Serializes this SurumYenilikleriModel to a JSON map.
  Map<String, dynamic> toJson();






}

/// @nodoc
abstract mixin class $SurumYenilikleriModelCopyWith<$Res>  {
  factory $SurumYenilikleriModelCopyWith(SurumYenilikleriModel value, $Res Function(SurumYenilikleriModel) _then) = _$SurumYenilikleriModelCopyWithImpl;
@useResult
$Res call({
 int? surumKodu, String? versiyon, String? surumAdi, String? yer, List<ValueList>? liste, List<String>? listAciklama, DateTime? tarih
});




}
/// @nodoc
class _$SurumYenilikleriModelCopyWithImpl<$Res>
    implements $SurumYenilikleriModelCopyWith<$Res> {
  _$SurumYenilikleriModelCopyWithImpl(this._self, this._then);

  final SurumYenilikleriModel _self;
  final $Res Function(SurumYenilikleriModel) _then;

/// Create a copy of SurumYenilikleriModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? surumKodu = freezed,Object? versiyon = freezed,Object? surumAdi = freezed,Object? yer = freezed,Object? liste = freezed,Object? listAciklama = freezed,Object? tarih = freezed,}) {
  return _then(_self.copyWith(
surumKodu: freezed == surumKodu ? _self.surumKodu : surumKodu // ignore: cast_nullable_to_non_nullable
as int?,versiyon: freezed == versiyon ? _self.versiyon : versiyon // ignore: cast_nullable_to_non_nullable
as String?,surumAdi: freezed == surumAdi ? _self.surumAdi : surumAdi // ignore: cast_nullable_to_non_nullable
as String?,yer: freezed == yer ? _self.yer : yer // ignore: cast_nullable_to_non_nullable
as String?,liste: freezed == liste ? _self.liste : liste // ignore: cast_nullable_to_non_nullable
as List<ValueList>?,listAciklama: freezed == listAciklama ? _self.listAciklama : listAciklama // ignore: cast_nullable_to_non_nullable
as List<String>?,tarih: freezed == tarih ? _self.tarih : tarih // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [SurumYenilikleriModel].
extension SurumYenilikleriModelPatterns on SurumYenilikleriModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SurumYenilikleriModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SurumYenilikleriModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SurumYenilikleriModel value)  $default,){
final _that = this;
switch (_that) {
case _SurumYenilikleriModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SurumYenilikleriModel value)?  $default,){
final _that = this;
switch (_that) {
case _SurumYenilikleriModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? surumKodu,  String? versiyon,  String? surumAdi,  String? yer,  List<ValueList>? liste,  List<String>? listAciklama,  DateTime? tarih)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SurumYenilikleriModel() when $default != null:
return $default(_that.surumKodu,_that.versiyon,_that.surumAdi,_that.yer,_that.liste,_that.listAciklama,_that.tarih);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? surumKodu,  String? versiyon,  String? surumAdi,  String? yer,  List<ValueList>? liste,  List<String>? listAciklama,  DateTime? tarih)  $default,) {final _that = this;
switch (_that) {
case _SurumYenilikleriModel():
return $default(_that.surumKodu,_that.versiyon,_that.surumAdi,_that.yer,_that.liste,_that.listAciklama,_that.tarih);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? surumKodu,  String? versiyon,  String? surumAdi,  String? yer,  List<ValueList>? liste,  List<String>? listAciklama,  DateTime? tarih)?  $default,) {final _that = this;
switch (_that) {
case _SurumYenilikleriModel() when $default != null:
return $default(_that.surumKodu,_that.versiyon,_that.surumAdi,_that.yer,_that.liste,_that.listAciklama,_that.tarih);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SurumYenilikleriModel extends SurumYenilikleriModel {
   _SurumYenilikleriModel({this.surumKodu, this.versiyon, this.surumAdi, this.yer, this.liste, this.listAciklama, this.tarih}): super._();
  factory _SurumYenilikleriModel.fromJson(Map<String, dynamic> json) => _$SurumYenilikleriModelFromJson(json);

@override  int? surumKodu;
@override  String? versiyon;
@override  String? surumAdi;
@override  String? yer;
@override  List<ValueList>? liste;
@override  List<String>? listAciklama;
@override  DateTime? tarih;

/// Create a copy of SurumYenilikleriModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SurumYenilikleriModelCopyWith<_SurumYenilikleriModel> get copyWith => __$SurumYenilikleriModelCopyWithImpl<_SurumYenilikleriModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SurumYenilikleriModelToJson(this, );
}





}

/// @nodoc
abstract mixin class _$SurumYenilikleriModelCopyWith<$Res> implements $SurumYenilikleriModelCopyWith<$Res> {
  factory _$SurumYenilikleriModelCopyWith(_SurumYenilikleriModel value, $Res Function(_SurumYenilikleriModel) _then) = __$SurumYenilikleriModelCopyWithImpl;
@override @useResult
$Res call({
 int? surumKodu, String? versiyon, String? surumAdi, String? yer, List<ValueList>? liste, List<String>? listAciklama, DateTime? tarih
});




}
/// @nodoc
class __$SurumYenilikleriModelCopyWithImpl<$Res>
    implements _$SurumYenilikleriModelCopyWith<$Res> {
  __$SurumYenilikleriModelCopyWithImpl(this._self, this._then);

  final _SurumYenilikleriModel _self;
  final $Res Function(_SurumYenilikleriModel) _then;

/// Create a copy of SurumYenilikleriModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? surumKodu = freezed,Object? versiyon = freezed,Object? surumAdi = freezed,Object? yer = freezed,Object? liste = freezed,Object? listAciklama = freezed,Object? tarih = freezed,}) {
  return _then(_SurumYenilikleriModel(
surumKodu: freezed == surumKodu ? _self.surumKodu : surumKodu // ignore: cast_nullable_to_non_nullable
as int?,versiyon: freezed == versiyon ? _self.versiyon : versiyon // ignore: cast_nullable_to_non_nullable
as String?,surumAdi: freezed == surumAdi ? _self.surumAdi : surumAdi // ignore: cast_nullable_to_non_nullable
as String?,yer: freezed == yer ? _self.yer : yer // ignore: cast_nullable_to_non_nullable
as String?,liste: freezed == liste ? _self.liste : liste // ignore: cast_nullable_to_non_nullable
as List<ValueList>?,listAciklama: freezed == listAciklama ? _self.listAciklama : listAciklama // ignore: cast_nullable_to_non_nullable
as List<String>?,tarih: freezed == tarih ? _self.tarih : tarih // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}


/// @nodoc
mixin _$ValueList {

 int? get id; String? get aciklama; bool? get talepEden;
/// Create a copy of ValueList
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ValueListCopyWith<ValueList> get copyWith => _$ValueListCopyWithImpl<ValueList>(this as ValueList, _$identity);

  /// Serializes this ValueList to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ValueList&&(identical(other.id, id) || other.id == id)&&(identical(other.aciklama, aciklama) || other.aciklama == aciklama)&&(identical(other.talepEden, talepEden) || other.talepEden == talepEden));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,aciklama,talepEden);



}

/// @nodoc
abstract mixin class $ValueListCopyWith<$Res>  {
  factory $ValueListCopyWith(ValueList value, $Res Function(ValueList) _then) = _$ValueListCopyWithImpl;
@useResult
$Res call({
 int? id, String? aciklama, bool? talepEden
});




}
/// @nodoc
class _$ValueListCopyWithImpl<$Res>
    implements $ValueListCopyWith<$Res> {
  _$ValueListCopyWithImpl(this._self, this._then);

  final ValueList _self;
  final $Res Function(ValueList) _then;

/// Create a copy of ValueList
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? aciklama = freezed,Object? talepEden = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,aciklama: freezed == aciklama ? _self.aciklama : aciklama // ignore: cast_nullable_to_non_nullable
as String?,talepEden: freezed == talepEden ? _self.talepEden : talepEden // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}

}


/// Adds pattern-matching-related methods to [ValueList].
extension ValueListPatterns on ValueList {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ValueList value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ValueList() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ValueList value)  $default,){
final _that = this;
switch (_that) {
case _ValueList():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ValueList value)?  $default,){
final _that = this;
switch (_that) {
case _ValueList() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? id,  String? aciklama,  bool? talepEden)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ValueList() when $default != null:
return $default(_that.id,_that.aciklama,_that.talepEden);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? id,  String? aciklama,  bool? talepEden)  $default,) {final _that = this;
switch (_that) {
case _ValueList():
return $default(_that.id,_that.aciklama,_that.talepEden);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? id,  String? aciklama,  bool? talepEden)?  $default,) {final _that = this;
switch (_that) {
case _ValueList() when $default != null:
return $default(_that.id,_that.aciklama,_that.talepEden);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ValueList implements ValueList {
  const _ValueList({this.id, this.aciklama, this.talepEden});
  factory _ValueList.fromJson(Map<String, dynamic> json) => _$ValueListFromJson(json);

@override final  int? id;
@override final  String? aciklama;
@override final  bool? talepEden;

/// Create a copy of ValueList
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ValueListCopyWith<_ValueList> get copyWith => __$ValueListCopyWithImpl<_ValueList>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ValueListToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ValueList&&(identical(other.id, id) || other.id == id)&&(identical(other.aciklama, aciklama) || other.aciklama == aciklama)&&(identical(other.talepEden, talepEden) || other.talepEden == talepEden));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,aciklama,talepEden);



}

/// @nodoc
abstract mixin class _$ValueListCopyWith<$Res> implements $ValueListCopyWith<$Res> {
  factory _$ValueListCopyWith(_ValueList value, $Res Function(_ValueList) _then) = __$ValueListCopyWithImpl;
@override @useResult
$Res call({
 int? id, String? aciklama, bool? talepEden
});




}
/// @nodoc
class __$ValueListCopyWithImpl<$Res>
    implements _$ValueListCopyWith<$Res> {
  __$ValueListCopyWithImpl(this._self, this._then);

  final _ValueList _self;
  final $Res Function(_ValueList) _then;

/// Create a copy of ValueList
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? aciklama = freezed,Object? talepEden = freezed,}) {
  return _then(_ValueList(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,aciklama: freezed == aciklama ? _self.aciklama : aciklama // ignore: cast_nullable_to_non_nullable
as String?,talepEden: freezed == talepEden ? _self.talepEden : talepEden // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}


}

// dart format on
