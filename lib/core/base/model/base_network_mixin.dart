mixin NetworkManagerMixin on Object {
  Map<String, dynamic> toJson();
  fromJson(Map<String, dynamic> json);

  @override
  String toString() {
    return toJson().toString();
  }

  @override
  operator ==(Object other) {
    if (other is NetworkManagerMixin) {
      return other.toJson().toString() == toJson().toString();
    } else {
      return false;
    }
  }
}
