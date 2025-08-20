// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'delete_cek_senet_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DeleteCekSenetModel {

 String? get belgeNo; String? get belgeTipi; int? get islemKodu;@JsonKey(name: "PickerTahsilatTuru") String? get pickerTahsilatTuru; String? get tag;
/// Create a copy of DeleteCekSenetModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DeleteCekSenetModelCopyWith<DeleteCekSenetModel> get copyWith => _$DeleteCekSenetModelCopyWithImpl<DeleteCekSenetModel>(this as DeleteCekSenetModel, _$identity);

  /// Serializes this DeleteCekSenetModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DeleteCekSenetModel&&(identical(other.belgeNo, belgeNo) || other.belgeNo == belgeNo)&&(identical(other.belgeTipi, belgeTipi) || other.belgeTipi == belgeTipi)&&(identical(other.islemKodu, islemKodu) || other.islemKodu == islemKodu)&&(identical(other.pickerTahsilatTuru, pickerTahsilatTuru) || other.pickerTahsilatTuru == pickerTahsilatTuru)&&(identical(other.tag, tag) || other.tag == tag));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,belgeNo,belgeTipi,islemKodu,pickerTahsilatTuru,tag);



}

/// @nodoc
abstract mixin class $DeleteCekSenetModelCopyWith<$Res>  {
  factory $DeleteCekSenetModelCopyWith(DeleteCekSenetModel value, $Res Function(DeleteCekSenetModel) _then) = _$DeleteCekSenetModelCopyWithImpl;
@useResult
$Res call({
 String? belgeNo, String? belgeTipi, int? islemKodu,@JsonKey(name: "PickerTahsilatTuru") String? pickerTahsilatTuru, String? tag
});




}
/// @nodoc
class _$DeleteCekSenetModelCopyWithImpl<$Res>
    implements $DeleteCekSenetModelCopyWith<$Res> {
  _$DeleteCekSenetModelCopyWithImpl(this._self, this._then);

  final DeleteCekSenetModel _self;
  final $Res Function(DeleteCekSenetModel) _then;

/// Create a copy of DeleteCekSenetModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? belgeNo = freezed,Object? belgeTipi = freezed,Object? islemKodu = freezed,Object? pickerTahsilatTuru = freezed,Object? tag = freezed,}) {
  return _then(_self.copyWith(
belgeNo: freezed == belgeNo ? _self.belgeNo : belgeNo // ignore: cast_nullable_to_non_nullable
as String?,belgeTipi: freezed == belgeTipi ? _self.belgeTipi : belgeTipi // ignore: cast_nullable_to_non_nullable
as String?,islemKodu: freezed == islemKodu ? _self.islemKodu : islemKodu // ignore: cast_nullable_to_non_nullable
as int?,pickerTahsilatTuru: freezed == pickerTahsilatTuru ? _self.pickerTahsilatTuru : pickerTahsilatTuru // ignore: cast_nullable_to_non_nullable
as String?,tag: freezed == tag ? _self.tag : tag // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [DeleteCekSenetModel].
extension DeleteCekSenetModelPatterns on DeleteCekSenetModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DeleteCekSenetModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DeleteCekSenetModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DeleteCekSenetModel value)  $default,){
final _that = this;
switch (_that) {
case _DeleteCekSenetModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DeleteCekSenetModel value)?  $default,){
final _that = this;
switch (_that) {
case _DeleteCekSenetModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? belgeNo,  String? belgeTipi,  int? islemKodu, @JsonKey(name: "PickerTahsilatTuru")  String? pickerTahsilatTuru,  String? tag)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DeleteCekSenetModel() when $default != null:
return $default(_that.belgeNo,_that.belgeTipi,_that.islemKodu,_that.pickerTahsilatTuru,_that.tag);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? belgeNo,  String? belgeTipi,  int? islemKodu, @JsonKey(name: "PickerTahsilatTuru")  String? pickerTahsilatTuru,  String? tag)  $default,) {final _that = this;
switch (_that) {
case _DeleteCekSenetModel():
return $default(_that.belgeNo,_that.belgeTipi,_that.islemKodu,_that.pickerTahsilatTuru,_that.tag);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? belgeNo,  String? belgeTipi,  int? islemKodu, @JsonKey(name: "PickerTahsilatTuru")  String? pickerTahsilatTuru,  String? tag)?  $default,) {final _that = this;
switch (_that) {
case _DeleteCekSenetModel() when $default != null:
return $default(_that.belgeNo,_that.belgeTipi,_that.islemKodu,_that.pickerTahsilatTuru,_that.tag);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DeleteCekSenetModel implements DeleteCekSenetModel {
  const _DeleteCekSenetModel({this.belgeNo, this.belgeTipi, this.islemKodu, @JsonKey(name: "PickerTahsilatTuru") this.pickerTahsilatTuru, this.tag});
  factory _DeleteCekSenetModel.fromJson(Map<String, dynamic> json) => _$DeleteCekSenetModelFromJson(json);

@override final  String? belgeNo;
@override final  String? belgeTipi;
@override final  int? islemKodu;
@override@JsonKey(name: "PickerTahsilatTuru") final  String? pickerTahsilatTuru;
@override final  String? tag;

/// Create a copy of DeleteCekSenetModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DeleteCekSenetModelCopyWith<_DeleteCekSenetModel> get copyWith => __$DeleteCekSenetModelCopyWithImpl<_DeleteCekSenetModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DeleteCekSenetModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DeleteCekSenetModel&&(identical(other.belgeNo, belgeNo) || other.belgeNo == belgeNo)&&(identical(other.belgeTipi, belgeTipi) || other.belgeTipi == belgeTipi)&&(identical(other.islemKodu, islemKodu) || other.islemKodu == islemKodu)&&(identical(other.pickerTahsilatTuru, pickerTahsilatTuru) || other.pickerTahsilatTuru == pickerTahsilatTuru)&&(identical(other.tag, tag) || other.tag == tag));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,belgeNo,belgeTipi,islemKodu,pickerTahsilatTuru,tag);



}

/// @nodoc
abstract mixin class _$DeleteCekSenetModelCopyWith<$Res> implements $DeleteCekSenetModelCopyWith<$Res> {
  factory _$DeleteCekSenetModelCopyWith(_DeleteCekSenetModel value, $Res Function(_DeleteCekSenetModel) _then) = __$DeleteCekSenetModelCopyWithImpl;
@override @useResult
$Res call({
 String? belgeNo, String? belgeTipi, int? islemKodu,@JsonKey(name: "PickerTahsilatTuru") String? pickerTahsilatTuru, String? tag
});




}
/// @nodoc
class __$DeleteCekSenetModelCopyWithImpl<$Res>
    implements _$DeleteCekSenetModelCopyWith<$Res> {
  __$DeleteCekSenetModelCopyWithImpl(this._self, this._then);

  final _DeleteCekSenetModel _self;
  final $Res Function(_DeleteCekSenetModel) _then;

/// Create a copy of DeleteCekSenetModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? belgeNo = freezed,Object? belgeTipi = freezed,Object? islemKodu = freezed,Object? pickerTahsilatTuru = freezed,Object? tag = freezed,}) {
  return _then(_DeleteCekSenetModel(
belgeNo: freezed == belgeNo ? _self.belgeNo : belgeNo // ignore: cast_nullable_to_non_nullable
as String?,belgeTipi: freezed == belgeTipi ? _self.belgeTipi : belgeTipi // ignore: cast_nullable_to_non_nullable
as String?,islemKodu: freezed == islemKodu ? _self.islemKodu : islemKodu // ignore: cast_nullable_to_non_nullable
as int?,pickerTahsilatTuru: freezed == pickerTahsilatTuru ? _self.pickerTahsilatTuru : pickerTahsilatTuru // ignore: cast_nullable_to_non_nullable
as String?,tag: freezed == tag ? _self.tag : tag // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
