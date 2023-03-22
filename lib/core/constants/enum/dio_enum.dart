// ignore: constant_identifier_names
enum HttpTypes { GET, POST, CONNECT }

extension HttpTypesExtension on HttpTypes {
  String get rawValue {
    switch (this) {
      case HttpTypes.GET:
        return "GET";
      case HttpTypes.POST:
        return "POST";
      case HttpTypes.CONNECT:
        return "CONNECT";

      default:
        throw "Error";
    }
  }
}
