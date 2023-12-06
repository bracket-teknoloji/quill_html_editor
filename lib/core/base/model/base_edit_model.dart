import "package:picker/core/constants/enum/edit_tipi_enum.dart";

import "../../constants/enum/base_edit_enum.dart";

class BaseEditModel<T> {
  T? model;
  BaseEditEnum? baseEditEnum;
  String? siradakiKod;
  EditTipiEnum? editTipiEnum;
  String? belgeNo;

  bool get enable => baseEditEnum == BaseEditEnum.ekle || baseEditEnum == BaseEditEnum.duzenle || baseEditEnum == BaseEditEnum.kopyala;
  bool get isDuzenle => baseEditEnum == BaseEditEnum.duzenle;
  bool get isGoruntule => baseEditEnum == BaseEditEnum.goruntule;
  bool get isEkle => baseEditEnum == BaseEditEnum.ekle;
  bool get isKopyala => baseEditEnum == BaseEditEnum.kopyala;

  BaseEditModel({
    this.model,
    this.baseEditEnum,
    this.siradakiKod,
    this.editTipiEnum,
    this.belgeNo,
  });

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
