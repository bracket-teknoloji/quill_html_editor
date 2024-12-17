import "package:json_annotation/json_annotation.dart";

import "../../../../../../core/base/model/base_network_mixin.dart";

part "kalem_list_model.g.dart";

@JsonSerializable(includeIfNull: true, createFactory: true)
class KalemListModel with NetworkManagerMixin {

  KalemListModel();

  factory KalemListModel.fromJson(Map<String, dynamic> json) => _$KalemListModelFromJson(json);
  List<dynamic>? tempBarkodList;
  int? sira;
  String? belgeNo;
  DateTime? tarih;
  DateTime? teslimTarihi;
  String? belgeTipi;
  String? stokKodu;
  String? stokAdi;
  String? cariKodu;
  int? depoKodu;
  String? depoTanimi;
  double? miktar;
  List<dynamic>? seriList;
  double? kdvOrani;
  double? brutFiyat;
  double? dipFiyat;
  bool? iskonto1OranMi;
  int? stokSatDovTip;
  double? stokSatisKuru;
  String? stokSatDovizAdi;
  int? olcuBirimKodu;
  String? olcuBirimAdi;
  double? olcuBirimCarpani;
  String? stokOlcuBirimi;
  String? projeKodu;
  List<dynamic>? kalemListHucreList;
  List<dynamic>? hucreList;
  double? stokBakiye;
  String? kosulKodu;
  double? stokBirimAgirlik;

  @override
  KalemListModel fromJson(Map<String, dynamic> json) => KalemListModel.fromJson(json);

  @override
  Map<String, dynamic> toJson() => _$KalemListModelToJson(this);
}
