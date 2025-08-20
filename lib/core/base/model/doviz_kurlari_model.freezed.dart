// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'doviz_kurlari_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DovizKurlariModel {

 DateTime? get tarih; set tarih(DateTime? value); int? get sira; set sira(int? value); int? get dovizTipi; set dovizTipi(int? value); double? get dovAlis; set dovAlis(double? value); double? get dovSatis; set dovSatis(double? value); String? get dovizAdi; set dovizAdi(String? value); double? get effAlis; set effAlis(double? value); double? get effSatis; set effSatis(double? value);
/// Create a copy of DovizKurlariModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DovizKurlariModelCopyWith<DovizKurlariModel> get copyWith => _$DovizKurlariModelCopyWithImpl<DovizKurlariModel>(this as DovizKurlariModel, _$identity);

  /// Serializes this DovizKurlariModel to a JSON map.
  Map<String, dynamic> toJson();






}

/// @nodoc
abstract mixin class $DovizKurlariModelCopyWith<$Res>  {
  factory $DovizKurlariModelCopyWith(DovizKurlariModel value, $Res Function(DovizKurlariModel) _then) = _$DovizKurlariModelCopyWithImpl;
@useResult
$Res call({
 DateTime? tarih, int? sira, int? dovizTipi, double? dovAlis, double? dovSatis, String? dovizAdi, double? effAlis, double? effSatis
});




}
/// @nodoc
class _$DovizKurlariModelCopyWithImpl<$Res>
    implements $DovizKurlariModelCopyWith<$Res> {
  _$DovizKurlariModelCopyWithImpl(this._self, this._then);

  final DovizKurlariModel _self;
  final $Res Function(DovizKurlariModel) _then;

/// Create a copy of DovizKurlariModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? tarih = freezed,Object? sira = freezed,Object? dovizTipi = freezed,Object? dovAlis = freezed,Object? dovSatis = freezed,Object? dovizAdi = freezed,Object? effAlis = freezed,Object? effSatis = freezed,}) {
  return _then(_self.copyWith(
tarih: freezed == tarih ? _self.tarih : tarih // ignore: cast_nullable_to_non_nullable
as DateTime?,sira: freezed == sira ? _self.sira : sira // ignore: cast_nullable_to_non_nullable
as int?,dovizTipi: freezed == dovizTipi ? _self.dovizTipi : dovizTipi // ignore: cast_nullable_to_non_nullable
as int?,dovAlis: freezed == dovAlis ? _self.dovAlis : dovAlis // ignore: cast_nullable_to_non_nullable
as double?,dovSatis: freezed == dovSatis ? _self.dovSatis : dovSatis // ignore: cast_nullable_to_non_nullable
as double?,dovizAdi: freezed == dovizAdi ? _self.dovizAdi : dovizAdi // ignore: cast_nullable_to_non_nullable
as String?,effAlis: freezed == effAlis ? _self.effAlis : effAlis // ignore: cast_nullable_to_non_nullable
as double?,effSatis: freezed == effSatis ? _self.effSatis : effSatis // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}

}


/// Adds pattern-matching-related methods to [DovizKurlariModel].
extension DovizKurlariModelPatterns on DovizKurlariModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DovizKurlariModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DovizKurlariModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DovizKurlariModel value)  $default,){
final _that = this;
switch (_that) {
case _DovizKurlariModel():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DovizKurlariModel value)?  $default,){
final _that = this;
switch (_that) {
case _DovizKurlariModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( DateTime? tarih,  int? sira,  int? dovizTipi,  double? dovAlis,  double? dovSatis,  String? dovizAdi,  double? effAlis,  double? effSatis)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DovizKurlariModel() when $default != null:
return $default(_that.tarih,_that.sira,_that.dovizTipi,_that.dovAlis,_that.dovSatis,_that.dovizAdi,_that.effAlis,_that.effSatis);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( DateTime? tarih,  int? sira,  int? dovizTipi,  double? dovAlis,  double? dovSatis,  String? dovizAdi,  double? effAlis,  double? effSatis)  $default,) {final _that = this;
switch (_that) {
case _DovizKurlariModel():
return $default(_that.tarih,_that.sira,_that.dovizTipi,_that.dovAlis,_that.dovSatis,_that.dovizAdi,_that.effAlis,_that.effSatis);case _:
  throw StateError('Unexpected subclass');

}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( DateTime? tarih,  int? sira,  int? dovizTipi,  double? dovAlis,  double? dovSatis,  String? dovizAdi,  double? effAlis,  double? effSatis)?  $default,) {final _that = this;
switch (_that) {
case _DovizKurlariModel() when $default != null:
return $default(_that.tarih,_that.sira,_that.dovizTipi,_that.dovAlis,_that.dovSatis,_that.dovizAdi,_that.effAlis,_that.effSatis);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(createFactory: true, explicitToJson: true, createToJson: true)
class _DovizKurlariModel extends DovizKurlariModel {
   _DovizKurlariModel({this.tarih, this.sira, this.dovizTipi, this.dovAlis, this.dovSatis, this.dovizAdi, this.effAlis, this.effSatis}): super._();
  factory _DovizKurlariModel.fromJson(Map<String, dynamic> json) => _$DovizKurlariModelFromJson(json);

@override  DateTime? tarih;
@override  int? sira;
@override  int? dovizTipi;
@override  double? dovAlis;
@override  double? dovSatis;
@override  String? dovizAdi;
@override  double? effAlis;
@override  double? effSatis;

/// Create a copy of DovizKurlariModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DovizKurlariModelCopyWith<_DovizKurlariModel> get copyWith => __$DovizKurlariModelCopyWithImpl<_DovizKurlariModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DovizKurlariModelToJson(this, );
}





}

/// @nodoc
abstract mixin class _$DovizKurlariModelCopyWith<$Res> implements $DovizKurlariModelCopyWith<$Res> {
  factory _$DovizKurlariModelCopyWith(_DovizKurlariModel value, $Res Function(_DovizKurlariModel) _then) = __$DovizKurlariModelCopyWithImpl;
@override @useResult
$Res call({
 DateTime? tarih, int? sira, int? dovizTipi, double? dovAlis, double? dovSatis, String? dovizAdi, double? effAlis, double? effSatis
});




}
/// @nodoc
class __$DovizKurlariModelCopyWithImpl<$Res>
    implements _$DovizKurlariModelCopyWith<$Res> {
  __$DovizKurlariModelCopyWithImpl(this._self, this._then);

  final _DovizKurlariModel _self;
  final $Res Function(_DovizKurlariModel) _then;

/// Create a copy of DovizKurlariModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? tarih = freezed,Object? sira = freezed,Object? dovizTipi = freezed,Object? dovAlis = freezed,Object? dovSatis = freezed,Object? dovizAdi = freezed,Object? effAlis = freezed,Object? effSatis = freezed,}) {
  return _then(_DovizKurlariModel(
tarih: freezed == tarih ? _self.tarih : tarih // ignore: cast_nullable_to_non_nullable
as DateTime?,sira: freezed == sira ? _self.sira : sira // ignore: cast_nullable_to_non_nullable
as int?,dovizTipi: freezed == dovizTipi ? _self.dovizTipi : dovizTipi // ignore: cast_nullable_to_non_nullable
as int?,dovAlis: freezed == dovAlis ? _self.dovAlis : dovAlis // ignore: cast_nullable_to_non_nullable
as double?,dovSatis: freezed == dovSatis ? _self.dovSatis : dovSatis // ignore: cast_nullable_to_non_nullable
as double?,dovizAdi: freezed == dovizAdi ? _self.dovizAdi : dovizAdi // ignore: cast_nullable_to_non_nullable
as String?,effAlis: freezed == effAlis ? _self.effAlis : effAlis // ignore: cast_nullable_to_non_nullable
as double?,effSatis: freezed == effSatis ? _self.effSatis : effSatis // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}


}


/// @nodoc
mixin _$DovizKurlariRequestModel {

 DateTime? get tarih; set tarih(DateTime? value); int? get sira; set sira(int? value); int? get dovizTipi; set dovizTipi(int? value); double? get alis; set alis(double? value); double? get satis; set satis(double? value); String? get dovizAdi; set dovizAdi(String? value); double? get eFAlis; set eFAlis(double? value); double? get eFSatis; set eFSatis(double? value);
/// Create a copy of DovizKurlariRequestModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DovizKurlariRequestModelCopyWith<DovizKurlariRequestModel> get copyWith => _$DovizKurlariRequestModelCopyWithImpl<DovizKurlariRequestModel>(this as DovizKurlariRequestModel, _$identity);

  /// Serializes this DovizKurlariRequestModel to a JSON map.
  Map<String, dynamic> toJson();






}

/// @nodoc
abstract mixin class $DovizKurlariRequestModelCopyWith<$Res>  {
  factory $DovizKurlariRequestModelCopyWith(DovizKurlariRequestModel value, $Res Function(DovizKurlariRequestModel) _then) = _$DovizKurlariRequestModelCopyWithImpl;
@useResult
$Res call({
 DateTime? tarih, int? sira, int? dovizTipi, double? alis, double? satis, String? dovizAdi, double? eFAlis, double? eFSatis
});




}
/// @nodoc
class _$DovizKurlariRequestModelCopyWithImpl<$Res>
    implements $DovizKurlariRequestModelCopyWith<$Res> {
  _$DovizKurlariRequestModelCopyWithImpl(this._self, this._then);

  final DovizKurlariRequestModel _self;
  final $Res Function(DovizKurlariRequestModel) _then;

/// Create a copy of DovizKurlariRequestModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? tarih = freezed,Object? sira = freezed,Object? dovizTipi = freezed,Object? alis = freezed,Object? satis = freezed,Object? dovizAdi = freezed,Object? eFAlis = freezed,Object? eFSatis = freezed,}) {
  return _then(_self.copyWith(
tarih: freezed == tarih ? _self.tarih : tarih // ignore: cast_nullable_to_non_nullable
as DateTime?,sira: freezed == sira ? _self.sira : sira // ignore: cast_nullable_to_non_nullable
as int?,dovizTipi: freezed == dovizTipi ? _self.dovizTipi : dovizTipi // ignore: cast_nullable_to_non_nullable
as int?,alis: freezed == alis ? _self.alis : alis // ignore: cast_nullable_to_non_nullable
as double?,satis: freezed == satis ? _self.satis : satis // ignore: cast_nullable_to_non_nullable
as double?,dovizAdi: freezed == dovizAdi ? _self.dovizAdi : dovizAdi // ignore: cast_nullable_to_non_nullable
as String?,eFAlis: freezed == eFAlis ? _self.eFAlis : eFAlis // ignore: cast_nullable_to_non_nullable
as double?,eFSatis: freezed == eFSatis ? _self.eFSatis : eFSatis // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}

}


/// Adds pattern-matching-related methods to [DovizKurlariRequestModel].
extension DovizKurlariRequestModelPatterns on DovizKurlariRequestModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DovizKurlariRequestModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DovizKurlariRequestModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DovizKurlariRequestModel value)  $default,){
final _that = this;
switch (_that) {
case _DovizKurlariRequestModel():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DovizKurlariRequestModel value)?  $default,){
final _that = this;
switch (_that) {
case _DovizKurlariRequestModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( DateTime? tarih,  int? sira,  int? dovizTipi,  double? alis,  double? satis,  String? dovizAdi,  double? eFAlis,  double? eFSatis)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DovizKurlariRequestModel() when $default != null:
return $default(_that.tarih,_that.sira,_that.dovizTipi,_that.alis,_that.satis,_that.dovizAdi,_that.eFAlis,_that.eFSatis);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( DateTime? tarih,  int? sira,  int? dovizTipi,  double? alis,  double? satis,  String? dovizAdi,  double? eFAlis,  double? eFSatis)  $default,) {final _that = this;
switch (_that) {
case _DovizKurlariRequestModel():
return $default(_that.tarih,_that.sira,_that.dovizTipi,_that.alis,_that.satis,_that.dovizAdi,_that.eFAlis,_that.eFSatis);case _:
  throw StateError('Unexpected subclass');

}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( DateTime? tarih,  int? sira,  int? dovizTipi,  double? alis,  double? satis,  String? dovizAdi,  double? eFAlis,  double? eFSatis)?  $default,) {final _that = this;
switch (_that) {
case _DovizKurlariRequestModel() when $default != null:
return $default(_that.tarih,_that.sira,_that.dovizTipi,_that.alis,_that.satis,_that.dovizAdi,_that.eFAlis,_that.eFSatis);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(createFactory: true, explicitToJson: true, createToJson: true, fieldRename: FieldRename.pascal)
class _DovizKurlariRequestModel extends DovizKurlariRequestModel {
   _DovizKurlariRequestModel({this.tarih, this.sira, this.dovizTipi, this.alis, this.satis, this.dovizAdi, this.eFAlis, this.eFSatis}): super._();
  factory _DovizKurlariRequestModel.fromJson(Map<String, dynamic> json) => _$DovizKurlariRequestModelFromJson(json);

@override  DateTime? tarih;
@override  int? sira;
@override  int? dovizTipi;
@override  double? alis;
@override  double? satis;
@override  String? dovizAdi;
@override  double? eFAlis;
@override  double? eFSatis;

/// Create a copy of DovizKurlariRequestModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DovizKurlariRequestModelCopyWith<_DovizKurlariRequestModel> get copyWith => __$DovizKurlariRequestModelCopyWithImpl<_DovizKurlariRequestModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DovizKurlariRequestModelToJson(this, );
}





}

/// @nodoc
abstract mixin class _$DovizKurlariRequestModelCopyWith<$Res> implements $DovizKurlariRequestModelCopyWith<$Res> {
  factory _$DovizKurlariRequestModelCopyWith(_DovizKurlariRequestModel value, $Res Function(_DovizKurlariRequestModel) _then) = __$DovizKurlariRequestModelCopyWithImpl;
@override @useResult
$Res call({
 DateTime? tarih, int? sira, int? dovizTipi, double? alis, double? satis, String? dovizAdi, double? eFAlis, double? eFSatis
});




}
/// @nodoc
class __$DovizKurlariRequestModelCopyWithImpl<$Res>
    implements _$DovizKurlariRequestModelCopyWith<$Res> {
  __$DovizKurlariRequestModelCopyWithImpl(this._self, this._then);

  final _DovizKurlariRequestModel _self;
  final $Res Function(_DovizKurlariRequestModel) _then;

/// Create a copy of DovizKurlariRequestModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? tarih = freezed,Object? sira = freezed,Object? dovizTipi = freezed,Object? alis = freezed,Object? satis = freezed,Object? dovizAdi = freezed,Object? eFAlis = freezed,Object? eFSatis = freezed,}) {
  return _then(_DovizKurlariRequestModel(
tarih: freezed == tarih ? _self.tarih : tarih // ignore: cast_nullable_to_non_nullable
as DateTime?,sira: freezed == sira ? _self.sira : sira // ignore: cast_nullable_to_non_nullable
as int?,dovizTipi: freezed == dovizTipi ? _self.dovizTipi : dovizTipi // ignore: cast_nullable_to_non_nullable
as int?,alis: freezed == alis ? _self.alis : alis // ignore: cast_nullable_to_non_nullable
as double?,satis: freezed == satis ? _self.satis : satis // ignore: cast_nullable_to_non_nullable
as double?,dovizAdi: freezed == dovizAdi ? _self.dovizAdi : dovizAdi // ignore: cast_nullable_to_non_nullable
as String?,eFAlis: freezed == eFAlis ? _self.eFAlis : eFAlis // ignore: cast_nullable_to_non_nullable
as double?,eFSatis: freezed == eFSatis ? _self.eFSatis : eFSatis // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}


}

// dart format on
