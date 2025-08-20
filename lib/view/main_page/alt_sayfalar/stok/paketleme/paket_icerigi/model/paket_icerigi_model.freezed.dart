// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'paket_icerigi_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PaketIcerigiModel {

 int? get id; int? get paketId; String? get paketKodu; int? get depoKodu; String? get depoAdi; String? get stokKodu; String? get stokAdi; double? get miktar; String? get cikistaSeri; String? get seriMiktarKadar; String? get seriBakiyeKontrol; String? get seriCikistaOtomatik; List<SeriList>? get seriList;
/// Create a copy of PaketIcerigiModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PaketIcerigiModelCopyWith<PaketIcerigiModel> get copyWith => _$PaketIcerigiModelCopyWithImpl<PaketIcerigiModel>(this as PaketIcerigiModel, _$identity);

  /// Serializes this PaketIcerigiModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PaketIcerigiModel&&super == other&&(identical(other.id, id) || other.id == id)&&(identical(other.paketId, paketId) || other.paketId == paketId)&&(identical(other.paketKodu, paketKodu) || other.paketKodu == paketKodu)&&(identical(other.depoKodu, depoKodu) || other.depoKodu == depoKodu)&&(identical(other.depoAdi, depoAdi) || other.depoAdi == depoAdi)&&(identical(other.stokKodu, stokKodu) || other.stokKodu == stokKodu)&&(identical(other.stokAdi, stokAdi) || other.stokAdi == stokAdi)&&(identical(other.miktar, miktar) || other.miktar == miktar)&&(identical(other.cikistaSeri, cikistaSeri) || other.cikistaSeri == cikistaSeri)&&(identical(other.seriMiktarKadar, seriMiktarKadar) || other.seriMiktarKadar == seriMiktarKadar)&&(identical(other.seriBakiyeKontrol, seriBakiyeKontrol) || other.seriBakiyeKontrol == seriBakiyeKontrol)&&(identical(other.seriCikistaOtomatik, seriCikistaOtomatik) || other.seriCikistaOtomatik == seriCikistaOtomatik)&&const DeepCollectionEquality().equals(other.seriList, seriList));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,paketId,paketKodu,depoKodu,depoAdi,stokKodu,stokAdi,miktar,cikistaSeri,seriMiktarKadar,seriBakiyeKontrol,seriCikistaOtomatik,const DeepCollectionEquality().hash(seriList));



}

/// @nodoc
abstract mixin class $PaketIcerigiModelCopyWith<$Res>  {
  factory $PaketIcerigiModelCopyWith(PaketIcerigiModel value, $Res Function(PaketIcerigiModel) _then) = _$PaketIcerigiModelCopyWithImpl;
@useResult
$Res call({
 int? id, int? paketId, String? paketKodu, int? depoKodu, String? depoAdi, String? stokKodu, String? stokAdi, double? miktar, String? cikistaSeri, String? seriMiktarKadar, String? seriBakiyeKontrol, String? seriCikistaOtomatik, List<SeriList>? seriList
});




}
/// @nodoc
class _$PaketIcerigiModelCopyWithImpl<$Res>
    implements $PaketIcerigiModelCopyWith<$Res> {
  _$PaketIcerigiModelCopyWithImpl(this._self, this._then);

  final PaketIcerigiModel _self;
  final $Res Function(PaketIcerigiModel) _then;

/// Create a copy of PaketIcerigiModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? paketId = freezed,Object? paketKodu = freezed,Object? depoKodu = freezed,Object? depoAdi = freezed,Object? stokKodu = freezed,Object? stokAdi = freezed,Object? miktar = freezed,Object? cikistaSeri = freezed,Object? seriMiktarKadar = freezed,Object? seriBakiyeKontrol = freezed,Object? seriCikistaOtomatik = freezed,Object? seriList = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,paketId: freezed == paketId ? _self.paketId : paketId // ignore: cast_nullable_to_non_nullable
as int?,paketKodu: freezed == paketKodu ? _self.paketKodu : paketKodu // ignore: cast_nullable_to_non_nullable
as String?,depoKodu: freezed == depoKodu ? _self.depoKodu : depoKodu // ignore: cast_nullable_to_non_nullable
as int?,depoAdi: freezed == depoAdi ? _self.depoAdi : depoAdi // ignore: cast_nullable_to_non_nullable
as String?,stokKodu: freezed == stokKodu ? _self.stokKodu : stokKodu // ignore: cast_nullable_to_non_nullable
as String?,stokAdi: freezed == stokAdi ? _self.stokAdi : stokAdi // ignore: cast_nullable_to_non_nullable
as String?,miktar: freezed == miktar ? _self.miktar : miktar // ignore: cast_nullable_to_non_nullable
as double?,cikistaSeri: freezed == cikistaSeri ? _self.cikistaSeri : cikistaSeri // ignore: cast_nullable_to_non_nullable
as String?,seriMiktarKadar: freezed == seriMiktarKadar ? _self.seriMiktarKadar : seriMiktarKadar // ignore: cast_nullable_to_non_nullable
as String?,seriBakiyeKontrol: freezed == seriBakiyeKontrol ? _self.seriBakiyeKontrol : seriBakiyeKontrol // ignore: cast_nullable_to_non_nullable
as String?,seriCikistaOtomatik: freezed == seriCikistaOtomatik ? _self.seriCikistaOtomatik : seriCikistaOtomatik // ignore: cast_nullable_to_non_nullable
as String?,seriList: freezed == seriList ? _self.seriList : seriList // ignore: cast_nullable_to_non_nullable
as List<SeriList>?,
  ));
}

}


/// Adds pattern-matching-related methods to [PaketIcerigiModel].
extension PaketIcerigiModelPatterns on PaketIcerigiModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PaketIcerigiModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PaketIcerigiModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PaketIcerigiModel value)  $default,){
final _that = this;
switch (_that) {
case _PaketIcerigiModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PaketIcerigiModel value)?  $default,){
final _that = this;
switch (_that) {
case _PaketIcerigiModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? id,  int? paketId,  String? paketKodu,  int? depoKodu,  String? depoAdi,  String? stokKodu,  String? stokAdi,  double? miktar,  String? cikistaSeri,  String? seriMiktarKadar,  String? seriBakiyeKontrol,  String? seriCikistaOtomatik,  List<SeriList>? seriList)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PaketIcerigiModel() when $default != null:
return $default(_that.id,_that.paketId,_that.paketKodu,_that.depoKodu,_that.depoAdi,_that.stokKodu,_that.stokAdi,_that.miktar,_that.cikistaSeri,_that.seriMiktarKadar,_that.seriBakiyeKontrol,_that.seriCikistaOtomatik,_that.seriList);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? id,  int? paketId,  String? paketKodu,  int? depoKodu,  String? depoAdi,  String? stokKodu,  String? stokAdi,  double? miktar,  String? cikistaSeri,  String? seriMiktarKadar,  String? seriBakiyeKontrol,  String? seriCikistaOtomatik,  List<SeriList>? seriList)  $default,) {final _that = this;
switch (_that) {
case _PaketIcerigiModel():
return $default(_that.id,_that.paketId,_that.paketKodu,_that.depoKodu,_that.depoAdi,_that.stokKodu,_that.stokAdi,_that.miktar,_that.cikistaSeri,_that.seriMiktarKadar,_that.seriBakiyeKontrol,_that.seriCikistaOtomatik,_that.seriList);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? id,  int? paketId,  String? paketKodu,  int? depoKodu,  String? depoAdi,  String? stokKodu,  String? stokAdi,  double? miktar,  String? cikistaSeri,  String? seriMiktarKadar,  String? seriBakiyeKontrol,  String? seriCikistaOtomatik,  List<SeriList>? seriList)?  $default,) {final _that = this;
switch (_that) {
case _PaketIcerigiModel() when $default != null:
return $default(_that.id,_that.paketId,_that.paketKodu,_that.depoKodu,_that.depoAdi,_that.stokKodu,_that.stokAdi,_that.miktar,_that.cikistaSeri,_that.seriMiktarKadar,_that.seriBakiyeKontrol,_that.seriCikistaOtomatik,_that.seriList);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PaketIcerigiModel extends PaketIcerigiModel {
   _PaketIcerigiModel({this.id, this.paketId, this.paketKodu, this.depoKodu, this.depoAdi, this.stokKodu, this.stokAdi, this.miktar, this.cikistaSeri, this.seriMiktarKadar, this.seriBakiyeKontrol, this.seriCikistaOtomatik, final  List<SeriList>? seriList}): _seriList = seriList,super._();
  factory _PaketIcerigiModel.fromJson(Map<String, dynamic> json) => _$PaketIcerigiModelFromJson(json);

@override final  int? id;
@override final  int? paketId;
@override final  String? paketKodu;
@override final  int? depoKodu;
@override final  String? depoAdi;
@override final  String? stokKodu;
@override final  String? stokAdi;
@override final  double? miktar;
@override final  String? cikistaSeri;
@override final  String? seriMiktarKadar;
@override final  String? seriBakiyeKontrol;
@override final  String? seriCikistaOtomatik;
 final  List<SeriList>? _seriList;
@override List<SeriList>? get seriList {
  final value = _seriList;
  if (value == null) return null;
  if (_seriList is EqualUnmodifiableListView) return _seriList;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of PaketIcerigiModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PaketIcerigiModelCopyWith<_PaketIcerigiModel> get copyWith => __$PaketIcerigiModelCopyWithImpl<_PaketIcerigiModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PaketIcerigiModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PaketIcerigiModel&&super == other&&(identical(other.id, id) || other.id == id)&&(identical(other.paketId, paketId) || other.paketId == paketId)&&(identical(other.paketKodu, paketKodu) || other.paketKodu == paketKodu)&&(identical(other.depoKodu, depoKodu) || other.depoKodu == depoKodu)&&(identical(other.depoAdi, depoAdi) || other.depoAdi == depoAdi)&&(identical(other.stokKodu, stokKodu) || other.stokKodu == stokKodu)&&(identical(other.stokAdi, stokAdi) || other.stokAdi == stokAdi)&&(identical(other.miktar, miktar) || other.miktar == miktar)&&(identical(other.cikistaSeri, cikistaSeri) || other.cikistaSeri == cikistaSeri)&&(identical(other.seriMiktarKadar, seriMiktarKadar) || other.seriMiktarKadar == seriMiktarKadar)&&(identical(other.seriBakiyeKontrol, seriBakiyeKontrol) || other.seriBakiyeKontrol == seriBakiyeKontrol)&&(identical(other.seriCikistaOtomatik, seriCikistaOtomatik) || other.seriCikistaOtomatik == seriCikistaOtomatik)&&const DeepCollectionEquality().equals(other._seriList, _seriList));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,paketId,paketKodu,depoKodu,depoAdi,stokKodu,stokAdi,miktar,cikistaSeri,seriMiktarKadar,seriBakiyeKontrol,seriCikistaOtomatik,const DeepCollectionEquality().hash(_seriList));



}

/// @nodoc
abstract mixin class _$PaketIcerigiModelCopyWith<$Res> implements $PaketIcerigiModelCopyWith<$Res> {
  factory _$PaketIcerigiModelCopyWith(_PaketIcerigiModel value, $Res Function(_PaketIcerigiModel) _then) = __$PaketIcerigiModelCopyWithImpl;
@override @useResult
$Res call({
 int? id, int? paketId, String? paketKodu, int? depoKodu, String? depoAdi, String? stokKodu, String? stokAdi, double? miktar, String? cikistaSeri, String? seriMiktarKadar, String? seriBakiyeKontrol, String? seriCikistaOtomatik, List<SeriList>? seriList
});




}
/// @nodoc
class __$PaketIcerigiModelCopyWithImpl<$Res>
    implements _$PaketIcerigiModelCopyWith<$Res> {
  __$PaketIcerigiModelCopyWithImpl(this._self, this._then);

  final _PaketIcerigiModel _self;
  final $Res Function(_PaketIcerigiModel) _then;

/// Create a copy of PaketIcerigiModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? paketId = freezed,Object? paketKodu = freezed,Object? depoKodu = freezed,Object? depoAdi = freezed,Object? stokKodu = freezed,Object? stokAdi = freezed,Object? miktar = freezed,Object? cikistaSeri = freezed,Object? seriMiktarKadar = freezed,Object? seriBakiyeKontrol = freezed,Object? seriCikistaOtomatik = freezed,Object? seriList = freezed,}) {
  return _then(_PaketIcerigiModel(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,paketId: freezed == paketId ? _self.paketId : paketId // ignore: cast_nullable_to_non_nullable
as int?,paketKodu: freezed == paketKodu ? _self.paketKodu : paketKodu // ignore: cast_nullable_to_non_nullable
as String?,depoKodu: freezed == depoKodu ? _self.depoKodu : depoKodu // ignore: cast_nullable_to_non_nullable
as int?,depoAdi: freezed == depoAdi ? _self.depoAdi : depoAdi // ignore: cast_nullable_to_non_nullable
as String?,stokKodu: freezed == stokKodu ? _self.stokKodu : stokKodu // ignore: cast_nullable_to_non_nullable
as String?,stokAdi: freezed == stokAdi ? _self.stokAdi : stokAdi // ignore: cast_nullable_to_non_nullable
as String?,miktar: freezed == miktar ? _self.miktar : miktar // ignore: cast_nullable_to_non_nullable
as double?,cikistaSeri: freezed == cikistaSeri ? _self.cikistaSeri : cikistaSeri // ignore: cast_nullable_to_non_nullable
as String?,seriMiktarKadar: freezed == seriMiktarKadar ? _self.seriMiktarKadar : seriMiktarKadar // ignore: cast_nullable_to_non_nullable
as String?,seriBakiyeKontrol: freezed == seriBakiyeKontrol ? _self.seriBakiyeKontrol : seriBakiyeKontrol // ignore: cast_nullable_to_non_nullable
as String?,seriCikistaOtomatik: freezed == seriCikistaOtomatik ? _self.seriCikistaOtomatik : seriCikistaOtomatik // ignore: cast_nullable_to_non_nullable
as String?,seriList: freezed == seriList ? _self._seriList : seriList // ignore: cast_nullable_to_non_nullable
as List<SeriList>?,
  ));
}


}

// dart format on
