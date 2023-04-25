
class Singleton {
  static final Singleton _singleton = Singleton._internal();

  factory Singleton() {
    return _singleton;
  }

  Singleton._internal();

  static String? token;
  String? userName;
  String? password;

  @override
  String toString() {
    return 'Singleton{userName: $userName, password: $password, token: $token}';
  }
}

 void main(List<String> args) {
  Singleton.token = "ssdfas";
  print(Singleton.token);
  print(Singleton._internal().toString());
}