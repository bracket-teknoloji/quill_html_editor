// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'kullanicilar_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$KullanicilarModelImpl _$$KullanicilarModelImplFromJson(
        Map<String, dynamic> json) =>
    _$KullanicilarModelImpl(
      kodu: json['KODU'] as String?,
      adi: json['ADI'] as String?,
    );

Map<String, dynamic> _$$KullanicilarModelImplToJson(
    _$KullanicilarModelImpl instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('KODU', instance.kodu);
  writeNotNull('ADI', instance.adi);
  return val;
}
