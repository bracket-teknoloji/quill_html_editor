// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'seri_hareketleri_request_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SeriHareketleriRequestModel {

@JsonKey(name: "StokKodu") String? get stokKodu;@JsonKey(name: "StokKodu") set stokKodu(String? value);@JsonKey(name: "SeriNo") String? get seriNo;@JsonKey(name: "SeriNo") set seriNo(String? value);@JsonKey(name: "Sirala", defaultValue: "TARIH_ZA") String? get sirala;@JsonKey(name: "Sirala", defaultValue: "TARIH_ZA") set sirala(String? value);@JsonKey(name: "BelgeNo") String? get belgeNo;@JsonKey(name: "BelgeNo") set belgeNo(String? value);@JsonKey(name: "BelgeTipi") String? get belgeTipi;@JsonKey(name: "BelgeTipi") set belgeTipi(String? value);@JsonKey(name: "HareketID") int? get hareketId;@JsonKey(name: "HareketID") set hareketId(int? value);@JsonKey(name: "TempGetir") String? get tempGetir;@JsonKey(name: "TempGetir") set tempGetir(String? value);
/// Create a copy of SeriHareketleriRequestModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SeriHareketleriRequestModelCopyWith<SeriHareketleriRequestModel> get copyWith => _$SeriHareketleriRequestModelCopyWithImpl<SeriHareketleriRequestModel>(this as SeriHareketleriRequestModel, _$identity);

  /// Serializes this SeriHareketleriRequestModel to a JSON map.
  Map<String, dynamic> toJson();






}

/// @nodoc
abstract mixin class $SeriHareketleriRequestModelCopyWith<$Res>  {
  factory $SeriHareketleriRequestModelCopyWith(SeriHareketleriRequestModel value, $Res Function(SeriHareketleriRequestModel) _then) = _$SeriHareketleriRequestModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "StokKodu") String? stokKodu,@JsonKey(name: "SeriNo") String? seriNo,@JsonKey(name: "Sirala", defaultValue: "TARIH_ZA") String? sirala,@JsonKey(name: "BelgeNo") String? belgeNo,@JsonKey(name: "BelgeTipi") String? belgeTipi,@JsonKey(name: "HareketID") int? hareketId,@JsonKey(name: "TempGetir") String? tempGetir
});




}
/// @nodoc
class _$SeriHareketleriRequestModelCopyWithImpl<$Res>
    implements $SeriHareketleriRequestModelCopyWith<$Res> {
  _$SeriHareketleriRequestModelCopyWithImpl(this._self, this._then);

  final SeriHareketleriRequestModel _self;
  final $Res Function(SeriHareketleriRequestModel) _then;

/// Create a copy of SeriHareketleriRequestModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? stokKodu = freezed,Object? seriNo = freezed,Object? sirala = freezed,Object? belgeNo = freezed,Object? belgeTipi = freezed,Object? hareketId = freezed,Object? tempGetir = freezed,}) {
  return _then(_self.copyWith(
stokKodu: freezed == stokKodu ? _self.stokKodu : stokKodu // ignore: cast_nullable_to_non_nullable
as String?,seriNo: freezed == seriNo ? _self.seriNo : seriNo // ignore: cast_nullable_to_non_nullable
as String?,sirala: freezed == sirala ? _self.sirala : sirala // ignore: cast_nullable_to_non_nullable
as String?,belgeNo: freezed == belgeNo ? _self.belgeNo : belgeNo // ignore: cast_nullable_to_non_nullable
as String?,belgeTipi: freezed == belgeTipi ? _self.belgeTipi : belgeTipi // ignore: cast_nullable_to_non_nullable
as String?,hareketId: freezed == hareketId ? _self.hareketId : hareketId // ignore: cast_nullable_to_non_nullable
as int?,tempGetir: freezed == tempGetir ? _self.tempGetir : tempGetir // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [SeriHareketleriRequestModel].
extension SeriHareketleriRequestModelPatterns on SeriHareketleriRequestModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SeriHareketleriRequestModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SeriHareketleriRequestModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SeriHareketleriRequestModel value)  $default,){
final _that = this;
switch (_that) {
case _SeriHareketleriRequestModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SeriHareketleriRequestModel value)?  $default,){
final _that = this;
switch (_that) {
case _SeriHareketleriRequestModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "StokKodu")  String? stokKodu, @JsonKey(name: "SeriNo")  String? seriNo, @JsonKey(name: "Sirala", defaultValue: "TARIH_ZA")  String? sirala, @JsonKey(name: "BelgeNo")  String? belgeNo, @JsonKey(name: "BelgeTipi")  String? belgeTipi, @JsonKey(name: "HareketID")  int? hareketId, @JsonKey(name: "TempGetir")  String? tempGetir)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SeriHareketleriRequestModel() when $default != null:
return $default(_that.stokKodu,_that.seriNo,_that.sirala,_that.belgeNo,_that.belgeTipi,_that.hareketId,_that.tempGetir);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "StokKodu")  String? stokKodu, @JsonKey(name: "SeriNo")  String? seriNo, @JsonKey(name: "Sirala", defaultValue: "TARIH_ZA")  String? sirala, @JsonKey(name: "BelgeNo")  String? belgeNo, @JsonKey(name: "BelgeTipi")  String? belgeTipi, @JsonKey(name: "HareketID")  int? hareketId, @JsonKey(name: "TempGetir")  String? tempGetir)  $default,) {final _that = this;
switch (_that) {
case _SeriHareketleriRequestModel():
return $default(_that.stokKodu,_that.seriNo,_that.sirala,_that.belgeNo,_that.belgeTipi,_that.hareketId,_that.tempGetir);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "StokKodu")  String? stokKodu, @JsonKey(name: "SeriNo")  String? seriNo, @JsonKey(name: "Sirala", defaultValue: "TARIH_ZA")  String? sirala, @JsonKey(name: "BelgeNo")  String? belgeNo, @JsonKey(name: "BelgeTipi")  String? belgeTipi, @JsonKey(name: "HareketID")  int? hareketId, @JsonKey(name: "TempGetir")  String? tempGetir)?  $default,) {final _that = this;
switch (_that) {
case _SeriHareketleriRequestModel() when $default != null:
return $default(_that.stokKodu,_that.seriNo,_that.sirala,_that.belgeNo,_that.belgeTipi,_that.hareketId,_that.tempGetir);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SeriHareketleriRequestModel implements SeriHareketleriRequestModel {
   _SeriHareketleriRequestModel({@JsonKey(name: "StokKodu") this.stokKodu, @JsonKey(name: "SeriNo") this.seriNo, @JsonKey(name: "Sirala", defaultValue: "TARIH_ZA") this.sirala, @JsonKey(name: "BelgeNo") this.belgeNo, @JsonKey(name: "BelgeTipi") this.belgeTipi, @JsonKey(name: "HareketID") this.hareketId, @JsonKey(name: "TempGetir") this.tempGetir});
  factory _SeriHareketleriRequestModel.fromJson(Map<String, dynamic> json) => _$SeriHareketleriRequestModelFromJson(json);

@override@JsonKey(name: "StokKodu")  String? stokKodu;
@override@JsonKey(name: "SeriNo")  String? seriNo;
@override@JsonKey(name: "Sirala", defaultValue: "TARIH_ZA")  String? sirala;
@override@JsonKey(name: "BelgeNo")  String? belgeNo;
@override@JsonKey(name: "BelgeTipi")  String? belgeTipi;
@override@JsonKey(name: "HareketID")  int? hareketId;
@override@JsonKey(name: "TempGetir")  String? tempGetir;

/// Create a copy of SeriHareketleriRequestModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SeriHareketleriRequestModelCopyWith<_SeriHareketleriRequestModel> get copyWith => __$SeriHareketleriRequestModelCopyWithImpl<_SeriHareketleriRequestModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SeriHareketleriRequestModelToJson(this, );
}





}

/// @nodoc
abstract mixin class _$SeriHareketleriRequestModelCopyWith<$Res> implements $SeriHareketleriRequestModelCopyWith<$Res> {
  factory _$SeriHareketleriRequestModelCopyWith(_SeriHareketleriRequestModel value, $Res Function(_SeriHareketleriRequestModel) _then) = __$SeriHareketleriRequestModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "StokKodu") String? stokKodu,@JsonKey(name: "SeriNo") String? seriNo,@JsonKey(name: "Sirala", defaultValue: "TARIH_ZA") String? sirala,@JsonKey(name: "BelgeNo") String? belgeNo,@JsonKey(name: "BelgeTipi") String? belgeTipi,@JsonKey(name: "HareketID") int? hareketId,@JsonKey(name: "TempGetir") String? tempGetir
});




}
/// @nodoc
class __$SeriHareketleriRequestModelCopyWithImpl<$Res>
    implements _$SeriHareketleriRequestModelCopyWith<$Res> {
  __$SeriHareketleriRequestModelCopyWithImpl(this._self, this._then);

  final _SeriHareketleriRequestModel _self;
  final $Res Function(_SeriHareketleriRequestModel) _then;

/// Create a copy of SeriHareketleriRequestModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? stokKodu = freezed,Object? seriNo = freezed,Object? sirala = freezed,Object? belgeNo = freezed,Object? belgeTipi = freezed,Object? hareketId = freezed,Object? tempGetir = freezed,}) {
  return _then(_SeriHareketleriRequestModel(
stokKodu: freezed == stokKodu ? _self.stokKodu : stokKodu // ignore: cast_nullable_to_non_nullable
as String?,seriNo: freezed == seriNo ? _self.seriNo : seriNo // ignore: cast_nullable_to_non_nullable
as String?,sirala: freezed == sirala ? _self.sirala : sirala // ignore: cast_nullable_to_non_nullable
as String?,belgeNo: freezed == belgeNo ? _self.belgeNo : belgeNo // ignore: cast_nullable_to_non_nullable
as String?,belgeTipi: freezed == belgeTipi ? _self.belgeTipi : belgeTipi // ignore: cast_nullable_to_non_nullable
as String?,hareketId: freezed == hareketId ? _self.hareketId : hareketId // ignore: cast_nullable_to_non_nullable
as int?,tempGetir: freezed == tempGetir ? _self.tempGetir : tempGetir // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
