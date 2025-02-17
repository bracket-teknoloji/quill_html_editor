// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'dizayn_request_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

DizaynRequestModel _$DizaynRequestModelFromJson(Map<String, dynamic> json) {
  return _DizaynRequestModel.fromJson(json);
}

/// @nodoc
mixin _$DizaynRequestModel {
  @JsonKey(name: "ModulID")
  int? get modulId => throw _privateConstructorUsedError;
  @JsonKey(name: "ERPDizaynlari")
  bool? get erpDizaynlari => throw _privateConstructorUsedError;

  /// Serializes this DizaynRequestModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DizaynRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DizaynRequestModelCopyWith<DizaynRequestModel> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DizaynRequestModelCopyWith<$Res> {
  factory $DizaynRequestModelCopyWith(DizaynRequestModel value, $Res Function(DizaynRequestModel) then) =
      _$DizaynRequestModelCopyWithImpl<$Res, DizaynRequestModel>;
  @useResult
  $Res call({@JsonKey(name: "ModulID") int? modulId, @JsonKey(name: "ERPDizaynlari") bool? erpDizaynlari});
}

/// @nodoc
class _$DizaynRequestModelCopyWithImpl<$Res, $Val extends DizaynRequestModel>
    implements $DizaynRequestModelCopyWith<$Res> {
  _$DizaynRequestModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DizaynRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? modulId = freezed, Object? erpDizaynlari = freezed}) {
    return _then(
      _value.copyWith(
            modulId:
                freezed == modulId
                    ? _value.modulId
                    : modulId // ignore: cast_nullable_to_non_nullable
                        as int?,
            erpDizaynlari:
                freezed == erpDizaynlari
                    ? _value.erpDizaynlari
                    : erpDizaynlari // ignore: cast_nullable_to_non_nullable
                        as bool?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$DizaynRequestModelImplCopyWith<$Res> implements $DizaynRequestModelCopyWith<$Res> {
  factory _$$DizaynRequestModelImplCopyWith(
    _$DizaynRequestModelImpl value,
    $Res Function(_$DizaynRequestModelImpl) then,
  ) = __$$DizaynRequestModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: "ModulID") int? modulId, @JsonKey(name: "ERPDizaynlari") bool? erpDizaynlari});
}

/// @nodoc
class __$$DizaynRequestModelImplCopyWithImpl<$Res>
    extends _$DizaynRequestModelCopyWithImpl<$Res, _$DizaynRequestModelImpl>
    implements _$$DizaynRequestModelImplCopyWith<$Res> {
  __$$DizaynRequestModelImplCopyWithImpl(_$DizaynRequestModelImpl _value, $Res Function(_$DizaynRequestModelImpl) _then)
    : super(_value, _then);

  /// Create a copy of DizaynRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? modulId = freezed, Object? erpDizaynlari = freezed}) {
    return _then(
      _$DizaynRequestModelImpl(
        modulId:
            freezed == modulId
                ? _value.modulId
                : modulId // ignore: cast_nullable_to_non_nullable
                    as int?,
        erpDizaynlari:
            freezed == erpDizaynlari
                ? _value.erpDizaynlari
                : erpDizaynlari // ignore: cast_nullable_to_non_nullable
                    as bool?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$DizaynRequestModelImpl implements _DizaynRequestModel {
  const _$DizaynRequestModelImpl({
    @JsonKey(name: "ModulID") this.modulId,
    @JsonKey(name: "ERPDizaynlari") this.erpDizaynlari,
  });

  factory _$DizaynRequestModelImpl.fromJson(Map<String, dynamic> json) => _$$DizaynRequestModelImplFromJson(json);

  @override
  @JsonKey(name: "ModulID")
  final int? modulId;
  @override
  @JsonKey(name: "ERPDizaynlari")
  final bool? erpDizaynlari;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DizaynRequestModelImpl &&
            (identical(other.modulId, modulId) || other.modulId == modulId) &&
            (identical(other.erpDizaynlari, erpDizaynlari) || other.erpDizaynlari == erpDizaynlari));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, modulId, erpDizaynlari);

  /// Create a copy of DizaynRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DizaynRequestModelImplCopyWith<_$DizaynRequestModelImpl> get copyWith =>
      __$$DizaynRequestModelImplCopyWithImpl<_$DizaynRequestModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DizaynRequestModelImplToJson(this);
  }
}

abstract class _DizaynRequestModel implements DizaynRequestModel {
  const factory _DizaynRequestModel({
    @JsonKey(name: "ModulID") final int? modulId,
    @JsonKey(name: "ERPDizaynlari") final bool? erpDizaynlari,
  }) = _$DizaynRequestModelImpl;

  factory _DizaynRequestModel.fromJson(Map<String, dynamic> json) = _$DizaynRequestModelImpl.fromJson;

  @override
  @JsonKey(name: "ModulID")
  int? get modulId;
  @override
  @JsonKey(name: "ERPDizaynlari")
  bool? get erpDizaynlari;

  /// Create a copy of DizaynRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DizaynRequestModelImplCopyWith<_$DizaynRequestModelImpl> get copyWith => throw _privateConstructorUsedError;
}
