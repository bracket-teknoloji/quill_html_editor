enum RouteManager { mainPage }

extension RouteManagerExtension on RouteManager {
  String get route {
    switch (this) {
      case RouteManager.mainPage:
        return '$this';
      default:
        return '/';
    }
  }
}