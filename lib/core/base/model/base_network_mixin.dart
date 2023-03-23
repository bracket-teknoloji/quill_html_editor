mixin NetworkManagerMixin {
  static var stringFromJson = (dynamic value) => value.toString();
  Map<String, dynamic> toJson();
  fromJson(Map<String, dynamic> json);
}
