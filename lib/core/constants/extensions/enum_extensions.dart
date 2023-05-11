import '../enum/cari_edit_enum.dart';

extension GetCariEditType on CariEditEnum {
  String get name => this.toString().split('.').last;
}
