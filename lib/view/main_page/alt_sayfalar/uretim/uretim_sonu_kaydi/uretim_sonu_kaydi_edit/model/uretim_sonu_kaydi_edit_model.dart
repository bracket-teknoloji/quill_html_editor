import "package:freezed_annotation/freezed_annotation.dart";
import "package:picker/core/base/model/base_network_mixin.dart";
import "package:picker/view/main_page/alt_sayfalar/siparis/base_siparis_edit/model/base_siparis_edit_model.dart";

part "uretim_sonu_kaydi_edit_model.freezed.dart";
part "uretim_sonu_kaydi_edit_model.g.dart";

@unfreezed
class UretimSonuKaydiEditModel with _$UretimSonuKaydiEditModel, NetworkManagerMixin {
  UretimSonuKaydiEditModel._();
  factory UretimSonuKaydiEditModel({
    String? belgeNo,
    DateTime? belgeTarihi,
    int? cikisDepo,
    String? depoOnceligi,
    @JsonKey(name:"EkAlanlar") EkAlanlar? ekAlanlar,
    int? girisDepo,
    String? guid,
    List<KalemModel>? kalemList,
    String? projeKodu,
    String? tarih,
    @JsonKey(name:"_YeniKayit") bool? yeniKayit,
  }) = _UretimSonuKaydiEditModel;

  factory UretimSonuKaydiEditModel.fromJson(Map<String, dynamic> json) => _$UretimSonuKaydiEditModelFromJson(json);

  @override
  UretimSonuKaydiEditModel fromJson(Map<String, dynamic> json) => _$UretimSonuKaydiEditModelFromJson(json);
}

@unfreezed
class EkAlanlar with _$EkAlanlar {
  EkAlanlar._();
  factory EkAlanlar({
    String? ktAlan1,
    String? ktAlan2,
    String? ktAlan3,
    String? ktAlan4,
  }) = _EkAlanlar;

  factory EkAlanlar.fromJson(Map<String, dynamic> json) => _$EkAlanlarFromJson(json);
}
