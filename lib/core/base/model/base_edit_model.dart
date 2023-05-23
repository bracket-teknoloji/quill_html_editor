import '../../constants/enum/base_edit_enum.dart';

class BaseEditModel<T> {
  T? model;
  BaseEditEnum? baseEditEnum;
  String? siradakiKod;

  BaseEditModel({this.model, this.baseEditEnum, this.siradakiKod});
}
