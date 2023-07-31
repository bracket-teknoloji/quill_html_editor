import 'package:json_annotation/json_annotation.dart';

import 'base_network_mixin.dart';
part 'print_model.g.dart';

@JsonSerializable(createToJson: true, fieldRename: FieldRename.screamingSnake)
class PrintModel with NetworkManagerMixin{
    int? dizaynId;
    int? etiketSayisi;
    String? raporOzelKod;
    bool? yazdir;
    String? yaziciAdi;
    String? yaziciTipi;
    DicParams? dicParams;

    PrintModel({
        this.dizaynId,
        this.etiketSayisi,
        this.raporOzelKod,
        this.yazdir,
        this.yaziciAdi,
        this.yaziciTipi,
        this.dicParams,
    });
    
      @override
      fromJson(Map<String, dynamic> json) => _$PrintModelFromJson(json);
    
      @override
      Map<String, dynamic> toJson() => _$PrintModelToJson(this);

}

@JsonSerializable(createToJson: true, fieldRename: FieldRename.screamingSnake)
class DicParams {
    String? belgeNo;
    String? cariKodu;
    String? belgeTipi;

    DicParams({
        this.belgeNo,
        this.cariKodu,
        this.belgeTipi,
    });

    factory DicParams.fromJson(Map<String, dynamic> json) => _$DicParamsFromJson(json);

    Map<String, dynamic> toJson() => _$DicParamsToJson(this);

}
