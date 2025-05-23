// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'hucre_hareketleri_request_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

HucreHareketleriRequestModel _$HucreHareketleriRequestModelFromJson(Map<String, dynamic> json) {
  return _HucreHareketleriRequestModel.fromJson(json);
}

/// @nodoc
mixin _$HucreHareketleriRequestModel {
  String? get ekranTipi => throw _privateConstructorUsedError;
  int? get filtreKodu => throw _privateConstructorUsedError;
  String? get stokKodu => throw _privateConstructorUsedError;

  /// Serializes this HucreHareketleriRequestModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of HucreHareketleriRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $HucreHareketleriRequestModelCopyWith<HucreHareketleriRequestModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HucreHareketleriRequestModelCopyWith<$Res> {
  factory $HucreHareketleriRequestModelCopyWith(
    HucreHareketleriRequestModel value,
    $Res Function(HucreHareketleriRequestModel) then,
  ) = _$HucreHareketleriRequestModelCopyWithImpl<$Res, HucreHareketleriRequestModel>;
  @useResult
  $Res call({String? ekranTipi, int? filtreKodu, String? stokKodu});
}

/// @nodoc
class _$HucreHareketleriRequestModelCopyWithImpl<$Res, $Val extends HucreHareketleriRequestModel>
    implements $HucreHareketleriRequestModelCopyWith<$Res> {
  _$HucreHareketleriRequestModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of HucreHareketleriRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? ekranTipi = freezed, Object? filtreKodu = freezed, Object? stokKodu = freezed}) {
    return _then(
      _value.copyWith(
            ekranTipi: freezed == ekranTipi
                ? _value.ekranTipi
                : ekranTipi // ignore: cast_nullable_to_non_nullable
                      as String?,
            filtreKodu: freezed == filtreKodu
                ? _value.filtreKodu
                : filtreKodu // ignore: cast_nullable_to_non_nullable
                      as int?,
            stokKodu: freezed == stokKodu
                ? _value.stokKodu
                : stokKodu // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$HucreHareketleriRequestModelImplCopyWith<$Res>
    implements $HucreHareketleriRequestModelCopyWith<$Res> {
  factory _$$HucreHareketleriRequestModelImplCopyWith(
    _$HucreHareketleriRequestModelImpl value,
    $Res Function(_$HucreHareketleriRequestModelImpl) then,
  ) = __$$HucreHareketleriRequestModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? ekranTipi, int? filtreKodu, String? stokKodu});
}

/// @nodoc
class __$$HucreHareketleriRequestModelImplCopyWithImpl<$Res>
    extends _$HucreHareketleriRequestModelCopyWithImpl<$Res, _$HucreHareketleriRequestModelImpl>
    implements _$$HucreHareketleriRequestModelImplCopyWith<$Res> {
  __$$HucreHareketleriRequestModelImplCopyWithImpl(
    _$HucreHareketleriRequestModelImpl _value,
    $Res Function(_$HucreHareketleriRequestModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of HucreHareketleriRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? ekranTipi = freezed, Object? filtreKodu = freezed, Object? stokKodu = freezed}) {
    return _then(
      _$HucreHareketleriRequestModelImpl(
        ekranTipi: freezed == ekranTipi
            ? _value.ekranTipi
            : ekranTipi // ignore: cast_nullable_to_non_nullable
                  as String?,
        filtreKodu: freezed == filtreKodu
            ? _value.filtreKodu
            : filtreKodu // ignore: cast_nullable_to_non_nullable
                  as int?,
        stokKodu: freezed == stokKodu
            ? _value.stokKodu
            : stokKodu // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.pascal)
class _$HucreHareketleriRequestModelImpl implements _HucreHareketleriRequestModel {
  _$HucreHareketleriRequestModelImpl({this.ekranTipi, this.filtreKodu, this.stokKodu});

  factory _$HucreHareketleriRequestModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$HucreHareketleriRequestModelImplFromJson(json);

  @override
  final String? ekranTipi;
  @override
  final int? filtreKodu;
  @override
  final String? stokKodu;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HucreHareketleriRequestModelImpl &&
            (identical(other.ekranTipi, ekranTipi) || other.ekranTipi == ekranTipi) &&
            (identical(other.filtreKodu, filtreKodu) || other.filtreKodu == filtreKodu) &&
            (identical(other.stokKodu, stokKodu) || other.stokKodu == stokKodu));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, ekranTipi, filtreKodu, stokKodu);

  /// Create a copy of HucreHareketleriRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$HucreHareketleriRequestModelImplCopyWith<_$HucreHareketleriRequestModelImpl> get copyWith =>
      __$$HucreHareketleriRequestModelImplCopyWithImpl<_$HucreHareketleriRequestModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$HucreHareketleriRequestModelImplToJson(this);
  }
}

abstract class _HucreHareketleriRequestModel implements HucreHareketleriRequestModel {
  factory _HucreHareketleriRequestModel({final String? ekranTipi, final int? filtreKodu, final String? stokKodu}) =
      _$HucreHareketleriRequestModelImpl;

  factory _HucreHareketleriRequestModel.fromJson(Map<String, dynamic> json) =
      _$HucreHareketleriRequestModelImpl.fromJson;

  @override
  String? get ekranTipi;
  @override
  int? get filtreKodu;
  @override
  String? get stokKodu;

  /// Create a copy of HucreHareketleriRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$HucreHareketleriRequestModelImplCopyWith<_$HucreHareketleriRequestModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
