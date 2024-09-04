import "package:freezed_annotation/freezed_annotation.dart";
import "package:picker/core/base/model/base_network_mixin.dart";
import "package:picker/core/base/model/base_stok_mixin.dart";
import "package:picker/core/constants/extensions/number_extensions.dart";
import "package:picker/view/main_page/alt_sayfalar/siparis/base_siparis_edit/model/base_siparis_edit_model.dart";
import "package:picker/view/main_page/alt_sayfalar/stok/base_stok_edit/model/stok_detay_model.dart";

part "uretim_sonu_kaydi_recete_model.freezed.dart";
part "uretim_sonu_kaydi_recete_model.g.dart";

@unfreezed
class UskReceteModel with _$UskReceteModel, NetworkManagerMixin, BaseStokMixin {
  UskReceteModel._();
  factory UskReceteModel({
    String? mamulKodu,
    String? stokKodu,
    String? stokAdi,
    String? sonOperasyon,
    String? ob,
    double? miktar,
    String? cikistaSeri,
    String? seriMiktarKadar,
    String? seriBakiyeKontrol,
    String? seriCikistaOtomatik,
    String? seriGiristeOtomatik,
    String? sira,
    String? otorec,
    List<SeriList>? seriList,
    String? giristeSeri,
  }) = _UskReceteModel;

  factory UskReceteModel.fromJson(Map<String, dynamic> json) => _$UskReceteModelFromJson(json);

  factory UskReceteModel.fromKalemModel(KalemModel model) => UskReceteModel(
        stokKodu: model.stokKodu,
        stokAdi: model.stokAdi,
        seriList: model.seriList,
        miktar: model.miktar,
        sira: model.sira.toStringIfNotNull ?? "0",
        seriMiktarKadar: model.seriMiktarKadarSor == true ? "E" : "H",
      );

  @override
  UskReceteModel fromJson(Map<String, dynamic> json) => _$UskReceteModelFromJson(json);
}
