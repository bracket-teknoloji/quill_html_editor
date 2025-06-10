import "package:freezed_annotation/freezed_annotation.dart";
import "package:get/get.dart";

import "../../../../../../../core/base/model/base_network_mixin.dart";
import "../../../../../../../core/constants/enum/cek_senet_listesi_enum.dart";
import "../../cek_senet_listesi/model/cek_senet_listesi_model.dart";

part "save_cek_senet_model.freezed.dart";
part "save_cek_senet_model.g.dart";

@unfreezed
sealed class SaveCekSenetModel with _$SaveCekSenetModel, NetworkManagerMixin {
  factory SaveCekSenetModel({
    String? belgeTipi,
    String? cariAdi,
    String? cariKodu,
    String? guid,
    int? islemKodu,
    List<CekSenetKalemlerModel>? kalemler,
    @JsonKey(name: "PickerTahsilatTuru") String? pickerTahsilatTuru,
    String? plasiyerKodu,
    String? tag,
    DateTime? tarih,
    @JsonKey(name: "_YeniKayit") bool? yeniKayit,
    String? projeKodu,
    String? belgeNo,
    String? verilenKodu,
    String? aciklama,
    String? ceksenNo,
    String? gc,
    String? kasaKodu,
    @JsonKey(name: "PickerBelgeTuru") String? pickerBelgeTuru,
    String? refKod,
    bool? tahsilatmi,
    double? tutar,
  }) = _SaveCekSenetModel;
  SaveCekSenetModel._();

  factory SaveCekSenetModel.fromJson(Map<String, dynamic> json) => _$SaveCekSenetModelFromJson(json);

  factory SaveCekSenetModel.fromCekSenetListesiModel(CekSenetListesiModel model) => SaveCekSenetModel(
    cariKodu: model.cariKodu,
    plasiyerKodu: model.plasiyerKodu,
    tarih: model.tarih,
    yeniKayit: true,
    tag: "TahsilatModel",
    projeKodu: model.projeKodu,
    ceksenNo: model.belgeNo,
    pickerBelgeTuru: model.belgeTipi,
    tutar: model.tutar,
  );

  @override
  SaveCekSenetModel fromJson(Map<String, dynamic> json) => SaveCekSenetModel.fromJson(json);
}

@unfreezed
sealed class CekSenetKalemlerModel with _$CekSenetKalemlerModel {
  factory CekSenetKalemlerModel({
    String? cariRaporKodu,
    String? cekBanka,
    String? seriNo,
    String? cekSube,
    String? ciroTipi,
    String? gorsel1,
    String? gorsel2,
    String? hesapNo,
    String? ilce,
    String? plasiyerAdi,
    String? plasiyerKodu,
    String? raporKodu,
    String? sehir,
    int? sira,
    int? dovizTipi,
    String? tag,
    DateTime? tarih,
    double? tutar,
    DateTime? vadeTarihi,
    double? dovizKuru,
    double? dovizTutari,
    String? asilCari,
    String? refKod,
    String? refTanimi,
    String? aciklama1,
    String? aciklama2,
    String? aciklama3,
    String? projeAdi,
    String? projeKodu,
    String? verenKodu,
    String? ibanNo,
    String? duzenlendigiYer,
    @JsonKey(includeFromJson: false, includeToJson: false) String? dovizAdi,
    @JsonKey(includeFromJson: false, includeToJson: false) bool? refKodSorulsunMu,
  }) = _CekSenetKalemlerModel;

  factory CekSenetKalemlerModel.fromJson(Map<String, dynamic> json) => _$CekSenetKalemlerModelFromJson(json);
}

extension CekSenetExtensions on CekSenetKalemlerModel {
  bool get ciroMu => ciroTipi == "C";

  bool get dovizliMi => dovizTipi != null && dovizTipi != 0;
}

extension CekSenetExtensions2 on CekSenetListesiModel {
  CekSenetListesiEnum get cekSenetListesiEnum =>
      CekSenetListesiEnum.values.firstWhereOrNull((element) => element.belgeTipi == belgeTipi) ??
      CekSenetListesiEnum.cekBorc;
}

extension CekSenetExtensions3 on SaveCekSenetModel {
  CekSenetListesiEnum? get cekSenetListesiEnum =>
      CekSenetListesiEnum.values.firstWhereOrNull((element) => element.belgeTipi == pickerBelgeTuru);
}
