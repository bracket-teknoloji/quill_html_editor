// how to make a getx route manager
class RouteManager {

  RouteManager._init();
  static RouteManager? _instance;
  static RouteManager get instance {
    _instance ??= RouteManager._init();
    return _instance!;
  }
}
