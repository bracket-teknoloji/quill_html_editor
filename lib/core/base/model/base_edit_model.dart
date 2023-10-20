import "../../constants/enum/base_edit_enum.dart";
import "../../constants/enum/siparis_tipi_enum.dart";

class BaseEditModel<T> {
  T? model;
  BaseEditEnum? baseEditEnum;
  String? siradakiKod;
  SiparisTipiEnum? siparisTipiEnum;

  bool get enable => baseEditEnum == BaseEditEnum.ekle || baseEditEnum == BaseEditEnum.duzenle || baseEditEnum == BaseEditEnum.kopyala;
  bool get isDuzenle => baseEditEnum == BaseEditEnum.duzenle;
  bool get isGoruntule => baseEditEnum == BaseEditEnum.goruntule;
  bool get isEkle => baseEditEnum == BaseEditEnum.ekle;
  bool get isKopyala => baseEditEnum == BaseEditEnum.kopyala;

  BaseEditModel({this.model, this.baseEditEnum, this.siradakiKod, this.siparisTipiEnum});

  @override
  // ignore: hash_and_equals
  operator ==(Object other) =>
      identical(this, other) || other is BaseEditModel && runtimeType == other.runtimeType && model == other.model && baseEditEnum == other.baseEditEnum && siradakiKod == other.siradakiKod;
}
