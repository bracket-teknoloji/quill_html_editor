// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ek_rehberler_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$EkRehberlerModel {

 int? get id; String? get baslik; String? get ekran; String? get alan;
/// Create a copy of EkRehberlerModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EkRehberlerModelCopyWith<EkRehberlerModel> get copyWith => _$EkRehberlerModelCopyWithImpl<EkRehberlerModel>(this as EkRehberlerModel, _$identity);

  /// Serializes this EkRehberlerModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EkRehberlerModel&&(identical(other.id, id) || other.id == id)&&(identical(other.baslik, baslik) || other.baslik == baslik)&&(identical(other.ekran, ekran) || other.ekran == ekran)&&(identical(other.alan, alan) || other.alan == alan));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,baslik,ekran,alan);



}

/// @nodoc
abstract mixin class $EkRehberlerModelCopyWith<$Res>  {
  factory $EkRehberlerModelCopyWith(EkRehberlerModel value, $Res Function(EkRehberlerModel) _then) = _$EkRehberlerModelCopyWithImpl;
@useResult
$Res call({
 int? id, String? baslik, String? ekran, String? alan
});




}
/// @nodoc
class _$EkRehberlerModelCopyWithImpl<$Res>
    implements $EkRehberlerModelCopyWith<$Res> {
  _$EkRehberlerModelCopyWithImpl(this._self, this._then);

  final EkRehberlerModel _self;
  final $Res Function(EkRehberlerModel) _then;

/// Create a copy of EkRehberlerModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? baslik = freezed,Object? ekran = freezed,Object? alan = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,baslik: freezed == baslik ? _self.baslik : baslik // ignore: cast_nullable_to_non_nullable
as String?,ekran: freezed == ekran ? _self.ekran : ekran // ignore: cast_nullable_to_non_nullable
as String?,alan: freezed == alan ? _self.alan : alan // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// @nodoc

@JsonSerializable(createFactory: true)
class _EkRehberlerModel implements EkRehberlerModel {
  const _EkRehberlerModel({this.id, this.baslik, this.ekran, this.alan});
  factory _EkRehberlerModel.fromJson(Map<String, dynamic> json) => _$EkRehberlerModelFromJson(json);

@override final  int? id;
@override final  String? baslik;
@override final  String? ekran;
@override final  String? alan;

/// Create a copy of EkRehberlerModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EkRehberlerModelCopyWith<_EkRehberlerModel> get copyWith => __$EkRehberlerModelCopyWithImpl<_EkRehberlerModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$EkRehberlerModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EkRehberlerModel&&(identical(other.id, id) || other.id == id)&&(identical(other.baslik, baslik) || other.baslik == baslik)&&(identical(other.ekran, ekran) || other.ekran == ekran)&&(identical(other.alan, alan) || other.alan == alan));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,baslik,ekran,alan);



}

/// @nodoc
abstract mixin class _$EkRehberlerModelCopyWith<$Res> implements $EkRehberlerModelCopyWith<$Res> {
  factory _$EkRehberlerModelCopyWith(_EkRehberlerModel value, $Res Function(_EkRehberlerModel) _then) = __$EkRehberlerModelCopyWithImpl;
@override @useResult
$Res call({
 int? id, String? baslik, String? ekran, String? alan
});




}
/// @nodoc
class __$EkRehberlerModelCopyWithImpl<$Res>
    implements _$EkRehberlerModelCopyWith<$Res> {
  __$EkRehberlerModelCopyWithImpl(this._self, this._then);

  final _EkRehberlerModel _self;
  final $Res Function(_EkRehberlerModel) _then;

/// Create a copy of EkRehberlerModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? baslik = freezed,Object? ekran = freezed,Object? alan = freezed,}) {
  return _then(_EkRehberlerModel(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,baslik: freezed == baslik ? _self.baslik : baslik // ignore: cast_nullable_to_non_nullable
as String?,ekran: freezed == ekran ? _self.ekran : ekran // ignore: cast_nullable_to_non_nullable
as String?,alan: freezed == alan ? _self.alan : alan // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
