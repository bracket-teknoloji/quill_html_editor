// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ek_alanlar_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

EkAlanlarModel _$EkAlanlarModelFromJson(Map<String, dynamic> json) {
  return _EkAlanlarModel.fromJson(json);
}

/// @nodoc
mixin _$EkAlanlarModel {
  String? get tabloAdi => throw _privateConstructorUsedError;
  set tabloAdi(String? value) => throw _privateConstructorUsedError;
  String? get alanKodu => throw _privateConstructorUsedError;
  set alanKodu(String? value) => throw _privateConstructorUsedError;
  String? get alanAciklama => throw _privateConstructorUsedError;
  set alanAciklama(String? value) => throw _privateConstructorUsedError;
  String? get zorunlu => throw _privateConstructorUsedError;
  set zorunlu(String? value) => throw _privateConstructorUsedError;
  String? get aktif => throw _privateConstructorUsedError;
  set aktif(String? value) => throw _privateConstructorUsedError;
  int? get sira => throw _privateConstructorUsedError;
  set sira(int? value) => throw _privateConstructorUsedError;
  int? get veriTipi => throw _privateConstructorUsedError;
  set veriTipi(int? value) => throw _privateConstructorUsedError;
  int? get uzunluk => throw _privateConstructorUsedError;
  set uzunluk(int? value) => throw _privateConstructorUsedError;
  int? get componentTipi => throw _privateConstructorUsedError;
  set componentTipi(int? value) => throw _privateConstructorUsedError;
  @JsonKey(name: "SecimListesi")
  List<String>? get secimListesi => throw _privateConstructorUsedError;
  @JsonKey(name: "SecimListesi")
  set secimListesi(List<String>? value) => throw _privateConstructorUsedError;
  String? get ondeger => throw _privateConstructorUsedError;
  set ondeger(String? value) => throw _privateConstructorUsedError;

  /// Serializes this EkAlanlarModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of EkAlanlarModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $EkAlanlarModelCopyWith<EkAlanlarModel> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EkAlanlarModelCopyWith<$Res> {
  factory $EkAlanlarModelCopyWith(EkAlanlarModel value, $Res Function(EkAlanlarModel) then) =
      _$EkAlanlarModelCopyWithImpl<$Res, EkAlanlarModel>;
  @useResult
  $Res call({
    String? tabloAdi,
    String? alanKodu,
    String? alanAciklama,
    String? zorunlu,
    String? aktif,
    int? sira,
    int? veriTipi,
    int? uzunluk,
    int? componentTipi,
    @JsonKey(name: "SecimListesi") List<String>? secimListesi,
    String? ondeger,
  });
}

/// @nodoc
class _$EkAlanlarModelCopyWithImpl<$Res, $Val extends EkAlanlarModel> implements $EkAlanlarModelCopyWith<$Res> {
  _$EkAlanlarModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of EkAlanlarModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tabloAdi = freezed,
    Object? alanKodu = freezed,
    Object? alanAciklama = freezed,
    Object? zorunlu = freezed,
    Object? aktif = freezed,
    Object? sira = freezed,
    Object? veriTipi = freezed,
    Object? uzunluk = freezed,
    Object? componentTipi = freezed,
    Object? secimListesi = freezed,
    Object? ondeger = freezed,
  }) {
    return _then(
      _value.copyWith(
            tabloAdi:
                freezed == tabloAdi
                    ? _value.tabloAdi
                    : tabloAdi // ignore: cast_nullable_to_non_nullable
                        as String?,
            alanKodu:
                freezed == alanKodu
                    ? _value.alanKodu
                    : alanKodu // ignore: cast_nullable_to_non_nullable
                        as String?,
            alanAciklama:
                freezed == alanAciklama
                    ? _value.alanAciklama
                    : alanAciklama // ignore: cast_nullable_to_non_nullable
                        as String?,
            zorunlu:
                freezed == zorunlu
                    ? _value.zorunlu
                    : zorunlu // ignore: cast_nullable_to_non_nullable
                        as String?,
            aktif:
                freezed == aktif
                    ? _value.aktif
                    : aktif // ignore: cast_nullable_to_non_nullable
                        as String?,
            sira:
                freezed == sira
                    ? _value.sira
                    : sira // ignore: cast_nullable_to_non_nullable
                        as int?,
            veriTipi:
                freezed == veriTipi
                    ? _value.veriTipi
                    : veriTipi // ignore: cast_nullable_to_non_nullable
                        as int?,
            uzunluk:
                freezed == uzunluk
                    ? _value.uzunluk
                    : uzunluk // ignore: cast_nullable_to_non_nullable
                        as int?,
            componentTipi:
                freezed == componentTipi
                    ? _value.componentTipi
                    : componentTipi // ignore: cast_nullable_to_non_nullable
                        as int?,
            secimListesi:
                freezed == secimListesi
                    ? _value.secimListesi
                    : secimListesi // ignore: cast_nullable_to_non_nullable
                        as List<String>?,
            ondeger:
                freezed == ondeger
                    ? _value.ondeger
                    : ondeger // ignore: cast_nullable_to_non_nullable
                        as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$EkAlanlarModelImplCopyWith<$Res> implements $EkAlanlarModelCopyWith<$Res> {
  factory _$$EkAlanlarModelImplCopyWith(_$EkAlanlarModelImpl value, $Res Function(_$EkAlanlarModelImpl) then) =
      __$$EkAlanlarModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String? tabloAdi,
    String? alanKodu,
    String? alanAciklama,
    String? zorunlu,
    String? aktif,
    int? sira,
    int? veriTipi,
    int? uzunluk,
    int? componentTipi,
    @JsonKey(name: "SecimListesi") List<String>? secimListesi,
    String? ondeger,
  });
}

/// @nodoc
class __$$EkAlanlarModelImplCopyWithImpl<$Res> extends _$EkAlanlarModelCopyWithImpl<$Res, _$EkAlanlarModelImpl>
    implements _$$EkAlanlarModelImplCopyWith<$Res> {
  __$$EkAlanlarModelImplCopyWithImpl(_$EkAlanlarModelImpl _value, $Res Function(_$EkAlanlarModelImpl) _then)
    : super(_value, _then);

  /// Create a copy of EkAlanlarModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tabloAdi = freezed,
    Object? alanKodu = freezed,
    Object? alanAciklama = freezed,
    Object? zorunlu = freezed,
    Object? aktif = freezed,
    Object? sira = freezed,
    Object? veriTipi = freezed,
    Object? uzunluk = freezed,
    Object? componentTipi = freezed,
    Object? secimListesi = freezed,
    Object? ondeger = freezed,
  }) {
    return _then(
      _$EkAlanlarModelImpl(
        tabloAdi:
            freezed == tabloAdi
                ? _value.tabloAdi
                : tabloAdi // ignore: cast_nullable_to_non_nullable
                    as String?,
        alanKodu:
            freezed == alanKodu
                ? _value.alanKodu
                : alanKodu // ignore: cast_nullable_to_non_nullable
                    as String?,
        alanAciklama:
            freezed == alanAciklama
                ? _value.alanAciklama
                : alanAciklama // ignore: cast_nullable_to_non_nullable
                    as String?,
        zorunlu:
            freezed == zorunlu
                ? _value.zorunlu
                : zorunlu // ignore: cast_nullable_to_non_nullable
                    as String?,
        aktif:
            freezed == aktif
                ? _value.aktif
                : aktif // ignore: cast_nullable_to_non_nullable
                    as String?,
        sira:
            freezed == sira
                ? _value.sira
                : sira // ignore: cast_nullable_to_non_nullable
                    as int?,
        veriTipi:
            freezed == veriTipi
                ? _value.veriTipi
                : veriTipi // ignore: cast_nullable_to_non_nullable
                    as int?,
        uzunluk:
            freezed == uzunluk
                ? _value.uzunluk
                : uzunluk // ignore: cast_nullable_to_non_nullable
                    as int?,
        componentTipi:
            freezed == componentTipi
                ? _value.componentTipi
                : componentTipi // ignore: cast_nullable_to_non_nullable
                    as int?,
        secimListesi:
            freezed == secimListesi
                ? _value.secimListesi
                : secimListesi // ignore: cast_nullable_to_non_nullable
                    as List<String>?,
        ondeger:
            freezed == ondeger
                ? _value.ondeger
                : ondeger // ignore: cast_nullable_to_non_nullable
                    as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$EkAlanlarModelImpl extends _EkAlanlarModel {
  _$EkAlanlarModelImpl({
    this.tabloAdi,
    this.alanKodu,
    this.alanAciklama,
    this.zorunlu,
    this.aktif,
    this.sira,
    this.veriTipi,
    this.uzunluk,
    this.componentTipi,
    @JsonKey(name: "SecimListesi") this.secimListesi,
    this.ondeger,
  }) : super._();

  factory _$EkAlanlarModelImpl.fromJson(Map<String, dynamic> json) => _$$EkAlanlarModelImplFromJson(json);

  @override
  String? tabloAdi;
  @override
  String? alanKodu;
  @override
  String? alanAciklama;
  @override
  String? zorunlu;
  @override
  String? aktif;
  @override
  int? sira;
  @override
  int? veriTipi;
  @override
  int? uzunluk;
  @override
  int? componentTipi;
  @override
  @JsonKey(name: "SecimListesi")
  List<String>? secimListesi;
  @override
  String? ondeger;

  /// Create a copy of EkAlanlarModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EkAlanlarModelImplCopyWith<_$EkAlanlarModelImpl> get copyWith =>
      __$$EkAlanlarModelImplCopyWithImpl<_$EkAlanlarModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EkAlanlarModelImplToJson(this);
  }
}

abstract class _EkAlanlarModel extends EkAlanlarModel {
  factory _EkAlanlarModel({
    String? tabloAdi,
    String? alanKodu,
    String? alanAciklama,
    String? zorunlu,
    String? aktif,
    int? sira,
    int? veriTipi,
    int? uzunluk,
    int? componentTipi,
    @JsonKey(name: "SecimListesi") List<String>? secimListesi,
    String? ondeger,
  }) = _$EkAlanlarModelImpl;
  _EkAlanlarModel._() : super._();

  factory _EkAlanlarModel.fromJson(Map<String, dynamic> json) = _$EkAlanlarModelImpl.fromJson;

  @override
  String? get tabloAdi;
  set tabloAdi(String? value);
  @override
  String? get alanKodu;
  set alanKodu(String? value);
  @override
  String? get alanAciklama;
  set alanAciklama(String? value);
  @override
  String? get zorunlu;
  set zorunlu(String? value);
  @override
  String? get aktif;
  set aktif(String? value);
  @override
  int? get sira;
  set sira(int? value);
  @override
  int? get veriTipi;
  set veriTipi(int? value);
  @override
  int? get uzunluk;
  set uzunluk(int? value);
  @override
  int? get componentTipi;
  set componentTipi(int? value);
  @override
  @JsonKey(name: "SecimListesi")
  List<String>? get secimListesi;
  @JsonKey(name: "SecimListesi")
  set secimListesi(List<String>? value);
  @override
  String? get ondeger;
  set ondeger(String? value);

  /// Create a copy of EkAlanlarModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EkAlanlarModelImplCopyWith<_$EkAlanlarModelImpl> get copyWith => throw _privateConstructorUsedError;
}
