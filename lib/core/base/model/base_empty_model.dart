import "base_network_mixin.dart";

final class BaseEmptyModel with NetworkManagerMixin {
  @override
  BaseEmptyModel? fromJson(Map<String, dynamic> json) => null;

  @override
  Map<String, dynamic> toJson() => {};
}
