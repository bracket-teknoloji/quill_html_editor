// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'paketleme_listesi_request_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PaketlemeListesiRequestModel {

@JsonKey(name: "ID") int? get id; String? get stokKodu; String? get belgeNo; String? get menuKodu; int? get depoKodu; String? get paketKodu; int? get islemKodu; String? get kisitYok; String? get ekranTipi;@JsonKey(name: "PaketID") int? get paketId;
/// Create a copy of PaketlemeListesiRequestModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PaketlemeListesiRequestModelCopyWith<PaketlemeListesiRequestModel> get copyWith => _$PaketlemeListesiRequestModelCopyWithImpl<PaketlemeListesiRequestModel>(this as PaketlemeListesiRequestModel, _$identity);

  /// Serializes this PaketlemeListesiRequestModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PaketlemeListesiRequestModel&&(identical(other.id, id) || other.id == id)&&(identical(other.stokKodu, stokKodu) || other.stokKodu == stokKodu)&&(identical(other.belgeNo, belgeNo) || other.belgeNo == belgeNo)&&(identical(other.menuKodu, menuKodu) || other.menuKodu == menuKodu)&&(identical(other.depoKodu, depoKodu) || other.depoKodu == depoKodu)&&(identical(other.paketKodu, paketKodu) || other.paketKodu == paketKodu)&&(identical(other.islemKodu, islemKodu) || other.islemKodu == islemKodu)&&(identical(other.kisitYok, kisitYok) || other.kisitYok == kisitYok)&&(identical(other.ekranTipi, ekranTipi) || other.ekranTipi == ekranTipi)&&(identical(other.paketId, paketId) || other.paketId == paketId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,stokKodu,belgeNo,menuKodu,depoKodu,paketKodu,islemKodu,kisitYok,ekranTipi,paketId);



}

/// @nodoc
abstract mixin class $PaketlemeListesiRequestModelCopyWith<$Res>  {
  factory $PaketlemeListesiRequestModelCopyWith(PaketlemeListesiRequestModel value, $Res Function(PaketlemeListesiRequestModel) _then) = _$PaketlemeListesiRequestModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "ID") int? id, String? stokKodu, String? belgeNo, String? menuKodu, int? depoKodu, String? paketKodu, int? islemKodu, String? kisitYok, String? ekranTipi,@JsonKey(name: "PaketID") int? paketId
});




}
/// @nodoc
class _$PaketlemeListesiRequestModelCopyWithImpl<$Res>
    implements $PaketlemeListesiRequestModelCopyWith<$Res> {
  _$PaketlemeListesiRequestModelCopyWithImpl(this._self, this._then);

  final PaketlemeListesiRequestModel _self;
  final $Res Function(PaketlemeListesiRequestModel) _then;

/// Create a copy of PaketlemeListesiRequestModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? stokKodu = freezed,Object? belgeNo = freezed,Object? menuKodu = freezed,Object? depoKodu = freezed,Object? paketKodu = freezed,Object? islemKodu = freezed,Object? kisitYok = freezed,Object? ekranTipi = freezed,Object? paketId = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,stokKodu: freezed == stokKodu ? _self.stokKodu : stokKodu // ignore: cast_nullable_to_non_nullable
as String?,belgeNo: freezed == belgeNo ? _self.belgeNo : belgeNo // ignore: cast_nullable_to_non_nullable
as String?,menuKodu: freezed == menuKodu ? _self.menuKodu : menuKodu // ignore: cast_nullable_to_non_nullable
as String?,depoKodu: freezed == depoKodu ? _self.depoKodu : depoKodu // ignore: cast_nullable_to_non_nullable
as int?,paketKodu: freezed == paketKodu ? _self.paketKodu : paketKodu // ignore: cast_nullable_to_non_nullable
as String?,islemKodu: freezed == islemKodu ? _self.islemKodu : islemKodu // ignore: cast_nullable_to_non_nullable
as int?,kisitYok: freezed == kisitYok ? _self.kisitYok : kisitYok // ignore: cast_nullable_to_non_nullable
as String?,ekranTipi: freezed == ekranTipi ? _self.ekranTipi : ekranTipi // ignore: cast_nullable_to_non_nullable
as String?,paketId: freezed == paketId ? _self.paketId : paketId // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [PaketlemeListesiRequestModel].
extension PaketlemeListesiRequestModelPatterns on PaketlemeListesiRequestModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PaketlemeListesiRequestModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PaketlemeListesiRequestModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PaketlemeListesiRequestModel value)  $default,){
final _that = this;
switch (_that) {
case _PaketlemeListesiRequestModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PaketlemeListesiRequestModel value)?  $default,){
final _that = this;
switch (_that) {
case _PaketlemeListesiRequestModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "ID")  int? id,  String? stokKodu,  String? belgeNo,  String? menuKodu,  int? depoKodu,  String? paketKodu,  int? islemKodu,  String? kisitYok,  String? ekranTipi, @JsonKey(name: "PaketID")  int? paketId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PaketlemeListesiRequestModel() when $default != null:
return $default(_that.id,_that.stokKodu,_that.belgeNo,_that.menuKodu,_that.depoKodu,_that.paketKodu,_that.islemKodu,_that.kisitYok,_that.ekranTipi,_that.paketId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "ID")  int? id,  String? stokKodu,  String? belgeNo,  String? menuKodu,  int? depoKodu,  String? paketKodu,  int? islemKodu,  String? kisitYok,  String? ekranTipi, @JsonKey(name: "PaketID")  int? paketId)  $default,) {final _that = this;
switch (_that) {
case _PaketlemeListesiRequestModel():
return $default(_that.id,_that.stokKodu,_that.belgeNo,_that.menuKodu,_that.depoKodu,_that.paketKodu,_that.islemKodu,_that.kisitYok,_that.ekranTipi,_that.paketId);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "ID")  int? id,  String? stokKodu,  String? belgeNo,  String? menuKodu,  int? depoKodu,  String? paketKodu,  int? islemKodu,  String? kisitYok,  String? ekranTipi, @JsonKey(name: "PaketID")  int? paketId)?  $default,) {final _that = this;
switch (_that) {
case _PaketlemeListesiRequestModel() when $default != null:
return $default(_that.id,_that.stokKodu,_that.belgeNo,_that.menuKodu,_that.depoKodu,_that.paketKodu,_that.islemKodu,_that.kisitYok,_that.ekranTipi,_that.paketId);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.pascal)
class _PaketlemeListesiRequestModel implements PaketlemeListesiRequestModel {
   _PaketlemeListesiRequestModel({@JsonKey(name: "ID") this.id, this.stokKodu, this.belgeNo, this.menuKodu, this.depoKodu, this.paketKodu, this.islemKodu, this.kisitYok, this.ekranTipi, @JsonKey(name: "PaketID") this.paketId});
  factory _PaketlemeListesiRequestModel.fromJson(Map<String, dynamic> json) => _$PaketlemeListesiRequestModelFromJson(json);

@override@JsonKey(name: "ID") final  int? id;
@override final  String? stokKodu;
@override final  String? belgeNo;
@override final  String? menuKodu;
@override final  int? depoKodu;
@override final  String? paketKodu;
@override final  int? islemKodu;
@override final  String? kisitYok;
@override final  String? ekranTipi;
@override@JsonKey(name: "PaketID") final  int? paketId;

/// Create a copy of PaketlemeListesiRequestModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PaketlemeListesiRequestModelCopyWith<_PaketlemeListesiRequestModel> get copyWith => __$PaketlemeListesiRequestModelCopyWithImpl<_PaketlemeListesiRequestModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PaketlemeListesiRequestModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PaketlemeListesiRequestModel&&(identical(other.id, id) || other.id == id)&&(identical(other.stokKodu, stokKodu) || other.stokKodu == stokKodu)&&(identical(other.belgeNo, belgeNo) || other.belgeNo == belgeNo)&&(identical(other.menuKodu, menuKodu) || other.menuKodu == menuKodu)&&(identical(other.depoKodu, depoKodu) || other.depoKodu == depoKodu)&&(identical(other.paketKodu, paketKodu) || other.paketKodu == paketKodu)&&(identical(other.islemKodu, islemKodu) || other.islemKodu == islemKodu)&&(identical(other.kisitYok, kisitYok) || other.kisitYok == kisitYok)&&(identical(other.ekranTipi, ekranTipi) || other.ekranTipi == ekranTipi)&&(identical(other.paketId, paketId) || other.paketId == paketId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,stokKodu,belgeNo,menuKodu,depoKodu,paketKodu,islemKodu,kisitYok,ekranTipi,paketId);



}

/// @nodoc
abstract mixin class _$PaketlemeListesiRequestModelCopyWith<$Res> implements $PaketlemeListesiRequestModelCopyWith<$Res> {
  factory _$PaketlemeListesiRequestModelCopyWith(_PaketlemeListesiRequestModel value, $Res Function(_PaketlemeListesiRequestModel) _then) = __$PaketlemeListesiRequestModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "ID") int? id, String? stokKodu, String? belgeNo, String? menuKodu, int? depoKodu, String? paketKodu, int? islemKodu, String? kisitYok, String? ekranTipi,@JsonKey(name: "PaketID") int? paketId
});




}
/// @nodoc
class __$PaketlemeListesiRequestModelCopyWithImpl<$Res>
    implements _$PaketlemeListesiRequestModelCopyWith<$Res> {
  __$PaketlemeListesiRequestModelCopyWithImpl(this._self, this._then);

  final _PaketlemeListesiRequestModel _self;
  final $Res Function(_PaketlemeListesiRequestModel) _then;

/// Create a copy of PaketlemeListesiRequestModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? stokKodu = freezed,Object? belgeNo = freezed,Object? menuKodu = freezed,Object? depoKodu = freezed,Object? paketKodu = freezed,Object? islemKodu = freezed,Object? kisitYok = freezed,Object? ekranTipi = freezed,Object? paketId = freezed,}) {
  return _then(_PaketlemeListesiRequestModel(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,stokKodu: freezed == stokKodu ? _self.stokKodu : stokKodu // ignore: cast_nullable_to_non_nullable
as String?,belgeNo: freezed == belgeNo ? _self.belgeNo : belgeNo // ignore: cast_nullable_to_non_nullable
as String?,menuKodu: freezed == menuKodu ? _self.menuKodu : menuKodu // ignore: cast_nullable_to_non_nullable
as String?,depoKodu: freezed == depoKodu ? _self.depoKodu : depoKodu // ignore: cast_nullable_to_non_nullable
as int?,paketKodu: freezed == paketKodu ? _self.paketKodu : paketKodu // ignore: cast_nullable_to_non_nullable
as String?,islemKodu: freezed == islemKodu ? _self.islemKodu : islemKodu // ignore: cast_nullable_to_non_nullable
as int?,kisitYok: freezed == kisitYok ? _self.kisitYok : kisitYok // ignore: cast_nullable_to_non_nullable
as String?,ekranTipi: freezed == ekranTipi ? _self.ekranTipi : ekranTipi // ignore: cast_nullable_to_non_nullable
as String?,paketId: freezed == paketId ? _self.paketId : paketId // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

// dart format on
