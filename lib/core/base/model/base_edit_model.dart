import "../../constants/enum/base_edit_enum.dart";

class BaseEditModel<T> {
  T? model;
  BaseEditEnum? baseEditEnum;
  String? siradakiKod;

  bool get enable => baseEditEnum == BaseEditEnum.ekle || baseEditEnum == BaseEditEnum.duzenle;

  BaseEditModel({this.model, this.baseEditEnum, this.siradakiKod});

  @override
  operator ==(Object other) =>
      identical(this, other) ||
      other is BaseEditModel &&
          runtimeType == other.runtimeType &&
          model == other.model &&
          baseEditEnum == other.baseEditEnum &&
          siradakiKod == other.siradakiKod;
}
