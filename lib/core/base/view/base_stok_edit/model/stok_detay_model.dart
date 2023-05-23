import 'package:json_annotation/json_annotation.dart';
import 'package:picker/core/base/model/base_network_mixin.dart';

part 'stok_detay_model.g.dart';

@JsonSerializable(includeIfNull: false, createFactory: true, createToJson: true, fieldRename: FieldRename.screamingSnake)
class StokDetayModel with NetworkManagerMixin {
  String? stokKodu;
  String? stokAdi;
  List<dynamic>? seriList;
  List<dynamic>? yapList;
  List<StokList>? stokList;
  List<FiyatList>? fiyatList;

  StokDetayModel();

  @override
  fromJson(Map<String, dynamic> json) {
    return _$StokDetayModelFromJson(json);
  }

  @override
  Map<String, dynamic> toJson() {
    return _$StokDetayModelToJson(this);
  }
}

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.screamingSnake, createToJson: true)
class FiyatList {
  FiyatList();
  String? aS;
  String? stokKodu;
  int? dovizTipi;
  String? dovizKodu;
  DateTime? bastar;
  String? gecerli;
  double? fiyat1;

  factory FiyatList.fromJson(Map<String, dynamic> json) => _$FiyatListFromJson(json);

  toJson() => _$FiyatListToJson(this);
}

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.screamingSnake, createToJson: true)
class StokList {
  StokList();
  String? stokKodu;
  String? stokAdi;
  int? depoKodu;
  int? bakiye;
  String? muhdetayAdi;
  int? alisFiat1;
  int? alisKdv;
  double? satisFiat1;
  int? satisKdv;
  String? olcuBirimi;
  String? olcuBirimi2;
  String? olcuBirimi3;
  int? olcuBirimi2Pay;
  int? olcuBirimi2Payda;
  int? olcuBirimi3Pay;
  int? olcuBirimi3Payda;
  String? barkod1;
  String? barkod2;
  String? barkod3;
  String? kayityapankul;
  DateTime? kayittarihi;
  String? grupKodu;
  String? grupTanimi;
  String? kod1;
  String? kod1Tanimi;
  String? kod2;
  String? kod2Tanimi;
  String? kod3;
  String? kod3Tanimi;
  String? kod4;
  String? kod4Tanimi;
  String? kod5;
  String? kod5Tanimi;
  DateTime? duzeltmetarihi;
  String? duzeltmeyapankul;
  List<dynamic>? stokFiyatList;
  List<dynamic>? stokList;
  int? fiatBirimi;
  String? kilitGenel;
  String? kilitSaticisip;
  String? kilitMussip;
  String? kilitAlis;
  String? kilitSatis;

  factory StokList.fromJson(Map<String, dynamic> json) => _$StokListFromJson(json);

  toJson() => _$StokListToJson(this);
}
