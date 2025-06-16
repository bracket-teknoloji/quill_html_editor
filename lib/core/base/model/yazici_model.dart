import "package:freezed_annotation/freezed_annotation.dart";
import "package:hive_ce_flutter/hive_flutter.dart";

import "package:picker/core/base/model/base_network_mixin.dart";

part "yazici_model.freezed.dart";
part "yazici_model.g.dart";

@unfreezed
@HiveType(typeId: 5)
sealed class YaziciModel with _$YaziciModel, NetworkManagerMixin {
  factory YaziciModel({
    @HiveField(0) String? yaziciAdi,
    @HiveField(1) @Default("") String macAdresi,
    @HiveField(2) YaziciTipi? yaziciTipi,
    @HiveField(3) String? aciklama,
    @HiveField(4) String? yazdirmaTipi,
  }) = _YaziciModel;

  factory YaziciModel.fromJson(Map<String, dynamic> json) => _$YaziciModelFromJson(json);
  YaziciModel._();

  @override
  NetworkManagerMixin? fromJson(Map<String, dynamic> json) => YaziciModel.fromJson(json);
}

@HiveType(typeId: 6)
enum YaziciTipi {
  @HiveField(0)
  sewooEtiket("SEWOO_ETIKET"),
  @HiveField(1)
  sewooFis("SEWOO_FIS"),
  @HiveField(2)
  tscEtiket("TSC_ETIKET"),
  @HiveField(3)
  tscFis("TSC_FIS"),
  @HiveField(4)
  genelBTYazici("BT_GENEL"),
  @HiveField(5)
  genelEscPosDestekliYazici("ESCPOS"),
  @HiveField(6)
  genelCPCLDestekliYazici("CPCL"),
  @HiveField(7)
  zebraFisYazici("ZEBRA_FIS");

  const YaziciTipi(this.value);

  final String value;

  String getLabel() => switch (this) {
    sewooEtiket => "Sewoo Etiket",
    sewooFis => "Sewoo Fiş",
    tscEtiket => "TSC Etiket",
    tscFis => "TSC Fiş",
    genelBTYazici => "Genel BT Yazıcı",
    genelEscPosDestekliYazici => "Genel ESC/POS Destekli Yazıcı",
    genelCPCLDestekliYazici => "Genel CPCL Destekli Yazıcı",
    zebraFisYazici => "Zebra Fiş Yazıcı",
  };

  static YaziciTipi fromString(String value) => YaziciTipi.values.firstWhere((element) => element.value == value);
}
