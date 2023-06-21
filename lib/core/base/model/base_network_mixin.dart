mixin NetworkManagerMixin on Object {
  Map<String, dynamic> toJson();
  fromJson(Map<String, dynamic> json);

  @override
  String toString() {
    return toJson().toString();
  }
}
