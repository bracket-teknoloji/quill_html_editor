// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'transfer_mal_talebi_listesi_request_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TransferMalTalebiListesiRequestModel {

 String? get durum; List<int>? get filtreler;
/// Create a copy of TransferMalTalebiListesiRequestModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TransferMalTalebiListesiRequestModelCopyWith<TransferMalTalebiListesiRequestModel> get copyWith => _$TransferMalTalebiListesiRequestModelCopyWithImpl<TransferMalTalebiListesiRequestModel>(this as TransferMalTalebiListesiRequestModel, _$identity);

  /// Serializes this TransferMalTalebiListesiRequestModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TransferMalTalebiListesiRequestModel&&(identical(other.durum, durum) || other.durum == durum)&&const DeepCollectionEquality().equals(other.filtreler, filtreler));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,durum,const DeepCollectionEquality().hash(filtreler));



}

/// @nodoc
abstract mixin class $TransferMalTalebiListesiRequestModelCopyWith<$Res>  {
  factory $TransferMalTalebiListesiRequestModelCopyWith(TransferMalTalebiListesiRequestModel value, $Res Function(TransferMalTalebiListesiRequestModel) _then) = _$TransferMalTalebiListesiRequestModelCopyWithImpl;
@useResult
$Res call({
 String? durum, List<int>? filtreler
});




}
/// @nodoc
class _$TransferMalTalebiListesiRequestModelCopyWithImpl<$Res>
    implements $TransferMalTalebiListesiRequestModelCopyWith<$Res> {
  _$TransferMalTalebiListesiRequestModelCopyWithImpl(this._self, this._then);

  final TransferMalTalebiListesiRequestModel _self;
  final $Res Function(TransferMalTalebiListesiRequestModel) _then;

/// Create a copy of TransferMalTalebiListesiRequestModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? durum = freezed,Object? filtreler = freezed,}) {
  return _then(_self.copyWith(
durum: freezed == durum ? _self.durum : durum // ignore: cast_nullable_to_non_nullable
as String?,filtreler: freezed == filtreler ? _self.filtreler : filtreler // ignore: cast_nullable_to_non_nullable
as List<int>?,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _TransferMalTalebiListesiRequestModel implements TransferMalTalebiListesiRequestModel {
  const _TransferMalTalebiListesiRequestModel({this.durum, final  List<int>? filtreler}): _filtreler = filtreler;
  factory _TransferMalTalebiListesiRequestModel.fromJson(Map<String, dynamic> json) => _$TransferMalTalebiListesiRequestModelFromJson(json);

@override final  String? durum;
 final  List<int>? _filtreler;
@override List<int>? get filtreler {
  final value = _filtreler;
  if (value == null) return null;
  if (_filtreler is EqualUnmodifiableListView) return _filtreler;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of TransferMalTalebiListesiRequestModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TransferMalTalebiListesiRequestModelCopyWith<_TransferMalTalebiListesiRequestModel> get copyWith => __$TransferMalTalebiListesiRequestModelCopyWithImpl<_TransferMalTalebiListesiRequestModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TransferMalTalebiListesiRequestModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TransferMalTalebiListesiRequestModel&&(identical(other.durum, durum) || other.durum == durum)&&const DeepCollectionEquality().equals(other._filtreler, _filtreler));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,durum,const DeepCollectionEquality().hash(_filtreler));



}

/// @nodoc
abstract mixin class _$TransferMalTalebiListesiRequestModelCopyWith<$Res> implements $TransferMalTalebiListesiRequestModelCopyWith<$Res> {
  factory _$TransferMalTalebiListesiRequestModelCopyWith(_TransferMalTalebiListesiRequestModel value, $Res Function(_TransferMalTalebiListesiRequestModel) _then) = __$TransferMalTalebiListesiRequestModelCopyWithImpl;
@override @useResult
$Res call({
 String? durum, List<int>? filtreler
});




}
/// @nodoc
class __$TransferMalTalebiListesiRequestModelCopyWithImpl<$Res>
    implements _$TransferMalTalebiListesiRequestModelCopyWith<$Res> {
  __$TransferMalTalebiListesiRequestModelCopyWithImpl(this._self, this._then);

  final _TransferMalTalebiListesiRequestModel _self;
  final $Res Function(_TransferMalTalebiListesiRequestModel) _then;

/// Create a copy of TransferMalTalebiListesiRequestModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? durum = freezed,Object? filtreler = freezed,}) {
  return _then(_TransferMalTalebiListesiRequestModel(
durum: freezed == durum ? _self.durum : durum // ignore: cast_nullable_to_non_nullable
as String?,filtreler: freezed == filtreler ? _self._filtreler : filtreler // ignore: cast_nullable_to_non_nullable
as List<int>?,
  ));
}


}

// dart format on
