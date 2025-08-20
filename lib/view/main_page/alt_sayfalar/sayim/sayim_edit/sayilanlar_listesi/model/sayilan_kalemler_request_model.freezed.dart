// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sayilan_kalemler_request_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SayilanKalemlerRequestModel {

@JsonKey(name: "FiltreKodu") int? get filtreKodu;@JsonKey(name: "FiltreKodu") set filtreKodu(int? value);@JsonKey(name: "DepoKodu") int? get depoKodu;@JsonKey(name: "DepoKodu") set depoKodu(int? value);@JsonKey(name: "KullaniciAdi") String? get kullaniciAdi;@JsonKey(name: "KullaniciAdi") set kullaniciAdi(String? value);@JsonKey(name: "EkranTipi") String? get ekranTipi;@JsonKey(name: "EkranTipi") set ekranTipi(String? value);@JsonKey(name: "BelgeNo") String? get belgeNo;@JsonKey(name: "BelgeNo") set belgeNo(String? value);@JsonKey(name: "seriBazinda") String? get seriBazinda;@JsonKey(name: "seriBazinda") set seriBazinda(String? value);@JsonKey(name: "ID") int? get id;@JsonKey(name: "ID") set id(int? value);
/// Create a copy of SayilanKalemlerRequestModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SayilanKalemlerRequestModelCopyWith<SayilanKalemlerRequestModel> get copyWith => _$SayilanKalemlerRequestModelCopyWithImpl<SayilanKalemlerRequestModel>(this as SayilanKalemlerRequestModel, _$identity);

  /// Serializes this SayilanKalemlerRequestModel to a JSON map.
  Map<String, dynamic> toJson();






}

/// @nodoc
abstract mixin class $SayilanKalemlerRequestModelCopyWith<$Res>  {
  factory $SayilanKalemlerRequestModelCopyWith(SayilanKalemlerRequestModel value, $Res Function(SayilanKalemlerRequestModel) _then) = _$SayilanKalemlerRequestModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "FiltreKodu") int? filtreKodu,@JsonKey(name: "DepoKodu") int? depoKodu,@JsonKey(name: "KullaniciAdi") String? kullaniciAdi,@JsonKey(name: "EkranTipi") String? ekranTipi,@JsonKey(name: "BelgeNo") String? belgeNo,@JsonKey(name: "seriBazinda") String? seriBazinda,@JsonKey(name: "ID") int? id
});




}
/// @nodoc
class _$SayilanKalemlerRequestModelCopyWithImpl<$Res>
    implements $SayilanKalemlerRequestModelCopyWith<$Res> {
  _$SayilanKalemlerRequestModelCopyWithImpl(this._self, this._then);

  final SayilanKalemlerRequestModel _self;
  final $Res Function(SayilanKalemlerRequestModel) _then;

/// Create a copy of SayilanKalemlerRequestModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? filtreKodu = freezed,Object? depoKodu = freezed,Object? kullaniciAdi = freezed,Object? ekranTipi = freezed,Object? belgeNo = freezed,Object? seriBazinda = freezed,Object? id = freezed,}) {
  return _then(_self.copyWith(
filtreKodu: freezed == filtreKodu ? _self.filtreKodu : filtreKodu // ignore: cast_nullable_to_non_nullable
as int?,depoKodu: freezed == depoKodu ? _self.depoKodu : depoKodu // ignore: cast_nullable_to_non_nullable
as int?,kullaniciAdi: freezed == kullaniciAdi ? _self.kullaniciAdi : kullaniciAdi // ignore: cast_nullable_to_non_nullable
as String?,ekranTipi: freezed == ekranTipi ? _self.ekranTipi : ekranTipi // ignore: cast_nullable_to_non_nullable
as String?,belgeNo: freezed == belgeNo ? _self.belgeNo : belgeNo // ignore: cast_nullable_to_non_nullable
as String?,seriBazinda: freezed == seriBazinda ? _self.seriBazinda : seriBazinda // ignore: cast_nullable_to_non_nullable
as String?,id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [SayilanKalemlerRequestModel].
extension SayilanKalemlerRequestModelPatterns on SayilanKalemlerRequestModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SayilanKalemlerRequestModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SayilanKalemlerRequestModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SayilanKalemlerRequestModel value)  $default,){
final _that = this;
switch (_that) {
case _SayilanKalemlerRequestModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SayilanKalemlerRequestModel value)?  $default,){
final _that = this;
switch (_that) {
case _SayilanKalemlerRequestModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "FiltreKodu")  int? filtreKodu, @JsonKey(name: "DepoKodu")  int? depoKodu, @JsonKey(name: "KullaniciAdi")  String? kullaniciAdi, @JsonKey(name: "EkranTipi")  String? ekranTipi, @JsonKey(name: "BelgeNo")  String? belgeNo, @JsonKey(name: "seriBazinda")  String? seriBazinda, @JsonKey(name: "ID")  int? id)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SayilanKalemlerRequestModel() when $default != null:
return $default(_that.filtreKodu,_that.depoKodu,_that.kullaniciAdi,_that.ekranTipi,_that.belgeNo,_that.seriBazinda,_that.id);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "FiltreKodu")  int? filtreKodu, @JsonKey(name: "DepoKodu")  int? depoKodu, @JsonKey(name: "KullaniciAdi")  String? kullaniciAdi, @JsonKey(name: "EkranTipi")  String? ekranTipi, @JsonKey(name: "BelgeNo")  String? belgeNo, @JsonKey(name: "seriBazinda")  String? seriBazinda, @JsonKey(name: "ID")  int? id)  $default,) {final _that = this;
switch (_that) {
case _SayilanKalemlerRequestModel():
return $default(_that.filtreKodu,_that.depoKodu,_that.kullaniciAdi,_that.ekranTipi,_that.belgeNo,_that.seriBazinda,_that.id);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "FiltreKodu")  int? filtreKodu, @JsonKey(name: "DepoKodu")  int? depoKodu, @JsonKey(name: "KullaniciAdi")  String? kullaniciAdi, @JsonKey(name: "EkranTipi")  String? ekranTipi, @JsonKey(name: "BelgeNo")  String? belgeNo, @JsonKey(name: "seriBazinda")  String? seriBazinda, @JsonKey(name: "ID")  int? id)?  $default,) {final _that = this;
switch (_that) {
case _SayilanKalemlerRequestModel() when $default != null:
return $default(_that.filtreKodu,_that.depoKodu,_that.kullaniciAdi,_that.ekranTipi,_that.belgeNo,_that.seriBazinda,_that.id);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SayilanKalemlerRequestModel implements SayilanKalemlerRequestModel {
   _SayilanKalemlerRequestModel({@JsonKey(name: "FiltreKodu") this.filtreKodu, @JsonKey(name: "DepoKodu") this.depoKodu, @JsonKey(name: "KullaniciAdi") this.kullaniciAdi, @JsonKey(name: "EkranTipi") this.ekranTipi = "L", @JsonKey(name: "BelgeNo") this.belgeNo, @JsonKey(name: "seriBazinda") this.seriBazinda, @JsonKey(name: "ID") this.id});
  factory _SayilanKalemlerRequestModel.fromJson(Map<String, dynamic> json) => _$SayilanKalemlerRequestModelFromJson(json);

@override@JsonKey(name: "FiltreKodu")  int? filtreKodu;
@override@JsonKey(name: "DepoKodu")  int? depoKodu;
@override@JsonKey(name: "KullaniciAdi")  String? kullaniciAdi;
@override@JsonKey(name: "EkranTipi")  String? ekranTipi;
@override@JsonKey(name: "BelgeNo")  String? belgeNo;
@override@JsonKey(name: "seriBazinda")  String? seriBazinda;
@override@JsonKey(name: "ID")  int? id;

/// Create a copy of SayilanKalemlerRequestModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SayilanKalemlerRequestModelCopyWith<_SayilanKalemlerRequestModel> get copyWith => __$SayilanKalemlerRequestModelCopyWithImpl<_SayilanKalemlerRequestModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SayilanKalemlerRequestModelToJson(this, );
}





}

/// @nodoc
abstract mixin class _$SayilanKalemlerRequestModelCopyWith<$Res> implements $SayilanKalemlerRequestModelCopyWith<$Res> {
  factory _$SayilanKalemlerRequestModelCopyWith(_SayilanKalemlerRequestModel value, $Res Function(_SayilanKalemlerRequestModel) _then) = __$SayilanKalemlerRequestModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "FiltreKodu") int? filtreKodu,@JsonKey(name: "DepoKodu") int? depoKodu,@JsonKey(name: "KullaniciAdi") String? kullaniciAdi,@JsonKey(name: "EkranTipi") String? ekranTipi,@JsonKey(name: "BelgeNo") String? belgeNo,@JsonKey(name: "seriBazinda") String? seriBazinda,@JsonKey(name: "ID") int? id
});




}
/// @nodoc
class __$SayilanKalemlerRequestModelCopyWithImpl<$Res>
    implements _$SayilanKalemlerRequestModelCopyWith<$Res> {
  __$SayilanKalemlerRequestModelCopyWithImpl(this._self, this._then);

  final _SayilanKalemlerRequestModel _self;
  final $Res Function(_SayilanKalemlerRequestModel) _then;

/// Create a copy of SayilanKalemlerRequestModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? filtreKodu = freezed,Object? depoKodu = freezed,Object? kullaniciAdi = freezed,Object? ekranTipi = freezed,Object? belgeNo = freezed,Object? seriBazinda = freezed,Object? id = freezed,}) {
  return _then(_SayilanKalemlerRequestModel(
filtreKodu: freezed == filtreKodu ? _self.filtreKodu : filtreKodu // ignore: cast_nullable_to_non_nullable
as int?,depoKodu: freezed == depoKodu ? _self.depoKodu : depoKodu // ignore: cast_nullable_to_non_nullable
as int?,kullaniciAdi: freezed == kullaniciAdi ? _self.kullaniciAdi : kullaniciAdi // ignore: cast_nullable_to_non_nullable
as String?,ekranTipi: freezed == ekranTipi ? _self.ekranTipi : ekranTipi // ignore: cast_nullable_to_non_nullable
as String?,belgeNo: freezed == belgeNo ? _self.belgeNo : belgeNo // ignore: cast_nullable_to_non_nullable
as String?,seriBazinda: freezed == seriBazinda ? _self.seriBazinda : seriBazinda // ignore: cast_nullable_to_non_nullable
as String?,id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

// dart format on
