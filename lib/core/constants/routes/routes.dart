

// how to make a getx route manager
  
  import 'package:get/get_navigation/src/routes/get_route.dart';

class RouteManager {
  static RouteManager? _instance;
  static RouteManager get instance {
    _instance ??= RouteManager._init();
    return _instance!;}
  RouteManager._init();

  final List<GetPage> _routes = [];
  
  }