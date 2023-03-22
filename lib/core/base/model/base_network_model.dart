mixin NetworkManagerMixin<T> {
  static var stringFromJson = (dynamic value) => value.toString();

  Map<String, dynamic> toJson();

  T fromJson(Map<String, dynamic> json);
}
