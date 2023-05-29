import 'package:picker/core/base/model/base_network_mixin.dart';

class BaseEmptyModel with NetworkManagerMixin {
  @override
  fromJson(Map<String, dynamic> json) {}

  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}
