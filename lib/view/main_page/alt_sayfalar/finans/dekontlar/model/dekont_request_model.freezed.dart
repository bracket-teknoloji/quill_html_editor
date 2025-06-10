// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'dekont_request_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DekontRequestModel {

 int? get sayfa; set sayfa(int? value); String? get ekranTipi; set ekranTipi(String? value); String? get searchText; set searchText(String? value);
/// Create a copy of DekontRequestModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DekontRequestModelCopyWith<DekontRequestModel> get copyWith => _$DekontRequestModelCopyWithImpl<DekontRequestModel>(this as DekontRequestModel, _$identity);

  /// Serializes this DekontRequestModel to a JSON map.
  Map<String, dynamic> toJson();






}

/// @nodoc
abstract mixin class $DekontRequestModelCopyWith<$Res>  {
  factory $DekontRequestModelCopyWith(DekontRequestModel value, $Res Function(DekontRequestModel) _then) = _$DekontRequestModelCopyWithImpl;
@useResult
$Res call({
 int? sayfa, String? ekranTipi, String? searchText
});




}
/// @nodoc
class _$DekontRequestModelCopyWithImpl<$Res>
    implements $DekontRequestModelCopyWith<$Res> {
  _$DekontRequestModelCopyWithImpl(this._self, this._then);

  final DekontRequestModel _self;
  final $Res Function(DekontRequestModel) _then;

/// Create a copy of DekontRequestModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? sayfa = freezed,Object? ekranTipi = freezed,Object? searchText = freezed,}) {
  return _then(_self.copyWith(
sayfa: freezed == sayfa ? _self.sayfa : sayfa // ignore: cast_nullable_to_non_nullable
as int?,ekranTipi: freezed == ekranTipi ? _self.ekranTipi : ekranTipi // ignore: cast_nullable_to_non_nullable
as String?,searchText: freezed == searchText ? _self.searchText : searchText // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// @nodoc

@JsonSerializable(fieldRename: FieldRename.pascal)
class _DekontRequestModel implements DekontRequestModel {
   _DekontRequestModel({this.sayfa, this.ekranTipi = "L", this.searchText});
  factory _DekontRequestModel.fromJson(Map<String, dynamic> json) => _$DekontRequestModelFromJson(json);

@override  int? sayfa;
@override@JsonKey()  String? ekranTipi;
@override  String? searchText;

/// Create a copy of DekontRequestModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DekontRequestModelCopyWith<_DekontRequestModel> get copyWith => __$DekontRequestModelCopyWithImpl<_DekontRequestModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DekontRequestModelToJson(this, );
}





}

/// @nodoc
abstract mixin class _$DekontRequestModelCopyWith<$Res> implements $DekontRequestModelCopyWith<$Res> {
  factory _$DekontRequestModelCopyWith(_DekontRequestModel value, $Res Function(_DekontRequestModel) _then) = __$DekontRequestModelCopyWithImpl;
@override @useResult
$Res call({
 int? sayfa, String? ekranTipi, String? searchText
});




}
/// @nodoc
class __$DekontRequestModelCopyWithImpl<$Res>
    implements _$DekontRequestModelCopyWith<$Res> {
  __$DekontRequestModelCopyWithImpl(this._self, this._then);

  final _DekontRequestModel _self;
  final $Res Function(_DekontRequestModel) _then;

/// Create a copy of DekontRequestModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? sayfa = freezed,Object? ekranTipi = freezed,Object? searchText = freezed,}) {
  return _then(_DekontRequestModel(
sayfa: freezed == sayfa ? _self.sayfa : sayfa // ignore: cast_nullable_to_non_nullable
as int?,ekranTipi: freezed == ekranTipi ? _self.ekranTipi : ekranTipi // ignore: cast_nullable_to_non_nullable
as String?,searchText: freezed == searchText ? _self.searchText : searchText // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
