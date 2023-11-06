import "package:freezed_annotation/freezed_annotation.dart";

part "cek_senet_listesi_request_model.freezed.dart";
part "cek_senet_listesi_request_model.g.dart";

@unfreezed
class CekSenetListesiRequestModel with _$CekSenetListesiRequestModel {
  @JsonSerializable(fieldRename: FieldRename.pascal)
  factory CekSenetListesiRequestModel({
    String? verenKodu,
    String? sirala,
    String? ekranTipi,
    String? yer,
    String? donemTipi,
    String? tarihTipi,
    String? tipi,
    String? verilenKodu,
    String? durum,
    String? searchText,
    String? baslangicTarihi,
    String? bitisTarihi,
  }) = _CekSenetListesiRequestModel;

  factory CekSenetListesiRequestModel.fromJson(Map<String, dynamic> json) => _$CekSenetListesiRequestModelFromJson(json);
}

extension CekSenetListesiRequestModelExtension on CekSenetListesiRequestModel {
  List<int>? get arrHesapTipi {
    List<int>? arrHesapTipi = [];
    
  }
}