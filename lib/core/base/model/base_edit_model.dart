import "../../constants/enum/base_edit_enum.dart";
import "../../constants/enum/edit_tipi_enum.dart";

final class BaseEditModel<T> {
  BaseEditModel({this.model, this.baseEditEnum, this.siradakiKod, this.editTipiEnum, this.belgeNo});
  T? model;
  BaseEditEnum? baseEditEnum;
  String? siradakiKod;
  EditTipiEnum? editTipiEnum;
  String? belgeNo;

  bool get enable =>
      baseEditEnum == BaseEditEnum.ekle ||
      baseEditEnum == BaseEditEnum.duzenle ||
      baseEditEnum == BaseEditEnum.kopyala ||
      baseEditEnum == BaseEditEnum.siparistenKopyala ||
      baseEditEnum == BaseEditEnum.revize ||
      baseEditEnum == BaseEditEnum.taslak;
  bool get isDuzenle => baseEditEnum == BaseEditEnum.duzenle;
  bool get isGoruntule => baseEditEnum.goruntuleMi;
  bool get isEkle => baseEditEnum == BaseEditEnum.ekle;
  bool get isKopyala => baseEditEnum == BaseEditEnum.kopyala || baseEditEnum == BaseEditEnum.siparistenKopyala;
  bool get isTaslak => baseEditEnum == BaseEditEnum.taslak;
  bool get isRevize => baseEditEnum == BaseEditEnum.revize;
  String? get getSubTitle => (isKopyala || isEkle || isRevize || isTaslak) ? "Yeni Belge" : null;

  @override
  // ignore: hash_and_equals
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BaseEditModel &&
          runtimeType == other.runtimeType &&
          model == other.model &&
          baseEditEnum == other.baseEditEnum &&
          siradakiKod == other.siradakiKod &&
          editTipiEnum == other.editTipiEnum &&
          belgeNo == other.belgeNo;
}
