// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'paket_icerigi_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PaketIcerigiModel _$PaketIcerigiModelFromJson(Map<String, dynamic> json) {
  return _PaketIcerigiModel.fromJson(json);
}

/// @nodoc
mixin _$PaketIcerigiModel {
  int? get id => throw _privateConstructorUsedError;
  int? get paketId => throw _privateConstructorUsedError;
  String? get paketKodu => throw _privateConstructorUsedError;
  int? get depoKodu => throw _privateConstructorUsedError;
  String? get depoAdi => throw _privateConstructorUsedError;
  String? get stokKodu => throw _privateConstructorUsedError;
  String? get stokAdi => throw _privateConstructorUsedError;
  double? get miktar => throw _privateConstructorUsedError;
  String? get cikistaSeri => throw _privateConstructorUsedError;
  String? get seriMiktarKadar => throw _privateConstructorUsedError;
  String? get seriBakiyeKontrol => throw _privateConstructorUsedError;
  String? get seriCikistaOtomatik => throw _privateConstructorUsedError;
  List<SeriList>? get seriList => throw _privateConstructorUsedError;

  /// Serializes this PaketIcerigiModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PaketIcerigiModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PaketIcerigiModelCopyWith<PaketIcerigiModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaketIcerigiModelCopyWith<$Res> {
  factory $PaketIcerigiModelCopyWith(
          PaketIcerigiModel value, $Res Function(PaketIcerigiModel) then) =
      _$PaketIcerigiModelCopyWithImpl<$Res, PaketIcerigiModel>;
  @useResult
  $Res call(
      {int? id,
      int? paketId,
      String? paketKodu,
      int? depoKodu,
      String? depoAdi,
      String? stokKodu,
      String? stokAdi,
      double? miktar,
      String? cikistaSeri,
      String? seriMiktarKadar,
      String? seriBakiyeKontrol,
      String? seriCikistaOtomatik,
      List<SeriList>? seriList});
}

/// @nodoc
class _$PaketIcerigiModelCopyWithImpl<$Res, $Val extends PaketIcerigiModel>
    implements $PaketIcerigiModelCopyWith<$Res> {
  _$PaketIcerigiModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PaketIcerigiModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? paketId = freezed,
    Object? paketKodu = freezed,
    Object? depoKodu = freezed,
    Object? depoAdi = freezed,
    Object? stokKodu = freezed,
    Object? stokAdi = freezed,
    Object? miktar = freezed,
    Object? cikistaSeri = freezed,
    Object? seriMiktarKadar = freezed,
    Object? seriBakiyeKontrol = freezed,
    Object? seriCikistaOtomatik = freezed,
    Object? seriList = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      paketId: freezed == paketId
          ? _value.paketId
          : paketId // ignore: cast_nullable_to_non_nullable
              as int?,
      paketKodu: freezed == paketKodu
          ? _value.paketKodu
          : paketKodu // ignore: cast_nullable_to_non_nullable
              as String?,
      depoKodu: freezed == depoKodu
          ? _value.depoKodu
          : depoKodu // ignore: cast_nullable_to_non_nullable
              as int?,
      depoAdi: freezed == depoAdi
          ? _value.depoAdi
          : depoAdi // ignore: cast_nullable_to_non_nullable
              as String?,
      stokKodu: freezed == stokKodu
          ? _value.stokKodu
          : stokKodu // ignore: cast_nullable_to_non_nullable
              as String?,
      stokAdi: freezed == stokAdi
          ? _value.stokAdi
          : stokAdi // ignore: cast_nullable_to_non_nullable
              as String?,
      miktar: freezed == miktar
          ? _value.miktar
          : miktar // ignore: cast_nullable_to_non_nullable
              as double?,
      cikistaSeri: freezed == cikistaSeri
          ? _value.cikistaSeri
          : cikistaSeri // ignore: cast_nullable_to_non_nullable
              as String?,
      seriMiktarKadar: freezed == seriMiktarKadar
          ? _value.seriMiktarKadar
          : seriMiktarKadar // ignore: cast_nullable_to_non_nullable
              as String?,
      seriBakiyeKontrol: freezed == seriBakiyeKontrol
          ? _value.seriBakiyeKontrol
          : seriBakiyeKontrol // ignore: cast_nullable_to_non_nullable
              as String?,
      seriCikistaOtomatik: freezed == seriCikistaOtomatik
          ? _value.seriCikistaOtomatik
          : seriCikistaOtomatik // ignore: cast_nullable_to_non_nullable
              as String?,
      seriList: freezed == seriList
          ? _value.seriList
          : seriList // ignore: cast_nullable_to_non_nullable
              as List<SeriList>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PaketIcerigiModelImplCopyWith<$Res>
    implements $PaketIcerigiModelCopyWith<$Res> {
  factory _$$PaketIcerigiModelImplCopyWith(_$PaketIcerigiModelImpl value,
          $Res Function(_$PaketIcerigiModelImpl) then) =
      __$$PaketIcerigiModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      int? paketId,
      String? paketKodu,
      int? depoKodu,
      String? depoAdi,
      String? stokKodu,
      String? stokAdi,
      double? miktar,
      String? cikistaSeri,
      String? seriMiktarKadar,
      String? seriBakiyeKontrol,
      String? seriCikistaOtomatik,
      List<SeriList>? seriList});
}

/// @nodoc
class __$$PaketIcerigiModelImplCopyWithImpl<$Res>
    extends _$PaketIcerigiModelCopyWithImpl<$Res, _$PaketIcerigiModelImpl>
    implements _$$PaketIcerigiModelImplCopyWith<$Res> {
  __$$PaketIcerigiModelImplCopyWithImpl(_$PaketIcerigiModelImpl _value,
      $Res Function(_$PaketIcerigiModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of PaketIcerigiModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? paketId = freezed,
    Object? paketKodu = freezed,
    Object? depoKodu = freezed,
    Object? depoAdi = freezed,
    Object? stokKodu = freezed,
    Object? stokAdi = freezed,
    Object? miktar = freezed,
    Object? cikistaSeri = freezed,
    Object? seriMiktarKadar = freezed,
    Object? seriBakiyeKontrol = freezed,
    Object? seriCikistaOtomatik = freezed,
    Object? seriList = freezed,
  }) {
    return _then(_$PaketIcerigiModelImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      paketId: freezed == paketId
          ? _value.paketId
          : paketId // ignore: cast_nullable_to_non_nullable
              as int?,
      paketKodu: freezed == paketKodu
          ? _value.paketKodu
          : paketKodu // ignore: cast_nullable_to_non_nullable
              as String?,
      depoKodu: freezed == depoKodu
          ? _value.depoKodu
          : depoKodu // ignore: cast_nullable_to_non_nullable
              as int?,
      depoAdi: freezed == depoAdi
          ? _value.depoAdi
          : depoAdi // ignore: cast_nullable_to_non_nullable
              as String?,
      stokKodu: freezed == stokKodu
          ? _value.stokKodu
          : stokKodu // ignore: cast_nullable_to_non_nullable
              as String?,
      stokAdi: freezed == stokAdi
          ? _value.stokAdi
          : stokAdi // ignore: cast_nullable_to_non_nullable
              as String?,
      miktar: freezed == miktar
          ? _value.miktar
          : miktar // ignore: cast_nullable_to_non_nullable
              as double?,
      cikistaSeri: freezed == cikistaSeri
          ? _value.cikistaSeri
          : cikistaSeri // ignore: cast_nullable_to_non_nullable
              as String?,
      seriMiktarKadar: freezed == seriMiktarKadar
          ? _value.seriMiktarKadar
          : seriMiktarKadar // ignore: cast_nullable_to_non_nullable
              as String?,
      seriBakiyeKontrol: freezed == seriBakiyeKontrol
          ? _value.seriBakiyeKontrol
          : seriBakiyeKontrol // ignore: cast_nullable_to_non_nullable
              as String?,
      seriCikistaOtomatik: freezed == seriCikistaOtomatik
          ? _value.seriCikistaOtomatik
          : seriCikistaOtomatik // ignore: cast_nullable_to_non_nullable
              as String?,
      seriList: freezed == seriList
          ? _value._seriList
          : seriList // ignore: cast_nullable_to_non_nullable
              as List<SeriList>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PaketIcerigiModelImpl extends _PaketIcerigiModel {
  _$PaketIcerigiModelImpl(
      {this.id,
      this.paketId,
      this.paketKodu,
      this.depoKodu,
      this.depoAdi,
      this.stokKodu,
      this.stokAdi,
      this.miktar,
      this.cikistaSeri,
      this.seriMiktarKadar,
      this.seriBakiyeKontrol,
      this.seriCikistaOtomatik,
      final List<SeriList>? seriList})
      : _seriList = seriList,
        super._();

  factory _$PaketIcerigiModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$PaketIcerigiModelImplFromJson(json);

  @override
  final int? id;
  @override
  final int? paketId;
  @override
  final String? paketKodu;
  @override
  final int? depoKodu;
  @override
  final String? depoAdi;
  @override
  final String? stokKodu;
  @override
  final String? stokAdi;
  @override
  final double? miktar;
  @override
  final String? cikistaSeri;
  @override
  final String? seriMiktarKadar;
  @override
  final String? seriBakiyeKontrol;
  @override
  final String? seriCikistaOtomatik;
  final List<SeriList>? _seriList;
  @override
  List<SeriList>? get seriList {
    final value = _seriList;
    if (value == null) return null;
    if (_seriList is EqualUnmodifiableListView) return _seriList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  /// Create a copy of PaketIcerigiModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PaketIcerigiModelImplCopyWith<_$PaketIcerigiModelImpl> get copyWith =>
      __$$PaketIcerigiModelImplCopyWithImpl<_$PaketIcerigiModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PaketIcerigiModelImplToJson(
      this,
    );
  }
}

abstract class _PaketIcerigiModel extends PaketIcerigiModel {
  factory _PaketIcerigiModel(
      {final int? id,
      final int? paketId,
      final String? paketKodu,
      final int? depoKodu,
      final String? depoAdi,
      final String? stokKodu,
      final String? stokAdi,
      final double? miktar,
      final String? cikistaSeri,
      final String? seriMiktarKadar,
      final String? seriBakiyeKontrol,
      final String? seriCikistaOtomatik,
      final List<SeriList>? seriList}) = _$PaketIcerigiModelImpl;
  _PaketIcerigiModel._() : super._();

  factory _PaketIcerigiModel.fromJson(Map<String, dynamic> json) =
      _$PaketIcerigiModelImpl.fromJson;

  @override
  int? get id;
  @override
  int? get paketId;
  @override
  String? get paketKodu;
  @override
  int? get depoKodu;
  @override
  String? get depoAdi;
  @override
  String? get stokKodu;
  @override
  String? get stokAdi;
  @override
  double? get miktar;
  @override
  String? get cikistaSeri;
  @override
  String? get seriMiktarKadar;
  @override
  String? get seriBakiyeKontrol;
  @override
  String? get seriCikistaOtomatik;
  @override
  List<SeriList>? get seriList;

  /// Create a copy of PaketIcerigiModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PaketIcerigiModelImplCopyWith<_$PaketIcerigiModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
