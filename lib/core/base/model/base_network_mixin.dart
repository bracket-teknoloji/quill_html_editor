mixin NetworkManagerMixin on Object {
  Map<String, dynamic> toJson();
  dynamic fromJson(Map<String, dynamic> json);

  @override
  String toString() => toJson().toString();

  @override
  bool operator ==(covariant NetworkManagerMixin other) {
    final bool result = other.toJson().toString() == toJson().toString();
    return result;
  }
}
