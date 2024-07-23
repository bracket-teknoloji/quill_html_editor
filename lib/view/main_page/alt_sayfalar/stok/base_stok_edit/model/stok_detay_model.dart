import "package:freezed_annotation/freezed_annotation.dart";
import "package:hive_flutter/hive_flutter.dart";
import "package:picker/view/main_page/alt_sayfalar/kalite_kontrol/olcum_belge_edit/model/olcum_dat_response_model.dart";

import "../../../../../../core/base/model/base_network_mixin.dart";
import "../../stok_liste/model/stok_listesi_model.dart";

part "stok_detay_model.freezed.dart";
part "stok_detay_model.g.dart";

@JsonSerializable()
class StokDetayModel with NetworkManagerMixin {
  //singleton
  static StokDetayModel? _instance;
  static StokDetayModel get instance => _instance ??= StokDetayModel()..stokList = [StokList()];

  //setter for singleton
  static void setInstance(StokDetayModel value) => _instance = value;
  String? stokKodu;
  String? stokAdi;
  @JsonKey(name: "SeriList")
  List<SeriList>? seriList;
  @JsonKey(name: "YapList")
  List<dynamic>? yapList;
  @JsonKey(name: "StokList")
  List<StokList>? stokList;
  @JsonKey(name: "FiyatList")
  List<FiyatList>? fiyatList;

  StokDetayModel();
  @override
  StokDetayModel fromJson(Map<String, dynamic> json) => _$StokDetayModelFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$StokDetayModelToJson(this);
}

@JsonSerializable(explicitToJson: true)
class FiyatList {
  FiyatList();
  String? aS;
  String? stokKodu;
  int? dovizTipi;
  String? dovizKodu;
  DateTime? bastar;
  DateTime? bittar;
  String? gecerli;
  double? fiyat1;
  double? fiyat2;
  double? fiyat3;
  double? fiyat4;

  factory FiyatList.fromJson(Map<String, dynamic> json) => _$FiyatListFromJson(json);

  Map<String, dynamic> toJson() => _$FiyatListToJson(this);
}

@unfreezed
class SeriList extends HiveObject with _$SeriList, NetworkManagerMixin {
  @JsonSerializable(explicitToJson: true)
  SeriList._();
  @HiveType(typeId: 196)
  factory SeriList({
    @HiveField(0) String? stokKodu,
    @HiveField(1) int? depoKodu,
    @HiveField(2) double? miktar,
    @HiveField(3) String? seriNo,
    @HiveField(4) int? inckeyno,
    @HiveField(5) String? depoTanimi,
    @HiveField(6) int? hareketId,
    @HiveField(7) String? barkod,
    @HiveField(8) String? gckod,
    @HiveField(9) String? seri1,
    @HiveField(10) int? requestVersion,
    @HiveField(11) String? tempBarkod,
    @HiveField(12) String? seri2,
    @HiveField(13) String? seri3,
    @HiveField(14) String? seri4,
    @HiveField(15) String? acik1,
    @HiveField(16) String? acik2,
    @HiveField(17) String? acik3,
    @HiveField(18) String? acik4,
    @HiveField(19) DateTime? sonKullanmaTarihi,
    @HiveField(20) String? stokAdi,
    @HiveField(21) String? hucreKodu,
    @HiveField(22) DateTime? tarih,
    @HiveField(23) int? refId,
    @HiveField(24) String? aciklama1,
  }) = _SeriList;
  factory SeriList.fromJson(Map<String, dynamic> json) => _$SeriListFromJson(json);

  @override
  SeriList fromJson(Map<String, dynamic> json) => _$SeriListFromJson(json);

  factory SeriList.fromOlcumDatResponseModel(OlcumDatResponseModel model) => SeriList(
        seriNo: model.seriNo,
        stokKodu: model.stokKodu,
        miktar: model.miktar,
      );
}
