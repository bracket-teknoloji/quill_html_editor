import "package:freezed_annotation/freezed_annotation.dart";
import "package:picker/core/base/model/base_network_mixin.dart";
import "package:picker/view/main_page/alt_sayfalar/siparis/base_siparis_edit/model/base_siparis_edit_model.dart";
import "package:picker/view/main_page/alt_sayfalar/stok/stok_liste/model/stok_listesi_model.dart";

part "uretim_sonu_kaydi_edit_model.freezed.dart";
part "uretim_sonu_kaydi_edit_model.g.dart";

@unfreezed
class UretimSonuKaydiEditModel with _$UretimSonuKaydiEditModel, NetworkManagerMixin {
  UretimSonuKaydiEditModel._();
  factory UretimSonuKaydiEditModel({
    String? belgeNo,
    DateTime? belgeTarihi,
    int? cikisDepo,
    @JsonKey(includeFromJson: false, includeToJson: false) String? cikisDepoAdi,
    @JsonKey(includeFromJson: false, includeToJson: false) String? girisDepoAdi,
    @JsonKey(includeFromJson: false, includeToJson: false) String? projeAdi,
    @JsonKey(includeFromJson: false, includeToJson: false) StokListesiModel? stokModel,
    String? aciklama,
    String? depoOnceligi,
    @JsonKey(name: "EkAlanlar") EkAlanlar? ekAlanlar,
    int? girisDepo,
    String? guid,
    @JsonKey(name: "KalemList") List<KalemModel>? kalemList,
    String? projeKodu,
    String? tarih,
    @JsonKey(name: "_YeniKayit") bool? yeniKayit,
  }) = _UretimSonuKaydiEditModel;

  factory UretimSonuKaydiEditModel.fromJson(Map<String, dynamic> json) => _$UretimSonuKaydiEditModelFromJson(json);

  @override
  UretimSonuKaydiEditModel fromJson(Map<String, dynamic> json) => _$UretimSonuKaydiEditModelFromJson(json);

  bool get depolarSecildiMi => cikisDepo != null && girisDepo != null;
}

@unfreezed
class EkAlanlar with _$EkAlanlar {
  EkAlanlar._();
  factory EkAlanlar({
    String? ktAlan1,
    String? ktAlan3,
    String? ktAlan4,
  }) = _EkAlanlar;

  factory EkAlanlar.fromJson(Map<String, dynamic> json) => _$EkAlanlarFromJson(json);

  String? operator [](int index) {
    if (index == 0) {
      return ktAlan1;
    }
    if (index == 1) {
      return ktAlan3;
    }
    if (index == 2) {
      return ktAlan4;
    }
    throw Exception("Invalid Array Index: $index");
  }

  void operator []=(int index, String? value) {
    switch (index) {
      case 0:
        ktAlan1 = value;
      case 1:
        ktAlan3 = value;
      case 2:
        ktAlan4 = value;
      default:
        throw Exception("Invalid Array Index: $index");
    }
  }
}
