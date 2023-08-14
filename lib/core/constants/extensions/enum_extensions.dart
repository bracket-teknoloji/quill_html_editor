import "../enum/base_edit_enum.dart";

extension GetCariEditType on BaseEditEnum {
  String get name => toString().split(".").last;
}
