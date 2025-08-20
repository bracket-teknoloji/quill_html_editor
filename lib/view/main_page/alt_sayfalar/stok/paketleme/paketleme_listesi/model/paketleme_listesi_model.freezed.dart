// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'paketleme_listesi_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PaketlemeListesiModel {

 int? get id; String? get kodu; int? get kalemSayisi; DateTime? get kayittarihi; String? get kayityapankul; int? get depoKodu; int? get paketTuru; String? get paketTuruTanimi; String? get kilit; String? get ukey;
/// Create a copy of PaketlemeListesiModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PaketlemeListesiModelCopyWith<PaketlemeListesiModel> get copyWith => _$PaketlemeListesiModelCopyWithImpl<PaketlemeListesiModel>(this as PaketlemeListesiModel, _$identity);

  /// Serializes this PaketlemeListesiModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PaketlemeListesiModel&&super == other&&(identical(other.id, id) || other.id == id)&&(identical(other.kodu, kodu) || other.kodu == kodu)&&(identical(other.kalemSayisi, kalemSayisi) || other.kalemSayisi == kalemSayisi)&&(identical(other.kayittarihi, kayittarihi) || other.kayittarihi == kayittarihi)&&(identical(other.kayityapankul, kayityapankul) || other.kayityapankul == kayityapankul)&&(identical(other.depoKodu, depoKodu) || other.depoKodu == depoKodu)&&(identical(other.paketTuru, paketTuru) || other.paketTuru == paketTuru)&&(identical(other.paketTuruTanimi, paketTuruTanimi) || other.paketTuruTanimi == paketTuruTanimi)&&(identical(other.kilit, kilit) || other.kilit == kilit)&&(identical(other.ukey, ukey) || other.ukey == ukey));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,kodu,kalemSayisi,kayittarihi,kayityapankul,depoKodu,paketTuru,paketTuruTanimi,kilit,ukey);



}

/// @nodoc
abstract mixin class $PaketlemeListesiModelCopyWith<$Res>  {
  factory $PaketlemeListesiModelCopyWith(PaketlemeListesiModel value, $Res Function(PaketlemeListesiModel) _then) = _$PaketlemeListesiModelCopyWithImpl;
@useResult
$Res call({
 int? id, String? kodu, int? kalemSayisi, DateTime? kayittarihi, String? kayityapankul, int? depoKodu, int? paketTuru, String? paketTuruTanimi, String? kilit, String? ukey
});




}
/// @nodoc
class _$PaketlemeListesiModelCopyWithImpl<$Res>
    implements $PaketlemeListesiModelCopyWith<$Res> {
  _$PaketlemeListesiModelCopyWithImpl(this._self, this._then);

  final PaketlemeListesiModel _self;
  final $Res Function(PaketlemeListesiModel) _then;

/// Create a copy of PaketlemeListesiModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? kodu = freezed,Object? kalemSayisi = freezed,Object? kayittarihi = freezed,Object? kayityapankul = freezed,Object? depoKodu = freezed,Object? paketTuru = freezed,Object? paketTuruTanimi = freezed,Object? kilit = freezed,Object? ukey = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,kodu: freezed == kodu ? _self.kodu : kodu // ignore: cast_nullable_to_non_nullable
as String?,kalemSayisi: freezed == kalemSayisi ? _self.kalemSayisi : kalemSayisi // ignore: cast_nullable_to_non_nullable
as int?,kayittarihi: freezed == kayittarihi ? _self.kayittarihi : kayittarihi // ignore: cast_nullable_to_non_nullable
as DateTime?,kayityapankul: freezed == kayityapankul ? _self.kayityapankul : kayityapankul // ignore: cast_nullable_to_non_nullable
as String?,depoKodu: freezed == depoKodu ? _self.depoKodu : depoKodu // ignore: cast_nullable_to_non_nullable
as int?,paketTuru: freezed == paketTuru ? _self.paketTuru : paketTuru // ignore: cast_nullable_to_non_nullable
as int?,paketTuruTanimi: freezed == paketTuruTanimi ? _self.paketTuruTanimi : paketTuruTanimi // ignore: cast_nullable_to_non_nullable
as String?,kilit: freezed == kilit ? _self.kilit : kilit // ignore: cast_nullable_to_non_nullable
as String?,ukey: freezed == ukey ? _self.ukey : ukey // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [PaketlemeListesiModel].
extension PaketlemeListesiModelPatterns on PaketlemeListesiModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PaketlemeListesiModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PaketlemeListesiModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PaketlemeListesiModel value)  $default,){
final _that = this;
switch (_that) {
case _PaketlemeListesiModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PaketlemeListesiModel value)?  $default,){
final _that = this;
switch (_that) {
case _PaketlemeListesiModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? id,  String? kodu,  int? kalemSayisi,  DateTime? kayittarihi,  String? kayityapankul,  int? depoKodu,  int? paketTuru,  String? paketTuruTanimi,  String? kilit,  String? ukey)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PaketlemeListesiModel() when $default != null:
return $default(_that.id,_that.kodu,_that.kalemSayisi,_that.kayittarihi,_that.kayityapankul,_that.depoKodu,_that.paketTuru,_that.paketTuruTanimi,_that.kilit,_that.ukey);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? id,  String? kodu,  int? kalemSayisi,  DateTime? kayittarihi,  String? kayityapankul,  int? depoKodu,  int? paketTuru,  String? paketTuruTanimi,  String? kilit,  String? ukey)  $default,) {final _that = this;
switch (_that) {
case _PaketlemeListesiModel():
return $default(_that.id,_that.kodu,_that.kalemSayisi,_that.kayittarihi,_that.kayityapankul,_that.depoKodu,_that.paketTuru,_that.paketTuruTanimi,_that.kilit,_that.ukey);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? id,  String? kodu,  int? kalemSayisi,  DateTime? kayittarihi,  String? kayityapankul,  int? depoKodu,  int? paketTuru,  String? paketTuruTanimi,  String? kilit,  String? ukey)?  $default,) {final _that = this;
switch (_that) {
case _PaketlemeListesiModel() when $default != null:
return $default(_that.id,_that.kodu,_that.kalemSayisi,_that.kayittarihi,_that.kayityapankul,_that.depoKodu,_that.paketTuru,_that.paketTuruTanimi,_that.kilit,_that.ukey);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PaketlemeListesiModel extends PaketlemeListesiModel {
   _PaketlemeListesiModel({this.id, this.kodu, this.kalemSayisi, this.kayittarihi, this.kayityapankul, this.depoKodu, this.paketTuru, this.paketTuruTanimi, this.kilit, this.ukey}): super._();
  factory _PaketlemeListesiModel.fromJson(Map<String, dynamic> json) => _$PaketlemeListesiModelFromJson(json);

@override final  int? id;
@override final  String? kodu;
@override final  int? kalemSayisi;
@override final  DateTime? kayittarihi;
@override final  String? kayityapankul;
@override final  int? depoKodu;
@override final  int? paketTuru;
@override final  String? paketTuruTanimi;
@override final  String? kilit;
@override final  String? ukey;

/// Create a copy of PaketlemeListesiModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PaketlemeListesiModelCopyWith<_PaketlemeListesiModel> get copyWith => __$PaketlemeListesiModelCopyWithImpl<_PaketlemeListesiModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PaketlemeListesiModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PaketlemeListesiModel&&super == other&&(identical(other.id, id) || other.id == id)&&(identical(other.kodu, kodu) || other.kodu == kodu)&&(identical(other.kalemSayisi, kalemSayisi) || other.kalemSayisi == kalemSayisi)&&(identical(other.kayittarihi, kayittarihi) || other.kayittarihi == kayittarihi)&&(identical(other.kayityapankul, kayityapankul) || other.kayityapankul == kayityapankul)&&(identical(other.depoKodu, depoKodu) || other.depoKodu == depoKodu)&&(identical(other.paketTuru, paketTuru) || other.paketTuru == paketTuru)&&(identical(other.paketTuruTanimi, paketTuruTanimi) || other.paketTuruTanimi == paketTuruTanimi)&&(identical(other.kilit, kilit) || other.kilit == kilit)&&(identical(other.ukey, ukey) || other.ukey == ukey));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,kodu,kalemSayisi,kayittarihi,kayityapankul,depoKodu,paketTuru,paketTuruTanimi,kilit,ukey);



}

/// @nodoc
abstract mixin class _$PaketlemeListesiModelCopyWith<$Res> implements $PaketlemeListesiModelCopyWith<$Res> {
  factory _$PaketlemeListesiModelCopyWith(_PaketlemeListesiModel value, $Res Function(_PaketlemeListesiModel) _then) = __$PaketlemeListesiModelCopyWithImpl;
@override @useResult
$Res call({
 int? id, String? kodu, int? kalemSayisi, DateTime? kayittarihi, String? kayityapankul, int? depoKodu, int? paketTuru, String? paketTuruTanimi, String? kilit, String? ukey
});




}
/// @nodoc
class __$PaketlemeListesiModelCopyWithImpl<$Res>
    implements _$PaketlemeListesiModelCopyWith<$Res> {
  __$PaketlemeListesiModelCopyWithImpl(this._self, this._then);

  final _PaketlemeListesiModel _self;
  final $Res Function(_PaketlemeListesiModel) _then;

/// Create a copy of PaketlemeListesiModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? kodu = freezed,Object? kalemSayisi = freezed,Object? kayittarihi = freezed,Object? kayityapankul = freezed,Object? depoKodu = freezed,Object? paketTuru = freezed,Object? paketTuruTanimi = freezed,Object? kilit = freezed,Object? ukey = freezed,}) {
  return _then(_PaketlemeListesiModel(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,kodu: freezed == kodu ? _self.kodu : kodu // ignore: cast_nullable_to_non_nullable
as String?,kalemSayisi: freezed == kalemSayisi ? _self.kalemSayisi : kalemSayisi // ignore: cast_nullable_to_non_nullable
as int?,kayittarihi: freezed == kayittarihi ? _self.kayittarihi : kayittarihi // ignore: cast_nullable_to_non_nullable
as DateTime?,kayityapankul: freezed == kayityapankul ? _self.kayityapankul : kayityapankul // ignore: cast_nullable_to_non_nullable
as String?,depoKodu: freezed == depoKodu ? _self.depoKodu : depoKodu // ignore: cast_nullable_to_non_nullable
as int?,paketTuru: freezed == paketTuru ? _self.paketTuru : paketTuru // ignore: cast_nullable_to_non_nullable
as int?,paketTuruTanimi: freezed == paketTuruTanimi ? _self.paketTuruTanimi : paketTuruTanimi // ignore: cast_nullable_to_non_nullable
as String?,kilit: freezed == kilit ? _self.kilit : kilit // ignore: cast_nullable_to_non_nullable
as String?,ukey: freezed == ukey ? _self.ukey : ukey // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
