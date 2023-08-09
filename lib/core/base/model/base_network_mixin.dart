import 'dart:developer';

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
      log(other.toJson().toString());
      log(toJson().toString());
      bool result = other.toJson().toString() == toJson().toString();
      return result;
    } else {
      return false;
    }
  }
}
