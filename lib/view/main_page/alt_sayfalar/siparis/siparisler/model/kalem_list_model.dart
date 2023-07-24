

import 'package:json_annotation/json_annotation.dart';

part 'kalem_list_model.g.dart';


@JsonSerializable( createToJson: true, includeIfNull: true, createFactory: true, fieldRename: FieldRename.screamingSnake)
class KalemListModel{
  List<dynamic>? tempBarkodList;
    int? sira;
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
    
    KalemListModel();

    factory KalemListModel.fromJson(Map<String, dynamic> json) => _$KalemListModelFromJson(json);

    Map<String, dynamic> toJson() => _$KalemListModelToJson(this);
}