abstract mixin class NetworkManagerMixin extends Object {
  Map<String, dynamic> toJson();
  NetworkManagerMixin? fromJson(Map<String, dynamic> json);

  @override
  String toString() => toJson().toString();

  @override
  // ignore: hash_and_equals
  bool operator ==(covariant NetworkManagerMixin other) {
    final bool result = other.toJson().toString() == toJson().toString();
    return result;
  }
}
