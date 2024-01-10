// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'dekont_request_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

DekontRequestModel _$DekontRequestModelFromJson(Map<String, dynamic> json) {
  return _DekontRequestModel.fromJson(json);
}

/// @nodoc
mixin _$DekontRequestModel {
  int? get sayfa => throw _privateConstructorUsedError;
  set sayfa(int? value) => throw _privateConstructorUsedError;
  String? get ekranTipi => throw _privateConstructorUsedError;
  set ekranTipi(String? value) => throw _privateConstructorUsedError;
  String? get searchText => throw _privateConstructorUsedError;
  set searchText(String? value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DekontRequestModelCopyWith<DekontRequestModel> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DekontRequestModelCopyWith<$Res> {
  factory $DekontRequestModelCopyWith(DekontRequestModel value, $Res Function(DekontRequestModel) then) = _$DekontRequestModelCopyWithImpl<$Res, DekontRequestModel>;
  @useResult
  $Res call({int? sayfa, String? ekranTipi, String? searchText});
}

/// @nodoc
class _$DekontRequestModelCopyWithImpl<$Res, $Val extends DekontRequestModel> implements $DekontRequestModelCopyWith<$Res> {
  _$DekontRequestModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sayfa = freezed,
    Object? ekranTipi = freezed,
    Object? searchText = freezed,
  }) {
    return _then(_value.copyWith(
      sayfa: freezed == sayfa
          ? _value.sayfa
          : sayfa // ignore: cast_nullable_to_non_nullable
              as int?,
      ekranTipi: freezed == ekranTipi
          ? _value.ekranTipi
          : ekranTipi // ignore: cast_nullable_to_non_nullable
              as String?,
      searchText: freezed == searchText
          ? _value.searchText
          : searchText // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DekontRequestModelImplCopyWith<$Res> implements $DekontRequestModelCopyWith<$Res> {
  factory _$$DekontRequestModelImplCopyWith(_$DekontRequestModelImpl value, $Res Function(_$DekontRequestModelImpl) then) = __$$DekontRequestModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? sayfa, String? ekranTipi, String? searchText});
}

/// @nodoc
class __$$DekontRequestModelImplCopyWithImpl<$Res> extends _$DekontRequestModelCopyWithImpl<$Res, _$DekontRequestModelImpl> implements _$$DekontRequestModelImplCopyWith<$Res> {
  __$$DekontRequestModelImplCopyWithImpl(_$DekontRequestModelImpl _value, $Res Function(_$DekontRequestModelImpl) _then) : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sayfa = freezed,
    Object? ekranTipi = freezed,
    Object? searchText = freezed,
  }) {
    return _then(_$DekontRequestModelImpl(
      sayfa: freezed == sayfa
          ? _value.sayfa
          : sayfa // ignore: cast_nullable_to_non_nullable
              as int?,
      ekranTipi: freezed == ekranTipi
          ? _value.ekranTipi
          : ekranTipi // ignore: cast_nullable_to_non_nullable
              as String?,
      searchText: freezed == searchText
          ? _value.searchText
          : searchText // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.pascal)
class _$DekontRequestModelImpl implements _DekontRequestModel {
  _$DekontRequestModelImpl({this.sayfa, this.ekranTipi = "L", this.searchText});

  factory _$DekontRequestModelImpl.fromJson(Map<String, dynamic> json) => _$$DekontRequestModelImplFromJson(json);

  @override
  int? sayfa;
  @override
  @JsonKey()
  String? ekranTipi;
  @override
  String? searchText;

  @override
  String toString() {
    return 'DekontRequestModel(sayfa: $sayfa, ekranTipi: $ekranTipi, searchText: $searchText)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DekontRequestModelImplCopyWith<_$DekontRequestModelImpl> get copyWith => __$$DekontRequestModelImplCopyWithImpl<_$DekontRequestModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DekontRequestModelImplToJson(
      this,
    );
  }
}

abstract class _DekontRequestModel implements DekontRequestModel {
  factory _DekontRequestModel({int? sayfa, String? ekranTipi, String? searchText}) = _$DekontRequestModelImpl;

  factory _DekontRequestModel.fromJson(Map<String, dynamic> json) = _$DekontRequestModelImpl.fromJson;

  @override
  int? get sayfa;
  set sayfa(int? value);
  @override
  String? get ekranTipi;
  set ekranTipi(String? value);
  @override
  String? get searchText;
  set searchText(String? value);
  @override
  @JsonKey(ignore: true)
  _$$DekontRequestModelImplCopyWith<_$DekontRequestModelImpl> get copyWith => throw _privateConstructorUsedError;
}
