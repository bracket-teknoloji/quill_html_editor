
import 'package:json_annotation/json_annotation.dart';

import 'base_siparis_edit_model.dart';

part 'temp_json_model.g.dart';

@JsonSerializable(createToJson: true, fieldRename: FieldRename.screamingSnake, includeIfNull: false, createFactory: true)
class TempJsonModel {
    String? cariAdi;
    String? cariKodu;
    CariModel? cariModel;
    String? acik1;
    String? acik2;
    String? acik7;
    String? acik8;
    int? ekMaliyet1Tutari;
    double? ekMaliyet2Tutari;
    int? ekMaliyet3Tutari;
    String? belgeNo;
    int? genisk1Tipi;
    int? genisk2Tipi;
    int? genelIskonto1;
    int? genelIskonto2;
    double? genelIskonto3;
    double? genelToplam;
    String? ekAciklama;
    String? islemId;
    DateTime? islemeBaslamaTarihi;
    int? kalemAdedi;
    List<KalemModel>? kalemList;
    String? kayityapankul;
    String? kdvDahil;
    double? kdv;
    int? tipi;
    String? ozelKod1;
    Map? paramMap;
    String? belgeTuru;
    String? plasiyerAciklama;
    String? plasiyerKodu;
    String? projeKodu;
    int? belgeTipi;
    String? ekAcik1;
    String? ekAcik2;
    String? ekAcik7;
    String? ekAcik8;
    int? genIsk1O;
    int? genIsk1T;
    int? genIsk2O;
    int? genIsk2T;
    int? genIsk3O;
    double? genIsk3T;
    String? pickerBelgeTuru;
    String? tag;
    DateTime? tarih;
    int? vadeGunu;

    TempJsonModel();

    factory TempJsonModel.fromJson(Map<String, dynamic> json) => _$TempJsonModelFromJson(json);

    Map<String, dynamic> toJson() => _$TempJsonModelToJson(this);

}

